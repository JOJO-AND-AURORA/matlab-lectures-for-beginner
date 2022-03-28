function collections = batch_load(path, varargin)
collections = {};
files = dir(path);
for index = 1:length(files)
    file = files(index);
    if strcmpi(file.name, '.') || strcmpi(file.name, '..')
        continue;
    end
    if ~file.isdir
        if isempty(varargin) || endsWith(file.name, varargin,'IgnoreCase',true)
            % 保存文件路径
            collections = [collections; fullfile(path, file.name)];
        end
    else
        % 递归
        collections = [collections; batch_load(fullfile(path, file.name), varargin{:})];
    end
end