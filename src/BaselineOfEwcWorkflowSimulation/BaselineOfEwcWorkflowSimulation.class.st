Class {
	#name : #BaselineOfEwcWorkflowSimulation,
	#superclass : #BaselineOf,
	#classVars : [
		'PostLoaded'
	],
	#category : #BaselineOfEwcWorkflowSimulation
}

{ #category : #accessing }
BaselineOfEwcWorkflowSimulation class >> loadLepiter [
	| currentProperties |
	currentProperties := LeDatabasesRegistry defaultLogicalDatabase properties.
	currentProperties
		addRegisteredDirectory: FileLocator imageDirectory / 'pharo-local' / 'iceberg' / 'nergal-perm'
				/ 'st-workflow-simulation' / 'lepiter'.
	LeDatabasesRegistry default defaultLogicalDatabase reload
]

{ #category : #baseline }
BaselineOfEwcWorkflowSimulation >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec postLoadDoIt: #postLoadBaseline:.
			spec package: 'EwcWorkflowSimulation'
		]
]

{ #category : #accessing }
BaselineOfEwcWorkflowSimulation >> postLoadBaseline: spec [
	(PostLoaded isNotNil and: [ PostLoaded ]) ifTrue: [ ^ self ].
	PostLoaded := true.

	self class loadLepiter
]
