@implementation SUScriptTextFieldNativeObjectUITextField

- (int64_t)autocapitalizationType
{
  return objc_msgSend(-[SUScriptNativeObject object](self, "object"), "autocapitalizationType");
}

- (int64_t)autocorrectionType
{
  return objc_msgSend(-[SUScriptNativeObject object](self, "object"), "autocorrectionType");
}

- (BOOL)becomeFirstResponder
{
  return objc_msgSend(-[SUScriptNativeObject object](self, "object"), "becomeFirstResponder");
}

- (void)destroyNativeObject
{
  objc_super v3;

  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptTextFieldNativeObjectUITextField;
  -[SUScriptTextFieldNativeObject destroyNativeObject](&v3, sel_destroyNativeObject);
}

- (int64_t)keyboardType
{
  return objc_msgSend(-[SUScriptNativeObject object](self, "object"), "keyboardType");
}

- (id)_nativeObjectDelegate
{
  return (id)objc_msgSend(-[SUScriptNativeObject object](self, "object"), "delegate");
}

- (BOOL)resignFirstResponder
{
  return objc_msgSend(-[SUScriptNativeObject object](self, "object"), "resignFirstResponder");
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setAutocapitalizationType:", a3);
}

- (void)setAutocorrectionType:(int64_t)a3
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setAutocorrectionType:", a3);
}

- (void)setKeyboardType:(int64_t)a3
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setKeyboardType:", a3);
}

- (void)_setNativeObjectDelegate:(id)a3
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setDelegate:", a3);
}

- (void)setPlaceholder:(id)a3
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setPlaceholder:", a3);
}

- (void)setupNativeObject
{
  id v3;
  objc_super v4;

  v3 = -[SUScriptNativeObject object](self, "object");
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__textDidChange_, 0x20000);
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__textDidEndEditingOnExit_, 0x80000);
  v4.receiver = self;
  v4.super_class = (Class)SUScriptTextFieldNativeObjectUITextField;
  -[SUScriptTextFieldNativeObject setupNativeObject](&v4, sel_setupNativeObject);
}

- (void)setValue:(id)a3
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setText:", a3);
  -[SUScriptTextFieldNativeObject _sendScriptDidChange](self, "_sendScriptDidChange");
}

- (void)setWidth:(double)a3
{
  id v3;

  v3 = -[SUScriptNativeObject object](self, "object");
  objc_msgSend(v3, "frame");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend((id)objc_msgSend(v3, "superview"), "setNeedsLayout");
}

- (id)value
{
  return (id)objc_msgSend(-[SUScriptNativeObject object](self, "object"), "text");
}

- (double)width
{
  double v2;

  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "frame");
  return v2;
}

@end
