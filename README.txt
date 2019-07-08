Scenario:
	Create a text box on vf page.
	Provide a button to insert a record for example Lead with name typed in the text box.
	On inserting a lead a formula field value will be calculated. Using that value hit a rest web service and display the web service result on the vf page.
	
Learnings:
	1. You get a exception called  "System.Callout Exception : You have uncommitted work pending".
	2. We cannot perform a callout after performing dml.
	
Solution:
	1. Either perform all your callouts first before any dml (which is not possible for above scenario);
	2. Perform the dml and perform the callout in a future or queable apex . But using this approach we cannot track the calloout result which needs to be displayed on the vf page.
	3.Seperate the transaction by using oncomplete attribute on the <apex:commandbutton> or <apex:actionfunction> tags.