// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.





import Rails from "@rails/ujs"; // @rails/ujsをインポート
import "jquery"; // jQueryをインポート

Rails.start(); // @rails/ujsのスタートボタン

window.$ = $; // jQueryをグローバルに定義
window.jQuery = $; // jQueryをグローバルに定義

import Turbolinks from "turbolinks"; // Turbolinksのインポート
import * as ActiveStorage from "@rails/activestorage"; // ActiveStorageのインポート
import "popper.js"; // Bootstrap用のPopper.js
import "bootstrap"; // Bootstrapをインポート
import "../stylesheets/application"; // スタイルシートのインポート
import "./count"; // 他のJavaScriptモジュールをインポート

Turbolinks.start(); // Turbolinksをスタート
ActiveStorage.start(); // ActiveStorageをスタート
