class Perceptron{
    constructor(){
        this.weights = new Array(2);
        for(let i = 0; i < this.weights.length; i++){
            this.weights[i] = random(-1, 1);
        }
    }
    guess(inputs){
        let sum=0
        for(let i=0; i<this.weights.length; i++){
            sum += inputs[i]*this.weights[i];
        }
        let output = this.sign(sum);
        return output;
    }
    //función de activación
    sign(n){
        if(n>=0){
            return 1;
        }else{
            return -1;
        }
    }
    }
