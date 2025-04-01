<!-- プロジェクト名を記載 -->

# Hyper-V 環境構築用モジュール(仮想スイッチ作成)

## 使用技術一覧

<!-- シールド一覧を記載 -->

[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
[![Terraform](https://img.shields.io/badge/-Terraform-007ACC.svg?logo=terraform&style=flat)](Code)
[![Hyper-v](http://img.shields.io/badge/Virtualization-Hyperv-Green.svg?style=flat)](Virtualization)

---

<!-- 目次を記載 -->

## 目次

- [Hyper-V 環境構築用モジュール(仮想スイッチ作成)](#hyper-v-環境構築用モジュール仮想スイッチ作成)
  - [使用技術一覧](#使用技術一覧)
  - [目次](#目次)
    - [概要](#概要)
    - [変数一覧](#変数一覧)
    - [機能一覧](#機能一覧)
    - [トラブルシューティング](#トラブルシューティング)

---

<!-- プロジェクトの説明を記載 -->

### 概要

Terraform Hyper-V プロバイダを用いた Hyper-v 環境内仮想スイッチの作成モジュールとなります。<br>

仮想スイッチマネージャーへの操作のみ行います。
その為、仮想マシン作成時に本処理で作成した仮想スイッチを利用する場合には注意下さい。<br>

<!-- プロジェクトの概要を記載 -->

### 変数一覧

仮想スイッチ作成に使用する変数を以下表に記載します。<br>
変数は実行ファイルより読み取ります。<br>
<br>

| 変数名   | 型     |
| :------- | :----- |
| VSW_NAME | string |
| NOTES    | string |

---

<!-- 実装機能の概要を記載 -->

### 機能一覧

モジュール内に定義しているリソース機能は以下の通り。<br>

1. 仮想スイッチ作成

<!-- ディレクトリ構成を記載 -->

---

<!-- 導入補法を記載 -->

<!-- トラブル時の対処法を記載 -->

### トラブルシューティング

- terraform aplly 実行時"wsarecv: An existing connection was forcibly closed by the remote host."もしくは"401"エラーが表示される場合は WinRM の接続構成を確認して下さい。
