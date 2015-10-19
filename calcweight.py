import numpy as np
import scipy.io

def find_n(l, val, n=1):
    """
    Finds Nth occurence of val in list
    """
    n_temp = 1
    for index, elem in enumerate(l):
        if elem == val:
            if n_temp == n:
                return index
            else:
                n_temp += 1
    return -1

def find_two_list(l1, l2, v1, v2):
    found = False
    switched = False
    n = 1
    lists = {'a': l1, 'b': l2}
    while not found:
        idx_node = find_n(lists['a'], v1, n)
        if idx_node == -1 and not switched:
            # print 'check other one'
            lists = {'a': l2, 'b': l1}
            n = 0
            switched = True
        elif idx_node == -1 and switched:
            print 'something is wrong'
            return -1
        if lists['b'][idx_node] == v2:
            return idx_node
        else:
            n += 1

def calc_weight(a, b, path, W):
    weight = 0
    for node, node_next in zip(path, path[1:]):
        idx_node = find_two_list(a, b, node, node_next)
        print 'time between' , node , 'and' , node_next , 'is' , W[idx_node]
        weight += W[idx_node]
    return weight


if __name__ == '__main__':
    pass
