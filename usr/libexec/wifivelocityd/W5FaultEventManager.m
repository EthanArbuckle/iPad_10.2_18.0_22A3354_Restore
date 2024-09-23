@implementation W5FaultEventManager

- (W5FaultEventManager)initWithPeerManager:(id)a3 diagnosticsModeManager:(id)a4
{
  id v7;
  id v8;
  W5FaultEventManager *v9;
  W5FaultEventManager *v10;
  W5PeerGenericRequestListener *v11;
  W5PeerGenericRequestListener *listener;
  W5PeerGenericRequestListener *v13;
  W5FaultEventManager *v14;
  NSObject *v15;
  uint64_t v17;
  const char *v18;
  _QWORD v19[4];
  NSObject *v20;
  W5FaultEventManager *v21;
  objc_super v22;
  int v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)W5FaultEventManager;
  v9 = -[W5FaultEventManager init](&v22, "init");
  v10 = v9;
  if (v9
    && (objc_storeStrong((id *)&v9->_peerManager, a3), v10->_peerManager)
    && (objc_storeStrong((id *)&v10->_diagnosticsModeManager, a4), v10->_diagnosticsModeManager)
    && (v11 = objc_alloc_init(W5PeerGenericRequestListener),
        listener = v10->_listener,
        v10->_listener = v11,
        listener,
        (v13 = v10->_listener) != 0))
  {
    -[W5PeerGenericRequestListener setIdentifier:](v13, "setIdentifier:", CFSTR("com.apple.wifi.peer.faults"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100080C70;
    v19[3] = &unk_1000D7340;
    v20 = v10;
    v14 = v20;
    v21 = v14;
    -[W5PeerGenericRequestListener setRequestHandler:](v10->_listener, "setRequestHandler:", v19);

    v15 = v20;
  }
  else
  {

    v17 = sub_10008F56C();
    v15 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 136315650;
      v24 = "-[W5FaultEventManager initWithPeerManager:diagnosticsModeManager:]";
      v25 = 2080;
      v26 = "W5FaultEventManager.m";
      v27 = 1024;
      v28 = 164;
      LODWORD(v18) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] %s (%s:%u) init error!", (const char *)&v23, v18, LODWORD(v19[0]));
    }
    v14 = 0;
  }

  return v14;
}

- (void)invalidate
{
  -[W5PeerGenericRequestListener invalidate](self->_listener, "invalidate");
}

