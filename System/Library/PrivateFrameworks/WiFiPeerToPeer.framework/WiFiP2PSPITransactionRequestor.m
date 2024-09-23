@implementation WiFiP2PSPITransactionRequestor

- (void)endTransaction:(int64_t)a3
{
  -[WiFiP2PSPITransactionRequestor endTransaction:completionHandler:](self, "endTransaction:completionHandler:", a3, 0);
}

- (void)beginTransaction:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  WiFiP2PXPCConnection *xpcConnection;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  int64_t v12;
  _QWORD v13[7];
  _QWORD v14[3];
  char v15;

  v6 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  xpcConnection = self->_xpcConnection;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__WiFiP2PSPITransactionRequestor_beginTransaction_completionHandler___block_invoke;
  v13[3] = &unk_1E6E1E9E0;
  v13[5] = v14;
  v13[6] = a3;
  v13[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__WiFiP2PSPITransactionRequestor_beginTransaction_completionHandler___block_invoke_2;
  v9[3] = &unk_1E6E1EA08;
  v11 = v14;
  v12 = a3;
  v9[4] = self;
  v8 = v6;
  v10 = v8;
  -[WiFiP2PXPCConnection withRemoteObjectProxy:clientCompletionHandler:](xpcConnection, "withRemoteObjectProxy:clientCompletionHandler:", v13, v9);

  _Block_object_dispose(v14, 8);
}

- (void)endTransaction:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  WiFiP2PXPCConnection *xpcConnection;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  int64_t v12;
  _QWORD v13[7];
  _QWORD v14[3];
  char v15;

  v6 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  xpcConnection = self->_xpcConnection;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__WiFiP2PSPITransactionRequestor_endTransaction_completionHandler___block_invoke;
  v13[3] = &unk_1E6E1E9E0;
  v13[5] = v14;
  v13[6] = a3;
  v13[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__WiFiP2PSPITransactionRequestor_endTransaction_completionHandler___block_invoke_2;
  v9[3] = &unk_1E6E1EA08;
  v11 = v14;
  v12 = a3;
  v9[4] = self;
  v8 = v6;
  v10 = v8;
  -[WiFiP2PXPCConnection withRemoteObjectProxy:clientCompletionHandler:](xpcConnection, "withRemoteObjectProxy:clientCompletionHandler:", v13, v9);

  _Block_object_dispose(v14, 8);
}

void __67__WiFiP2PSPITransactionRequestor_endTransaction_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = (void *)a1[4];
  v6 = a1[6];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "_removeOpenTransaction:", v6);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  objc_msgSend(v8, "endTransaction:completionHandler:", a1[6], v7);

}

- (void)_removeOpenTransaction:(int64_t)a3
{
  NSMutableArray *openTransactions;
  void *v5;
  uint64_t v6;

  openTransactions = self->_openTransactions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSMutableArray indexOfObject:](openTransactions, "indexOfObject:", v5);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->_openTransactions, "removeObjectAtIndex:", v6);
}

void __69__WiFiP2PSPITransactionRequestor_beginTransaction_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1[4] + 8);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a1[6];
  v8 = a3;
  v10 = a2;
  objc_msgSend(v6, "numberWithInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v9);

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  objc_msgSend(v10, "beginTransaction:completionHandler:", a1[6], v8);

}

+ (id)shared
{
  if (_MergedGlobals_1 != -1)
    dispatch_once(&_MergedGlobals_1, &__block_literal_global_4);
  return (id)qword_1ED2303F0;
}

uint64_t __67__WiFiP2PSPITransactionRequestor_endTransaction_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "_removeOpenTransaction:", *(_QWORD *)(a1 + 56));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "stop");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __69__WiFiP2PSPITransactionRequestor_beginTransaction_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      objc_msgSend(*(id *)(a1 + 32), "_removeOpenTransaction:", *(_QWORD *)(a1 + 56));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "stop");
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (WiFiP2PSPITransactionRequestor)init
{
  WiFiP2PSPITransactionRequestor *v2;
  uint64_t v3;
  NSMutableArray *openTransactions;
  WiFiP2PXPCConnection *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  uint64_t v8;
  WiFiP2PXPCConnection *xpcConnection;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WiFiP2PSPITransactionRequestor;
  v2 = -[WiFiP2PSPITransactionRequestor init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    openTransactions = v2->_openTransactions;
    v2->_openTransactions = (NSMutableArray *)v3;

    v5 = [WiFiP2PXPCConnection alloc];
    +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop](WiFiP2PXPCConnection, "wifiPeerToPeerWorkloop");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create_with_target_V2("com.apple.wifip2p.WiFiP2PSPI", 0, v6);
    v8 = -[WiFiP2PXPCConnection initWithEndpointType:queue:retryTimeout:](v5, "initWithEndpointType:queue:retryTimeout:", 0, v7, -1);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (WiFiP2PXPCConnection *)v8;

    -[WiFiP2PXPCConnection setDelegate:](v2->_xpcConnection, "setDelegate:", v2);
  }
  return v2;
}

void __40__WiFiP2PSPITransactionRequestor_shared__block_invoke()
{
  WiFiP2PSPITransactionRequestor *v0;
  void *v1;

  v0 = objc_alloc_init(WiFiP2PSPITransactionRequestor);
  v1 = (void *)qword_1ED2303F0;
  qword_1ED2303F0 = (uint64_t)v0;

}

- (id)remoteObjectInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A4E60);
}

- (void)handleConnectionEstablishedWithProxy:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_openTransactions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "beginTransaction:completionHandler:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "integerValue", (_QWORD)v10), &__block_literal_global_52);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(a3, "createXPCResponderWithType:completionHandler:", 0, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_openTransactions, 0);
}

@end
