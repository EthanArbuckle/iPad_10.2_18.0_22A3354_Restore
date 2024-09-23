@implementation PKPaymentWebServiceProxyTargetDeviceDebugHelper

+ (id)webServiceWithProxiedTargetDevice:(id)a3
{
  id v3;
  PKPaymentWebServiceProxyTargetDeviceDebugHelper *v4;
  void *v5;
  PKPaymentWebService *v6;
  void *v7;
  void *v8;
  PKPaymentService *v9;
  PKPaymentWebService *v10;

  v3 = a3;
  v4 = -[PKPaymentWebServiceProxyTargetDeviceDebugHelper initWithWebService:]([PKPaymentWebServiceProxyTargetDeviceDebugHelper alloc], "initWithWebService:", v3);
  -[PKPaymentWebServiceProxyTargetDeviceDebugHelper localProxyTargetDevice](v4, "localProxyTargetDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [PKPaymentWebService alloc];
  objc_msgSend(v5, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(v3, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_alloc_init(PKPaymentService);
  v10 = -[PKPaymentWebService initWithContext:targetDevice:archiver:tapToRadarDelegate:](v6, "initWithContext:targetDevice:archiver:tapToRadarDelegate:", v8, v5, v5, v9);

  if (!v7)
  objc_setAssociatedObject(v10, &PKPaymentWebServiceProxyTargetDeviceDebugHelperKey, v4, (void *)0x301);

  return v10;
}

- (PKPaymentWebServiceProxyTargetDeviceDebugHelper)initWithWebService:(id)a3
{
  id v5;
  PKPaymentWebServiceProxyTargetDeviceDebugHelper *v6;
  PKPaymentWebServiceProxyTargetDeviceDebugHelper *v7;
  NSMutableArray *v8;
  NSMutableArray *remoteTargets;
  uint64_t v10;
  NSXPCListener *remoteListener;
  id v12;
  void *v13;
  void *v14;
  PKPaymentWebServiceLocalProxyTargetDevice *v15;
  PKPaymentWebServiceLocalProxyTargetDevice *localTarget;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentWebServiceProxyTargetDeviceDebugHelper;
  v6 = -[PKPaymentWebServiceProxyTargetDeviceDebugHelper init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webService, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    remoteTargets = v7->_remoteTargets;
    v7->_remoteTargets = v8;

    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v10 = objc_claimAutoreleasedReturnValue();
    remoteListener = v7->_remoteListener;
    v7->_remoteListener = (NSXPCListener *)v10;

    -[NSXPCListener setDelegate:](v7->_remoteListener, "setDelegate:", v7);
    -[NSXPCListener resume](v7->_remoteListener, "resume");
    v12 = objc_alloc(MEMORY[0x1E0CB3B38]);
    -[NSXPCListener endpoint](v7->_remoteListener, "endpoint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithListenerEndpoint:", v13);

    v15 = -[PKPaymentWebServiceLocalProxyTargetDevice initWithConnection:]([PKPaymentWebServiceLocalProxyTargetDevice alloc], "initWithConnection:", v14);
    localTarget = v7->_localTarget;
    v7->_localTarget = v15;

  }
  return v7;
}

- (id)localProxyTargetDevice
{
  return self->_localTarget;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentWebServiceProxyTargetDeviceDebugHelper dealloc'd.", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentWebServiceProxyTargetDeviceDebugHelper;
  -[PKPaymentWebServiceProxyTargetDeviceDebugHelper dealloc](&v4, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  PKPaymentWebServiceRemoteProxyTargetDevice *v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = -[PKPaymentWebServiceRemoteProxyTargetDevice initWithWebService:connection:]([PKPaymentWebServiceRemoteProxyTargetDevice alloc], "initWithWebService:connection:", self->_webService, v5);
  PKLogFacilityTypeGetObject(4uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_INFO, "PKPaymentWebServiceRemoteProxyTargetDevice connection added %@.", (uint8_t *)&v9, 0xCu);
  }

  -[NSMutableArray addObject:](self->_remoteTargets, "addObject:", v6);
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteTargets, 0);
  objc_storeStrong((id *)&self->_localTarget, 0);
  objc_storeStrong((id *)&self->_remoteListener, 0);
  objc_storeStrong((id *)&self->_webService, 0);
}

@end
