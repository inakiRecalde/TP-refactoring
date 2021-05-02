Class {
	#name : #RetrieverTopics,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #'as yet unclassified' }
RetrieverTopics >> retriveQuestions: aUser [
		^	(self ordenarCol: 
						(aUser topics collect:[ :topic | topic questions ]) 
					 de: aUser ).
]
