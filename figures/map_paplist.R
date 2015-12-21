###############################################################
###### R Code for Generating Bubble Maps of RCT  ########
###### registrations on AEA's RCT Registry  ######
############################################  
#Author: Tomas Monarrez, altered by Garret Christensen
#Date :12/20/2015


setwd("/Users/gchrist1/Documents/Research/Registry/rct")
library(maps)
library(mapdata)
library(mapproj)


paplist_tot <- read.csv("scraperoutput.csv")
#int_loc <- read.csv("int_loc_handr.csv")

ranked = paplist_tot[order(paplist_tot$number),]
top5 = rev(tail(ranked$institution,5))
top5

###########################################################
################# GRAND TOTAL MAP #########################
###########################################################

bub_col = c('navy','red','firebrick4','dodgerblue2','gold2','orange','chartreuse2')
leg.txt = c('Harvard - 25','Yale - 24','MIT - 18','Mathematica - 15','Berkeley - 13','Other Institution', 'Intervention Locations')
symbols = c(19,19,19,19,19,19,18)
    
grand_totn = sum(paplist_tot$number)
grand_tots = as.character(grand_totn)
sub_title = paste('Grand Total = ',grand_tots,sep='')

pdf(file='./figures/rctmap_total0115.pdf', width=9, height=9)
   map(database='worldHires', col='gray60',fill=TRUE, bg='gray95')
     points(paplist_tot$longitude,paplist_tot$latitude, pch=19, col='orange', cex=sqrt(paplist_tot$number_oth/8))
     points(paplist_tot$longitude,paplist_tot$latitude, pch=19, col='navy', cex=sqrt(paplist_tot$number1/8))
     points(paplist_tot$longitude,paplist_tot$latitude, pch=19, col='red', cex=sqrt(paplist_tot$number2/8))
     points(paplist_tot$longitude,paplist_tot$latitude, pch=19, col='firebrick4', cex=sqrt(paplist_tot$number3/8))
     points(paplist_tot$longitude,paplist_tot$latitude, pch=19, col='dodgerblue2', cex=sqrt(paplist_tot$number4/8))
     points(paplist_tot$longitude,paplist_tot$latitude, pch=19, col='gold2', cex=sqrt(paplist_tot$number5/8))
     points(int_loc$longitude,int_loc$latitude, pch=18, col='chartreuse2', cex=sqrt(int_loc$count)/2.4)
     title(main='Total RCTs Registered - Jan. 2015')
   	legend(-183.5,2,leg.txt, pch=symbols, cex=0.8, col=bub_col, title=sub_title, bg='white')
dev.off()


bub_col = c('navy','red','firebrick4','dodgerblue2','gold2','orange')
leg.txt = c('Harvard - 25','Yale - 24','MIT - 18','Mathematica - 15','Berkeley - 13','Other Institution', 'Intervention Locations')
symbols = c(19,19,19,19,19,19)


pdf(file='./figures/rctmap_rctrank0115.pdf', width=9, height=9)
   map(database='worldHires', col='gray60',fill=TRUE, bg='gray95')
     points(paplist_tot$longitude,paplist_tot$latitude, pch=19, col='orange', cex=sqrt(paplist_tot$number_oth/8))
     points(paplist_tot$longitude,paplist_tot$latitude, pch=19, col='navy', cex=sqrt(paplist_tot$number1/8))
     points(paplist_tot$longitude,paplist_tot$latitude, pch=19, col='red', cex=sqrt(paplist_tot$number2/8))
     points(paplist_tot$longitude,paplist_tot$latitude, pch=19, col='firebrick4', cex=sqrt(paplist_tot$number3/8))
     points(paplist_tot$longitude,paplist_tot$latitude, pch=19, col='dodgerblue2', cex=sqrt(paplist_tot$number4/8))
     points(paplist_tot$longitude,paplist_tot$latitude, pch=19, col='gold2', cex=sqrt(paplist_tot$number5/8))
     title(main='Total RCTs Registered by Research Institution - Rankings Jan. 2015')
   	legend(-183.5,2,leg.txt, pch=symbols, cex=0.8, col=bub_col, title=sub_title, bg='white')
dev.off()

###########################################################
############### Intervention Locations Map ################
###########################################################

ranked_int = int_loc[order(int_loc$count),]
top5_int = rev(tail(ranked_i$country,5))
top5_int 

leg2.txt <- c('India - 25','USA - 21','Kenya - 12', 'Uganda - 11','South Africa/Ghana (tie) - 10', 'Other Country')
symbols2 <- c(18,18,18,18,18,18,18)
bub_col2 <- c('orange','blue','red','yellow','darkgreen','chartreuse2')

