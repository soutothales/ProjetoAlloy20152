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
	all aluno:Aluno | AlunoPertenceAula[aluno]

}

pred AlunoPertenceAula[a:Aluno]{
	one a.~alunos
	
}


pred show[]{
}
run show for 3
