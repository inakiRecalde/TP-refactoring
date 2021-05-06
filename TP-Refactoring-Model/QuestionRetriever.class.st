Class {
	#name : #QuestionRetriever,
	#superclass : #Object,
	#instVars : [
		'cuoora'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #'instance creation' }
QuestionRetriever class >> new: cuoora [
	^ self new cuoora: cuoora
]

{ #category : #accesing }
QuestionRetriever >> cuoora: aCuooraInstance [
	cuoora := aCuooraInstance 
]

{ #category : #'as yet unclassified' }
QuestionRetriever >> ordenarCol: aCol de: aUser [
	^(((aCol asSortedCollection:[ :a :b | a positiveVotes size > b positiveVotes size ])
		last: (100 min: aCol size))
			reject:[:q | q user = aUser]) .
]

{ #category : #'as yet unclassified' }
QuestionRetriever >> retrieveQuestions: aUser [
	self subclassResponsibility .
]
