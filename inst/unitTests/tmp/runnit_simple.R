##########################################################################
#                                                                        #
#  SPRINT: Simple Parallel R INTerface                                   #
#  Copyright © 2008,2009 The University of Edinburgh                     #
#                                                                        #
#  This program is free software: you can redistribute it and/or modify  #
#  it under the terms of the GNU General Public License as published by  #
#  the Free Software Foundation, either version 3 of the License, or     #
#  any later version.                                                    #
#                                                                        #
#  This program is distributed in the hope that it will be useful,       #
#  but WITHOUT ANY WARRANTY; without even the implied warranty of        #
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the          #
#  GNU General Public License for more details.                          #
#                                                                        #
#  You should have received a copy of the GNU General Public License     #
#  along with this program. If not, see <http://www.gnu.or/licenses/>.   #
#                                                                        #
##########################################################################


# = =============================================================== =
# =  Massive unit test to check all possible combinations of input  =
# =  parameters and make sure that the output matches the output    =
# =  from the serial version.                                       =
# = =============================================================== =

library("RUnit")
library("boot")

data(discoveries)

library("sprint")

simplefunc <- function (data,indices){
    d <- data[indices]
    result <- mean(d)
    return(result)
}


test.simple <- function() {
	b = pboot(discoveries, simplefunc, 2, simple=TRUE)
	b2 <- b[[2]]
	b2
	mean(discoveries)
	1/sqrt(1001)
	checkTrue(abs(mean(b2) - mean(discoveries)) < 1/sqrt(1001),"Test simple equals true")
}
test.simple()

pterminate()
quit()

