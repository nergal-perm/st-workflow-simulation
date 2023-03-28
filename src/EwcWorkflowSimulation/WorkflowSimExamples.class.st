Class {
	#name : #WorkflowSimExamples,
	#superclass : #Object,
	#category : #EwcWorkflowSimulation
}

{ #category : #example }
WorkflowSimExamples >> initialState [
	<gtExample>
	| sim |
	sim := WorkflowSimulation new.

	self assert: sim agents countDevelopers equals: 4.

	self assert: sim tasks countJava equals: 100.
	self assert: sim tasks countJavascript equals: 100.
	self assert: sim tasks countIos equals: 100.
	self assert: sim tasks countAndroid equals: 100.

	sim agents
		do: [ :agent | 
			self assert: agent queue isEmpty.
			self assert: agent stock isEmpty ]
]
