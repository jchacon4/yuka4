import threading
import time
from fire import readFile
import json

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


class ThreadingExample(object):
    """ Threading example class
    The run() method will be started and it will run in the background
    until the application exits.
    """

    def __init__(self, interval=0):
        """ Constructor
        :type interval: int
        :param interval: Check interval, in seconds
        """
        self.interval = interval

        thread = threading.Thread(target=self.run, args=())
        thread.daemon = True                            # Daemonize thread
        thread.start()                                  # Start the execution

    def run(self):
        """ Method that runs forever """
        print("！")
        while True:
            # Do something
            readFile()

            #time.sleep(self.interval)

example = ThreadingExample()
