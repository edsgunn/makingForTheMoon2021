% Upwards acceleration:
% T/r - mg = ma

function acc = getAcceleration_ForceB(omega, theta, current, x_n, minX)
    
    m = getMass();
    W = getEffectiveWeight();
    T = getMotorTorque(omega, current);
    r = getSpoolRadius(theta);
    
    if (x_n < minX)
        acc = 0;
        return;
    end
    
    acc = (T/r - W) / m;

end