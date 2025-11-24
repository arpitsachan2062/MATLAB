function generate_cube_stl(filename)
    % Generate a simple cube and save as STL
    [faces, vertices] = createCube();
    TR = triangulation(faces, vertices);
    stlwrite(TR, filename);
    disp(['Created 3D STL cube file: ' filename]);
end

function [faces, vertices] = createCube()
    % Vertices of a unit cube
    vertices = [
         0 0 0;
         1 0 0;
         1 1 0;
         0 1 0;
         0 0 1;
         1 0 1;
         1 1 1;
         0 1 1
    ];

    % Faces of the cube
    faces = [
         1 2 3; 1 3 4;  % bottom
         5 6 7; 5 7 8;  % top
         1 5 8; 1 8 4;  % left
         2 6 7; 2 7 3;  % right
         4 3 7; 4 7 8;  % front
         1 2 6; 1 6 5   % back
    ];
end
