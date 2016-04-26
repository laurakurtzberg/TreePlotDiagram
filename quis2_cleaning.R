#set working directory
#setwd("~/mydirectory")

read.csv("quis2_fluxdata.csv", header=TRUE)
read.csv("quis2_positions.csv", header=TRUE)
read.csv("quis2_take2.csv", header=TRUE)
workingdata <- read.csv("workingdata.csv", header=TRUE)
adit <- read.csv("spreadsheets/adit_data.csv", header=TRUE)

fluxdata <- data.frame(quis2_fluxdata)
positions <- data.frame(quis2_positions)

quis2 <- merge(fluxdata, positions, by="ID")

quis2_take2 <- merge(fluxdata, positions, by="ID", all.y=TRUE)

write.csv(quis2, "quis2.csv", row.names=FALSE)

write.csv(quis2_take2, "quis2_take2.csv", row.names=FALSE)

workingcsv <- data.frame(quis2_take2)
View(workingcsv)

clean_csv <-data.frame(workingdata)

Species <- c(levels(workingcsv$Species))
val <- c(1:17)
mapit <- data.frame(Species, val)
View(mapit)

adit <- data.frame(adit)
work_added <- merge(clean_csv, adit, by="ID", all.x=TRUE)
write.csv(work_added, "workingdata_added.csv", row.names=FALSE)
