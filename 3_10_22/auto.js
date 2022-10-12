// el nombre del archivo puede tener directamente el nombre del objeto
// o agregar un archivo dentro de la carpeta con el nombre index.js
// this, se refiere a la propiedad de ESTE objeto
// exportamos el archivo para poder usarlo en otro archivo
export default class Auto {
    constructor(){
    // las propiedades son, peso, velocidad, aceleracion, desaceleracion
        this.peso = 1000;
        this.velocidad = 0;
        this.aceleracion = 2;
        this.desaceleracion = 3;
    }
    //acelerar es un metodo que recibe un intervalo de tiempo y aumenta la velocidad
    // multiplicando la aceleracion por el tiempo y sumandolo a la velocidad
    acelerar(intervalo){
        this.velocidad= this.velocidad + this.aceleracion*intervalo
        console.log("Aceleraste durante "+intervalo+" segundos.")
    }
    // frenar es un metodo que recibe un intervalo de tiempo y disminuye la velocidad   
    // multiplicando la desaceleracion por el tiempo y restandolo a la velocidad
    contracelerar(intervalo){
        this.velocidad= this.velocidad - this.desaceleracion*intervalo
        console.log("Contraceleraste durante "+intervalo+" segundos.")
    }
    // getVelocidad() es un metodo que devuelve la velocidad, usando console.table()
    getVelocidad(){
        //console.table(this.velocidad) // muestra la velocidad en una tabla
        console.log("Tu velocidad actual es de "+this.velocidad)
    }
}
// para conocer el objeto que se está ejecutando es conveniente buscar información en internet

//crearemos un auto llamado auto1



// herencia extend es una palabra reservada para heredar propiedades y metodos de una clase padre
// super() es una palabra reservada para llamar al constructor de la clase padre
// super() debe ser llamado antes de usar this


   