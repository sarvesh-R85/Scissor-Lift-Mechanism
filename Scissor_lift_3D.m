clc;
clear all;
close all;

O = [0;0];
L = 20;

figure(1);
grid off;

for i = 30:-1:10
    % Plotting screen size setting
    x0 = 0; y0 = 0; % Origin for the plot screen
    largeur =650; % Length of plot screen from origin
    hauteur =450; % Width of plot screen from origin
    set(gcf,'units','points','position',[ x0, y0, largeur, hauteur])
    
    A = [i;0];
    B = [i/2 (sqrt((L^2)-((i/2)^2)))];
    C = [i 2*(sqrt((L^2)-((i/2)^2)))];
    D = [0 2*(sqrt((L^2)-((i/2)^2)))];
    E = [i/2 3*(sqrt((L^2)-((i/2)^2)))];
    F = [0 4*(sqrt((L^2)-((i/2)^2)))];
    G = [i 4*(sqrt((L^2)-((i/2)^2)))];
    H = [F(1)+15 F(2)+1];

    theta = acos(i/(2*L));
    plot3([O(1) A(1)], [0.5, 0.5], [O(2) A(2)], 'r', 'LineWidth', 3);    
    
    hold on ; % Important to plot multiple traces in a single window
    
    plott(O, A, B, C, D, E, F, G, H, theta);

    % Setting x & y limits for the plot area
    xlim ([ -10 , 40]);
    ylim ([ -5 , 25]);

    grid on ;
    grid minor ;

    % Commands to generate animation
    drawnow ;
    pause (0.01);
    % Deleting instances for each iteration of loop
    hold off;

end

function plott(O, A, B, C, D, E, F, G, H, theta)
rectangle(H, 0, [15 1], 0.5, 0,  'b');
rectangle(B, theta, [20 1], 0.5, 0, 'b');
rectangle(B, -theta, [20 1], 0.5, 0.5, 'b');
rectangle(E, theta, [20 1], 0.5, 0, 'b');
rectangle(E, -theta, [20 1], 0.5, 0.5, 'b');

rectangle(H, 0, [15 1], 0.5 ,10,  'b');
rectangle(B, theta, [20 1], 0.5, 10, 'b');
rectangle(B, -theta, [20 1], 0.5, 10.5, 'b');
rectangle(E, theta, [20 1], 0.5, 10, 'b');
rectangle(E, -theta, [20 1], 0.5, 10.5, 'b');

connect(O, 0, [0.5 0.5], 10, 0, 'k');
connect(A, 0, [0.5 0.5], 10, 0, 'k');
connect(B, 0, [0.5 0.5], 10, 0, 'k');
connect(C, 0, [0.5 0.5], 10, 0, 'k');
connect(D, 0, [0.5 0.5], 10, 0, 'k');
connect(E, 0, [0.5 0.5], 10, 0, 'k');
connect(F, 0, [0.5 0.5], 10, 0, 'k');
connect(G, 0, [0.5 0.5], 10, 0, 'k');


P = [30 F(2)];

end

function rectangle(Centroid, angle, size, e, offset, color)
%angle = 0;

Rotz= [cos(angle),-sin(angle);sin(angle),cos(angle)];

%Centroid = [0,0];

%size = [15,1];

A(1,1:2) = Rotz*[-size(1);-size(2)]; A(1,1) = A(1,1) + Centroid(1); A(1,2) = A(1,2) + Centroid(2);
B(1,1:2) = Rotz*[-size(1);size(2)]; B(1,1) = B(1,1) + Centroid(1); B(1,2) = B(1,2) + Centroid(2);
C(1,1:2) = Rotz*[size(1);-size(2)]; C(1,1) = C(1,1) + Centroid(1); C(1,2) = C(1,2) + Centroid(2);
D(1,1:2) = Rotz*[size(1);size(2)]; D(1,1) = D(1,1) + Centroid(1); D(1,2) = D(1,2) + Centroid(2);

X = [B(1,1) B(1,1) A(1,1) C(1,1) A(1,1) A(1,1);A(1,1) D(1,1) C(1,1) D(1,1) B(1,1) B(1,1);A(1,1) D(1,1) C(1,1) D(1,1) D(1,1) D(1,1);B(1,1) B(1,1) A(1,1)  C(1,1) C(1,1) C(1,1)]; 
Y = [0 0 0 0 0 1;0 0 0 0 0 1;1 1 1 1 0 1;1 1 1 1 0 1];
Y = Y * e  + offset;
Z = [B(1,2) B(1,2) A(1,2) C(1,2) A(1,2) A(1,2);A(1,2) D(1,2) C(1,2) D(1,2) B(1,2) B(1,2);A(1,2) D(1,2) C(1,2) D(1,2) D(1,2) D(1,2);B(1,2) B(1,2) A(1,2) C(1,2) C(1,2) C(1,2)]; 

fill3(X,Y,Z,color);

scatter3(Centroid(1),0,Centroid(2));

end

function connect(Centroid, angle, size, e, offset, color)
%angle = 0;

Rotz= [cos(angle),-sin(angle);sin(angle),cos(angle)];

%Centroid = [0,0];

%size = [15,1];

A(1,1:2) = Rotz*[-size(1);-size(2)]; A(1,1) = A(1,1) + Centroid(1); A(1,2) = A(1,2) + Centroid(2);
B(1,1:2) = Rotz*[-size(1);size(2)]; B(1,1) = B(1,1) + Centroid(1); B(1,2) = B(1,2) + Centroid(2);
C(1,1:2) = Rotz*[size(1);-size(2)]; C(1,1) = C(1,1) + Centroid(1); C(1,2) = C(1,2) + Centroid(2);
D(1,1:2) = Rotz*[size(1);size(2)]; D(1,1) = D(1,1) + Centroid(1); D(1,2) = D(1,2) + Centroid(2);

X = [B(1,1) B(1,1) A(1,1) C(1,1) A(1,1) A(1,1);A(1,1) D(1,1) C(1,1) D(1,1) B(1,1) B(1,1);A(1,1) D(1,1) C(1,1) D(1,1) D(1,1) D(1,1);B(1,1) B(1,1) A(1,1)  C(1,1) C(1,1) C(1,1)]; 
Y = [0 0 0 0 0 1;0 0 0 0 0 1;1 1 1 1 0 1;1 1 1 1 0 1];
Y = Y * e  + offset;
Z = [B(1,2) B(1,2) A(1,2) C(1,2) A(1,2) A(1,2);A(1,2) D(1,2) C(1,2) D(1,2) B(1,2) B(1,2);A(1,2) D(1,2) C(1,2) D(1,2) D(1,2) D(1,2);B(1,2) B(1,2) A(1,2) C(1,2) C(1,2) C(1,2)]; 

fill3(X,Y,Z,color);

scatter3(Centroid(1),0,Centroid(2));

end