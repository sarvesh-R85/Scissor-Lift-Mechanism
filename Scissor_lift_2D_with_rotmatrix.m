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
    
    plot([O(1) A(1)], [O(2) A(2)], 'r-', 'LineWidth', 1);    
    
    hold on ; % Important to plot multiple traces in a single window
    
    plott(O, A, B, C, D, E, F, G, H, theta);
    
    % Setting x & y limits for the plot area
    xlim ([ -10 , 40]);
    ylim ([ -5 , 120]);

    grid on ;
    grid minor ;

    % Commands to generate animation
    drawnow ;
    pause (0.01);
    % Deleting instances for each iteration of loop
    hold off;

end

function plott(O, A, B, C, D, E, F, G, H, theta)
rectangle(H, 0, [15 1]);
rectangle(B, theta, [20 1]);
rectangle(B, -theta, [20 1]);
rectangle(E, theta, [20 1]);
rectangle(E, -theta, [20 1]);

plot (O(1), O(2), 'ko' , 'markerfacecolor' , 'g' );
plot (A(1), A(2), 'ko' , 'markerfacecolor' , 'g' );
plot (B(1), B(2), 'ko' , 'markerfacecolor' , 'g' );
plot (C(1), C(2), 'ko' , 'markerfacecolor' , 'g' );
plot (D(1), D(2), 'ko' , 'markerfacecolor' , 'g' );
plot (E(1), E(2), 'ko' , 'markerfacecolor' , 'g' );
plot (F(1), F(2), 'ko' , 'markerfacecolor' , 'g' );
plot (G(1), G(2), 'ko' , 'markerfacecolor' , 'g' );

end

function rectangle(Centroid, angle, size)
%angle = 0;

Rotz= [cos(angle),-sin(angle);sin(angle),cos(angle)];

%Centroid = [0,0];

%size = [15,1];


A(1,1:2) = Rotz*[-size(1);-size(2)]; A(1,1) = A(1,1) + Centroid(1); A(1,2) = A(1,2) + Centroid(2);
B(1,1:2) = Rotz*[-size(1);size(2)]; B(1,1) = B(1,1) + Centroid(1); B(1,2) = B(1,2) + Centroid(2);
C(1,1:2) = Rotz*[size(1);-size(2)]; C(1,1) = C(1,1) + Centroid(1); C(1,2) = C(1,2) + Centroid(2);
D(1,1:2) = Rotz*[size(1);size(2)]; D(1,1) = D(1,1) + Centroid(1); D(1,2) = D(1,2) + Centroid(2);

fill([A(1, 1) C(1, 1) D(1, 1) B(1, 1) A(1, 1)], [A(1, 2) C(1, 2) D(1, 2) B(1, 2) A(1, 2)], 'b');

% plot([A(1,1),B(1,1)],[A(1,2),B(1,2)],'k','LineWidth',2);
% hold on;
% plot([A(1,1),C(1,1)],[A(1,2),C(1,2)],'b','LineWidth',2);
% plot([D(1,1),B(1,1)],[D(1,2),B(1,2)],'r','LineWidth',2);
% plot([D(1,1),C(1,1)],[D(1,2),C(1,2)],'g','LineWidth',2);
% scatter(Centroid(1),Centroid(2));
end