function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	% G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations
	
	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed

    % Initializare variabile
    x = x0;
    n = length(x);
    err = inf;
    steps = 0;

    % Executam algoritmul iterativ
    while err > tol && steps < max_steps
        % Actualizam solutia
        x_nou = G * x + c;
        
        % Calculam eroarea relativa
        err = norm(x_nou - x);
        
        % Actualizam solutia si numarul de pasi
        x = x_nou;
        steps = steps + 1;
    endwhile
   
endfunction
