@implementation TUIKeyboardInputManagerMux

- (BOOL)hasSystemInputManager
{
  return self->_systemInputManager != 0;
}

- (void)setResponseDelegate:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_responseDelegate, a3);
  v5 = a3;
  -[TUIKeyboardInputManagerMux updateClientResponseDelegatesWithDelegate:](self, "updateClientResponseDelegatesWithDelegate:", self->_responseDelegate);

}

- (void)updateClientResponseDelegatesWithDelegate:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_clients;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE09D310, (_QWORD)v11))
          objc_msgSend(v10, "setResponseDelegate:", v4);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3098 != -1)
    dispatch_once(&sharedInstance_onceToken_3098, &__block_literal_global_3099);
  return (id)sharedInstance___instance;
}

- (TIKeyboardInputManager)systemInputManager
{
  return self->_systemInputManager;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUIKeyboardInputManagerMux;
  -[TUIKeyboardInputManagerMux methodSignatureForSelector:](&v9, sel_methodSignatureForSelector_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBDC18], "instanceMethodSignatureForSelector:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)setSystemInputManagerFromTextInputTraits:(id)a3 autofillMode:(unint64_t)a4 implProxy:(id)a5
{
  id v8;
  int v9;
  int IsNumberPad;
  uint64_t v11;
  void *v12;
  TUIKeyboardInputManagerMux *v13;
  TUIKeyboardInputManagerMux *v14;
  TIKeyboardInputManager *systemInputManager;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  TIKeyboardInputManagerToImplProtocol **p_implProxy;
  TIKeyboardInputManager *v21;
  TIKeyboardInputManager *v22;
  _BOOL4 v23;
  id v24;

  v24 = a3;
  v8 = a5;
  if ((objc_msgSend(v24, "isDevicePasscodeEntry") & 1) != 0)
  {
    v9 = 1;
  }
  else if (objc_msgSend(v24, "isSecureTextEntry"))
  {
    objc_msgSend(v24, "keyboardType");
    IsNumberPad = UIKeyboardTypeIsNumberPad();
    if (a4 == 3)
      v9 = 0;
    else
      v9 = IsNumberPad;
  }
  else
  {
    v9 = 0;
  }
  -[TUIKeyboardInputManagerMux inputManagerProvider](self, "inputManagerProvider");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (TUIKeyboardInputManagerMux *)v11;
  else
    v13 = self;
  v14 = v13;

  if (v9)
  {
    if ((-[TIKeyboardInputManager isMemberOfClass:](self->_systemInputManager, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
      goto LABEL_19;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    systemInputManager = self->_systemInputManager;
    self->_systemInputManager = 0;

    objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentInputMode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3960], "dictationInputMode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if (!v19)
    {
      v23 = -[TUIKeyboardInputManagerMux _systemHasKbd](v14, "_systemHasKbd");
      p_implProxy = &self->_implProxy;
      if (v23)
      {
        objc_storeWeak((id *)p_implProxy, v8);
        v21 = -[TUIKeyboardInputManagerMux newSystemInputManagerWithImplProxy:](v14, "newSystemInputManagerWithImplProxy:", self);
        goto LABEL_18;
      }
LABEL_17:
      objc_storeWeak((id *)p_implProxy, 0);
      v21 = -[TUIKeyboardInputManagerMux newInputManagerStub](v14, "newInputManagerStub");
LABEL_18:
      v22 = self->_systemInputManager;
      self->_systemInputManager = v21;

      goto LABEL_19;
    }
LABEL_16:
    p_implProxy = &self->_implProxy;
    goto LABEL_17;
  }
LABEL_19:

}

- (BOOL)_systemHasKbd
{
  if (_systemHasKbd_onceToken != -1)
    dispatch_once(&_systemHasKbd_onceToken, &__block_literal_global_2);
  return _systemHasKbd__hasKbd;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  TIKeyboardInputManager *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "invokeWithTarget:", self->_systemInputManager);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_clients;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(TIKeyboardInputManager **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (v10 != self->_systemInputManager)
        {
          objc_msgSend(MEMORY[0x1E0DBDC08], "untargetedInvocationWithInvocation:withCompletion:", v4, 0, (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "invokeWithTarget:", v10);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

void __43__TUIKeyboardInputManagerMux__systemHasKbd__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  _TextInputBundlesRoot();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("kbd"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _systemHasKbd__hasKbd = objc_msgSend(v2, "fileExistsAtPath:", v1);

}

void __44__TUIKeyboardInputManagerMux_sharedInstance__block_invoke()
{
  TUIKeyboardInputManagerMux *v0;
  void *v1;

  v0 = objc_alloc_init(TUIKeyboardInputManagerMux);
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;

}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (void)releaseConnectedClients
{
  TIKeyboardInputManager *systemInputManager;

  systemInputManager = self->_systemInputManager;
  self->_systemInputManager = 0;

}

- (TUIKeyboardInputManagerMux)init
{
  TUIKeyboardInputManagerMux *v2;
  NSMutableArray *v3;
  NSMutableArray *clients;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIKeyboardInputManagerMux;
  v2 = -[TUIKeyboardInputManagerMux init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    clients = v2->_clients;
    v2->_clients = v3;

  }
  return v2;
}

- (id)newSystemInputManagerWithImplProxy:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DBDC00];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithImplProxy:", v4);

  return v5;
}

- (id)newInputManagerStub
{
  return (id)objc_opt_new();
}

- (void)addClient:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    -[TUIKeyboardInputManagerMux clients](self, "clients");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", v9);

    if ((v5 & 1) == 0)
    {
      -[TUIKeyboardInputManagerMux clients](self, "clients");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

      if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE09D310))
      {
        -[TUIKeyboardInputManagerMux responseDelegate](self, "responseDelegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setResponseDelegate:", v7);

        -[TUIKeyboardInputManagerMux responseDelegate](self, "responseDelegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_requestInputManagerSync");

      }
    }
  }

}

