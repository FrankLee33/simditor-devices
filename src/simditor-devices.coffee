((factory)->
  if (typeof define is 'function') and define.amd
    define ['simditor'], factory
  else
    factory window.Simditor
)((Simditor)->
  class DevicesButton extends Simditor.Button
    name: 'devices'
    title: 'devices'

    constructor: ->
      @isExpand = false
      super

    _init: ->
      @shortcut = 'esc'
      super
      @setIcon('expand')

    setIcon: (icon)->
      @el.find('span').removeClass().addClass('fa fa-' + icon)

    # 全屏
    doMobileView: ->
      @editor.body
        .css('background', '#ccc')

    # 全屏
    doCloseMobileView: ->
      @editor.body
        .css('background', '#444')

    command: ->
      # 如果已经处于全屏状态
      console.log(@isExpand)
      if @isExpand
        @setIcon('expand')
        @isExpand = false
        @doCloseMobileView()
        return

      @setIcon('compress')
      @isExpand = true
      @doMobileView()

  Simditor.Toolbar.addButton(DevicesButton)
)
