module treinoNatacao

sig Aula {
	alunos:some Aluno
}

sig Aluno{
	nados:some Nado
}

sig AlunoAvancado extends Aluno {}

sig AlunoIniciante extends Aluno {}

abstract sig Nado{}

sig NadoCrawlBilateral, NadoCrawlUnilateral, NadoPeito, NadoBorboleta,
NadoCostas extends Nado{}

abstract sig NadoPernada extends Nado{}

sig NadoPernadaPrancha, NadoPernadaPeDePato extends NadoPernada{}

fact AlunosFact{
	Aluno = AlunoAvancado + AlunoIniciante
	#AlunoAvancado = 4
	#AlunoIniciante = 4
	all aluno:Aluno | AlunoPertenceAula[aluno]
	--aluno iniciante deve ter 2 ou 3 nados
	all aluno:AlunoIniciante | (#NadosDoAluno[aluno] = 2 or #NadosDoAluno[aluno] = 3)
	--aluno avançado deve ter 4 nados e não pode nadar crawl unilateral
	all aluno:AlunoAvancado | NadoCrawlUnilateral !in NadosDoAluno[aluno]
	all aluno:AlunoAvancado | #NadosDoAluno[aluno] = 4

}

fact NadosFact{
	#NadoCrawlUnilateral = 2
	#NadoCrawlBilateral = 1
	#NadoPeito = 1
	#NadoBorboleta = 1
	#NadoCostas = 1
	#NadoPernadaPrancha = 1
	#NadoPernadaPeDePato = 1

}

fact AulaFact{
	#Aula = 1
}

pred AlunoPertenceAula[a:Aluno]{
	one a.~alunos
	
}

fun NadosDoAluno[a:Aluno] :set Nado{
	a.nados

}

pred show[]{
}
run show for 8
