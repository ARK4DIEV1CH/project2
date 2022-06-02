from sympy import *
import random
from time import time


f = open('filesympy.txt', 'w+')

x = symbols('x')
a = 3

x1 = [random.random()*random.randint(-50,50) for i in range(100)]
x2 = [random.random()*random.randint(-50,50) for i in range(100)]
f1 = open('limits.txt','w+')
for i in range(100):
    f1.write(str(x1[i])+' '+str(x2[i])+'\n')
f1.close()
startime = time()

I = integrate(exp(a*x))
f.write('integrate(exp(a*x)) = ' + str(I) + '\n'+ '\n'+ '\n')

for i in range(100):
    I= integrate((exp(a*x)), (x, x1[i], x2[i])).evalf()
    f.write('integrate('+str(x1[i])+")("+str(x2[i])+')(exp(a*x)) = '+str(float(I)) + '\n'+ '\n')

f.write('\n'+'  Time: ' + str(time() - startime))
f.close()
