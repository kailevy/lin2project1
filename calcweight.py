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
    """
    Finds two matching values in two lists
    """
    found = False
    switched = False
    n = 1
    lists = {1: l1, 2: l2}
    while not found:
        # finds the index of the nth occurence of the value in the first list
        idx_node = find_n(lists[1], v1, n)
        if idx_node == -1 and not switched:
            # can't find it in first list; switch and reset N
            lists = {1: l2, 2: l1}
            n = 1
            switched = True
        elif idx_node == -1 and switched:
            # can't find value in either list..
            # print 'something is wrong'
            return -1
        if lists[2][idx_node] == v2:
            # the index of the first value in the first list matches the second
            # value in the second list
            return idx_node
        else:
            # increment n so we can check the next value
            n += 1

def calc_weight(a, b, path, W):
    """
    Calculated the weight of a given path, and with two lists representing the graph a and b
    where the weight between nodes are given by W
    This may be defective?
    """
    weight = 0
    for node, node_next in zip(path, path[1:]):
        idx_node = find_two_list(a, b, node, node_next)
        # print 'time between' , node , 'and' , node_next , 'is' , W[idx_node]
        weight += W[idx_node]
    return weight


if __name__ == '__main__':
    pass
