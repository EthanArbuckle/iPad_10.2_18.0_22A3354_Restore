@implementation SDConnectedBrowser

+ (id)sharedBrowser
{
  if (qword_1007C6CB0 != -1)
    dispatch_once(&qword_1007C6CB0, &stru_10071A220);
  return (id)qword_1007C6CB8;
}

- (SDConnectedBrowser)init
{
  SDConnectedBrowser *v2;
  SDConnectedBrowser *v3;
  OS_dispatch_source *timer;
  NSDictionary *servers;
  NSDictionary *odiskServers;
  uint64_t v7;
  SDStatusMonitor *monitor;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SDConnectedBrowser;
  v2 = -[SDConnectedBrowser init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    timer = v2->_timer;
    v2->_timer = 0;

    servers = v3->_servers;
    v3->_servers = 0;

    *(_QWORD *)&v3->_clientCount = 0;
    v3->_connectedCount = 0;
    odiskServers = v3->_odiskServers;
    v3->_odiskServers = 0;

    v3->_airDropPeople = 0;
    v3->_sendNotification = 0;
    v7 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    monitor = v3->_monitor;
    v3->_monitor = (SDStatusMonitor *)v7;

  }
  return v3;
}

- (void)setServers:(id)a3
{
  id v5;

  v5 = a3;
  if (sub_1000CE998(self->_servers, v5))
  {
    objc_storeStrong((id *)&self->_servers, a3);
    self->_sendNotification = 1;
  }

}

- (void)setODiskServers:(id)a3
{
  id v5;

  v5 = a3;
  if (sub_1000CE998(self->_odiskServers, v5))
  {
    objc_storeStrong((id *)&self->_odiskServers, a3);
    self->_sendNotification = 1;
  }

}

- (NSArray)nodes
{
  return -[NSDictionary allValues](self->_servers, "allValues");
}

- (NSArray)odiskNodes
{
  return -[NSDictionary allValues](self->_odiskServers, "allValues");
}

- (void)postNotification
{
  id v2;

  if (self->_sendNotification)
  {
    self->_sendNotification = 0;
    v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("com.apple.sharingd.ConnectedChanged"), 0, 0);

  }
}

- (void)browseAfterDelay:(double)a3
{
  NSObject *timer;
  dispatch_time_t v4;

  timer = self->_timer;
  v4 = sub_10019AAC0(a3);
  sub_10019AB78(timer, v4);
}

- (id)recentNodes
{
  NSMutableDictionary *v2;
  void *v3;

  v2 = objc_opt_new(NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v2, "allValues"));

  return v3;
}

- (int)addNode:(__SFNode *)a3
{
  return -1;
}

- (int)removeNode:(__SFNode *)a3
{
  return -1;
}

