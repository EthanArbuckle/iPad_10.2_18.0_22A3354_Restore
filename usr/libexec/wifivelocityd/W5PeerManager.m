@implementation W5PeerManager

- (W5PeerManager)init
{
  W5PeerManager *v2;
  NSMutableSet *v3;
  NSMutableSet *discoveryRequests;
  NSMutableSet *v5;
  NSMutableSet *activePeers;
  NSString *localIDSIdentifier;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v14;
  const char *v15;
  objc_super v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;

  v16.receiver = self;
  v16.super_class = (Class)W5PeerManager;
  v2 = -[W5PeerManager init](&v16, "init");
  if (!v2)
    goto LABEL_11;
  v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  discoveryRequests = v2->_discoveryRequests;
  v2->_discoveryRequests = v3;

  if (!v2->_discoveryRequests
    || (v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet),
        activePeers = v2->_activePeers,
        v2->_activePeers = v5,
        activePeers,
        !v2->_activePeers))
  {
LABEL_11:

    v14 = sub_10008F56C();
    v12 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315650;
      v18 = "-[W5PeerManager init]";
      v19 = 2080;
      v20 = "W5PeerManager.m";
      v21 = 1024;
      v22 = 61;
      LODWORD(v15) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] %s (%s:%u) init error!", (const char *)&v17, v15, LODWORD(v16.receiver));
    }
    v2 = 0;
    goto LABEL_9;
  }
  localIDSIdentifier = v2->_localIDSIdentifier;
  v2->_localIDSIdentifier = 0;

  if (objc_opt_class(IDSService, v8))
  {
    v9 = IDSCopyLocalDeviceUniqueID();
    v10 = v2->_localIDSIdentifier;
    v2->_localIDSIdentifier = (NSString *)v9;

  }
  if (!v2->_localIDSIdentifier)
  {
    v11 = sub_10008F56C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315650;
      v18 = "-[W5PeerManager init]";
      v19 = 2080;
      v20 = "W5PeerManager.m";
      v21 = 1024;
      v22 = 53;
      LODWORD(v15) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] %s (%s:%u) no local IDS device identifier", (const char *)&v17, v15, LODWORD(v16.receiver));
    }
LABEL_9:

  }
  return v2;
}

- (BOOL)registerPeerListeners:(id)a3
{
  id v4;
  W5RapportServer *v5;
  W5RapportServer *rapportServer;
  BOOL v7;
  uint64_t v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;

  v4 = a3;
  v5 = -[W5RapportServer initWithRequestListeners:]([W5RapportServer alloc], "initWithRequestListeners:", v4);

  rapportServer = self->_rapportServer;
  self->_rapportServer = v5;

  v7 = -[W5PeerManager _setupRapportClient](self, "_setupRapportClient");
  if (!v7)
  {
    v9 = sub_10008F56C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315650;
      v12 = "-[W5PeerManager registerPeerListeners:]";
      v13 = 2080;
      v14 = "W5PeerManager.m";
      v15 = 1024;
      v16 = 70;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) failed to setup rapport client", (const char *)&v11, 28);
    }

  }
  return v7;
}

- (id)startPeerDiscoveryWithRequest:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  NSErrorUserInfoKey v19;
  const __CFString *v20;
  int v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager discoveryRequests](self, "discoveryRequests"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  v7 = sub_10008F56C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      v21 = 136315906;
      v22 = "-[W5PeerManager startPeerDiscoveryWithRequest:]";
      v23 = 2080;
      v24 = "W5PeerManager.m";
      v25 = 1024;
      v26 = 81;
      v27 = 2114;
      v28 = v4;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) discovery request already exists for request='%{public}@'", &v21, 38);
    }

    v19 = NSLocalizedFailureReasonErrorKey;
    v20 = CFSTR("W5NotPermittedErr");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 5, v10));
