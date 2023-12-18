function [Adj] = get_adjacency_matrix (Labyrinth)

	% Labyrinth -> the matrix of all encodings
  
  % Adj -> the adjacency matrix associated to the given labyrinth
  
  % obtinem dimensiunile din Labyrinth si cream matricea sparse Adj
  [n, m] = size(Labyrinth);
  Adj = sparse(n*m+2, n*m+2);
  
  % Adaugăm nodurile de start și de final în matricea de adiacență
  start = n*m+1;
  finish = n*m+2;
  Adj(start, :) = 0;
  Adj(:, finish) = 0;
  
  for i = 1:n
      for j = 1:m
          index = (i - 1) * m + j;
          
          % verificăm vecinul de sus
          if i > 1 && bitand(Labyrinth(i, j), 8) == 0
              neighbor_index = (i-2)*m + j;
              Adj(index, neighbor_index) = 1;
              Adj(neighbor_index, index) = 1;
          endif
  
          % verificăm vecinul din stânga
          if j > 1 && bitand(Labyrinth(i, j), 1) == 0
              neighbor_index = (i-1)*m + j-1;
              Adj(index, neighbor_index) = 1;
              Adj(neighbor_index, index) = 1;
          endif
  
          % verificăm vecinul de jos
          if i < n && bitand(Labyrinth(i, j), 4) == 0
              neighbor_index = i*m + j;
              Adj(index, neighbor_index) = 1;
              Adj(neighbor_index, index) = 1;
          endif
  
          % verificăm vecinul din dreapta
          if j < m && bitand(Labyrinth(i, j), 2) == 0
              neighbor_index = (i-1)*m + j+1;
              Adj(index, neighbor_index) = 1;
              Adj(neighbor_index, index) = 1;
          endif
          % verificam daca suntem pe prima sau ultima linie si 
          % adaugam legaturi cu win si lose
          if i == 1
            Adj(index, start) = bitand(Labyrinth(i, j), 8) == 0;
          elseif i == n
            Adj(index, start) = bitand(Labyrinth(i, j), 4) == 0;
          endif

          % verificam daca suntem pe prima sau ultima coloana si 
          % adaugam legaturi cu win si lose
          if j == 1
            Adj(index, finish) = bitand(Labyrinth(i, j), 1) == 0;
          elseif j == m
            Adj(index, finish) = bitand(Labyrinth(i, j), 2) == 0;
          endif
      endfor
  endfor
  
  % adaugam legaturile lui win si lose cu ele
  Adj(start, start) = 1;
  Adj(finish, finish) = 1;
  
endfunction
  
  