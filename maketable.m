function [a] = maketable()
a = cell(2,2);
a{1,2} = {'Sales', 'Expenses', 'Net'};
a{2,1} = {'Q1';'Q2';'Q3';'Q4'};
a{2,2} = {'$223', '$195', '$28';
          '$183', '$70',  '$113';
          '$277', '$88',  '$189';
          '$402', '$133', '$269'};

b = cell(3,1);
b{1} = 5;
b{2} = 10;
b{3} = {'1','2','3','4'};
%b

[maxNumRows,maxNumCols,maxHeightRows,maxWidthCols] = recurse(a);
disp(maxNumRows)
disp(maxNumCols)
disp(maxHeightRows)
disp(maxWidthCols)

end










function [maxNumRows,maxNumCols,maxHeightRows,maxWidthCols,widths] = recurse(a)
% Recursive function to find all the rows and columns of nested cell arrays
maxNumCols = 0; maxWidthCols = 0;
for row = 1:size(a,1)
    numCols = 0; widthCols = 0;
    for col = 1:size(a,2)
        widths(col) = 0;
        if iscell(a)
            temp = a{row,col};
        else
            temp = a(row,col);
        end
        % recursively dig into cell array
        if iscell(temp)
            [cellNumRows,cellNumCols,cellHeightRows,cellWidthCols] = recurse(temp);
            numCols = numCols + cellNumCols;
            widthCols = widthCols + cellWidthCols;
            if cellWidthCols > widths(col), width(col) = cellWidthCols; end
        % If string with nnly one line, put in 1 table cell
        elseif ischar(temp) && size(temp,1) == 1
            numCols = numCols + 1;
            [w,h]=stringSize(temp);
            widthCols = widthCols + w;
            if w > widths(col), width(col) = w; end
        elseif prod(size(temp)) > 1
            [cellNumRows,cellNumCols,cellHeightRows,cellWidthCols] = recurse(temp);
            numCols = numCols + cellNumCols;
            widthCols = widthCols + cellWidthCols;
            if cellWidthCols > widths(col), width(col) = cellWidthCols; end
        else %not a string, cell, or array, so 1 number, an empty, or 1 character
            if size(temp,2) == 0
                % Empty
                numCols = numCols + 1; 
            else
                % I think this size should also be 1
                numCols = numCols + size(temp,2);
                if ~ischar(temp), temp=num2str(temp); end
                [w,h]=stringSize(temp);
                widthCols = widthCols + w; 
                if w > widths(col), width(col) = w; end
            end
        end
    end
    % after all the columns of the row, see if this row has the most columns 
    if numCols > maxNumCols, maxNumCols = numCols; end
    if widthCols > maxWidthCols, maxWidthCols = widthCols; end
end

% Find the maximum number of rows used
maxNumRows = 0; maxHeightRows = 0;
% Loop across all columns
for col = 1:size(a,2)
    % Reset the nuumber of rows at the start of each new column
    numRows = 0; heightRows = 0;
    % For each row in the current column...
    for row = 1: size(a,1)
        % Get the contents of the current position
        if iscell(a)
            temp = a{row,col};
        else
            temp = a(row,col);
        end
        % If the contents is another cell array, recursively dig in
        if iscell(temp)
            [cellNumRows,cellNumCols,cellHeightRows,cellWidthCols] = recurse(temp);
            numRows = numRows + cellNumRows;
            heightRows = heightRows + cellHeightRows;
        % If string with nnly one line, put in 1 table cell
        elseif ischar(temp) && size(temp,1) == 1
            numRows = numRows + 1;
            [w,h]=stringSize(temp);
            heightRows = heightRows + h;
        elseif prod(size(temp)) > 1
            [cellNumRows,cellNumCols,cellHeightRows,cellWidthCols] = recurse(temp);
            numRows = numRows + cellNumRows;
            heightRows = heightRows + cellHeightRows;
        else %not a string, cell, or array, so 1 number, an empty, or 1 character
            if size(temp,1) == 0
                % Empty
                numRows = numRows + 1; 
            else
                % I think this size should also be 1
                numRows = numRows + size(temp,1); 
                if ~ischar(temp), temp=num2str(temp); end
                [w,h]=stringSize(temp);
                heightRows = heightRows + h; 
            end
        end
    end
    % after all the rows of the column, see if this column has the most rows 
    if numRows > maxNumRows, maxNumRows = numRows; end
    if heightRows > maxHeightRows, maxHeightRows = heightRows; end
