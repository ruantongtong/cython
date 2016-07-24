"""
>>> import os.path as os_path
>>> module_path = os_path.join(os_path.dirname(__file__), os_path.basename(__file__).split('.', 1)[0])
>>> assert module_path.endswith('annotate_html')
>>> assert os_path.exists(module_path + '.c') or os_path.exists(module_path + '.cpp'), module_path
>>> assert os_path.exists(module_path + '.html'), module_path

>>> with open(module_path + '.html') as html_file:
...     html = html_file.read()

>>> import re
>>> assert re.search('<pre .*def.* .*mixed_test.*</pre>', html)
"""


def mixed_test():
    """docstring
    """
    cdef int int1, int2, int3
    cdef char *ptr1, *ptr2 = "test", *ptr3 = "toast"
    int2 = 10
    int3 = 20
    obj1 = 1
    obj2 = 2
    obj3 = 3
    int1 = int2 + int3
    ptr1 = ptr2 + int3
    ptr1 = int2 + ptr3
    obj1 = obj2 + int3
    return int1, obj1


def add_x_1(int x):
    return x + 1


def add_x_1f(x):
    return x + 1.0


def add_x_large(x):
    return x + 2**30


def add_1_x(x):
    return 1 + x


def add_1f_x(double x):
    return 1.0 + x


def add_large_x(x):
    return 2**30 + x


class PythonClass(object):
    def call(self, x):
        return add_1_x(x)


cdef class ExtensionType(object):
    @classmethod
    def new(cls):
        return cls()
