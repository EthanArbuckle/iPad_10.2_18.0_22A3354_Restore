@implementation MSDNearbyObjectMonitor

- (MSDNearbyObjectMonitor)initWithObserver:(id)a3
{
  id v4;
  MSDNearbyObjectMonitor *v5;
  dispatch_queue_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSDNearbyObjectMonitor;
  v5 = -[MSDNearbyObjectMonitor init](&v9, "init");
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.MobileStoreDemo.NearbyObjectMonitor", 0);
    -[MSDNearbyObjectMonitor setQueue:](v5, "setQueue:", v6);

    -[MSDNearbyObjectMonitor setObserver:](v5, "setObserver:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
    -[MSDNearbyObjectMonitor setNearbyObjects:](v5, "setNearbyObjects:", v7);

  }
  return v5;
}

- (void)start
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100099D0C;
  v4[3] = &unk_10013D840;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)stop
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100099DEC;
  v4[3] = &unk_10013D840;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_start
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id buf;
  id v35;

  v3 = objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MSDNearbyObjectMonitor: Starting monitor!", (uint8_t *)&buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor niSession](self, "niSession"));
  if (v6)
    goto LABEL_9;
  v7 = objc_msgSend(objc_alloc((Class)NIRegionPredicate), "initWithName:devicePresencePreset:", CFSTR("Immediate"), 1);
  v8 = objc_msgSend(objc_alloc((Class)NIRegionPredicate), "initWithName:devicePresencePreset:", CFSTR("SensorMax"), 5);
  v9 = objc_alloc((Class)NIDevicePresenceConfiguration);
  v35 = 0;
  v10 = objc_msgSend(v9, "initWithInnerBoundary:outerBoundary:error:", v7, v8, &v35);
  v11 = v35;
  if (v10)
  {
    objc_msgSend(v10, "setAllowedDevices:", 4);
    v12 = objc_alloc_init((Class)NISession);
    -[MSDNearbyObjectMonitor setNiSession:](self, "setNiSession:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor niSession](self, "niSession"));
    objc_msgSend(v13, "setDelegate:", self);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor queue](self, "queue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor niSession](self, "niSession"));
    objc_msgSend(v15, "setDelegateQueue:", v14);

    v16 = objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor niSession](self, "niSession"));
    -[NSObject runWithConfiguration:](v16, "runWithConfiguration:", v10);
  }
  else
  {
    v17 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000CA428(v11);
  }

  if (v10)
  {
LABEL_9:
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor deviceScanner](self, "deviceScanner"));

    if (!v18)
    {
      objc_initWeak(&buf, self);
      v19 = objc_alloc_init((Class)SFDeviceDiscovery);
      -[MSDNearbyObjectMonitor setDeviceScanner:](self, "setDeviceScanner:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor queue](self, "queue"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor deviceScanner](self, "deviceScanner"));
      objc_msgSend(v21, "setDispatchQueue:", v20);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor deviceScanner](self, "deviceScanner"));
      objc_msgSend(v22, "setChangeFlags:", 13);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor deviceScanner](self, "deviceScanner"));
      objc_msgSend(v23, "setScanRate:", 20);

      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10009A230;
      v32[3] = &unk_10013F8E0;
      objc_copyWeak(&v33, &buf);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor deviceScanner](self, "deviceScanner"));
      objc_msgSend(v24, "setDeviceFoundHandler:", v32);

      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10009A278;
      v30[3] = &unk_10013F8E0;
      objc_copyWeak(&v31, &buf);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor deviceScanner](self, "deviceScanner"));
      objc_msgSend(v25, "setDeviceLostHandler:", v30);

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10009A2C0;
      v28[3] = &unk_10013F908;
      objc_copyWeak(&v29, &buf);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor deviceScanner](self, "deviceScanner"));
      objc_msgSend(v26, "setDeviceChangedHandler:", v28);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor deviceScanner](self, "deviceScanner"));
      objc_msgSend(v27, "activateWithCompletion:", &stru_10013F928);

      objc_destroyWeak(&v29);
      objc_destroyWeak(&v31);
      objc_destroyWeak(&v33);
      objc_destroyWeak(&buf);
    }
  }
}

