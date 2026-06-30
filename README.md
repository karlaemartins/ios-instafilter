# Instafilter - Projeto de Estudo

Aplicativo desenvolvido em **UIKit** para importação, edição e salvamento de imagens utilizando **Core Image**.
O projeto permite aplicar diferentes filtros, ajustar seus parâmetros em tempo real e salvar o resultado na biblioteca de fotos. Ele faz parte do **Project 13** do curso **100 Days of Swift**, mas foi adaptado com foco em organização, arquitetura e escalabilidade, simulando uma estrutura mais próxima de projetos utilizados no mercado.

## O que o app faz

- Importa imagens da biblioteca de fotos
- Aplica diferentes filtros utilizando Core Image
- Permite alterar o filtro dinamicamente
- Ajusta intensidade e raio do filtro em tempo real
- Salva a imagem editada na biblioteca de fotos
- Exibe feedback de sucesso ou erro durante o salvamento

## Arquitetura

Foi estruturado com separação de responsabilidades, isolando a lógica de processamento de imagens da interface e organizando a navegação através do padrão Coordinator.

## Decisões importantes

- UIKit programático (sem Storyboard)
- Arquitetura MVVM
- Coordinator Pattern
- Separação de responsabilidades através de Services
- Dependency Injection utilizando Protocols
- Delegate Pattern para comunicação entre as camadas
- Estrutura preparada para evolução de novos filtros e parâmetros

## Melhorias em relação ao projeto original

Comparado ao projeto apresentado no curso, foram realizadas algumas adaptações:

- Arquitetura reorganizada utilizando **MVVM** e **Coordinator**
- Criação de um **FilterService** responsável exclusivamente pelo processamento das imagens
- Criação do modelo **FilterParameters**, permitindo adicionar novos parâmetros aos filtros sem alterar a assinatura do serviço
- Encapsulamento da `PhotoFilterView`, expondo apenas métodos necessários para atualização da interface
- Organização da `ViewController`
- Botões **Save** e **Change Filter** permanecem desabilitados até que uma imagem seja selecionada
- O botão de seleção de filtros passa a exibir o nome do filtro atualmente escolhido
- Controles independentes para ajuste de **Intensity** e **Radius**, acompanhados por rótulos para melhorar a experiência do usuário

## Conceitos praticados

- UIKit
- Core Image
- CIFilter
- CIContext
- UIImagePickerController
- MVVM
- Coordinator Pattern
- Protocol-Oriented Programming
- Dependency Injection
- Delegate Pattern
- Auto Layout
- Photo Library
- Manipulação de imagens

## Créditos

Projeto baseado no **Project 13 – Instafilter**, do curso **100 Days of Swift**, criado por **Paul Hudson (Hacking with Swift)**.
