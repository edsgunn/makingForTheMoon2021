% Includes the moment of inertia elements as well (eventually)

function W = getEffectiveWeight()
    g = 1.625;  %ms^-1
    W = g * getMass();
end