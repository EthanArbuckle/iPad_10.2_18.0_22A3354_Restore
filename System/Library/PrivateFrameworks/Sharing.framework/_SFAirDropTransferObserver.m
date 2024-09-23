@implementation _SFAirDropTransferObserver

- (_SFAirDropTransferObserver)init
{
  _SFAirDropTransferObserver *v2;
  uint64_t v3;
  NSMutableDictionary *transferIdentifierToTransfer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFAirDropTransferObserver;
  v2 = -[SFXPCClient init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    transferIdentifierToTransfer = v2->_transferIdentifierToTransfer;
    v2->_transferIdentifierToTransfer = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)activate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_SFAirDropTransferObserver;
  -[SFXPCClient _activate](&v2, sel__activate);
}

- (void)invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_SFAirDropTransferObserver;
  -[SFXPCClient _invalidate](&v2, sel__invalidate);
}

- (void)observeForLocalOnlyPropertiesOnTransfer:(id)a3
{
  objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("transferProgress"), 0, SFAirDropTransferObserverContext);
}

- (void)removeObserverForLocalOnlyPropertiesOnTransfer:(id)a3
{
  objc_msgSend(a3, "removeObserver:forKeyPath:", self, CFSTR("transferProgress"));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  objc_super v14;

  v10 = a4;
  if ((void *)SFAirDropTransferObserverContext == a6)
  {
    -[SFXPCClient dispatchQueue](self, "dispatchQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __77___SFAirDropTransferObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v12[3] = &unk_1E482D3A0;
    v12[4] = self;
    v13 = v10;
    dispatch_async(v11, v12);

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_SFAirDropTransferObserver;
    -[_SFAirDropTransferObserver observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, a3, v10, a5, a6);
  }

}

- (void)updateActionHandlersOnTransfer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD aBlock[5];
  id v18;
  id location;
  os_activity_scope_state_s state;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFAirDropTransferObserver/updateActionHandlersOnTransfer", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  location = 0;
  objc_initWeak(&location, v4);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61___SFAirDropTransferObserver_updateActionHandlersOnTransfer___block_invoke;
  aBlock[3] = &unk_1E482D3F0;
  aBlock[4] = self;
  objc_copyWeak(&v18, &location);
  v6 = _Block_copy(aBlock);
  objc_msgSend(v4, "selectedAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActionHandler:", v6);

  objc_msgSend(v4, "cancelAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActionHandler:", v6);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "possibleActions", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setActionHandler:", v6);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  os_activity_scope_leave(&state);

}

- (void)updatedTransfer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFAirDropTransferObserver transferIdentifierToTransfer](self, "transferIdentifierToTransfer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "updateWithTransfer:", v4);
    -[_SFAirDropTransferObserver updateActionHandlersOnTransfer:](self, "updateActionHandlersOnTransfer:", v7);
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v7 = v4;
    objc_msgSend(v7, "setUpProgress");
    -[_SFAirDropTransferObserver observeForLocalOnlyPropertiesOnTransfer:](self, "observeForLocalOnlyPropertiesOnTransfer:", v7);
    -[_SFAirDropTransferObserver transferIdentifierToTransfer](self, "transferIdentifierToTransfer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v10);

    -[_SFAirDropTransferObserver updateActionHandlersOnTransfer:](self, "updateActionHandlersOnTransfer:", v7);
  }
  airdrop_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v12;
    _os_log_impl(&dword_1A2830000, v11, OS_LOG_TYPE_DEFAULT, "Updated transfer %@", (uint8_t *)&v14, 0xCu);

  }
  -[_SFAirDropTransferObserver delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updatedTransfer:", v7);

LABEL_8:
}

- (void)removedTransfer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFAirDropTransferObserver updatedTransfer:](self, "updatedTransfer:", v4);
  -[_SFAirDropTransferObserver transferIdentifierToTransfer](self, "transferIdentifierToTransfer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    airdrop_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1A2830000, v8, OS_LOG_TYPE_DEFAULT, "Removed transfer %@", (uint8_t *)&v14, 0xCu);

    }
    -[_SFAirDropTransferObserver removeObserverForLocalOnlyPropertiesOnTransfer:](self, "removeObserverForLocalOnlyPropertiesOnTransfer:", v7);
    -[_SFAirDropTransferObserver transferIdentifierToTransfer](self, "transferIdentifierToTransfer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v11);

    -[_SFAirDropTransferObserver delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[_SFAirDropTransferObserver delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removedTransfer:", v7);

    }
  }

}

- (id)machServiceName
{
  return CFSTR("com.apple.sharing.transfer-observer");
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6AE840);
}

- (id)remoteObjectInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DB748);
}

- (BOOL)shouldEscapeXpcTryCatch
{
  return 1;
}

- (SFAirDropTransferObserverDelegate)delegate
{
  return (SFAirDropTransferObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)transferIdentifierToTransfer
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTransferIdentifierToTransfer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferIdentifierToTransfer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
