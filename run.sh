set -e

read -p "Digite o nome do projeto: " PROJECT_NAME

BASE_DIR="$HOME/Banco"

if [ ! -d "$BASE_DIR" ]; then
  echo "📂 Criando diretório Banco em $HOME"
  mkdir -p "$BASE_DIR"
fi

PROJECT_DIR="$BASE_DIR/$PROJECT_NAME"

if [ -d "$PROJECT_DIR" ]; then
  echo "⚠️ O diretório $PROJECT_DIR já existe!"
  read -p "Deseja sobrescrever? (s/n): " CONFIRM
  if [ "$CONFIRM" != "s" ]; then
    echo "❌ Cancelado."
    exit 1s
  fi
  rm -rf "$PROJECT_DIR"
fi

mkdir -p "$PROJECT_DIR"/{migrations,scritp,seeds,procedures,triggers,views}

cat > "$PROJECT_DIR/README.md" <<EOF
# $PROJECT_NAME

EOF

cat > "$PROJECT_DIR/.gitignore" <<EOF
*.log
EOF

cat > "$PROJECT_DIR/run.sh" <<EOF

EOF

cat > "$PROJECT_DIR/migrations/master.sql" <<EOF
-- Script inicial para criação do banco do projeto $PROJECT_NAME
CREATE DATABASE IF NOT EXISTS ${PROJECT_NAME}_db
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_0900_as_cs;

USE ${PROJECT_NAME}_db;
EOF

touch "$PROJECT_DIR/seeds/dados.sql"

echo "✅ Projeto '$PROJECT_NAME' criado em $PROJECT_DIR"
