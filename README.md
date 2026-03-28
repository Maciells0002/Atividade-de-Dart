# 📝 Gerenciador de Tarefas CLI (Dart)

Um aplicativo de linha de comando (CLI) simples e funcional para gerenciar tarefas diárias, desenvolvido em **Dart**. Este projeto é um excelente exemplo de como implementar um CRUD (Create, Read, Update, Delete) básico com persistência em memória e Programação Orientada a Objetos.

---

## 🚀 Funcionalidades

O sistema oferece uma interface interativa via terminal para:

* **➕ Adicionar Tarefas:** Registra um título e uma descrição opcional.
* **📋 Listar Tarefas:** Exibe todas as tarefas com seus respectivos IDs e status de conclusão.
* **📝 Editar Tarefas:** Permite alterar o título e a descrição de uma tarefa existente.
* **🔄 Alternar Status:** Marca ou desmarca uma tarefa como concluída `[X]`.
* **🗑️ Excluir Tarefas:** Remove permanentemente uma tarefa da lista pelo ID.

---

## 🛠️ Tecnologias e Conceitos

Este projeto utiliza:
* **Dart SDK:** Linguagem principal.
* **dart:io:** Biblioteca nativa para manipulação de entrada e saída de dados.
* **POO (Programação Orientada a Objetos):** Divisão de responsabilidades em classes.
* **Null Safety:** Uso de tipos opcionais para evitar erros de referência nula.

---

## 📂 Estrutura do Código

O arquivo `tarefas.dart` é organizado em três camadas:

1.  **Classe Modelo (`Tarefa`):** Define a estrutura dos dados.
2.  **Classe de Lógica (`GerenciadorDeTarefas`):** Gerencia a lista de tarefas e as operações de negócio.
3.  **Interface de Terminal (`main`):** Controla o fluxo do menu e a interação com o usuário.

---

## ⚙️ Como Executar

Para rodar este projeto, você precisa ter o [Dart SDK](https://dart.dev/get-dart) instalado em sua máquina.

1. **Clone o repositório:**
   ```bash
   git clone [https://github.com/seu-usuario/seu-repositorio.git](https://github.com/seu-usuario/seu-repositorio.git)

2. Acesse a pasta: cd seu-repositorio
3. Execute o script: dart tarefas.dart

--- MENU DE TAREFAS ---
1. Adicionar | 2. Listar | 3. Editar | 4. Excluir | 5. Concluir/Abrir | 0. Sair

Escolha: 1
Título: Estudar Flutter

Descrição: Criar meu primeiro app

✅ Tarefa adicionada com sucesso!