- (void)removeClient:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE09D310))
      objc_msgSend(v6, "setResponseDelegate:", 0);
    -[TUIKeyboardInputManagerMux clients](self, "clients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v6);

    v4 = v6;
  }

}

- (void)removeAllClients
{
  TIKeyboardInputManager *systemInputManager;

  systemInputManager = self->_systemInputManager;
  self->_systemInputManager = 0;

  -[TUIKeyboardInputManagerMux updateClientResponseDelegatesWithDelegate:](self, "updateClientResponseDelegatesWithDelegate:", 0);
  -[NSMutableArray removeAllObjects](self->_clients, "removeAllObjects");
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUIKeyboardInputManagerMux;
  if (-[TUIKeyboardInputManagerMux respondsToSelector:](&v5, sel_respondsToSelector_))
    return 1;
  else
    return objc_msgSend(MEMORY[0x1E0DBDC18], "instancesRespondToSelector:", a3);
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUIKeyboardInputManagerMux;
  if (-[TUIKeyboardInputManagerMux isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class());
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TUIKeyboardInputManagerMux;
  if (-[TUIKeyboardInputManagerMux conformsToProtocol:](&v7, sel_conformsToProtocol_, v4))
    v5 = 1;
  else
    v5 = objc_msgSend(MEMORY[0x1E0DBDC18], "conformsToProtocol:", v4);

  return v5;
}

- (void)processPayloadInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUIKeyboardInputManagerMux implProxy](self, "implProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processPayloadInfo:", v4);

}

- (void)pushAutocorrections:(id)a3 requestToken:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[TUIKeyboardInputManagerMux candidateMultiplexer](self, "candidateMultiplexer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "willHandleDeliveryForCandidates:requestToken:", v10, v6);

  if ((v8 & 1) == 0)
  {
    -[TUIKeyboardInputManagerMux implProxy](self, "implProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushAutocorrections:requestToken:", v10, v6);

  }
}

- (void)pushCandidateResultSet:(id)a3 requestToken:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TUIKeyboardInputManagerMux implProxy](self, "implProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pushCandidateResultSet:requestToken:", v7, v6);

}

- (TUIKeyboardInputManagerProviding)inputManagerProvider
{
  return (TUIKeyboardInputManagerProviding *)objc_loadWeakRetained((id *)&self->_inputManagerProvider);
}

- (void)setInputManagerProvider:(id)a3
{
  objc_storeWeak((id *)&self->_inputManagerProvider, a3);
}

- (TUICandidateInterceptor)candidateMultiplexer
{
  return (TUICandidateInterceptor *)objc_loadWeakRetained((id *)&self->_candidateMultiplexer);
}

- (void)setCandidateMultiplexer:(id)a3
{
  objc_storeWeak((id *)&self->_candidateMultiplexer, a3);
}

- (_UIIVCResponseDelegateImpl)responseDelegate
{
  return self->_responseDelegate;
}

- (void)setSystemInputManager:(id)a3
{
  objc_storeStrong((id *)&self->_systemInputManager, a3);
}

- (NSMutableArray)clients
{
  return self->_clients;
}

- (TIKeyboardInputManagerToImplProtocol)implProxy
{
  return (TIKeyboardInputManagerToImplProtocol *)objc_loadWeakRetained((id *)&self->_implProxy);
}

- (void)setImplProxy:(id)a3
{
  objc_storeWeak((id *)&self->_implProxy, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_implProxy);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_systemInputManager, 0);
  objc_storeStrong((id *)&self->_responseDelegate, 0);
  objc_destroyWeak((id *)&self->_candidateMultiplexer);
  objc_destroyWeak((id *)&self->_inputManagerProvider);
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___TUIKeyboardInputManagerMux;
  if ((objc_msgSendSuper2(&v5, sel_instancesRespondToSelector_) & 1) != 0)
    return 1;
  else
    return objc_msgSend(MEMORY[0x1E0DBDC18], "instancesRespondToSelector:", a3);
}

@end
