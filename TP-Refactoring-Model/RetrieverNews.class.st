Class {
	#name : #RetrieverNews,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #'as yet unclassified' }
RetrieverNews >> retriveQuestionz: aUser [
	^ ((((cuoora questions 
			select: [:q | (q timestamp asDate = Date today)])
				asSortedCollection:
					[ :a :b | a positiveVotes size > b positiveVotes size ])
					last:
						(100 min: self size))
						reject:
							[:q | q user = aUser])
]
