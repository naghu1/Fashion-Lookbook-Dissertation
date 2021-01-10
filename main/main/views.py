"""
Routes and views for the flask application.
"""

from datetime import datetime
from flask import *
from flask import Flask, render_template, request  
from werkzeug import secure_filename
from main import app
import pymysql
import os
import uuid

app.secret_key = 'random string'
APP_ROOT = app.instance_path
UPLOAD_FOLDER = 'main/static/uploads'
ALLOWED_EXTENSIONS = set(['jpeg', 'jpg', 'png', 'gif'])
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
db = pymysql.connect("localhost", "root", "", "py") 

def allowed_file(filename):
    return '.' in filename and \
            filename.rsplit('.', 1)[1] in ALLOWED_EXTENSIONS
def my_random_string(string_length=10):
    """Returns a random string of length string_length."""
    random = str(uuid.uuid4()) # Convert UUID format to a Python string.
    random = random.upper() # Make all characters uppercase.
    random = random.replace("-","") # Remove the UUID '-'.
    return random[0:string_length] # Return the random string.

@app.route('/')
@app.route('/home')
def home():
    """Renders the home page."""
    if 'type' in  session:
        type= session.get('type')
        if type=='customer':
            return render_template(
                'index.html',
                title=app.config['UPLOAD_FOLDER'],
                year=datetime.now().year,
            )
        else:
            cursor = db.cursor()
            sql = 'SELECT *  FROM `cart_main` WHERE `rating` =3'
            rating = cursor.execute(sql)
            sql = 'SELECT * FROM `cart_main` WHERE `rating` <3'
            minusrating = cursor.execute(sql)
            sql = 'SELECT * FROM `cart_main` WHERE `rating` >3'
            plusrating = cursor.execute(sql)
            ratingdata = "[";
            ratingdata =ratingdata +'["Negative",'+str(minusrating)+"],"
            ratingdata =ratingdata +'["Neutral",'+str(rating)+"],"
            ratingdata =ratingdata +'["Positive",'+str(plusrating)+"],"
            ratingdata = ratingdata.rstrip(',')+"]"
            return render_template(
                'adminindex.html',
                ratingdata=ratingdata,
                title=app.config['UPLOAD_FOLDER'],
                year=datetime.now().year,
            )
    else:
        return render_template(
                'index.html',
                title=app.config['UPLOAD_FOLDER'],
                year=datetime.now().year,
            )

@app.route('/logout')
def logout():
    """Renders the contact page."""
    session.clear()
    if 'type' in  session:
        type= session.get('type')
        if type=='customer':
            return render_template(
                'index.html',
                title=app.config['UPLOAD_FOLDER'],
                year=datetime.now().year,
            )
        else:
            return render_template(
                'dashboard.html',
                title=app.config['UPLOAD_FOLDER'],
                year=datetime.now().year,
            )
    else:
        return render_template(
                'index.html',
                title=app.config['UPLOAD_FOLDER'],
                year=datetime.now().year,
            )
@app.route('/contact')
def contact():
    """Renders the contact page."""
    return render_template(
        'contact.html',
        title='Contact',
        year=datetime.now().year,
        message='Your contact page.'
    )

@app.route('/mysql')
def mysql():
    """Renders the contact page.""" 
    cursor = db.cursor()
    sql = "insert into test (test)values (5)"
    cursor.execute(sql)
    sql = "SELECT * FROM test"
    cursor.execute(sql)
    results = cursor.fetchall()
    return render_template(
        'about.html',
        title=str(results),
        results=results,
        year=datetime.now().year,
        message='Your application description page.'
    )

@app.route('/about')
def about():
    """Renders the about page."""
    return render_template(
        'about.html',
        title='About',
        year=datetime.now().year,
        message='Your application description page.'
    )
@app.route('/register')
def register():
    """Renders the about page."""
    return render_template(
        'register.html',
        title='Register',
        year=datetime.now().year,
        message='Your application description page.'
    )

@app.route('/sizechart')
def sizechart():
    if 'type' in  session:
        type= session.get('type')
        if type=='customer':
            return render_template(
                'sizechart.html',
                layout='layout.html',
                title=app.config['UPLOAD_FOLDER'],
                year=datetime.now().year,
            )
        else:
            return render_template(
                'sizechart.html',
                layout='admin.html',
                title=app.config['UPLOAD_FOLDER'],
                year=datetime.now().year,
            )
    else:
        return render_template(
                'sizechart.html',
                layout='layout.html',
                title=app.config['UPLOAD_FOLDER'],
                year=datetime.now().year,
            )



