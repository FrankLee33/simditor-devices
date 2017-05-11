Simditor.i18n =
  'zh-CN':
    'PC View': '电脑预览'
    'Mobile View': '手机预览'

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

    setIcon: (icon) ->
      @el.find('span').removeClass().addClass('icon-' + icon)

    openViewer: (content) ->
      title = '手机预览'
      className = 'mobile'
      html = """
      <html>
        <head>
          <title>#{title}</title>
          <link rel=\"stylesheet\" href=\"styles/simditor-devices.css\">
        </head>
        <body class=\"simditor-device-#{className}\">
          #{content}
        </body>
      </html>
      """
      @win = window.open('about:blank')
      @win.document.write(html)

    # 全屏
    doMobileView: ->
      @openViewer(@editor.getValue())

    command: (param) ->
      console.log('>>>>', param)
      @doMobileView()

  Simditor.Toolbar.addButton(DevicesButton)
)
