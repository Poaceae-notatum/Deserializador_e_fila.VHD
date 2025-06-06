# Deserializador_e_fila.VHD

Este projeto é parte de uma atividade acadêmica da disciplina de Sistemas Digitais.

O objetivo é desenvolver um circuito em VHDL que conecta duas entidades com clocks diferentes utilizando um componente "TOP".

## Descrição:

O projeto consiste na implementação de um **deserializador** e uma **fila**, ambos com sinais de clock distintos. A interligação entre as entidades é feita por um módulo principal chamado **TOP**, responsável por coordenar a comunicação entre elas de forma sincronizada.

### Entidades envolvidas:
- **Deserializador**: Recebe informação bit por bit e salva cada um em um vetor "vazio" de 8 bits, do qual ele devolve quando cheio, funcionando com 100KHz.
- **Fila**: Armazena 8 vetores de 8 bits, funcionando com 10KHz.
- **TOP**: Componente principal que integra o deserializador e a fila, garantindo que ocorra a troca de dados corretamente entre os domínios de clock diferentes.

## Tecnologias Utilizadas

- **VHDL** (VHSIC Hardware Description Language).
- Simulações feitas com ferramentas como ModelSim/Quartus.

## Como Executar

1. Abra o projeto em sua ferramenta de simulação ou desenvolvimento VHDL.
2. Execute o arquivo sim.do, que compila e começa a simulação, ja adicionando as ondas.
3. Verifique o comportamento da comunicação entre os domínios de clock.

## Status do Projeto

- ✅ Estrutura básica implementada.
- 🛠️ Finalizado, com os modulos funcionando de forma correta.
- 📘 Documentação concluida.

## Resultados obtidos

- Os testbench's de cada modulo.
- O DSRL_tb mostra o deserializador se enchendo e ligando o sinal de Data_ready, não aceitando mais "inputs" até que seja providenciado o sinal ack_in, acknowledge, que limpa e libera o deserializador para receber novos inputs.
- O Fila_tb mostra todos os modulos da fila sendo preenchidos e depois sendo esvaziado.
- O TB, sendo o testbench principal, demonstra os dois modulos trabalhando em paralelo rodando no TOP, com a Fila recebendo os dados do Deserializador, demonstrando o caso em que o deserializador "trava" pois a fila esta cheia e o caso em que se é inserido e retirado da fila sem que ela atrapalhe o deserializador.
  
## Autores

Guilherme Langaro B. Silva. 
Felipe Santos.
