@implementation STStatusServer

- (id)dataForDomain:(unint64_t)a3
{
  if (self)
    self = (STStatusServer *)self->_serverHandle;
  return -[STStatusServer dataForDomain:](self, "dataForDomain:", a3);
}

- (void)updateDataForPublisherClient:(id)a3 domain:(unint64_t)a4 usingDiffProvider:(id)a5 completion:(id)a6
{
  if (self)
    self = (STStatusServer *)self->_publisherServerHandle;
  -[STStatusServer updateDataForPublisherClient:domain:usingDiffProvider:completion:](self, "updateDataForPublisherClient:domain:usingDiffProvider:completion:", a3, a4, a5, a6);
}

- (STStatusServer)init
{
  STLocalStatusServer *v3;
  void *v4;
  STStatusServer *v5;

  if (_os_feature_enabled_impl())
  {
    STDefaultStatusDomainServerHandle();
    v3 = (STLocalStatusServer *)objc_claimAutoreleasedReturnValue();
    STDefaultStatusDomainPublisherServerHandle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[STStatusServer initWithLocalStatusServer:serverHandle:publisherServerHandle:]((id *)&self->super.isa, 0, v3, v4);

  }
  else
  {
    v3 = objc_alloc_init(STLocalStatusServer);
    v5 = -[STStatusServer initWithLocalStatusServer:serverHandle:publisherServerHandle:]((id *)&self->super.isa, v3, v3, v3);
  }

  return v5;
}

- (id)initWithLocalStatusServer:(void *)a3 serverHandle:(void *)a4 publisherServerHandle:
{
  id v8;
  id v9;
  id v10;
  id *v11;
  objc_super v13;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)STStatusServer;
    v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 4, a4);
    }
  }

  return a1;
}

- (BSIntegerSet)publishedDomains
{
  return (BSIntegerSet *)objc_alloc_init(MEMORY[0x1E0D01790]);
}

- (id)publishedDataForDomain:(unint64_t)a3
{
  if (self)
    self = (STStatusServer *)self->_publisherServerHandle;
  return -[STStatusServer publishedDataForDomain:](self, "publishedDataForDomain:", a3);
}

- (id)publishedVolatileDataForDomain:(unint64_t)a3
{
  if (self)
    self = (STStatusServer *)self->_publisherServerHandle;
  return -[STStatusServer publishedVolatileDataForDomain:](self, "publishedVolatileDataForDomain:", a3);
}

- (void)registerPublisherClient:(id)a3 forDomain:(unint64_t)a4 fallbackData:(id)a5
{
  if (self)
    self = (STStatusServer *)self->_publisherServerHandle;
  -[STStatusServer registerPublisherClient:forDomain:fallbackData:](self, "registerPublisherClient:forDomain:fallbackData:", a3, a4, a5);
}

- (void)removePublisherClient:(id)a3 forDomain:(unint64_t)a4
{
  if (self)
    self = (STStatusServer *)self->_publisherServerHandle;
  -[STStatusServer removePublisherClient:forDomain:](self, "removePublisherClient:forDomain:", a3, a4);
}

- (void)publishData:(id)a3 forPublisherClient:(id)a4 domain:(unint64_t)a5 withChangeContext:(id)a6 completion:(id)a7
{
  if (self)
    self = (STStatusServer *)self->_publisherServerHandle;
  -[STStatusServer publishData:forPublisherClient:domain:withChangeContext:completion:](self, "publishData:forPublisherClient:domain:withChangeContext:completion:", a3, a4, a5, a6, a7);
}

- (void)publishVolatileData:(id)a3 forPublisherClient:(id)a4 domain:(unint64_t)a5 withChangeContext:(id)a6 completion:(id)a7
{
  if (self)
    self = (STStatusServer *)self->_publisherServerHandle;
  -[STStatusServer publishVolatileData:forPublisherClient:domain:withChangeContext:completion:](self, "publishVolatileData:forPublisherClient:domain:withChangeContext:completion:", a3, a4, a5, a6, a7);
}

- (void)updateVolatileDataForPublisherClient:(id)a3 domain:(unint64_t)a4 usingDiffProvider:(id)a5 completion:(id)a6
{
  if (self)
    self = (STStatusServer *)self->_publisherServerHandle;
  -[STStatusServer updateVolatileDataForPublisherClient:domain:usingDiffProvider:completion:](self, "updateVolatileDataForPublisherClient:domain:usingDiffProvider:completion:", a3, a4, a5, a6);
}

- (void)registerClient:(id)a3 forDomain:(unint64_t)a4
{
  if (self)
    self = (STStatusServer *)self->_serverHandle;
  -[STStatusServer registerClient:forDomain:](self, "registerClient:forDomain:", a3, a4);
}

- (void)removeClient:(id)a3 forDomain:(unint64_t)a4
{
  if (self)
    self = (STStatusServer *)self->_serverHandle;
  -[STStatusServer removeClient:forDomain:](self, "removeClient:forDomain:", a3, a4);
}

- (void)reportUserInteraction:(id)a3 forClient:(id)a4 domain:(unint64_t)a5
{
  if (self)
    self = (STStatusServer *)self->_serverHandle;
  -[STStatusServer reportUserInteraction:forClient:domain:](self, "reportUserInteraction:forClient:domain:", a3, a4, a5);
}

- (void)addDataTransformer:(id)a3 forDomain:(unint64_t)a4
{
  if (self)
    self = (STStatusServer *)self->_localStatusServer;
  -[STStatusServer addDataTransformer:forDomain:](self, "addDataTransformer:forDomain:", a3, a4);
}

- (void)removeDataTransformer:(id)a3 forDomain:(unint64_t)a4
{
  if (self)
    self = (STStatusServer *)self->_localStatusServer;
  -[STStatusServer removeDataTransformer:forDomain:](self, "removeDataTransformer:forDomain:", a3, a4);
}

- (void)modifyDataTransformer:(id)a3 forDomain:(unint64_t)a4 usingBlock:(id)a5
{
  if (self)
    self = (STStatusServer *)self->_localStatusServer;
  -[STStatusServer modifyDataTransformer:forDomain:usingBlock:](self, "modifyDataTransformer:forDomain:usingBlock:", a3, a4, a5);
}

- (void)addClientDataTransformerProvider:(id)a3 forDomain:(unint64_t)a4
{
  if (self)
    self = (STStatusServer *)self->_localStatusServer;
  -[STStatusServer addClientDataTransformerProvider:forDomain:](self, "addClientDataTransformerProvider:forDomain:", a3, a4);
}

- (void)removeClientDataTransformerProvider:(id)a3 forDomain:(unint64_t)a4
{
  if (self)
    self = (STStatusServer *)self->_localStatusServer;
  -[STStatusServer removeClientDataTransformerProvider:forDomain:](self, "removeClientDataTransformerProvider:forDomain:", a3, a4);
}

- (void)modifyClientDataTransformerProvider:(id)a3 forDomain:(unint64_t)a4 usingBlock:(id)a5
{
  if (self)
    self = (STStatusServer *)self->_localStatusServer;
  -[STStatusServer modifyClientDataTransformerProvider:forDomain:usingBlock:](self, "modifyClientDataTransformerProvider:forDomain:usingBlock:", a3, a4, a5);
}

- (STStatusServerDelegate)delegate
{
  return (STStatusServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherServerHandle, 0);
  objc_storeStrong((id *)&self->_serverHandle, 0);
  objc_storeStrong((id *)&self->_localStatusServer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
