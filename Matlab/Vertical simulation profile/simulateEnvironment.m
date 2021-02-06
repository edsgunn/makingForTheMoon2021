function simulateEnvironment()

    maxTime = 3;        %s
    dt = 0.001;         %s
    time = 0:dt:maxTime;
    x = zeros(length(time),1) - 0.8;
    v = zeros(length(time),1);
    a = zeros(length(time),1);
    
    x(1) = 0;
    
    for i = 2:length(time)
        omega = v(i-1) / getSpoolRadius();
        current = -0.01/(1-0.001 * omega^2);  
        theta = x(i-1) /(2*pi* getSpoolRadius());
        
        if (x(i-1) < -0.8)
            break;
        end

        a(i) = getAcceleration_ForceB(omega, theta, current);
        v(i) = getVelocity_NextInterval(v(i-1), dt, a(i));
        x(i) = getDistance_NextInterval(x(i-1), dt, v(i));
    end
    
    hold on;
    subplot(3,1,1);
    plot(time, a);
    subplot(3,1,2);
    plot(time, v);
    subplot(3,1,3);
    plot(time, x);

end