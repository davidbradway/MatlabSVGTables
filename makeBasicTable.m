function [] = makeBasicTable(a)
if nargin == 0
    a = { [],'A1','B1','C1';
         '1. ','2','3','4';
         '5. ','6','7','8'};

end


%{
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE svg PUBLIC '-//W3C//DTD SVG 1.1//EN' 'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'>
<svg width='100%' height='100%' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'>
    <!-- <svg viewBox="-1, -1, 400, 200" ... -->
    <style type="text/css">
        .c{fill: none; stroke: black; stroke-width:1;}
        .t{font-family:Arial,Helvetica;}
    </style>

    <title>Table 1</title>

    <!-- Start column -->
    <g transform="translate(0,0)"> <!-- Don't move right -->
        <g transform="translate(0,20)"> <!-- Move down -->
            <rect height="20" width="50" x="0" y="0" class="c" />
            <text text-anchor="start" x="2" y="16" class="t">Q1.</text>
        </g>
        <g transform="translate(0,40)"> <!-- Move down -->
            <path d="M0,0h50v20h-50z" class="c" />
            <text text-anchor="start" x="2" y="16" class="t">Q2.</text>
        </g>
        <g transform="translate(0,60)"> <!-- Move down -->
            <path d="M0,0h50v20h-50z" class="c" />
            <text text-anchor="start" x="2" y="16" class="t">Q3.</text>
        </g>
        <g transform="translate(0,80)"> <!-- Move down -->
            <path d="M0,0h50v20h-50z" class="c" />
            <text text-anchor="start" x="2" y="16" class="t">Q4.</text>
        </g>
    </g> <!-- End column -->
    <!-- Start column -->
    <g transform="translate(50,0)"> <!-- Move right -->
        <g transform="translate(0,0)">
            <path d="M0,0h50v20h-50z" class="c" />
            <text text-anchor="start" x="2" y="16" class="t">Sales</text>
        </g>
        <g transform="translate(0,20)"> <!-- Move down -->
            <path d="M0,0h50v20h-50z" class="c" />
            <text text-anchor="start" x="2" y="16" class="t">$223</text>
        </g>
        <g transform="translate(0,40)"> <!-- Move down -->
            <path d="M0,0h50v20h-50z" class="c" />
            <text text-anchor="start" x="2" y="16" class="t">$183</text>
        </g>
        <g transform="translate(0,60)"> <!-- Move down -->
            <path d="M0,0h50v20h-50z" class="c" />
            <text text-anchor="start" x="2" y="16" class="t">$277</text>
        </g>
        <g transform="translate(0,80)"> <!-- Move down -->
            <path d="M0,0h50v20h-50z" class="c" />
            <text text-anchor="start" x="2" y="16" class="t">$402</text>
        </g>
    </g> <!-- End column -->
    <!-- Start column -->
    <g transform="translate(100,0)"> <!-- Move right -->
        <g transform="translate(0,0)">
            <path d="M0,0h80v20h-80z" class="c" />
            <text text-anchor="start" x="2" y="16" class="t">Expenses</text>
        </g>
        <g transform="translate(0,20)"> <!-- Move down -->
            <path d="M0,0h80v20h-80z" class="c" />
            <text text-anchor="start" x="2" y="16" class="t">$195</text>
        </g>
        <g transform="translate(0,40)"> <!-- Move down -->
            <path d="M0,0h80v20h-80z" class="c" />
            <text text-anchor="start" x="2" y="16" class="t">$70</text>
        </g>
        <g transform="translate(0,60)"> <!-- Move down -->
            <path d="M0,0h80v20h-80z" class="c" />
            <text text-anchor="start" x="2" y="16" class="t">$88</text>
        </g>
        <g transform="translate(0,80)"> <!-- Move down -->
            <path d="M0,0h80v20h-80z" class="c" />
            <text text-anchor="start" x="2" y="16" class="t">$133</text>
        </g>
    </g> <!-- End column -->
    <!-- Start column -->
    <g transform="translate(180,0)"> <!-- Move right -->
        <g transform="translate(0,0)">
            <path d="M0,0h50v20h-50z" class="c" />
            <text text-anchor="start" x="2" y="16" class="t">Net</text>
        </g>
        <g transform="translate(0,20)"> <!-- Move down -->
            <path d="M0,0h50v20h-50z" class="c" />
            <text text-anchor="start" x="2" y="16" class="t">$28</text>
        </g>
        <g transform="translate(0,40)"> <!-- Move down -->
            <path d="M0,0h50v20h-50z" class="c" />
            <text text-anchor="start" x="2" y="16" class="t">$113</text>
        </g>
        <g transform="translate(0,60)"> <!-- Move down -->
            <path d="M0,0h50v20h-50z" class="c" />
            <text text-anchor="start" x="2" y="16" class="t">$189</text>
        </g>
        <g transform="translate(0,80)"> <!-- Move down -->
            <path d="M0,0h50v20h-50z" class="c" />
            <text text-anchor="start" x="2" y="16" class="t">$269</text>
        </g>
    </g> <!-- End column -->
</svg>
%}
end
