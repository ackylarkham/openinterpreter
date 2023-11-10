## Open Interpreter コンテナー生成

このリポジトリーでは、Open Interpreterをインストールしたコンテナーを生成するDockerfileを提供します。

Open Interpreterは、指示されたタスクを実行するために必要なpythonライブラリーをインストールします。自分の環境で実行すると思わぬ弊害が生じる可能性もあります。そのため、Open Interpreter専用のコンテナーを用意して実行するようにしたものです。

このDockerfileは、Podman Desktop 1.5.3 / Podman Engine 4.7.2, MacBook Air M2, 2023, macOS Sonoma 14.1で稼働確認しています。 

Open Interpreter公式サイト
https://openinterpreter.com/
