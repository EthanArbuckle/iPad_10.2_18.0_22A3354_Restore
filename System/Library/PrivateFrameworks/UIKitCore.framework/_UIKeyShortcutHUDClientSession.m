@implementation _UIKeyShortcutHUDClientSession

- (_UIKeyShortcutHUDConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (BOOL)textEditingSessionWasTornDown
{
  return self->_textEditingSessionWasTornDown;
}

- (void)setTextEditingSessionWasTornDown:(BOOL)a3
{
  self->_textEditingSessionWasTornDown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
