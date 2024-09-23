@implementation SYShowBacklinkIndicatorCommandSynapseImpl

- (SYShowBacklinkIndicatorCommandSynapseImpl)initWithDomainIdentifiers:(id)a3 linkIdentifiers:(id)a4
{
  id v6;
  id v7;
  SYShowBacklinkIndicatorCommandSynapseImpl *v8;
  uint64_t v9;
  SYBacklinkIndicatorClient *client;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SYShowBacklinkIndicatorCommandSynapseImpl;
  v8 = -[SYShowBacklinkIndicatorCommandSynapseImpl init](&v12, sel_init);
  if (v8)
  {
    +[SYBacklinkIndicatorClient clientWithDomainIdentifiers:linkIdentifiers:](SYBacklinkIndicatorClient, "clientWithDomainIdentifiers:linkIdentifiers:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    client = v8->__client;
    v8->__client = (SYBacklinkIndicatorClient *)v9;

  }
  return v8;
}

- (BOOL)isActive
{
  void *v3;
  BOOL v4;

  -[SYShowBacklinkIndicatorCommandSynapseImpl _client](self, "_client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[SYShowBacklinkIndicatorCommandSynapseImpl didSucceed](self, "didSucceed");
  else
    v4 = 0;

  return v4;
}

- (void)runWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SYShowBacklinkIndicatorCommandSynapseImpl _client](self, "_client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__SYShowBacklinkIndicatorCommandSynapseImpl_runWithCompletion___block_invoke;
  v7[3] = &unk_1E757B528;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "requestIndicatorWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __63__SYShowBacklinkIndicatorCommandSynapseImpl_runWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((a2 & 1) == 0)
  {
    v5 = os_log_create("com.apple.synapse", ");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_DEFAULT, "Request to show backlink indicator failed.", v7, 2u);
    }

  }
  objc_msgSend(WeakRetained, "setDidSucceed:", a2);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

- (void)invalidate
{
  -[SYShowBacklinkIndicatorCommandSynapseImpl set_client:](self, "set_client:", 0);
}

- (SYBacklinkIndicatorClient)_client
{
  return self->__client;
}

- (void)set_client:(id)a3
{
  objc_storeStrong((id *)&self->__client, a3);
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (void)setDidSucceed:(BOOL)a3
{
  self->_didSucceed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__client, 0);
}

@end
