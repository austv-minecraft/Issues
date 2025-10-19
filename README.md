<div align="center">
  <h1>🏷️ Issue Tracker</h1>
  <p>Repositório organizador de report de problemas e tarefas.</p>

  [![Tecnologias](https://skillicons.dev/icons?i=githubactions,github,bash,discord)](https://skillicons.dev)

  ![GitHub contributors](https://img.shields.io/github/created-at/leogianfagna/IssueTracker) ![GitHub Issues or Pull Requests](https://img.shields.io/github/issues-closed/leogianfagna/IssueTracker)

</div>

Use esse repositório como template para desenvolver seu software de forma aberta, para que usuários possam reportar bugs e problemas, e a equipe de desenvolvimento possa **resolver e desenvolver de forma organizada**, recebendo atribuições, notificações e labels de forma **automática**.

Esse modelo foi usado durante 3 anos para a organização de uma empresa, que evoluiu e corrigiu o material durante esse tempo. Utiliza os `issues` para reportar bugs ou descrever tarefas e `discussions` para promover ideias e discussões sobre novidades.

Consiste em rotular issues de acordo com prioridade para seguir uma linha de trabalho mais eficiente e também em categorias para organizar em tópicos e deixar o **ambiente de desenvolvimento mais limpo**. Além disso, designar os problemas para os responsáveis adequados, acelerando o processo. As ideias são rotuladas em ordem de relevância para conseguir trabalhar naquilo que parece ser mais justo no momento.

Todas as etapas são notificadas via Discord com o script automático que envia links do que está sendo aberto. O webhook é totalmente customizável para que a equipe se adeque no canal correto e possa ver como está sendo o progresso do software.

<div align="center">
  <h1>Features</h1>
  <img width="60%" src="https://github.com/user-attachments/assets/ad830799-40ee-418f-802d-42c53048c47f" alt="leogianfagna"/>
</div>

### 📑 Templates para aberturas de issues:
Modelos que exigem preenchimentos de dados importantes. É muito ruim quando reportam uma inconsistencia, mas não te falam como reproduzí-la, não é?

### 🏷️ Labels de issues automáticos
Baseado nas condições inseridas pelo usuário no issue, é rotulado automaticamente. Assim fica muito mais fácil saber sobre o que se trata, e também saber se vai dar aquele trabalhinho pra resolver.

### 👤 Rotular responsáveis baseado em condições:
Como os issues são categorizados, automaticamente rotula os responsáveis para resolver aquele determinado problema. Muito prático.

### 🔴 Prioridade
Classifica os issues em 6 níveis de prioridade, com o objetivo de fazer que o mais crítico sempre seja resolvido primeiro. Isso foi uma solução imposta após uma comunidade de usuários reclamar da demora de resolver bugs que estavam estragando a experiência.

### 🗣️ Banco de ideias e melhorias
A aba de [discussões](https://github.com/leogianfagna/IssueTracker/discussions) permite escrever [ideias](https://github.com/leogianfagna/IssueTracker/discussions/categories/ideia?discussions_q=) e [discutir melhorias](https://github.com/leogianfagna/IssueTracker/discussions/categories/opinioes?discussions_q=), criando um incrível banco com muitos dados importantes no desenvolvimento. Os Discussions do GitHub permite comentários organizados e nessa, também inclui prioridades nas ideias e níveis de relevância. Não vamos se preocupar com aquela ideia mais ou menos né?

### 📣 Notificação do Discord
Um script que notifica o desenvolvimento no Discord, sempre mantendo todos atualizados do que está acontecendo. Assim, ninguém abre aquele issue e some, e aquele que quer saber o que está rolando com o que foi reportado, vai receber em primeira mão. Para funcionar, você precisa criar uma secret com id `DISCORD_WEBHOOK_URL` incluindo o webhook de qualquer canal seu do Discord.



