function visualize_cube(filename)
    % Read STL file
    fv = stlread(filename);  % returns struct with faces & vertices or triangulation
    
    figure('Name','3D Cube Visualization');

    % If triangulation object
    if isa(fv, 'triangulation')
        faces = fv.ConnectivityList;
        vertices = fv.Points;
        patch('Faces', faces, 'Vertices', vertices, ...
              'FaceColor',[0.5 0.5 1], 'EdgeColor','k');
    
    % If struct with fields 'faces' and 'vertices'
    elseif isstruct(fv)
        patch('Faces', fv.faces, 'Vertices', fv.vertices, ...
              'FaceColor',[0.5 0.5 1], 'EdgeColor','k');
    
    else
        error('Unsupported STL format.');
    end

    axis equal
    xlabel('X'); ylabel('Y'); zlabel('Z');
    view(3)
    grid on
    title('3D Cube Visualization');
end