- (BOOL)opticalDisk:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  CFTypeRef cf;

  v15 = 0;
  cf = 0;
  v3 = _CFURLGetVolumePropertyFlags(a3, 0x800000, &v15, &cf);
  if ((_DWORD)v3)
  {
    return BYTE2(v15) >> 7;
  }
  else
  {
    v6 = browser_log(v3, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1001BBA44((uint64_t)&cf, v7, v8, v9, v10, v11, v12, v13);

    CFRelease(cf);
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)URLForRemounting:(id)a3
{
  unsigned __int8 v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  id v18;

  v18 = 0;
  v17 = 0;
  v3 = objc_msgSend(a3, "getResourceValue:forKey:error:", &v18, NSURLVolumeURLForRemountingKey, &v17);
  v4 = v18;
  v5 = v17;
  v7 = v5;
  if ((v3 & 1) == 0)
  {
    v8 = browser_log(v5, v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1001BBAB0((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);

  }
  return v4;
}

- (id)connectedNodes
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  __CFString *v19;
  const void *v20;
  BOOL v21;
  __CFNetService *v22;
  __CFNetService *v23;
  CFStringRef Name;
  __CFString *v25;
  NSMutableDictionary *v26;
  NSMutableDictionary *v27;
  __CFString *v28;
  void *v29;
  int v30;
  const __CFURL *v31;
  const __CFURL *v32;
  void *v33;
  void *v34;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  NSMutableDictionary *v39;
  NSMutableDictionary *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  NSMutableDictionary *v44;
  NSMutableDictionary *v45;
  id v46;
  SDConnectedBrowser *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  NSURLResourceKey v54;

  v40 = objc_opt_new(NSMutableDictionary);
  v45 = objc_opt_new(NSMutableDictionary);
  v44 = objc_opt_new(NSMutableDictionary);
  v39 = objc_opt_new(NSMutableDictionary);
  v54 = NSURLVolumeURLForRemountingKey;
  v3 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v54, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v36 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mountedVolumeURLsIncludingResourceValuesForKeys:options:", v3, 2));

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v50;
    v37 = kSFNodeProtocolAFP;
    v38 = kSFNodeProtocolFile;
    v41 = kSFNodeKindConnected;
    v42 = *(_QWORD *)v50;
    v43 = v6;
    v47 = self;
    do
    {
      v10 = 0;
      v46 = v8;
      do
      {
        if (*(_QWORD *)v50 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)v10);
        v12 = -[SDConnectedBrowser opticalDisk:](self, "opticalDisk:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDConnectedBrowser URLForRemounting:](self, "URLForRemounting:", v11));
        v14 = v13;
        if ((v12 & 1) != 0 || v13)
        {
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "host"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "scheme"));
          v48 = v16;
          if ((v12 & 1) != 0)
          {
            v17 = variable initialization expression of HeadphoneProxFeatureClient.delegate();
            v18 = (__CFString *)objc_claimAutoreleasedReturnValue(v17);
            if (v18)
              goto LABEL_10;
          }
          else
          {
            if (v15)
              v21 = v16 == 0;
            else
              v21 = 1;
            if (!v21 && (objc_msgSend(v16, "isEqual:", v38) & 1) == 0)
            {
              v18 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor serverNameForHost:](self->_monitor, "serverNameForHost:", v15));
              if (!v18)
              {
                v22 = (__CFNetService *)_CFNetServiceCreateFromURL(0, v14);
                if (!v22
                  || (v23 = v22,
                      Name = CFNetServiceGetName(v22),
                      v18 = (__CFString *)objc_claimAutoreleasedReturnValue(Name),
                      CFRelease(v23),
                      !v18))
                {
                  if (!objc_msgSend(v48, "isEqual:", v37)
                    || (v25 = sub_10019C8A4(v11), (v18 = (__CFString *)objc_claimAutoreleasedReturnValue(v25)) == 0))
                  {
                    v18 = v15;
                  }
                }
              }
LABEL_10:
              if (-[__CFString isEqual:](v15, "isEqual:", v18))
              {
                v19 = sub_10019D12C(v15);
                v20 = (const void *)SFNodeCreate(0, v19, v18);
                CFRelease(v19);
              }
              else
              {
                v20 = (const void *)SFNodeCreate(0, v18, v18);
              }
              v26 = v44;
              v27 = v45;
              v28 = v18;
              if ((v12 & 1) == 0)
              {
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "port"));
                v30 = objc_msgSend(v29, "intValue");

                SFNodeSetHostName(v20, v15);
                v31 = sub_1000CDE00(v48, 0, 0, v15, v30, 0, 0, 0);
                v27 = v39;
                v26 = v40;
                v28 = v15;
                if (v31)
                {
                  v32 = v31;
                  SFNodeSetURL(v20, v31);
                  CFRelease(v32);
                  v27 = v39;
                  v26 = v40;
                  v28 = v15;
                }
              }
              SFNodeAddKind(v20, v41);
              -[SDConnectedBrowser setNodeModel:protocol:url:](v47, "setNodeModel:protocol:url:", v20, v48, v14);
              -[NSMutableDictionary setValue:forKey:](v26, "setValue:forKey:", v20, v28);
              CFRelease(v20);
              v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", v18));
              if (!v33)
              {
                v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                -[NSMutableDictionary setValue:forKey:](v27, "setValue:forKey:", v33, v18);
              }
              objc_msgSend(v33, "addObject:", v11);

              v8 = v46;
              self = v47;
              v9 = v42;
              v6 = v43;
            }
          }

        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v8);
  }

  -[SDStatusMonitor setODiskMountPoints:](self->_monitor, "setODiskMountPoints:", v45);
  -[SDStatusMonitor setServerMountPoints:](self->_monitor, "setServerMountPoints:", v39);
  -[SDConnectedBrowser setODiskServers:](self, "setODiskServers:", v44);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v40, "allValues"));

  return v34;
}

