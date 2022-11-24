// Gmsh project created on Tue Sep 13 14:45:37 2022
SetFactory("OpenCASCADE");

river_height = 2;
river_length = 5;

dock1_x = river_length/4;
dock1_length = river_length/20;
dock1_height = river_height/5;

dock2_x = river_length/2;
dock2_length = river_length/20;
dock2_height = 2*river_height/5;

qoi_x = dock1_x + dock1_length;
qoi_length = dock2_x - qoi_x;
qoi_height = dock1_height/2;

lc = 0.1;

Rectangle(1) = {0, 0, 0, river_length, river_height};
Rectangle(2) = {dock1_x, 0, 0, dock1_length, dock1_height};
Rectangle(3) = {dock2_x, 0, 0, dock2_length, dock2_height};

BooleanDifference(4) = { Surface{1}; Delete; }{ Surface{2,3}; Delete; };

Rectangle(5) = {qoi_x, 0, 0, qoi_length, qoi_height};

v() = BooleanFragments{ Surface{4}; Delete; }{ Surface{5}; Delete; };

eps = 1e-3;

c_bank_south() = Curve In BoundingBox{0-eps, -eps, -eps, river_length+eps, eps, eps};
Physical Curve("Bank_south", 1) = {c_bank_south()};

c_dock1() = Curve In BoundingBox{dock1_x-eps, -eps, -eps, dock1_x + dock1_length+eps, dock1_height+eps, eps};
c_dock2() = Curve In BoundingBox{dock2_x-eps, -eps, -eps, dock2_x + dock2_length+eps, dock2_height+eps, eps};
Physical Curve("Docks", 2) = {c_dock1(),c_dock2()};

c_outlet() = Curve In BoundingBox{river_length-eps, -eps, -eps, river_length+eps, river_height+eps, eps};
Physical Curve("Outlet", 3) = {c_outlet()};

c_bank_north() = Curve In BoundingBox{-eps, river_height-eps, -eps, river_length + eps, river_height+eps, eps};
Physical Curve("Bank_north", 4) = {c_bank_north()};

c_inlet() = Curve In BoundingBox{-eps, -eps, -eps, eps, river_height+eps, eps};
Physical Curve("Inlet", 5) = {c_inlet()};

p_top_dock() = Point In BoundingBox{dock1_x-eps, dock1_height-eps, -eps, dock2_x + dock2_length +eps, dock2_height+eps, eps};

p_bottom_dock() = Point In BoundingBox{dock1_x-eps, -eps, -eps, dock2_x + dock2_length +eps, qoi_height + eps, eps};

Physical Surface("Domain",6) = {v(0),v(1)};

MeshSize {p_top_dock()} = lc / 20;
MeshSize {p_bottom_dock()} = lc / 10;

Field[1] = Distance;
Field[1].CurvesList = {Physical Curve{5}};
Field[1].Sampling = 100;

Field[2] = Threshold;
Field[2].InField = 1;
Field[2].SizeMin = lc / 10;
Field[2].SizeMax = lc;
Field[2].DistMin = 0;
Field[2].DistMax = 4*dock1_x/5;

Background Field = 2;