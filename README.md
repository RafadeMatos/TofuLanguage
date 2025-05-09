


# TOFULANGUAGE

````Text

████████╗ ██████╗ ███████╗██╗   ██╗██╗      █████╗ ███╗   ██╗ ██████╗ ██╗   ██╗ █████╗ ██╗   ██╗███████╗
╚══██╔══╝██╔═══██╗██╔════╝██║   ██║██║     ██╔══██╗████╗  ██║██╔═══██╗██║   ██║██╔══██╗██║   ██║██╔════╝
   ██║   ██║   ██║█████╗  ██║   ██║██║     ███████║██╔██╗ ██║██║   ██║██║   ██║███████║██║   ██║█████╗  
   ██║   ██║   ██║██╔══╝  ██║   ██║██║     ██╔══██║██║╚██╗██║██║   ██║╚██╗ ██╔╝██╔══██║██║   ██║██╔══╝  
   ██║   ╚██████╔╝██║     ╚██████╔╝███████╗██║  ██║██║ ╚████║╚██████╔╝ ╚████╔╝ ██║  ██║╚██████╔╝███████╗
   ╚═╝    ╚═════╝ ╚═╝      ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝   ╚═══╝  ╚═╝  ╚═╝ ╚═════╝ ╚══════╝


Time Oriented Functional Utillity Language — Compiled programming language  █▓▒

  ▓│ OS: Cross-platform          │ Theme: Dev Tools               ▒
  ▒│ Level: High-Level           │ Design: Clean & Expressive     ▓
  ▓│ Engine: Custom Compiler     │ Model: Static Binary Output    ▒
  ▒│ Target: Academic            │ Syntax: PoinDEXTERS.           ▓
  ▓│ Status: Early Development   │ License: MIT                   ▒
`````



Time Oriented Functional Utillity Language (TOFULANGUAGE) é uma linguagem de programação compilada, de alto nível, inspirada na elegância e na simplicidade do Ruby. Criada com propósito acadêmico e experimental, seu foco é explorar estruturas de compiladores modernos com uma sintaxe amigável, limpa e expressiva.

![Logo](TofuLogo.jpeg) 

---

## ⚛️ Objetivos

1. Criar uma linguagem experimental para estudo de compiladores
2. Implementar todas as fases de compilação:

   - Análise léxica/sintática
   - Checagem semântica
   - Geração de código (LLVM/WASM)
     
3. Estimular aprendizado e contribuição acadêmica em ciências da computação 

---

⚛️ Features Principais 


###1. Sistema de Tipos Híbrido

```tofu
-- Tipagem estática com inferência
def fatorial(n: Int) -> Int:
  if n == 0 then 1 else n * fatorial(n - 1)

-- Tipos algébricos
type Result:
  | Ok(value: Any)
  | Err(message: String)
```

###2. Patern Matching 
```tofu
def avaliar(expr):
  match expr:
    | Add(lhs, rhs) => avaliar(lhs) + avaliar(rhs)
    | Literal(val)   => val
    | _              => panic("Expressão inválida")
```

## ⚛️ Características Previstas

- Sintaxe limpa e acessível  
- Tipagem opcional com inferência  
- Compilação para bytecode otimizado  
- Criação de DSLs de forma intuitiva  
- Ferramentas de depuração integradas  

---

## 🌎 OpenSource & Comunidade Acadêmica 

-- TofuLanguage é um projeto aberto e construído colaborativamente em
principios =


  - 🧑‍🔬 Foco em pesquisa em compiladores",
  - 🔓 Código 100% aberto (MIT License)",
  - 📚 Prioridade em documentação técnica",
  - 🤝 Contribuições de todos os níveis são bem-vindas"


---

### 🎓 **Como Acadêmicos Podem Contribuir**

1. **Implementando Features Teóricas**  
   - Sistemas de tipos avançados  
   - Otimizações baseadas em papers
  
-- Exemplo: Implementando uma otimização de Paper
optimization PartialEvaluation:

```
optimization PartialEvaluation:
  paper_ref: "https://doi.org/10.1145/512950.512973"
  rules:
    | Mul(_, Literal(0)) => Literal(0)
```

2. **Escrevendo Documentação Formal**  
   - Semântica operacional em LaTeX  
   - Provas de correção para features

3. **Construindo Ferramentas Adjacentes**  
   - Visualizadores de IR  
   - Plugins para provadores formais (Coq/Agda)  

4. **Publicando Casos de Estudo**  
   - Na pasta `/research/` do repositório
-
```
📂 research/
├── type-system.md
├── compilation-phases.pdf
└── benchmarks/
```

### 📜 **Licença MIT**

Permissões:
- Uso comercial/acadêmico ilimitado
- Modificação e distribuição
- Só exige atribuição e licença igual

Leia o LICENSE.md completo no repositório.

---

### 🧪 **Laboratório de Ideias**
Estamos especialmente interessados em propostas que:

- Combinem TofuLang com teoria de linguagens formais  
- Adaptem técnicas de compilação para novos paradigmas  
- Integrem com ferramentas de verificação formal  

-- Exemplo de issue marcada como "research"
issue #42: "Implementar efeitos algébricos baseado em [PaperX]"
labels: ["academic", "type-system", "help-wanted"]

