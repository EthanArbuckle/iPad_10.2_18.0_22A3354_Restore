@implementation _TVRCRMSDeviceKeyboardImpl

- (void)keyboardSessionBegan:(id)a3
{
  TVRXKeyboardController **p_keyboardController;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  self->_editing = 1;
  objc_storeStrong((id *)&self->_keyboardInfo, a3);
  p_keyboardController = &self->_keyboardController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardController);
  -[_TVRCRMSDeviceKeyboardImpl attributes](self, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_editingSessionBeganWithAttributes:", v7);

  objc_msgSend(v12, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = objc_loadWeakRetained((id *)p_keyboardController);
    objc_msgSend(v12, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_editingSessionUpdatedText:", v11);

  }
}

- (void)keyboardSessionEnded:(id)a3
{
  id WeakRetained;

  self->_editing = 0;
  objc_storeStrong((id *)&self->_keyboardInfo, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardController);
  objc_msgSend(WeakRetained, "_editingSessionEnded");

}

- (void)keyboardSessionUpdatedEditingInfo:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[_TVRCRMSDeviceKeyboardImpl text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRCRMSDeviceKeyboardImpl attributes](self, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_keyboardInfo, a3);
  objc_msgSend(v5, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    _TVRCRMSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v6;
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "#LegacyDevice keyboard text changed from %{public}@ to %{public}@", (uint8_t *)&v17, 0x16u);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardController);
    objc_msgSend(v5, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_editingSessionUpdatedText:", v13);

  }
  -[_TVRCRMSDeviceKeyboardImpl attributes](self, "attributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqualToAttributes:", v7) & 1) == 0)
  {
    _TVRCRMSLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_21A51B000, v15, OS_LOG_TYPE_DEFAULT, "#LegacyDevice keyboard attributes changed", (uint8_t *)&v17, 2u);
    }

    v16 = objc_loadWeakRetained((id *)&self->_keyboardController);
    objc_msgSend(v16, "_editingSessionUpdatedAttributes:", v14);

  }
}

- (id)attributes
{
  return -[_TVRCRMSDeviceKeyboardImpl _attributesForKeyboardInfo:](self, "_attributesForKeyboardInfo:", self->_keyboardInfo);
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)sendReturnKey
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "keyboardImplRequestsSendingReturnKey:", self);

}

- (void)setText:(id)a3
{
  void *v4;
  char v5;
  id WeakRetained;
  id v7;

  v7 = a3;
  if (v7)
  {
    -[TVRMSKeyboardInfo text](self->_keyboardInfo, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "isEqualToString:", v4);

    if ((v5 & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "keyboardImpl:updatedText:", self, v7);

    }
  }

}

- (id)text
{
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _TVRCRMSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRMSKeyboardInfo text](self->_keyboardInfo, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "#LegacyDevice returning current keyboard text as %@", (uint8_t *)&v6, 0xCu);

  }
  -[TVRMSKeyboardInfo text](self->_keyboardInfo, "text");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_attributesForKeyboardInfo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[TVRCKeyboardAttributes _init]([TVRCKeyboardAttributes alloc], "_init");
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  objc_msgSend(v5, "_setSecure:", objc_msgSend(v4, "secureText"));
  objc_msgSend(v5, "_setAutocapitalizationType:", 0);
  objc_msgSend(v5, "_setKeyboardType:", -[_TVRCRMSDeviceKeyboardImpl _keyboardTypeForInfo:](self, "_keyboardTypeForInfo:", v4));
  v7 = objc_msgSend(v4, "keyboardInputType");

  objc_msgSend(v5, "_setLikelyPINEntry:", v7 == 1);
  return v5;
}

- (int64_t)_keyboardTypeForInfo:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "keyboardType");
  if ((unint64_t)(v3 - 1) > 2)
    return 0;
  else
    return qword_21A5D5010[v3 - 1];
}

- (TVRXKeyboardController)keyboardController
{
  return (TVRXKeyboardController *)objc_loadWeakRetained((id *)&self->_keyboardController);
}

- (void)setKeyboardController:(id)a3
{
  objc_storeWeak((id *)&self->_keyboardController, a3);
}

- (_TVRCRMSDeviceKeyboardImplDelegate)delegate
{
  return (_TVRCRMSDeviceKeyboardImplDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)editing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (TVRMSKeyboardInfo)keyboardInfo
{
  return self->_keyboardInfo;
}

- (void)setKeyboardInfo:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_keyboardController);
}

@end
