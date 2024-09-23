@implementation MSDRapportDeviceAdvertiser

- (MSDRapportDeviceAdvertiser)initWithObserver:(id)a3
{
  id v4;
  MSDRapportDeviceAdvertiser *v5;
  dispatch_queue_t v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSDRapportDeviceAdvertiser;
  v5 = -[MSDRapportDeviceAdvertiser init](&v8, "init");
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.MobileStoreDemo.RPDeviceAdvertiser", 0);
    -[MSDRapportDeviceAdvertiser setQueue:](v5, "setQueue:", v6);

    -[MSDRapportDeviceAdvertiser setObserver:](v5, "setObserver:", v4);
  }

  return v5;
}

- (void)activate
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005F698;
  v4[3] = &unk_10013D840;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)deactivate
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005F778;
  v4[3] = &unk_10013D840;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_activate
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id buf[2];

  v3 = objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MSDRapportDeviceAdvertiser: Activating advertiser!", (uint8_t *)buf, 2u);
  }

  CFPrefs_SetValue(CFSTR("com.apple.Sharing"), CFSTR("nearbyInfoAdvertiseAlways"), kCFBooleanTrue);
  CFPreferencesAppSynchronize(CFSTR("com.apple.Sharing"));
  objc_initWeak(buf, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpClient](self, "rpClient"));

  if (!v6)
  {
    v7 = objc_alloc_init((Class)RPCompanionLinkClient);
    -[MSDRapportDeviceAdvertiser setRpClient:](self, "setRpClient:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser queue](self, "queue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpClient](self, "rpClient"));
    objc_msgSend(v9, "setDispatchQueue:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpClient](self, "rpClient"));
    objc_msgSend(v10, "setInterruptionHandler:", &stru_10013ECB0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpClient](self, "rpClient"));
    objc_msgSend(v11, "setInvalidationHandler:", &stru_10013ECD0);

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10005FCD4;
    v34[3] = &unk_10013E888;
    objc_copyWeak(&v35, buf);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpClient](self, "rpClient"));
    objc_msgSend(v12, "setLocalDeviceUpdatedHandler:", v34);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpClient](self, "rpClient"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10005FD00;
    v32[3] = &unk_10013DD68;
    objc_copyWeak(&v33, buf);
    objc_msgSend(v13, "activateWithCompletion:", v32);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpServer](self, "rpServer"));

  if (!v14)
  {
    v15 = objc_alloc_init((Class)RPServer);
    -[MSDRapportDeviceAdvertiser setRpServer:](self, "setRpServer:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser queue](self, "queue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpServer](self, "rpServer"));
    objc_msgSend(v17, "setDispatchQueue:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpServer](self, "rpServer"));
    objc_msgSend(v18, "setControlFlags:", 66566);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpServer](self, "rpServer"));
    objc_msgSend(v19, "setPasswordType:", 2);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpServer](self, "rpServer"));
    objc_msgSend(v20, "setPairSetupFlags:", 0x8000000);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpServer](self, "rpServer"));
    objc_msgSend(v21, "setServiceType:", CFSTR("com.apple.MobileStoreDemo"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpServer](self, "rpServer"));
    objc_msgSend(v22, "setErrorHandler:", &stru_10013ECF0);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpServer](self, "rpServer"));
    objc_msgSend(v23, "setInterruptionHandler:", &stru_10013ED10);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpServer](self, "rpServer"));
    objc_msgSend(v24, "setInvalidationHandler:", &stru_10013ED30);

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10005FE18;
    v30[3] = &unk_10013ED58;
    objc_copyWeak(&v31, buf);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpServer](self, "rpServer"));
    objc_msgSend(v25, "setShowPasswordHandler:", v30);

    objc_copyWeak(&v29, buf);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpServer](self, "rpServer", _NSConcreteStackBlock, 3221225472, sub_10005FE70, &unk_10013ED80));
    objc_msgSend(v26, "setHidePasswordHandler:", &v28);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpServer](self, "rpServer"));
    objc_msgSend(v27, "activate");

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
  }
  objc_destroyWeak(buf);
}

