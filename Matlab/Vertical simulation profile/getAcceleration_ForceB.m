% Upwards acceleration:
% T/r - mg = ma
% k - motor constant

function acc = getAcceleration_ForceB(omega, current, k)
    
    m = getMass();
    W = getEffectiveWeight();
    T = getFrictionalTorque(omega, k);
    r = getSpoolRadius();
    
    acc = (T/r - W) / m;

end