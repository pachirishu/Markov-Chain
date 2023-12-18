function [G, c] = get_Jacobi_parameters (Link)
	% Link -> the link matrix (edge with probabilities matrix)
	
  % G -> iteration matrix
	% c -> iteration vector
	
  n = size(Link, 1) - 2;

  % Initializam matricea rara G si vectorul rare c cu valorile implicite
  G = sparse(n, n);
  c = sparse(n, 1);

  % Parcurgem matricea rare Link si actualizam matricea rara G si vectorul rare c
  for i = 1:n
    % Extragem linia i din matricea Link
    row = Link(i, :);
    
    % Calculam suma elementelor de pe linia i (numarul total de legaturi)
    num_links = sum(row);
    
    % Parcurgem toate coloanele liniei i
    for j = 1:n
        % Daca exista o legatura de la nodul i la nodul j
        if row(j) > 0
            % Adaugam coeficientul corespunzator in matricea rara G
            G(i, j) = row(j) / num_links;
        endif
    endfor
    
    % Daca nodul i este un nod de iesire (win)
    if row(end-1) > 0
        % Adaugam coeficientul corespunzator in vectorul rare c
        c(i,1) = row(end-1) / num_links;
    endif
  endfor
endfunction
