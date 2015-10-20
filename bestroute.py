import numpy as np
import scipy.io

from calcweight import find_n, find_two_list, calc_weight

def dijkstra(a, b, w, start, dest):
    unvisited = []
    dist = {}
    prev = {}
    for node in zip(a,b):
        if node not in unvisited:
            unvisited.append(node)
            dist[node] = float('inf')
            prev[node] = None

    dist[start] = 0

    while len(unvisited) > 0:
        curr_node = min(unvisited, key=unvisited.get)
        unvisited.remove(curr_node)

        neighbors = []
