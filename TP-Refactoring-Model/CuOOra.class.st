Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'users',
		'topics',
		'questions'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #accessing }
CuOOra class >> clearSoleInstance [
	soleInstance:= nil
]

{ #category : #constructor }
CuOOra class >> constructorInterface [
	^ self new 
			pruebas .
]

{ #category : #accessing }
CuOOra class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self constructorInterface]
]

{ #category : #adding }
CuOOra >> addQuestion: aQuestion [
	questions add: aQuestion
]

{ #category : #adding }
CuOOra >> addQuestion: aQuestion forUser: aUser [
	aUser addQuestion: aQuestion.
	questions add: aQuestion.
]

{ #category : #adding }
CuOOra >> addTopic: aTopic [
	topics add: aTopic 

]

{ #category : #adding }
CuOOra >> addUser: aUser [
	users add: aUser 

]

{ #category : #adding }
CuOOra >> addUsuario: aUser [
		^ usuarios
		detect: [ :each | 
			each email = aUser email | (each nombre = aUser nombre) ]
		ifNone: [  usuarios add: aUser].
]

{ #category : #adding }
CuOOra >> agregarPregunta: unaPregunta [
	preguntas add: unaPregunta.
]

{ #category : #adding }
CuOOra >> agregarTopico: unTopico [
	topicos detect: [ :topic | topic esIgualA: unTopico ]
	 ifNone:[topicos add: unTopico]
]

{ #category : #'as yet unclassified' }
CuOOra >> buscarUsuario: aUser [

]

{ #category : #accesing }
CuOOra >> calcularPuntaje: user [ 
	|pregUser|
	pregUser := self preguntasDeUser: user.
	^ (( pregUser size) * 20) +
			 (pregUser sumNumbers: [ :each | each calcularPuntaje ]) + (self  puntajeParticipaciones: user) .
]

{ #category : #accesing }
CuOOra >> elegirTopicoInteres: aUser topico: topico [ 
	topicos add: topico.
	aUser agregarTopico: topico.

]

{ #category : #accesing }
CuOOra >> eliminarPregunta: unaPregunta [
	preguntas
		detect: [ :p | p == unaPregunta ]
		ifFound: [ :it | (it preguntaDeUser: unaPregunta user)
				ifTrue:
					[ unaPregunta eliminarRespuestas.
					preguntas remove: unaPregunta ] ]
]

{ #category : #private }
CuOOra >> incluyePregunta: unaPregunta [
	^preguntas includes: unaPregunta.
]

{ #category : #private }
CuOOra >> incluyeTopico: unTopico [
	^topicos includes: unTopico.
]

{ #category : #initialize }
CuOOra >> initialize [
	users := OrderedCollection new.
	topics := OrderedCollection new.
	questions := OrderedCollection new
]

{ #category : #accessing }
CuOOra >> preguntas [
	^ preguntas
]

{ #category : #accesing }
CuOOra >> preguntasDeSeguidores: follows [
	^ preguntas select: [ :each | follows includes: each user ].
]

{ #category : #accesing }
CuOOra >> preguntasDeUnTopico: unTopico [ 
	^ self preguntas select: [ :preg | preg preguntaDeTopico: unTopico ].
]

{ #category : #accesing }
CuOOra >> preguntasDeUser: aUser [
	^ preguntas select: [ :each | each esDe: aUser ].
]

{ #category : #accesing }
CuOOra >> preguntasRelevantes: user [
	^(self preguntasDeUnTopico: user topicoDeInteres ) union: 
		(self preguntasDeSeguidores: user follows ).
]

{ #category : #initialization }
CuOOra >> pruebas [
	| pedro diego juan oo1 test smalltalk admin preg preg1 respuesta respuesta1 topicos1 |
	topicos1 := OrderedCollection new.

	"Nuevo topic"
	oo1 := Topico
		nombre: 'OO1'
		descripcion: 'Información sobre la materia OO1'.
	test := Topico
		nombre: ' Test de unidad'
		descripcion: 'Información sobre los test'.
	smalltalk := Topico
		nombre: 'Smalltalk'
		descripcion: 'Información sobre Smalltalk'.
	self agregarTopico: oo1.
	self agregarTopico: test.
	self agregarTopico: smalltalk.

	"Usuarios: pedro@cuoora.com, diego@cuoora.com, juan@cuoora.com"
	"Nuevo usuario"
	pedro := Usuario
		nombre: 'pedro'
		contrasena: 'pedro'
		email: 'pedro@cuoora.com@gmail.com'.
	topicos1 add: oo1.
	topicos1 add: test.
	preg := Pregunta
		titulo: 'Duda metodo setUp'
		descripcion: '¿Para qué sirve el método SetUp?'
		topicos: topicos1
		user: pedro.
	self agregarPregunta: preg.
	self addUsuario: pedro.
	"Nuevo usuario"
	juan := Usuario
		nombre: 'juan'
		contrasena: 'juan@cuoora.com'
		email: 'juan@cuoora.com'.
	self addUsuario: juan.
	self agregarPregunta: preg.
	"Nuevo usuario"
	topicos1 := OrderedCollection new.
	topicos1 add: oo1.
	topicos1 add: smalltalk.
	diego := Usuario
		nombre: 'diego'
		contrasena: 'diego@cuoora.com'
		email: 'diego@cuoora.com'.
	preg1 := Pregunta
		titulo: '¿Qué significa #messageNotUnderstood?'
		descripcion:
			' Necesito ayuda con este error. ¿Alguien sabe qué significa #messageNotUnderstood?'
		topicos: topicos1
		user: diego.
	self addUsuario: diego.
	self agregarPregunta: preg1.
	respuesta := Respuesta
		text:
			'Sirve para instanciar los objetos que son
evaluados por el test en un único método y que se ejecute
siempre antes de cada test.'
		user: diego.
	respuesta1 := Respuesta
		text:
			'Significa que el objeto que recibió el mensaje
no encontró ningún método para ejecutar en respuesta.'
		user: pedro.
	preg respuestas: respuesta.
	preg1 respuestas: respuesta1.

	"relaciones"
	juan seguirUser: diego.
	pedro seguirUser: juan.







]

{ #category : #accesing }
CuOOra >> puntajeParticipaciones: user [
	^ preguntas sumNumbers:  [ :preg | preg userPuntaje: user ].
]

{ #category : #accessing }
CuOOra >> questions [
	^ questions
]

{ #category : #accesing }
CuOOra >> respuestasDePregunta: unaPregunta [
	 ^ (((preguntas detect: [ :preg | preg == unaPregunta ] ) respuestas)
			asSortedCollection: [:unaResp :otraResp | 
					unaResp puntajeParticipaciones > unaResp puntajeParticipaciones ] ). 
]

{ #category : #accesing }
CuOOra >> respuestasDeUsuario: unUsuario [

	^preguntas flatCollect:[ :preg | preg respuestasDeUser: unUsuario ]

		
]

{ #category : #accessing }
CuOOra >> topicos [
	^ topicos
]

{ #category : #accessing }
CuOOra >> topics [
	^ topics
]

{ #category : #accessing }
CuOOra >> users [
	^ users
]

{ #category : #utility }
CuOOra >> usersMatchingNamePart: aString [
	^ usuarios
		select:
			[ :each | each nombre asLowercase includesSubstring: aString asLowercase ]
]

{ #category : #utilities }
CuOOra >> usuario: unNommbre protectedBy: contraseña [
	^ usuarios
		detect: [ :each | 
			((each email = unNommbre) | (each nombre = unNommbre)
				& (each contrasena = contraseña)) ]
		ifNone: [ nil ]
]

{ #category : #accessing }
CuOOra >> usuarios [
	^ usuarios
]
