Código de control de Python

# Declaración de Variables

Ref = np.array([[500],[500],[500],[500]])

A = np.matrix(np.identity((4)))

B = 0.001 * np.matrix(np.identity(4))

C = np.matrix([[599.83,311.72,107.97,30.06], [311.72,599.83,311.72,107.97], [107.97,311.72,599.83,311.72], [30.06,107.97,311.72,599.83]])

D = np.matrix(np.zeros((4,4)))

K = np.matrix([[84.4038,-0.0001,-0.0001,-0.0002],[-0.0005,84.4036,0,0.0001],[0.0006,0.0004,84.4039,-0.0001],[-0.0005,-0.0003,-0.0002,84.4036]])

L = (np.matrix([[0.0022,-0.0012,0.0003,0],[-0.0013,0.0028,-0.0014,0.0002],[0.0003,-0.0014,0.0029,-0.0012],[0,0.0003,-0.0013,0.0021]]))

Ki = np.matrix([[0.0016,-0.0009,0.0002,0],[-0.0009,0.0021,-0.0010,0.0002],[0.0002,-0.0010,0.0021,-0.0009],[0,0.0002,-0.0009,0.0016]])

#---------------------------------

# Lectura de datos y traduccion a Luxes

for i in range (4):

values[i] = mcp.read_adc(i)

y[0] = (8500 * math.e ** (-0.021 * values[0]))

y[1] = (7000 * math.e ** (-0.022 * values[1]))

y[2] = (9000 * math.e ** (-0.023 * values[2]))

y[3] = (9500 * math.e ** (-0.021 * values[3]))

#---------------------------------

# Proceso de control

u = (Ki*x2)-(K*x1)

x1 = ((A-L*C)*x0)+(B*u)+(L*y)

eT = Ref-y

x2 = eT0+x3

x0 = x1

eT0=eT

x3=x2

#-------------------------------

# Envio de datos

arduino.write(str(int(u[0])) + "," + str(int(u[1])) + "," + str(int(u[2])) + "," + str(int(u[3])) + ",")

#-------------------------------

Código en Arduino

# Codigo de Arduino

char s = ',';

if(Serial.available()){

String k = Serial.readString();

Pr = k.indexOf(s);

DC1 = k.substring(0,Pr).toInt();

k = k.substring(Pr+1);

Pr = k.indexOf(s);

DC2 = k.substring(0,Pr).toInt();

k = k.substring(Pr+1);

Pr = k.indexOf(s);

DC3 = k.substring(0,Pr).toInt();

k = k.substring(Pr+1);

Pr = k.indexOf(s);

DC4 = k.substring(0,Pr).toInt();

if((DC1>0))

analogWrite(9,(l1 = l1+0.15)*255/100);//LED 1

if((DC2>0))

analogWrite(10,(l2 = l2+0.15)*255/100);//LED 2

if((DC3>0))

analogWrite(5,(l3 = l3+0.15)*255/100);//LED 3

if((DC4>0))

analogWrite(3,(l4 = l4+0.15)*255/100);//LED 4

if((DC1<0))

analogWrite(9,(l1 = l1-0.15)*255/100);

if((DC2<0))

analogWrite(10,(l2 = l2-0.15)*255/100);

if((DC3<0))

analogWrite(5,(l3 = l3-0.15)*255/100);

if((DC4<0))

analogWrite(3,(l4 = l4-0.15)*255/100);

}

#-------------------------------