LABEL_13:

    goto LABEL_14;
  }
  if (v9)
  {
    v21 = 136315906;
    v22 = "-[W5PeerManager startPeerDiscoveryWithRequest:]";
    v23 = 2080;
    v24 = "W5PeerManager.m";
    v25 = 1024;
    v26 = 85;
    v27 = 2114;
    v28 = v4;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) starting discovery for request='%{public}@'", &v21, 38);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager discoveryRequests](self, "discoveryRequests"));
  objc_msgSend(v12, "addObject:", v4);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  v14 = objc_msgSend(v13, "discoveryFlags");

  if ((v14 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager rapportClient](self, "rapportClient"));
    objc_msgSend(v15, "startDiscoveringDevices");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager activePeers](self, "activePeers"));
    if (v11)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager _activePeersWithDiscoveryFlags:](self, "_activePeersWithDiscoveryFlags:", 1));
      if (objc_msgSend(v10, "count"))
      {
        v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handler"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));
        ((void (**)(_QWORD, void *, _QWORD))v16)[2](v16, v17, 0);

      }
      v11 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)stopPeerDiscoveryWithRequestUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  NSErrorUserInfoKey v23;
  const __CFString *v24;
  int v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];

  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager discoveryRequests](self, "discoveryRequests"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uuid"));
      v12 = objc_msgSend(v11, "isEqual:", v4);

      if ((v12 & 1) != 0)
        break;
      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v33, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v10;

    if (!v13)
      goto LABEL_12;
    v14 = objc_claimAutoreleasedReturnValue(-[W5PeerManager _stopPeerDiscoveryWithRequest:](self, "_stopPeerDiscoveryWithRequest:", v13));
  }
  else
  {
LABEL_9:

LABEL_12:
    v15 = sub_10008F56C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 136315906;
      v26 = "-[W5PeerManager stopPeerDiscoveryWithRequestUUID:]";
      v27 = 2080;
      v28 = "W5PeerManager.m";
      v29 = 1024;
      v30 = 117;
      v31 = 2114;
      v32 = v4;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] %s (%s:%u) no existing discovery request matching UUID='%{public}@'", &v25, 38);
    }

    v23 = NSLocalizedFailureReasonErrorKey;
    v24 = CFSTR("W5ParamErr");
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    v14 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v13));
  }
  v17 = (void *)v14;

  return v17;
}

- (id)_stopPeerDiscoveryWithRequest:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  const char *v22;
  NSErrorUserInfoKey v23;
  const __CFString *v24;
  int v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager discoveryRequests](self, "discoveryRequests"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    v13 = sub_10008F56C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 136315906;
      v26 = "-[W5PeerManager _stopPeerDiscoveryWithRequest:]";
      v27 = 2080;
      v28 = "W5PeerManager.m";
      v29 = 1024;
      v30 = 127;
      v31 = 2114;
      v32 = v4;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s (%s:%u) no existing discovery request for request='%{public}@'", &v25, 38);
    }

    v23 = NSLocalizedFailureReasonErrorKey;
    v24 = CFSTR("W5NotPermittedErr");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 5, v15));
    goto LABEL_16;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager discoveryRequests](self, "discoveryRequests"));
  objc_msgSend(v7, "removeObject:", v4);

  v8 = -[W5PeerManager _discoveryRequestsContainsRapportRequest](self, "_discoveryRequestsContainsRapportRequest");
  v9 = sub_10008F56C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) != 0)
  {
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager discoveryRequests](self, "discoveryRequests"));
      v25 = 136315906;
      v26 = "-[W5PeerManager _stopPeerDiscoveryWithRequest:]";
      v27 = 2080;
      v28 = "W5PeerManager.m";
      v29 = 1024;
      v30 = 138;
      v31 = 2114;
      v32 = v12;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) existing rapport discovery requests, not stopping discovery (requests='%{public}@')", &v25, 38);

    }
  }
  else
  {
    if (v11)
    {
      v25 = 136315650;
      v26 = "-[W5PeerManager _stopPeerDiscoveryWithRequest:]";
      v27 = 2080;
      v28 = "W5PeerManager.m";
      v29 = 1024;
      v30 = 135;
      LODWORD(v22) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) no remaining rapport discovery requests, stopping discovery", (const char *)&v25, v22, (_DWORD)v23);
    }

    v10 = objc_claimAutoreleasedReturnValue(-[W5PeerManager rapportClient](self, "rapportClient"));
    -[NSObject stopDiscoveryingDevices](v10, "stopDiscoveryingDevices");
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager discoveryRequests](self, "discoveryRequests"));
  v18 = objc_msgSend(v17, "count");

  if (!v18)
  {
    v19 = sub_10008F56C();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 136315650;
      v26 = "-[W5PeerManager _stopPeerDiscoveryWithRequest:]";
      v27 = 2080;
      v28 = "W5PeerManager.m";
      v29 = 1024;
      v30 = 143;
      LODWORD(v22) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v20, 0, "[wifivelocity] %s (%s:%u) no remaining discovery requests, clearing active peers", (const char *)&v25, v22, (_DWORD)v23);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager activePeers](self, "activePeers"));
    objc_msgSend(v15, "removeAllObjects");
    v16 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v16 = 0;
