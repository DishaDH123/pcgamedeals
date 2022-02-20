
Feb 14: First meeting
* The first step to be taken was decided to select an appropriate API.
* The team was looking for relevant APIs which were free and didn't possibly require an API key to make things easier.
* We found multiple APIs and sent the professor one for approval.
* The professor replied that any API which does not already have an R package is acceptable.
* Tried multiple APIs but most of them had a limit on the number of requests.
* Few of the APIs had a payment to be made.
* Finally we decided we will go ahead with the API suggested by Kristy which was about game deals for multiple stores.


Feb 15: Second meeting to decide on workflow
*	We all caught up over zoom between 4pm to 6pm
*	We had a brief discussion about git workflow
*	I created a git repository.
*	We all decided on using the fork method in git for contributing.
*	We explored the API a bit
-	The API seemed to have multiple optional parameters and hence was easy to pull data from.
-	Divided the work equally and decided on the wrapper functions we could create.
-	I wanted to work on the top 10 games which had the majority savings percentage.

Feb 16:  Third meeting to decide on other package and documentations
*	The team discussed about progress in person
*	Kristy created the first wrapper function for top 10 game deals within a budget.
* I created a wrapper function for top 10 games which have the highest discount percentage. This percentage would be entered by the user.
*	All three of us created a response function together for user inputs.
*	Each of us called our respective wrapper function within the response function to fetch the appropriate data.[Main function](https://github.com/DishaDH123/pcgamedeals/commit/6f9dfb7e70adde8479002368122b60659f2c4769)
*	Added the visualization for our respective wrapper functions. [Viz](https://github.com/DishaDH123/pcgamedeals/commit/ce7fee50d98086b6dc3fc178c92736d623591374)
*	Added docstrings to the functions [Doc](https://github.com/DishaDH123/pcgamedeals/commit/075f74a4df35249b9d3f185b48da5c4b40b31d96)
*	Worked on testing the functions. Wrote tests to test the output[Commit](https://github.com/DishaDH123/pcgamedeals/commit/485b2413f7998d8b289cf430a462d36451f31bee)
* Worked on developing the R package

Feb 17: Fourth meeting to check on Vignettes added by Kristy
* Kristy added the Vignette document. Reviewed and made changes to the same. 
* Worked on github actions for code coverage and build [actions](https://github.com/DishaDH123/pcgamedeals/commit/77f6c56a3edcf339d85ead265b46ed955d654526)


Feb 18:  Fifth meeting
* Met briefly to discuss on the changes made by Kristy.
* No much contribution made on this day due to tight schedule.
* Reviewed documentation changes made by Kristy

Feb 19: 
* The repository was made public hence the forked repositories were lost. Asked the team mates to fork the repo again.
* Reviewed changes
* Added the contributing.md file on how the team mates had decided to work. [cont](https://github.com/DishaDH123/pcgamedeals/commit/1383e65720ce4cf1ac5aa8408701ffc3bb436699)
* Made changes to the readme and vignette file to add the output and usage scenarios.
