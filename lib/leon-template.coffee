{CompositeDisposable} = require 'atom'

module.exports = LeonTemplate =
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'leon-template:add': => @add()

  deactivate: ->
    @subscriptions.dispose()

  add: ->
    if editor = atom.workspace.getActiveTextEditor()
      editor.insertText('hello')
