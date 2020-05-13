
#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
//
#include "xil_io.h"
#include "xil_types.h"
#include "math.h"

#define GPIO_AUD 0x41210000
#define GPIO_LED 0x41200000

#define FACTORD 100000

#define PI 3.14159265
#define scale 32767

u16 val = 0;


int main()
{
    init_platform();

    //print("Hello World\n\r"); //hara mucha diferencia??
    int i = 0; 							//iterador
    double res_seno = 0; 				//resultado del seno, del tipo double
    unsigned int val = 0;				//se usa este tipo de dato porque es de 16 bits (2 bytes) como el GPIO
       int freq = 2000;					//frecuencia de la señal
       int ts=1;						//el tiempo de muestro lo determina el reloj del CPU, I guess
       double rads = PI / 180;			//factor para convertir a radianes
       while(1)
       {
    	int j=0;
    	for(j=0;j<FACTORD;j++){} //delay para ts
    	   i++;
       double oper = rads*(2*PI*freq*i*ts); //el valor de la operación debe convertirse a radianes
       res_seno = (1+(sin(oper*rads)))*(scale);		//la función sin, recibe un double en radianes y regresa un double
       	   	   	   	   	   	   	   	   	   	   	   	//ya que su salida, son valores del 0 al 1, se le suma un 1 para quitar el negativo
       	   	   	   	   	   	   	   	   	   	   	   	//y se escala a la mitad de mi valor total de bits, para que ocupe toda la resolución
       val = res_seno;					//aquí se realiza una conversión implicita de double a unsigned int
       //Xil_printf("%f,", res_seno);
       Xil_Out16(GPIO_AUD, val);
       //xil_printf("%i\n", val);			//salida de debug
    }


    cleanup_platform();
    return 0;
}
 
