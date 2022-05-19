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
    
    plot([O(1) A(1)], [O(2) A(2)], 'r-', 'LineWidth', 1);    
    
    hold on ; % Important to plot multiple traces in a single window
    
    plott(O, A, B, C, D, E, F, G);
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

function plott(O, A, B, C, D, E, F, G)



plot (O(1), O(2), 'ko' , 'markerfacecolor' , 'b' );
plot (A(1), A(2), 'ko' , 'markerfacecolor' , 'b' );
plot (B(1), B(2), 'ko' , 'markerfacecolor' , 'b' );
plot (C(1), C(2), 'ko' , 'markerfacecolor' , 'b' );
plot (D(1), D(2), 'ko' , 'markerfacecolor' , 'b' );
plot (E(1), E(2), 'ko' , 'markerfacecolor' , 'b' );
plot (F(1), F(2), 'ko' , 'markerfacecolor' , 'b' );
plot (G(1), G(2), 'ko' , 'markerfacecolor' , 'b' );

plot([O(1) A(1) B(1) O(1)], [O(2) A(2) B(2) O(1)], 'g');
plot([D(1) B(1) C(1)], [D(2) B(2) C(2)], 'g');
plot([D(1) E(1) C(1)], [D(2) E(2) C(2)], 'g');
plot([F(1) E(1) G(1)], [F(2) E(2) G(2)], 'g');

P = [30 F(2)];
plot([F(1) P(1)], [F(2) P(2)], 'k', 'LineWidth', 3);
end