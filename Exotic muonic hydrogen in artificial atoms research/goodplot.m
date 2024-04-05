function goodplot()
set(get(gca,'xlabel'),'FontSize',18, 'FontWeight', 'Bold');
set(get(gca,'ylabel'),'FontSize',18, 'FontWeight', 'Bold');
set(get(gca,'title'),'FontSize',18, 'FontWeight', 'Bold');
box off; 
axis square
set(gca,'LineWidth',2);
set(gca,'FontSize',16);
set(gca,'FontWeight','Bold');
set(gcf,'color','w');
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize',[8 8]);
set(gcf,'PaperPosition',[0.5 0.5 7 7]);