@app.route('/buyproduct')
def buyproduct():
    """Renders the about page."""
    if 'user_id' in session:
        return render_template(
            'buyproduct.html',
            title='Buy Product',
            year=datetime.now().year,
            message='Your application description page.'
        )
    else :
        return render_template(
            'register.html',
            title='Register',
            year=datetime.now().year,
            message='Your application description page.'
        )


@app.route('/postbuyproduct' , methods=["POST"])
def postbuyproduct(): 
     name = None 
     if request.method == 'POST' :
        user_id = session.get('user_id')
        gender = request.form['gender']
        total_rate=  request.form['total_rate']
        if total_rate == '':
            total_rate= 0.00
        size = request.form['size']
        category = request.form['category']
        season = request.form['season']
        body_type = request.form['body_type']
        events = request.form['events']
        skin_color = request.form['skin_color']
        budget = request.form['budget']
        cursor = db.cursor()
        sql = "insert into cart_main (customer_id,gender_id,size_id,category_id,season_id,body_type_id,event_id,skin_id,budget_id,total)values ('"+str(user_id)+"','"+str(gender)+"','"+str(size)+"','"+str(category)+"','"+str(season)+"','"+str(body_type)+"','"+str(events)+"','"+str(skin_color)+"','"+str(budget)+"','"+str(total_rate)+"')"
        cursor.execute(sql)
        insert_id = cursor.lastrowid
        cart_items = request.form.getlist('cart_items')
        for row in cart_items:
            id =int(row)
            item_price = request.form['item_price'+str(id)]
            qry = "insert into cart_items (cart_id,item_id,price) values ('"+str(insert_id)+"','"+str(id)+"','"+str(item_price)+"')"
            cursor.execute(qry)
            if gender !='':
                qry = 'select * from learning_items where item_id ='+str(id)+' and tag_type="gender" and tag_id='+str(gender)+' '
                rows_count = cursor.execute(qry)
                if rows_count > 0:
                    qry = 'update learning_items set priority = priority +1 where item_id ='+str(id)+' and tag_type="gender" and tag_id='+str(gender)+''
                else:
                    qry = 'insert into learning_items(tag_type,learning_data,tag_id,priority,item_id) values("gender","gender'+str(gender)+'","'+str(gender)+'",1,'+str(id)+')'
                cursor.execute(qry)

            if size !='':
                qry = 'select * from learning_items where item_id ='+str(id)+' and tag_type="size" and tag_id='+str(size)+' '
                rows_count = cursor.execute(qry)
                if rows_count > 0:
                    qry = 'update learning_items set priority = priority +1 where item_id ='+str(id)+' and tag_type="size" and tag_id='+str(size)+''
                else:
                    qry = 'insert into learning_items(tag_type,learning_data,tag_id,priority,item_id) values("size","size'+str(size)+'","'+str(size)+'",1,'+str(id)+')'
                cursor.execute(qry)

            if season !='':
                qry = 'select * from learning_items where item_id ='+str(id)+' and tag_type="season" and tag_id='+str(season)+' '
                rows_count = cursor.execute(qry)
                if rows_count > 0:
                    qry = 'update learning_items set priority = priority +2 where item_id ='+str(id)+' and tag_type="season" and tag_id='+str(season)+''
                else:
                    qry = 'insert into learning_items(tag_type,learning_data,tag_id,priority,item_id) values("season","season'+str(season)+'","'+str(season)+'",2,'+str(id)+')'
                cursor.execute(qry)	
            if body_type !='':
                qry = 'select * from learning_items where item_id ='+str(id)+' and tag_type="body_type" and tag_id='+str(body_type)+' '
                rows_count = cursor.execute(qry)
                if rows_count > 0:
                    qry = 'update learning_items set priority = priority +1 where item_id ='+str(id)+' and tag_type="body_type" and tag_id='+str(body_type)+''
                else:
                    qry = 'insert into learning_items(tag_type,learning_data,tag_id,priority,item_id) values("body_type","body_type'+str(body_type)+'","'+str(body_type)+'",1,'+str(id)+')'
                cursor.execute(qry)	
            if events !='':
                qry = 'select * from learning_items where item_id ='+str(id)+' and tag_type="events" and tag_id='+str(events)+' '
                rows_count = cursor.execute(qry)
                if rows_count > 0:
                    qry = 'update learning_items set priority = priority +2 where item_id ='+str(id)+' and tag_type="events" and tag_id='+str(events)+''
                else:
                    qry = 'insert into learning_items(tag_type,learning_data,tag_id,priority,item_id) values("events","events'+str(events)+'","'+str(events)+'",2,'+str(id)+')'
                cursor.execute(qry)	
            if skin_color !='':
                qry = 'select * from learning_items where item_id ='+str(id)+' and tag_type="skin_color" and tag_id='+str(skin_color)+' '
                rows_count = cursor.execute(qry)
                if rows_count > 0:
                    qry = 'update learning_items set priority = priority +1 where item_id ='+str(id)+' and tag_type="skin_color" and tag_id='+str(skin_color)+''
                else:
                    qry = 'insert into learning_items(tag_type,learning_data,tag_id,priority,item_id) values("skin_color","skin_color'+str(skin_color)+'","'+str(skin_color)+'",1,'+str(id)+')'
                cursor.execute(qry)	
            if budget !='':
                qry = 'select * from learning_items where item_id ='+str(id)+' and tag_type="budget_range" and tag_id='+str(budget)+' '
                rows_count = cursor.execute(qry)
                if rows_count > 0:
                    qry = 'update learning_items set priority = priority +1 where item_id ='+str(id)+' and tag_type="budget_range" and tag_id='+str(budget)+''
                else:
                    qry = 'insert into learning_items(tag_type,learning_data,tag_id,priority,item_id) values("budget_range","budget_range'+str(budget)+'","'+str(budget)+'",1,'+str(id)+')'
                cursor.execute(qry)	
        db.commit()
        return render_template('ratesales.html', id=insert_id)


