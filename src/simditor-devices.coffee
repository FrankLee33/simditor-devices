
((factory)->
  if (typeof define is 'function') and define.amd
    define ['simditor'], factory
  else
    factory window.Simditor
)((Simditor)->
  class DevicesButton extends Simditor.Button
    @i18n =
      'zh-CN':
        'devices view': '设备预览',
        'pc view': '电脑预览',
        'mobile view': '手机预览'
      'en-US':
        'devices view': 'devices view',
        'pc view': 'pc view',
        'mobile view': 'mobile view'
    name: 'devices'
    title: @_t('devices view')
    menu: true

    constructor: ->
      super

    _init: ->
      @actions = [
        {text: @_t('pc view'), css: './styles/simditor-devices-pc.css'},
        {text: @_t('mobile view'), css: './styles/simditor-devices-mobile.css'}
      ]
      if (@editor.opts.devices)
        @actions = @editor.opts.devices
      console.log(@editor.opts.devices)
      @menu = []
      for key,item of @actions
        @menu.push({name: "m#{key}", text: item.text, param: key})
      super
      @setIcon('devices-viewer')
    setIcon: (icon)->
      @el.find('span').removeClass().addClass('icon-' + icon)

    openViewer: (content, action) ->
      title = action.title || action.text
      cssfile = action.css
      html = """
      <html>
        <head>
          <title>#{title}</title>
          <link rel="stylesheet" href="#{cssfile}">
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


    command: (param, m2) ->
      @openViewer(@editor.getValue(), @actions[param])

  Simditor.Toolbar.addButton(DevicesButton)
)