LABEL_17:

  return v16;
}

- (void)_newPeersDiscovered:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  unint64_t v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  uint64_t v31;
  const char *v32;
  int v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  int v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  _BYTE v54[128];

  v4 = a3;
  v5 = objc_msgSend(v4, "mutableCopy");
  v6 = sub_10008F56C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager activePeers](self, "activePeers"));
    v43 = 136315906;
    v44 = "-[W5PeerManager _newPeersDiscovered:]";
    v45 = 2080;
    v46 = "W5PeerManager.m";
    v47 = 1024;
    v48 = 156;
    v49 = 2114;
    v50 = v8;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v7, 0, "[wifivelocity] %s (%s:%u) self.activePeers='%{public}@'", &v43, 38);

  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v54, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v40;
    v33 = 136315906;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager activePeers](self, "activePeers"));
        v16 = objc_msgSend(v15, "containsObject:", v14);

        if (v16)
        {
          v17 = sub_10008F56C();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v43 = 136315906;
            v44 = "-[W5PeerManager _newPeersDiscovered:]";
            v45 = 2080;
            v46 = "W5PeerManager.m";
            v47 = 1024;
            v48 = 159;
            v49 = 2114;
            v50 = v14;
            LODWORD(v32) = 38;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v18, 0, "[wifivelocity] %s (%s:%u) peer='%{public}@' already discovered", &v43, v32);
          }

          objc_msgSend(v5, "removeObject:", v14);
        }
        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager activePeers](self, "activePeers"));
          objc_msgSend(v19, "addObject:", v14);

          v11 |= (unint64_t)objc_msgSend(v14, "discoveryFlags");
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v54, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  if (objc_msgSend(v5, "count"))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v20 = objc_claimAutoreleasedReturnValue(-[W5PeerManager discoveryRequests](self, "discoveryRequests"));
    v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v35, v53, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(_QWORD *)v36 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j);
          v26 = sub_10008F56C();
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v43 = 136316162;
            v44 = "-[W5PeerManager _newPeersDiscovered:]";
            v45 = 2080;
            v46 = "W5PeerManager.m";
            v47 = 1024;
            v48 = 174;
            v49 = 2114;
            v50 = v25;
            v51 = 2114;
            v52 = v5;
            LODWORD(v32) = 48;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v27, 0, "[wifivelocity] %s (%s:%u) notify request='%{public}@' of peers found='%{public}@'", &v43, v32);
          }

          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "configuration"));
          v29 = (unint64_t)objc_msgSend(v28, "discoveryFlags") & v11;

          if (v29)
          {
            v30 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "handler"));
            ((void (**)(_QWORD, id, _QWORD))v30)[2](v30, v5, 0);

          }
        }
        v22 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v35, v53, 16);
      }
      while (v22);
    }
  }
  else
  {
    v31 = sub_10008F56C();
    v20 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v43 = 136315650;
      v44 = "-[W5PeerManager _newPeersDiscovered:]";
      v45 = 2080;
      v46 = "W5PeerManager.m";
      v47 = 1024;
      v48 = 168;
      LODWORD(v32) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v20, 0, "[wifivelocity] %s (%s:%u) no new peers discovered", (const char *)&v43, v32, v33);
    }
  }

}

