@implementation GKRerankNetworkRequester

- (GKRerankNetworkRequester)initWithClientProxy:(id)a3 networkManager:(id)a4 transactionGroupProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  GKRerankNetworkRequester *v12;
  GKRerankNetworkRequester *v13;
  id v14;
  id transactionGroupProvider;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)GKRerankNetworkRequester;
  v12 = -[GKRerankNetworkRequester init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_networkManager, a4);
    objc_storeStrong((id *)&v13->_clientProxy, a3);
    v14 = objc_retainBlock(v11);
    transactionGroupProvider = v13->_transactionGroupProvider;
    v13->_transactionGroupProvider = v14;

  }
  return v13;
}

- (void)requestSortedContactAssociationIDs:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id location;
  const __CFString *v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKContacts;
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    sub_100159A9C((uint64_t)v6, v10, v11);
  v22 = CFSTR("contact-association-ids");
  v23 = v6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  objc_initWeak(&location, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKRerankNetworkRequester networkManager](self, "networkManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKRerankNetworkRequester clientProxy](self, "clientProxy"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100158D98;
  v17[3] = &unk_1002C5080;
  objc_copyWeak(&v20, &location);
  v15 = v8;
  v19 = v15;
  v16 = v6;
  v18 = v16;
  objc_msgSend(v13, "issueRequest:bagKey:clientProxy:handler:", v12, CFSTR("gk-get-suggested-friends"), v14, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (GKNetworkRequestManager)networkManager
{
  return self->_networkManager;
}

- (void)setNetworkManager:(id)a3
{
  objc_storeStrong((id *)&self->_networkManager, a3);
}

- (GKClientProxy)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
  objc_storeStrong((id *)&self->_clientProxy, a3);
}

- (id)transactionGroupProvider
{
  return self->_transactionGroupProvider;
}

- (void)setTransactionGroupProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (GKFriendSuggesterSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong(&self->_transactionGroupProvider, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_networkManager, 0);
}

@end
