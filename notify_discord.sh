#!/bin/bash

# Verifica se a variável do webhook está definida. Para esse script funcionar, adicione em "Settings" uma secret
# chamada "DISCORD_WEBHOOK_URL" com a URL do webhook
WEBHOOK_URL="$DISCORD_WEBHOOK_URL"
if [ -z "$WEBHOOK_URL" ]; then
  echo "Erro: DISCORD_WEBHOOK_URL não está definido."
  exit 1
fi

EVENT_TYPE="$GITHUB_EVENT_NAME"
EVENT_ACTION=$(jq -r '.action' "$GITHUB_EVENT_PATH")

if [ "$EVENT_TYPE" = "issues" ] && [ "$EVENT_ACTION" = "opened" ]; then
  ISSUE_TITLE=$(jq -r '.issue.title' "$GITHUB_EVENT_PATH")
  ISSUE_URL=$(jq -r '.issue.html_url' "$GITHUB_EVENT_PATH")
  MESSAGE=":rotating_light: Novo problema detectado: [**$ISSUE_TITLE**]($ISSUE_URL)."
elif [ "$EVENT_TYPE" = "issues" ] && [ "$EVENT_ACTION" = "closed" ]; then
  ISSUE_TITLE=$(jq -r '.issue.title' "$GITHUB_EVENT_PATH")
  ISSUE_URL=$(jq -r '.issue.html_url' "$GITHUB_EVENT_PATH")
  MESSAGE=":white_check_mark: Problema resolvido: [**$ISSUE_TITLE**]($ISSUE_URL)."
elif [ "$EVENT_TYPE" = "issue_comment" ] && [ "$EVENT_ACTION" = "created" ]; then
  COMMENT_BODY=$(jq -r '.comment.body' "$GITHUB_EVENT_PATH")
  ISSUE_TITLE=$(jq -r '.issue.title' "$GITHUB_EVENT_PATH")
  ISSUE_URL=$(jq -r '.issue.html_url' "$GITHUB_EVENT_PATH")
  COMMENT_AUTHOR=$(jq -r '.comment.user.login' "$GITHUB_EVENT_PATH")
  MESSAGE=":speech_balloon: Novo comentário de **$COMMENT_AUTHOR** no issue [**$ISSUE_TITLE**]($ISSUE_URL)."
else
  echo "Evento não suportado ou ação não relevante: $EVENT_TYPE/$EVENT_ACTION"
  exit 0
fi

PAYLOAD=$(jq -n --arg content "$MESSAGE" '{content: $content}')

curl -H "Content-Type: application/json" -d "$PAYLOAD" "$WEBHOOK_URL"

echo "Notificação enviada para o Discord."
