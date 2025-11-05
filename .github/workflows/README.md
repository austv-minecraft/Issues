# GitHub Actions Workflows

Este diretório contém os workflows automatizados do repositório.

## Workflows Disponíveis

### 1. add-to-project.yml
Adiciona automaticamente issues novas à coluna "Backlog" do Project v2.

**Trigger:** Quando uma issue é aberta
**Secrets necessários:** 
- `GH_PROJECT_PAT` ou `PROJECT_TOKEN` ou `PROJECTS_TOKEN`

---

### 2. assign-responsable.yml
Atribui automaticamente responsáveis às issues com base no servidor referenciado.

**Trigger:** Quando uma issue é aberta ou reaberta
**Exemplo:** Issues do servidor Skyten são automaticamente atribuídas a @Micosedeunha

---

### 3. assign-servers.yml (label_issues)
Adiciona labels automaticamente às issues com base no conteúdo (gravidade e servidor).

**Trigger:** Quando uma issue é aberta ou reaberta
**Labels adicionadas:**
- Gravidade: →🟢 (Baixa), →🟡 (Média), →🟠 (Alta), →🔴 (Urgência total)
- Servidor: sv: lobby, sv: vanillew, sv: ausevento, sv: skyten, sv: henesys

---

### 4. notify_discord.yml
Envia notificações ao Discord quando issues são abertas, fechadas ou comentadas.

**Trigger:** Issues (opened, closed) e comentários em issues
**Secrets necessários:**
- `DISCORD_WEBHOOK_URL`

---

### 5. notify-review-test.yml ✨ NOVO
Envia notificações ao Discord quando uma issue é movida para a coluna "Review/Test".

**Trigger:** 
- Itens do Project v2 editados (requer webhook na organização)
- Issues com label contendo "review" ou "test" (fallback)

**Secrets necessários:**
- `DISCORD_WEBHOOK_REVIEW_TEST` ou `DISCORD_WEBHOOK_URL`: URL do webhook do Discord
- `DISCORD_REVIEW_ROLE_ID` (opcional): ID do cargo Discord a ser mencionado
- `GH_PROJECT_PAT` ou `PROJECT_TOKEN` ou `PROJECTS_TOKEN` (para eventos projects_v2_item)

**Como configurar:**

1. **Criar webhook no Discord:**
   - Vá até o canal do Discord onde deseja receber notificações
   - Configurações do Canal > Integrações > Webhooks > Novo Webhook
   - Copie a URL do webhook

2. **Obter ID do cargo (opcional):**
   - Ative o "Modo Desenvolvedor" no Discord (Configurações de Usuário > Avançado)
   - Vá em Configurações do Servidor > Roles
   - Clique com botão direito no cargo desejado > Copiar ID

3. **Adicionar secrets no GitHub:**
   - Settings > Secrets and variables > Actions > New repository secret
   - Adicione `DISCORD_WEBHOOK_REVIEW_TEST` com a URL do webhook
   - Adicione `DISCORD_REVIEW_ROLE_ID` com o ID do cargo (opcional)

**Formato da mensagem:**
```
@Role :mag: Issue movida para Review/Test: [**Título da Issue**](URL)
```

---

### 6. remove-status-labels.yml
Remove labels de status antigos quando uma issue é atualizada.

**Trigger:** Configurado conforme necessário

---

## Como Adicionar Secrets

1. Vá em **Settings** do repositório
2. Clique em **Secrets and variables** > **Actions**
3. Clique em **New repository secret**
4. Adicione o nome e valor do secret
5. Clique em **Add secret**

## Testando Workflows

Você pode testar workflows manualmente usando a aba **Actions** no GitHub:

1. Vá em **Actions**
2. Selecione o workflow desejado
3. Clique em **Run workflow** (se disponível)
4. Selecione a branch e clique em **Run workflow**

## Troubleshooting

### Workflow não está sendo executado
- Verifique se os secrets necessários estão configurados
- Verifique os logs do workflow na aba Actions
- Confirme que o evento de trigger está correto

### Notificação Discord não está sendo enviada
- Verifique se a URL do webhook está correta
- Teste a URL do webhook usando curl:
  ```bash
  curl -H "Content-Type: application/json" \
    -d '{"content": "Teste"}' \
    YOUR_WEBHOOK_URL
  ```
- Verifique se o webhook não foi deletado ou desabilitado no Discord

### Erro de permissões no Project v2
- Verifique se o PAT tem as permissões corretas (project, repo, read:org)
- Confirme que o usuário do PAT é membro da organização
- Se a organização usa SSO, autorize o PAT para SSO
