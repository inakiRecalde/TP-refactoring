Class {
	#name : #RetrieverSocial,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #'as yet unclassified' }
RetrieverSocial >> retriveQuestionz: aUser [
			^((((aUser following 
					collect:[ :follow | follow questions ])
						asSortedCollection:
							[ :a :b | a positiveVotes size > b positiveVotes size ])
								last: 
									(100 min: self size))
									 reject:
										[:q | q user = aUser]).
]
