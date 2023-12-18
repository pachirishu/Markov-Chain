function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns
	
	% decoded_path -> vector of pairs (line_index, column_index)
	%                 corresponding to path states
	% hint: decoded_path does not contain indices for the WIN state

	% Inițializăm matricea de perechi
	decoded_path = zeros(length(path)-1, 2);

	% Parcurgem calea și decodificăm fiecare element
	for i = 1:length(path)-1
    	% Obținem coordonatele (linia, coloana) pentru celula codificata
		row = 1;
		col = 1;
		% Cat timp indicele este mai mare decat coloana, avem linii in plus
		while path(i) > cols
			row = row + 1;
			path(i) = path(i) - cols;
		endwhile
		col = path(i);
    	% Salvăm coordonatele în matricea de perechi
    	decoded_path(i, 1) = row;
    	decoded_path(i, 2) = col;
	endfor

endfunction