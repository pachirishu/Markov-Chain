function [path] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix
	
	% path -> the states chosen by the algorithm

	% numărul de noduri (fără stările WIN și LOSE)
	n = length(probabilities); 
	path = [start_position];
	% inițial toate nodurile sunt nevizitate
	visited = false(n, 1); 
	% marcam nodul de start ca fiind vizitat
	visited(start_position) = true; 
		
	while ~isempty(path)
		position = path(end);
		% daca am ajuns la starea de WIN
		if position == n - 1 
			return;
		endif
		% gasim vecinii nodului curent
		neighbours = find(Adj(position, :)); 
		% gasim vecinii nevizitati
		unvisited_neighbours = setdiff(neighbours, find(visited));
		% daca nu avem vecini nevizitati
		if isempty(unvisited_neighbours) 
			% stergem nodul curent din cale
			path(end) = []; 
		else
			% alegem vecinul cu probabilitatea cea mai mare de a ajunge la 
			% starea de WIN
			[~, idx] = max(probabilities(unvisited_neighbours));
			neigh = unvisited_neighbours(idx);
			visited(neigh) = 1; % marcam vecinul ca fiind vizitat
			path = [path, neigh]; % adaugam vecinul in cale
		endif
	endwhile
	
endfunction
