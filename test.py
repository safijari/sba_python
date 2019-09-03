from sba_cpp import SPA2d, Node2d
import numpy as np

s = SPA2d()

"""
Test prep

start at x = 0, y = 0, yaw = 0 (0, 0, 0, 0)
start at x = 1, y = 1, yaw = 0 (1, 1.1, 1.1, 0)
start at x = 0, y = 1, yaw = 0 (2, 0.1, 1.1, 0)
"""

s.add_node(0, 0, 0, 0)
s.add_node(1.1, 1.1, 0, 1)
s.add_node(0.1, 1.1, 0, 2)

s.add_constraint(0, 1, 1.1, 1.1, 0, np.identity(3).tolist())
s.add_constraint(1, 2, -1.1, 0.1, 0, np.identity(3).tolist())
s.add_constraint(2, 0, -0.1, -1.1, 0, np.identity(3).tolist())

s.compute(400, 1.0e-4, True, 1.0e-8, 50)

for n in s.nodes:
    print(n.x, n.y)
