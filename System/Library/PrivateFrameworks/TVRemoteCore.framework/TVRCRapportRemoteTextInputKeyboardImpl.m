@implementation TVRCRapportRemoteTextInputKeyboardImpl

- (void)setCompanionLinkWrapper:(id)a3
{
  TVRCRPCompanionLinkClientWrapper *v5;
  TVRCRPCompanionLinkClientWrapper *companionLinkWrapper;
  TVRCRPCompanionLinkClientWrapper *v7;
  uint64_t v8;
  TVRCRPCompanionLinkClientWrapper *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v5 = (TVRCRPCompanionLinkClientWrapper *)a3;
  companionLinkWrapper = self->_companionLinkWrapper;
  if (companionLinkWrapper != v5)
  {
    -[TVRCRPCompanionLinkClientWrapper setRTISessionHandler:](companionLinkWrapper, "setRTISessionHandler:", 0);
    objc_storeStrong((id *)&self->_companionLinkWrapper, a3);
    objc_initWeak(&location, self);
    v7 = self->_companionLinkWrapper;
    v8 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __66__TVRCRapportRemoteTextInputKeyboardImpl_setCompanionLinkWrapper___block_invoke;
    v12[3] = &unk_24DCD87C0;
    objc_copyWeak(&v13, &location);
    -[TVRCRPCompanionLinkClientWrapper getCurrentRTISourceSession:](v7, "getCurrentRTISourceSession:", v12);
    v9 = self->_companionLinkWrapper;
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __66__TVRCRapportRemoteTextInputKeyboardImpl_setCompanionLinkWrapper___block_invoke_1;
    v10[3] = &unk_24DCD87E8;
    objc_copyWeak(&v11, &location);
    -[TVRCRPCompanionLinkClientWrapper setRTISessionHandler:](v9, "setRTISessionHandler:", v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __66__TVRCRapportRemoteTextInputKeyboardImpl_setCompanionLinkWrapper___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      _TVRCRemoteTextInputLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __66__TVRCRapportRemoteTextInputKeyboardImpl_setCompanionLinkWrapper___block_invoke_cold_1((uint64_t)v6, v8);

    }
    else if (v5)
    {
      _TVRCRemoteTextInputLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "Keyboard connected to existing RemoteTextInput source session during setup", v10, 2u);
      }

      objc_msgSend(WeakRetained, "_receivedInputSourceSession:", v5);
    }
  }

}

void __66__TVRCRapportRemoteTextInputKeyboardImpl_setCompanionLinkWrapper___block_invoke_1(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TVRCRemoteTextInputLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Keyboard received callback for RemoteTextInput session", v6, 2u);
    }

    objc_msgSend(WeakRetained, "_receivedInputSourceSession:", v3);
  }

}

- (BOOL)isEditing
{
  return self->_editing;
}

- (id)attributes
{
  return self->_currentAttributes;
}

- (id)text
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[RTIInputSystemSourceSession documentState](self->_currentSession, "documentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextBeforeInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _TVRCRemoteTextInputLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Keyboard returning RTI text as %@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (void)setTextActionPayload:(id)a3
{
  RTIInputSystemSourceSession *currentSession;
  id v4;
  id v5;

  currentSession = self->_currentSession;
  v4 = a3;
  -[RTIInputSystemSourceSession payloadDelegate](currentSession, "payloadDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleTextActionPayload:", v4);

}

- (void)inputSessionDidBegin:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  uint8_t v6[16];

  _TVRCRemoteTextInputLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Keyboard RemoteTextInput source session did begin", v6, 2u);
  }

  if (!self->_editing)
  {
    self->_editing = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardController);
    objc_msgSend(WeakRetained, "_editingSessionBeganWithAttributes:", self->_currentAttributes);

  }
}

- (void)inputSessionDidEnd:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  uint8_t v6[16];

  _TVRCRemoteTextInputLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Keyboard RemoteTextInput source session did end", v6, 2u);
  }

  if (self->_editing)
  {
    self->_editing = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardController);
    objc_msgSend(WeakRetained, "_editingSessionEnded");

  }
}

- (void)inputSessionDidDie:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  uint8_t v6[16];

  _TVRCRemoteTextInputLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Keyboard RemoteTextInput source session did die", v6, 2u);
  }

  if (self->_editing)
  {
    self->_editing = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardController);
    objc_msgSend(WeakRetained, "_editingSessionEnded");

  }
}

