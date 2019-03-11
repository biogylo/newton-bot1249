%Metodos Numericos 543 11 de marzo de 2019
%Practica 5 - Ejercicio 2 
%Navarro Rodriguez Juan Francisco
%Newton bot 1249
%Este programa aproxima por el metodo de Newton-Rhapson
%a la raiz de f(x) = 2x^3 -11.7x^2) +17.7x -5
clc;clear;
%Constantes
maxi = 8; %numero maximo de iteraciones
cifras = 5; %cantidad de cifras minimas de la aproximacion

%f de x
f = @(x) 2*power(x,3) -11.7*power(x,2) +17.7*x -5 ; %funcion anonima

%f' de x
fp = @(x) 6*power(x,2) -23.4*power(x,1) +17.7 ; %funcion anonima F prima

xaprox = 0; % x r
eaprox = inf;
tol = power(10,-8); % porciento de tolerancia

fprintf(['Simple bot 895\n\tEste programa aproxima de forma numerica', ...
'\n\tpor el metodo de Newton-Rhapson, los ceros de una funcion,', ...
'\n\tcuya f(x) =  2x^3 -11.7x^2) +17.7x -5', ...
'\n\tse espera un máximo de %d iteraciones y se tiene una tolerancia de %e %%\n', ...
], maxi, tol);


%grafica
xinf = 0; % x l inicial
xsup = 5; % x u inicial
res = 100; %resolucion
stepsize = (xsup-xinf)/res;
xvector = xinf:stepsize:xsup;
yvector = arrayfun(f,xvector);
plot(xvector,yvector,'r','LineWidth',3);
xlabel('Valor de x','FontSize',20);
ylabel('Valor de la funcion','FontSize',20);
title('Grafica de la funcion','FontSize',20);
grid on;

%con base en la grafica, te das cuenta
%que la segunda raiz esta cerca a 0.5
xaprox = 0.5; %
v = [0,2,3.5];

for z = 1:1:length(v)
  xaprox = v(z);
  fprintf('_________________________________________________________________________');  
  fprintf('\n\tRaiz %d',z);  
  fprintf(['\n   i','\t| Xi\t','\t| f(xi)\t','\t| fp(xi)\t','\t| Ea']);  
  eaprox = inf;
  for i = 0:(maxi)
    xold = xaprox;
    f_x = f(xold);
    fp_x = fp(xold);
    
    xaprox = xold - (f(xold)/fp(xold));
  
    fprintf(['\n   %d','\t| %f','\t| %f','\t| %f'],i,xold,f_x,fp_x)
  
    if (i ~= 0)
      eaprox = abs((1-xold/xaprox)*100);
      if (eaprox < 1)
        fprintf('\t| %e %%',eaprox)
      else
        fprintf('\t| %f %%',eaprox)
      end
    else
      fprintf('\t|\t')
    end
  
    if (eaprox < tol)
      break;
    end
  end
  fprintf('\n\nEl valor al que se llego fue de:\n\tx = %f\n\tf(x) = %f\n',xold,f(xold))
end
fprintf('_________________________________________________________________________\n');  