@implementation WLWiFiDeviceClient

- (WLWiFiDeviceClient)initWithWiFiDeviceClientRef:(__WiFiDeviceClient *)a3
{
  WLWiFiDeviceClient *v4;
  WLWiFiDeviceClient *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WLWiFiDeviceClient;
  v4 = -[WLWiFiDeviceClient init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[WLWiFiDeviceClient setRef:](v4, "setRef:", a3);
    CFRetain(-[WLWiFiDeviceClient ref](v5, "ref"));
  }
  return v5;
}

- (id)_initWithoutWiFiDeviceClientRef
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WLWiFiDeviceClient;
  return -[WLWiFiDeviceClient init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  if (-[WLWiFiDeviceClient ref](self, "ref"))
    CFRelease(-[WLWiFiDeviceClient ref](self, "ref"));
  v3.receiver = self;
  v3.super_class = (Class)WLWiFiDeviceClient;
  -[WLWiFiDeviceClient dealloc](&v3, sel_dealloc);
}

- (id)hostedNetworkMatchingSSID:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WLWiFiDeviceClient _hostedNetworks](self, "_hostedNetworks");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "ssid", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_hostedNetworks
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[WLWiFiDeviceClient ref](self, "ref");
  WiFiDeviceClientCopyHostedNetworks();
  _WLLog();
  return v3;
}

- (void)disassociate
{
  -[WLWiFiDeviceClient ref](self, "ref");
  WiFiDeviceClientDisassociate();
}

- (void)startNetworkWithHostRole:(int)a3 request:(id)a4 completion:(id)a5
{
  uint64_t v6;
  void (**v8)(id, _QWORD);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;

  v6 = *(_QWORD *)&a3;
  v16 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  _startSessionToCompletionMap();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "wl_uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  objc_sync_enter(v11);
  v12 = (void *)MEMORY[0x2207BB4C4](v8);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v10);

  objc_sync_exit(v11);
  v13 = -[WLWiFiDeviceClient _startNetworkWithRole:request:session:](self, "_startNetworkWithRole:request:session:", v6, v16, v10);
  if ((_DWORD)v13)
  {
    v15 = v13;
    _WLLog();
    v14 = v11;
    objc_sync_enter(v14);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", 0, v10, v15);
    objc_sync_exit(v14);

    v8[2](v8, 0);
  }

}

- (int)_startNetworkWithRole:(int)a3 request:(id)a4 session:(id)a5
{
  id v7;
  id v8;
  int started;

  v7 = a5;
  v8 = a4;
  -[WLWiFiDeviceClient ref](self, "ref");
  started = WiFiDeviceClientStartNetwork();

  return started;
}

- (void)stopNetwork:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  _stopSessionToCompletionMap();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "wl_uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  objc_sync_enter(v9);
  v10 = (void *)MEMORY[0x2207BB4C4](v6);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v8);

  objc_sync_exit(v9);
  v11 = -[WLWiFiDeviceClient _stopNetwork:session:](self, "_stopNetwork:session:", v14, v8);
  if ((_DWORD)v11)
  {
    v13 = v11;
    _WLLog();
    v12 = v9;
    objc_sync_enter(v12);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v8, v13);
    objc_sync_exit(v12);

    v6[2](v6, 0);
  }

}

- (int)_stopNetwork:(id)a3 session:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[WLWiFiDeviceClient ref](self, "ref");
  objc_msgSend(v7, "ref");

  LODWORD(v7) = WiFiDeviceClientStopNetwork();
  return (int)v7;
}

- (BOOL)_completionMapsAreEmpty
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  _startSessionToCompletionMap();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  _startSessionToCompletionMap();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  objc_sync_exit(v2);
  _stopSessionToCompletionMap();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  _stopSessionToCompletionMap();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 | objc_msgSend(v6, "count");

  objc_sync_exit(v5);
  return v7 == 0;
}

- (__WiFiDeviceClient)ref
{
  return self->_ref;
}

- (void)setRef:(__WiFiDeviceClient *)a3
{
  self->_ref = a3;
}

@end
