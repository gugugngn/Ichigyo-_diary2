// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"// @rails/ujsはmethod: :deleteやremote: trueなどのHTML属性を使った非同期通信やHTTPメソッドの変換を行うために必要
Rails.start()   // @rails/ujsのスタートボタン、これがないと@rails/ujsが実行されない、順番大事よ

import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery";
window.$ = $;
window.jQuery = $;
import "popper.js";
import "bootstrap";
import "../stylesheets/application";
import "./count";


Turbolinks.start()
ActiveStorage.start()


