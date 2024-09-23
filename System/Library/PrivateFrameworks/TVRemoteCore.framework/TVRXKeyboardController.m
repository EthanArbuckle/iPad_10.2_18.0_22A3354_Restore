@implementation TVRXKeyboardController

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRXKeyboardController;
  return -[TVRXKeyboardController init](&v3, sel_init);
}

- (BOOL)isEditing
{
  return -[TVRXKeyboardImpl isEditing](self->_keyboardImpl, "isEditing");
}

- (TVRCKeyboardAttributes)attributes
{
  return (TVRCKeyboardAttributes *)-[TVRXKeyboardImpl attributes](self->_keyboardImpl, "attributes");
}

- (NSString)text
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[TVRXKeyboardImpl text](self->_keyboardImpl, "text");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_24DCDC4B0;
  v4 = v2;

  return v4;
}

- (void)setText:(id)a3
{
  __CFString *v4;
  __CFString *v5;

  v4 = &stru_24DCDC4B0;
  if (a3)
    v4 = (__CFString *)a3;
  v5 = v4;
  -[TVRXKeyboardImpl setText:](self->_keyboardImpl, "setText:", v5);

}

- (void)sendReturnKey
{
  -[TVRXKeyboardImpl sendReturnKey](self->_keyboardImpl, "sendReturnKey");
}

- (void)sendTextActionPayload:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TVRXKeyboardImpl setTextActionPayload:](self->_keyboardImpl, "setTextActionPayload:", v4);

}

- (void)_setKeyboardImpl:(id)a3
{
  TVRXKeyboardImpl *v5;
  TVRXKeyboardImpl *keyboardImpl;
  TVRXKeyboardImpl **p_keyboardImpl;
  int v8;
  TVRXKeyboardImpl *v9;
  int v10;
  void *v11;
  TVRXKeyboardImpl *v12;

  v5 = (TVRXKeyboardImpl *)a3;
  p_keyboardImpl = &self->_keyboardImpl;
  keyboardImpl = self->_keyboardImpl;
  if (keyboardImpl != v5)
  {
    v12 = v5;
    v8 = -[TVRXKeyboardImpl isEditing](keyboardImpl, "isEditing");
    -[TVRXKeyboardImpl setKeyboardController:](*p_keyboardImpl, "setKeyboardController:", 0);
    v9 = *p_keyboardImpl;
    *p_keyboardImpl = 0;

    if (v8)
      -[TVRXKeyboardController _endSession](self, "_endSession");
    objc_storeStrong((id *)&self->_keyboardImpl, a3);
    -[TVRXKeyboardImpl setKeyboardController:](self->_keyboardImpl, "setKeyboardController:", self);
    v10 = -[TVRXKeyboardImpl isEditing](self->_keyboardImpl, "isEditing");
    v5 = v12;
    if (v10)
    {
      -[TVRXKeyboardImpl attributes](self->_keyboardImpl, "attributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRXKeyboardController _beginSessionWithAttributes:](self, "_beginSessionWithAttributes:", v11);

      v5 = v12;
    }
  }

}

- (void)_editingSessionUpdatedText:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "keyboardController:didUpdateText:", self, v5);

}

- (void)_editingSessionUpdatedAttributes:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "keyboardController:didUpdateAttributes:", self, v5);

}

- (void)_beginSessionWithAttributes:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "keyboardController:beganTextEditingWithAttributes:", self, v5);

}

- (void)_endSession
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "keyboardControllerEndedTextEditing:", self);

}

- (TVRXKeyboardControllerDelegate)delegate
{
  return (TVRXKeyboardControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TVRXKeyboardImpl)_keyboardImpl
{
  return self->_keyboardImpl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardImpl, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
