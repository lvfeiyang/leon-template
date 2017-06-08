{CompositeDisposable} = require 'atom'

module.exports = LeonTemplate =
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'leon-template:err': => @err()
    @subscriptions.add atom.commands.add 'atom-workspace', 'leon-template:msg': => @msg()

  deactivate: ->
    @subscriptions.dispose()

  err: ->
    if editor = atom.workspace.getActiveTextEditor()
      editor.insertText('err != nil {\n\treturn nil, err\n}')

  msg: ->
    if editor = atom.workspace.getActiveTextEditor()
      editor.insertText('package message\n\ntype Q struct {\n}\ntype P struct {\n}\n'+
      'func (req *Q) GetName() (string, string) {\n\treturn "-req", "-rsp"\n}\n'+
      'func (req *Q) Decode(msgData []byte) error {\n\treturn json.Unmarshal(msgData, req)\n}\n'+
      'func (rsp *P) Encode() ([]byte, error) {\n\treturn json.Marshal(rsp)\n}\n'+
      'func (req *Q) Handle(sess *session.Session) ([]byte, error)\n{\n}\n')