@app.route('/addproduct')
def addproduct():
    """Renders the about page."""
    return render_template(
        'addproduct.html',
        title='Add Product',
        year=datetime.now().year,
        message='Your application description page.'
    )
@app.route('/postproduct' , methods=["POST"])
def postproduct(): 
     name = None 
     if request.method == 'POST' :
        imagename =''
        image = request.files['image_file']
        if image and allowed_file(image.filename):
            filename = my_random_string(6)+secure_filename(image.filename)
            image.save(os.path.join(os.path.dirname(app.instance_path),app.config['UPLOAD_FOLDER'], filename))
        imagename = filename
        item_name = request.form['name']
        color = request.form['color']
        size=''
        size_list = request.form.getlist('size')
        for row in size_list:
            id =int(row)
            if size =='':
                size = str(size)+str(id)
            else:
                size = str(size)+','+str(id)
        category= request.form['category']
        body_type = ''
        gender = request.form['gender']
        events = ''
        events_list =request.form.getlist('events')
        for row in events_list:
            id =int(row)
            if events =='':
                events = str(events)+str(id)
            else:
                events = str(events)+','+str(id)
        season = ''
        season_list = request.form.getlist('season')
        for row in season_list:
            id =int(row)
            if season =='':
                season = str(season)+str(id)
            else:
                season = str(season)+','+str(id)
        skin_color = ''
        rate = request.form['rate']
        decription = request.form['decription']
        cursor = db.cursor()
        print(events)
        sql = "insert into item (imagename,name,price,size_tag,gender_tag,event_tag,season_tag,color_tag,body_type_tag,description,category)values ('"+	imagename+"','"+item_name+"','"+rate+"','"+size+"','"+gender+"','"+events+"','"+season+"','"+skin_color+"','"+body_type+"','"+decription+"','"+category+"')"
        print(sql)       
        cursor.execute(sql)
        db.commit()
        return render_template(
        'list_items.html',
        title='Products',
        year=datetime.now().year,
        message='Your application description page.'
       )

@app.route('/list_items')
def list_items():
    """Renders the about page."""
    return render_template(
        'list_items.html',
        title='Products',
        year=datetime.now().year,
        message='Your application description page.'
    )

@app.route('/list_category')
def list_category():
    """Renders the about page."""
    return render_template(
        'list_category.html',
        title='List category',
        year=datetime.now().year,
        message='Your application description page.'
    )

