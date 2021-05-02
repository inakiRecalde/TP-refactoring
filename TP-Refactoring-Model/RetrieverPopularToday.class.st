Class {
	#name : #RetrieverPopularToday,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #'as yet unclassified' }
RetrieverPopularToday >> popularCol [
	^cuoora questions select:[:q | (q timestamp asDate = Date today )].
]

{ #category : #'as yet unclassified' }
RetrieverPopularToday >> retriveQuestions: aUser [
	^ (self ordenarCol: 
		(self popularCol select: [:q | q positiveVotes size >= 
			((cuoora questions sumNumbers: [:qu | qu positiveVotes size ]) / self popularCol size) ])	 
		de: aUser).
							
]
