%% Matriz de controlabilidad
A = [0 0 0 0;0 0 0 0;0 0 0 0; 0 0 0 0]
B = eye (4)
Co = ctrb (A, B)
Rango = rank (Co)
%--------------------------------------

%% Matriz de Observabilidad
A = [0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0]
C = [B11 B12 B13 B14; B21 B22 B23 B24; B31 B32 B33 B34; B41 B42 B43 B44]
Obs = obsv (A, C)
Rango = rank (Obs)
%--------------------------------------

%% Calculo de la matriz K
A = [0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0]
B = eye (4)
polos = [-1+0.126i -1-0.126i -1+0.126i -1-0.126i]
K = place (A, B, polos)
%--------------------------------------

%% Calculo de la matriz Ke
A = [0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0]
C = [B11 B12 B13 B14; B21 B22 B23 B24; B31 B32 B33 B34; B41 B42 B43 B44]
polos = [-1+0.126i -1-0.126i -1+0.126i -1-0.126i]
Ke = place (A’, C’, polos)
%--------------------------------------

%% Calculo de la Matriz Ki
Aa = [A zeros (4,4); -C zeros (4,4)]
Ba = [B; zeros (4,4)]
polos = [-1+0.126i -1-0.126i -1+0.126i -1-0.126i]
polosa = [polos polos]
Ka = place (Aa, Ba, polosa)
K = Ka (:,1:4)
Ki = -Ka (:,5:8)
%------------------------------------

%% Discretización del sistema
A = [0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0]
B = eye (4)
C = [B11 B12 B13 B14; B21 B22 B23 B24; B31 B32 B33 B34; B41 B42 B43 B44]
D = zeros (4)
Ts = 0.01
H = ss (A, B, C, D)
Hd = c2d (H, Ts, 'zoh')
%------------------------------------

%% Calculo de las matrices de ganancias discretizadas
A = [0 0 0 0;0 0 0 0;0 0 0 0; 0 0 0 0]
B = eye (4)
C = [B11 B12 B13 B14; B21 B22 B23 B24; B31 B32 B33 B34; B41 B42 B43 B44]
D = zeros (4)
Ts = 0.01
H = ss (A, B, C, D)
Hd = c2d (H, Ts, 'zoh')
polos = [-1+0.126i -1-0.126i -1+0.126i -1-0.126i]
Aa=[(Hd.A) zeros (4,4);-(Hd.C) zeros(4,4)]
Ba=[(Hd.B);zeros(4,4)]
Ca = [C zeros (4)]
Da = D
polosa = [polos polos]
polosad = exp((polosa)*Ts)
Ke = place (Hd.A, Hd.C,((exp((polos)*Ts))))
Ka = place (Aa, Ba, polosad)
Ki = -Ka(:,5:8)
K = Ka(:,1:4)
%------------------------------------

%% Calculo de las matrices de ganancias discretizadas
A = [0 0 0 0;0 0 0 0;0 0 0 0; 0 0 0 0]
B = eye (4)
C = [B11 B12 B13 B14; B21 B22 B23 B24; B31 B32 B33 B34; B41 B42 B43 B44]
D = zeros (4)
Ts = 0.01
H = ss (A, B, C, D)
Hd = c2d (H, Ts, 'zoh')
polos = 250*[-1+0.127i -1-0.127i -1.00001+0.127i -1.00001-0.127i]
Aa=[(Hd.A) zeros(4,4);-(Hd.C) zeros(4,4)]
Ba=[(Hd.B);zeros(4,4)]
Ca = [C zeros(4)]
Da = D
polosa = [polos polos]
polosad = exp((polosa)*Ts)
Ke = place (Hd.A, Hd.C, ((exp((polos)*Ts))))
Ka = place (Aa, Ba, polosad)
Ki = -Ka(:,5:8)
K = Ka(:,1:4)
%------------------------------------