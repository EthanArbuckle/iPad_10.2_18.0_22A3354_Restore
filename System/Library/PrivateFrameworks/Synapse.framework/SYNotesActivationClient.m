@implementation SYNotesActivationClient

- (SYNotesActivationClient)init
{
  SYNotesActivationClient *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *clientQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SYNotesActivationClient;
  v2 = -[SYNotesActivationClient init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.synapse.ActivationClient", v3);
    clientQueue = v2->__clientQueue;
    v2->__clientQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)activateNotesWithUserActivity:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a4;
  SYActivationContextForUserActivity(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYNotesActivationClient _clientQueue](self, "_clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SYNotesActivationClient_activateNotesWithUserActivity_completion___block_invoke;
  block[3] = &unk_1E757B9B0;
  v12 = v7;
  v13 = v6;
  block[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __68__SYNotesActivationClient_activateNotesWithUserActivity_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  id v11;

  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __68__SYNotesActivationClient_activateNotesWithUserActivity_completion___block_invoke_2;
  v9 = &unk_1E757BB90;
  v2 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = v2;
  v3 = (void *)MEMORY[0x1BCCFF08C](&v6);
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnection", v6, v7, v8, v9);
  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "activateNotesWithContext:completion:", *(_QWORD *)(a1 + 40), v3);
}

uint64_t __68__SYNotesActivationClient_activateNotesWithUserActivity_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  return objc_msgSend(*(id *)(a1 + 32), "_setConnection:", 0);
}

- (void)_ensureConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[SYNotesActivationClient _connection](self, "_connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.synapse.notes-activation-service"), 0);
    -[SYNotesActivationClient _setConnection:](self, "_setConnection:", v4);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF495688);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYNotesActivationClient _connection](self, "_connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteObjectInterface:", v5);

    -[SYNotesActivationClient _connection](self, "_connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYNotesActivationClient _clientQueue](self, "_clientQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setQueue:", v8);

    -[SYNotesActivationClient _connection](self, "_connection");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resume");

  }
}

- (NSXPCConnection)_connection
{
  return self->__connection;
}

- (void)_setConnection:(id)a3
{
  objc_storeStrong((id *)&self->__connection, a3);
}

- (OS_dispatch_queue)_clientQueue
{
  return self->__clientQueue;
}

- (void)_clientQueue:(id)a3
{
  objc_storeStrong((id *)&self->__clientQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__clientQueue, 0);
  objc_storeStrong((id *)&self->__connection, 0);
}

@end
