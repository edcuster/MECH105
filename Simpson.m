function [I] = Simpson(x, y)
I=0;
if nargin<2 || nargin >3
    error('Too many or too few argunments')
end
if diff(x) ~= x(2)-x(1)
    error('X Arguments are not evenly spaced')
end
if length(x)~=length(y)
    error('arrays must be the same length')
end
if length(x)==2
    warning('Useing Trap rule')
    I=trapz(x,y);
    return;
end
count=length(x);
for i=2:2:length(x)-1
    if count>=3 
        I=I+((x(i+1)-x(i-1))*(y(i-1)+4*y(i)+y(i+1))/6);
        count=count-2;
    end
    if count==2
        warning('Useing Trap rule')
        I=I+trapz([x(i), x(i+1)],[y(i), y(i+1)]);
    end
end
end