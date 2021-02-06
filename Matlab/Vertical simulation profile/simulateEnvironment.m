function simulateEnvironment()

    k = 0.01;

    maxTime = 3;        %s
    dt = 0.001;         %s
    time = 0:dt:maxTime;
    current = zeros(length(time), 1);
    x = zeros(length(time),1) - 0.8;
    v = zeros(length(time),1);
    a = zeros(length(time),1);
    
    x(1) = 0;
    
    for i = 2:length(time)
        omega = v(i-1) / getSpoolRadius();
        current(i-1) = -0.01/(1-0.00001 * omega^3);
        theta = x(i-1) /(2*pi* getSpoolRadius());
        
        if (x(i-1) < -0.8)
            break;
        end

        a(i-1) = getAcceleration_ForceB(omega, theta, current(i-1),k);
        v(i) = getVelocity_NextInterval(v(i-1), dt, a(i-1));
        x(i) = getDistance_NextInterval(x(i-1), dt, v(i));
    end
    
    hold on;
    subplot(4,1,1);
    plot(time, a);
    xlabel('time');
    ylabel('a');
    subplot(4,1,2);
    plot(time, v);
    xlabel('time');
    ylabel('v');
    subplot(4,1,3);
    plot(time, x);
    xlabel('time');
    ylabel('x');
    subplot(4,1,4);
    plot(time, current);
    xlabel('time');
    ylabel('I');

end

function simulateEnvironment_It2()

    dk = 0.005;
    k = dk:dk:0.5;

    maxTime = 7;        %s
    dt = 0.001;         %s
    time = 0:dt:maxTime;
    x = zeros(length(time), length(k)) - 0.8;
    v = zeros(length(time), length(k));
    a = zeros(length(time), length(k));
    
    
    for j = 1:length(k)
        x(1,j) = 0;   
        for i = 2:length(time)
            omega = v(i-1,j) / getSpoolRadius();
            current = -0.01/(1-0.001 * omega^2);  
            theta = x(i-1,j) /(2*pi* getSpoolRadius());
        
            if (x(i-1,j) < -0.8)
                break;
            end

            a(i-1,j) = getAcceleration_ForceB(omega, theta, current, k(j));
            v(i,j) = getVelocity_NextInterval(v(i-1,j), dt, a(i-1,j));
            x(i,j) = getDistance_NextInterval(x(i-1,j), dt, v(i,j));
        end
    end   
    
    hold on;
    subplot(3,1,1);
    mesh(k, time, a);
    xlabel('k');
    ylabel('time');
    zlabel('a');
    subplot(3,1,2);
    mesh(k, time, v);
    xlabel('k');
    ylabel('time');
    zlabel('v');
    subplot(3,1,3);
    mesh(k, time, x);
    xlabel('k');
    ylabel('time');
    zlabel('v');
    subplot(4,1,4);
    plot(time, current);
    xlabel('time');
    ylabel('I');

end
