f = figure('Name','Digital Image Processing',...
    'NumberTitle','off','Position',[250 130 800 500]);

tgroup1 = uitabgroup('Parent', f);
tab1 = uitab('Parent', tgroup1, 'Title', 'RGB');
tab2 = uitab('Parent', tgroup1, 'Title', 'Grayscale');
tab3 = uitab('Parent', tgroup1, 'Title', 'Binary');

panel1 = uipanel('Parent',tab1,'Title','RGB Image','FontWeight','bold',...
    'FontSize',10,'Position',[.03 .3 .25 .4]);

tgroup2 = uitabgroup('Parent', tab1,'Position',[.32 .3 .65 .44]);
tabRed = uitab('Parent', tgroup2, 'Title', 'Red');
tabGreen = uitab('Parent', tgroup2, 'Title', 'Green');
tabBlue = uitab('Parent', tgroup2, 'Title', 'Blue');

ax1 = axes('Parent',panel1,'Position',[.05 .05 .9 .9],'XTick',[],...
    'YTick',[]);

Img = imread('peppers.png');
axes(ax1)
imshow(Img)

ax2 = axes('Parent',tabRed,'Position',[.02 .04 .48 .9],'XTick',[],...
    'YTick',[]);

ax3 = axes('Parent',tabRed,'Position',[.62 .12 .34 .74],'XTick',[],...
    'YTick',[]);

ax4 = axes('Parent',tabGreen,'Position',[.02 .04 .48 .9],'XTick',[],...
    'YTick',[]);

ax5 = axes('Parent',tabGreen,'Position',[.62 .12 .34 .74],'XTick',[],...
    'YTick',[]);

ax6 = axes('Parent',tabBlue,'Position',[.02 .04 .48 .9],'XTick',[],...
    'YTick',[]);

ax7 = axes('Parent',tabBlue,'Position',[.62 .12 .34 .74],'XTick',[],...
    'YTick',[]);

R = Img(:,:,1);
G = Img(:,:,2);
B = Img(:,:,3);

Red = cat(3,R,G*0,B*0);
Green = cat(3,R*0,G,B*0);
Blue = cat(3,R*0,G*0,B);

rmap = zeros(256,3);
rmap(:,1) = 0:255;
rmap = rmap/255;

gmap = zeros(256,3);
gmap(:,2) = 0:255;
gmap = gmap/255;

bmap = zeros(256,3);
bmap(:,3) = 0:255;
bmap = bmap/255;

axes(ax2)
imshow(Red), colormap(ax2,rmap), colorbar

axes(ax3)
histogram(R(:),256,'FaceColor','r','EdgeColor','r')
set(gca,'XLim',[0 255])
set(gca,'YLim',[0 15000])
grid on

axes(ax4)
imshow(Green), colormap(ax4,gmap), colorbar

axes(ax5)
histogram(G(:),256,'FaceColor','g','EdgeColor','g')
set(gca,'XLim',[0 255])
set(gca,'YLim',[0 15000])
grid on

axes(ax6)
imshow(Blue), colormap(ax6,bmap), colorbar

axes(ax7)
histogram(B(:),256,'FaceColor','b','EdgeColor','b')
set(gca,'XLim',[0 255])
set(gca,'YLim',[0 15000])
grid on

panel2 = uipanel('Parent',tab2,'Title','RGB Image','FontWeight','bold',...
    'FontSize',10,'Position',[.03 .3 .25 .4]);

ax8 = axes('Parent',panel2,'Position',[.05 .05 .9 .9],'XTick',[],...
    'YTick',[]);

axes(ax8)
imshow(Img)

panel3 = uipanel('Parent',tab2,'Title','Grayscale Image','FontWeight','bold',...
    'FontSize',10,'Position',[.32 .3 .65 .4]);

ax9 = axes('Parent',panel3,'Position',[.02 .064 .48 .9],'XTick',[],...
    'YTick',[]);

ax10 = axes('Parent',panel3,'Position',[.618 .132 .34 .775],'XTick',[],...
    'YTick',[]);

Gray = rgb2gray(Img);
axes(ax9)
imshow(Gray), colormap(ax9,gray), colorbar

axes(ax10)
histogram(Gray(:),256,'FaceColor',[.64 .64 .64],'EdgeColor',[.64 .64 .64])
set(gca,'XLim',[0 255])
set(gca,'YLim',[0 15000])
grid on

panel4 = uipanel('Parent',tab3,'Title','RGB Image','FontWeight','bold',...
    'FontSize',10,'Position',[.03 .3 .25 .4]);

ax11 = axes('Parent',panel4,'Position',[.05 .05 .9 .9],'XTick',[],...
    'YTick',[]);

axes(ax11)
imshow(Img)

panel5 = uipanel('Parent',tab3,'Title','Grayscale Image','FontWeight','bold',...
    'FontSize',10,'Position',[.32 .3 .65 .4]);

ax12 = axes('Parent',panel5,'Position',[.02 .064 .48 .9],'XTick',[],...
    'YTick',[]);

ax13 = axes('Parent',panel5,'Position',[.618 .132 .34 .76],'XTick',[],...
    'YTick',[]);

bw = im2bw(Gray);
bwmap = zeros(2,3);
bwmap(2,:) = 1;
axes(ax12)
imshow(bw), colormap(ax12,bwmap), colorbar('Ticks',[0,1])
axes(ax13)
histogram(double(bw(:)),2,'FaceColor',[0 0 0],'EdgeColor',[0 0 0],'FaceAlpha',1)
set(gca,'XLim',[0 1])
grid on