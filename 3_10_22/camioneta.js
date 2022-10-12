// cada vez que se requiera un componente se debe importar explicitamente
 import Auto from './auto.js' ;

 export default class Camioneta extends Auto {
    constructor(){
        super();
        this.peso = 2000;
        this.aceleracion = 1;
        this.desaceleracion = 2;
    }
 }
 