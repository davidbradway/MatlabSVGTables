function [widthPixels,heightPixels] = stringSize(stringIn,varargin)
% function [widthPixels,heightPixels] = stringSize(stringIn,varargin)
% INPUTS: stringIn - input character array for which to fine the width and height
%         varargin - name,value pairs for any of the uicontrol parameters to override, including FontName and FontSize (Arial 12 is used by default)
persistent fig1 u;

if isempty(fig1)
    fig1=figure('Visible','off');
    u = uicontrol('Parent',fig1,'Style','text','FontName','Arial','FontSize',18,'Visible','off','Units','pixels');
end
if nargin > 1
    set(u,varargin{:});
end 
% Now, set the control's String property to the text you want. 
set(u,'String',stringIn)
% Then, get() the Extent property of the control. 
[out]=get(u,'Extent');
widthPixels = out(3);
heightPixels = out(4);
% The returned height and width are the height and width that would be required to render just that String by itself. This will be the case even if the Position of the control was too small (or too wide) for the string: Extent will tell you the size you actually need for it.
% You can of course re-use the same uicontrol to size different strings, by setting the String property and reading out the Extent afterwards.
% Delete the unneeded uicontrol after you have sized everything.
end

