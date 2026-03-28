import 'dart:io';

// --- 1. CLASSE MODELO ---
class Tarefa {
  int id;
  String titulo;
  String descricao;
  bool concluida;

  Tarefa({
    required this.id,
    required this.titulo,
    this.descricao = '',
    this.concluida = false,
  });

  @override
  String toString() {
    String status = concluida ? '[X]' : '[ ]';
    return '$id. $status $titulo ${descricao.isNotEmpty ? "($descricao)" : ""}';
  }
}

// --- 2. CLASSE DE LÓGICA (GERENCIADOR) ---
class GerenciadorDeTarefas {
  List<Tarefa> _tarefas = [];
  int _proximoId = 1;

  void adicionar(String titulo, String descricao) {
    _tarefas.add(Tarefa(id: _proximoId++, titulo: titulo, descricao: descricao));
    print('✅ Tarefa adicionada com sucesso!');
  }

  void listar() {
    if (_tarefas.isEmpty) {
      print('\n📭 Nenhuma tarefa cadastrada.');
      return;
    }
    print('\n📋 LISTA DE TAREFAS:');
    _tarefas.forEach((t) => print(t));
  }

  void editar(int id, String novoTitulo, String novaDescricao) {
    var tarefa = _buscarPorId(id);
    if (tarefa != null) {
      tarefa.titulo = novoTitulo;
      tarefa.descricao = novaDescricao;
      print('📝 Tarefa atualizada!');
    } else {
      print('❌ Erro: Tarefa ID $id não encontrada.');
    }
  }

  void excluir(int id) {
    int tamanhoInicial = _tarefas.length;
    _tarefas.removeWhere((t) => t.id == id);
    if (_tarefas.length < tamanhoInicial) {
      print('🗑️ Tarefa removida!');
    } else {
      print('❌ Erro: Tarefa ID $id não encontrada.');
    }
  }

  void alternarStatus(int id) {
    var tarefa = _buscarPorId(id);
    if (tarefa != null) {
      tarefa.concluida = !tarefa.concluida;
      print('🔄 Status alterado!');
    } else {
      print('❌ Erro: Tarefa ID $id não encontrada.');
    }
  }

  Tarefa? _buscarPorId(int id) {
    try {
      return _tarefas.firstWhere((t) => t.id == id);
    } catch (e) {
      return null;
    }
  }
}

// --- 3. INTERFACE DE TERMINAL (MAIN) ---
void main() {
  final gerenciador = GerenciadorDeTarefas();
  bool executando = true;

  while (executando) {
    print('\n--- MENU DE TAREFAS ---');
    print('1. Adicionar | 2. Listar | 3. Editar | 4. Excluir | 5. Concluir/Abrir | 0. Sair');
    stdout.write('Escolha: ');
    String? opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        stdout.write('Título: ');
        String titulo = stdin.readLineSync() ?? '';
        stdout.write('Descrição (opcional): ');
        String desc = stdin.readLineSync() ?? '';
        gerenciador.adicionar(titulo, desc);
        break;

      case '2':
        gerenciador.listar();
        break;

      case '3':
        stdout.write('ID da tarefa para editar: ');
        int? id = int.tryParse(stdin.readLineSync() ?? '');
        if (id != null) {
          stdout.write('Novo Título: ');
          String t = stdin.readLineSync() ?? '';
          stdout.write('Nova Descrição: ');
          String d = stdin.readLineSync() ?? '';
          gerenciador.editar(id, t, d);
        }
        break;

      case '4':
        stdout.write('ID da tarefa para excluir: ');
        int? id = int.tryParse(stdin.readLineSync() ?? '');
        if (id != null) gerenciador.excluir(id);
        break;

      case '5':
        stdout.write('ID da tarefa para alternar status: ');
        int? id = int.tryParse(stdin.readLineSync() ?? '');
        if (id != null) gerenciador.alternarStatus(id);
        break;

      case '0':
        executando = false;
        print('👋 Tchau!');
        break;

      default:
        print('⚠️ Opção inválida!');
    }
  }
}