- (void)startMonitoringFaultEventsForPeer:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  W5FaultEventManager *v8;
  W5PeerGenericRequest *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = objc_alloc_init(W5PeerGenericRequest);
  -[W5PeerGenericRequest setIdentifier:](v9, "setIdentifier:", CFSTR("com.apple.wifi.peer.faults"));
  -[W5PeerGenericRequest setPeer:](v9, "setPeer:", v6);
  -[W5PeerGenericRequest setDiscoveryFlags:](v9, "setDiscoveryFlags:", 1);
  -[W5PeerGenericRequest setControlFlags:](v9, "setControlFlags:", objc_msgSend(v6, "controlFlags"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &off_1000E3A50, CFSTR("Type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5FaultEventManager localPeer](v8, "localPeer"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("RequestPeer"));

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, CFSTR("ResponsePeer"));
  -[W5PeerGenericRequest setRequestInfo:](v9, "setRequestInfo:", v10);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000814F4;
  v15[3] = &unk_1000D7368;
  v15[4] = v8;
  v12 = v6;
  v16 = v12;
  v13 = v7;
  v17 = v13;
  -[W5PeerGenericRequest setResponseHandler:](v9, "setResponseHandler:", v15);
  v14 = -[W5PeerManager sendRequest:](v8->_peerManager, "sendRequest:", v9);

  objc_sync_exit(v8);
}

- (void)stopMonitoringFaultEventsForPeer:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  W5FaultEventManager *v8;
  W5PeerGenericRequest *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[NSCountedSet removeObject:](v8->_monitoringPeers, "removeObject:", v6);
  if (!-[NSCountedSet countForObject:](v8->_monitoringPeers, "countForObject:", v6))
  {
    v9 = objc_alloc_init(W5PeerGenericRequest);
    -[W5PeerGenericRequest setIdentifier:](v9, "setIdentifier:", CFSTR("com.apple.wifi.peer.faults"));
    -[W5PeerGenericRequest setPeer:](v9, "setPeer:", v6);
    -[W5PeerGenericRequest setDiscoveryFlags:](v9, "setDiscoveryFlags:", 1);
    -[W5PeerGenericRequest setControlFlags:](v9, "setControlFlags:", objc_msgSend(v6, "controlFlags"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &off_1000E3A68, CFSTR("Type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5FaultEventManager localPeer](v8, "localPeer"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("RequestPeer"));

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, CFSTR("ResponsePeer"));
    -[W5PeerGenericRequest setRequestInfo:](v9, "setRequestInfo:", v10);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10008178C;
    v13[3] = &unk_1000D7390;
    v14 = v7;
    -[W5PeerGenericRequest setResponseHandler:](v9, "setResponseHandler:", v13);
    v12 = -[W5PeerManager sendRequest:](v8->_peerManager, "sendRequest:", v9);

  }
  objc_sync_exit(v8);

}

- (void)queryFaultEventCacheForPeer:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  W5PeerGenericRequest *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(W5PeerGenericRequest);
  -[W5PeerGenericRequest setIdentifier:](v8, "setIdentifier:", CFSTR("com.apple.wifi.peer.faults"));
  -[W5PeerGenericRequest setPeer:](v8, "setPeer:", v7);
  -[W5PeerGenericRequest setDiscoveryFlags:](v8, "setDiscoveryFlags:", 1);
  -[W5PeerGenericRequest setControlFlags:](v8, "setControlFlags:", objc_msgSend(v7, "controlFlags"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &off_1000E3A80, CFSTR("Type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5FaultEventManager localPeer](self, "localPeer"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("RequestPeer"));

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("ResponsePeer"));
  -[W5PeerGenericRequest setRequestInfo:](v8, "setRequestInfo:", v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100081918;
  v13[3] = &unk_1000D7390;
  v14 = v6;
  v11 = v6;
  -[W5PeerGenericRequest setResponseHandler:](v8, "setResponseHandler:", v13);
  v12 = -[W5PeerManager sendRequest:](self->_peerManager, "sendRequest:", v8);

}

- (void)__archiveNotifyPeers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  unsigned __int8 v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  int v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.wifi.logs")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("FaultEventNotifyPeers")));

  v6 = -[NSMutableSet copy](self->_notifyPeers, "copy");
  v14 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v14));
  v8 = v14;

  if (!v7)
  {
    v12 = sub_10008F56C();
    v11 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v8;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v11, 0, "[wifivelocity] FAILED to archive notify peers, returned error (%{public}@)", &v15, 12);
    }
    goto LABEL_7;
  }

  v13 = 0;
  v9 = objc_msgSend(v7, "writeToURL:options:error:", v5, 1, &v13);
  v8 = v13;
  if ((v9 & 1) == 0)
  {
    v10 = sub_10008F56C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v8;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v11, 0, "[wifivelocity] FAILED to write notify peers to URL, returned error (%{public}@)", &v15, 12);
    }
LABEL_7:

  }
}

- (void)__unarchiveNotifyPeers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSSet *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  int v18;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.wifi.logs")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("FaultEventNotifyPeers")));

  v6 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfURL:", v5);
  if (objc_msgSend(v6, "length"))
  {
    v8 = objc_opt_class(NSSet, v7);
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(W5Peer, v9), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v17 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v11, v6, &v17));
    v13 = v17;

    if (v12)
    {
      -[NSMutableSet unionSet:](self->_notifyPeers, "unionSet:", v12);
    }
    else
    {
      v14 = sub_10008F56C();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138543362;
        v19 = v13;
        LODWORD(v16) = 12;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] FAILED to unarchive notify peers from URL, returned error (%{public}@)", &v18, v16);
      }

    }
  }

}

