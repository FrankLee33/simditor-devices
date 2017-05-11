
((factory)->
  if (typeof define is 'function') and define.amd
    define ['simditor'], factory
  else
    factory window.Simditor
)((Simditor)->
  class DevicesButton extends Simditor.Button
    name: 'devices'
    title: 'devices'
    menu: true
    @i18n =
      'zh-CN':
        'PC View': '电脑预览'
        'Mobile View': '手机预览'
      'en-US':
        'PC View': 'PC View'
        'Mobile View': 'Mobile View'

    constructor: ->
      super

    _init: ->
      @menu = [{
        name: 'v1',
        text: @_t('PC View'),
        param: 'pc'
      }, {
        name: 'v2',
        text: @_t('Mobile View'),
        param: 'mobile'
      }]
      super
      @setIcon('devices-viewer')

    setIcon: (icon)->
      @el.find('span').removeClass().addClass('icon-' + icon)

    openViewer: (content, type) ->
      title = @_t('Mobile View')
      css = 'mobile'
      if (type == 'pc')
        title = @_t('PC View')
        css = 'pc'
      html = """
      <html>
        <head>
          <title>#{title}</title>
          <link rel="stylesheet" href="./styles/simditor-devices-#{css}.css">
        </head>
        <body>
          <div class="simditor-device">
            <div class="simditor-content">
              #{content}
            </div>
          </div>
        </body>
      </html>
      """
      @win = window.open('about:blank')
      @win.document.write(html)


    command: (param) ->
      @openViewer(@editor.getValue(), param)

  Simditor.Toolbar.addButton(DevicesButton)
)
