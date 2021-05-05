Class {
	#name : #RetrieverTopics,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #'as yet unclassified' }
RetrieverTopics >> retrieveQuestions: aUser [
		^	(self ordenarCol: 
						(aUser topics flatCollect:[ :topic | topic questions ]) 
					 de: aUser ).
]
