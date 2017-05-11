(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Simditor.i18n = {
    'zh-CN': {
      'PC View': '电脑预览',
      'Mobile View': '手机预览'
    }
  };

  (function(factory) {
    if ((typeof define === 'function') && define.amd) {
      return define(['simditor'], factory);
    } else {
      return factory(window.Simditor);
    }
  })(function(Simditor) {
    var DevicesButton;
    DevicesButton = (function(_super) {
      __extends(DevicesButton, _super);

      DevicesButton.prototype.name = 'devices';

      DevicesButton.prototype.title = 'devices';

      function DevicesButton() {
        this.isExpand = false;
        DevicesButton.__super__.constructor.apply(this, arguments);
      }

      DevicesButton.prototype._init = function() {
        this.menu = [
          {
            name: 'v1',
            text: this._t('PC View'),
            param: 'pc'
          }, {
            name: 'v2',
            text: this._t('Mobile View'),
            param: 'mobile'
          }
        ];
        DevicesButton.__super__._init.apply(this, arguments);
        return this.setIcon('devices-viewer');
      };

      DevicesButton.prototype.setIcon = function(icon) {
        return this.el.find('span').removeClass().addClass('icon-' + icon);
      };

      DevicesButton.prototype.openViewer = function(content, type) {
        var css, html, title;
        title = this._t('Mobile View');
        css = 'mobile';
        if (type === 'pc') {
          title = this._t('PC View');
          css = 'pc';
        }
        html = "<html>\n  <head>\n    <title>" + title + "</title>\n    <link rel=\"stylesheet\" href=\"styles/simditor-devices-" + css + ".css\">\n  </head>\n  <body>\n    <div class=\"simditor-device\">\n      <div class=\"simditor-content\">\n        " + content + "\n      </div>\n    </div>\n  </body>\n</html>";
        this.win = window.open('about:blank');
        return this.win.document.write(html);
      };

      DevicesButton.prototype.command = function(param) {
        return this.openViewer(this.editor.getValue(), param);
      };

      return DevicesButton;

    })(Simditor.Button);
    return Simditor.Toolbar.addButton(DevicesButton);
  });

}).call(this);
