% Assuming T = k omega cos(theta)
% so some trigonometric function of theta (as theta passes each permanent
% magnet), as well as being proportional to the rotational speed.

function T = getMotorTorque(omega, theta)
    
    k = 1;      %Some motor constant
    T = k * omega * cos(theta);

end