- (void)__archiveEventCache
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  unsigned __int8 v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  int v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.wifi.logs")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("FaultEventCache")));

  v6 = -[NSMutableOrderedSet copy](self->_faultEventCache, "copy");
  v14 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v14));
  v8 = v14;

  if (!v7)
  {
    v12 = sub_10008F56C();
    v11 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v8;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v11, 0, "[wifivelocity] FAILED to archive event cache, returned error (%{public}@)", &v15, 12);
    }
    goto LABEL_7;
  }

  v13 = 0;
  v9 = objc_msgSend(v7, "writeToURL:options:error:", v5, 1, &v13);
  v8 = v13;
  if ((v9 & 1) == 0)
  {
    v10 = sub_10008F56C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v8;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v11, 0, "[wifivelocity] FAILED to write event cache to URL, returned error (%{public}@)", &v15, 12);
    }
LABEL_7:

  }
}

- (void)__unarchiveEventCache
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSSet *v10;
  void *v11;
  void *v12;
  id v13;
  NSMutableOrderedSet *faultEventCache;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  int v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.wifi.logs")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("FaultEventCache")));

  v6 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfURL:", v5);
  if (objc_msgSend(v6, "length"))
  {
    v8 = objc_opt_class(NSOrderedSet, v7);
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(W5Event, v9), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v18 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v11, v6, &v18));
    v13 = v18;

    if (v12)
    {
      faultEventCache = self->_faultEventCache;
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "set"));
      -[NSMutableOrderedSet unionSet:](faultEventCache, "unionSet:", v15);
    }
    else
    {
      v16 = sub_10008F56C();
      v15 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138543362;
        v20 = v13;
        LODWORD(v17) = 12;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] FAILED to unarchive event cache from URL, returned error (%{public}@)", &v19, v17);
      }
    }

  }
}

- (void)__purgeObsoleteFaultEvents
{
  void *v2;
  id v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;
  double v20;
  void *v21;
  void *v23;
  void *v24;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](self->_faultEventCache, "array"));
  v3 = objc_msgSend(v2, "mutableCopy");

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v5 = v4;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:comparator:](NSSortDescriptor, "sortDescriptorWithKey:ascending:comparator:", 0, 0, &stru_1000D73D0));
  v24 = v21;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  objc_msgSend(v3, "sortUsingDescriptors:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCountedSet set](NSCountedSet, "set"));
  if (objc_msgSend(v3, "count"))
  {
    v9 = 0;
    v23 = v7;
    do
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v9));
      objc_msgSend(v10, "timestamp");
      if (v5 - v11 <= 86400.0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "peer"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "peerID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "info"));
        v15 = v8;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("FaultType")));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v13, v16));

        v8 = v15;
        v18 = objc_msgSend(v15, "countForObject:", v17);
        if (v18 && ((v19 = (unint64_t)v18, objc_msgSend(v10, "timestamp"), v5 - v20 > 3600.0) || v19 >= 0xA))
        {
          v7 = v23;
          objc_msgSend(v23, "addIndex:", v9);
        }
        else
        {
          objc_msgSend(v15, "addObject:", v17);
          v7 = v23;
        }

      }
      else
      {
        objc_msgSend(v7, "addIndex:", v9);
      }

      ++v9;
    }
    while (v9 < (unint64_t)objc_msgSend(v3, "count"));
  }
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v3, "removeObjectsAtIndexes:", v7);
  if ((unint64_t)objc_msgSend(v3, "count") >= 0x65)
    objc_msgSend(v3, "removeObjectsInRange:", 100, (char *)objc_msgSend(v3, "count") - 100);
  -[NSMutableOrderedSet removeAllObjects](self->_faultEventCache, "removeAllObjects");
  -[NSMutableOrderedSet addObjectsFromArray:](self->_faultEventCache, "addObjectsFromArray:", v3);

}

