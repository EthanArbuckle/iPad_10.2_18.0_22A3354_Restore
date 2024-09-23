@implementation W5RapportClient

- (W5RapportClient)init
{
  W5RapportClient *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  objc_super v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;

  v11.receiver = self;
  v11.super_class = (Class)W5RapportClient;
  v2 = -[W5RapportClient init](&v11, "init");
  if (v2)
  {
    if (+[W5FeatureAvailability diagnosticsModeEnabled](W5FeatureAvailability, "diagnosticsModeEnabled"))
    {
      v3 = dispatch_queue_create("com.apple.wifi.W5RapportClient", 0);
      queue = v2->_queue;
      v2->_queue = (OS_dispatch_queue *)v3;

      if (v2->_queue)
      {
        v2->_discoveringDevices = 0;
        return v2;
      }
    }
    else
    {
      v6 = sub_10008F56C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315650;
        v13 = "-[W5RapportClient init]";
        v14 = 2080;
        v15 = "W5RapportClient.m";
        v16 = 1024;
        v17 = 59;
        LODWORD(v10) = 28;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v7, 0, "[wifivelocity] %s (%s:%u) rapport client is not available", (const char *)&v12, v10, LODWORD(v11.receiver));
      }

    }
  }

  v8 = sub_10008F56C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315650;
    v13 = "-[W5RapportClient init]";
    v14 = 2080;
    v15 = "W5RapportClient.m";
    v16 = 1024;
    v17 = 72;
    LODWORD(v10) = 28;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) init error!", (const char *)&v12, v10, LODWORD(v11.receiver));
  }

  return 0;
}

- (BOOL)_configureDiscoveryClient
{
  void *v3;
  _BOOL8 v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v12;
  int v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  int v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[W5RapportClient discoveryClient](self, "discoveryClient"));

  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v5 = objc_alloc_init((Class)RPCompanionLinkClient);
    v4 = v5 != 0;
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[W5RapportClient queue](self, "queue"));
      objc_msgSend(v5, "setDispatchQueue:", v6);

      objc_msgSend(v5, "setControlFlags:", (unint64_t)objc_msgSend(v5, "controlFlags") | 0x818126);
      objc_msgSend(v5, "setServiceType:", CFSTR("com.apple.wifivelocityd.rapportWake"));
      objc_initWeak(&location, self);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100047C34;
      v18[3] = &unk_1000D68F8;
      objc_copyWeak(&v19, &location);
      objc_msgSend(v5, "setInvalidationHandler:", v18);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100047D2C;
      v16[3] = &unk_1000D6948;
      v16[4] = self;
      objc_copyWeak(&v17, &location);
      objc_msgSend(v5, "setDeviceFoundHandler:", v16);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100047E24;
      v14[3] = &unk_1000D6970;
      objc_copyWeak(&v15, &location);
      objc_msgSend(v5, "setDeviceLostHandler:", v14);
      objc_msgSend(v5, "setDeviceChangedHandler:", &stru_1000D69B0);
      objc_msgSend(v5, "setLocalDeviceUpdatedHandler:", &stru_1000D69F0);
      v7 = sub_10008F56C();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136315650;
        v22 = "-[W5RapportClient _configureDiscoveryClient]";
        v23 = 2080;
        v24 = "W5RapportClient.m";
        v25 = 1024;
        v26 = 125;
        LODWORD(v12) = 28;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) companion link client activated successfully", (const char *)&v21, v12, v13);
      }

      -[W5RapportClient setDiscoveryClient:](self, "setDiscoveryClient:", v5);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    else
    {
      v9 = sub_10008F56C();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136315650;
        v22 = "-[W5RapportClient _configureDiscoveryClient]";
        v23 = 2080;
        v24 = "W5RapportClient.m";
        v25 = 1024;
        v26 = 85;
        LODWORD(v12) = 28;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) failed to init rapport client", (const char *)&v21, v12, v13);
      }

    }
  }
  return v4;
}

- (void)_invalidateRapportClient
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[W5RapportClient discoveryClient](self, "discoveryClient"));
  objc_msgSend(v3, "invalidate");

  -[W5RapportClient setDiscoveryClient:](self, "setDiscoveryClient:", 0);
}

