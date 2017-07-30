
import argparse
import datetime
import imutils
import math
import cv2
import numpy as np
import time
from dataTransfer import putData, writeFile
from clear1 import killMe
import json
from random import randint
import os

datos = []

def writeFile2():
    #print(len(datos))
    with open('data.json', 'r+') as f:
        json_data = json.load(f)
        json_data = datos
        f.seek(0)
        f.write(json.dumps(json_data))
        f.truncate()
    #subprocess.call('python3 fire.py', shell=True)

writeFile2()
killMe()


width = 800
textIn = 0
textOut = 0

def testIntersectionIn(x, y):

    res = -450 * x + 400 * y + 157500
    if((res >= -550) and  (res < 550)):
        print (str(res))
        return True
    return False



def testIntersectionOut(x, y):
    res = -450 * x + 400 * y + 180000
    if ((res >= -550) and (res <= 550)):
        print (str(res))
        return True

    return False

camera = cv2.VideoCapture("http://172.20.10.2:8160/")
#camera = cv2.VideoCapture("1.mp4")

#camera = cv2.VideoCapture("rtsp://172.20.10.7:8080/h264_pcm.sdp")
out = cv2.VideoWriter('output_%d.h264' % randint(0, 5000), -1, 20.0, (800,450))

firstFrame = None

while True:

    (grabbed, frame) = camera.read()


    if not grabbed:
        break

    frame = imutils.resize(frame, width=width)
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    gray = cv2.GaussianBlur(gray, (21, 21), 0)

    if firstFrame is None:
        firstFrame = gray
        continue


    frameDelta = cv2.absdiff(firstFrame, gray)
    thresh = cv2.threshold(frameDelta, 48, 255, cv2.THRESH_BINARY)[1]



    cid= 0
    nk = 1

    thresh = cv2.dilate(thresh, None, iterations=2)
    _, cnts, _ = cv2.findContours(thresh.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    for c in cnts:
        if cv2.contourArea(c) < 12000:
            continue

        (x, y, w, h) = cv2.boundingRect(c)
        cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 0), 2)


        cid += 1


        rectagleCenterPont = ((x + x + w) /2, (y + y + h) /2)
        yuka_x = (x + x + w) /2
        yuka_y = (y + y + h) /2

        tm = time.time()
        nk = 1
        show = True;

        #fire.enviar(nk,cid,x,y)
        putData(cid,nk,tm,x,y,show)
        writeFile()






    if cv2.waitKey(1) & 0xFF == ord('q'):
        break


    out.write(frame)
    cv2.imshow("Security Feed", frame)



# cleanup the camera and close any open windows
killMe()
camera.release()
out.release()
cv2.destroyAllWindows()