@app.route('/get_items', methods=["POST"])
def get_items():
    """Renders the about page."""
    cursor = db.cursor()
    sql = "select item_id,name,price,b.category as category,c.gender from item as a inner join category as b on a.category=b.id inner join gender as c on c.gender_id=a.gender_tag"
    cursor.execute(sql)
    results = cursor.fetchall()
    db.commit()
    items =[]
    for row in results :
        items.append({'id': str(row[0]),'name':str(row[1]),'price':str(row[2]),'category':str(row[3]),'gender':str(row[4])})
    return json.dumps(items)


@app.route('/get_category', methods=["POST"])
def get_category():
    """Renders the about page."""
    cursor = db.cursor()
    sql = "select * from category"
    cursor.execute(sql)
    results = cursor.fetchall()
    db.commit()
    items =[]
    for row in results :
        items.append({'id': str(row[0]),'name':str(row[1])})
    return json.dumps(items)

@app.route('/list_events')
def list_events():
    """Renders the about page."""
    return render_template(
        'list_events.html',
        title='List Events',
        year=datetime.now().year,
        message='Your application description page.'
    )
@app.route('/get_events', methods=["POST"])
def get_events():
    """Renders the about page."""
    cursor = db.cursor()
    sql = "select * from events"
    cursor.execute(sql)
    results = cursor.fetchall()
    db.commit()
    items =[]
    for row in results :
        items.append({'id': str(row[0]),'name':str(row[1])})
    return json.dumps(items)

@app.route('/list_body_type')
def list_body_type():
    """Renders the about page."""
    return render_template(
        'list_body_type.html',
        title='Body Types',
        year=datetime.now().year,
        message='Your application description page.'
    )	
@app.route('/get_body_type', methods=["POST"])
def get_body_type():
    """Renders the about page."""
    cursor = db.cursor()
    sql = "select * from body_type"
    cursor.execute(sql)
    results = cursor.fetchall()
    db.commit()
    items =[]
    for row in results :
        items.append({'id': str(row[0]),'name':str(row[2])})
    return json.dumps(items)

@app.route('/list_size')
def list_size():
    """Renders the about page."""
    return render_template(
        'list_size.html',
        title='Size',
        year=datetime.now().year,
        message='Your application description page.'
    )	
@app.route('/get_size', methods=["POST"])
def get_size():
    """Renders the about page."""
    cursor = db.cursor()
    sql = "select * from size"
    cursor.execute(sql)
    results = cursor.fetchall()
    db.commit()
    items =[]
    for row in results :
        items.append({'id': str(row[0]),'name':str(row[1])})
    return json.dumps(items)
@app.route('/list_skin_color')

def list_skin_color():
    """Renders the about page."""
    return render_template(
        'list_skin_color.html',
        title='Skin Color',
        year=datetime.now().year,
        message='Your application description page.'
    )
@app.route('/get_skin_color', methods=["POST"])
def get_skin_color():
    """Renders the about page."""
    cursor = db.cursor()
    sql = "select * from skin_color"
    cursor.execute(sql)
    results = cursor.fetchall()
    db.commit()
    items =[]
    for row in results :
        items.append({'id': str(row[0]),'name':str(row[1])})
    return json.dumps(items)

@app.route('/list_season')
def list_season():
    """Renders the about page."""
    return render_template(
        'list_season.html',
        title='Season',
        year=datetime.now().year,
        message='Your application description page.'
    )

@app.route('/get_season', methods=["POST"])
def get_season():
    """Renders the about page."""
    cursor = db.cursor()
    sql = "select * from season"
    cursor.execute(sql)
    results = cursor.fetchall()
    db.commit()
    items =[]
    for row in results :
        items.append({'id': str(row[0]),'name':str(row[1])})
    return json.dumps(items)

@app.route('/list_budget_range')
def list_budget_range():
    """Renders the about page."""
    return render_template(
        'list_budget_range.html',
        title='Season',
        year=datetime.now().year,
        message='Your application description page.'
    )

@app.route('/get_budget_range', methods=["POST"])
def get_budget_range():
    """Renders the about page."""
    cursor = db.cursor()
    sql = "select * from budget_range"
    cursor.execute(sql)
    results = cursor.fetchall()
    db.commit()
    items =[]
    for row in results :
        items.append({'id': str(row[0]),'minimum_amount':str(row[1]),'maximum_amount':str(row[2])})
    return json.dumps(items)
