@implementation SUScriptTextFieldNativeObjectUIBarButtonItem

- (id)_textField
{
  return (id)objc_msgSend(-[SUScriptNativeObject object](self, "object"), "customView");
}

- (int64_t)autocapitalizationType
{
  return objc_msgSend(-[SUScriptTextFieldNativeObjectUIBarButtonItem _textField](self, "_textField"), "autocapitalizationType");
}

- (int64_t)autocorrectionType
{
  return objc_msgSend(-[SUScriptTextFieldNativeObjectUIBarButtonItem _textField](self, "_textField"), "autocorrectionType");
}

- (BOOL)becomeFirstResponder
{
  return objc_msgSend(-[SUScriptTextFieldNativeObjectUIBarButtonItem _textField](self, "_textField"), "becomeFirstResponder");
}

- (void)destroyNativeObject
{
  objc_super v3;

  objc_msgSend(-[SUScriptTextFieldNativeObjectUIBarButtonItem _textField](self, "_textField"), "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptTextFieldNativeObjectUIBarButtonItem;
  -[SUScriptTextFieldNativeObject destroyNativeObject](&v3, sel_destroyNativeObject);
}

- (int64_t)keyboardType
{
  return objc_msgSend(-[SUScriptTextFieldNativeObjectUIBarButtonItem _textField](self, "_textField"), "keyboardType");
}

- (id)_nativeObjectDelegate
{
  return (id)objc_msgSend(-[SUScriptTextFieldNativeObjectUIBarButtonItem _textField](self, "_textField"), "delegate");
}

- (id)placeholder
{
  return (id)objc_msgSend(-[SUScriptTextFieldNativeObjectUIBarButtonItem _textField](self, "_textField"), "placeholder");
}

- (BOOL)resignFirstResponder
{
  return objc_msgSend(-[SUScriptTextFieldNativeObjectUIBarButtonItem _textField](self, "_textField"), "resignFirstResponder");
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  objc_msgSend(-[SUScriptTextFieldNativeObjectUIBarButtonItem _textField](self, "_textField"), "setAutocapitalizationType:", a3);
}

- (void)setAutocorrectionType:(int64_t)a3
{
  objc_msgSend(-[SUScriptTextFieldNativeObjectUIBarButtonItem _textField](self, "_textField"), "setAutocorrectionType:", a3);
}

- (void)setKeyboardType:(int64_t)a3
{
  objc_msgSend(-[SUScriptTextFieldNativeObjectUIBarButtonItem _textField](self, "_textField"), "setKeyboardType:", a3);
}

- (void)_setNativeObjectDelegate:(id)a3
{
  objc_msgSend(-[SUScriptTextFieldNativeObjectUIBarButtonItem _textField](self, "_textField"), "setDelegate:", a3);
}

- (void)setPlaceholder:(id)a3
{
  objc_msgSend(-[SUScriptTextFieldNativeObjectUIBarButtonItem _textField](self, "_textField"), "setPlaceholder:", a3);
}

- (void)setupNativeObject
{
  id v3;
  objc_super v4;

  v3 = -[SUScriptTextFieldNativeObjectUIBarButtonItem _textField](self, "_textField");
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__textDidChange_, 0x20000);
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__textDidEndEditingOnExit_, 0x80000);
  v4.receiver = self;
  v4.super_class = (Class)SUScriptTextFieldNativeObjectUIBarButtonItem;
  -[SUScriptTextFieldNativeObject setupNativeObject](&v4, sel_setupNativeObject);
}

- (void)setValue:(id)a3
{
  objc_msgSend(-[SUScriptTextFieldNativeObjectUIBarButtonItem _textField](self, "_textField"), "setText:", a3);
  -[SUScriptTextFieldNativeObject _sendScriptDidChange](self, "_sendScriptDidChange");
}

- (void)setWidth:(double)a3
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setWidth:", a3);
}

- (id)value
{
  return (id)objc_msgSend(-[SUScriptTextFieldNativeObjectUIBarButtonItem _textField](self, "_textField"), "text");
}

- (double)width
{
  double result;

  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "width");
  return result;
}

@end
