@implementation _UITextInputSessionAcccidentalDictationResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerAction, 0);
}

- (unint64_t)result
{
  return self->_result;
}

- (void)setResult:(unint64_t)a3
{
  self->_result = a3;
}

- (_UITextInputSessionKeyboardDockItemButtonPressAction)triggerAction
{
  return self->_triggerAction;
}

- (void)setTriggerAction:(id)a3
{
  objc_storeStrong((id *)&self->_triggerAction, a3);
}

@end
