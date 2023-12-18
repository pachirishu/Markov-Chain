# Markov-Chain
A MATLAB program for discrete-time Markov Chains, enabling custom state transition matrices and steady-state probability calculation.

The program is designed to find the best path for a robot to escape a labyrinth. Using a simple algorithm, it considers the probability of reaching a winning zone by randomly choosing available directions—up, down, left, or right (excluding diagonals). Walls may obstruct movement between adjacent cells. The program evaluates the likelihood of reaching winning exits at the top or bottom, and losing exits on the left or right. The proposed solution efficiently determines the robot's path through the labyrinth, using Markov Chain.

Function Parse_labyrinth:
In this function, we read the dimensions of the labyrinth from a file and then read the labyrinth itself.

Function get_adjacency_matrix:
In this function, we extract the dimensions of the labyrinth to create the adjacency matrix. Next, we add the win and lose nodes to this matrix. Afterward, we traverse the labyrinth with two nested loops and check if there is a wall between the current node and its neighbors or if we are on a matrix edge. If there is no wall between the two nodes, we add it to the adjacency matrix, including the reverse connection between them. After this step, we check if the current position is on the top or bottom edge to see if we have reached the win state or if we are on a side edge to check the lose state. Finally, we establish connections between win and lose states.

Function get_link_matrix:
In this function, we first copy the adjacency matrix of the labyrinth. We calculate the number of appearances of nodes in the adjacency matrix, i.e., how many connections each node has. Then, we divide the probability in the third column by the number of appearances.

Function get_Jacobi_parameters:
In this function, we extract the connections between nodes in the labyrinth (excluding win and lose nodes) into the matrix G, and in the vector c, we extract the connections of the win matrix with the other nodes.

Function perform_iterative:
In this function, we iteratively calculate x considering tolerance and the number of steps, applying the algorithm given in the statement.

Function heuristic_greedy:
In this function, we apply the algorithm described in the statement in pseudocode, traversing the neighboring nodes of the starting point until reaching the win state and using the matrix as a list for nodes.

Function decode_path:
In this function, we extract the rows and columns of positions until exiting the labyrinth and save the data in the decoded_path matrix.
