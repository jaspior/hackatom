# -*- coding: utf-8 -*-
"""hello.py

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1jb6KzEz9xiFSziusn3Tq8Bap7vN4i60n
"""

import sys

def main():
    args = sys.argv
    run_script(args[1],args[2],args[3],args[4])

def run_script(regiao = "default", instalacao = "default", isotopo = "default", ano = "default"):
    name = "mapa_"+regiao+"_"+instalacao+"_"+isotopo+"_"+ano+".py"
    print(name)

if __name__ == "__main__":
    main()