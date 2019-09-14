clear all
clc
grid on

printAxis();

prompt =
 phiDeg = input(prompt)
  prompt = 
 psiDeg = input(prompt);

 phiRad = deg2rad(phiDeg);
 psiRad = deg2rad(psiDeg);
 
 for phiRad = 0:0.01:phiRad 
    clf;
    for psiRad = 0:0.01:psiRad
            clf;
  line([-8 8],[0 0],[0 0],'color',[1 0 0],'linewidth',1.5); %establece el eje X en rojo
  line([0 0],[0 0],[-8 8],'color',[0 0 1],'linewidth',1.5); %establece el eje Z en azul
  
  Rx=[1 0 0; 0 cos(phiRad) -sin(phiRad); 0 sin(phiRad) cos(phiRad)];
  Rz=[cos(psiRad) -sin(psiRad) 0; sin(psiRad) cos(psiRad) 0; 0 0 1];
  
  
p1=[0;0;0];
l1 = 8;
l2 = 4;

view(120,30)
  grid on

theta1_deg = 30; %Indicar los grados al que lo vamos a dirigir
theta1_rad = deg2rad(theta1_deg); %Conversion de radianes a grados
TRz1 = [cos(theta1_rad) -sin(theta1_rad) 0 0; sin(theta1_rad) cos(theta1_rad) 0 0; 0 0 1 0; 0 0 0 1];
TTx1 = [1 0 0 l1; 0 1 0 0; 0 0 1 0; 0 0 0 1];
T1 = TRz1*TTx1;
p2 = T1(1:3,4);

v1x = TRz1(1:3,1);
v1y = TRz1(1:3,2);

v2x = p2+T1(1:3,1);
v2y = p2+T1(1:3,2);

line([p1(1) p2(1)], [p1(2) p2(2)], [p1(2) p2(2)],'color',[0 0 0],'linewidth',3);

line([p1(1) v1x(1)], [p1(2) v1x(2)], [p1(2) v1x(2)],'color',[1 0 0],'linewidth',3);
line([p1(1) v1y(1)], [p1(2) v1y(2)], [p1(2) v1y(2)],'color',[0 1 0],'linewidth',3);

line([p2(1) v2x(1)], [p2(2) v2x(2)], [p2(2) v2x(2)],'color',[1 0 0],'linewidth',3);
line([p2(1) v2y(1)], [p2(2) v2y(2)], [p2(2) v2y(2)],'color',[0 1 0],'linewidth',3);

theta2_deg = -15; 
theta2_rad = deg2rad(theta2_deg); 
TRz2 = [cos(theta2_rad) -sin(theta2_rad) 0 0; sin(theta2_rad) cos(theta2_rad) 0 0; 0 0 1 0; 0 0 0 1];
TTx2 = [1 0 0 l2; 0 1 0 0; 0 0 1 0; 0 0 0 1];
T2 = TRz2*TTx2;

Tf = T1*T2;

p3 = Tf(1:3,4);
v3x = p3+Tf(1:3,1);
v3y = p3+Tf(1:3,2);

line([p2(1) p3(1)], [p2(2) p3(2)], [p2(2) p3(2)],'color',[0.6 0 0.8],'linewidth',3);
line([p3(1) v3x(1)], [p3(2) v3x(2)], [p3(2) v3x(2)],'color',[1 0 1],'linewidth',3);
line([p3(1) v3y(1)], [p3(2) v3y(2)], [p3(2) v3y(2)],'color',[0 1 1],'linewidth',3);


grid
 
 pause(0.01)
 
        end
    end