- (void)handleTextActionPayload:(id)a3
{
  id v4;
  NSObject *v5;
  TVRCKeyboardAttributes *v6;
  TVRCKeyboardAttributes *currentAttributes;
  void *v8;
  void *v9;
  TVRCKeyboardAttributes *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  uint8_t v14[16];

  if (a3)
  {
    v4 = a3;
    _TVRCRemoteTextInputLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Keyboard RemoteTextInput received text action payload", v14, 2u);
    }

    v6 = -[TVRCKeyboardAttributes _init]([TVRCKeyboardAttributes alloc], "_init");
    currentAttributes = self->_currentAttributes;
    self->_currentAttributes = v6;

    -[TVRCKeyboardAttributes setRtiDataPayload:](self->_currentAttributes, "setRtiDataPayload:", v4);
    -[RTIInputSystemSourceSession documentTraits](self->_currentSession, "documentTraits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "prompt");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = self->_currentAttributes;
    if (v9)
    {
      -[TVRCKeyboardAttributes setTitle:](self->_currentAttributes, "setTitle:", v9);
    }
    else
    {
      -[RTIInputSystemSourceSession documentTraits](self->_currentSession, "documentTraits");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRCKeyboardAttributes setTitle:](v10, "setTitle:", v12);

    }
    if (self->_editing)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardController);
      objc_msgSend(WeakRetained, "_editingSessionUpdatedAttributes:", self->_currentAttributes);
    }
    else
    {
      self->_editing = 1;
      WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardController);
      objc_msgSend(WeakRetained, "_editingSessionBeganWithAttributes:", self->_currentAttributes);
    }

  }
}

- (void)_stopObservingTelevisionEditingSession
{
  RTIInputSystemSourceSession *currentSession;

  -[RTIInputSystemSourceSession removeSessionDelegate:](self->_currentSession, "removeSessionDelegate:", self);
  currentSession = self->_currentSession;
  self->_currentSession = 0;

}

- (void)_receivedInputSourceSession:(id)a3
{
  RTIInputSystemSourceSession *v5;
  RTIInputSystemSourceSession *currentSession;
  void *v7;
  RTIInputSystemSourceSession *v8;

  v5 = (RTIInputSystemSourceSession *)a3;
  currentSession = self->_currentSession;
  if (currentSession != v5)
  {
    v8 = v5;
    -[RTIInputSystemSourceSession setForwardingPayloadDelegate:](currentSession, "setForwardingPayloadDelegate:", 0);
    -[RTIInputSystemSourceSession removeSessionDelegate:](self->_currentSession, "removeSessionDelegate:", self);
    objc_storeStrong((id *)&self->_currentSession, a3);
    -[RTIInputSystemSourceSession addSessionDelegate:](self->_currentSession, "addSessionDelegate:", self);
    -[RTIInputSystemSourceSession setForwardingPayloadDelegate:](self->_currentSession, "setForwardingPayloadDelegate:", self);
    -[RTIInputSystemSourceSession currentForwardingDataPayload](self->_currentSession, "currentForwardingDataPayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRCRapportRemoteTextInputKeyboardImpl handleTextActionPayload:](self, "handleTextActionPayload:", v7);

    v5 = v8;
  }

}

- (TVRXKeyboardController)keyboardController
{
  return (TVRXKeyboardController *)objc_loadWeakRetained((id *)&self->_keyboardController);
}

- (void)setKeyboardController:(id)a3
{
  objc_storeWeak((id *)&self->_keyboardController, a3);
}

- (TVRCRPCompanionLinkClientWrapper)companionLinkWrapper
{
  return self->_companionLinkWrapper;
}

- (BOOL)editing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (RTIInputSystemSourceSession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
  objc_storeStrong((id *)&self->_currentSession, a3);
}

- (TVRCKeyboardAttributes)currentAttributes
{
  return self->_currentAttributes;
}

- (void)setCurrentAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_currentAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAttributes, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_companionLinkWrapper, 0);
  objc_destroyWeak((id *)&self->_keyboardController);
}

void __66__TVRCRapportRemoteTextInputKeyboardImpl_setCompanionLinkWrapper___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21A51B000, a2, OS_LOG_TYPE_ERROR, "Keyboard failed to fetch current RemoteTextInput source session from television. Error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
