Class {
	#name : #QuestionRetriever,
	#superclass : #Object,
	#instVars : [
		'option',
		'cuoora'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #'instance creation' }
QuestionRetriever class >> new: cuoora [
	^ self new cuoora: cuoora
]

{ #category : #'instance creation' }
QuestionRetriever class >> new: cuoora and: aSymbol [
	^ self new 
				cuoora: cuoora
	  			option: aSymbol
	 			yourself.
]

{ #category : #accesing }
QuestionRetriever >> cuoora: aCuooraInstance [
	cuoora := aCuooraInstance 
]

{ #category : #'as yet unclassified' }
QuestionRetriever >> cuoora: aCuooora option: aSymbol [
	cuoora:= aCuooora.
	option := aSymbol.
]

{ #category : #initializing }
QuestionRetriever >> initialize [
	option := #social
]

{ #category : #accesing }
QuestionRetriever >> option: anOption [
	option := anOption
]

{ #category : #'as yet unclassified' }
QuestionRetriever >> ordenarCol: aCol de: aUser [
	^(((aCol asSortedCollection:[ :a :b | a positiveVotes size > b positiveVotes size ])
		last: 	(100 min: self size))
			reject:[:q | q user = aUser]) .
]

{ #category : #'as yet unclassified' }
QuestionRetriever >> retriveQuestions: aUser [
	self subclassResponsibility .
]
