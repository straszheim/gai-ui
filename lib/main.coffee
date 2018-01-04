root = document.documentElement

module.exports =
  activate: (state) ->
    atom.config.observe 'gai-ui.fontSize', (value) ->
      setFontSize(value)

    atom.config.observe 'gai-ui.tabSizing', (value) ->
      setTabSizing(value)

  deactivate: ->
    unsetFontSize()
    unsetTabSizing()

# Font Size -----------------------
setFontSize = (currentFontSize) ->
  if Number.isInteger(currentFontSize)
    root.style.fontSize = "#{currentFontSize}px"
  else if currentFontSize is 'Auto'
    unsetFontSize()

unsetFontSize = ->
  root.style.fontSize = ''

# Tab Sizing -----------------------
setTabSizing = (tabSizing) ->
  root.setAttribute('theme-gai-ui-tabsizing', tabSizing.toLowerCase())

unsetTabSizing = ->
  root.removeAttribute('theme-gai-ui-tabsizing')