- (void)__addFaultEvent:(id)a3
{
  id v4;
  NSMutableOrderedSet *faultEventCache;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *v7;
  id v8;

  v4 = a3;
  faultEventCache = self->_faultEventCache;
  v8 = v4;
  if (!faultEventCache)
  {
    v6 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet"));
    v7 = self->_faultEventCache;
    self->_faultEventCache = v6;

    -[W5FaultEventManager __unarchiveEventCache](self, "__unarchiveEventCache");
    v4 = v8;
    faultEventCache = self->_faultEventCache;
  }
  -[NSMutableOrderedSet addObject:](faultEventCache, "addObject:", v4);
  -[W5FaultEventManager __purgeObsoleteFaultEvents](self, "__purgeObsoleteFaultEvents");
  -[W5FaultEventManager __archiveEventCache](self, "__archiveEventCache");

}

- (void)notifyPeersWithFaultEvent:(id)a3 info:(id)a4
{
  id v6;
  W5FaultEventManager *v7;
  uint64_t v8;
  NSMutableSet *notifyPeers;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  _BOOL4 v20;
  NSMutableSet *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *j;
  void *v27;
  W5PeerGenericRequest *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  id v42;
  id obj;
  id v44;
  uint64_t v45;
  id v46;
  _QWORD v47[6];
  _QWORD v48[4];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  int v58;
  const char *v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  id v67;
  _BYTE v68[128];
  _BYTE v69[128];

  v6 = a3;
  v44 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (!v7->_notifyPeers)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    notifyPeers = v7->_notifyPeers;
    v7->_notifyPeers = (NSMutableSet *)v8;

    -[W5FaultEventManager __unarchiveNotifyPeers](v7, "__unarchiveNotifyPeers");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "info"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("FaultType")));
  v12 = objc_msgSend(v11, "integerValue");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5FaultEventManager diagnosticsModeManager](v7, "diagnosticsModeManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "registeredPeersForFaultType:", v12));

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v14;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "peer"));
        v20 = v19 == 0;

        if (v20)
        {
          v23 = sub_10008F56C();
          v22 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v58 = 136315906;
            v59 = "-[W5FaultEventManager notifyPeersWithFaultEvent:info:]";
            v60 = 2080;
            v61 = "W5FaultEventManager.m";
            v62 = 1024;
            v63 = 388;
            v64 = 2114;
            v65 = v18;
            LODWORD(v41) = 38;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v22, 0, "[wifivelocity] %s (%s:%u) [DM] nil W5Peer for peer='%{public}@'", &v58, v41);
          }
        }
        else
        {
          v21 = v7->_notifyPeers;
          v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "peer"));
          -[NSMutableSet addObject:](v21, "addObject:", v22);
        }

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
    }
    while (v15);
  }

  v53 = 0u;
  v51 = 0u;
  v52 = 0u;
  v50 = 0u;
  v24 = -[NSMutableSet copy](v7->_notifyPeers, "copy");
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
  if (v25)
  {
    v45 = *(_QWORD *)v51;
    v42 = v24;
    do
    {
      v46 = v25;
      for (j = 0; j != v46; j = (char *)j + 1)
      {
        if (*(_QWORD *)v51 != v45)
          objc_enumerationMutation(v42);
        v27 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)j);
        v28 = objc_alloc_init(W5PeerGenericRequest);
        -[W5PeerGenericRequest setIdentifier:](v28, "setIdentifier:", CFSTR("com.apple.wifi.peer.faults"));
        -[W5PeerGenericRequest setPeer:](v28, "setPeer:", v27);
        -[W5PeerGenericRequest setDiscoveryFlags:](v28, "setDiscoveryFlags:", 1);
        -[W5PeerGenericRequest setControlFlags:](v28, "setControlFlags:", 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        objc_msgSend(v29, "setObject:forKeyedSubscript:", &off_1000E3A98, CFSTR("Type"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[W5FaultEventManager localPeer](v7, "localPeer"));
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, CFSTR("RequestPeer"));

        objc_msgSend(v29, "setObject:forKeyedSubscript:", v27, CFSTR("ResponsePeer"));
        v31 = objc_msgSend(v6, "copy");
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "info"));
        if (v32)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "info"));
          v34 = objc_msgSend(v33, "mutableCopy");

        }
        else
        {
          v34 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        }

        v35 = (void *)objc_claimAutoreleasedReturnValue(-[W5FaultEventManager diagnosticsModeManager](v7, "diagnosticsModeManager"));
        v36 = objc_msgSend(v35, "registeredRoleForPeer:", v27) == (id)16;

        if (v36)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "peerID"));
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v37, CFSTR("RemoteListener"));

          if (v44)
          {
            v48[0] = _NSConcreteStackBlock;
            v48[1] = 3221225472;
            v48[2] = sub_100082B48;
            v48[3] = &unk_1000D73F8;
            v49 = v34;
            objc_msgSend(v44, "enumerateKeysAndObjectsUsingBlock:", v48);

          }
        }
        objc_msgSend(v31, "setInfo:", v34);
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v31, CFSTR("Event"));
        -[W5PeerGenericRequest setRequestInfo:](v28, "setRequestInfo:", v29);
        v38 = sub_10008F56C();
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v58 = 136316162;
          v59 = "-[W5FaultEventManager notifyPeersWithFaultEvent:info:]";
          v60 = 2080;
          v61 = "W5FaultEventManager.m";
          v62 = 1024;
          v63 = 424;
          v64 = 2112;
          v65 = v27;
          v66 = 2112;
          v67 = v31;
          LODWORD(v41) = 48;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v39, 0, "[wifivelocity] %s (%s:%u) Notifying peer: %@ for event: %@", &v58, v41);
        }

        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_100082B54;
        v47[3] = &unk_1000D7420;
        v47[4] = v7;
        v47[5] = v27;
        -[W5PeerGenericRequest setResponseHandler:](v28, "setResponseHandler:", v47);
        v40 = -[W5PeerManager sendRequest:](v7->_peerManager, "sendRequest:", v28);

      }
      v24 = v42;
      v25 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
    }
    while (v25);
  }

  objc_sync_exit(v7);
}

