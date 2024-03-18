function write_vtk(filename, verts, faces)
vtkwrite(filename, 'polydata', 'triangle', verts(:,1), verts(:,2), verts(:,3), faces, 'precision', 10);
end