@app.route('/addcountry')
def addcountry():
    """Renders the about page."""
    return render_template(
        'addcountry.html',
        title='Add Country',
        year=datetime.now().year,
        message='Your application description page.'
    )
@app.route('/postcountry' , methods=["POST"])
def postcountry(): 
     name = None 
     if request.method == 'POST' :
        country = request.form['country']
        country_code = request.form['country_code']
        cursor = db.cursor()
        sql = "insert into country (country,country_code)values ('"+country+"','"+country_code+"')"
        cursor.execute(sql)
        db.commit()
        return render_template('finish.html', name='Saves')

@app.route('/addcolor')
def addcolor():
    """Renders the about page."""
    return render_template(
        'addcolor.html',
        title='Add Color',
        year=datetime.now().year,
        message='Your application description page.'
    )

@app.route('/addbudget')
def addbudget():
    """Renders the about page."""
    return render_template(
        'addbudget.html',
        title='Add Budget',
        year=datetime.now().year,
        message='Your application description page.'
    )
@app.route('/postbudget' , methods=["POST"])
def postbudget(): 
     name = None 
     if request.method == 'POST' :
        minimum_amount = request.form['minimum_amount']
        maximum_amount = request.form['maximum_amount']
        cursor = db.cursor()
        sql = "insert into budget_range (maximum_amount,minimum_amount)values ("+maximum_amount+","+minimum_amount+")"
        cursor.execute(sql)
        db.commit()
        return render_template(
            'list_budget_range.html',
            title='Season',
            year=datetime.now().year,
            message='Your application description page.'
        )


@app.route('/postcolor' , methods=["POST"])
def postcolor(): 
     name = None 
     if request.method == 'POST' :
        color_code = request.form['color_code']
        cursor = db.cursor()
        sql = "insert into skin_color (color)values ('"+color_code+"')"
        cursor.execute(sql)
        db.commit()
        return render_template(
            'list_skin_color.html',
            title='Skin Color',
            year=datetime.now().year,
            message='Your application description page.'
        )
@app.route('/addseason')
def addseason():
    """Renders the about page."""
    return render_template(
        'addseason.html',
        title='Add Season',
        year=datetime.now().year,
        message='Your application description page.'
    )
@app.route('/postseason' , methods=["POST"])
def postseason(): 
     name = None 
     if request.method == 'POST' :
        season = request.form['season']
        cursor = db.cursor()
        sql = "insert into season (season)values ('"+season+"')"
        cursor.execute(sql)
        db.commit()
        return render_template(
            'list_season.html',
            title='Season',
            year=datetime.now().year,
            message='Your application description page.'
        )

@app.route('/addevents')
def addevents():
    """Renders the about page."""
    return render_template(
        'addevents.html',
        title='Add Events',
        year=datetime.now().year,
        message='Your application description page.'
    )
@app.route('/postevents' , methods=["POST"])
def postevents(): 
     name = None 
     if request.method == 'POST' :
        event = request.form['myevent']
        cursor = db.cursor()
        sql = "insert into events (event)values ('"+event+"')"
        cursor.execute(sql)
        db.commit()
        return render_template(
            'list_events.html',
            title='List Events',
            year=datetime.now().year,
            message='Your application description page.'
        )
@app.route('/addsize')
def addsize():
    """Renders the about page."""
    return render_template(
        'size.html',
        title='Add Size',
        year=datetime.now().year,
        message='Your application description page.'
    )
@app.route('/postsize' , methods=["POST"])
def postsize(): 
     name = None 
     if request.method == 'POST' :
        size = request.form['size']
        cursor = db.cursor()
        sql = "insert into size (size)values ('"+size+"')"
        cursor.execute(sql)
        db.commit()
        return render_template(
            'list_size.html',
            title='Size',
            year=datetime.now().year,
            message='Your application description page.'
        )

