% Assuming T = I k omega cos(theta)
% so some trigonometric function of theta (as theta passes each permanent
% magnet), as well as being proportional to the rotational speed.
% k is some sort of motor constant

function T = getMotorTorque(omega, current, k)
        
    T = current * k;    %As a rough approximation, not including theta

end

% Use RMS Torque measurements?