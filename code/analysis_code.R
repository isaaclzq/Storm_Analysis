# =============================================================================
# load csv
# =============================================================================
library(stringr)
storms<-read.csv('data/storms.csv', stringsAsFactors = FALSE)
tracks<-read.csv('data/tracks.csv', stringsAsFactors = FALSE)


# =============================================================================
# number of storms per year
# =============================================================================
# first extract years from date
date = as.Date(storms$date, '%m/%d/%Y')
year = format(date, '%Y')
year = year[which(year >= 1980 & year <= 2010)]

# find the frequency of storms in each year
stormPerYear<-table(year)
# plot a bar graph
barplot(as.numeric(stormPerYear),names.arg = unique(year),
        main = 'number of storms per year' )

pdf("images/stormPerYearPlot.pdf") # open device
barplot(as.numeric(stormPerYear),names.arg = unique(year),
        main = 'number of storms per year' )
dev.off() # close device

png("images/stormPerYearPlot.png", width = 1024, height = 900, res= 120) # open device
barplot(as.numeric(stormPerYear),names.arg = unique(year),
        main = 'number of storms per year' )
dev.off() # close device

# =============================================================================
# number of storms per year with wind >=35
# =============================================================================
# Extract years of which the storm's speed exceed 35
# tracks$id[tracks$wind>=35]: find all ids of storms that have wind speed exceed 35 mph.
# unique the id so we know how many storms there are
# find the date of thoses storms that matches the unique(id)
# extract the year from date we can get years which storm wind speed exceed 35
date = as.Date(tracks$date, '%m/%d/%Y')
year = format(date, '%Y')
tmpTracks = tracks[which(year >= 1980 & year <= 2010),]
year35Date = as.Date(storms$date[unique(tmpTracks$id[tmpTracks$wind>=35])], '%m/%d/%Y')
year35 = format(year35Date, "%Y")
# using table to find frequency of storms in each year
stormPerYear35<-table(year35)
# plot a bar graph
barplot(as.numeric(stormPerYear35), names.arg=unique(year35), 
        main='number of storms per year with wind >=35')

pdf("images/stormPerYear35Plot.pdf") # open device
barplot(as.numeric(stormPerYear35), names.arg=unique(year35), 
        main='number of storms per year with wind >=35')
dev.off() # close device

png("images/stormPerYear35Plot.png", width = 1024, height = 900, res= 120) # open device
barplot(as.numeric(stormPerYear35), names.arg=unique(year35), 
        main='number of storms per year with wind >=35')
dev.off() # close device

# =============================================================================
# number of storms per year with wind >=64
# =============================================================================
# years of which the storm's speed exceed 64
#year64<-str_extract(storms$date[unique(tmpTracks$id[tmpTracks$wind>=64])],'[[:digit:]]{4}')
year64Date = as.Date(storms$date[unique(tmpTracks$id[tmpTracks$wind>=64])], '%m/%d/%Y')
year64 = format(year64Date, "%Y")
# using table to find frequency of storms in each year
stormPerYear64<-table(year64)
# plot a bar graph
barplot(as.numeric(stormPerYear64), names.arg=unique(year64),
        main='number of storms per year with wind >= 64')
pdf("images/stormPerYear64Plot.pdf") # open device
barplot(as.numeric(stormPerYear64), names.arg=unique(year64),
        main='number of storms per year with wind >= 64')
dev.off() # close device

png("images/stormPerYear64Plot.png", width = 1024, height = 900, res= 120) # open device
barplot(as.numeric(stormPerYear64), names.arg=unique(year64),
        main='number of storms per year with wind >= 64')
dev.off() # close device


# =============================================================================
# number of storms per year with wind >=96
# =============================================================================
# first extract years of which the storm's speed exceed 96
year96Date = as.Date(storms$date[unique(tmpTracks$id[tmpTracks$wind>=96])], '%m/%d/%Y')
year96 = format(year96Date, "%Y")
# using table to find frequency of storms in each year
stormPerYear96<-table(year96)
#plot a bar graph
barplot(as.numeric(stormPerYear96), names.arg=unique(year96),
        main='number of storms per year with wind >= 96')
pdf("images/stormPerYear96Plot.pdf") # open device
barplot(as.numeric(stormPerYear96), names.arg=unique(year96),
        main='number of storms per year with wind >= 96')
