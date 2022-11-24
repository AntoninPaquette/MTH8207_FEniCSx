SetFactory("OpenCASCADE");

L = 1;
x0 = 0.4;
x1 = 0.2;
x2 = 0.6;

Point(1) = {0, 0, 0};
Point(2) = {x1, 0, 0};
Point(3) = {x0, 0, 0};
Point(4) = {x2, 0, 0};
Point(5) = {L, 0, 0};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};

Physical Point("left", 1) = {1};
Physical Point("x1", 2) = {2};
Physical Point("x0", 3) = {3};
Physical Point("x2", 4) = {4};
Physical Point("right", 5) = {5};

Physical Curve("domain", 6) = {1,2,3,4};

