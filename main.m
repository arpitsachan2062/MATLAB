%% main.m  
disp('Running sample MATLAB 3D project (no Simulink needed)...');

% Generate STL cube
generate_cube_stl('stl_cube.stl');

% Visualize cube in MATLAB
visualize_cube('stl_cube.stl');
