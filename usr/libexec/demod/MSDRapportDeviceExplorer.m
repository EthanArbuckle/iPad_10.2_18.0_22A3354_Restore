@implementation MSDRapportDeviceExplorer

- (MSDRapportDeviceExplorer)initWithObserver:(id)a3
{
  id v4;
  MSDRapportDeviceExplorer *v5;
  dispatch_queue_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSDRapportDeviceExplorer;
  v5 = -[MSDRapportDeviceExplorer init](&v9, "init");
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.MobileStoreDemo.RPDeviceExplorer", 0);
    -[MSDRapportDeviceExplorer setQueue:](v5, "setQueue:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
    -[MSDRapportDeviceExplorer setDevices:](v5, "setDevices:", v7);

    -[MSDRapportDeviceExplorer setObserver:](v5, "setObserver:", v4);
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
  v3 = objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100043228;
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
  v3 = objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100043308;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id buf[2];

  v3 = objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MSDRapportDeviceExplorer: Activating explorer!", (uint8_t *)buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer rpClient](self, "rpClient"));
  if (!v6)
  {
    objc_initWeak(buf, self);
    v7 = objc_alloc_init((Class)RPCompanionLinkClient);
    -[MSDRapportDeviceExplorer setRpClient:](self, "setRpClient:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer queue](self, "queue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer rpClient](self, "rpClient"));
    objc_msgSend(v9, "setDispatchQueue:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer rpClient](self, "rpClient"));
    objc_msgSend(v10, "setControlFlags:", 74758);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer rpClient](self, "rpClient"));
    objc_msgSend(v11, "setFlags:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer rpClient](self, "rpClient"));
    objc_msgSend(v12, "setPasswordType:", 2);

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100043720;
    v29[3] = &unk_10013D840;
    objc_copyWeak(&v30, buf);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer rpClient](self, "rpClient"));
    objc_msgSend(v13, "setInterruptionHandler:", v29);

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100043778;
    v27[3] = &unk_10013D840;
    objc_copyWeak(&v28, buf);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer rpClient](self, "rpClient"));
    objc_msgSend(v14, "setInvalidationHandler:", v27);

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000437D0;
    v25[3] = &unk_10013E888;
    objc_copyWeak(&v26, buf);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer rpClient](self, "rpClient"));
    objc_msgSend(v15, "setDeviceFoundHandler:", v25);

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100043818;
    v23[3] = &unk_10013E888;
    objc_copyWeak(&v24, buf);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer rpClient](self, "rpClient"));
    objc_msgSend(v16, "setDeviceLostHandler:", v23);

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100043860;
    v21[3] = &unk_10013E8B0;
    objc_copyWeak(&v22, buf);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer rpClient](self, "rpClient"));
    objc_msgSend(v17, "setDeviceChangedHandler:", v21);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer rpClient](self, "rpClient"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000438B8;
    v19[3] = &unk_10013DD68;
    objc_copyWeak(&v20, buf);
    objc_msgSend(v18, "activateWithCompletion:", v19);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(buf);
  }
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
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[8];
  _BYTE v25[128];

  v3 = objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MSDRapportDeviceExplorer: Deactivating explorer!", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer rpClient](self, "rpClient"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer rpClient](self, "rpClient"));
    objc_msgSend(v7, "setInterruptionHandler:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer rpClient](self, "rpClient"));
    objc_msgSend(v8, "invalidate");

    -[MSDRapportDeviceExplorer setRpClient:](self, "setRpClient:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer devices](self, "devices"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer devices](self, "devices"));
    objc_msgSend(v11, "removeAllObjects");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer observer](self, "observer"));
    if (v12)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v13 = v10;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v21;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v21 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer observer](self, "observer", (_QWORD)v20));
            objc_msgSend(v19, "explorerDidLoseDevice:", v18);

            v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v15);
      }

    }
  }
}

- (id)_findMatchingMSDRapportDeviceForRPCompanionLinkDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer devices](self, "devices", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "isEqualToRPCompanionLinkDevice:", v4))
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_handleRPCompanionLinkDeviceFound:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  unsigned int v8;
  unint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  MSDRapportDevice *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t v20[16];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1000BE62C();

  v8 = objc_msgSend(v4, "statusFlags");
  v9 = (unint64_t)objc_msgSend(v4, "statusFlags") & 0x8000;
  if (!(v8 & 0x80000000 | v9))
  {
    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1000BE5D4();
    goto LABEL_18;
  }
  if ((v8 & 0x80000000) != 0 && v9)
  {
    v12 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1000BE600();
    goto LABEL_18;
  }
  v11 = objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer _findMatchingMSDRapportDeviceForRPCompanionLinkDevice:](self, "_findMatchingMSDRapportDeviceForRPCompanionLinkDevice:", v4));
  if (!v11)
  {
    v16 = -[MSDRapportDevice initWithRPCompanionLinkDevice:]([MSDRapportDevice alloc], "initWithRPCompanionLinkDevice:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer devices](self, "devices"));
    objc_msgSend(v17, "addObject:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer observer](self, "observer"));
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer observer](self, "observer"));
      objc_msgSend(v19, "explorerDidFindDevice:", v16);

    }
    goto LABEL_17;
  }
  v13 = sub_1000604F0();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MSDRapportDeviceExplorer: Received duplicated device. Renewing its RPCompanionLinkDevice.", v20, 2u);
  }

  -[NSObject renewRPCompanionLinkDevice:](v11, "renewRPCompanionLinkDevice:", v4);
  -[NSObject setDroppedByRapport:](v11, "setDroppedByRapport:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer observer](self, "observer"));

  if (v15)
  {
    v16 = (MSDRapportDevice *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer observer](self, "observer"));
    -[MSDRapportDevice explorerDidUpdateDevice:](v16, "explorerDidUpdateDevice:", v11);
LABEL_17:

  }
LABEL_18:

}

- (void)_handleRPCompanionLinkDeviceLost:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  MSDRapportDeviceExplorer *v14;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1000BE68C();

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer _findMatchingMSDRapportDeviceForRPCompanionLinkDevice:](self, "_findMatchingMSDRapportDeviceForRPCompanionLinkDevice:", v4));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setDroppedByRapport:", 1);
    v10 = dispatch_time(0, 1000000000);
    v11 = objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer queue](self, "queue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100044038;
    v12[3] = &unk_10013DE28;
    v13 = v9;
    v14 = self;
    dispatch_after(v10, v11, v12);

  }
}

- (void)_handleRPCompanionLinkDeviceChanged:(id)a3 withChanges:(unsigned int)a4
{
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[MSDRapportDeviceExplorer queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_1000BE6EC();

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

- (NSMutableArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (MSDRapportDeviceExplorerProtocol)observer
{
  return (MSDRapportDeviceExplorerProtocol *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_rpClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