- (void)_peersLost:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  unint64_t v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  int v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];
  _BYTE v51[128];

  v4 = a3;
  v5 = sub_10008F56C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager activePeers](self, "activePeers"));
    v40 = 136315906;
    v41 = "-[W5PeerManager _peersLost:]";
    v42 = 2080;
    v43 = "W5PeerManager.m";
    v44 = 1024;
    v45 = 185;
    v46 = 2114;
    v47 = v7;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) self.activePeers='%{public}@'", &v40, 38);

  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager activePeers](self, "activePeers"));
        v16 = objc_msgSend(v15, "containsObject:", v14);

        if (v16)
        {
          v17 = sub_10008F56C();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v40 = 136315906;
            v41 = "-[W5PeerManager _peersLost:]";
            v42 = 2080;
            v43 = "W5PeerManager.m";
            v44 = 1024;
            v45 = 188;
            v46 = 2114;
            v47 = v14;
            LODWORD(v31) = 38;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v18, 0, "[wifivelocity] %s (%s:%u) lost peer='%{public}@'", &v40, v31);
          }

          v19 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager activePeers](self, "activePeers"));
          objc_msgSend(v19, "removeObject:", v14);

          v11 |= (unint64_t)objc_msgSend(v14, "discoveryFlags");
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager discoveryRequests](self, "discoveryRequests"));
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v50, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j);
        v26 = sub_10008F56C();
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v40 = 136316162;
          v41 = "-[W5PeerManager _peersLost:]";
          v42 = 2080;
          v43 = "W5PeerManager.m";
          v44 = 1024;
          v45 = 196;
          v46 = 2114;
          v47 = v25;
          v48 = 2114;
          v49 = v8;
          LODWORD(v31) = 48;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v27, 0, "[wifivelocity] %s (%s:%u) notify request='%{public}@' of peers lost='%{public}@'", &v40, v31);
        }

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "configuration"));
        v29 = (unint64_t)objc_msgSend(v28, "discoveryFlags") & v11;

        if (v29)
        {
          v30 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "handler"));
          ((void (**)(_QWORD, _QWORD, id))v30)[2](v30, 0, v8);

        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v50, 16);
    }
    while (v22);
  }

}

- (id)_activePeersWithDiscoveryFlags:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF.discoveryFlags == %d"), a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF.discoveryFlags == %d"), a3 | 2, v5));
  v12[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager activePeers](self, "activePeers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredSetUsingPredicate:", v8));

  return v10;
}

- (id)queryStatusForPeerWithRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "discoveryFlags") == (id)1)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager _sendRapportRequest:](self, "_sendRapportRequest:", v4));
  else
    v5 = 0;

  return v5;
}

- (id)requestFileFromPeerWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSErrorUserInfoKey v14;
  const __CFString *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  if (objc_msgSend(v4, "discoveryFlags") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "companionLinkDevice"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager rapportClient](self, "rapportClient"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sendMessageToDevice:request:", v6, v4));
    }
    else
    {
      v10 = sub_10008F56C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peer"));
        v16 = 136315906;
        v17 = "-[W5PeerManager requestFileFromPeerWithRequest:]";
        v18 = 2080;
        v19 = "W5PeerManager.m";
        v20 = 1024;
        v21 = 236;
        v22 = 2114;
        v23 = v12;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v11, 0, "[wifivelocity] %s (%s:%u) no rapport device found for peer='%{public}@'", &v16, 38);

      }
      v14 = NSLocalizedFailureReasonErrorKey;
      v15 = CFSTR("W5ParamErr");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
      v8 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v7));
    }
    v9 = (void *)v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)runSnifferAtPeerWithRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "discoveryFlags") == (id)1)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager _sendRapportRequest:](self, "_sendRapportRequest:", v4));
  else
    v5 = 0;

  return v5;
}

- (id)sendDebugConfigurationForPeerWithRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "discoveryFlags") == (id)1)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager _sendRapportRequest:](self, "_sendRapportRequest:", v4));
  else
    v5 = 0;

  return v5;
}

- (id)runDiagnosticsOnPeerWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSErrorUserInfoKey v14;
  const __CFString *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  if (objc_msgSend(v4, "discoveryFlags") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "companionLinkDevice"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager rapportClient](self, "rapportClient"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sendMessageToDevice:request:", v6, v4));
    }
    else
    {
      v10 = sub_10008F56C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peer"));
        v16 = 136315906;
        v17 = "-[W5PeerManager runDiagnosticsOnPeerWithRequest:]";
        v18 = 2080;
        v19 = "W5PeerManager.m";
        v20 = 1024;
        v21 = 282;
        v22 = 2114;
        v23 = v12;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v11, 0, "[wifivelocity] %s (%s:%u) no rapport device found for peer='%{public}@'", &v16, 38);

      }
      v14 = NSLocalizedFailureReasonErrorKey;
      v15 = CFSTR("W5ParamErr");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
      v8 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v7));
    }
    v9 = (void *)v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)queryDatabaseForPeerWithRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "discoveryFlags") == (id)1)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager _sendRapportRequest:](self, "_sendRapportRequest:", v4));
  else
    v5 = 0;

  return v5;
}