pdf(file='./figures/rctmap_intlocrank0614.pdf', width=9, height=9)
   map(database='worldHires', col='gray60',fill=TRUE, bg='gray95')
     points(int_loc$longitude,int_loc$latitude, pch=18, col='chartreuse2', cex=sqrt(int_loc$number_oth/2.4))
     points(int_loc$longitude,int_loc$latitude, pch=18, col='orange', cex=sqrt(int_loc$number1/2.4))
     points(int_loc$longitude,int_loc$latitude, pch=18, col='blue', cex=sqrt(int_loc$number2/2.4))
     points(int_loc$longitude,int_loc$latitude, pch=18, col='red', cex=sqrt(int_loc$number3/2.4))
     points(int_loc$longitude,int_loc$latitude, pch=18, col='yellow', cex=sqrt(int_loc$number4/2.4))
     points(int_loc$longitude,int_loc$latitude, pch=18, col='darkgreen', cex=sqrt(int_loc$number5/2.4))
     title(main='Total RCTs Registered by Intervention Location - Rankings June 2014')
   	legend(-183.5,2,leg2.txt, pch=symbols2, cex=0.8, col=bub_col2, title=sub_title, bg='white')
dev.off()

leg2.txt <- c('# of RCTs Registered')
pdf(file='./figures/rctmap_intloc0614.pdf', width=9, height=9)
   map(database='worldHires', col='gray60',fill=TRUE, bg='gray95')
     points(int_loc$longitude,int_loc$latitude, pch=18, col='chartreuse2', cex=sqrt(int_loc$count/2.4))
     title(main='Total RCTs Registered by Intervention Location - June 2014')
   	legend(-183.5,2,leg2.txt, pch=18, cex=0.8, col='chartreuse2', title=sub_title, bg='white')
dev.off()


###########################################################
################ Monthly Cumulative Maps ##################
########### (only for insitution locations) ###############

rm(paplist)
paplist <- read.csv("paplist_monthlymapdata.csv")
leg.txt <- c('# of RCTs Registered')

paplist_0513 = paplist[1:4,1:7]
paplist_0613 = paplist[1:6,1:7]
paplist_0713 = paplist[1:10,1:7]
paplist_0813 = paplist[1:15,1:7]
paplist_0913 = paplist[1:21,1:7]
paplist_1013 = paplist[1:27,1:7]
paplist_1113 = paplist[1:40,1:7]
paplist_1213 = paplist[1:52,1:7]
paplist_0114 = paplist[1:71,1:7]
paplist_0214 = paplist[1:83,1:7]
paplist_0314 = paplist[1:94,1:7]
paplist_0414 = paplist[1:103,1:7]
paplist_0514 = paplist[1:119,1:7]
paplist_0614 = paplist[1:134,1:7]
paplist_0714 = paplist[1:148,1:7]
paplist_0814 = paplist[1:170,1:7]
paplist_0914 = paplist[1:184,1:7]
paplist_1014 = paplist[1:198,1:7]
paplist_1114 = paplist[1:208,1:7]
paplist_1214 = paplist[1:221,1:7]
paplist_0115 = paplist[1:223,1:7]



names = c('0513','0613','0713','0813','0913','1013','1113','1213','0114','0214','0314','0414','0514','0614','0714','0814','0914','1014','1114','1214','0115')
dates = c('May 2013','June 2013','July 2013','August 2013','September 2013','October 2013','November 2013','December 2013','January 2014','February 2014','March 2014','April 2014','May 2014', 'June 2014', 'July 2014','August 2014', 'September 2014','October 2014', 'November 2014', 'December 2014', 'January 2015')


totals = rep(0,length(names))

for(i in 1:length(names)){	
	mypath = paste('./figures/rctmap_',names[i],'_update','.pdf', sep='')
	working = get(paste("paplist_",names[i], sep=""))
	totals[i] = sum(working$number)
	total_txt = as.character(totals[i])
	
	pdf(file=mypath,width=9,height=9)
	   map(database='worldHires', col='gray60',fill=TRUE,bg='gray95')
         points(working$longitude,working$latitude, pch=19, col='orange', cex=sqrt(working$cumulative/6))
         title(main=paste('Total RCTs Registered  by Research Institution - ',dates[i]))
   	     legend(-183,-50,leg.txt, pch=19, cex=0.8, col='orange', title=paste('Grand Total =',total_txt),bg='white')
    dev.off() 
}
	
	



