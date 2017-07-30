import pyrebase
import sys
import datetime
import time
import json




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




def leeme():
    f1 = db.child("floor1").get()

    with open('f1.json', 'r+') as f:
         json_data = json.load(f)
         json_data = f1.val()
         f.seek(0)
         f.write(json.dumps(json_data))
         f.truncate()



while True:
    leeme()
