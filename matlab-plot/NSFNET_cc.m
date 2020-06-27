%vdiary('myScript.m');
clear all; close all; clc;
markerSet = {':k*',':ko',':ks',':kv',':kp',':kd',':kx',':kh'}; 
color1 = [0.55 0 0];
color2 = [0 0.15 0.6];
color3 = [0 0.23 0];
color4 = [0.6 0 0.6];
color5 = [0.08 0.08 0.08];
color6 = [0 0.8 0.8];
color7 = [0.8 0.4 0];
color8 = [0.8 0.8 0];
x = [0 1 2 3 4 5 6 7 8 9 10];
%ncExact = [7 34 65 96 143 180 203 220 220 220 220];
ccExact = [7 34 65 96 143 180 203 220 220 220 220];
% keep node mapping, possible to reconfigure link
%ncNodeP = [0 0 0 3 6 9 12 12 12 12];
ccNodeP = [0 0 0 0 9 12 12 12 12 12];
% any mapping, possible to reconfigure link
%ncAnyP = [0 0 0 5 9 12 12 12 12 12];
ccAnyP = [82 128 192 216 216 220 220 220 220 220 220];

z = cos(x);

h = figure(1);
%plot(x,ncExact,char(markerSet(1)), 'LineWidth', 1.5, 'LineStyle','-', 'color', color1);
%hold on
plot(x,ccExact,char(markerSet(1)), 'LineWidth', 1.5, 'LineStyle','-', 'color', color2);
%hold on
%plot(x,z,'b.-','LineWidth',1.5)
%plot(x,ncNodeP,char(markerSet(2)),'LineWidth',1.5, 'LineStyle','-', 'color', color3)
hold on
%plot(x,ccNodeP,char(markerSet(2)),'LineWidth',1.5, 'LineStyle','-', 'color', color4)
%hold on
plot(x,ccAnyP,char(markerSet(3)),'LineWidth',1.5, 'LineStyle','-', 'color', color6)


xlabel('Stages')
ylabel('Weighted number of working virtual networks and links')
lgd = legend('cc-exact', 'cc-any-p');
lgd.Location = 'northwest';
%legend('cc-exact', 'cc-node-p','cc-any-p')

%set(gca(), 'LooseInset', get(gca(), 'TightInset'));
%saveas(h,'myPlot.pdf')

%plot(x)
%%after plotting write this code to save resize figure in PDF
%%format
%%export figure in selected dimension
scale=2;
    if true
      % code
    end
  type=2; % type=1 for inches and 2 for centimeter
if type==1
    paperunits='inches';
    filewidth=3;%inches
    fileheight=2.5;%inches
end
if type==2
paperunits='centimeters';
filewidth=7.5;%cm
fileheight=5.5;%cm
end
filetype='pdf';
res=300;%resolution
size=[filewidth fileheight]*scale;
set(gcf,'paperunits',paperunits,'paperposition',[0 0 size]);
set(gcf, 'PaperSize', size);
saveas(gcf,'weighted_working_infrastuctures',filetype)