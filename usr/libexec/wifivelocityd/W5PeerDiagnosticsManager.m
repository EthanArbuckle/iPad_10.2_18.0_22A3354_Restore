@implementation W5PeerDiagnosticsManager

- (W5PeerDiagnosticsManager)initWithStatusManager:(id)a3
{
  W5PeerDiagnosticsManager *v4;
  W5PeerDiagnosticsManager *v5;
  dispatch_queue_t v6;
  NSObject *v7;
  const char *v9;
  objc_super v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;

  self->_discoveryClientStatus = 0;
  v10.receiver = self;
  v10.super_class = (Class)W5PeerDiagnosticsManager;
  v4 = -[W5PeerDiagnosticsManager init](&v10, "init");
  v5 = v4;
  if (!a3
    || !v4
    || (v4->_status = (W5StatusManager *)a3,
        v6 = dispatch_queue_create("com.apple.wifid.peerdiagnosticsmanager", 0),
        (v5->_queue = (OS_dispatch_queue *)v6) == 0))
  {

    v7 = sub_10008F56C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315650;
      v12 = "-[W5PeerDiagnosticsManager initWithStatusManager:]";
      v13 = 2080;
      v14 = "W5PeerDiagnosticsManager.m";
      v15 = 1024;
      v16 = 99;
      LODWORD(v9) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v7, 0, "[wifivelocity] %s (%s:%u) init error!", (const char *)&v11, v9, LODWORD(v10.receiver));
    }
    return 0;
  }
  return v5;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;

  self->_cachedPeerTypesResult = 0;
  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  v4.receiver = self;
  v4.super_class = (Class)W5PeerDiagnosticsManager;
  -[W5PeerDiagnosticsManager dealloc](&v4, "dealloc");
}

- (void)invalidateDiscoveryClient
{
  -[RPCompanionLinkClient invalidate](self->_discoveryClient, "invalidate");

  objc_sync_enter(self);
  self->_discoveryClientStatus = 0;
  objc_sync_exit(self);
  self->_discoveryClient = 0;
}

- (int64_t)configureDiscoveryClientAndActivate
{
  NSObject *v3;
  int64_t discoveryClientStatus;
  RPCompanionLinkClient *v5;
  NSObject *v6;
  NSObject *queue;
  NSObject *v8;
  const char *v10;
  _QWORD block[6];
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;

  objc_sync_enter(self);
  if (self->_discoveryClientStatus)
  {
    v3 = sub_10008F56C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315650;
      v13 = "-[W5PeerDiagnosticsManager configureDiscoveryClientAndActivate]";
      v14 = 2080;
      v15 = "W5PeerDiagnosticsManager.m";
      v16 = 1024;
      v17 = 131;
      LODWORD(v10) = 28;
      discoveryClientStatus = 1;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) Failed to configure discovery client, it's already active", (const char *)&v12, v10, LODWORD(block[0]));
    }
    else
    {
      discoveryClientStatus = 1;
    }
  }
  else
  {
    objc_sync_exit(self);
    v5 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    self->_discoveryClient = v5;
    if (v5)
    {
      -[RPCompanionLinkClient setInvalidationHandler:](v5, "setInvalidationHandler:", &stru_1000D76C8);
      -[RPCompanionLinkClient setDeviceFoundHandler:](self->_discoveryClient, "setDeviceFoundHandler:", &stru_1000D76E8);
      -[RPCompanionLinkClient setDeviceLostHandler:](self->_discoveryClient, "setDeviceLostHandler:", &stru_1000D7708);
      -[RPCompanionLinkClient setDispatchQueue:](self->_discoveryClient, "setDispatchQueue:", self->_queue);
      -[RPCompanionLinkClient setControlFlags:](self->_discoveryClient, "setControlFlags:", (unint64_t)-[RPCompanionLinkClient controlFlags](self->_discoveryClient, "controlFlags") | 0x109102);
      objc_sync_enter(self);
      self->_discoveryClientStatus = 2;
      objc_sync_exit(self);
      v6 = dispatch_semaphore_create(0);
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100092280;
      block[3] = &unk_1000D5C48;
      block[4] = self;
      block[5] = v6;
      dispatch_async(queue, block);
      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v6);
      v8 = sub_10008F56C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315650;
        v13 = "-[W5PeerDiagnosticsManager configureDiscoveryClientAndActivate]";
        v14 = 2080;
        v15 = "W5PeerDiagnosticsManager.m";
        v16 = 1024;
        v17 = 173;
        LODWORD(v10) = 28;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) discovery client activated successfully", (const char *)&v12, v10, LODWORD(block[0]));
      }
    }
    objc_sync_enter(self);
    discoveryClientStatus = self->_discoveryClientStatus;
  }
  objc_sync_exit(self);
  return discoveryClientStatus;
}

