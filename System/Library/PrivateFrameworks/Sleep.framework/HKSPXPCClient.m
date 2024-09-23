@implementation HKSPXPCClient

- (NSString)description
{
  return (NSString *)-[HKSPXPCClient descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

uint64_t __25__HKSPXPCClient_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "connection");
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPXPCClient descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInt:withName:", -[HKSPXPCClient processID](self, "processID"), CFSTR("pid"));
  -[HKSPXPCClient clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loggingIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v6, CFSTR("id"), 1);

  return v3;
}

- (HKSPXPCClientIdentifier)clientIdentifier
{
  return (HKSPXPCClientIdentifier *)objc_getProperty(self, a2, 24, 1);
}

- (int)processID
{
  void *v2;
  int v3;

  -[HKSPXPCClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NAFuture)clientIdentifierProvider
{
  return self->_clientIdentifierProvider;
}

void __72__HKSPXPCClient_initWithConnection_clientIdentifierProvider_clientLink___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  HKSPNilify(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "setClientIdentifier:", v4);
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

+ (id)clientForConnection:(id)a3 clientIdentifierProvider:(id)a4 clientLink:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConnection:clientIdentifierProvider:clientLink:", v9, v8, v7);

  return v10;
}

- (HKSPXPCClient)initWithConnection:(id)a3 clientIdentifierProvider:(id)a4 clientLink:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKSPXPCClient *v12;
  HKSPXPCClient *v13;
  NAFuture *clientIdentifierProvider;
  id v15;
  HKSPXPCClient *v16;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HKSPXPCClient;
  v12 = -[HKSPXPCClient init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    objc_storeStrong((id *)&v13->_clientIdentifierProvider, a4);
    objc_initWeak(&location, v13);
    clientIdentifierProvider = v13->_clientIdentifierProvider;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __72__HKSPXPCClient_initWithConnection_clientIdentifierProvider_clientLink___block_invoke;
    v18[3] = &unk_1E4E3CD98;
    objc_copyWeak(&v19, &location);
    v15 = (id)-[NAFuture addSuccessBlock:](clientIdentifierProvider, "addSuccessBlock:", v18);
    objc_storeStrong((id *)&v13->_clientLink, a5);
    v16 = v13;
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_connection);
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  HKSPXPCClient *v4;
  HKSPXPCClient *v5;
  void *v6;
  NSXPCConnection *connection;
  HKSPXPCClient *v8;
  id v9;
  char v10;
  _QWORD v12[4];
  HKSPXPCClient *v13;

  v4 = (HKSPXPCClient *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v5, objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      connection = self->_connection;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __25__HKSPXPCClient_isEqual___block_invoke;
      v12[3] = &unk_1E4E3CDC0;
      v13 = v5;
      v8 = v5;
      v9 = (id)objc_msgSend(v6, "appendObject:counterpart:", connection, v12);
      v10 = objc_msgSend(v6, "isEqual");

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifierProvider, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientLink, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

+ (id)clientForConnection:(id)a3 clientLink:(id)a4
{
  return (id)objc_msgSend(a1, "clientForConnection:clientIdentifierProvider:clientLink:", a3, 0, a4);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HKSPXPCClient succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HKSPClient)clientLink
{
  return self->_clientLink;
}

@end
