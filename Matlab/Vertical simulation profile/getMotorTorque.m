% Assuming T = I k omega cos(theta)
% so some trigonometric function of theta (as theta passes each permanent
% magnet), as well as being proportional to the rotational speed.

function T = getMotorTorque(omega, current)
    
    k = 0.01;      %Some motor constant
    T = current * k * omega;    %As a rough approximation, not including theta

end

% Use RMS Torque measurements?