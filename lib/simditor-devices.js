(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  (function(factory) {
    if ((typeof define === 'function') && define.amd) {
      return define(['simditor'], factory);
    } else {
      return factory(window.Simditor);
    }
  })(function(Simditor) {
    var DriversButton;
    DriversButton = (function(_super) {
      __extends(DriversButton, _super);

      DriversButton.prototype.name = 'drivers';

      DriversButton.prototype.title = 'drivers';

      function DriversButton() {
        this.isExpand = false;
        DriversButton.__super__.constructor.apply(this, arguments);
      }

      DriversButton.prototype._init = function() {
        this.shortcut = 'esc';
        DriversButton.__super__._init.apply(this, arguments);
        return this.setIcon('expand');
      };

      DriversButton.prototype.setIcon = function(icon) {
        return this.el.find('span').removeClass().addClass('fa fa-' + icon);
      };

      DriversButton.prototype.doMobileView = function() {
        return this.editor.body.css('background', '#ccc');
      };

      DriversButton.prototype.doCloseMobileView = function() {
        return this.editor.body.css('background', '#444');
      };

      DriversButton.prototype.command = function() {
        console.log(this.isExpand);
        if (this.isExpand) {
          this.setIcon('expand');
          this.isExpand = false;
          this.doCloseMobileView();
          return;
        }
        this.setIcon('compress');
        this.isExpand = true;
        return this.doMobileView();
      };

      return DriversButton;

    })(Simditor.Button);
    return Simditor.Toolbar.addButton(DriversButton);
  });

}).call(this);