- (void)_deactivate
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v3 = objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MSDRapportDeviceAdvertiser: Deactivating advertiser!", v10, 2u);
  }

  CFPrefs_RemoveValue(CFSTR("com.apple.Sharing"), CFSTR("nearbyInfoAdvertiseAlways"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.Sharing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpClient](self, "rpClient"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpClient](self, "rpClient"));
    objc_msgSend(v7, "invalidate");

    -[MSDRapportDeviceAdvertiser setRpClient:](self, "setRpClient:", 0);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpServer](self, "rpServer"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpServer](self, "rpServer"));
    objc_msgSend(v9, "invalidate");

    -[MSDRapportDeviceAdvertiser setRpServer:](self, "setRpServer:", 0);
  }
}

- (void)_handleLocalDeviceUpdated
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpLocalDevice](self, "rpLocalDevice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpClient](self, "rpClient"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localDevice"));

  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = v3;
    v14 = 2114;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MSDRapportDeviceAdvertiser: Local device updated from: <%{public}@> to: <%{public}@>", (uint8_t *)&v12, 0x16u);
  }

  -[MSDRapportDeviceAdvertiser setRpLocalDevice:](self, "setRpLocalDevice:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser observer](self, "observer"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser observer](self, "observer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "publicIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "publicIdentifier"));
    objc_msgSend(v9, "advertiserDidUpdateLocalDevicePublicIDFrom:to:", v10, v11);

  }
}

- (void)_handleRPCompanionClientActivateCompletionWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000C137C(v4);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpClient](self, "rpClient"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localDevice"));
    -[MSDRapportDeviceAdvertiser setRpLocalDevice:](self, "setRpLocalDevice:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser observer](self, "observer"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser observer](self, "observer"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser rpLocalDevice](self, "rpLocalDevice"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "publicIdentifier"));
      objc_msgSend(v11, "advertiserDidUpdateLocalDevicePublicIDFrom:to:", 0, v13);

    }
  }

}

- (void)_handleShowPassword:(id)a3 withFlags:(unsigned int)a4
{
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  unsigned int v15;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v6;
    v14 = 1024;
    v15 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MSDRapportDeviceAdvertiser: Show password: %@ with flags: %u", (uint8_t *)&v12, 0x12u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser observer](self, "observer"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser observer](self, "observer"));
    objc_msgSend(v11, "advertiserDidShowPairingPassword:", v6);

  }
}

- (void)_handleHidePasswordWithFlags:(unsigned int)a3
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _DWORD v10[2];

  v5 = objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MSDRapportDeviceAdvertiser: Hide password with flags: %u", (uint8_t *)v10, 8u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser observer](self, "observer"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceAdvertiser observer](self, "observer"));
    objc_msgSend(v9, "advertiserDidHidePairingPassword");

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (RPCompanionLinkClient)rpClient
{
  return self->_rpClient;
}

- (void)setRpClient:(id)a3
{
  objc_storeStrong((id *)&self->_rpClient, a3);
}

- (RPCompanionLinkDevice)rpLocalDevice
{
  return self->_rpLocalDevice;
}

- (void)setRpLocalDevice:(id)a3
{
  objc_storeStrong((id *)&self->_rpLocalDevice, a3);
}

- (RPServer)rpServer
{
  return self->_rpServer;
}

- (void)setRpServer:(id)a3
{
  objc_storeStrong((id *)&self->_rpServer, a3);
}

- (MSDRapportDeviceAdvertiserProtocol)observer
{
  return (MSDRapportDeviceAdvertiserProtocol *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_rpServer, 0);
  objc_storeStrong((id *)&self->_rpLocalDevice, 0);
  objc_storeStrong((id *)&self->_rpClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
