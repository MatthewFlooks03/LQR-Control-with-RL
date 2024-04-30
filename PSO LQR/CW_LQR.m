function dState = CW_LQR(~, y)
a = 7500;
mu = 3.986e5;

n = sqrt(mu/a^3);

A = [  0,   0,   0,   1,   0,   0;
       0,   0,   0,   0,   1,   0;
       0,   0,   0,   0,   0,   1;
   3*n^2,   0,   0,   0, 2*n,   0;
       0,   0,   0,-2*n,   0,   0;
       0,   0,-n^2,   0,   0,   0];

B = [ 0, 0, 0;
      0, 0, 0;
      0, 0, 0;
      1, 0, 0;
      0, 1, 0;
      0, 0, 1];

Q = diag([1 1 1 1 1 1]);
R = diag([1 1 1]);

[K,~,~] = lqr(A,B,Q,R);

u = -K*y;

dState = A*y + B*u;

end