##STEP3 
for (n in 1:nrow(df)){ 
    x<-as.numeric(df[n, “SWLSLifClosIdlScore”])+as.numeric(df[n, “SWLSLifCondExcllncScore”])+as.numeric(df[n, “SWLSLifSatfctnScore”])+as.numeric(df[n, “SWLSLifAchvmntScore”])+as.numeric(df[n, “SWLSLifChngScore”])-as.numeric(df[n, “SWLSTotalScore”])
    df[n,11] <- ifelse(x ==  0, "Yes", ifelse(x != 0, "No", "NA") )  
  }
  ##I like focus subset a data frame by the correctness of submitted answers to narrow down validation 
  dfNA<-df[which(is.na(df[,11])==TRUE), ]
  dfNo<-df[which(df[,11]=="No"),]
  dfYes<-df[which(df[,11]=="Yes"), ]
  
  for (n in 1:nrow(dfNA)){
    dfNA[n,12]<-ifelse(is.na(dfNA[n,5])==FALSE & is.na(dfNA[n,6])==FALSE & is.na(dfNA[n,7])==FALSE &is.na(dfNA[n,8])==FALSE & is.na(dfNA[n,9])==FALSE, sum(as.numeric(dfNA[n,5:9])),"")
  }
  for (n in 1:nrow(dfNo)){
    dfNo[n,12]<-ifelse(is.na(dfNo[n,5])==FALSE & is.na(dfNo[n,6])==FALSE & is.na(dfNo[n,7])==FALSE &is.na(dfNo[n,8])==FALSE & is.na(dfNo[n,9])==FALSE, sum(as.numeric(dfNo[n,5:9])),"")
  }
  dfYes[,12]<-""
##STEP4
  df<-rbind(dfNA,dfNo,dfYes)
 colnames(df)[11:12]<-c("Correct calculation?","Suggested total score")
write.csv(df,file="directories/filename.csv")


