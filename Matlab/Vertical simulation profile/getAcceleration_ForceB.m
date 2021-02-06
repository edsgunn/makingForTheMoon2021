% Upwards acceleration:
% T/r - mg = ma
% k - motor constant

function acc = getAcceleration_ForceB(omega, theta, current, k)
    
    m = getMass();
    W = getEffectiveWeight();
    T = getMotorTorque(omega, current, k);
    r = getSpoolRadius(theta);
    
    acc = (T/r - W) / m;

end