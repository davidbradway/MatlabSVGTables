function [lines] = svgNewColumn(x,width,rowVector)
    lines = [svgStartColumn()];
    for i=1:length(rowVector)
        lines = [lines,svgMoveBox(x,0,svgMoveBox(0,i*20,svgDrawbox(width,rowVector(i))))];
    end
    lines = [lines,svgEndColumn()];
end