- (id)gatherPeerTypes
{
  NSDictionary *cachedPeerTypesResult;

  if (!_os_feature_enabled_impl("WiFiVelocity", "PeerTypes"))
    return 0;
  objc_sync_enter(self);
  cachedPeerTypesResult = self->_cachedPeerTypesResult;
  objc_sync_exit(self);
  return cachedPeerTypesResult;
}

- (void)beginPeerDiscovery
{
  NSObject *v3;
  dispatch_time_t v4;
  _QWORD v5[6];

  if (_os_feature_enabled_impl("WiFiVelocity", "PeerTypes"))
  {
    if ((id)-[W5PeerDiagnosticsManager configureDiscoveryClientAndActivate](self, "configureDiscoveryClientAndActivate") == (id)2)
    {
      v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
      v4 = dispatch_time(0, 10000000000);
      dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100092520;
      v5[3] = &unk_1000D5C48;
      v5[4] = v3;
      v5[5] = self;
      dispatch_source_set_event_handler(v3, v5);
      dispatch_activate(v3);
    }
  }
}

- (void)registerCallbacksAndActivate
{
  NSObject *v3;
  NSObject *queue;
  _QWORD v5[6];

  v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100092B54;
  v5[3] = &unk_1000D5C48;
  v5[4] = self;
  v5[5] = v3;
  dispatch_async(queue, v5);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v3);
}

- (void)registerRequestHandler
{
  RPCompanionLinkClient *discoveryClient;
  _QWORD v3[5];

  discoveryClient = self->_discoveryClient;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100092D24;
  v3[3] = &unk_1000D7758;
  v3[4] = self;
  -[RPCompanionLinkClient registerRequestID:options:handler:](discoveryClient, "registerRequestID:options:handler:", CFSTR("com.apple.proximity.peerdiagnosticslink"), 0, v3);
}

- (id)getWiFiStatus
{
  id v3;
  id v4;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = -[W5StatusManager wifiStatus](self->_status, "wifiStatus");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "rssi")), CFSTR("RSSI"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v4, "macAddress"), CFSTR("MAC"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v4, "ssidString"), CFSTR("SSID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v4, "bssid"), CFSTR("BSSID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", W5DescriptionForChannel(objc_msgSend(v4, "channel")), CFSTR("Channel"));
  return v3;
}

- (id)getLQMSummary
{
  NSObject *v3;
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;

  if (objc_msgSend(-[CWFInterface LQMSummary](-[W5StatusManager corewifi](self->_status, "corewifi"), "LQMSummary"), "bytes"))
  {
    return (id)CWFDebugDescriptionForLQMSummary();
  }
  v3 = sub_10008F56C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315650;
    v6 = "-[W5PeerDiagnosticsManager getLQMSummary]";
    v7 = 2080;
    v8 = "W5PeerDiagnosticsManager.m";
    v9 = 1024;
    v10 = 320;
    v4 = 28;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v3, 0, "[wifivelocity] %s (%s:%u) Failed to obtain LQM Summary", (const char *)&v5, v4);
  }
  return 0;
}

