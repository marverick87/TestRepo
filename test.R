#!/usr/bin/Rscript
args=commandArgs(trailingOnly = TRUE);

if("--help" %in% args) {
  cat("[PLACE HELP COMMAND HERE TO GUIDE USER]\n huehuez")
  q(save="no")
}

parseArgs <- function(x) strsplit(sub("^--", "", x), "=")
argsDF <- as.data.frame(do.call("rbind", parseArgs(args)))
argsL <- as.list(as.character(argsDF$V2))
names(argsL) <- argsDF$V1

#haha<-as.numeric(argsL$val1)
#hehe<-as.numeric(argsL$val2)
par1<-as.character(argsL$loc)
par2<-as.numeric(argsL$wid)
par3<-as.numeric(argsL$hei)
par4<-as.logical(argsL$gray)
par5<-as.numeric(argsL$deg)
par6<-as.character(argsL$file)
aug_pic<-function(addr, res_wid=200, res_hei=100, gray, deg=0, filename="aug_img.jpg"){
  library(imager)
  image<-load.image(addr)
  image<-resize(image,res_wid, res_hei)
  if(gray==TRUE){
    image<- grayscale(image)
  }
  image<-imrotate(image,deg)
  x<-"D:/augmented_images/"
  savef<-paste(x,filename)
  save.image(image,savef)
  plot(image)
  cat("DONE! :)")
}
aug_pic(par1,par2,par3,par4,par5,par6)
#aug_pic('D:/SOTR.jpg',1000,500, TRUE, 45, "testing.jpg")


