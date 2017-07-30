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




def killMe():
    db.child("floor2").child(1).update({"show": False}, user['idToken'])
    db.child("floor2").child(2).update({"show": False}, user['idToken'])
    db.child("floor2").child(3).update({"show": False}, user['idToken'])
    db.child("floor2").child(4).update({"show": False}, user['idToken'])
    db.child("floor2").child(5).update({"show": False}, user['idToken'])






killMe()