dev.off() # close device

png("images/stormPerYear96Plot.png", width = 1024, height = 900, res= 120) # open device
barplot(as.numeric(stormPerYear96), names.arg=unique(year96),
        main='number of storms per year with wind >= 96')
dev.off() # close device

# Extract according to Month
# =============================================================================
# number of storms per month
# =============================================================================
date = as.Date(storms$date, '%m/%d/%Y')
monthWithYear = format(date, '%m/%Y')
year = format(date, '%Y')
monthWithYear = monthWithYear[year >= 1980 & year <= 2010]

# find the frequency of storms that happened in each month
month = substring(text = monthWithYear, first = 1, last = 2)
stormPerMonth<-table(month)
# plot
monthName = month.name[sort(as.numeric(unique(month)))]
barplot(as.numeric(stormPerMonth), names.arg = monthName)

pdf("images/stormPerMonthPlot.pdf") # open device
barplot(as.numeric(stormPerMonth), names.arg = monthName) 
dev.off() # close device

png("images/stormPerMonthPlot.png", width = 1024, height = 900, res= 120) # open device
barplot(as.numeric(stormPerMonth), names.arg = monthName)
dev.off() # close device

# =============================================================================
# number of storms per month with wind >=35
# =============================================================================
# tracks$id[tracks$wind>=35]: find all ids of storms that have wind speed exceed 35 mph.
# unique the id so we know how many storms there are that wind speed exceed 35
# find the date of thoses storms that matches the unique(id)
# extract the month from date we can get years which storm wind speed exceed 35 
date = as.Date(tracks$date, '%m/%d/%Y')
monthWithYear = format(date, '%m/%Y')
year = format(date, '%Y')
tmpTracks = tracks[which(year >= 1980 & year <= 2010),]

# find the frequency of storms that happened in each month
month35<-storms$date[unique(tmpTracks$id[tmpTracks$wind>=35])]
month35 = as.Date(month35, '%m/%d/%Y')
month35 = format(month35, '%m')
stormPerMonth35<-table(month35)

# plot
monthName = month.name[sort(as.numeric(unique(month35)))]
barplot(as.numeric(stormPerMonth35), names.arg = monthName)

pdf("images/stormPerMonth35Plot.pdf") # open device
barplot(as.numeric(stormPerMonth35), names.arg = monthName)
dev.off() # close device

png("images/stormPerMonth35Plot.png", width = 1024, height = 900, res= 120) # open device
barplot(as.numeric(stormPerMonth35), names.arg = monthName)
dev.off() # close device

# =============================================================================
# number of storms per month with wind >=64
# =============================================================================
# find the frequency of storms that happened in each month
month64<-storms$date[unique(tmpTracks$id[tmpTracks$wind>=64])]
month64 = as.Date(month64, '%m/%d/%Y')
month64 = format(month64, '%m')
stormPerMonth64<-table(month64)

# plot
monthName = month.name[sort(as.numeric(unique(month64)))]
barplot(as.numeric(stormPerMonth64), names.arg = monthName)

pdf("images/stormPerMonth64Plot.pdf") # open device
barplot(as.numeric(stormPerMonth64), names.arg = monthName)
dev.off() # close device

png("images/stormPerMonth64Plot.png", width = 1024, height = 900, res= 120) # open device
barplot(as.numeric(stormPerMonth64), names.arg = monthName)
dev.off() # close device

# =============================================================================
# number of storms per month with wind >=96
# =============================================================================
# find the frequency of storms that happened in each month
month96<-storms$date[unique(tmpTracks$id[tmpTracks$wind>=96])]
month96 = as.Date(month96, '%m/%d/%Y')
month96 = format(month96, '%m')
stormPerMonth96<-table(month96)

# plot
monthName = month.name[sort(as.numeric(unique(month96)))]
barplot(as.numeric(stormPerMonth96), names.arg = monthName)

pdf("images/stormPerMonth96Plot.pdf") # open device
barplot(as.numeric(stormPerMonth96), names.arg = monthName)
dev.off() # close device

png("images/stormPerMonth96Plot.png", width = 1024, height = 900, res= 120) # open device
barplot(as.numeric(stormPerMonth96), names.arg = monthName)
dev.off() # close device