- (void)combineRecentAndConnectedNodes:(BOOL)a3
{
  SDConnectedBrowser *v3;
  void *v4;
  NSMutableDictionary *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  const void *v13;
  NSDictionary *servers;
  void *Copy;
  const void *v16;
  uint64_t v17;
  const void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *j;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSDictionary *v35;
  const void *v36;
  uint64_t v37;
  const void *v38;
  id v39;
  _BOOL4 v40;
  id v41;
  void *v42;
  id obj;
  SDConnectedBrowser *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];

  v40 = a3;
  v3 = self;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDConnectedBrowser recentNodes](self, "recentNodes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDConnectedBrowser connectedNodes](v3, "connectedNodes"));
  v5 = objc_opt_new(NSMutableDictionary);
  v39 = objc_msgSend(v4, "count");
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  v44 = v3;
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v50;
    v10 = kSFNodeKindConnected;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v9)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        v13 = (const void *)SFNodeCopyRealName(v12, v7);
        servers = v3->_servers;
        if (servers
          && (Copy = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](servers, "objectForKeyedSubscript:", v13)),
              Copy,
              Copy))
        {
          v16 = (const void *)SFNodeCopyURL(v12);
          v18 = (const void *)SFNodeCopyModel(v12, v17);
          v20 = (void *)SFNodeCopyRealName(Copy, v19);
          SFNodeSetURL(Copy, v16);
          SFNodeSetModel(Copy, v18);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", Copy, v20);
          if (v18)
            CFRelease(v18);
          if (v16)
            CFRelease(v16);
          v3 = v44;
        }
        else
        {
          Copy = (void *)SFNodeCreateCopy(0, v12);
          v20 = (void *)SFNodeCopyRealName(Copy, v21);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", Copy, v20);
          CFRelease(Copy);
        }

        SFNodeAddKind(Copy, v10);
        CFRelease(v13);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v8);
  }

  if (v39 != (id)v3->_connectedCount)
  {
    v3->_connectedCount = (int)v39;
    v3->_sendNotification = 1;
  }
  if (v40)
    -[SDConnectedBrowser addToRecents:](v3, "addToRecents:", v5);
  v41 = objc_msgSend(v42, "count");
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v22 = v42;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v23)
  {
    v25 = v23;
    v26 = *(_QWORD *)v46;
    v27 = kSFNodeKindConnected;
    v28 = kSFNodeKindRecent;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(_QWORD *)v46 != v26)
          objc_enumerationMutation(v22);
        v30 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j);
        v31 = (void *)SFNodeCopyRealName(v30, v24);
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v31));

        if (v32)
          goto LABEL_26;
        v35 = v44->_servers;
        if (v35)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v35, "objectForKeyedSubscript:", v31));

          if (v32)
          {
            v36 = (const void *)SFNodeCopyURL(v30);
            SFNodeSetURL(v32, v36);
            SFNodeRemoveKind(v32, v27);
            if (v36)
              CFRelease(v36);
LABEL_26:
            v34 = (void *)SFNodeCopyRealName(v32, v33);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v32, v34);
            goto LABEL_32;
          }
        }
        v34 = (void *)SFNodeCreateCopy(0, v30);
        v38 = (const void *)SFNodeCopyRealName(v34, v37);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v34, v38);
        CFRelease(v38);
        v32 = v34;
