Class {
	#name : #Question,
	#superclass : #Object,
	#instVars : [
		'title',
		'answers',
		'topics',
		'timestamp',
		'user',
		'votes',
		'description'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #'instance creation' }
Question class >> newWithTitle: title description: aDescription user: aUser [
	^ self new
		title: title
		description: aDescription
		user: aUser
		yourself.
]

{ #category : #'instance creation' }
Question class >> newWithTitle: title description: aDescription user: aUser topic: aTopic [
	^ self new
		title: title
		description: aDescription
		user: aUser
		topic: aTopic
		yourself.
]

{ #category : #adding }
Question >> addTopic: aTopic [
	topics add: aTopic.
	aTopic addQuestion: self.

]

{ #category : #adding }
Question >> addVote: aVote [
	votes add: aVote
]

{ #category : #accessing }
Question >> description [
	^ description
]

{ #category : #'initalize-release' }
Question >> initialize [
	answers := OrderedCollection new.
	topics := OrderedCollection new.
	votes := OrderedCollection new.
	timestamp := DateAndTime now.
]

{ #category : #'as yet unclassified' }
Question >> negativeVotes [
	^ votes reject:[:vote | vote isLike].

]

{ #category : #'as yet unclassified' }
Question >> positiveVotes [
	^ votes select:[:vote | vote isLike].

]

{ #category : #accessing }
Question >> timestamp [
	^ timestamp
]

{ #category : #private }
Question >> timestamp: anObject [
	timestamp := anObject
]

{ #category : #accessing }
Question >> title [
	^title 
]

{ #category : #'instance creation' }
Question >> title: aTitle description: aDescription user: aUser [
	title:= aTitle.
	description:= aDescription .
	user:= aUser.
]

{ #category : #'instance creation' }
Question >> title: aTitle description: aDescription user: aUser topic: aTopic [
		
		self title: aTitle description: aDescription user: aUser.
		topics add: aTopic.
		
]

{ #category : #accessing }
Question >> topics [
	^topics 
]

{ #category : #accessing }
Question >> user [
	^ user
]

{ #category : #accessing }
Question >> votes [
	^ votes
]
