Class {
	#name : #RetrieverSocial,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #'as yet unclassified' }
RetrieverSocial >> retriveQuestions: aUser [
			^ (self ordenarCol: 
					(aUser following collect:[ :follow | follow questions ]) 
					de: aUser )
						
]
