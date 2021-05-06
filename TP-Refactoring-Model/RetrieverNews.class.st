Class {
	#name : #RetrieverNews,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #'as yet unclassified' }
RetrieverNews >> retrieveQuestions: aUser [
	^ (self ordenarCol: (cuoora questions 
			select: [:q | (q timestamp asDate = Date today)]) de: aUser).
				
]
