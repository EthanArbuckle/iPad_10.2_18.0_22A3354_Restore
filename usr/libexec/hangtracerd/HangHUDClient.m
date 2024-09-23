@implementation HangHUDClient

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001303C;
  block[3] = &unk_10004D420;
  block[4] = a1;
  if (qword_10005FC70 != -1)
    dispatch_once(&qword_10005FC70, block);
  return (id)qword_10005FC68;
}

- (HangHUDClient)initWithIdentifier:(id)a3
{
  id v4;
  HangHUDClient *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BSServiceConnectionEndpoint *endpoint;
  BSServiceConnectionEndpoint *v10;
  uint64_t v11;
  BSServiceConnectionClient *connection;
  BSServiceConnectionClient *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  HangHUDClient *v20;
  _QWORD v21[4];
  NSObject *v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HangHUDClient;
  v5 = -[HangHUDClient init](&v23, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[HangHUDServiceSpecification machName](HangHUDServiceSpecification, "machName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[HangHUDServiceSpecification identifier](HangHUDServiceSpecification, "identifier"));
    v8 = objc_claimAutoreleasedReturnValue(+[BSServiceConnectionEndpoint endpointForMachName:service:instance:](BSServiceConnectionEndpoint, "endpointForMachName:service:instance:", v6, v7, 0));
    endpoint = v5->_endpoint;
    v5->_endpoint = (BSServiceConnectionEndpoint *)v8;

    v10 = v5->_endpoint;
    if (v10)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100013304;
      v21[3] = &unk_10004D448;
      v22 = v4;
      v11 = objc_claimAutoreleasedReturnValue(+[BSServiceConnection connectionWithEndpoint:clientContextBuilder:](BSServiceConnection, "connectionWithEndpoint:clientContextBuilder:", v10, v21));
      connection = v5->_connection;
      v5->_connection = (BSServiceConnectionClient *)v11;

      v13 = v5->_connection;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100013368;
      v19[3] = &unk_10004D498;
      v20 = v5;
      -[BSServiceConnectionClient configureConnection:](v13, "configureConnection:", v19);

      v14 = v22;
    }
    else
    {
      v15 = sub_100024FF4();
      v14 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[HangHUDServiceSpecification machName](HangHUDServiceSpecification, "machName"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[HangHUDServiceSpecification identifier](HangHUDServiceSpecification, "identifier"));
        *(_DWORD *)buf = 138412546;
        v25 = v16;
        v26 = 2112;
        v27 = v17;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "failed to lookup endpoint with machName=%@ service=%@", buf, 0x16u);

      }
    }

  }
  return v5;
}

- (void)invalidate
{
  -[BSServiceConnectionClient invalidate](self->_connection, "invalidate");
}

- (id)obtainKeepHangHUDAliveAssertion:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;

  v3 = a3;
  v4 = objc_alloc((Class)RBSAssertion);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentity identityForAngelJobLabel:](RBSProcessIdentity, "identityForAngelJobLabel:", CFSTR("com.apple.HangHUD")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithProcessIdentity:](RBSTarget, "targetWithProcessIdentity:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC")));
  v11 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v9 = objc_msgSend(v4, "initWithExplanation:target:attributes:", v3, v6, v8);

  return v9;
}

- (void)sendHangHUDInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BSServiceConnectionClient *connection;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  int v23;
  const __CFString *v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  v8 = sub_100024FF4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10002E2BC(v9, v10, v11, v12, v13, v14, v15, v16);

  -[BSServiceConnectionClient activate](self->_connection, "activate");
  connection = self->_connection;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC")));
  v25 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](connection, "remoteTargetWithLaunchingAssertionAttributes:", v19));

  if (v20)
  {
    objc_msgSend(v20, "receiveHangHUDInfo:completion:", v6, v7);
  }
  else
  {
    v21 = sub_100024FF4();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412290;
      v24 = CFSTR("launchingTarget is nil. connection is not active or remote interface is empty.");
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v23, 0xCu);
    }

  }
}

- (void)sendProcExitRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BSServiceConnectionClient *connection;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  int v23;
  const __CFString *v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  v8 = sub_100024FF4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10002E32C(v9, v10, v11, v12, v13, v14, v15, v16);

  -[BSServiceConnectionClient activate](self->_connection, "activate");
  connection = self->_connection;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC")));
  v25 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](connection, "remoteTargetWithLaunchingAssertionAttributes:", v19));

  if (v20)
  {
    objc_msgSend(v20, "receiveProcExitRecord:completion:", v6, v7);
  }
  else
  {
    v21 = sub_100024FF4();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412290;
      v24 = CFSTR("launchingTarget is nil. connection is not active or remote interface is empty.");
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v23, 0xCu);
    }

  }
}

- (void)sendHudConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BSServiceConnectionClient *connection;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  int v23;
  const __CFString *v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  v8 = sub_100024FF4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10002E39C(v9, v10, v11, v12, v13, v14, v15, v16);

  -[BSServiceConnectionClient activate](self->_connection, "activate");
  connection = self->_connection;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC")));
  v25 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](connection, "remoteTargetWithLaunchingAssertionAttributes:", v19));

  if (v20)
  {
    objc_msgSend(v20, "receiveHudConfiguration:completion:", v6, v7);
  }
  else
  {
    v21 = sub_100024FF4();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412290;
      v24 = CFSTR("launchingTarget is nil. connection is not active or remote interface is empty.");
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v23, 0xCu);
    }

  }
}

- (void)sendMonitoredStates:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BSServiceConnectionClient *connection;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  int v23;
  const __CFString *v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  v8 = sub_100024FF4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10002E40C(v9, v10, v11, v12, v13, v14, v15, v16);

  -[BSServiceConnectionClient activate](self->_connection, "activate");
  connection = self->_connection;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC")));
  v25 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](connection, "remoteTargetWithLaunchingAssertionAttributes:", v19));

  if (v20)
  {
    objc_msgSend(v20, "receiveMonitoredStates:completion:", v6, v7);
  }
  else
  {
    v21 = sub_100024FF4();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412290;
      v24 = CFSTR("launchingTarget is nil. connection is not active or remote interface is empty.");
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v23, 0xCu);
    }

  }
}

- (void)clearHUDWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BSServiceConnectionClient *connection;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  int v20;
  const __CFString *v21;
  void *v22;

  v4 = a3;
  v5 = sub_100024FF4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10002E47C(v6, v7, v8, v9, v10, v11, v12, v13);

  -[BSServiceConnectionClient activate](self->_connection, "activate");
  connection = self->_connection;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC")));
  v22 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](connection, "remoteTargetWithLaunchingAssertionAttributes:", v16));

  if (v17)
  {
    objc_msgSend(v17, "clearHUDWithCompletion:", v4);
  }
  else
  {
    v18 = sub_100024FF4();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = CFSTR("launchingTarget is nil. connection is not active or remote interface is empty.");
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v20, 0xCu);
    }

  }
}

- (HangHUDClientDelegate)delegate
{
  return (HangHUDClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