- (void)_stop
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MSDNearbyObjectMonitor: Stopping monitor!", v8, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor niSession](self, "niSession"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor niSession](self, "niSession"));
    objc_msgSend(v7, "invalidate");

  }
}

- (void)_feedNewRSSIReadingReceivedFromDevice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _UNKNOWN **v10;
  _UNKNOWN **v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "idsIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bleDevice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "advertisementFields"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ch")));
  v9 = (void *)v8;
  v10 = &off_10014DB20;
  if (v8)
    v10 = (_UNKNOWN **)v8;
  v11 = v10;

  if ((objc_msgSend(v17, "deviceFlags") & 0x400) != 0 && v4 && v5)
  {
    v12 = objc_alloc((Class)NIBluetoothSample);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bleDevice"));
    v14 = objc_msgSend(v12, "initWithRSSI:identifier:model:channel:machContinuousTimeSeconds:", v4, v5, objc_msgSend(v11, "intValue"), (double)(uint64_t)objc_msgSend(v13, "rssi"), (double)mach_absolute_time());

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor niSession](self, "niSession"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "devicePresenceNotifier"));
    objc_msgSend(v16, "notifyBluetoothSample:", v14);

  }
}

- (void)sessionDidStartRunning:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MSDNearbyObjectMonitor: NISession is running!", v5, 2u);
  }

}

- (void)sessionWasSuspended:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MSDNearbyObjectMonitor: NISession suspended!", v5, 2u);
  }

}

- (void)sessionSuspensionEnded:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MSDNearbyObjectMonitor: NISession suspension ended!", v9, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor niSession](self, "niSession"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor niSession](self, "niSession"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "configuration"));
  objc_msgSend(v6, "runWithConfiguration:", v8);

}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_1000CA51C(v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor deviceScanner](self, "deviceScanner"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor deviceScanner](self, "deviceScanner"));
    objc_msgSend(v9, "invalidate");

    -[MSDNearbyObjectMonitor setDeviceScanner:](self, "setDeviceScanner:", 0);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor niSession](self, "niSession"));

  if (v10)
    -[MSDNearbyObjectMonitor setNiSession:](self, "setNiSession:", 0);

}

- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  MSDNearbyObject *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a4;
  v9 = a5;
  v10 = sub_1000604F0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_1000CA594();

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceIdentifier"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor nearbyObjects](self, "nearbyObjects"));
    v14 = (MSDNearbyObject *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v12));

    if (v9)
    {
      v15 = objc_msgSend(v9, "devicePresencePreset") == (id)1;
      if (v14)
      {
LABEL_6:
        if (v15 == -[MSDNearbyObject isInBubble](v14, "isInBubble"))
        {
LABEL_12:

          goto LABEL_13;
        }
        -[MSDNearbyObject updateIsInBubble:](v14, "updateIsInBubble:", v15);
LABEL_10:
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor observer](self, "observer"));

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor observer](self, "observer"));
          objc_msgSend(v18, "monitorDidUpdateRegionOfNearbyObject:", v14);

        }
        goto LABEL_12;
      }
    }
    else
    {
      v15 = 0;
      if (v14)
        goto LABEL_6;
    }
    v14 = -[MSDNearbyObject initWithIdentifier:andIsInBubble:]([MSDNearbyObject alloc], "initWithIdentifier:andIsInBubble:", v12, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObjectMonitor nearbyObjects](self, "nearbyObjects"));
    objc_msgSend(v16, "setObject:forKey:", v14, v12);

    goto LABEL_10;
  }
LABEL_13:

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (MSDNearbyObjectMonitorProtocol)observer
{
  return (MSDNearbyObjectMonitorProtocol *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (NISession)niSession
{
  return self->_niSession;
}

- (void)setNiSession:(id)a3
{
  objc_storeStrong((id *)&self->_niSession, a3);
}

- (SFDeviceDiscovery)deviceScanner
{
  return self->_deviceScanner;
}

- (void)setDeviceScanner:(id)a3
{
  objc_storeStrong((id *)&self->_deviceScanner, a3);
}

- (NSMutableDictionary)nearbyObjects
{
  return self->_nearbyObjects;
}

- (void)setNearbyObjects:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyObjects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyObjects, 0);
  objc_storeStrong((id *)&self->_deviceScanner, 0);
  objc_storeStrong((id *)&self->_niSession, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
