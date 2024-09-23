@implementation TBPersistenceRemoteStoreServer

- (TBPersistenceRemoteStoreServer)initWithStoreURL:(id)a3 modelURL:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  TBPersistenceRemoteStoreServer *v12;
  TBPersistenceRemoteStoreServer *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TBPersistenceRemoteStoreServer;
  v12 = -[TBPersistenceRemoteStoreServer init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_storeURL, a3);
    objc_storeStrong((id *)&v13->_modelURL, a4);
    objc_storeStrong((id *)&v13->_serverOptions, a5);
  }

  return v13;
}

- (void)startListening
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x1D17AC818](self, a2);
  v4 = (void *)objc_opt_new();
  v5 = objc_alloc(MEMORY[0x1E0C97C30]);
  -[TBPersistenceRemoteStoreServer storeURL](self, "storeURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TBPersistenceRemoteStoreServer modelURL](self, "modelURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TBPersistenceRemoteStoreServer serverOptions](self, "serverOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initForStoreWithURL:usingModelAtURL:options:policy:", v6, v7, v8, v4);
  -[TBPersistenceRemoteStoreServer setXpcStoreServer:](self, "setXpcStoreServer:", v9);

  -[TBPersistenceRemoteStoreServer serverOptions](self, "serverOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%s: started listening with options: %@"), "-[TBPersistenceRemoteStoreServer startListening]", v10);

  objc_autoreleasePoolPop(v3);
  -[TBPersistenceRemoteStoreServer xpcStoreServer](self, "xpcStoreServer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startListening");

}

- (NSXPCStoreServer)xpcStoreServer
{
  return self->_xpcStoreServer;
}

- (void)setXpcStoreServer:(id)a3
{
  objc_storeStrong((id *)&self->_xpcStoreServer, a3);
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (void)setStoreURL:(id)a3
{
  objc_storeStrong((id *)&self->_storeURL, a3);
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
  objc_storeStrong((id *)&self->_modelURL, a3);
}

- (NSDictionary)serverOptions
{
  return self->_serverOptions;
}

- (void)setServerOptions:(id)a3
{
  objc_storeStrong((id *)&self->_serverOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverOptions, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_xpcStoreServer, 0);
}

@end
