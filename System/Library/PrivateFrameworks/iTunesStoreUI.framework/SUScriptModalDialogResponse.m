@implementation SUScriptModalDialogResponse

- (void)dealloc
{
  objc_super v3;

  self->_textFieldValue = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScriptModalDialogResponse;
  -[SUScriptModalDialogResponse dealloc](&v3, sel_dealloc);
}

- (int64_t)buttonIndex
{
  return self->_buttonIndex;
}

- (void)setButtonIndex:(int64_t)a3
{
  self->_buttonIndex = a3;
}

- (NSString)textFieldValue
{
  return self->_textFieldValue;
}

- (void)setTextFieldValue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
