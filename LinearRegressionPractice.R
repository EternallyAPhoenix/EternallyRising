ConvoInterestIndex <- c(0.05, 0.00, 0.20, 9.99, 0.00, 0.20, 8.50, 9.00, 8.50, 8.50, 7.50, 10.00, 10.00, 0.20, 8.00, 3.00, 0.00, 7.50)
CII <- ConvoInterestIndex
FaceRating <- c(4, 4, 4, 3.5, 3.5, 3.5, 3.5, 3.5, 3.5, 3.5, 3.5, 3.5, 3.5, 3.5, 3.5, 3.5, 3.5, 6)
FR <- FaceRating 
HeightAtFinalInteraction <-c (175, 175, 175, 170, 170, 150, 170, 170, 170, 170, 170, 163, 142, 172, 172, 148, 170, 186)
Height <- HeightAtFinalInteraction
PRIDEINBEINGAZNIndex <- c(0, 2, 2, 7, 7, 7, 7, 7, 7, 7, 7, 5, 7, 5, 5, 7, 7, 10) 
AZNPRIDE <- PRIDEINBEINGAZNIndex

#First I created separate matrices for conversation flow index, face rating index, my height, and my sense of AZN pride, during when I met and spoke with each girl.

data.frame(CII)
data.frame(FR)
data.frame(Height)
data.frame(AZNPRIDE)
#I then converted the matrices into data frames. 
MergedDf <- merge("rbind", list(CII, FR, Height, AZNPRIDE))
#Then I merged them into a single data frame to be read for the data analysis that would help us craft a linear model between the ConvoInterestIndex and the other three variables.
View(MergedDf)


summary(lm(CII ~ FR + Height + AZNPRIDE, data = MergedDf))
#Call:
#lm(formula = CII ~ FR + Height + AZNPRIDE, data = MergedDf)

#Residuals:
#  Min      1Q  Median      3Q     Max 
# -6.4226 -2.3646  0.8362  2.4524  5.6913 

#Coefficients:
 # Estimate Std. Error t value Pr(>|t|)  
#(Intercept) -2.00619   17.09552  -0.117   0.9082  
#FR          -1.05999    2.04615  -0.518   0.6125  
#Height       0.03258    0.11500   0.283   0.7811  
#AZNPRIDE     0.94293    0.44413   2.123   0.0521 .
#---
#  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

#Residual standard error: 4.152 on 14 degrees of freedom
#Multiple R-squared:  0.2496,	Adjusted R-squared:  0.08881 
#F-statistic: 1.552 on 3 and 14 DF,  p-value: 0.2451