end
end

function [] =  omit()
if(0)
fprintf(['',...
'<?xml version=''1.0'' standalone=''no''?>\n', ...
'<!DOCTYPE svg PUBLIC ''-//W3C//DTD SVG 1.1//EN''\n', ...
'  ''http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd''>\n', ...
'<svg width=''100%%'' height=''100%%'' xmlns=''http://www.w3.org/2000/svg'' xmlns:xlink=''http://www.w3.org/1999/xlink''>\n', ...
'   <title>SVG Table</title>\n', ...
'\n', ...
'   <g id=''rowGroup'' transform=''translate(0, 0)''>\n', ...
'      <rect x=''25'' y=''40'' width=''320'' height=''20'' fill=''gainsboro''/>\n', ...
'      <rect x=''25'' y=''76'' width=''320'' height=''20'' fill=''gainsboro''/>\n', ...
'\n', ...
'      <text x=''30'' y=''30'' font-size=''18px'' font-weight=''bold'' fill=''black'' text-anchor=''right''>\n', ...
'         <tspan x=''100''>Sales</tspan>\n', ...
'         <tspan x=''200''>Expenses</tspan>\n', ...
'         <tspan x=''300''>Net</tspan>\n', ...
'      </text>\n', ...
'\n', ...
'      <text x=''30'' y=''30'' font-size=''18px'' text-anchor=''right''>\n', ...
'         <tspan x=''30'' dy=''1.5em'' font-weight=''bold'' fill=''black'' text-anchor=''start''>Q1</tspan>\n', ...
'         <tspan x=''100''>$ 223</tspan>\n', ...
'         <tspan x=''200''>$ 195</tspan>\n', ...
'         <tspan x=''300''>$ 28</tspan>\n', ...
'      </text>\n', ...
'\n', ...
'      <text x=''30'' y=''30'' font-size=''18px'' text-anchor=''right''>\n', ...
'         <tspan x=''30'' dy=''2.5em'' font-weight=''bold'' fill=''black'' text-anchor=''start''>Q2</tspan>\n', ...
'         <tspan x=''100''>$ 183</tspan>\n', ...
'         <tspan x=''200''>$ 70</tspan>\n', ...
'         <tspan x=''300''>$ 113</tspan>\n', ...
'      </text>\n', ...
'\n', ...
'      <text x=''30'' y=''30'' font-size=''18px'' text-anchor=''right''>\n', ...
'         <tspan x=''30'' dy=''3.5em'' font-weight=''bold'' fill=''black'' text-anchor=''start''>Q3</tspan>\n', ...
'         <tspan x=''100''>$ 277</tspan>\n', ...
'         <tspan x=''200''>$ 88</tspan>\n', ...
'         <tspan x=''300''>$ 189</tspan>\n', ...
'      </text>\n', ...
'\n', ...
'      <text x=''30'' y=''30'' font-size=''18px'' text-anchor=''right''>\n', ...
'         <tspan x=''30'' dy=''4.5em'' font-weight=''bold'' fill=''black'' text-anchor=''start''>Q4</tspan>\n', ...
'         <tspan x=''100''>$ 402</tspan>\n', ...
'         <tspan x=''200''>$ 133</tspan>\n', ...
'         <tspan x=''300''>$ 269</tspan>\n', ...
'      </text>\n', ...
'   </g>\n', ...
'</svg>\n', ...
])
end
end


