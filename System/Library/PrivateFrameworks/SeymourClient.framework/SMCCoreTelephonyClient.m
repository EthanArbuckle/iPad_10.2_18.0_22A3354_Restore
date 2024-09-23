@implementation SMCCoreTelephonyClient

- (void)roaming:(char *)a3 error:(id *)a4
{
  void *v5;
  char v6;
  id v7;

  -[CoreTelephonyClient getDataStatus:error:](self->_ctClient, "getDataStatus:error:", 0, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    v6 = objc_msgSend(v5, "inHomeCountry") ^ 1;
    v5 = v7;
    *a3 = v6;
  }

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SMCCoreTelephonyClient)initWithQueue:(id)a3
{
  id v5;
  SMCCoreTelephonyClient *v6;
  SMCCoreTelephonyClient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SMCCoreTelephonyClient;
  v6 = -[SMCCoreTelephonyClient init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

- ($2825F4736939C4A6D3AD43837233062D)cellularDataEnabled:(char *)a3
{
  return ($2825F4736939C4A6D3AD43837233062D)_CTServerConnectionGetCellularDataIsEnabled();
}

- (void)activate
{
  CoreTelephonyClient *v3;
  CoreTelephonyClient *ctClient;
  CoreTelephonyClient *v5;
  CTXPCServiceSubscriptionContext *v6;
  id v7;
  CTXPCServiceSubscriptionContext *preferredDataSubscriptionContext;
  id v9;

  v3 = (CoreTelephonyClient *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", self->_queue);
  ctClient = self->_ctClient;
  self->_ctClient = v3;

  -[CoreTelephonyClient setDelegate:](self->_ctClient, "setDelegate:", self);
  self->_ctServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
  v5 = self->_ctClient;
  v9 = 0;
  -[CoreTelephonyClient getPreferredDataSubscriptionContextSync:](v5, "getPreferredDataSubscriptionContextSync:", &v9);
  v6 = (CTXPCServiceSubscriptionContext *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  preferredDataSubscriptionContext = self->_preferredDataSubscriptionContext;
  self->_preferredDataSubscriptionContext = v6;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_preferredDataSubscriptionContext, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_updatePreferredDataSubscriptionContext
{
  CoreTelephonyClient *ctClient;
  CTXPCServiceSubscriptionContext *v4;
  id v5;
  CTXPCServiceSubscriptionContext *preferredDataSubscriptionContext;
  id v7;

  ctClient = self->_ctClient;
  v7 = 0;
  -[CoreTelephonyClient getPreferredDataSubscriptionContextSync:](ctClient, "getPreferredDataSubscriptionContextSync:", &v7);
  v4 = (CTXPCServiceSubscriptionContext *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  preferredDataSubscriptionContext = self->_preferredDataSubscriptionContext;
  self->_preferredDataSubscriptionContext = v4;

}

- (BOOL)_getRoamingFromDataStatus:(id)a3
{
  return objc_msgSend(a3, "inHomeCountry") ^ 1;
}

- (void)dataSettingsChanged:(id)a3
{
  SMCCoreTelephonyClientDelegate **p_delegate;
  id v4;
  uint64_t v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v5 = objc_msgSend(v4, "isCellularDataEnabled");

  objc_msgSend(WeakRetained, "cellularDataStateChangedWithCellularDataEnabled:", v5);
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  _BOOL8 v6;
  id WeakRetained;
  id v8;

  v8 = a4;
  if (-[CTXPCServiceSubscriptionContext isEqual:](self->_preferredDataSubscriptionContext, "isEqual:", a3))
  {
    v6 = -[SMCCoreTelephonyClient _getRoamingFromDataStatus:](self, "_getRoamingFromDataStatus:", v8);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "cellularDataStateChangedWithRoaming:", v6);

  }
}

- (void)internetDataStatus:(id)a3
{
  _BOOL8 v4;
  id WeakRetained;

  v4 = -[SMCCoreTelephonyClient _getRoamingFromDataStatus:](self, "_getRoamingFromDataStatus:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "cellularDataStateChangedWithRoaming:", v4);

}

- (void)servingNetworkChanged:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "cellularDataStateChanged");

}

- (SMCCoreTelephonyClientDelegate)delegate
{
  return (SMCCoreTelephonyClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)cellularDataEnabled
{
  return self->_cellularDataEnabled;
}

- (void)setCellularDataEnabled:(BOOL)a3
{
  self->_cellularDataEnabled = a3;
}

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (__CTServerConnection)ctServerConnection
{
  return self->_ctServerConnection;
}

- (CTXPCServiceSubscriptionContext)preferredDataSubscriptionContext
{
  return self->_preferredDataSubscriptionContext;
}

- (void)setPreferredDataSubscriptionContext:(id)a3
{
  objc_storeStrong((id *)&self->_preferredDataSubscriptionContext, a3);
}

- (BOOL)roaming
{
  return self->_roaming;
}

- (void)setRoaming:(BOOL)a3
{
  self->_roaming = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

@end
