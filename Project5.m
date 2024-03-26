%Kaitlyn Kirt, CMOR 220, Spring 2024, SIR Model Project
%Project5.m
%This script is a project on discrete equations and SIR models
%Last motified: February 26, 2024

%driver 
function Project5
%Question 1 
disp("Part 1")
initialvalue(1)=(7.9*10.^6)-10;
initialvalue(2)=0;
initialvalue(3)=10;
[Svalue,Rvalue,Ivalue]=simpleSIR(0.7,0.1,initialvalue,150);
%Question 2
disp("Part 2")
[Svalue,Rvalue,Ivalue]=variableSIR(1/2,1/3,0.01,1/(76*365),initialvalue,1460);
%Question 3
disp("Part 3")
[Svalue,Rvalue,Ivalue]=variableimmSIR(1/2,1/3,0.01,1/(76*365),1/365,initialvalue,1460);
end 

function [Svalue,Rvalue,Ivalue]=simpleSIR(alpha,beta,initialvalue,Tfinal)
%inputs: alpha,beta,initialvalue,Tfinal
%outputs: Svalue,Rvalue,Ivalue
%description: this function creates a plot for a SIR model with a contstant
%total population
Svalue(1)= initialvalue(1); %assigns initial value of susceptible population
Rvalue(1)= initialvalue(2); %assigns initial value of recovered population 
Ivalue(1)= initialvalue(3); %assigns initial value of infected population
M=Svalue(1)+Rvalue(1)+Ivalue(1); %equation for total population
   for n=1:Tfinal %runs code Tfinal times 
       Svalue(n+1)=Svalue(n)-((alpha/M)*Svalue(n)*Ivalue(n)); %reassigns susceptible population after contacts and infected individuals
       Ivalue(n+1)=Ivalue(n)+((alpha/M)*Svalue(n)*Ivalue(n))-(beta*Ivalue(n)); %reassigns infected population after contacts and recovered individuals
       Rvalue(n+1)=Rvalue(n)+(beta*Ivalue(n)); %reassigns recovered population after recovered from infection individuals
   end
figure(1);
timevalue=linspace(0,Tfinal,Tfinal+1);
plot(timevalue,Svalue,'LineWidth',2)
hold on; grid on;
plot(timevalue,Ivalue,'LineWidth',2)
hold on; 
plot(timevalue,Rvalue,'LineWidth',2)
title('Evolution of Each Group')
legend('Susceptible','Infected','Recovered')
xlabel('Days')
ylabel('Population')
hold off;
%Sn, In, and Rn changed because the number of contacts each day increased and the number of
%recovered people each day decreased. The number of susceptible
%individuals abruptly decreased due to this increase in contacts while the
%number of infected individuals increased abruptly due to the decreased in
%recovered illnesses. The recovery graph has a steep slope after the entire
%population contracted the virus. 
end

function [Svalue,Rvalue,Ivalue]=variableSIR(alpha,beta,gamma,mu,initialvalue,Tfinal)
%inputs: alpha,beta,gamma,mu,initialvalue,Tfinal
%outputs: Svalue,Rvalue,Ivalue
%description: this function creates two plots for a SIR model with a
%variable total population
Svalue(1)= initialvalue(1)+10; %assigns initial value of susceptible population
Rvalue(1)= initialvalue(2); %assigns initial value of recovered population 
Ivalue(1)= initialvalue(3); %assigns initial value of infected population
M(1)=initialvalue(1)+initialvalue(2)+initialvalue(3); %equation for total population
    for n=1:Tfinal %runs code Tfinal times
        Svalue(n+1)=Svalue(n)-((alpha/M(n))*Svalue(n)*Ivalue(n))+(mu*M(n))-(mu*Svalue(n)); %reassigns susceptible population after contacts, infected, and birth/death individuals
        Rvalue(n+1)=Rvalue(n)+(beta*Ivalue(n))-(mu*Rvalue(n)); %reassings recovered population after recovered from illness and birth/death individuals
        Ivalue(n+1)=Ivalue(n)+((alpha/M(n))*Svalue(n)*Ivalue(n))-(beta*Ivalue(n))-(mu+gamma)*Ivalue(n); %reassigns infected population after contacts, recovered,birth/death, and infected deaths individuals
        M(n+1)=M(n)-gamma*Ivalue(n); %changes value of total population after death due to infection
    end
figure(2);
timevalue=linspace(0,Tfinal,Tfinal+1);
plot(timevalue,Svalue,'LineWidth',2)
hold on; grid on;
plot(timevalue,Rvalue,'LineWidth',2)
hold on; 
plot(timevalue,Ivalue,'LineWidth',2)
hold on; 
plot(timevalue,M,'LineWidth',2)
legend('Susceptible','Recovered','Infected','Total Population')
title('Evolution of Each Group')
xlabel('Days')
ylabel('Population')
hold off;

figure(3);
plot(Svalue,Ivalue,'linewidth',3)
title('Infected as a Function of Susceptibles')
xlabel('Susceptible')
ylabel('Infected')
legend('Infected vs Susceptible')
end

function [Svalue,Rvalue,Ivalue]=variableimmSIR(alpha,beta,gamma,mu,omega,initialvalue,Tfinal)
%inputs: alpha,beta,gamma,mu,omega,initialvalue,Tfinal
%outputs: Svalue,Rvalue,Ivalue
%description: this function creates two plots for a SIR model that takes
%loss of immunity into account
Svalue(1)= initialvalue(1)+10;%assigns initial value of susceptible population
Rvalue(1)= initialvalue(2); %assigns initial value of recovered population 
Ivalue(1)= initialvalue(3); %assigns initial value of infected population
M(1)=initialvalue(1)+initialvalue(2)+initialvalue(3); %equation for total population
    for n=1:Tfinal %runs code Tfinal times
        Svalue(n+1)=Svalue(n)-((alpha/M(n))*Svalue(n)*Ivalue(n))+(mu*M(n))-(mu*Svalue(n))+(Rvalue(n)*omega); %reassigns susceptible population a after contacts, infected, birth/death, and recovered but susceptible individuals
        Rvalue(n+1)=Rvalue(n)+(beta*Ivalue(n))-(mu*Rvalue(n))-(Rvalue(n)*omega); %reassings recovered population after recovered from illness, birth/death, and recovered but susceptible individuals
        Ivalue(n+1)=Ivalue(n)+((alpha/M(n))*Svalue(n)*Ivalue(n))-(beta*Ivalue(n))-(mu+gamma)*Ivalue(n); %reassigns infected population after contacts, recovered,birth/death, and infected deaths individuals
        M(n+1)=M(n)-gamma*Ivalue(n); %changes value of total population after death due to infection
    end
figure(4); 
timevalue=linspace(0,Tfinal,Tfinal+1);
plot(timevalue,Svalue,'LineWidth',2)
hold on; grid on;
plot(timevalue,Rvalue,'LineWidth',2)
hold on; 
plot(timevalue,Ivalue,'LineWidth',2)
hold on; 
plot(timevalue,M,'LineWidth',2)
legend('Susceptible','Recovered','Infected','Total Population')
title('Evolution of Each Group')
xlabel('Days')
ylabel('Population')
hold off;

figure(5);
plot(Svalue,Ivalue,'linewidth',3)
title('Infected as a Function of Susceptibles')
xlabel('Susceptible')
ylabel('Infected')
legend('Infected vs Susceptible')
end