@app.route('/postrate' , methods=["POST"])
def postrate(): 
     name = None 
     if request.method == 'POST' :
        rating = request.form['rating']
        if rating=='':
            rating=0
        sales_id = request.form['sales_id']
        cursor = db.cursor()
        sql = "update cart_main set rating='"+str(rating)+"' where cart_id="+str(sales_id)+" "
        cursor.execute(sql)
        db.commit()
        return render_template(
            'buyproduct.html',
            title='Buy Product',
            year=datetime.now().year,
            message='Your application description page.'
        )



@app.route('/addcategory')
def addcategory():
    """Renders the about page."""
    return render_template(
        'addcategory.html',
        title='Add Events',
        year=datetime.now().year,
        message='Your application description page.'
    )
@app.route('/postcategory' , methods=["POST"])
def postcategory(): 
     name = None 
     if request.method == 'POST' :
        category = request.form['category']
        gender  = request.form['gender']
        list_order = request.form['list_order']
        cursor = db.cursor()
        sql = "insert into category (category,gender,list_order)values ('"+category+"','"+gender+"','"+list_order+"')"
        cursor.execute(sql)
        db.commit()
        return render_template(
            'list_category.html',
            title='List category',
            year=datetime.now().year,
            message='Your application description page.'
         )

@app.route('/addbodytype')
def addbodytype():
    """Renders the about page."""
    return render_template(
        'addbodytype.html',
        title='Add Body Type',
        year=datetime.now().year,
        message='Your application description page.'
    )
@app.route('/postbodytype' , methods=["POST"])
def postbodytype(): 
     name = None 
     if request.method == 'POST' :
        body_type = request.form['body_type']
        cursor = db.cursor()
        sql = "insert into body_type (body_type)values ('"+body_type+"')"
        cursor.execute(sql)
        db.commit()
        return render_template(
            'list_body_type.html',
            title='Body Types',
            year=datetime.now().year,
            message='Your application description page.'
        )

@app.route('/registeredusers')
def registeredusers():
    """Renders the about page."""
    return render_template(
        'register.html',
        title='Register',
        year=datetime.now().year,
        message='Your application description page.'
    )
@app.route('/test')
def test():
    """Renders the about page."""
    return render_template(
        'test.html',
        title='test one',
        year=datetime.now().year,
        message='Your application description page.'
    )

@app.route('/posttest' , methods=["POST"])
def posttest(): 
     name = None 
     if request.method == 'POST' and 'name' in request.form:
        name = request.form['name']
        return render_template('finish.html', name=name)

@app.route('/getsize')
def getsize():
    db = pymysql.connect("localhost", "root", "", "py") 
    cursor = db.cursor()
    sql= " select  * from size;"
    cursor.execute(sql)
    results = cursor.fetchall()
    option = ''
    for row in results:
        option  = option +  '<option value='+str(row[0])+'>'+ row[1 ]+' </option>'
    return option;

@app.route('/getallcategories', methods=["POST"])
def getallcategories():
    import json
    db = pymysql.connect("localhost", "root", "", "py") 
    gender = request.form['gender']
    cursor = db.cursor()
    sql= "SELECT * from category where  gender in(0,'"+str(gender)+"') order by list_order asc"
    cursor.execute(sql)
    items=[]
    results = cursor.fetchall()
    for row in results :
        items.append({'category_id': str(row[0]),'category':str(row[1])})
    return json.dumps(items)

