import socket
import winsound
from datetime import datetime


datetime.now(tz=None)
HOST = 'localhost'
PORT = 8075
tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
tcp.bind(('localhost' , 8075))
tcp.listen(1)

while True:
    connection, connectedAddress = tcp.accept()
    print ('dcs has connected to the socket at ' + str(connectedAddress))
    while True:
        msg = connection.recv(512)
        if not msg: 
            break
        msgStr = str(msg)
        msgStr = msgStr.replace("b'+", "")
        msgStr = msgStr.replace("'", "")
        try:
            gForce = float(msgStr)
            if gForce > 9:
                winsound.Beep(10000, 150)
            if gForce < 9 and gForce > 7:
                winsound.Beep(7000, 150)
            if gForce < 7 and gForce > 5:
                winsound.Beep(5000, 150)
            if gForce < 5 and gForce > 4:
                winsound.Beep(3000 , 150)
            if gForce < 4 and gForce > 3:
                winsound.Beep(2000, 150)
        except:
            print('error')

    print ('Ending connection', str(connectedAddress))
    connection.close()