- (id)getDPSSummary
{
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  id v6;
  const char *v8;
  void **v9;
  uint64_t v10;
  intptr_t (*v11)(uint64_t, void *, uint64_t);
  void *v12;
  NSObject *v13;
  W5PeerDiagnosticsManager *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  int v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = sub_100093260;
  v25 = sub_100093270;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  if (sub_10009327C())
  {
    v3 = dispatch_semaphore_create(0);
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_100093340;
    v12 = &unk_1000D7780;
    v13 = v3;
    v14 = self;
    v15 = &v17;
    v16 = &v21;
    objc_msgSend(objc_msgSend((id)sub_10009327C(), "sharedClientWithIdentifier:", CFSTR("wifivelocityd")), "getDpsStatsandReply:", &v9);
    v4 = dispatch_time(0, 2000000000);
    if (dispatch_semaphore_wait(v3, v4))
    {
      objc_sync_enter(self);
      *((_BYTE *)v18 + 24) = 1;
      objc_sync_exit(self);
      v5 = sub_10008F56C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 136315906;
        v28 = "-[W5PeerDiagnosticsManager getDPSSummary]";
        v29 = 2080;
        v30 = "W5PeerDiagnosticsManager.m";
        v31 = 1024;
        v32 = 354;
        v33 = 1024;
        v34 = 2;
        LODWORD(v8) = 34;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v5, 0, "[wifivelocity] %s (%s:%u) %d sec timeout waiting for summarized logs from wifianalyticsd", (const char *)&v27, v8, (_DWORD)v9, v10);
      }
    }
    dispatch_release(v3);
  }
  v6 = (id)v22[5];
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v6;
}

