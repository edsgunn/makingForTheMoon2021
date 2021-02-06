% v_n being the velocity at a given interval in time
% v_np1 being that at the next interval (v_n plus 1)
% a_n being the acceleration at a given point in time.

function v_np1 = getVelocity_NextInterval(v_n, dt, a_n)

    v_np1 = v_n + a_n * dt;

end