- (void)_handleDeviceFound:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void (**deviceFoundHandler)(id, id);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  void *v41;

  v4 = a3;
  v5 = sub_10008F56C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (((unint64_t)objc_msgSend(v4, "statusFlags") & 2) != 0)
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    if (((unint64_t)objc_msgSend(v4, "statusFlags") & 4) != 0)
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceTypes"));
    if (objc_msgSend(v9, "containsObject:", CFSTR("com.apple.wifivelocityd.rapportWake")))
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    if (v4)
    {
      objc_msgSend(v4, "operatingSystemVersion");
      v11 = v23;
      objc_msgSend(v4, "operatingSystemVersion");
      v12 = v21;
      objc_msgSend(v4, "operatingSystemVersion");
      v13 = v19;
    }
    else
    {
      v13 = 0;
      v12 = 0;
      v11 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v21 = 0;
      v22 = 0;
      v19 = 0;
      v20 = 0;
      v17 = 0;
      v18 = 0;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld.%ld.%ld"), v11, v12, v13, v17, v18, v19, v20, v21, v22, v23, v24, v25));
    v27 = "-[W5RapportClient _handleDeviceFound:]";
    v28 = 2080;
    v26 = 136316930;
    v29 = "W5RapportClient.m";
    v30 = 1024;
    v31 = 145;
    v32 = 2114;
    v33 = v4;
    v34 = 2112;
    v35 = v7;
    v36 = 2112;
    v37 = v8;
    v38 = 2112;
    v39 = v10;
    v40 = 2112;
    v41 = v14;
    LODWORD(v16) = 78;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) rapport device found='%{public}@', BLE: %@, Infra: %@, hasVelocityServiceType: %@, osVersion: %@", &v26, v16);

  }
  deviceFoundHandler = (void (**)(id, id))self->_deviceFoundHandler;
  if (deviceFoundHandler)
    deviceFoundHandler[2](deviceFoundHandler, v4);

}

- (void)_handleDeviceLost:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void (**deviceFoundHandler)(id, id);
  int v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;

  v4 = a3;
  v5 = sub_10008F56C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315906;
    v10 = "-[W5RapportClient _handleDeviceLost:]";
    v11 = 2080;
    v12 = "W5RapportClient.m";
    v13 = 1024;
    v14 = 154;
    v15 = 2114;
    v16 = v4;
    v8 = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) rapport device lost='%{public}@'", &v9, v8);
  }

  deviceFoundHandler = (void (**)(id, id))self->_deviceFoundHandler;
  if (deviceFoundHandler)
    deviceFoundHandler[2](deviceFoundHandler, v4);

}

- (void)startDiscoveringDevices
{
  uint64_t v2;
  NSObject *v3;
  unsigned __int8 v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  const char *v9;
  int v10;
  _QWORD v11[4];
  id v12;
  _BYTE location[12];
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;

  if (self->_discoveringDevices)
  {
    v2 = sub_10008F56C();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315650;
      *(_QWORD *)&location[4] = "-[W5RapportClient startDiscoveringDevices]";
      v14 = 2080;
      v15 = "W5RapportClient.m";
      v16 = 1024;
      v17 = 164;
      LODWORD(v9) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) discovery is already active", location, v9, v10);
    }
LABEL_11:

    return;
  }
  v5 = -[W5RapportClient _configureDiscoveryClient](self, "_configureDiscoveryClient");
  v6 = sub_10008F56C();
  v3 = objc_claimAutoreleasedReturnValue(v6);
  v7 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) == 0)
  {
    if (v7)
    {
      *(_DWORD *)location = 136315650;
      *(_QWORD *)&location[4] = "-[W5RapportClient startDiscoveringDevices]";
      v14 = 2080;
      v15 = "W5RapportClient.m";
      v16 = 1024;
      v17 = 169;
      LODWORD(v9) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) failed to configure discovery client", location, v9, v10);
    }
    goto LABEL_11;
  }
  if (v7)
  {
    *(_DWORD *)location = 136315650;
    *(_QWORD *)&location[4] = "-[W5RapportClient startDiscoveringDevices]";
    v14 = 2080;
    v15 = "W5RapportClient.m";
    v16 = 1024;
    v17 = 173;
    LODWORD(v9) = 28;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) starting device discovery", location, v9, v10);
  }

  self->_discoveringDevices = 1;
  objc_initWeak((id *)location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5RapportClient discoveryClient](self, "discoveryClient"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000485B8;
  v11[3] = &unk_1000D6A18;
  objc_copyWeak(&v12, (id *)location);
  objc_msgSend(v8, "activateWithCompletion:", v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)location);
}

