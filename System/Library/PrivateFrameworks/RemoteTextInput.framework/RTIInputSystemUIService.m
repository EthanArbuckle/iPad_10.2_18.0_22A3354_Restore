@implementation RTIInputSystemUIService

void __69__RTIInputSystemUIService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1)
{
  id v2;

  +[RTIInputSystemServiceUISession sessionWithConnection:remoteProcess:](RTIInputSystemServiceUISession, "sessionWithConnection:remoteProcess:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "inputSession:didReceiveConnection:", v2, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "activate");

}

- (BOOL)_canResumeConnection
{
  return 0;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  RTIInputSystemUIService *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  RTILogFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[RTIInputSystemUIService listener:didReceiveConnection:withContext:]";
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1991A8000, v7, OS_LOG_TYPE_DEFAULT, "%s  didReceiveConnection: %@", buf, 0x16u);
  }

  objc_msgSend(v6, "remoteProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extractNSXPCConnectionWithConfigurator:", &__block_literal_global_5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTIInputSystemService dispatchQueue](self, "dispatchQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__RTIInputSystemUIService_listener_didReceiveConnection_withContext___block_invoke_2;
  block[3] = &unk_1E35C2750;
  v14 = v9;
  v15 = v8;
  v16 = self;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, block);

}

+ (id)sharedServiceWithDomainName:(id)a3 serviceName:(id)a4
{
  id v5;
  id v6;
  RTIInputSystemUIService *v7;

  v5 = a3;
  v6 = a4;
  if (sharedServiceWithDomainName_serviceName__onceToken != -1)
    dispatch_once(&sharedServiceWithDomainName_serviceName__onceToken, &__block_literal_global_5);
  objc_msgSend((id)sharedServiceWithDomainName_serviceName___services, "objectForKey:", v6);
  v7 = (RTIInputSystemUIService *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[RTIInputSystemUIService initWithDomainName:serviceName:]([RTIInputSystemUIService alloc], "initWithDomainName:serviceName:", v5, v6);
    objc_msgSend((id)sharedServiceWithDomainName_serviceName___services, "setObject:forKey:", v7, v6);
  }

  return v7;
}

void __67__RTIInputSystemUIService_sharedServiceWithDomainName_serviceName___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  v1 = (void *)sharedServiceWithDomainName_serviceName___services;
  sharedServiceWithDomainName_serviceName___services = v0;

}

- (RTIInputSystemUIService)initWithDomainName:(id)a3 serviceName:(id)a4
{
  id v6;
  id v7;
  RTIInputSystemUIService *v8;
  uint64_t v9;
  NSString *domainName;
  uint64_t v11;
  NSString *serviceName;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RTIInputSystemUIService;
  v8 = -[RTIInputSystemService initWithMachName:](&v14, sel_initWithMachName_, 0);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    domainName = v8->_domainName;
    v8->_domainName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    serviceName = v8->_serviceName;
    v8->_serviceName = (NSString *)v11;

    -[RTIInputSystemUIService _createListenerIfNecessary](v8, "_createListenerIfNecessary");
  }

  return v8;
}

- (void)_createListenerIfNecessary
{
  BSServiceConnectionListener *v3;
  BSServiceConnectionListener *bsConnectionListener;
  _QWORD v5[5];

  if (!self->_bsConnectionListener && self->_domainName)
  {
    if (self->_serviceName)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __53__RTIInputSystemUIService__createListenerIfNecessary__block_invoke;
      v5[3] = &unk_1E35C2EA0;
      v5[4] = self;
      objc_msgSend(MEMORY[0x1E0D03460], "listenerWithConfigurator:", v5);
      v3 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue();
      bsConnectionListener = self->_bsConnectionListener;
      self->_bsConnectionListener = v3;

      -[BSServiceConnectionListener activate](self->_bsConnectionListener, "activate");
    }
  }
}

void __53__RTIInputSystemUIService__createListenerIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  v4 = a2;
  objc_msgSend(v4, "setDomain:", v3);
  objc_msgSend(v4, "setService:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));

}

- (void)_destroyListenerIfNecessary
{
  BSServiceConnectionListener *bsConnectionListener;
  BSServiceConnectionListener *v4;

  bsConnectionListener = self->_bsConnectionListener;
  if (bsConnectionListener)
  {
    -[BSServiceConnectionListener invalidate](bsConnectionListener, "invalidate");
    v4 = self->_bsConnectionListener;
    self->_bsConnectionListener = 0;

  }
}

- (id)listenerEndpoint
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_bsConnectionListener, 0);
}

@end
