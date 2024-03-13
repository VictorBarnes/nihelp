function out = calcVertexDist(verts, faces)
%% CALCVERTEXDIST average distance from vertex to each of its neighours
%% Examples
%   [x,y]=meshgrid(1:10); z=zeros(size(x)); v=[x(:),y(:),z(:)]; f=delaunay(x,y); a=calcVertexDist(v,f); figure; patch('Vertices', v, 'Faces', f, 'FaceColor', 'interp', 'FaceVertexCData', a);
%   [x,y]=meshgrid((1:10).^2); z=x+y; v=[x(:),y(:),z(:)]; f=delaunay(x,y); a=calcVertexDist(v,f); figure; patch('Vertices', v, 'Faces', f, 'FaceColor', 'interp', 'FaceVertexCData', a);
%   [x,y]=meshgrid(1:20); z=peaks(20); v=[x(:),y(:),z(:)]; f=delaunay(x,y); a=calcVertexDist(v,f); figure; patch('Vertices', v, 'Faces', f, 'FaceColor', 'interp', 'FaceVertexCData', a);
%   [v,f] = sphereMesh; a = calcVertexDist(v,f); figure; patch('Vertices',v,'Faces',f,'FaceColor','interp','FaceVertexCData',a); colorbar;  
% 
% 
% 
%% TODO
% * docs
% 
% 
%% Authors
% Mehul Gajwani, Monash University, 2024
% 
% 


out = nan(length(verts), 1);

for ii = 1:length(verts) % loop over all vertices
    currentFaces = any(faces == ii, 2); % get all faces containing current vertex
    currentVerts = unique(faces(currentFaces, :)); % all the adjacent verts
    currentVerts(currentVerts==ii) = [];
    out(ii) = mean(pdist2(verts(ii, :), verts(currentVerts, :)));
end

end
