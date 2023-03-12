clear;
clc;
close all; % 关闭所有图像

%% main program
    N = [5,10,20,50,100,200]; 
x1= zeros(201,6);

%% solve precise solution
 xx = 0:1/1000:1;
    u_precise2= 1/2*(xx-xx.^2);


%%  fem method
 for j = 1:length(N)
    h = 1 / N(j);
    x = 0:h:1;
    K = zeros(N(j)-1);
    K = K + diag(ones(N(j)-1,1).*(2/h), 0) + ...
                diag((-1/h).*ones(N(j)-2,1), 1) + ...
                diag((-1/h).*ones(N(j)-2,1), -1);
    F=zeros(1,N(j)-1);
    for i =1:(N(j)-1)
        F(i)=h;
    end
    F =F';
    K = sparse(K);
    U = K\F;
    solution = [0; U; 0];
    

    if j ==1
        x1 = 0:h:1;
        u_precise11= 1/2*(x1-x1.^2);
        u_precise11= u_precise11';
        error1= u_precise11 - solution;
        error1=sqrt(error1.*error1)*1e10;
        
    elseif j==2
        x2 = 0:h:1;
        u_precise12= 1/2*(x2-x2.^2);
        u_precise12= u_precise12';
        error2 = u_precise12 - solution;
         error2=sqrt(error2.*error2);
    elseif j==3
        x3 = 0:h:1;
        u_precise13= 1/2*(x3-x3.^2);
        u_precise13= u_precise13';
        error3= u_precise13 - solution;
         error3=sqrt(error3.*error3);
    elseif j==4
        x4 = 0:h:1;
        u_precise14= 1/2*(x4-x4.^2);
        u_precise14= u_precise14';
        error4= u_precise14 - solution;
         error4=sqrt(error4.*error4);
    elseif j==5
         x5 = 0:h:1;
         u_precise15= 1/2*(x5-x5.^2);
        u_precise15= u_precise15';
        error5= u_precise15 - solution;
        error5=sqrt(error5.*error5);
        
    elseif j==6
        x6 = 0:h:1;
        u_precise16= 1/2*(x6-x6.^2);
        u_precise16= u_precise16';
        error6= u_precise16 - solution;
        error6=sqrt(error6.*error6);
         
    end
    

    %% draw
     figure(1)
     subplot(2,3,j);
    plot(x', solution, '-o' ,xx', u_precise2,  '--r','LineWidth',1.5,'MarkerSize',2);
    legend('数值解', '精确解')
    xlabel('x')
    ylabel('U');
    title(['数值解与精确解 N=' ,num2str(N(j))]);
 end
% draw error
%     figure(2)
%     subplot(2,3,1);
%     plot(x1, error1, '-o','LineWidth',2,'MarkerEdgeColor','black');
%     xlabel('x')
%     ylabel('Error');
%     title(['误差 N=' ,num2str(N(1))]);
%     subplot(2,3,2);
%     plot(x2, error2, '-o','LineWidth',2,'MarkerEdgeColor','black');
%      xlabel('x')
%     ylabel('Error');
%     title(['误差 N=' ,num2str(N(2))]);
%     subplot(2,3,3);
%     plot(x3, error3, '-o','LineWidth',2,'MarkerEdgeColor','black');
%      xlabel('x')
%     ylabel('Error');
%     title(['误差 N=' ,num2str(N(3))]);
%     subplot(2,3,4);
%      plot(x4, error4, '-b','LineWidth',2,'MarkerEdgeColor','black');
%       xlabel('x')
%     ylabel('Error');
%     title(['误差 N=' ,num2str(N(4))]);
%     subplot(2,3,5);
%      plot(x5, error5, '-b','LineWidth',2,'MarkerEdgeColor','black');
%       xlabel('x')
%     ylabel('Error');
%     title(['误差 N=' ,num2str(N(5))]);
%     subplot(2,3,6);
%      plot(x6, error6, '-b','LineWidth',2,'MarkerEdgeColor','black');
%       xlabel('x')
%     ylabel('Error');
%     title(['误差 N=' ,num2str(N(6))]);


