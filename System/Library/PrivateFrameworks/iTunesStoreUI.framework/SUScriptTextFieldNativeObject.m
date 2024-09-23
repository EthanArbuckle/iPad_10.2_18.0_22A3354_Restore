@implementation SUScriptTextFieldNativeObject

- (void)dealloc
{
  objc_super v3;

  -[SUScriptTextFieldDelegate removeDelegate:](self->_textFieldDelegate, "removeDelegate:", self);

  v3.receiver = self;
  v3.super_class = (Class)SUScriptTextFieldNativeObject;
  -[SUScriptTextFieldNativeObject dealloc](&v3, sel_dealloc);
}

- (int64_t)autocapitalizationType
{
  return 0;
}

- (int64_t)autocorrectionType
{
  return 0;
}

- (BOOL)becomeFirstResponder
{
  return 0;
}

- (int64_t)keyboardType
{
  return 0;
}

- (NSString)placeholder
{
  return 0;
}

- (BOOL)resignFirstResponder
{
  return 1;
}

- (NSString)value
{
  return 0;
}

- (double)width
{
  return 0.0;
}

- (void)destroyNativeObject
{
  objc_super v3;

  -[SUScriptTextFieldDelegate removeDelegate:](self->_textFieldDelegate, "removeDelegate:", self);
  if (!-[SUScriptTextFieldDelegate numberOfDelegates](self->_textFieldDelegate, "numberOfDelegates")
    && -[SUScriptTextFieldNativeObject _nativeObjectDelegate](self, "_nativeObjectDelegate") == self->_textFieldDelegate)
  {
    -[SUScriptTextFieldNativeObject _setNativeObjectDelegate:](self, "_setNativeObjectDelegate:", 0);
  }

  self->_textFieldDelegate = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScriptTextFieldNativeObject;
  -[SUScriptNativeObject destroyNativeObject](&v3, sel_destroyNativeObject);
}

- (void)setupNativeObject
{
  id v3;
  SUScriptTextFieldDelegate *v4;
  objc_super v5;

  -[SUScriptTextFieldDelegate removeDelegate:](self->_textFieldDelegate, "removeDelegate:", self);

  self->_textFieldDelegate = 0;
  v3 = -[SUScriptTextFieldNativeObject _nativeObjectDelegate](self, "_nativeObjectDelegate");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (SUScriptTextFieldDelegate *)v3;
  else
    v4 = objc_alloc_init(SUScriptTextFieldDelegate);
  self->_textFieldDelegate = v4;
  -[SUScriptTextFieldDelegate addDelegate:](v4, "addDelegate:", self);
  -[SUScriptTextFieldNativeObject _setNativeObjectDelegate:](self, "_setNativeObjectDelegate:", self->_textFieldDelegate);
  v5.receiver = self;
  v5.super_class = (Class)SUScriptTextFieldNativeObject;
  -[SUScriptNativeObject setupNativeObject](&v5, sel_setupNativeObject);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  -[SUScriptObject dispatchEvent:forName:](-[SUScriptNativeObject scriptObject](self, "scriptObject", a3, a4), "dispatchEvent:forName:", 0, CFSTR("change"));
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  -[SUScriptObject dispatchEvent:forName:](-[SUScriptNativeObject scriptObject](self, "scriptObject", a3), "dispatchEvent:forName:", 0, CFSTR("submit"));
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  return -[SUScriptObject canBecomeFirstResponder](-[SUScriptNativeObject scriptObject](self, "scriptObject", a3), "canBecomeFirstResponder");
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  -[SUScriptObject dispatchEvent:forName:](-[SUScriptNativeObject scriptObject](self, "scriptObject", a3), "dispatchEvent:forName:", 0, CFSTR("focus"));
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  -[SUScriptObject dispatchEvent:forName:](-[SUScriptNativeObject scriptObject](self, "scriptObject", a3), "dispatchEvent:forName:", 0, CFSTR("blur"));
}

- (void)textFieldDidBeginEditing:(id)a3
{
  -[SUScriptObject dispatchEvent:forName:](-[SUScriptNativeObject scriptObject](self, "scriptObject", a3), "dispatchEvent:forName:", 0, CFSTR("focus"));
}

- (void)textFieldDidEndEditing:(id)a3
{
  -[SUScriptObject dispatchEvent:forName:](-[SUScriptNativeObject scriptObject](self, "scriptObject", a3), "dispatchEvent:forName:", 0, CFSTR("blur"));
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return -[SUScriptObject canBecomeFirstResponder](-[SUScriptNativeObject scriptObject](self, "scriptObject", a3), "canBecomeFirstResponder");
}

- (void)_textDidChange:(id)a3
{
  -[SUScriptObject dispatchEvent:forName:](-[SUScriptNativeObject scriptObject](self, "scriptObject", a3), "dispatchEvent:forName:", 0, CFSTR("change"));
}

- (void)_textDidEndEditingOnExit:(id)a3
{
  -[SUScriptObject dispatchEvent:forName:](-[SUScriptNativeObject scriptObject](self, "scriptObject", a3), "dispatchEvent:forName:", 0, CFSTR("submit"));
}

- (id)_nativeObjectDelegate
{
  return 0;
}

- (void)_sendScriptDidChange
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUScriptTextFieldDelegate scriptDidChangeTextForField:](self->_textFieldDelegate, "scriptDidChangeTextForField:", -[SUScriptNativeObject object](self, "object"));
}

@end
