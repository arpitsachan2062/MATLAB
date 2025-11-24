function generate_model()
    mdl = "sample_3d_model1";

    % Ensure Simscape Multibody library is on path
    if isempty(which('sm_lib'))
        addpath(fullfile(matlabroot,'toolbox','physmod','sm','sm'));
    end

    % Close model if already loaded
    if bdIsLoaded(mdl)
        close_system(mdl, 0);
    end

    % Delete file if exists
    if isfile(mdl + ".slx")
        delete(mdl + ".slx");
        disp("Existing Simulink model deleted. Recreating...");
    end

    disp("Creating Simulink model: " + mdl);

    new_system(mdl);
    open_system(mdl);

    % Add Simscape Multibody blocks
    add_block('sm_lib/Solver Configuration', mdl+"/Solver", 'Position',[30 30 120 80]);
    add_block('sm_lib/Frames and Transforms/Rigid Transform', mdl+"/Rigid_Transform", 'Position',[200 30 320 80]);
    add_block('sm_lib/Body Elements/Solid', mdl+"/Cube_Solid", 'Position',[400 30 530 120]);
    set_param(mdl+"/Cube_Solid",'GeometryType','File import','FileName','stl_cube.stl');
    add_block('sm_lib/Frames and Transforms/World Frame', mdl+"/World", 'Position',[30 120 120 170]);

    % Connect blocks
    add_line(mdl, 'World/RConn1', 'Rigid_Transform/LConn1');
    add_line(mdl, 'Rigid_Transform/RConn1', 'Cube_Solid/RConn1');

    % Save and close
    save_system(mdl);
    disp("Simulink model created: " + mdl);
    close_system(mdl);

    % Optionally open Mechanics Explorer
    sim(mdl, 'SimulationMode', 'normal');
end
