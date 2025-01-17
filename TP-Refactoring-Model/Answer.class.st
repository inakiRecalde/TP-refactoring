Class {
	#name : #Answer,
	#superclass : #Object,
	#instVars : [
		'question',
		'timestamp',
		'user',
		'votes',
		'description'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #'instance creation' }
Answer class >> new: anAnswer user: aUser question: aQuestion [
	^ self new
		description: anAnswer
		user: aUser
		question: aQuestion
		yourself .
]

{ #category : #adding }
Answer >> addVote: aVote [
	votes add: aVote
]

{ #category : #accessing }
Answer >> description [
	^ description
]

{ #category : #'as yet unclassified' }
Answer >> description: anAnswer user: aUser question: aQuestion [
	description := anAnswer .
	user:= aUser.
	question := aQuestion.
]

{ #category : #initialize }
Answer >> initialize [
	votes := OrderedCollection new.
	timestamp := DateAndTime now.
]

{ #category : #accessing }
Answer >> isTopAnswer [
	.
	^ self positiveVotes >=  ((question sum: [:answer | answer positiveVotes size ]) / question answer size )
]

{ #category : #'as yet unclassified' }
Answer >> negativeVotes [
	| r |
	r := OrderedCollection new.
	votes do:[:vote | vote isLike ifFalse:[r add: vote]].
	^r
]

{ #category : #'as yet unclassified' }
Answer >> positiveVotes [
	| r |
	r := OrderedCollection new.
	votes do:[:vote | vote isLike ifTrue:[r add: vote]].
	^r
]

{ #category : #accessing }
Answer >> timestamp [
	^ timestamp
]

{ #category : #private }
Answer >> timestamp: anObject [
	timestamp := anObject
]

{ #category : #accessing }
Answer >> user [
	^ user
]

{ #category : #accessing }
Answer >> votes [
	^ votes
]
