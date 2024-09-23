@implementation _PSSiriHandleRanker

- (_PSSiriHandleRanker)init
{
  _PSSiriHandleRanker *v2;
  id v3;
  uint64_t v4;
  NSXPCConnection *connection;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_PSSiriHandleRanker;
  v2 = -[_PSSiriHandleRanker init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v4 = objc_msgSend(v3, "initWithMachServiceName:options:", *MEMORY[0x1E0D15B18], 4096);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v4;

    _CDInteractionNSXPCInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection resume](v2->_connection, "resume");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_PSSiriHandleRanker;
  -[_PSSiriHandleRanker dealloc](&v3, sel_dealloc);
}

- (id)rankedHandles:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSXPCConnection *connection;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = a4;
  connection = self->_connection;
  if (connection)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__18;
    v17 = __Block_byref_object_dispose__18;
    v18 = 0;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_35);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45___PSSiriHandleRanker_rankedHandles_context___block_invoke_4;
    v12[3] = &unk_1E43FFC68;
    v12[4] = &v13;
    objc_msgSend(v9, "rankedSiriMLCRHandlesFromContext:handles:reply:", v7, v6, v12);
    v10 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
