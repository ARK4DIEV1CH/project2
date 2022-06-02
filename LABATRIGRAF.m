clear
f1=ezplot('sin(x)')
set(f1,'color',[0.2 0.9 0.2])% установка цвета в формате RGB
hold on
f2=ezplot('cos(x)')
set(f2,'color',[0.2 0.2 0.9])
title('sin(x) & cos(x)')
%%
%Задание 2. Опорные точки на графике
clear
f1=ezplot('sin(x)')
set(f1,'color',[0.2 0.2 0.9])
hold on
x=[-2*pi:0.3:2*pi]
y=sin(x)
f2=plot(x,y,'r*')
title('sin(x)')

%%
%Задание 3. Установка типа точек с помощью set
clear
f1=ezplot('sin(x)')
set(f1,'color',[0.2 0.2 0.9])
hold on
x=[-2*pi:0.3:2*pi]
y=sin(x)
f2=plot(x,y, '*')
set(f2,'color',[0.9 0.2 0.2], 'Marker','o')
title('sin(x)')

%%
%Задание 4. Установка толщины линии с помощью set
clear
f1=ezplot('sin(x)')
set(f1,'LineWidth',2)
title('sin(x)')

%%
%Задание 5. Установка размера шрифта, толщины осевых линий
clear
f=ezplot('sin(x)')
set(gca, 'FontSize', 16, 'LineWidth',0.7)
set(f,'LineWidth',2)
title('Function sin(x)')

%%
%Задание 6. Установка параметров осей с помощью set
clear
hAxes = gca;
f1=ezplot('sin(x)')
set(f1,'LineWidth',2)
title('sin(x)')
set(gca,'Color',[0.9,0.9,0.9])
set( hAxes, 'xtick', [ -4, 0, 4 ], 'ytick', [ -1, 0, 1 ])

%%
%{
Задание 7. Интерактивное добавление текста на графике
Команда gtext позволяет добавить заданный текст в графическое окно
посредством щелчка мыши в нужной точке. 
%}
clear
f1=ezplot('sin(x)')
gtext('Лабораторная работа №3. Задание #7')

%%
%Задание 8. Команда stem проводит вертикальные линии от оси ox до значений
clear
figure
x = 0:30;
y = [1.5*cos(x);4*exp(-.1*x).*cos(x);exp(.05*x).*cos(x)]';
h = stem(x,y);
set(h,{'Marker'},...
 {'o';'square';'*'})

%%
%Задание 9. Вывод на экран свойств графического окна
clc
clear
get(gca)

%%
%Задание 10. Изменение графиков с помощью панели инструментов окна Figure
%Постройте график
clear
f1=ezplot('sin(x)');

%%
%{
Задание 11. Извлечение численных данных из файла fig
Постройте график sin(x), сохраните как graph.fig (любой файл fig), то из него можно
получить вектора XData и YData, по которым возможно заново построить график.
%}
clear
f1=ezplot('sin(x)');
% загружаем в указатель hfig
hfig = hgload('graph.fig');
%у него в потомках axes (если axes один)
haxe=get(hfig,'Children');
%у haxe в потомках линия (если график линия и она одна)
hline=get(haxe,'Children');
%у hline данные, по которым линия построена,
x=get(hline,'XData');
y=get(hline,'YData');
figure(112)
plot(x,y)
title('Восстановленный из fig')

%%
%Задание 12. Извлечение численных данных из файла fig и сохранение в
%текстовый файл.
% загружаем в указатель hfig
hfig = hgload('graph.fig')
%у него в потомках axes (если axes один)
haxe=get(hfig,'Children')
%у haxe в потомках линия (если график линия и она одна)
hline=get(haxe,'Children')
%у hline данные, по которым линия построена,
x=get(hline,'XData')
y=get(hline,'YData')
dlmwrite('xdata.txt',x)
dlmwrite('ydata.txt',y)

%%
%Задание 13. Чтение из текстового файла и запись в переменные MatLab и
%построение графика по этим данным
clear
clc
figure
x=load('xdata.txt')
y=load('ydata.txt')
plot(x,y)
title('График, построенный по данным, считанным из текстовых файлов')

%%
%{
Задание 14. Построим график функции z = x * exp(-x2 - y2) в трехмерном
пространстве.
MESHGRID - формирование двумерных массивов X и Y
PLOT3 - построение линий и точек в трехмерном пространстве 
%}
clear
clc
figure
[ X, Y ] = meshgrid([ -2 : 0.1 : 2 ]);
Z = X .* exp(- X .^ 2 - Y .^ 2);
plot3(X, Y, Z)

%%
%{
Задание 15. Построим трехмерную поверхность функции z = x * exp(-x2 - y2),
отобразим шкалу.
SURFL - затененная поверхность с подсветкой
COLORBAR - шкала палитры
%}
[ X, Y ] = meshgrid([ -2 : 0.1 : 2 ]);
Z = X.*exp(- X .^ 2 - Y .^ 2);
surf(X, Y, Z)
cbar = matlab.graphics.illustration.ColorBar;

%%
%Задание 16. Построим изображение функции peaks, используя подсветку
[X, Y] = meshgrid(-3 : 1/8 : 3);
Z = peaks(X, Y);
surfl(X, Y, Z)
shading interp

