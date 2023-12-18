function [Labyrinth] = parse_labyrinth(file_path)
	% file_path -> the relative path to a file that needs to
  %              be loaded_graphics_toolkits
  
  % Labyrinth -> the matrix of all encodings for the labyrinth's walls

  % Deschidem fisierul si citim dimensiunile matricei
  fileID = fopen(file_path, 'r');
  dim = fscanf(fileID, '%d', 2);
  m = dim(1);
  n = dim(2);

  % Initializam matricea cu dimensiunile corespunzatoare
  Labyrinth = zeros(m, n);

  % Citim restul matricei din fisier
  for i = 1:m
      Labyrinth(i, :) = fscanf(fileID, '%d', n);
  endfor

  % Inchidem fisierul
  fclose(fileID);

endfunction