- (id)_sendRapportRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSErrorUserInfoKey v14;
  const __CFString *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "companionLinkDevice"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager rapportClient](self, "rapportClient"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sendMessageToDevice:request:", v6, v4));
  }
  else
  {
    v9 = sub_10008F56C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peer"));
      v16 = 136315906;
      v17 = "-[W5PeerManager _sendRapportRequest:]";
      v18 = 2080;
      v19 = "W5PeerManager.m";
      v20 = 1024;
      v21 = 312;
      v22 = 2114;
      v23 = v11;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) no rapport device found for peer='%{public}@'", &v16, 38);

    }
    v14 = NSLocalizedFailureReasonErrorKey;
    v15 = CFSTR("W5ParamErr");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v8 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v7));
  }
  v12 = (void *)v8;

  return v12;
}

- (BOOL)_setupRapportClient
{
  W5RapportClient *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = objc_alloc_init(W5RapportClient);
  -[W5PeerManager setRapportClient:](self, "setRapportClient:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager rapportClient](self, "rapportClient"));
  if (v4)
  {
    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10008B204;
    v10[3] = &unk_1000D6970;
    objc_copyWeak(&v11, &location);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager rapportClient](self, "rapportClient"));
    objc_msgSend(v5, "setDeviceFoundHandler:", v10);

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10008B24C;
    v8[3] = &unk_1000D6970;
    objc_copyWeak(&v9, &location);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager rapportClient](self, "rapportClient"));
    objc_msgSend(v6, "setDeviceLostHandler:", v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v4 != 0;
}

- (void)_handleRapportDeviceFound:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)W5Peer), "initWithCompanionLinkDevice:", v4);

  v7 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  -[W5PeerManager _newPeersDiscovered:](self, "_newPeersDiscovered:", v6);

}

- (void)_handleRapportDeviceLost:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)W5Peer), "initWithCompanionLinkDevice:", v4);

  v7 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  -[W5PeerManager _peersLost:](self, "_peersLost:", v6);

}

- (BOOL)_discoveryRequestsContainsRapportRequest
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  unsigned __int8 v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager discoveryRequests](self, "discoveryRequests", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "configuration"));
        v7 = objc_msgSend(v6, "discoveryFlags");

        if ((v7 & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (id)sendRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  NSErrorUserInfoKey v27;
  const __CFString *v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "companionLinkDevice"));

  v7 = sub_10008F56C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peer"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestInfo"));
      v17 = 136316162;
      v18 = "-[W5PeerManager sendRequest:]";
      v19 = 2080;
      v20 = "W5PeerManager.m";
      v21 = 1024;
      v22 = 372;
      v23 = 2114;
      v24 = v10;
      v25 = 2114;
      v26 = v11;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) SEND REQUEST (peer=%{public}@, info=%{public}@)", &v17, 48);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerManager rapportClient](self, "rapportClient"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sendMessageToDevice:request:", v6, v4));
  }
  else
  {
    if (v9)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peer"));
      v17 = 136315906;
      v18 = "-[W5PeerManager sendRequest:]";
      v19 = 2080;
      v20 = "W5PeerManager.m";
      v21 = 1024;
      v22 = 369;
      v23 = 2114;
      v24 = v14;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) no rapport device found for peer='%{public}@'", &v17, 38);

    }
    v27 = NSLocalizedFailureReasonErrorKey;
    v28 = CFSTR("W5ParamErr");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    v13 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v12));
  }
  v15 = (void *)v13;

  return v15;
}

- (NSString)localIDSIdentifier
{
  return self->_localIDSIdentifier;
}

- (void)setLocalIDSIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localIDSIdentifier, a3);
}

- (W5RapportClient)rapportClient
{
  return self->_rapportClient;
}

- (void)setRapportClient:(id)a3
{
  objc_storeStrong((id *)&self->_rapportClient, a3);
}

- (W5RapportServer)rapportServer
{
  return self->_rapportServer;
}

- (void)setRapportServer:(id)a3
{
  objc_storeStrong((id *)&self->_rapportServer, a3);
}

- (NSMutableSet)discoveryRequests
{
  return self->_discoveryRequests;
}

- (void)setDiscoveryRequests:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryRequests, a3);
}

- (NSMutableSet)activePeers
{
  return self->_activePeers;
}

- (void)setActivePeers:(id)a3
{
  objc_storeStrong((id *)&self->_activePeers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePeers, 0);
  objc_storeStrong((id *)&self->_discoveryRequests, 0);
  objc_storeStrong((id *)&self->_rapportServer, 0);
  objc_storeStrong((id *)&self->_rapportClient, 0);
  objc_storeStrong((id *)&self->_localIDSIdentifier, 0);
}

@end