- (void)submitFaultEvent:(id)a3
{
  W5FaultEventManager *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5FaultEventManager localPeer](v4, "localPeer"));
  objc_msgSend(v7, "setPeer:", v5);

  -[W5FaultEventManager __addFaultEvent:](v4, "__addFaultEvent:", v7);
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[W5FaultEventManager faultEventHandler](v4, "faultEventHandler"));
  ((void (**)(_QWORD, id))v6)[2](v6, v7);

  objc_sync_exit(v4);
}

- (id)faultEventCache
{
  W5FaultEventManager *v2;
  uint64_t v3;
  NSMutableOrderedSet *faultEventCache;
  id v5;
  void *v6;
  id v7;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_faultEventCache)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet"));
    faultEventCache = v2->_faultEventCache;
    v2->_faultEventCache = (NSMutableOrderedSet *)v3;

    -[W5FaultEventManager __unarchiveEventCache](v2, "__unarchiveEventCache");
  }
  -[W5FaultEventManager __purgeObsoleteFaultEvents](v2, "__purgeObsoleteFaultEvents");
  if (v2->_faultEventCache)
  {
    v5 = objc_alloc((Class)NSArray);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v2->_faultEventCache, "array"));
    v7 = objc_msgSend(v5, "initWithArray:copyItems:", v6, 1);

  }
  else
  {
    v7 = 0;
  }
  objc_sync_exit(v2);

  return v7;
}

- (id)faultEventHandler
{
  return self->_faultEventHandler;
}

- (void)setFaultEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (W5Peer)localPeer
{
  return self->_localPeer;
}

- (void)setLocalPeer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (W5PeerGenericRequestListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (W5PeerManager)peerManager
{
  return self->_peerManager;
}

- (void)setPeerManager:(id)a3
{
  objc_storeStrong((id *)&self->_peerManager, a3);
}

- (W5DiagnosticsModeManager)diagnosticsModeManager
{
  return self->_diagnosticsModeManager;
}

- (void)setDiagnosticsModeManager:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticsModeManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticsModeManager, 0);
  objc_storeStrong((id *)&self->_peerManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_localPeer, 0);
  objc_storeStrong(&self->_faultEventHandler, 0);
  objc_storeStrong((id *)&self->_monitoringPeers, 0);
  objc_storeStrong((id *)&self->_notifyPeers, 0);
  objc_storeStrong((id *)&self->_faultEventCache, 0);
}

@end
