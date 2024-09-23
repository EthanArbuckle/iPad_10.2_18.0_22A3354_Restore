@implementation SCROScriptClient

+ (SCROScriptClient)sharedClient
{
  if (sharedClient_onceToken != -1)
    dispatch_once(&sharedClient_onceToken, &__block_literal_global_8);
  return (SCROScriptClient *)(id)_sharedClient;
}

void __32__SCROScriptClient_sharedClient__block_invoke()
{
  SCROScriptClient *v0;
  void *v1;

  v0 = objc_alloc_init(SCROScriptClient);
  v1 = (void *)_sharedClient;
  _sharedClient = (uint64_t)v0;

}

- (SCROScriptClient)init
{
  SCROScriptClient *v2;
  NSLock *v3;
  NSLock *lock;
  uint64_t v5;
  SCRCTargetSelectorTimer *timer;
  dispatch_queue_t v7;
  OS_dispatch_queue *scriptDispatchQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCROScriptClient;
  v2 = -[SCROScriptClient init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v2->_lock;
    v2->_lock = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BE843B8]), "initWithTarget:selector:threadKey:", v2, sel__killConnection, 0);
    timer = v2->_timer;
    v2->_timer = (SCRCTargetSelectorTimer *)v5;

    v7 = dispatch_queue_create("SCROScriptClient_scriptRunner", 0);
    scriptDispatchQueue = v2->__scriptDispatchQueue;
    v2->__scriptDispatchQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SCRCTargetSelectorTimer invalidate](self->_timer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SCROScriptClient;
  -[SCROScriptClient dealloc](&v3, sel_dealloc);
}

- (void)_killConnection
{
  SCROConnection *connection;

  -[NSLock lock](self->_lock, "lock");
  -[SCROConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  self->_isReady = 0;
  -[NSLock unlock](self->_lock, "unlock");
}

- (id)_lazyConnection
{
  SCROConnection *v3;
  SCROConnection *v4;
  SCROConnection *connection;

  -[NSLock lock](self->_lock, "lock");
  v3 = self->_connection;
  -[NSLock unlock](self->_lock, "unlock");
  if (v3)
    goto LABEL_6;
  -[NSLock lock](self->_lock, "lock");
  if (!self->_connection)
  {
    v4 = -[SCROConnection initWithHandlerType:delegate:]([SCROConnection alloc], "initWithHandlerType:delegate:", 2, self);
    connection = self->_connection;
    self->_connection = v4;

    if (!-[SCROScriptClient _isReady](self, "_isReady"))
      fwrite("Screen Reader Script Server: NOT AVAILABLE\n", 0x2BuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  }
  v3 = self->_connection;
  -[NSLock unlock](self->_lock, "unlock");
  if (v3)
LABEL_6:
    -[SCRCTargetSelectorTimer dispatchAfterDelay:](self->_timer, "dispatchAfterDelay:", 300.0);
  return v3;
}

- (BOOL)_isReady
{
  unsigned int isReady;
  unsigned int v5;

  isReady = self->_isReady;
  if (self->_isReady)
    return 1;
  do
  {
    v5 = isReady;
    usleep(0x186A0u);
    if (v5 == 49)
      break;
    isReady = v5 + 1;
  }
  while (!self->_isReady);
  return v5 < 0x31;
}

- (void)handleCallback:(id)a3
{
  int v4;
  SCROConnection *v5;
  SCROConnection *connection;
  BOOL v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "key");
  if (v4 == 4)
  {
    v7 = 0;
    goto LABEL_6;
  }
  if (v4 == 3)
  {
    objc_msgSend(v8, "object");
    v5 = (SCROConnection *)objc_claimAutoreleasedReturnValue();
    connection = self->_connection;

    if (v5 == connection)
    {
      v7 = 1;
LABEL_6:
      self->_isReady = v7;
    }
  }

}

- (BOOL)_runAsyncWithConnection:(int)a3 object:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v11;
  id v12;
  int v13;

  v6 = a4;
  -[SCROScriptClient _lazyConnection](self, "_lazyConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SCROScriptClient _scriptDispatchQueue](self, "_scriptDispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__SCROScriptClient__runAsyncWithConnection_object___block_invoke;
    block[3] = &unk_24CC1DB68;
    v11 = v7;
    v13 = a3;
    v12 = v6;
    dispatch_async(v8, block);

  }
  return v7 != 0;
}

id __51__SCROScriptClient__runAsyncWithConnection_object___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "handlerValueForKey:withObject:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (BOOL)runScriptFile:(id)a3
{
  id v5;
  BOOL v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SCROScriptClient.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("file"));

  }
  if (objc_msgSend(v5, "length"))
    v6 = -[SCROScriptClient _runAsyncWithConnection:object:](self, "_runAsyncWithConnection:object:", 96, v5);
  else
    v6 = 0;

  return v6;
}

- (BOOL)runShortcutWithIdentifier:(id)a3
{
  id v5;
  BOOL v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SCROScriptClient.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  if (objc_msgSend(v5, "length"))
    v6 = -[SCROScriptClient _runAsyncWithConnection:object:](self, "_runAsyncWithConnection:object:", 97, v5);
  else
    v6 = 0;

  return v6;
}

- (OS_dispatch_queue)_scriptDispatchQueue
{
  return self->__scriptDispatchQueue;
}

- (void)set_scriptDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->__scriptDispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__scriptDispatchQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
