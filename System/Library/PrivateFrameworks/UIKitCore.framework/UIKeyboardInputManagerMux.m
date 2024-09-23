@implementation UIKeyboardInputManagerMux

+ (id)sharedInstance
{
  if (qword_1ECD7EFF8 != -1)
    dispatch_once(&qword_1ECD7EFF8, &__block_literal_global_351);
  return (id)_MergedGlobals_1134;
}

void __43__UIKeyboardInputManagerMux_sharedInstance__block_invoke()
{
  UIKeyboardInputManagerMux *v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_alloc_init(UIKeyboardInputManagerMux);
  v1 = (void *)_MergedGlobals_1134;
  _MergedGlobals_1134 = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *(void **)(_MergedGlobals_1134 + 8);
  *(_QWORD *)(_MergedGlobals_1134 + 8) = v2;

}

- (BOOL)_systemHasKbd
{
  if (_systemHasKbd_onceToken != -1)
    dispatch_once(&_systemHasKbd_onceToken, &__block_literal_global_108_0);
  return _systemHasKbd__hasKbd;
}

void __42__UIKeyboardInputManagerMux__systemHasKbd__block_invoke()
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

- (BOOL)hasSystemInputManager
{
  void *v2;
  BOOL v3;

  -[UIKeyboardInputManagerMux systemInputManager](self, "systemInputManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setSystemInputManagerFromTextInputTraits:(id)a3 autofillMode:(unint64_t)a4 implProxy:(id)a5
{
  id v8;
  void *v9;
  char v10;
  unsigned int v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  UIKeyboardInputManagerClient *v18;
  UIKeyboardInputManagerClient *v19;
  id v20;

  v20 = a3;
  v8 = a5;
  if ((objc_msgSend(v20, "isDevicePasscodeEntry") & 1) != 0
    || objc_msgSend(v20, "isSecureTextEntry")
    && ((v11 = objc_msgSend(v20, "keyboardType"), v11 <= 0xB) && ((1 << v11) & 0x930) != 0 || v11 == 127)
    && a4 != 3)
  {
    -[UIKeyboardInputManagerMux systemInputManager](self, "systemInputManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isMemberOfClass:", objc_opt_class());

    if ((v10 & 1) == 0)
      goto LABEL_14;
  }
  else
  {
    -[UIKeyboardInputManagerMux systemInputManager](self, "systemInputManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      -[UIKeyboardInputManagerMux setSystemInputManager:](self, "setSystemInputManager:", 0);
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currentInputMode");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqual:", v16);

      if (!v17 && -[UIKeyboardInputManagerMux _systemHasKbd](self, "_systemHasKbd"))
      {
        v18 = -[UIKeyboardInputManagerClient initWithImplProxy:]([UIKeyboardInputManagerClient alloc], "initWithImplProxy:", v8);
LABEL_15:
        v19 = v18;
        -[UIKeyboardInputManagerMux setSystemInputManager:](self, "setSystemInputManager:", v18);

        goto LABEL_16;
      }
LABEL_14:
      v18 = (UIKeyboardInputManagerClient *)objc_opt_new();
      goto LABEL_15;
    }
  }
LABEL_16:

}

- (void)setSystemInputManager:(id)a3
{
  TIKeyboardInputManager *v4;
  TIKeyboardInputManager *systemInputManager;
  TIKeyboardInputManager *v6;
  TIKeyboardInputManager *v7;

  v4 = (TIKeyboardInputManager *)a3;
  systemInputManager = self->_systemInputManager;
  self->_systemInputManager = v4;
  v7 = v4;
  v6 = systemInputManager;

  -[UIKeyboardInputManagerMux removeClient:](self, "removeClient:", v6);
  -[UIKeyboardInputManagerMux addClient:](self, "addClient:", self->_systemInputManager);

}

- (void)addClient:(id)a3
{
  id v4;
  char v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = -[NSMutableArray containsObject:](self->_clients, "containsObject:", v4);
    v4 = v9;
    if ((v5 & 1) == 0)
    {
      -[NSMutableArray addObject:](self->_clients, "addObject:", v9);
      v6 = objc_msgSend(v9, "conformsToProtocol:", &unk_1EDF79EA8);
      v4 = v9;
      if (v6)
      {
        -[UIKeyboardInputManagerMux responseDelegate](self, "responseDelegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setResponseDelegate:", v7);

        -[UIKeyboardInputManagerMux responseDelegate](self, "responseDelegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_requestInputManagerSync");

        v4 = v9;
      }
    }
  }

}

- (void)removeClient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EDF79EA8))
      objc_msgSend(v5, "setResponseDelegate:", 0);
    -[NSMutableArray removeObject:](self->_clients, "removeObject:", v5);
    v4 = v5;
  }

}

- (void)removeAllClients
{
  -[UIKeyboardInputManagerMux setSystemInputManager:](self, "setSystemInputManager:", 0);
  -[UIKeyboardInputManagerMux updateClientResponseDelegatesWithDelegate:](self, "updateClientResponseDelegatesWithDelegate:", 0);
  -[NSMutableArray removeAllObjects](self->_clients, "removeAllObjects");
}

- (void)releaseConnectedClients
{
  -[UIKeyboardInputManagerMux setSystemInputManager:](self, "setSystemInputManager:", 0);
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
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EDF79EA8, (_QWORD)v11))
          objc_msgSend(v10, "setResponseDelegate:", v4);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)setResponseDelegate:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_responseDelegate, a3);
  v5 = a3;
  -[UIKeyboardInputManagerMux updateClientResponseDelegatesWithDelegate:](self, "updateClientResponseDelegatesWithDelegate:", self->_responseDelegate);

}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___UIKeyboardInputManagerMux;
  if ((objc_msgSendSuper2(&v5, sel_instancesRespondToSelector_) & 1) != 0)
    return 1;
  else
    return objc_msgSend(MEMORY[0x1E0DBDC18], "instancesRespondToSelector:", a3);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardInputManagerMux;
  if (-[UIKeyboardInputManagerMux respondsToSelector:](&v5, sel_respondsToSelector_))
    return 1;
  else
    return objc_msgSend(MEMORY[0x1E0DBDC18], "instancesRespondToSelector:", a3);
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardInputManagerMux;
  if (-[UIKeyboardInputManagerMux isKindOfClass:](&v5, sel_isKindOfClass_))
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
  v7.super_class = (Class)UIKeyboardInputManagerMux;
  if (-[UIKeyboardInputManagerMux conformsToProtocol:](&v7, sel_conformsToProtocol_, v4))
    v5 = 1;
  else
    v5 = objc_msgSend(MEMORY[0x1E0DBDC18], "conformsToProtocol:", v4);

  return v5;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardInputManagerMux;
  -[UIKeyboardInputManagerMux methodSignatureForSelector:](&v9, sel_methodSignatureForSelector_);
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

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIKeyboardInputManagerMux systemInputManager](self, "systemInputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invokeWithTarget:", v5);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_clients;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        -[UIKeyboardInputManagerMux systemInputManager](self, "systemInputManager", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 != v12)
        {
          +[UIKeyboardInputManagerClientRequest untargetedInvocationWithInvocation:withCompletion:](UIKeyboardInputManagerClientRequest, "untargetedInvocationWithInvocation:withCompletion:", v4, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "invokeWithTarget:", v11);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (_UIIVCResponseDelegateImpl)responseDelegate
{
  return self->_responseDelegate;
}

- (TIKeyboardInputManager)systemInputManager
{
  return self->_systemInputManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemInputManager, 0);
  objc_storeStrong((id *)&self->_responseDelegate, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end
