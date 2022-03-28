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
            % �����ļ�·��
            collections = [collections; fullfile(path, file.name)];
        end
    else
        % �ݹ�
        collections = [collections; batch_load(fullfile(path, file.name), varargin{:})];
    end
end