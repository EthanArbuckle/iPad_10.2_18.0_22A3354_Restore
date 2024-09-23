@implementation _PSHandleRanker

- (_PSHandleRanker)init
{
  _PSHandleRanker *v2;
  id v3;
  uint64_t v4;
  NSXPCConnection *connection;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_PSHandleRanker;
  v2 = -[_PSHandleRanker init](&v8, sel_init);
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
  v3.super_class = (Class)_PSHandleRanker;
  -[_PSHandleRanker dealloc](&v3, sel_dealloc);
}

- (id)rankedHandlesFromCandidateHandles:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  connection = self->_connection;
  if (connection)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__6;
    v14 = __Block_byref_object_dispose__6;
    v15 = 0;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53___PSHandleRanker_rankedHandlesFromCandidateHandles___block_invoke_4;
    v9[3] = &unk_1E43FFC68;
    v9[4] = &v10;
    objc_msgSend(v6, "rankedHandlesFromCandidateHandles:reply:", v4, v9);
    v7 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
