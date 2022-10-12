import Auto from  './auto.js' ;

let auto1 = new Auto();
// crearemosun auto llamado auto2
//let auto2 = new Auto();
console.table(auto1);
//aceleramos el auto1 por 10 segundos
auto1.acelerar(10);
//auto2.acelerar(5);
// mostraremos la velocidad del auto1
auto1.getVelocidad();
//auto2.getVelocidad();
//frenamos el auto1 por 5 segundos
auto1.contracelerar(5);
// mostraremos la velocidad del auto1
auto1.getVelocidad();

import Camioneta from  './camioneta.js' ;
let Camioneta1 = new Camioneta();
console.table(Camioneta1);
Camioneta1.acelerar(10);
Camioneta1.getVelocidad();
Camioneta1.contracelerar(5);
Camioneta1.getVelocidad();