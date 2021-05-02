Class {
	#name : #RetrieverTopics,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #'as yet unclassified' }
RetrieverTopics >> retriveQuestionz: aUser [
		^	((((aUser topics 
				collect:
					[ :topic | topic questions ])
					asSortedCollection:
						[ :a :b | a positiveVotes size > b positiveVotes size ])
			  			last: 
							(100 min: self size))
							reject:
										[:q | q user = aUser]).
]
