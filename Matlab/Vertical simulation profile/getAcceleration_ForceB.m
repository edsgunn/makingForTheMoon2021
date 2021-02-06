% Upwards acceleration:
% T/r - mg = ma

function acc = getAcceleration_ForceB(omega, theta, current)
    
    m = getMass();
    W = getEffectiveWeight();
    T = getMotorTorque(omega, current);
    r = getSpoolRadius(theta);
    
    acc = (T/r - W) / m;

end