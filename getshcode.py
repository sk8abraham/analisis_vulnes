#!/usr/bin/python

#############################################
######## Manzano Cruz Isaias Abraham ########
#############################################

import argparse
import subprocess

def opciones():
    '''
    Funcion que parsea las opciones dadas por comandos
    Devuelve: Valores de verdad por si las banderas fueron activadas y el nombre del binario
    '''
    parser = argparse.ArgumentParser()
    parser.add_argument('-u','--unicode', action='store_true', dest='unicode',help='Formato unicode', default=False)
    parser.add_argument('-n','--entero', action='store_true', dest='entero',help='Formato entero', default=False)
    parser.add_argument('-b','--binario', type=unicode, help='Archivo binario para obtener shellcode', default=None)
    return parser.parse_args()

def verifica(args):
    '''
    Funcion que verifica que las opciones minimas para ejecutar el programa esten presentes, asi como verificar que solo se le pase una bandera al programa
    Recibe: Los argumentos
    Devuelve: None
    '''
    if args.unicode == True and args.entero == True:
        print 'Debes seleccionar solo una opcion'
        exit(1)
    if args.binario == None:
        print 'Debes indicar un binario'
        exit(1)

def obtiene_shellcode(unic, entero, binario):
    '''
    Funcion que obtiene el shellcode de acuerdo lo indicado en los parametros por comandos
    Recibe: unic: bandera que indica que se quiere un formato en uniccode
            entero: bandera que indica que se quiere un formato en entero
            binario: el binario a obtener su shellcode
    Devuelve: None
    '''

    cad = "objdump -d -j .text "+binario+" | grep -e '^ '  | tr '[[:space:]]' '\n' | egrep '^[[:alnum:]]{2}$' | xargs | sed 's/ /\\x/g' | sed -e 's/^/\\x/g'"
    shellcode = subprocess.check_output(cad,shell=True)
    shellcode = shellcode.replace('x','\\x')
    if unic == False and entero == False:
        print shellcode
    elif unic == True:
        shell_unicode = shellcode.replace('\n','').split('\\x')[1:]
        for i in range(len(shell_unicode)):
            shell_unicode[i] += shell_unicode[i]
        print '\\u'+'\\u'.join(shell_unicode)
    elif entero == True:
        shell_entero = shellcode.replace('\n','').split('\\x')[1:]
        print ''.join(shell_entero)

def main():
    '''
    Funcion princial
    '''
    args = opciones()
    verifica(args)
    obtiene_shellcode(args.unicode, args.entero, args.binario)

main()