@app.route('/getprediction', methods=["POST"])
def getprediction():
    import json
    db = pymysql.connect("localhost", "root", "", "py") 
    cursor = db.cursor()
    priority_text = ''
    gender = request.form['gender']
    searchtext = ' where i.gender_tag ='+str(gender)+' '
    priority_text = priority_text+ '"gender'+str(gender)+'"'
    size =  request.form['size']
    if size !='':
        searchtext = searchtext + ' and FIND_IN_SET("'+str(size)+'",i.size_tag) '
        priority_text = priority_text+ ',"size'+str(size)+'"'
        size =int(size)
    category =  request.form['category']
    if category !='':
        searchtext = searchtext + ' and FIND_IN_SET("'+str(category)+'",i.category) '
        priority_text = priority_text+ ',"category'+str(category)+'"'
        category = int (category)
    season = request.form['season']
    if season!='':
        searchtext = searchtext + ' and FIND_IN_SET("'+str(season)+'",i.season_tag) '
        priority_text = priority_text+ ',"season'+str(season)+'"'
        season = int(season)
    body_type =  request.form['body_type']
    if body_type !='':
        searchtext = searchtext + ' and FIND_IN_SET("'+str(body_type)+'",i.body_type_tag) '
        priority_text = priority_text+ ',"body_type'+str(body_type)+'"'
        body_type =int(body_type)
    events =  request.form['events']
    if events!='':
        searchtext = searchtext + ' and FIND_IN_SET("'+str(events)+'",i.event_tag) ' 
        priority_text = priority_text+ ',"events'+str(events)+'"'
        events = int(events)
    skin_color = request.form['skin_color']
    if skin_color!='':
        searchtext = searchtext + ' and FIND_IN_SET("'+str(skin_color)+'",i.color_tag) '
        priority_text = priority_text+ ',"skin_color'+str(skin_color)+'"'
        skin_color = int(skin_color)
    budget =  request.form['budget']
    if budget!='':
        priority_text = priority_text+ ',"budget_range'+str(budget)+'"'
    sql= 'SELECT i.item_id as item,i.name as item_name,i.price as item_price,i.description as item_description,ca.id as category,ca.category as category_name,IFNULL(priority,0) as priority,i.imagename FROM item as i inner join category as ca on ca.id in (i.category) left join (SELECT item_id,sum(priority) as priority FROM `learning_items` as learn where learning_data in('+priority_text+') GROUP by item_id) as b on i.item_id=b.item_id '+searchtext+' ORDER BY `priority`  DESC'
    skin_color = request.form['skin_color']
    cursor.execute(sql)
    items=[]
    results = cursor.fetchall()
    for row in results :
        items.append({'id': str(row[0]),'name':str(row[1]),'price':str(row[2]),'description':str(row[3]),'category':str(row[4]),'category_name':str(row[5]),'image':str(row[7])})
    return json.dumps(items)


@app.route('/getbudetrange')
def getbudetrange():
    db = pymysql.connect("localhost", "root", "", "py") 
    cursor = db.cursor()
    sql= " select  * from budget_range;"
    cursor.execute(sql)
    results = cursor.fetchall()
    option = ''        
    for row in results:
        option  = option +  '<option maximum='+str(row[2])+' minimum='+str(row[1])+' value='+str(row[0])+'>'+ str(row[1])+'-'+ str(row[2])+' </option>'
    return option;


@app.route('/getcategory')
def getcategory():
    db = pymysql.connect("localhost", "root", "", "py") 
    cursor = db.cursor()
    sql= " select  id,category from category;"
    cursor.execute(sql)
    results = cursor.fetchall()
    option = ''        
    for row in results:
        option  = option +  '<option value='+str(row[0])+'>'+ row[1 ]+' </option>'
    return option;

@app.route('/getbody_type')
def getbody_type():
    db = pymysql.connect("localhost", "root", "", "py") 
    cursor = db.cursor()
    sql= "select body_type_id,body_type from body_type;"
    cursor.execute(sql)
    results = cursor.fetchall()
    option = ''    
    for row in results:
        option  = option +  '<option value='+str(row[0])+'>'+str(row[1])+' </option>'
    return option;

@app.route('/getgender')
def getgender():
    db = pymysql.connect("localhost", "root", "", "py") 
    cursor = db.cursor()
    sql= "select * from gender;"
    cursor.execute(sql)
    results = cursor.fetchall()
    option = '<option value="">Select</option>'    
    for row in results:
        option  = option +  '<option value="'+str(row[0])+'">'+str(row[1])+' </option>'
    return option;

@app.route('/getseason')
def getseason():
    db = pymysql.connect("localhost", "root", "", "py") 
    cursor = db.cursor()
    sql= "select * from season;"
    cursor.execute(sql)
    results = cursor.fetchall()
    option = ''    
    for row in results:
        option  = option +  '<option value="'+str(row[0])+'">'+str(row[1])+' </option>'
    return option;

@app.route('/get_rating')
def get_rating():
    db = pymysql.connect("localhost", "root", "", "py") 
    cursor = db.cursor()
    sql= " SELECT  IFNULL(AVG(`rating`),0) as rating FROM `cart_main` WHERE rating>0;"
    cursor.execute(sql)
    results = cursor.fetchall()
    for row in results:
        rating = str(row[0])
    return rating;