# =============================================================================
# Annual numbers of storms >= 35/64/96
# =============================================================================
## Average 
mean35<-mean(stormPerYear35)
mean64<-mean(stormPerYear64)
mean96<-mean(stormPerYear96)
## std
std35<-sd(stormPerYear35)
std64<-sd(stormPerYear64)
std96<-sd(stormPerYear96)
## 25 percentile
Q35<-summary(as.numeric(stormPerYear35))[2]
Q64<-summary(as.numeric(stormPerYear64))[2]
Q96<-summary(as.numeric(stormPerYear96))[2]
## median
median35<-summary(as.numeric(stormPerYear35))[3]
median64<-summary(as.numeric(stormPerYear64))[3]
median96<-summary(as.numeric(stormPerYear96))[3]
## 75 percentile
q35<-summary(as.numeric(stormPerYear35))[5]
q64<-summary(as.numeric(stormPerYear64))[5]
q96<-summary(as.numeric(stormPerYear96))[5]

## table
annual<-matrix(c(mean35,std35,Q35, median35,q35,
                 mean64,std64,Q64, median64,q64,
                 mean96,std96,Q96, median96,q96), ncol=5, byrow=TRUE)
colnames(annual)<-c('Avg','Std.Dev','25th','50th','75th')
rownames(annual)<-c('35 knots','64 knots', '96 knots')
annual = signif(annual, 4)
annual<-as.table(annual)

# =============================================================================
# Regression Line
# =============================================================================
# mean pressure and mean wind speed for each storm
vec<-c(1:1777)
pressMean1<-sapply(vec, function(x) 
  mean(tmpTracks$press[tmpTracks$id==x]))
# remove zeros
pressMean<-pressMean1[pressMean1!=0]
# mean wind speed
windMean1<-sapply(vec,function(x) 
  mean(tmpTracks$wind[tmpTracks$id==x]))
#remove zeros
windMean<- windMean1[pressMean1!=0]


reg = lm(pressMean ~ windMean)
plot(windMean, pressMean,xlab = 'mean wind speed', ylab = 'mean pressure')
title('Mean Wind VS Mean Wind Speed for Each Storm ')
abline(reg)

pdf("images/meanWindPressureReg.pdf") # open device
reg = lm(pressMean ~ windMean)
plot(windMean, pressMean,xlab = 'mean wind speed', ylab = 'mean pressure')
title('Mean Wind VS Mean Wind Speed for Each Storm ')
abline(reg)
dev.off() # close device

png("images/meanWindPressureReg.png", width = 1024, height = 900, res= 120) # open device
reg = lm(pressMean ~ windMean)
plot(windMean, pressMean,xlab = 'mean wind speed', ylab = 'mean pressure')
title('Mean Wind VS Mean Wind Speed for Each Storm ')
abline(reg)
dev.off() # close device


# =============================================================================
# Regression analysis 2
# =============================================================================
# median pressure and median wind speed for each storm
vec<-c(1:1777)
pressMedian1<-sapply(vec,function(x) 
  median(tmpTracks$press[tmpTracks$id==x]))
# mean wind speed
windMedian1<-sapply(vec,function(x) 
  median(tmpTracks$wind[tmpTracks$id==x]))
# remove zeros
pressMedian<-pressMedian1[pressMedian1!=0]
windMedian<-windMedian1[pressMedian1!=0]

reg1 = lm(pressMedian ~ windMedian)
plot(windMedian, pressMedian, xlab = 'Median wind speed', ylab = 'Median pressure')
title('Median Wind Speed VS Median Pressure For Each Storm ')
abline(reg1)

pdf("images/medianWindPressureReg.pdf") # open device
reg1 = lm(pressMedian ~ windMedian)
plot(windMedian, pressMedian, xlab = 'Median wind speed', ylab = 'Median pressure')
title('Median Wind Speed VS Median Pressure For Each Storm ')
abline(reg1)
dev.off() # close device

png("images/medianWindPressureReg.png", width = 1024, height = 900, res= 120) # open device
reg1 = lm(pressMedian ~ windMedian)
plot(windMedian, pressMedian, xlab = 'Median wind speed', ylab = 'Median pressure')
title('Median Wind Speed VS Median Pressure For Each Storm ')
abline(reg1)
dev.off() # close device