%%
%Задание 17. Изучите справку по следующим функциям.
%Придумайте и выполните по одному примеру для каждой функции.
%%
%столбцовые диаграммы
clear
x = 2010:1:2020;
y = [105 125 131 150 179 189 203 210 226 249 266];
bar(x,y, 'm')

%%
%строит график функции y 
% в зависимости от x с указанием интервала погрешности
clear
x = 1 : 10;
y = sin(x);
z = cos(y);
errorbar(x, y, z, 'k-.')

%%
%количество элементов массива y, 
%значения которых попадают в заданный интервал (гистограмма)
clear
x = -10 : 0.01 : 10;
y = randn(1000,1);
histogram(y, x)

%%
%выводит график элементов одномерного массива y в виде вертикальных линий
clear
figure;
Y = linspace(-2*pi,2*pi,50);
stem(Y)

%%
%ступенчатый график
clear
t = 0 : 0.25 : 10;
stairs(t, cosh(t))

%%
%подсчитывают и отображают на графике 
% количество угловых элементов в массиве
clear
wdir = [30 90 60 45 360 335 360 270 335 270 335 300];
wdir = wdir * pi/90;
rose(wdir)

%%
%функция компаса (x, y) рисует векторный граф стрелок, 
% составленный из (x, y) из начала координат
clear
x=5:10
y=10:15
compass(x,y,'--m')

%%
%выводит график комплексных элементов 
%одномерного массива z в виде векторов-стрелок
clear
t = 0 : 0.05 : 10;
s = 0.05 + i;
z = exp(s * t);
feather(z)

%%
%формирует и выводит на экран поле градиентов функции 
% в виде стрелок для каждой пары элементов массивов X и Y
clear
x = -2:.2:2;
y = -1:.2:1;
[X, Y] = meshgrid(x, y);
z = sin(-X.^2 - Y.^2);
[dx, dy] = gradient(z, .2, .2);
quiver(X, Y, dx, dy, 'filled')

%%
%строит график зависимости y(х) 
% постепенно во времени в виде траектории кометы
clear
t = 0:0.01:100;
x = exp(5*t);
y = sin(4*t).*cos(2*t);
comet(x,y)

%%
%закрашивает многоугольник, заданный одномерными массивами x, y
t = -2:.2:2;
x = sin(t);
y = cos(t);
fill(x, y, 'b')

%%
%движение точки по пространственной траектории 
t = -10*pi:pi/100:10*pi;
p = 0.015;
comet3(sin(6*t), cos(2*t), t, p)

%%
%сечения функции от трех переменных
x = -2 : .2 : 2;
y = -2 : .25 : 2;
z = -2 : .16 : 2;
[X, Y, Z] = meshgrid(x, y, z);
V = X.*(X .^2 + Y .^2 - Z .^2 - 1);
slice(x, y, z, V, [2], [2], [-1.2 -0.8 0.0 0.8 1.2])

%%
%трехмерная поверхность 
[X,Y,Z] = peaks(100);
Z = sin(X) + cos(Y);
waterfall(X,Y,Z)

%%
%закраска многоугольника в трехмерном пространстве
clear
X = [1 1; 1 2; 1 1];
Y = [2 1; 1 0; 0 0];
Z = [1 3; 1 0; 1 9];
fill3(X, Y, Z, 'b')

%%
%{
Задание 18. Найдите в Интернете или придумайте самостоятельно функции,
графики которых (2d и 3d) красивые и необычные. Выполните для этих функций
задания 2,4,6,7, 14-16.
%}
clear
f1 = ezsurf('sqrt(x.*x+y.*y)+3*cos(sqrt(x.*x+y.*y))+5')
set(f1,'LineWidth',1.5)
hAxes = gca;
set( hAxes, 'xtick', [ -5, 0, 5 ], 'ytick', [ -5, 0, 5 ], 'ztick', [ -10, 0, 10 ])
%%
figure
[ X, Y ] = meshgrid([ -10 : 0.1 : 10 ]);
Z = sqrt(X.*X+Y.*Y)+3*cos(sqrt(X.*X+Y.*Y))+5;
plot3(X, Y, Z)
%%
figure
[ X, Y ] = meshgrid([ -10 : 0.1 : 10 ]);
Z = sqrt(X.*X+Y.*Y)+3*cos(sqrt(X.*X+Y.*Y))+5;
surf(X, Y, Z)
colorbar

Z = peaks(X, Y);
surfl(X, Y, Z)
shading interp
%%
clear
hAxes = gca;
f1=ezplot('(sin(x.*(sin(x))).*sqrt(x))/cos(x)')
set(f1,'color', [0.5 0.8 0.6])
hold on
x = [-2*pi:0.3:2*pi]
y = (sin(x.*(sin(x))).*sqrt(x))/cos(x)
f2 = plot(x,y,'k*')
set(f1,'LineWidth',5)
set(gca,'Color',[0.9,0.9,0.9])
set( hAxes, 'xtick', [ -3, 0, 3 ], 'ytick', [ -1, 0, 1 ])
gtext('Лабораторная работа №3. Задание #18')
