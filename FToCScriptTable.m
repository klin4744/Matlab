%avgArr finds the average of an array
M = ["Celcius °C"];
for i = 1:100
    M=[M,FtoC(i)];
end
B= ["Fahrenheight °F",1:100];
C=[B;M]


