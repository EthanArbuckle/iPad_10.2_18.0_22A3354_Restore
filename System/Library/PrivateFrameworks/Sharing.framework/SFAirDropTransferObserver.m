@implementation SFAirDropTransferObserver

uint64_t __77___SFAirDropTransferObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatedTransfer:", *(_QWORD *)(a1 + 40));
}

void __61___SFAirDropTransferObserver_updateActionHandlersOnTransfer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "transferIdentifierToTransfer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61___SFAirDropTransferObserver_updateActionHandlersOnTransfer___block_invoke_2;
    v9[3] = &unk_1E482D3C8;
    v10 = v6;
    v11 = v3;
    objc_msgSend(v7, "_getRemoteObjectProxyOnQueue:", v9);

    v8 = v10;
  }
  else
  {
    airdrop_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __61___SFAirDropTransferObserver_updateActionHandlersOnTransfer___block_invoke_cold_1((uint64_t)v3, a1, v8);
  }

}

uint64_t __61___SFAirDropTransferObserver_updateActionHandlersOnTransfer___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "transfer:actionTriggeredForAction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (SFAirDropTransferObserver)init
{
  SFAirDropTransferObserver *v2;
  SFAirDropTransferObserver *v3;
  _SFAirDropTransferObserver *v4;
  _SFAirDropTransferObserver *legacyObserver;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFAirDropTransferObserver;
  v2 = -[SFAirDropTransferObserver init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isModern = 0;
    v4 = objc_alloc_init(_SFAirDropTransferObserver);
    legacyObserver = v3->_legacyObserver;
    v3->_legacyObserver = v4;

    -[_SFAirDropTransferObserver setDelegate:](v3->_legacyObserver, "setDelegate:", v3);
  }
  return v3;
}

- (void)activate
{
  id v3;

  if (-[SFAirDropTransferObserver isModern](self, "isModern"))
    -[SFAirDropTransferObserver modernObserver](self, "modernObserver");
  else
    -[SFAirDropTransferObserver legacyObserver](self, "legacyObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activate");

}

- (void)invalidate
{
  id v3;

  if (-[SFAirDropTransferObserver isModern](self, "isModern"))
    -[SFAirDropTransferObserver modernObserver](self, "modernObserver");
  else
    -[SFAirDropTransferObserver legacyObserver](self, "legacyObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activate");

}

- (void)updatedTransfer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SFAirDropTransferObserver delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updatedTransfer:", v4);

}

- (void)removedTransfer:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SFAirDropTransferObserver delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SFAirDropTransferObserver delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removedTransfer:", v7);

  }
}

- (SFAirDropTransferObserverDelegate)delegate
{
  return (SFAirDropTransferObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_SFAirDropTransferObserver)legacyObserver
{
  return self->_legacyObserver;
}

- (void)setLegacyObserver:(id)a3
{
  objc_storeStrong((id *)&self->_legacyObserver, a3);
}

- (_TtC7Sharing33_SFAirDropTransferObserverAdaptor)modernObserver
{
  return self->_modernObserver;
}

- (void)setModernObserver:(id)a3
{
  objc_storeStrong((id *)&self->_modernObserver, a3);
}

- (BOOL)isModern
{
  return self->_isModern;
}

- (void)setIsModern:(BOOL)a3
{
  self->_isModern = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modernObserver, 0);
  objc_storeStrong((id *)&self->_legacyObserver, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __61___SFAirDropTransferObserver_updateActionHandlersOnTransfer___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id WeakRetained;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a2 + 40));
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = WeakRetained;
  _os_log_error_impl(&dword_1A2830000, a3, OS_LOG_TYPE_ERROR, "Unable to trigger action %@ for unknown transfer: %@", (uint8_t *)&v6, 0x16u);

}

@end
