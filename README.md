# Sum_score_validation_in_survey
In each psycological survey, interviewers collect responses and assign scoress to each item question. The severity of certain psycological problem is assessed by the total score, which is usually the sum of all item scores. The total score is also collected; however, data submissions failed the quality check, which results in different values between sum of item scores and the submitted sum scoress.

Although the calculation is a summation across all surveys, the challenge is the numbers of questions vary from survey to survey. To intelligently scan the data and provide recommendation, this methodology is used to sum up item scores to become a total score regardless of how many item scores to be summed up.

Here are the outline of R code:

  1: Define query by a subset of data elements due to limited number of DEs that can be queried at the same time
	
	2: Aggregate all associated data elements into one place (Be very cautious about this step. Recommend use Query Tool results to make sure you don’t mismatch these pieces of information)
	
	3: Apply the calculation rules for each sum score.
	
	4: Compare to the submitted total to recommend whether or not there are wrong data.
