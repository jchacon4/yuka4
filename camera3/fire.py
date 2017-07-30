import pyrebase
import sys
import datetime
import time
import json
import delData



config = {
  "apiKey": "AIzaSyCC7DG-nDG7Qc3YzgUriicduohjQFd1qGE",
  "authDomain": "yukachan-ed770.firebaseapp.com",
  "databaseURL": "https://yukachan-ed770.firebaseio.com/floors/-KpFmeKGYKti1espnifp",
  "storageBucket": "yukachan-ed770.appspot.com"
}

firebase = pyrebase.initialize_app(config)
auth = firebase.auth()
user = auth.sign_in_with_email_and_password("yuka@yukachan.com", "yukachan")
db = firebase.database()



db.child("floor3").child(0).set("", user['idToken'])

def enviar(nk,id,x,y,tm,s,destroy):
    data = {"nk": nk, "id": id,"x": int(x),"y": int(y), "time": tm, "show": s}
    if(destroy == False):
        results = db.child("floor3").child(id).set(data, user['idToken'])
    else:
        data = {"nk": nk, "id": id,"x": int(x),"y": int(y), "time": tm, "show": False}
        results = db.child("floor3").child(id).set(data, user['idToken'])








def getData(data):
        if len(data) > 0:
            for u in data:
                if(time.time()-u['tm']>1):
                    enviar(u['nk'],u['id'],u['x'],u['y'],u['tm'],u['s'], True)
                else:
                    enviar(u['nk'],u['id'],u['x'],u['y'],u['tm'],u['s'], False)




def readFile():
    with open('data.json') as json_file:
        data = json.load(json_file)
        getData(data)
