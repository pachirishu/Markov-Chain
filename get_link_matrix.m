function [Link] = get_link_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Link -> the link matrix associated to the given labyrinth
  
  % Copiem o matrice de adiacenta si initializam matricea Link

  Adj = get_adjacency_matrix(Labyrinth);
  Link = sparse(size(Adj, 1), size(Adj, 2));
    
  % Parcurgem fiecare element al matricei de adiacență.
  for i = 1:size(Adj, 1)
    % Calculăm numărul total de legături pentru nodul i.
    total_links = sum(Adj(i, :));
    for j = 1:size(Adj, 2)
      % Dacă există o legătură între nodul i și nodul j.
      if Adj(i, j) == 1 
        % Calculăm probabilitatea legăturii și o adăugăm în matricea Link.
        Link(i, j) = 1 / total_links;
      endif
    endfor
  endfor

endfunction
