@implementation STKUSSDAlertSession

- (STKUSSDAlertSession)initWithLogger:(id)a3 responseProvider:(id)a4 event:(int64_t)a5 options:(id)a6 sound:(id)a7
{
  STKUSSDAlertSession *v8;
  STKUSSDAlertSession *v9;
  uint64_t v10;
  NSXPCListener *ussdListener;
  uint64_t v12;
  NSMutableArray *connectionQueue;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)STKUSSDAlertSession;
  v8 = -[STKAlertSession initWithLogger:responseProvider:options:sound:](&v15, sel_initWithLogger_responseProvider_options_sound_, a3, a4, a6, a7);
  v9 = v8;
  if (v8)
  {
    v8->_event = a5;
    objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    v10 = objc_claimAutoreleasedReturnValue();
    ussdListener = v9->_ussdListener;
    v9->_ussdListener = (NSXPCListener *)v10;

    -[NSXPCListener setDelegate:](v9->_ussdListener, "setDelegate:", v9);
    -[NSXPCListener resume](v9->_ussdListener, "resume");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    connectionQueue = v9->_connectionQueue;
    v9->_connectionQueue = (NSMutableArray *)v12;

  }
  return v9;
}

- (void)invalidate
{
  objc_super v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __33__STKUSSDAlertSession_invalidate__block_invoke;
  v4[3] = &unk_24D563080;
  v4[4] = self;
  _STKWithLock((os_unfair_lock_s *)self, v4);
  v3.receiver = self;
  v3.super_class = (Class)STKUSSDAlertSession;
  -[STKAlertSession invalidate](&v3, sel_invalidate);
}

uint64_t __33__STKUSSDAlertSession_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 41))
    return objc_msgSend(*(id *)(v1 + 88), "invalidate");
  return result;
}

- (BOOL)hasReceivedContent
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__STKUSSDAlertSession_hasReceivedContent__block_invoke;
  v4[3] = &unk_24D5635D8;
  v4[4] = self;
  v4[5] = &v5;
  _STKWithLock((os_unfair_lock_s *)self, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __41__STKUSSDAlertSession_hasReceivedContent__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

- (void)setHasReceivedContent:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__STKUSSDAlertSession_setHasReceivedContent___block_invoke;
  v3[3] = &unk_24D563600;
  v3[4] = self;
  v4 = a3;
  _STKWithLock((os_unfair_lock_s *)self, v3);
}

uint64_t __45__STKUSSDAlertSession_setHasReceivedContent___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 72) = *(_BYTE *)(result + 40);
  return result;
}

- (void)performUSSDUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__STKUSSDAlertSession_performUSSDUpdate___block_invoke;
  v6[3] = &unk_24D5633B0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  _STKWithLock((os_unfair_lock_s *)self, v6);

}

void __41__STKUSSDAlertSession_performUSSDUpdate___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 96))
  {
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(v1 + 96), "remoteObjectProxy");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
  else
  {
    v3 = *(void **)(v1 + 104);
    v4 = (id)MEMORY[0x2199F8930](*(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "addObject:");
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  STKUSSDSessionCommunicationInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoteObjectInterface:", v7);

  STKUSSDHostCommunicationInterface();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v8);

  objc_msgSend(v6, "setExportedObject:", self);
  objc_msgSend(v6, "resume");
  objc_storeStrong((id *)&self->_ussdConnection, a4);
  -[NSXPCConnection remoteObjectProxy](self->_ussdConnection, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = self->_connectionQueue;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14) + 16))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14));
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  -[NSMutableArray removeAllObjects](self->_connectionQueue, "removeAllObjects", (_QWORD)v16);
  return 1;
}

- (int64_t)event
{
  return self->_event;
}

- (NSXPCListener)ussdListener
{
  return self->_ussdListener;
}

- (NSXPCConnection)ussdConnection
{
  return self->_ussdConnection;
}

- (NSMutableArray)connectionQueue
{
  return self->_connectionQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_ussdConnection, 0);
  objc_storeStrong((id *)&self->_ussdListener, 0);
}

@end
