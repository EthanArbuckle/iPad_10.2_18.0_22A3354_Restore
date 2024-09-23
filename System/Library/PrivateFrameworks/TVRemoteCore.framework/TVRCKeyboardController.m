@implementation TVRCKeyboardController

- (id)_initWithDevice:(id)a3
{
  id v4;
  TVRCKeyboardController *v5;
  TVRCKeyboardController *v6;
  TVRCKeyboardAttributes *attributes;
  NSString *text;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TVRCKeyboardController;
  v5 = -[TVRCKeyboardController init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_device, v4);
    v6->_editing = 0;
    attributes = v6->_attributes;
    v6->_attributes = 0;

    text = v6->_text;
    v6->_text = (NSString *)&stru_24DCDC4B0;

  }
  return v6;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (TVRCKeyboardAttributes)attributes
{
  return self->_attributes;
}

- (NSString)text
{
  if (self->_text)
    return self->_text;
  else
    return (NSString *)&stru_24DCDC4B0;
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;
  NSString *v6;
  id WeakRetained;
  void *v8;
  id v9;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  text = self->_text;
  self->_text = v4;

  +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = self->_text;
  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  objc_msgSend(WeakRetained, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendInputText:toDeviceWithIdentifier:", v6, v8);

}

- (void)sendReturnKey
{
  id WeakRetained;
  void *v4;
  id v5;

  +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  objc_msgSend(WeakRetained, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendInputReturnKeyToDeviceWithIdentifier:", v4);

}

- (void)_setCurrentState:(id)a3
{
  _BOOL4 editing;
  TVRCKeyboardAttributes *v6;
  id v7;
  void *v8;
  NSString *v9;
  NSString *text;
  TVRCKeyboardAttributes *v11;
  TVRCKeyboardAttributes *attributes;
  id WeakRetained;
  char v14;
  id v15;
  id v16;
  char v17;
  id v18;
  id v19;
  char v20;
  id v21;
  id v22;
  char v23;
  NSString *v24;

  if (a3)
  {
    editing = self->_editing;
    v24 = self->_text;
    v6 = self->_attributes;
    v7 = a3;
    self->_editing = objc_msgSend(v7, "isEditing");
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSString *)objc_msgSend(v8, "copy");
    text = self->_text;
    self->_text = v9;

    objc_msgSend(v7, "attributes");
    v11 = (TVRCKeyboardAttributes *)objc_claimAutoreleasedReturnValue();

    attributes = self->_attributes;
    self->_attributes = v11;

    if (editing)
    {
      if (!self->_editing)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v14 = objc_opt_respondsToSelector();

        if ((v14 & 1) != 0)
        {
          v15 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v15, "keyboardControllerEndedTextEditing:", self);

        }
        if (!self->_editing)
          goto LABEL_18;
      }
      if (!-[NSString isEqualToString:](v24, "isEqualToString:", self->_text))
      {
        v16 = objc_loadWeakRetained((id *)&self->_delegate);
        v17 = objc_opt_respondsToSelector();

        if ((v17 & 1) != 0)
        {
          v18 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v18, "keyboardController:didUpdateText:", self, self->_text);

        }
      }
      if (-[TVRCKeyboardAttributes isEqualToAttributes:](v6, "isEqualToAttributes:", self->_attributes))
        goto LABEL_18;
      v19 = objc_loadWeakRetained((id *)&self->_delegate);
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) == 0)
        goto LABEL_18;
      v21 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v21, "keyboardController:didUpdateAttributes:", self, self->_attributes);
    }
    else
    {
      if (!self->_editing)
        goto LABEL_18;
      v22 = objc_loadWeakRetained((id *)&self->_delegate);
      v23 = objc_opt_respondsToSelector();

      if ((v23 & 1) == 0)
        goto LABEL_18;
      v21 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v21, "keyboardController:beganTextEditingWithAttributes:", self, self->_attributes);
    }

LABEL_18:
  }
}

- (TVRCKeyboardControllerDelegate)delegate
{
  return (TVRCKeyboardControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_destroyWeak((id *)&self->_device);
}

@end