- (void)stopDiscoveryingDevices
{
  _BOOL4 discoveringDevices;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;

  discoveringDevices = self->_discoveringDevices;
  v4 = sub_10008F56C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (discoveringDevices)
  {
    if (v6)
    {
      v7 = 136315650;
      v8 = "-[W5RapportClient stopDiscoveryingDevices]";
      v9 = 2080;
      v10 = "W5RapportClient.m";
      v11 = 1024;
      v12 = 189;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v5, 0, "[wifivelocity] %s (%s:%u) stoping device discovery", (const char *)&v7, 28);
    }

    -[W5RapportClient _invalidateRapportClient](self, "_invalidateRapportClient");
    self->_discoveringDevices = 0;
  }
  else
  {
    if (v6)
    {
      v7 = 136315650;
      v8 = "-[W5RapportClient stopDiscoveryingDevices]";
      v9 = 2080;
      v10 = "W5RapportClient.m";
      v11 = 1024;
      v12 = 193;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v5, 0, "[wifivelocity] %s (%s:%u) discovery is not active", (const char *)&v7, 28);
    }

  }
}

- (id)sendMessageToDevice:(id)a3 request:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  _BOOL4 v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _BYTE location[12];
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)RPCompanionLinkClient);
  objc_msgSend(v7, "setDestinationDevice:", v5);
  v8 = sub_10008F56C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)location = 136316162;
    *(_QWORD *)&location[4] = "-[W5RapportClient sendMessageToDevice:request:]";
    v25 = 2080;
    v26 = "W5RapportClient.m";
    v27 = 1024;
    v28 = 204;
    v29 = 2112;
    v30 = v6;
    v31 = 2112;
    v32 = v5;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) [Rapport] Request: %@, Destination: %@", location, 48);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "model"));
  if (objc_msgSend(v10, "containsString:", CFSTR("Mac")))
  {

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "model"));
    v13 = objc_msgSend(v12, "containsString:", CFSTR("Mac"));

    if ((v13 & 1) == 0)
      objc_msgSend(v7, "setServiceType:", CFSTR("com.apple.wifivelocityd.rapportWake"));
  }
  v14 = ((unint64_t)objc_msgSend(v6, "controlFlags") & 1) == 0;
  v15 = (unint64_t)objc_msgSend(v7, "controlFlags");
  v16 = 6291712;
  if (v14)
    v16 = 4227334;
  objc_msgSend(v7, "setControlFlags:", v16 | v15);
  objc_msgSend(v7, "setInvalidationHandler:", &stru_1000D6A38);
  objc_initWeak((id *)location, v7);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100048BF8;
  v20[3] = &unk_1000D6A88;
  objc_copyWeak(&v23, (id *)location);
  v17 = v6;
  v21 = v17;
  v18 = v5;
  v22 = v18;
  objc_msgSend(v7, "activateWithCompletion:", v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)location);

  return 0;
}

- (BOOL)isDiscoveringDevices
{
  return self->_discoveringDevices;
}

- (void)setDiscoveringDevices:(BOOL)a3
{
  self->_discoveringDevices = a3;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (RPCompanionLinkClient)localDeviceClient
{
  return self->_localDeviceClient;
}

- (void)setLocalDeviceClient:(id)a3
{
  objc_storeStrong((id *)&self->_localDeviceClient, a3);
}

- (RPCompanionLinkClient)discoveryClient
{
  return self->_discoveryClient;
}

- (void)setDiscoveryClient:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryClient, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_discoveryClient, 0);
  objc_storeStrong((id *)&self->_localDeviceClient, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
}

@end
