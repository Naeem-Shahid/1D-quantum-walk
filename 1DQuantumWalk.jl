using LinearAlgebra
function qwalk(steps)
    N = steps                                                    #steps
    P = 2 * N + 1                                                #positions
    up = [1 0]                                                   #spin up
    down = [0 1]                                                 #spin down
    upup = transpose(up) .* up                                   #up projector 
    updown = transpose(up) .* down                               #up to down projector 
    downup = transpose(down) .* up                               #down to up projector
    downdown = transpose(down) .* down                           #down projector 
    coin = (upup + updown + downup - downdown) / sqrt(2)         #Hadamard gate
    
    moveright = circshift(Matrix{Int}(I, P, P), (0,1))           #right step
    moveleft = circshift(Matrix{Int}(I, P, P), (0,-1))           #left step
    move = kron(moveright, upup) + kron(moveleft, downdown)      #shift operaor

    evolve = move * (kron(Matrix{Int}(I, P, P), coin))           #unitary evolution operator
    n0ket = zeros(P)                                             #initial positon states
    n0ket[N] = 1                                                 #positon adjustment
    ket0 = kron(n0ket, (transpose(up) + transpose(down) * 1im))  #initial state
    ketN = (evolve^N) * ket0                                     # evolved stated after N steps
    
    prob = zeros(P)                                              #projecting over all states 
    for i in 1:P
        M = 0
        nket = zeros(P)
        nket[i] = 1     
        M = kron((transpose(nket) .* nket), Matrix{Int}(I, 2, 2))
        project = M * ketN
        prob[i] = real.(transpose(conj(project)) * project)[1]
    end
    prob
end