LABEL_32:
        CFRelease(v34);
        SFNodeAddKind(v32, v28);

      }
      v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v25);
  }

  if (v41 != (id)v44->_recentsCount)
  {
    v44->_recentsCount = (int)v41;
    v44->_sendNotification = 1;
  }
  -[SDConnectedBrowser setServers:](v44, "setServers:", v5);

}

- (void)buildNodesAndNotify:(BOOL)a3
{
  -[SDConnectedBrowser combineRecentAndConnectedNodes:](self, "combineRecentAndConnectedNodes:", a3);
  -[SDConnectedBrowser postNotification](self, "postNotification");
}

- (void)addAirDropPerson:(__SFNode *)a3
{
  __CFBag *airDropPeople;
  _QWORD block[5];

  airDropPeople = self->_airDropPeople;
  if (!airDropPeople)
  {
    airDropPeople = CFBagCreateMutable(0, 0, &kCFTypeBagCallBacks);
    self->_airDropPeople = airDropPeople;
  }
  CFBagAddValue(airDropPeople, a3);
  if (CFBagGetCountOfValue(self->_airDropPeople, a3) == 1)
  {
    SFNodeAddKind(a3, kSFNodeKindConnected);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001BB68C;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (NSArray)airDropNodes
{
  __CFSet *v2;
  __CFSet *v3;
  void *v4;

  v2 = sub_1000CDB74(0, 0, self->_airDropPeople);
  if (v2)
  {
    v3 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[__CFSet allObjects](v2, "allObjects"));
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)removeAirDropPersonInternal:(__SFNode *)a3
{
  CFBagRemoveValue(self->_airDropPeople, a3);
  if (!CFBagGetCountOfValue(self->_airDropPeople, a3))
  {
    SFNodeRemoveKind(a3, kSFNodeKindConnected);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_10071A240);
  }
}

- (void)removeAirDropPerson:(__SFNode *)a3
{
  unsigned int v5;
  double v6;
  dispatch_time_t v7;
  _QWORD v8[6];

  CFRetain(a3);
  v5 = -[SDStatusMonitor wirelessEnabled](self->_monitor, "wirelessEnabled");
  v6 = 0.0;
  if (v5)
    v6 = 2.0;
  v7 = sub_10019AAC0(v6);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001BB868;
  v8[3] = &unk_100716108;
  v8[4] = self;
  v8[5] = a3;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v8);
}

- (void)volumesChanged:(id)a3
{
  -[SDConnectedBrowser browseAfterDelay:](self, "browseAfterDelay:", a3, 0.01);
}

- (void)start
{
  int clientCount;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *timer;
  void *v7;
  _QWORD v8[5];

  clientCount = self->_clientCount;
  self->_clientCount = clientCount + 1;
  if (!clientCount)
  {
    if (!self->_timer)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1001BB970;
      v8[3] = &unk_1007146D8;
      v8[4] = self;
      v4 = sub_10019AAD8(1, &_dispatch_main_q, v8);
      v5 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue(v4);
      timer = self->_timer;
      self->_timer = v5;

      dispatch_resume((dispatch_object_t)self->_timer);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", self, "volumesChanged:", CFSTR("com.apple.sharingd.VolumesChanged"), 0);

  }
}

- (void)stop
{
  int v2;
  NSObject *timer;
  OS_dispatch_source *v5;
  void *v6;
  NSDictionary *servers;
  NSDictionary *odiskServers;

  v2 = self->_clientCount - 1;
  self->_clientCount = v2;
  if (!v2)
  {
    timer = self->_timer;
    if (timer)
    {
      dispatch_source_cancel(timer);
      v5 = self->_timer;
      self->_timer = 0;

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "removeObserver:", self);

    servers = self->_servers;
    self->_servers = 0;

    odiskServers = self->_odiskServers;
    self->_odiskServers = 0;

    self->_recentsCount = 0;
    self->_connectedCount = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_odiskServers, 0);
  objc_storeStrong((id *)&self->_servers, 0);
}

@end