- (id)localDiagnostics
{
  id v3;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(-[RPCompanionLinkClient localDevice](self->_discoveryClient, "localDevice"), "model"), CFSTR("DeviceModel"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[W5PeerDiagnosticsManager getWiFiStatus](self, "getWiFiStatus"), CFSTR("WiFiStatus"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[W5PeerDiagnosticsManager getDPSSummary](self, "getDPSSummary"), CFSTR("DPSSummary"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[W5PeerDiagnosticsManager getLQMSummary](self, "getLQMSummary"), CFSTR("LQMSummary"));
  return v3;
}

- (void)requestDiagnostics:(id)a3 completionBlock:(id)a4
{
  NSObject *v6;
  id v7;
  int v8;
  _QWORD v9[6];
  _QWORD v10[5];
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;

  v6 = sub_10008F56C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315906;
    v12 = "-[W5PeerDiagnosticsManager requestDiagnostics:completionBlock:]";
    v13 = 2080;
    v14 = "W5PeerDiagnosticsManager.m";
    v15 = 1024;
    v16 = 376;
    v17 = 2114;
    v18 = a3;
    v8 = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) sending peerdiagnostic request to %{public}@ ", &v11, v8);
  }
  v7 = objc_alloc_init((Class)RPCompanionLinkClient);
  objc_msgSend(v7, "setControlFlags:", (unint64_t)objc_msgSend(v7, "controlFlags") | 0x8102);
  objc_msgSend(v7, "setDestinationDevice:", a3);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000936F0;
  v10[3] = &unk_1000D5C98;
  v10[4] = a3;
  objc_msgSend(v7, "setInvalidationHandler:", v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000937DC;
  v9[3] = &unk_1000D5DE8;
  v9[4] = v7;
  v9[5] = a4;
  objc_msgSend(v7, "activateWithCompletion:", v9);
}

- (id)gatherPeerDiagnostics
{
  NSObject *v3;
  id v4;
  id v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *queue;
  NSObject *v12;
  id v13;
  NSObject *v14;
  dispatch_time_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v20;
  NSObject *v22;
  const char *v23;
  __int128 v24;
  id v25;
  _QWORD v26[7];
  _QWORD block[9];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  id v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  _BYTE v48[128];

  if (!_os_feature_enabled_impl("WiFiVelocity", "PeerDiagnostics"))
    return 0;
  v25 = objc_alloc_init((Class)NSMutableArray);
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  if (objc_msgSend(-[RPCompanionLinkClient activeDevices](self->_discoveryClient, "activeDevices"), "count"))
  {
    v3 = dispatch_group_create();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v4 = -[RPCompanionLinkClient activeDevices](self->_discoveryClient, "activeDevices");
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v48, 16);
    v7 = 0;
    if (v5)
    {
      v8 = *(_QWORD *)v29;
      *(_QWORD *)&v6 = 136315906;
      v24 = v6;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v9);
          if (!objc_msgSend(v10, "model")
            || (objc_msgSend(objc_msgSend(v10, "model"), "containsString:", CFSTR("iPhone")) & 1) != 0
            || (objc_msgSend(objc_msgSend(v10, "model"), "containsString:", CFSTR("iPad")) & 1) != 0
            || (objc_msgSend(objc_msgSend(v10, "model"), "containsString:", CFSTR("Mac")) & 1) != 0)
          {
            dispatch_group_enter(v3);
            ++v7;
            queue = self->_queue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100093EF8;
            block[3] = &unk_1000D77F8;
            block[4] = self;
            block[5] = v10;
            block[7] = v3;
            block[8] = &v32;
            block[6] = v25;
            dispatch_async(queue, block);
          }
          else
          {
            v12 = sub_10008F56C();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              v36 = v24;
              v37 = "-[W5PeerDiagnosticsManager gatherPeerDiagnostics]";
              v38 = 2080;
              v39 = "W5PeerDiagnosticsManager.m";
              v40 = 1024;
              v41 = 438;
              v42 = 2114;
              v43 = v10;
              LODWORD(v23) = 38;
              _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] %s (%s:%u) skipping device %{public}@", &v36, v23);
            }
          }
          v9 = (char *)v9 + 1;
        }
        while (v5 != v9);
        v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v48, 16);
        v5 = v13;
      }
      while (v13);
    }
    dispatch_group_enter(v3);
    v14 = self->_queue;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10009416C;
    v26[3] = &unk_1000D58F8;
    v26[4] = self;
    v26[5] = v25;
    v26[6] = v3;
    dispatch_async(v14, v26);
    v15 = dispatch_time(0, 5000000000);
    if (dispatch_group_wait(v3, v15))
    {
      v16 = sub_10008F56C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v36 = 136315906;
        v37 = "-[W5PeerDiagnosticsManager gatherPeerDiagnostics]";
        v38 = 2080;
        v39 = "W5PeerDiagnosticsManager.m";
        v40 = 1024;
        v41 = 477;
        v42 = 1024;
        LODWORD(v43) = 5;
        LODWORD(v23) = 34;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] %s (%s:%u) %d sec timeout waiting for diagnosctic logs from peers", (const char *)&v36, v23, (_DWORD)v24, DWORD2(v24));
      }
    }
    if (v3)
      dispatch_release(v3);
    v17 = sub_10008F56C();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(-[RPCompanionLinkClient activeDevices](self->_discoveryClient, "activeDevices"), "count");
      v19 = v33[3];
      v36 = 136316418;
      v37 = "-[W5PeerDiagnosticsManager gatherPeerDiagnostics]";
      v38 = 2080;
      v39 = "W5PeerDiagnosticsManager.m";
      v40 = 1024;
      v41 = 482;
      v42 = 2048;
      v43 = v18;
      v44 = 2048;
      v45 = v7;
      v46 = 2048;
      v47 = v19;
      LODWORD(v23) = 58;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v17, 0, "[wifivelocity] %s (%s:%u) active peers %lu, requested peers %lu, responses %lu", &v36, v23);
    }
  }
  else
  {
    v22 = sub_10008F56C();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v36 = 136315650;
      v37 = "-[W5PeerDiagnosticsManager gatherPeerDiagnostics]";
      v38 = 2080;
      v39 = "W5PeerDiagnosticsManager.m";
      v40 = 1024;
      v41 = 428;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v22, 0, "[wifivelocity] %s (%s:%u) No active clients, returning", &v36, 28);
    }
  }
  objc_sync_enter(self);
  v20 = objc_msgSend(v25, "copy");
  objc_sync_exit(self);
  _Block_object_dispose(&v32, 8);
  return v20;
}

@end
