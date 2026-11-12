```bash
docker compose up -d
docker exec -it aula-postgres psql -U aluno -d aula -c '\dt'
```

Conexão: `localhost:5432`, banco `aula`, usuário `aluno`, senha `aluno123`.