@app.route('/getevents')
def getevents():
    db = pymysql.connect("localhost", "root", "", "py") 
    cursor = db.cursor()
    sql= " select * from events;"
    cursor.execute(sql)
    results = cursor.fetchall()
    option = ''        
    for row in results:
        option  = option +  '<option value="'+str(row[0])+'">'+row[1]+' </option>'
    return option;

@app.route('/getskin_color')
def getskin_color():
    db = pymysql.connect("localhost", "root", "", "py") 
    cursor = db.cursor()
    sql= " select * from skin_color;"
    cursor.execute(sql)
    results = cursor.fetchall()
    option = ''
    for row in results:
        option  = option +  '<option value="'+str(row[0])+'">'+row[1]+' </option>'
    return option;

@app.route('/postregister' , methods=["POST"])
def postregister(): 
     name = None 
     if request.method == 'POST' :
        name = request.form['name']
        email = request.form['email']
        phone = request.form['phone']
        address = request.form['address']
        address_2 = request.form['address_2']
        password = request.form['password']
        cursor = db.cursor()
        sql = "insert into customer (name,email,password,address,mobile,addressline)values ('"+name+"','"+email+"','"+password+"','"+address+"','"+phone+"','"+address_2+"')"
        cursor.execute(sql)
        insert_id = cursor.lastrowid
        db.commit()
        cursor = db.cursor()
        phone = request.form['phone']
        address = request.form['address']
        type ='customer'
        sql = "insert into user (type,user_name,password,ref_id)values ('customer','"+email+"','"+password+"','"+str(insert_id)+"')"
        phone = request.form['phone']
        address = request.form['address']
        cursor.execute(sql)
        db.commit()
        msg="reg"
        return render_template(
                'register.html',
                title='Register',
                msg=msg,
                year=datetime.now().year,
                message='Your application description page.'
              )

    
@app.route('/postlogin' , methods=["POST"])
def postlogin(): 
     name = None 
     if request.method == 'POST' :
        name = request.form['name']
        password = request.form['password']
        cursor = db.cursor()
        sql = 'SELECT *  FROM `cart_main` WHERE `rating` =3'
        rating = cursor.execute(sql)
        sql = 'SELECT * FROM `cart_main` WHERE `rating` <3'
        minusrating = cursor.execute(sql)
        sql = 'SELECT * FROM `cart_main` WHERE `rating` >3'
        plusrating = cursor.execute(sql)
        sql = "select id,type,user_name from user where user_name='"+str(name)+"' and password ='"+str(password)+"' limit 0,1"
        rows_count = cursor.execute(sql)
        if rows_count > 0:
            results = cursor.fetchall()
            for row in results :
                session['username'] = row[2]
                session['type'] = row[1]
                session['user_id'] = row[0]
                if 'username' in session:
                    User=session.get('username')
        else:
            error = "Invalid credentials. Try Again."
            return render_template(
                'register.html',
                error= error,
                title='Register',
                year=datetime.now().year,
                message='Your application description page.'
            )
        db.commit()
        if 'type' in  session:
            type= session.get('type')
            if type=='customer':
                return render_template(
                    'buyproduct.html',
                    title='Buy Product',
                    year=datetime.now().year,
                    message='Your application description page.'
                )
            else: 
                ratingdata = "[";
                ratingdata =ratingdata +'["Negative",'+str(minusrating)+"],"
                ratingdata =ratingdata +'["Neutral",'+str(rating)+"],"
                ratingdata =ratingdata +'["Positive",'+str(plusrating)+"],"
                ratingdata = ratingdata.rstrip(',')+"]"
                return render_template(
                    'adminindex.html',
                    ratings = rating,
                    ratingdata=ratingdata,
                    minusratings = minusrating,
                    plusratings = plusrating,
                    title='List Product',
                    year=datetime.now().year,
                    message='Your application description page.'
                )    

@app.route('/login/', methods=["GET","POST"])
def login_page():

    error = ''
    try: 
        if request.method == "POST": 
            attempted_username = request.form['username']
            attempted_password = request.form['password']

            #flash(attempted_username)
            #flash(attempted_password)

            if attempted_username == "admin" and attempted_password == "password":
                return redirect(url_for('dashboard')) 
            else:
                error = "Invalid credentials. Try Again."

        return render_template("login.html", error = error)

    except Exception as e:
        #flash(e)
        return render_template("login.html", error = error)   