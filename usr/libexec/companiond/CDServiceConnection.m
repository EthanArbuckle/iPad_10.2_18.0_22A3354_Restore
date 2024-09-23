@implementation CDServiceConnection

- (CDServiceConnection)initWithConnection:(id)a3
{
  id v5;
  CDServiceConnection *v6;
  CDServiceConnection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDServiceConnection;
  v6 = -[CDServiceConnection init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  CDServiceConnection *v10;

  v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000E9A4;
  v8[3] = &unk_1000307C8;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v9 = v5;
  v10 = self;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v8);

  v6 = v5;
  return v6;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CDServiceConnection descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return v4;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CDServiceConnection succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "build"));

  return v3;
}

- (void)startAuthenticationSessionWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  void ***v14;
  uint64_t v15;
  void *v16;
  char isKindOfClass;
  uint64_t v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  char v26;
  uint64_t v27;
  void *v28;
  char v29;
  uint64_t v30;
  void *v31;
  char v32;
  uint64_t v33;
  void *v34;
  char v35;
  uint64_t v36;
  void *v37;
  char v38;
  uint64_t v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  void **v45;
  uint64_t v46;
  void (*v47)(uint64_t, void *);
  void *v48;
  id v49;
  os_activity_scope_state_s state;
  NSErrorUserInfoKey v51;
  void *v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;

  v6 = a3;
  v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v8 = _os_activity_create((void *)&_mh_execute_header, "start authentication session", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CDServiceClient currentClient](CDServiceClient, "currentClient"));
  v10 = cps_service_log();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
    *(_DWORD *)buf = 138412546;
    v54 = v12;
    v55 = 2112;
    v56 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received start authentication session request. client=%@, request=%@", buf, 0x16u);

  }
  v45 = _NSConcreteStackBlock;
  v46 = 3221225472;
  v47 = sub_10000F498;
  v48 = &unk_100030D08;
  v13 = v7;
  v49 = v13;
  v14 = objc_retainBlock(&v45);
  v15 = objc_opt_self(CPSStorePurchaseRequest);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  isKindOfClass = objc_opt_isKindOfClass(v6, v16);

  if ((isKindOfClass & 1) != 0)
  {
    sub_10000EA54((uint64_t)self, v9, v6, v14);
  }
  else
  {
    v18 = objc_opt_self(CPSAppSignInRequest);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = objc_opt_isKindOfClass(v6, v19);

    if ((v20 & 1) != 0)
    {
      sub_10000EB1C((uint64_t)self, v9, v6, v14);
    }
    else
    {
      v21 = objc_opt_self(CPSSystemAuthenticationRequest);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = objc_opt_isKindOfClass(v6, v22);

      if ((v23 & 1) != 0)
      {
        sub_10000EC28((uint64_t)self, v9, v6, v14);
      }
      else
      {
        v24 = objc_opt_self(CPSSharingRequest);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        v26 = objc_opt_isKindOfClass(v6, v25);

        if ((v26 & 1) != 0)
          goto LABEL_17;
        v27 = objc_opt_self(CPSRestrictedAccessRequest);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        v29 = objc_opt_isKindOfClass(v6, v28);

        if ((v29 & 1) != 0)
        {
          sub_10000ED80((uint64_t)self, v9, v6, v14);
          goto LABEL_21;
        }
        v30 = objc_opt_self(CPSStoreAuthenticationRequest);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        v32 = objc_opt_isKindOfClass(v6, v31);

        if ((v32 & 1) != 0)
        {
          sub_10000EE48((uint64_t)self, v9, v6, v14);
          goto LABEL_21;
        }
        v33 = objc_opt_self(CPSTVProviderRequest);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        v35 = objc_opt_isKindOfClass(v6, v34);

        if ((v35 & 1) != 0
          || (v36 = objc_opt_self(CPSLearnMoreRequest),
              v37 = (void *)objc_claimAutoreleasedReturnValue(v36),
              v38 = objc_opt_isKindOfClass(v6, v37),
              v37,
              (v38 & 1) != 0))
        {
LABEL_17:
          sub_10000ECF0((uint64_t)self, v9, v6, v14);
          goto LABEL_21;
        }
        v39 = objc_opt_self(CPSDedicatedCameraRequest);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        v41 = objc_opt_isKindOfClass(v6, v40);

        if ((v41 & 1) != 0)
        {
          sub_10000EF10((uint64_t)self, v9, v6, v14);
        }
        else
        {
          v51 = NSDebugDescriptionErrorKey;
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid authentication request: %@"), v6, v45, v46, v47, v48));
          v52 = v42;
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CPSErrorDomain, 101, v43));
          ((void (*)(void ***, void *))v14[2])(v14, v44);

        }
      }
    }
  }
LABEL_21:

  os_activity_scope_leave(&state);
}

- (void)fetchDaemonStatusWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, id);
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id WeakRetained;
  os_activity_scope_state_s v11;
  uint8_t buf[4];
  void *v13;

  v4 = (void (**)(id, _QWORD, id))a3;
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  v5 = _os_activity_create((void *)&_mh_execute_header, "fetch daemon status", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v11);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CDServiceClient currentClient](CDServiceClient, "currentClient", v11.opaque[0], v11.opaque[1]));
  v7 = cps_service_log();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
    *(_DWORD *)buf = 138412290;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received fetch daemon status request. client=%@", buf, 0xCu);

  }
  if ((objc_msgSend(v6, "hasDaemonStatusEntitlement") & 1) != 0)
  {
    if ((_BSIsInternalInstall("-[CDServiceConnection fetchDaemonStatusWithCompletionHandler:]") & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "serviceConnection:fetchDaemonStatusWithCompletionHandler:", self, v4);
    }
    else
    {
      WeakRetained = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CPSErrorDomain, 101, 0));
      v4[2](v4, 0, WeakRetained);
    }
  }
  else
  {
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CPSErrorDomain, 103, 0));
    v4[2](v4, 0, WeakRetained);
  }

  os_activity_scope_leave(&v11);
}

