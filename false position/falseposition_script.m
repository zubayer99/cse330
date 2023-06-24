clc;
clear all;
close all;
format long;

fx = inline('x.^2 - 3.68*log2(x) - 1', 'x');
xlow_inter = 0.1;
xup_inter = 1.5;
tolerance = 0.0000000000000000000000000000001;
[r, i, e] = falseposition(fx, xlow_inter, xup_inter, tolerance)