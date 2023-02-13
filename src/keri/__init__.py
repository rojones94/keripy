# -*- encoding: utf-8 -*-

__version__ = '0.6.9'  # also change in setup.py


import os


SRC_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PROJECT_ROOT_DIR = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
STATIC_DIR = os.path.join(PROJECT_ROOT_DIR, 'static')