- (void)performAMSDelegatePurchaseWithRequest:(id)a3 isSandboxPurchase:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v7;
  void (**v8)(id, _QWORD, void *);
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  os_activity_scope_state_s v40;
  uint8_t buf[4];
  void *v42;

  v6 = a4;
  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a5;
  v40.opaque[0] = 0;
  v40.opaque[1] = 0;
  v9 = _os_activity_create((void *)&_mh_execute_header, "perform AMS delegate purchase", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v9, &v40);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CDServiceClient currentClient](CDServiceClient, "currentClient", v40.opaque[0], v40.opaque[1]));
  v11 = cps_service_log();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
    *(_DWORD *)buf = 138412290;
    v42 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received perform AMS delegate purchase. client=%@", buf, 0xCu);

  }
  if ((objc_msgSend(v10, "hasAMSDelegatePurchaseEntitlement") & 1) != 0)
  {
    if ((_BSIsInternalInstall("-[CDServiceConnection performAMSDelegatePurchaseWithRequest:isSandboxPurchase:completionHandler:]") & 1) != 0)
    {
      v14 = &AMSAccountMediaTypeProduction;
      if (v6)
        v14 = &AMSAccountMediaTypeAppStoreSandbox;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStoreForMediaType:](ACAccountStore, "ams_sharedAccountStoreForMediaType:", *v14));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ams_activeiTunesAccount"));

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDelegatePurchaseTask bagSubProfile](AMSDelegatePurchaseTask, "bagSubProfile"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDelegatePurchaseTask bagSubProfileVersion](AMSDelegatePurchaseTask, "bagSubProfileVersion"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v17, v18));

      v20 = objc_msgSend(objc_alloc((Class)AMSDelegatePurchaseTask), "initWithDelegatePurchaseRequest:bag:account:", v7, v19, v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "performDelegatePurchase"));
      objc_msgSend(v21, "addFinishBlock:", v8);

    }
    else
    {
      v31 = cps_service_log();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_10001E93C(v32, v33, v34, v35, v36, v37, v38, v39);

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CPSErrorDomain, 101, 0));
      v8[2](v8, 0, v16);
    }
  }
  else
  {
    v22 = cps_service_log();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_10001E970(v23, v24, v25, v26, v27, v28, v29, v30);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CPSErrorDomain, 103, 0));
    v8[2](v8, 0, v16);
  }

  os_activity_scope_leave(&v40);
}

- (void)authenticationSessionDeviceTappedNotification:(id)a3
{
  id v4;
  CDServiceClient *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  os_activity_scope_state_s v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;

  v4 = a3;
  v5 = -[CDServiceClient initWithConnection:]([CDServiceClient alloc], "initWithConnection:", self->_connection);
  if (-[CDServiceClient shouldReceiveDeviceEvents](v5, "shouldReceiveDeviceEvents"))
  {
    v13.opaque[0] = 0;
    v13.opaque[1] = 0;
    v6 = _os_activity_create((void *)&_mh_execute_header, "send device accepted notification event", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v6, &v13);

    v9 = cps_service_log(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDServiceClient bundleIdentifier](v5, "bundleIdentifier", v13.opaque[0], v13.opaque[1]));
      *(_DWORD *)buf = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending device accepted notification event to client. client=%@, device=%@", buf, 0x16u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &stru_100030D28));
    objc_msgSend(v12, "authenticationSessionDeviceTappedNotification:", v4);

    os_activity_scope_leave(&v13);
  }

}

- (void)authenticationSessionDeviceStartedAuthentication:(id)a3
{
  id v4;
  CDServiceClient *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  os_activity_scope_state_s v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;

  v4 = a3;
  v5 = -[CDServiceClient initWithConnection:]([CDServiceClient alloc], "initWithConnection:", self->_connection);
  if (-[CDServiceClient shouldReceiveDeviceEvents](v5, "shouldReceiveDeviceEvents"))
  {
    v13.opaque[0] = 0;
    v13.opaque[1] = 0;
    v6 = _os_activity_create((void *)&_mh_execute_header, "send device started authentication event", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v6, &v13);

    v9 = cps_service_log(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDServiceClient bundleIdentifier](v5, "bundleIdentifier", v13.opaque[0], v13.opaque[1]));
      *(_DWORD *)buf = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending device accepted notification event to client. client=%@, device=%@", buf, 0x16u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &stru_100030D48));
    objc_msgSend(v12, "authenticationSessionDeviceStartedAuthentication:", v4);

    os_activity_scope_leave(&v13);
  }

}

- (void)authenticationSessionDidFinishWithResponse:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy"));
  objc_msgSend(v5, "authenticationSessionDidFinishWithResponse:", v4);

}

- (void)authenticationSessionDidFailWithError:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy"));
  objc_msgSend(v5, "authenticationSessionDidFailWithError:", v4);

}

- (CDServiceConnectionDelegate)delegate
{
  return (CDServiceConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
