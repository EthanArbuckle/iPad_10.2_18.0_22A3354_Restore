@implementation W5DiagnosticsModeManager

- (W5DiagnosticsModeManager)initWithNetUsageManager:(id)a3 peerManager:(id)a4 userNotificationManager:(id)a5 snifferManager:(id)a6 statusManager:(id)a7 logManager:(id)a8
{
  id v15;
  id v16;
  id v17;
  W5DiagnosticsModeManager *v18;
  W5DiagnosticsModeStore *v19;
  W5DiagnosticsModeStore *store;
  W5DiagnosticsModeLocalStore *v21;
  W5DiagnosticsModeLocalStore *localStore;
  uint64_t v23;
  NSMutableArray *processors;
  uint64_t v25;
  NSMutableDictionary *lastNotificationTimestamp;
  void *faultEventManager;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v31 = a3;
  v15 = a4;
  v30 = a5;
  v16 = a6;
  v29 = a7;
  v17 = a8;
  v32.receiver = self;
  v32.super_class = (Class)W5DiagnosticsModeManager;
  v18 = -[W5DiagnosticsModeManager init](&v32, "init");
  objc_storeStrong((id *)&v18->_netUsageManager, a3);
  if (v15
    && (objc_storeStrong((id *)&v18->_peerManager, a4), v16)
    && (objc_storeStrong((id *)&v18->_snifferManager, a6), v17))
  {
    objc_storeStrong((id *)&v18->_logManager, a8);
    objc_storeStrong((id *)&v18->_userNotificationManager, a5);
    objc_storeStrong((id *)&v18->_statusManager, a7);
    v19 = objc_alloc_init(W5DiagnosticsModeStore);
    store = v18->_store;
    v18->_store = v19;

    v21 = objc_alloc_init(W5DiagnosticsModeLocalStore);
    localStore = v18->_localStore;
    v18->_localStore = v21;

    v23 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    processors = v18->_processors;
    v18->_processors = (NSMutableArray *)v23;

    v25 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    lastNotificationTimestamp = v18->_lastNotificationTimestamp;
    v18->_lastNotificationTimestamp = (NSMutableDictionary *)v25;

    faultEventManager = v18->_faultEventManager;
    v18->_faultEventManager = 0;
  }
  else
  {
    faultEventManager = v18;
    v18 = 0;
  }

  return v18;
}

- (void)startDiagnosticsModeWithConfiguration:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSErrorUserInfoKey v23;
  const __CFString *v24;
  NSErrorUserInfoKey v25;
  const __CFString *v26;
  int v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = sub_10008F56C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 136315906;
    v28 = "-[W5DiagnosticsModeManager startDiagnosticsModeWithConfiguration:reply:]";
    v29 = 2080;
    v30 = "W5DiagnosticsModeManager.m";
    v31 = 1024;
    v32 = 148;
    v33 = 2114;
    v34 = v6;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) [DM] starting with info='%{public}@'", &v27, 38);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Peers")));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localPeer](self, "localPeer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "peerID"));
    v13 = sub_100089160(v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    if (v14)
    {
      -[W5DiagnosticsModeManager _startDiagnosticsModeWithConfiguration:currentPeer:reply:](self, "_startDiagnosticsModeWithConfiguration:currentPeer:reply:", v6, v14, v7);
    }
    else
    {
      v18 = sub_10008F56C();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 136315906;
        v28 = "-[W5DiagnosticsModeManager startDiagnosticsModeWithConfiguration:reply:]";
        v29 = 2080;
        v30 = "W5DiagnosticsModeManager.m";
        v31 = 1024;
        v32 = 159;
        v33 = 2114;
        v34 = v10;
        LODWORD(v22) = 38;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v19, 0, "[wifivelocity] %s (%s:%u) [DM] missing current peer in peers list='%{public}@'", &v27, v22);
      }

      v23 = NSLocalizedFailureReasonErrorKey;
      v24 = CFSTR("W5ParamErr");
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v20));
      v7[2](v7, 0, v21);

      v14 = 0;
    }
  }
  else
  {
    v15 = sub_10008F56C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 136315906;
      v28 = "-[W5DiagnosticsModeManager startDiagnosticsModeWithConfiguration:reply:]";
      v29 = 2080;
      v30 = "W5DiagnosticsModeManager.m";
      v31 = 1024;
      v32 = 152;
      v33 = 2114;
      v34 = v6;
      LODWORD(v22) = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] %s (%s:%u) [DM] missing peers info='%{public}@'", &v27, v22);
    }

    v25 = NSLocalizedFailureReasonErrorKey;
    v26 = CFSTR("W5ParamErr");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v14));
    v7[2](v7, 0, v17);

  }
}

- (void)_startDiagnosticsModeWithConfiguration:(id)a3 currentPeer:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  W5DiagnosticsModeProcessor *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  W5DiagnosticsModeManager *v21;
  W5DiagnosticsModeProcessor *v22;
  id v23;
  _BYTE *v24;
  _BYTE v25[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  NSErrorUserInfoKey v29;
  const __CFString *v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_10008F56C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v25 = 136315394;
    *(_QWORD *)&v25[4] = "-[W5DiagnosticsModeManager _startDiagnosticsModeWithConfiguration:currentPeer:reply:]";
    *(_WORD *)&v25[12] = 2114;
    *(_QWORD *)&v25[14] = v8;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] %s: [DM] config='%{public}@'", v25, 22);
  }

  v13 = -[W5DiagnosticsModeProcessor initWithCurrentPeer:]([W5DiagnosticsModeProcessor alloc], "initWithCurrentPeer:", v9);
  if (v13)
  {
    -[NSMutableArray addObject:](self->_processors, "addObject:", v13);
    *(_QWORD *)v25 = 0;
    *(_QWORD *)&v25[8] = v25;
    *(_QWORD *)&v25[16] = 0x3032000000;
    v26 = sub_100003BC8;
    v27 = sub_100003BD8;
    v14 = (void *)os_transaction_create("_startDiagnosticsModeWithConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"));
    objc_msgSend(v15, "osTransactionCreate:transaction:", "_startDiagnosticsModeWithConfiguration", v14);

    v28 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager _actionHandler](self, "_actionHandler"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100003BE0;
    v19[3] = &unk_1000D4FF8;
    v23 = v10;
    v20 = v9;
    v21 = self;
    v22 = v13;
    v24 = v25;
    -[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:](v22, "performStartOperationsWithConfiguration:handler:completion:", v8, v16, v19);

    _Block_object_dispose(v25, 8);
  }
  else
  {
    v29 = NSLocalizedFailureReasonErrorKey;
    v30 = CFSTR("W5InternalErr");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 9, v17));
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v18);

  }
}

- (void)stopDiagnosticsModeWithUUID:(id)a3 info:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  W5DiagnosticsModeManager *v28;
  id v29;
  id v30;
  void (**v31)(id, void *);
  NSErrorUserInfoKey v32;
  const __CFString *v33;
  int v34;
  const char *v35;
  __int16 v36;
  id v37;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Peer")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager store](self, "store"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "diagnosticsModeMatchingUUID:", v8));

  if (!(v13 | v11))
  {
    v21 = sub_10008F56C();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v34 = 136315394;
      v35 = "-[W5DiagnosticsModeManager stopDiagnosticsModeWithUUID:info:reply:]";
      v36 = 2114;
      v37 = v8;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v22, 0, "[wifivelocity] %s: [DM] no mode matching UUID='%{public}@'", &v34, 22);
    }

    v32 = NSLocalizedFailureReasonErrorKey;
    v33 = CFSTR("W5ParamErr");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v18));
    v10[2](v10, v23);

    goto LABEL_11;
  }
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v13, "peers"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localPeer](self, "localPeer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "peerID"));
    v17 = sub_100089160(v14, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    v19 = objc_alloc((Class)W5DiagnosticsModePeer);
    if (v18)
      v20 = (uint64_t)objc_msgSend(v18, "role");
    else
      v20 = 8;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localPeer](self, "localPeer"));
    v25 = objc_msgSend(v19, "initWithRole:peer:", v20, v24);

    -[W5DiagnosticsModeManager _stopDiagnosticsMode:currentPeer:info:reply:](self, "_stopDiagnosticsMode:currentPeer:info:reply:", v13, v25, v9, v10);
LABEL_11:

    goto LABEL_12;
  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000413C;
  v26[3] = &unk_1000D5020;
  v27 = v8;
  v28 = self;
  v29 = v9;
  v31 = v10;
  v30 = (id)v11;
  -[W5DiagnosticsModeManager _queryDebugConfigurationForPeer:reply:](self, "_queryDebugConfigurationForPeer:reply:", v30, v26);

LABEL_12:
}

- (void)_stopDiagnosticsMode:(id)a3 currentPeer:(id)a4 info:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  W5DiagnosticsModeProcessor *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  W5DiagnosticsModeManager *v24;
  W5DiagnosticsModeProcessor *v25;
  id v26;
  _BYTE *v27;
  _BYTE v28[24];
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  NSErrorUserInfoKey v32;
  const __CFString *v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = sub_10008F56C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v28 = 136315394;
    *(_QWORD *)&v28[4] = "-[W5DiagnosticsModeManager _stopDiagnosticsMode:currentPeer:info:reply:]";
    *(_WORD *)&v28[12] = 2114;
    *(_QWORD *)&v28[14] = v10;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] %s: [DM] mode='%{public}@'", v28, 22);
  }

  v16 = -[W5DiagnosticsModeProcessor initWithCurrentPeer:]([W5DiagnosticsModeProcessor alloc], "initWithCurrentPeer:", v11);
  if (v16)
  {
    -[NSMutableArray addObject:](self->_processors, "addObject:", v16);
    *(_QWORD *)v28 = 0;
    *(_QWORD *)&v28[8] = v28;
    *(_QWORD *)&v28[16] = 0x3032000000;
    v29 = sub_100003BC8;
    v30 = sub_100003BD8;
    v17 = (void *)os_transaction_create("_stopDiagnosticsMode");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"));
    objc_msgSend(v18, "osTransactionCreate:transaction:", "_stopDiagnosticsMode", v17);

    v31 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager _actionHandler](self, "_actionHandler"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100004834;
    v22[3] = &unk_1000D4FF8;
    v26 = v13;
    v23 = v11;
    v24 = self;
    v25 = v16;
    v27 = v28;
    -[W5DiagnosticsModeProcessor performStopOperationsForMode:handler:completion:](v25, "performStopOperationsForMode:handler:completion:", v10, v19, v22);

    _Block_object_dispose(v28, 8);
  }
  else
  {
    v32 = NSLocalizedFailureReasonErrorKey;
    v33 = CFSTR("W5InternalErr");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 9, v20));
    (*((void (**)(id, void *))v13 + 2))(v13, v21);

  }
}

- (void)_queryDebugConfigurationForPeer:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  W5PeerDebugConfigurationRequest *v8;
  id v9;
  W5PeerDebugConfigurationRequest *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = [W5PeerDebugConfigurationRequest alloc];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004B98;
  v13[3] = &unk_1000D5048;
  v9 = v6;
  v14 = v9;
  v10 = -[W5PeerDebugConfigurationRequest initWithPeer:type:debugConfiguration:reply:](v8, "initWithPeer:type:debugConfiguration:reply:", v7, 1, 0, v13);

  v11 = objc_claimAutoreleasedReturnValue(-[W5PeerManager sendDebugConfigurationForPeerWithRequest:](self->_peerManager, "sendDebugConfigurationForPeerWithRequest:", v10));
  v12 = (void *)v11;
  if (v9 && v11)
    (*((void (**)(id, _QWORD, uint64_t))v9 + 2))(v9, 0, v11);

}

- (void)updateDiagnosticsMode:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, id);
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  NSObject *v37;
  _BOOL4 v38;
  uint64_t v39;
  NSObject *v40;
  char *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  const char *v50;
  int v51;
  W5DiagnosticsModeManager *v52;
  void (**v53)(id, id);
  void *v54;
  _QWORD v55[4];
  NSObject *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  NSErrorUserInfoKey v61;
  const __CFString *v62;
  int v63;
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  id v74;
  _BYTE v75[128];
  NSErrorUserInfoKey v76;
  const __CFString *v77;
  NSErrorUserInfoKey v78;
  const __CFString *v79;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = sub_10008F56C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v63 = 136316162;
    v64 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
    v65 = 2080;
    v66 = "W5DiagnosticsModeManager.m";
    v67 = 1024;
    v68 = 310;
    v69 = 2080;
    v70 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
    v71 = 2114;
    v72 = v6;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) %s: [DM] incoming update mode='%{public}@'", &v63, 48);
  }

  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localPeer](self, "localPeer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "peerID"));
    v13 = sub_100089160(v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    if (!v14)
    {
      v39 = sub_10008F56C();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peers"));
        v63 = 136315906;
        v64 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
        v65 = 2080;
        v66 = "W5DiagnosticsModeManager.m";
        v67 = 1024;
        v68 = 320;
        v69 = 2114;
        v70 = v41;
        LODWORD(v50) = 38;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v40, 0, "[wifivelocity] %s (%s:%u) [DM] missing current peer in peers list='%{public}@'", &v63, v50);

      }
      v76 = NSLocalizedFailureReasonErrorKey;
      v77 = CFSTR("W5ParamErr");
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1));
      v26 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v25));
      v7[2](v7, v26);
      goto LABEL_36;
    }
    v53 = v7;
    v54 = v6;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v52 = self;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager activeDiagnostics](self, "activeDiagnostics"));
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v58;
LABEL_7:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v58 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "peers"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "peer"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "peerID"));
        v24 = sub_100089160(v21, v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

        if (v25)
        {
          if ((objc_msgSend(v25, "role") & 1) != 0 || (objc_msgSend(v25, "role") & 2) != 0)
            break;
        }

        if (v17 == (id)++v19)
        {
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
          if (v17)
            goto LABEL_7;
          goto LABEL_15;
        }
      }
      v26 = v20;

      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "uuid"));
      v6 = v54;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "uuid"));
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if ((v31 & 1) != 0)
        goto LABEL_20;
      v42 = sub_10008F56C();
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v63 = 136316418;
        v64 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
        v65 = 2080;
        v66 = "W5DiagnosticsModeManager.m";
        v67 = 1024;
        v68 = 342;
        v69 = 2080;
        v70 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
        v71 = 2114;
        v72 = v25;
        v73 = 2114;
        v74 = v26;
        LODWORD(v50) = 58;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v43, 0, "[wifivelocity] %s (%s:%u) %s: [DM] current peer ('%{public}@') is already active in mode='%{public}@'", &v63, v50);
      }

      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "peer"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "name"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "peer"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "peerID"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "uuid"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Device ('%@ - %@') is already in active diagnostics (UUID='%@')"), v45, v47, v48));

      v61 = NSLocalizedFailureReasonErrorKey;
      v62 = CFSTR("W5NotPermittedErr");
      v37 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1));
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 5, v37));
      v53[2](v53, v49);

      v7 = v53;
      goto LABEL_35;
    }
LABEL_15:

    v25 = 0;
    v26 = 0;
    v6 = v54;
LABEL_20:
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager store](v52, "store"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "diagnosticsModeMatchingUUID:", v33));

    if (v34)
    {
      v35 = objc_msgSend(v34, "state");
      v36 = sub_10008F56C();
      v37 = objc_claimAutoreleasedReturnValue(v36);
      v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
      if (v35 == (id)10)
      {
        if (v38)
        {
          v63 = 136315650;
          v64 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
          v65 = 2080;
          v66 = "W5DiagnosticsModeManager.m";
          v67 = 1024;
          v68 = 351;
          LODWORD(v50) = 28;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v37, 0, "[wifivelocity] %s (%s:%u) [DM] Locally stored DM is already for waiting for collection, returning", (const char *)&v63, v50, v51);
        }
        v7 = v53;
        goto LABEL_35;
      }
      if (v38)
      {
        v63 = 136315906;
        v64 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
        v65 = 2080;
        v66 = "W5DiagnosticsModeManager.m";
        v67 = 1024;
        v68 = 355;
        v69 = 2112;
        v70 = (const char *)v34;
        LODWORD(v50) = 38;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v37, 0, "[wifivelocity] %s (%s:%u) [DM] Updating existing local mode: %@", &v63, v50);
      }

    }
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_1000054CC;
    v55[3] = &unk_1000D5070;
    v7 = v53;
    v56 = v53;
    -[W5DiagnosticsModeManager _updateDiagnosticsMode:incomingMode:currentPeer:reply:](v52, "_updateDiagnosticsMode:incomingMode:currentPeer:reply:", v34, v6, v14, v55);
    v37 = v56;
LABEL_35:

LABEL_36:
    goto LABEL_37;
  }
  v27 = sub_10008F56C();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v63 = 136315650;
    v64 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
    v65 = 2080;
    v66 = "W5DiagnosticsModeManager.m";
    v67 = 1024;
    v68 = 312;
    LODWORD(v50) = 28;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v28, 0, "[wifivelocity] %s (%s:%u) [DM] mode is nil", (const char *)&v63, v50, v51);
  }

  v78 = NSLocalizedFailureReasonErrorKey;
  v79 = CFSTR("W5ParamErr");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v14));
  v7[2](v7, v25);
LABEL_37:

}

- (void)_updateDiagnosticsMode:(id)a3 incomingMode:(id)a4 currentPeer:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  W5DiagnosticsModeProcessor *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  W5DiagnosticsModeProcessor *v23;
  id v24;
  _BYTE *v25;
  _BYTE v26[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  NSErrorUserInfoKey v30;
  const __CFString *v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = sub_10008F56C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v26 = 136315394;
    *(_QWORD *)&v26[4] = "-[W5DiagnosticsModeManager _updateDiagnosticsMode:incomingMode:currentPeer:reply:]";
    *(_WORD *)&v26[12] = 2114;
    *(_QWORD *)&v26[14] = v11;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] %s: [DM] incoming mode='%{public}@'", v26, 22);
  }

  v16 = -[W5DiagnosticsModeProcessor initWithCurrentPeer:]([W5DiagnosticsModeProcessor alloc], "initWithCurrentPeer:", v12);
  if (v16)
  {
    -[NSMutableArray addObject:](self->_processors, "addObject:", v16);
    *(_QWORD *)v26 = 0;
    *(_QWORD *)&v26[8] = v26;
    *(_QWORD *)&v26[16] = 0x3032000000;
    v27 = sub_100003BC8;
    v28 = sub_100003BD8;
    v17 = (void *)os_transaction_create("_updateDiagnosticsMode");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"));
    objc_msgSend(v18, "osTransactionCreate:transaction:", "_updateDiagnosticsMode", v17);

    v29 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager _actionHandler](self, "_actionHandler"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000057C8;
    v22[3] = &unk_1000D50C0;
    v24 = v13;
    v22[4] = self;
    v23 = v16;
    v25 = v26;
    -[W5DiagnosticsModeProcessor performUpdateOperationsForMode:incomingMode:handler:completion:](v23, "performUpdateOperationsForMode:incomingMode:handler:completion:", v10, v11, v19, v22);

    _Block_object_dispose(v26, 8);
  }
  else
  {
    v30 = NSLocalizedFailureReasonErrorKey;
    v31 = CFSTR("W5InternalErr");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 9, v20));
    (*((void (**)(id, void *))v13 + 2))(v13, v21);

  }
}

- (id)_actionHandler
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005A5C;
  v5[3] = &unk_1000D5240;
  v5[4] = self;
  v2 = objc_retainBlock(v5);
  v3 = objc_retainBlock(v2);

  return v3;
}

- (void)_storeSnifferInfo:(id)a3 peer:(id)a4 uuid:(id)a5 path:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "info"));
  objc_msgSend(v14, "setObject:forKey:", v11, CFSTR("UUID"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "info"));
  objc_msgSend(v15, "setObject:forKey:", v10, CFSTR("path"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localStore](self, "localStore"));
  v18[0] = CFSTR("UUID");
  v18[1] = CFSTR("path");
  v19[0] = v11;
  v19[1] = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));

  objc_msgSend(v16, "addToStore:newInfo:", v13, v17);
}

- (void)collectLogsDiagnosticMode:(id)a3 outputName:(id)a4 reply:(id)a5
{
  NSError *v8;
  id v9;
  void (**v10)(id, NSError *, _QWORD, void *);
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSError *v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  NSError *v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSError *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  NSObject *v67;
  uint64_t v68;
  NSObject *v69;
  NSError *v70;
  NSError *v71;
  uint64_t v72;
  void *v73;
  NSError *v74;
  int v75;
  NSError *v76;
  uint64_t v77;
  NSObject *v78;
  NSError *v79;
  void *v80;
  const char *v81;
  const char *v82;
  int v83;
  id v84;
  NSError *v85;
  id v86;
  NSError *v87;
  int v88;
  const char *v89;
  __int16 v90;
  const char *v91;
  __int16 v92;
  int v93;
  __int16 v94;
  NSError *v95;
  __int16 v96;
  NSError *v97;
  __int16 v98;
  int v99;
  __int16 v100;
  NSError *v101;
  NSErrorUserInfoKey v102;
  const __CFString *v103;
  NSErrorUserInfoKey v104;
  const __CFString *v105;

  v8 = (NSError *)a3;
  v9 = a4;
  v10 = (void (**)(id, NSError *, _QWORD, void *))a5;
  v11 = sub_10008F56C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v88 = 136315906;
    v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
    v90 = 2080;
    v91 = "W5DiagnosticsModeManager.m";
    v92 = 1024;
    v93 = 801;
    v94 = 2112;
    v95 = v8;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] %s (%s:%u) [DM] Received log collection request with configuration:%@", &v88, 38);
  }

  v13 = objc_alloc((Class)NSUUID);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v8, "objectForKey:", CFSTR("DiagnosticsModeUUID")));
  v15 = objc_msgSend(v13, "initWithUUIDString:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager store](self, "store"));
  v17 = v16;
  if (v15)
  {
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "diagnosticsModeMatchingUUID:", v15));
LABEL_7:
    v20 = (NSError *)v18;
    goto LABEL_8;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "diagnosticsModeWithState:", 10));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sortedArrayUsingSelector:", "compareCollectionTimeLatestFirst:"));
  if (objc_msgSend(v17, "count"))
  {
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));
    goto LABEL_7;
  }
  v20 = 0;
LABEL_8:

  v21 = sub_10008F56C();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v23)
    {
      v88 = 136315906;
      v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
      v90 = 2080;
      v91 = "W5DiagnosticsModeManager.m";
      v92 = 1024;
      v93 = 826;
      v94 = 2114;
      v95 = v20;
      LODWORD(v81) = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v22, 0, "[wifivelocity] %s (%s:%u) [DM] Collecting logs for dm='%{public}@'", &v88, v81);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSError peers](v20, "peers"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localPeer](self, "localPeer"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "peerID"));
    v27 = sub_100089160(v24, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

    if (v28)
    {
      v84 = v15;
      v29 = objc_msgSend(v28, "role");
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/run/com.apple.wifivelocity")));
      v86 = v9;
      v31 = (NSError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "URLByAppendingPathComponent:", v9));

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("Compress")));
      v33 = objc_msgSend(v32, "BOOLValue");

      HIDWORD(v82) = v33;
      if (v33)
      {
        v34 = objc_claimAutoreleasedReturnValue(-[NSError URLByDeletingPathExtension](v31, "URLByDeletingPathExtension"));

        v31 = (NSError *)v34;
      }
      v85 = v8;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSError path](v31, "path"));
      objc_msgSend(v35, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v36, 1, 0, 0);

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSError URLByAppendingPathComponent:](v31, "URLByAppendingPathComponent:", CFSTR("status.txt")));
      -[W5DiagnosticsModeManager __writePeerStatusToFile:](self, "__writePeerStatusToFile:", v37);

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSError URLByAppendingPathComponent:](v31, "URLByAppendingPathComponent:", CFSTR("diagnostic_mode.txt")));
      -[W5DiagnosticsModeManager __writeDiagnosticModeToFile:file:](self, "__writeDiagnosticModeToFile:file:", v20, v38);

      if ((v29 & 4) == 0 && self->_netUsageManager)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSError uuid](v20, "uuid"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DiagnosticsMode-%@-NetworkUsage"), v39));
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSError URLByAppendingPathComponent:](v31, "URLByAppendingPathComponent:", v40));

        v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSError uuid](v20, "uuid"));
        -[W5DiagnosticsModeManager __collectNetUsageFiles:uuid:](self, "__collectNetUsageFiles:uuid:", v41, v42);

      }
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localStore](self, "localStore"));
      v44 = (NSError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "infoMatchingDiagnosticMode:", v20));

      if (v44)
      {
        if ((v29 & 4) != 0)
        {
          v45 = sub_10008F56C();
          v46 = objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            v88 = 136315650;
            v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
            v90 = 2080;
            v91 = "W5DiagnosticsModeManager.m";
            v92 = 1024;
            v93 = 866;
            LODWORD(v82) = 28;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v46, 0, "[wifivelocity] %s (%s:%u) [DM] Collecting Sniffer capture", (const char *)&v88, v82, (_DWORD)v84);
          }

          v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", CFSTR("path")));
          -[W5DiagnosticsModeManager _archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:](self, "_archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:", 0, v47, v31, 0);

        }
        v48 = sub_10008F56C();
        v49 = objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          v88 = 136315650;
          v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
          v90 = 2080;
          v91 = "W5DiagnosticsModeManager.m";
          v92 = 1024;
          v93 = 873;
          LODWORD(v82) = 28;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v49, 0, "[wifivelocity] %s (%s:%u) [DM] Collecting WiFi DE Test Logs", (const char *)&v88, v82, (_DWORD)v84);
        }

        v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", CFSTR("diagnosticTestsRequestUUID")));
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", CFSTR("TestOutputDirectory")));
        -[W5DiagnosticsModeManager _archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:](self, "_archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:", v50, v51, v31, 240);

        v52 = sub_10008F56C();
        v53 = objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          v88 = 136315650;
          v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
          v90 = 2080;
          v91 = "W5DiagnosticsModeManager.m";
          v92 = 1024;
          v93 = 879;
          LODWORD(v82) = 28;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v53, 0, "[wifivelocity] %s (%s:%u) [DM] Collecting WiFi Analytics CSVs", (const char *)&v88, v82, (_DWORD)v84);
        }

        v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", CFSTR("analyticsCSVsRequestUUID")));
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", CFSTR("analyticsCSVsOutputPath")));
        -[W5DiagnosticsModeManager _archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:](self, "_archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:", v54, v55, v31, 240);

        v56 = sub_10008F56C();
        v57 = objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          v88 = 136315650;
          v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
          v90 = 2080;
          v91 = "W5DiagnosticsModeManager.m";
          v92 = 1024;
          v93 = 885;
          LODWORD(v82) = 28;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v57, 0, "[wifivelocity] %s (%s:%u) [DM] Collecting System Logarchive", (const char *)&v88, v82, (_DWORD)v84);
        }

        v58 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", CFSTR("systemLogsRequestUUID")));
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", CFSTR("systemLogsOutputPath")));
        -[W5DiagnosticsModeManager _archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:](self, "_archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:", v58, v59, v31, 240);

        v60 = sub_10008F56C();
        v61 = objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          v88 = 136315650;
          v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
          v90 = 2080;
          v91 = "W5DiagnosticsModeManager.m";
          v92 = 1024;
          v93 = 891;
          LODWORD(v82) = 28;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v61, 0, "[wifivelocity] %s (%s:%u) [DM] Collecting Network Info Logs", (const char *)&v88, v82, (_DWORD)v84);
        }

        v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", CFSTR("networkInfoGenUUID")));
        -[W5DiagnosticsModeManager __waitForLogRequestToComplete:maxWait:](self, "__waitForLogRequestToComplete:maxWait:", v62, 100);

        v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", CFSTR("networkInfoCollectUUID")));
        v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", CFSTR("networkInfoOutputPath")));
        -[W5DiagnosticsModeManager _archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:](self, "_archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:", v63, v64, v31, 180);

        v65 = sub_10008F56C();
        v66 = objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          v88 = 136315650;
          v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
          v90 = 2080;
          v91 = "W5DiagnosticsModeManager.m";
          v92 = 1024;
          v93 = 898;
          LODWORD(v82) = 28;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v66, 0, "[wifivelocity] %s (%s:%u) [DM] Collecting TCPDump Logs", (const char *)&v88, v82, (_DWORD)v84);
        }

        v67 = objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", CFSTR("tcpdumpOutputPath")));
        -[W5DiagnosticsModeManager _archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:](self, "_archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:", 0, v67, v31, 0);
      }
      else
      {
        v72 = sub_10008F56C();
        v67 = objc_claimAutoreleasedReturnValue(v72);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          v88 = 136315906;
          v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
          v90 = 2080;
          v91 = "W5DiagnosticsModeManager.m";
          v92 = 1024;
          v93 = 905;
          v94 = 2112;
          v95 = v20;
          LODWORD(v82) = 38;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v67, 0, "[wifivelocity] %s (%s:%u) [DM] no local store URL for dm='%@'", &v88, v82);
        }
      }

      if (HIDWORD(v82))
      {
        v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/run/com.apple.wifivelocity")));
        v74 = (NSError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "URLByAppendingPathComponent:", v86));

        v87 = 0;
        v75 = sub_10008F5AC(v31, v74, &v87);
        v76 = v87;
        v77 = sub_10008F56C();
        v78 = objc_claimAutoreleasedReturnValue(v77);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          v88 = 136316674;
          v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
          v90 = 2080;
          v91 = "W5DiagnosticsModeManager.m";
          v92 = 1024;
          v93 = 914;
          v94 = 2112;
          v95 = v31;
          v96 = 2112;
          v97 = v74;
          v98 = 1024;
          v99 = v75;
          v100 = 2112;
          v101 = v76;
          LODWORD(v82) = 64;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v78, 0, "[wifivelocity] %s (%s:%u) [DM] Compress: %@ -> %@, success: %d, error: %@", &v88, v82);
        }

        v79 = v74;
      }
      else
      {
        v76 = 0;
        v79 = 0;
        v74 = v31;
      }
      -[NSError setState:](v20, "setState:", 11);
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager store](self, "store"));
      objc_msgSend(v80, "updateStoreWithDiagnosticsMode:", v20);

      if (v10)
        v10[2](v10, v76, 0, v74);

      v15 = v84;
    }
    else
    {
      v68 = sub_10008F56C();
      v69 = objc_claimAutoreleasedReturnValue(v68);
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        v70 = (NSError *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localPeer](self, "localPeer"));
        v71 = (NSError *)objc_claimAutoreleasedReturnValue(-[NSError peers](v20, "peers"));
        v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
        v90 = 2080;
        v88 = 136316162;
        v91 = "W5DiagnosticsModeManager.m";
        v92 = 1024;
        v93 = 831;
        v94 = 2112;
        v95 = v70;
        v96 = 2114;
        v97 = v71;
        LODWORD(v81) = 48;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v69, 0, "[wifivelocity] %s (%s:%u) [DM] Local device (%@) not found in dm peer list='%{public}@'", &v88, v81);

      }
      if (!v10)
      {
        v28 = 0;
        goto LABEL_53;
      }
      v85 = v8;
      v86 = v9;
      v102 = NSLocalizedFailureReasonErrorKey;
      v103 = CFSTR("W5NotPermittedErr");
      v31 = (NSError *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1));
      v44 = (NSError *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 5, v31));
      v10[2](v10, v44, 0, 0);
    }

    v8 = v85;
LABEL_52:

    v9 = v86;
LABEL_53:

    goto LABEL_54;
  }
  if (v23)
  {
    v88 = 136315650;
    v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
    v90 = 2080;
    v91 = "W5DiagnosticsModeManager.m";
    v92 = 1024;
    v93 = 821;
    LODWORD(v81) = 28;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v22, 0, "[wifivelocity] %s (%s:%u) [DM] No UUID specified and No Diagnostic Mode sessions waiting for collection.", (const char *)&v88, v81, v83);
  }

  if (v10)
  {
    v86 = v9;
    v104 = NSLocalizedFailureReasonErrorKey;
    v105 = CFSTR("W5NotPermittedErr");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1));
    v31 = (NSError *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 5, v28));
    v10[2](v10, v31, 0, 0);
    goto LABEL_52;
  }
LABEL_54:

}

- (void)_archiveAndCollectLogs:(id)a3 logCollectionPath:(id)a4 outputDirectory:(id)a5 maxWait:(unint64_t)a6
{
  NSError *v10;
  NSError *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSError *v18;
  NSError *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  NSObject *v26;
  NSError *v27;
  uint64_t v28;
  id v29;
  NSError *v30;
  int v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  NSError *v38;
  __int16 v39;
  NSError *v40;
  __int16 v41;
  _QWORD v42[2];

  v10 = (NSError *)a3;
  v11 = (NSError *)a4;
  v12 = a5;
  v13 = sub_10008F56C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v31 = 136316418;
    v32 = "-[W5DiagnosticsModeManager _archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:]";
    v33 = 2080;
    v34 = "W5DiagnosticsModeManager.m";
    v35 = 1024;
    v36 = 926;
    v37 = 2112;
    v38 = v10;
    v39 = 2112;
    v40 = v11;
    v41 = 2112;
    v42[0] = v12;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s (%s:%u) [DM] Archive and collect logs UUID: %@, at: %@ to: %@", &v31, 58);
  }

  if (v10)
    -[W5DiagnosticsModeManager __waitForLogRequestToComplete:maxWait:](self, "__waitForLogRequestToComplete:maxWait:", v10, a6);
  if (v11)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSError lastPathComponent](v11, "lastPathComponent"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.tgz"), v15));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/run/com.apple.wifivelocity")));
    v18 = (NSError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "URLByAppendingPathComponent:", v16));

    v30 = 0;
    sub_10008F5AC(v11, v18, &v30);
    v19 = v30;
    if (v19)
    {
      v20 = sub_10008F56C();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v31 = 136316162;
        v32 = "-[W5DiagnosticsModeManager _archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:]";
        v33 = 2080;
        v34 = "W5DiagnosticsModeManager.m";
        v35 = 1024;
        v36 = 937;
        v37 = 2112;
        v38 = v11;
        v39 = 2112;
        v40 = v19;
        LODWORD(v28) = 48;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v21, 0, "[wifivelocity] %s (%s:%u) [DM] failed to create tarball for logs at URL='%@', error='%@'", &v31, v28);
      }
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLByAppendingPathComponent:", v16));
      v29 = 0;
      v24 = objc_msgSend(v22, "moveItemAtURL:toURL:error:", v18, v23, &v29);
      v21 = v29;

      v25 = sub_10008F56C();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (NSError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLByAppendingPathComponent:", v16));
        v31 = 136316674;
        v32 = "-[W5DiagnosticsModeManager _archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:]";
        v33 = 2080;
        v34 = "W5DiagnosticsModeManager.m";
        v35 = 1024;
        v36 = 942;
        v37 = 2112;
        v38 = v18;
        v39 = 2112;
        v40 = v27;
        v41 = 1024;
        LODWORD(v42[0]) = v24;
        WORD2(v42[0]) = 2112;
        *(_QWORD *)((char *)v42 + 6) = v21;
        LODWORD(v28) = 64;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v26, 0, "[wifivelocity] %s (%s:%u) [DM] move log tarball: %@ -> %@, moved: %d, error: %@", &v31, v28);

      }
    }

  }
}

- (BOOL)registerPeer:(id)a3 role:(int64_t)a4 configuration:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v21;
  int v22;
  int v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;

  v9 = a5;
  v10 = a3;
  v11 = sub_10008F56C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[W5CloudStore sharedStore](W5CloudStore, "sharedStore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "registeredPeers"));
    v23 = 136315906;
    v24 = "-[W5DiagnosticsModeManager registerPeer:role:configuration:error:]";
    v25 = 2080;
    v26 = "W5DiagnosticsModeManager.m";
    v27 = 1024;
    v28 = 949;
    v29 = 2114;
    v30 = v14;
    v22 = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] %s (%s:%u) current peers='%{public}@'", &v23, v22);

  }
  v15 = objc_msgSend(objc_alloc((Class)W5DiagnosticsModePeer), "initWithRole:peer:", a4, v10);

  v16 = sub_10008F56C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 136315906;
    v24 = "-[W5DiagnosticsModeManager registerPeer:role:configuration:error:]";
    v25 = 2080;
    v26 = "W5DiagnosticsModeManager.m";
    v27 = 1024;
    v28 = 951;
    v29 = 2114;
    v30 = v15;
    LODWORD(v21) = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v17, 0, "[wifivelocity] %s (%s:%u) registering peer='%{public}@'", &v23, v21);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[W5CloudStore sharedStore](W5CloudStore, "sharedStore"));
  v19 = objc_msgSend(v18, "registerDiagnosticModePeer:configuration:error:", v15, v9, a6);

  return v19;
}

- (BOOL)unregisterPeer:(id)a3 role:(int64_t)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v18;
  int v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;

  v7 = a3;
  v8 = sub_10008F56C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[W5CloudStore sharedStore](W5CloudStore, "sharedStore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "registeredPeers"));
    v20 = 136315906;
    v21 = "-[W5DiagnosticsModeManager unregisterPeer:role:error:]";
    v22 = 2080;
    v23 = "W5DiagnosticsModeManager.m";
    v24 = 1024;
    v25 = 957;
    v26 = 2114;
    v27 = v11;
    v19 = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) current peers='%{public}@'", &v20, v19);

  }
  v12 = objc_msgSend(objc_alloc((Class)W5DiagnosticsModePeer), "initWithRole:peer:", a4, v7);

  v13 = sub_10008F56C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315906;
    v21 = "-[W5DiagnosticsModeManager unregisterPeer:role:error:]";
    v22 = 2080;
    v23 = "W5DiagnosticsModeManager.m";
    v24 = 1024;
    v25 = 959;
    v26 = 2114;
    v27 = v12;
    LODWORD(v18) = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s (%s:%u) unregistering peer='%{public}@'", &v20, v18);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[W5CloudStore sharedStore](W5CloudStore, "sharedStore"));
  v16 = objc_msgSend(v15, "unregisterDiagnosticModePeer:error:", v12, a5);

  return v16;
}

- (void)__waitForLogRequestToComplete:(id)a3 maxWait:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  dispatch_semaphore_t v10;
  uint64_t v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  dispatch_time_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  _QWORD block[4];
  NSObject *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  unint64_t v34;

  v6 = a3;
  if (-[W5LogManager isRequestActiveOrPending:](self->_logManager, "isRequestActiveOrPending:", v6))
  {
    v7 = (unint64_t)(double)(a4 / 0xA);
    if (v7)
    {
      v8 = 1;
      v9 = 10;
      while (1)
      {
        v10 = dispatch_semaphore_create(0);
        v11 = sub_10008F56C();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v24 = (uint64_t)"-[W5DiagnosticsModeManager __waitForLogRequestToComplete:maxWait:]";
          v25 = 2080;
          v26 = "W5DiagnosticsModeManager.m";
          v27 = 1024;
          v28 = 971;
          v29 = 2048;
          v30 = 10;
          v31 = 2112;
          v32 = (uint64_t)v6;
          v33 = 2048;
          v34 = v8;
          LODWORD(v20) = 58;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] %s (%s:%u) Waiting for additional %ld seconds to let log request: %@ to complete, attempt: %ld", buf, v20);
        }

        v13 = dispatch_time(0, 10000000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000A854;
        block[3] = &unk_1000D5268;
        v14 = v10;
        v22 = v14;
        dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);
        v15 = dispatch_time(0, 80000000000);
        if (dispatch_semaphore_wait(v14, v15) >= 1
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349056;
          v24 = 0x4054000000000000;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
        }
        v16 = -[W5LogManager isRequestActiveOrPending:](self->_logManager, "isRequestActiveOrPending:", v6);
        v17 = sub_10008F56C();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        if ((v16 & 1) == 0)
          break;
        if (v19)
        {
          *(_DWORD *)buf = 136316162;
          v24 = (uint64_t)"-[W5DiagnosticsModeManager __waitForLogRequestToComplete:maxWait:]";
          v25 = 2080;
          v26 = "W5DiagnosticsModeManager.m";
          v27 = 1024;
          v28 = 982;
          v29 = 2112;
          v30 = (uint64_t)v6;
          v31 = 2048;
          v32 = v9;
          LODWORD(v20) = 48;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v18, 0, "[wifivelocity] %s (%s:%u) Log request: %@ still active/pending, continuing wait. Waited (till now): %ld seconds", buf, v20);
        }

        ++v8;
        v9 += 10;
        if (v8 > v7)
          goto LABEL_17;
      }
      if (v19)
      {
        *(_DWORD *)buf = 136316162;
        v24 = (uint64_t)"-[W5DiagnosticsModeManager __waitForLogRequestToComplete:maxWait:]";
        v25 = 2080;
        v26 = "W5DiagnosticsModeManager.m";
        v27 = 1024;
        v28 = 979;
        v29 = 2112;
        v30 = (uint64_t)v6;
        v31 = 2048;
        v32 = v9;
        LODWORD(v20) = 48;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v18, 0, "[wifivelocity] %s (%s:%u) Log request: %@ no longer active/pending, ending wait. Waited: %ld seconds", buf, v20);
      }

    }
  }
LABEL_17:

}

- (void)__writePeerStatusToFile:(id)a3
{
  id v4;
  W5StatusManager *statusManager;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  _BYTE v15[24];
  __int128 v16;

  v4 = a3;
  statusManager = self->_statusManager;
  if (statusManager)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[W5StatusManager status](statusManager, "status"));
    if (!v6)
    {
      v14 = sub_10008F56C();
      v13 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v15 = 136315650;
        *(_QWORD *)&v15[4] = "-[W5DiagnosticsModeManager __writePeerStatusToFile:]";
        *(_WORD *)&v15[12] = 2080;
        *(_QWORD *)&v15[14] = "W5DiagnosticsModeManager.m";
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v13, 0, "[wifivelocity] %s (%s:%u) nil status", v15, 28, *(_OWORD *)v15);
      }
      goto LABEL_9;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataUsingEncoding:", 4));
    v11 = objc_msgSend(v7, "createFileAtPath:contents:attributes:", v8, v10, 0);

    if (v11)
    {
      v12 = sub_10008F56C();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v15 = 136315906;
        *(_QWORD *)&v15[4] = "-[W5DiagnosticsModeManager __writePeerStatusToFile:]";
        *(_WORD *)&v15[12] = 2080;
        *(_QWORD *)&v15[14] = "W5DiagnosticsModeManager.m";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 996;
        WORD2(v16) = 2112;
        *(_QWORD *)((char *)&v16 + 6) = v4;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v13, 0, "[wifivelocity] %s (%s:%u) Status File: %@", v15, 38, *(_OWORD *)v15, *(_QWORD *)&v15[16], v16);
      }
LABEL_9:

    }
  }
  else
  {
    v6 = 0;
  }

}

- (void)__writeDiagnosticModeToFile:(id)a3 file:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  _BYTE v15[24];
  __int128 v16;

  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    v14 = sub_10008F56C();
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v15 = 136315650;
      *(_QWORD *)&v15[4] = "-[W5DiagnosticsModeManager __writeDiagnosticModeToFile:file:]";
      *(_WORD *)&v15[12] = 2080;
      *(_QWORD *)&v15[14] = "W5DiagnosticsModeManager.m";
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v13, 0, "[wifivelocity] %s (%s:%u) nil mode", v15, 28, *(_OWORD *)v15);
    }
    goto LABEL_7;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataUsingEncoding:", 4));
  v11 = objc_msgSend(v7, "createFileAtPath:contents:attributes:", v8, v10, 0);

  if (v11)
  {
    v12 = sub_10008F56C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v15 = 136315906;
      *(_QWORD *)&v15[4] = "-[W5DiagnosticsModeManager __writeDiagnosticModeToFile:file:]";
      *(_WORD *)&v15[12] = 2080;
      *(_QWORD *)&v15[14] = "W5DiagnosticsModeManager.m";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 1010;
      WORD2(v16) = 2112;
      *(_QWORD *)((char *)&v16 + 6) = v6;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v13, 0, "[wifivelocity] %s (%s:%u) Diagnostics Mode File: %@", v15, 38, *(_OWORD *)v15, *(_QWORD *)&v15[16], v16);
    }
LABEL_7:

  }
}

- (void)__collectNetUsageFiles:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  NSError *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  NSError *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  const char *v27;
  NSError *v28;
  id v29;
  int v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;
  __int16 v38;
  _BYTE v39[14];
  __int16 v40;
  NSError *v41;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v29 = 0;
  v9 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v29);
  v10 = (NSError *)v29;

  v11 = sub_10008F56C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 136316418;
    v31 = "-[W5DiagnosticsModeManager __collectNetUsageFiles:uuid:]";
    v32 = 2080;
    v33 = "W5DiagnosticsModeManager.m";
    v34 = 1024;
    v35 = 1025;
    v36 = 2112;
    v37 = v6;
    v38 = 1024;
    *(_DWORD *)v39 = v9;
    *(_WORD *)&v39[4] = 2112;
    *(_QWORD *)&v39[6] = v10;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] %s (%s:%u) Create Directory: %@, success: %d, error: %@", &v30, 54);
  }

  if (v9)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5NetUsageManager calculateUsageDelta:](self->_netUsageManager, "calculateUsageDelta:", v7));
    v14 = sub_10008F56C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 136315650;
      v31 = "-[W5DiagnosticsModeManager __collectNetUsageFiles:uuid:]";
      v32 = 2080;
      v33 = "W5DiagnosticsModeManager.m";
      v34 = 1024;
      v35 = 1029;
      LODWORD(v27) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] %s (%s:%u) Generating Network Usage Delta File", (const char *)&v30, v27, (_DWORD)v28);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("netusage_delta.csv")));
    +[W5NetUsageManager writeProcNetUsage:ToFile:](W5NetUsageManager, "writeProcNetUsage:ToFile:", v13, v16);

    v17 = sub_10008F56C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 136315650;
      v31 = "-[W5DiagnosticsModeManager __collectNetUsageFiles:uuid:]";
      v32 = 2080;
      v33 = "W5DiagnosticsModeManager.m";
      v34 = 1024;
      v35 = 1032;
      LODWORD(v27) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v18, 0, "[wifivelocity] %s (%s:%u) Requesting Periodic Network Usage Data Files", (const char *)&v30, v27, (_DWORD)v28);
    }

    +[W5NetUsageManager copyPeriodicNetUsageToDir:uuid:](W5NetUsageManager, "copyPeriodicNetUsageToDir:uuid:", v6, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.tgz"), v6));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v19));

    v28 = v10;
    v21 = sub_10008F5AC(v6, v20, &v28);
    v22 = v28;

    v23 = sub_10008F56C();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 136316674;
      v31 = "-[W5DiagnosticsModeManager __collectNetUsageFiles:uuid:]";
      v32 = 2080;
      v33 = "W5DiagnosticsModeManager.m";
      v34 = 1024;
      v35 = 1037;
      v36 = 2112;
      v37 = v6;
      v38 = 2112;
      *(_QWORD *)v39 = v20;
      *(_WORD *)&v39[8] = 1024;
      *(_DWORD *)&v39[10] = v21;
      v40 = 2112;
      v41 = v22;
      LODWORD(v27) = 64;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v24, 0, "[wifivelocity] %s (%s:%u) Compress %@ -> %@, success:%d, error: %@", &v30, v27);
    }

    if (v21)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
      objc_msgSend(v25, "removeItemAtPath:error:", v26, 0);

    }
  }
  else
  {
    v22 = v10;
  }

}

- (void)handlePeerFaultEvent:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *j;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  void *i;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  NSObject *v59;
  void *v60;
  void *v61;
  unsigned int v62;
  uint64_t v63;
  NSObject *v64;
  _BOOL4 v65;
  void *v66;
  void *v67;
  unsigned int v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  NSObject *v74;
  uint64_t v75;
  NSObject *v76;
  uint64_t v77;
  NSObject *v78;
  uint64_t v79;
  const char *v80;
  int v81;
  void *v82;
  void *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[5];
  id v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  void *v96;
  int v97;
  const char *v98;
  __int16 v99;
  const char *v100;
  __int16 v101;
  int v102;
  __int16 v103;
  id v104;
  __int16 v105;
  id v106;
  _BYTE v107[128];

  v4 = a3;
  v5 = sub_10008F56C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v97 = 136315906;
    v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
    v99 = 2080;
    v100 = "W5DiagnosticsModeManager.m";
    v101 = 1024;
    v102 = 1044;
    v103 = 2114;
    v104 = v4;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) [DM] received fault event='%{public}@'", &v97, 38);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RemoteListener")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peerID"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localPeer](self, "localPeer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "peerID"));
    v13 = objc_msgSend(v10, "isEqualToString:", v12);

    if (!v13)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKey:", CFSTR("DiagnosticMode")));

      if (v19)
      {
        v34 = sub_10008F56C();
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peer"));
          v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
          v99 = 2080;
          v97 = 136316162;
          v100 = "W5DiagnosticsModeManager.m";
          v101 = 1024;
          v102 = 1100;
          v103 = 2112;
          v104 = v19;
          v105 = 2114;
          v106 = v36;
          LODWORD(v80) = 48;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v35, 0, "[wifivelocity] %s (%s:%u) [DM] Active DM instance: %@ reported by peer='%{public}@'", &v97, v80);

        }
        v37 = objc_alloc((Class)W5DiagnosticsModePeer);
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localPeer](self, "localPeer"));
        v39 = objc_msgSend(v37, "initWithRole:peer:", 8, v38);

        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "peers"));
        v41 = sub_100088FC8(v40, v39, 8);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);

        if (!v42)
        {
LABEL_60:

          goto LABEL_67;
        }
        v82 = v39;
        v83 = v8;
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("FaultType")));
        v45 = objc_msgSend(v44, "integerValue");

        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "info"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("Faults")));

        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        v48 = v47;
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
        if (v49)
        {
          v50 = v49;
          v51 = *(_QWORD *)v85;
          while (2)
          {
            for (i = 0; i != v50; i = (char *)i + 1)
            {
              if (*(_QWORD *)v85 != v51)
                objc_enumerationMutation(v48);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)i), "integerValue") == v45)
              {

                v73 = sub_10008F56C();
                v74 = objc_claimAutoreleasedReturnValue(v73);
                if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                {
                  v97 = 136315650;
                  v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
                  v99 = 2080;
                  v100 = "W5DiagnosticsModeManager.m";
                  v101 = 1024;
                  v102 = 1128;
                  LODWORD(v80) = 28;
                  _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v74, 0, "[wifivelocity] %s (%s:%u) [DM] showing auto stop user notification", (const char *)&v97, v80, (_DWORD)v82);
                }

                v39 = v82;
                if (self->_userNotificationManager)
                {
                  -[W5DiagnosticsModeManager _showSuggestedStopNotificationForEvent:](self, "_showSuggestedStopNotificationForEvent:", v4);
                  v8 = v83;
                }
                else
                {
                  v75 = sub_10008F56C();
                  v76 = objc_claimAutoreleasedReturnValue(v75);
                  v8 = v83;
                  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                  {
                    v97 = 136315650;
                    v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
                    v99 = 2080;
                    v100 = "W5DiagnosticsModeManager.m";
                    v101 = 1024;
                    v102 = 1135;
                    LODWORD(v80) = 28;
                    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v76, 0, "[wifivelocity] %s (%s:%u) [DM] userNotificationManager is nil", (const char *)&v97, v80, (_DWORD)v82);
                  }

                }
                goto LABEL_60;
              }
            }
            v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
            if (v50)
              continue;
            break;
          }
        }

        v53 = sub_10008F56C();
        v54 = objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
          v99 = 2080;
          v97 = 136316162;
          v100 = "W5DiagnosticsModeManager.m";
          v101 = 1024;
          v102 = 1124;
          v103 = 2048;
          v104 = v45;
          v105 = 2114;
          v106 = v48;
          LODWORD(v80) = 48;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v54, 0, "[wifivelocity] %s (%s:%u) [DM] received peer fault (%ld) that is not being monitored (monitoring='%{public}@')", &v97, v80);
        }

        goto LABEL_48;
      }
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localPeer](self, "localPeer"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "peerID"));
      v62 = objc_msgSend(v8, "isEqualToString:", v61);

      v63 = sub_10008F56C();
      v64 = objc_claimAutoreleasedReturnValue(v63);
      v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
      if (!v62)
      {
        if (v65)
        {
          v97 = 136315906;
          v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
          v99 = 2080;
          v100 = "W5DiagnosticsModeManager.m";
          v101 = 1024;
          v102 = 1155;
          v103 = 2114;
          v104 = v4;
          LODWORD(v80) = 38;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v64, 0, "[wifivelocity] %s (%s:%u) [DM] unhandled fault event='%{public}@'", &v97, v80);
        }

        goto LABEL_66;
      }
      if (v65)
      {
        v97 = 136315650;
        v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
        v99 = 2080;
        v100 = "W5DiagnosticsModeManager.m";
        v101 = 1024;
        v102 = 1142;
        LODWORD(v80) = 28;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v64, 0, "[wifivelocity] %s (%s:%u)  [DM] showing auto start user notification", (const char *)&v97, v80, v81);
      }

      if (self->_userNotificationManager)
      {
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("FaultType")));
        v68 = -[W5DiagnosticsModeManager _isFaultSupported:](self, "_isFaultSupported:", objc_msgSend(v67, "integerValue"));

        if (v68)
        {
          -[W5DiagnosticsModeManager _showSuggestedStartNotificationForEvent:](self, "_showSuggestedStartNotificationForEvent:", v4);
LABEL_66:
          v19 = 0;
          goto LABEL_67;
        }
        v79 = sub_10008F56C();
        v78 = objc_claimAutoreleasedReturnValue(v79);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          v97 = 136315906;
          v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
          v99 = 2080;
          v100 = "W5DiagnosticsModeManager.m";
          v101 = 1024;
          v102 = 1146;
          v103 = 2114;
          v104 = v4;
          LODWORD(v80) = 38;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v78, 0, "[wifivelocity] %s (%s:%u) Unsupported fault event:'%{public}@'", &v97, v80);
        }
      }
      else
      {
        v77 = sub_10008F56C();
        v78 = objc_claimAutoreleasedReturnValue(v77);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          v97 = 136315650;
          v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
          v99 = 2080;
          v100 = "W5DiagnosticsModeManager.m";
          v101 = 1024;
          v102 = 1150;
          LODWORD(v80) = 28;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v78, 0, "[wifivelocity] %s (%s:%u) [DM] userNotificationManager is nil", &v97, v80);
        }
      }

      goto LABEL_66;
    }
  }
  v14 = sub_10008F56C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v97 = 136315650;
    v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
    v99 = 2080;
    v100 = "W5DiagnosticsModeManager.m";
    v101 = 1024;
    v102 = 1050;
    LODWORD(v80) = 28;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] %s (%s:%u) [DM] received fault event for local device", (const char *)&v97, v80, v81);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager store](self, "store"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localPeer](self, "localPeer"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "peerID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "diagnosticsModeMatchingPeerID:state:role:", v18, 3, 1));

  if (objc_msgSend(v19, "count"))
  {
    v83 = v8;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("FaultType")));
    v23 = objc_msgSend(v22, "integerValue");

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "info"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Faults")));

    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v26 = v25;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v92;
      while (2)
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(_QWORD *)v92 != v29)
            objc_enumerationMutation(v26);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)j), "integerValue") == v23)
          {

            objc_msgSend(v20, "setState:", 4);
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "info"));
            if (v55)
            {
              v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "info"));
              v57 = objc_msgSend(v56, "mutableCopy");

            }
            else
            {
              v57 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
            }

            v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v23));
            v96 = v69;
            v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v96, 1));
            objc_msgSend(v57, "setObject:forKeyedSubscript:", v70, CFSTR("DetectedFaults"));

            objc_msgSend(v20, "setInfo:", v57);
            v71 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager store](self, "store"));
            objc_msgSend(v71, "updateStoreWithDiagnosticsMode:", v20);

            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uuid"));
            v88[0] = _NSConcreteStackBlock;
            v88[1] = 3221225472;
            v88[2] = sub_10000BE78;
            v88[3] = &unk_1000D5290;
            v88[4] = self;
            v89 = v4;
            v90 = v20;
            -[W5DiagnosticsModeManager stopDiagnosticsModeWithUUID:info:reply:](self, "stopDiagnosticsModeWithUUID:info:reply:", v72, &__NSDictionary0__struct, v88);

            goto LABEL_47;
          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
        if (v28)
          continue;
        break;
      }
    }

    v31 = sub_10008F56C();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
      v99 = 2080;
      v97 = 136316162;
      v100 = "W5DiagnosticsModeManager.m";
      v101 = 1024;
      v102 = 1070;
      v103 = 2048;
      v104 = v23;
      v105 = 2114;
      v106 = v26;
      LODWORD(v80) = 48;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v32, 0, "[wifivelocity] %s (%s:%u) [DM] received local fault (%ld) that is not being monitored (monitoring='%{public}@')", &v97, v80);
    }

    -[W5DiagnosticsModeManager _notifyPeers:info:](self, "_notifyPeers:info:", v4, 0);
LABEL_47:

LABEL_48:
    v8 = v83;
    goto LABEL_67;
  }
  v58 = sub_10008F56C();
  v59 = objc_claimAutoreleasedReturnValue(v58);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    v97 = 136315650;
    v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
    v99 = 2080;
    v100 = "W5DiagnosticsModeManager.m";
    v101 = 1024;
    v102 = 1090;
    LODWORD(v80) = 28;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v59, 0, "[wifivelocity] %s (%s:%u) [DM] no active DM instances for local device", (const char *)&v97, v80, v81);
  }

  -[W5DiagnosticsModeManager _notifyPeers:info:](self, "_notifyPeers:info:", v4, 0);
LABEL_67:

}

- (BOOL)_isFaultSupported:(int64_t)a3
{
  void *v4;
  id v5;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000E73F8, "objectAtIndex:", 0));
  v5 = objc_msgSend(v4, "integerValue");

  if (v5 == (id)a3)
    return 1;
  v7 = 0;
  do
  {
    v8 = v7;
    if (v7 == 3)
      break;
    ++v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000E73F8, "objectAtIndex:", v8 + 1));
    v10 = objc_msgSend(v9, "integerValue");

  }
  while (v10 != (id)a3);
  return v8 < 3;
}

- (void)_notifyPeers:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  W5FaultEventManager *faultEventManager;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;

  v6 = a3;
  v7 = a4;
  faultEventManager = self->_faultEventManager;
  v9 = sub_10008F56C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (faultEventManager)
  {
    if (v11)
    {
      v12 = 136315906;
      v13 = "-[W5DiagnosticsModeManager _notifyPeers:info:]";
      v14 = 2080;
      v15 = "W5DiagnosticsModeManager.m";
      v16 = 1024;
      v17 = 1171;
      v18 = 2112;
      v19 = v6;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) Notifying registered peers for fault event: %@", &v12, 38);
    }

    -[W5FaultEventManager notifyPeersWithFaultEvent:info:](self->_faultEventManager, "notifyPeersWithFaultEvent:info:", v6, v7);
  }
  else
  {
    if (v11)
    {
      v12 = 136315650;
      v13 = "-[W5DiagnosticsModeManager _notifyPeers:info:]";
      v14 = 2080;
      v15 = "W5DiagnosticsModeManager.m";
      v16 = 1024;
      v17 = 1175;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) nil W5FaultEventManager", (const char *)&v12, 28);
    }

  }
}

- (void)_showSuggestedStartNotificationForEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  W5UserNotificationManager *userNotificationManager;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  if (-[W5DiagnosticsModeManager _shouldShowNotification:](self, "_shouldShowNotification:", 2))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    -[W5DiagnosticsModeManager setStopNotificationUUID:](self, "setStopNotificationUUID:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "info"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FaultType")));
    v7 = objc_msgSend(v6, "integerValue");

    v8 = W5DescriptionForDiagnosticsFaultType(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ Issue Detected"), v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "peer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "peer"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));

    }
    else
    {
      v14 = CFSTR("Your device");
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "peer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "peerID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("wifiapp://startDiagnostics?peerID=%@"), v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v17));

    userNotificationManager = self->_userNotificationManager;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ has detected an issue. Tap here to help diagnose the issue."), v14));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager stopNotificationUUID](self, "stopNotificationUUID"));
    -[W5UserNotificationManager dispatchNotificationWithTitle:subtitle:body:type:UUID:actionURL:](userNotificationManager, "dispatchNotificationWithTitle:subtitle:body:type:UUID:actionURL:", v10, 0, v20, 3, v21, v18);

  }
}

- (void)_showSuggestedStopNotificationForEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  W5UserNotificationManager *userNotificationManager;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  if (-[W5DiagnosticsModeManager _shouldShowNotification:](self, "_shouldShowNotification:", 3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    -[W5DiagnosticsModeManager setStopNotificationUUID:](self, "setStopNotificationUUID:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "info"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FaultType")));
    v7 = objc_msgSend(v6, "integerValue");

    v8 = W5DescriptionForDiagnosticsFaultType(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ Issue Diagnostics Complete"), v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "peer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "peer"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));

    }
    else
    {
      v14 = CFSTR("Your device");
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "info"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("DiagnosticMode")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uuid"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "peer"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "peerID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("wifiapp://endDiagnostics?peerID=%@&dmUUID=%@"), v19, v20));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v21));

    userNotificationManager = self->_userNotificationManager;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ has detected the issue again and has completed diagnostics. Tap here to file a radar."), v14));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager stopNotificationUUID](self, "stopNotificationUUID"));
    -[W5UserNotificationManager dispatchNotificationWithTitle:subtitle:body:type:UUID:actionURL:](userNotificationManager, "dispatchNotificationWithTitle:subtitle:body:type:UUID:actionURL:", v10, 0, v24, 3, v25, v22);

  }
}

- (BOOL)_shouldShowNotification:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  double v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  _BOOL4 v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v30;
  int v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  double v42;
  __int16 v43;
  _BOOL4 v44;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = 300.0;
  if (a3 != 3)
    v6 = 0.0;
  if (a3 == 2)
    v7 = 900.0;
  else
    v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[W5CloudStore sharedStore](W5CloudStore, "sharedStore", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5Peer peerID](self->_localPeer, "peerID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getMinNotificationInterval:notificationType:", v9, a3));

  if (v10)
  {
    v11 = sub_10008F56C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v31 = 136315906;
      v32 = "-[W5DiagnosticsModeManager _shouldShowNotification:]";
      v33 = 2080;
      v34 = "W5DiagnosticsModeManager.m";
      v35 = 1024;
      v36 = 1236;
      v37 = 2112;
      v38 = v10;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] %s (%s:%u) [DM] Minimum Notification Interval (Cloud KVS): %@", &v31, 38);
    }

    objc_msgSend(v10, "doubleValue");
    v7 = v13;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "persistentDomainForName:", CFSTR("com.apple.wifi.diagnosticsMode")));

  if (a3 == 2)
  {
    v16 = CFSTR("MinStartNotificationInterval");
  }
  else
  {
    if (a3 != 3)
    {
      v17 = 0;
      goto LABEL_19;
    }
    v16 = CFSTR("MinStopNotificationInterval");
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v16));
  if (v17)
  {
    v18 = sub_10008F56C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v31 = 136315906;
      v32 = "-[W5DiagnosticsModeManager _shouldShowNotification:]";
      v33 = 2080;
      v34 = "W5DiagnosticsModeManager.m";
      v35 = 1024;
      v36 = 1256;
      v37 = 2112;
      v38 = v17;
      LODWORD(v30) = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v19, 0, "[wifivelocity] %s (%s:%u) [DM] Minimum Notification Interval (User defaults): %@", &v31, v30);
    }

    objc_msgSend(v17, "doubleValue");
    v7 = v20;
  }
LABEL_19:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager lastNotificationTimestamp](self, "lastNotificationTimestamp"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", v21));

  if (v23)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:", v23);
    v25 = v24 > v7;
  }
  else
  {
    v25 = 1;
  }
  v26 = sub_10008F56C();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v31 = 136316674;
    v32 = "-[W5DiagnosticsModeManager _shouldShowNotification:]";
    v33 = 2080;
    v34 = "W5DiagnosticsModeManager.m";
    v35 = 1024;
    v36 = 1266;
    v37 = 2112;
    v38 = v21;
    v39 = 2112;
    v40 = v23;
    v41 = 2048;
    v42 = v7;
    v43 = 1024;
    v44 = v25;
    LODWORD(v30) = 64;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v27, 0, "[wifivelocity] %s (%s:%u) Notification Type: %@, Last notification timestamp: %@, minTimeInterval (s): %f, Allow Notification?: %d", &v31, v30);
  }

  if (v25)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager lastNotificationTimestamp](self, "lastNotificationTimestamp"));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v5, v21);

  }
  return v25;
}

- (void)_runDiagnosticsForDiagnosticMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  W5LogItemRequestInternal *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  W5LogItemRequestInternal *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  _QWORD v24[2];
  _QWORD v25[2];
  int v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  W5LogItemRequestInternal *v33;
  void *v34;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DiagnosticsMode-%@-WiFiDETestsAtFault"), v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v9 = objc_alloc_init(W5LogItemRequestInternal);
  -[W5LogItemRequestInternal setUuid:](v9, "setUuid:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 55, 0));
  v34 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
  -[W5LogItemRequestInternal setItemRequests:](v9, "setItemRequests:", v11);

  -[W5LogItemRequestInternal setFilename:](v9, "setFilename:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[W5LogItemRequestInternal setAddedAt:](v9, "setAddedAt:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager logManager](self, "logManager"));
  objc_msgSend(v13, "addRequest:", v9);

  v14 = sub_10008F56C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 136315906;
    v27 = "-[W5DiagnosticsModeManager _runDiagnosticsForDiagnosticMode:]";
    v28 = 2080;
    v29 = "W5DiagnosticsModeManager.m";
    v30 = 1024;
    v31 = 1284;
    v32 = 2112;
    v33 = v9;
    v23 = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] %s (%s:%u) Added to W5LogManager queue: %@", &v26, v23);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/run/com.apple.wifivelocity")));
  v17 = (W5LogItemRequestInternal *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URLByAppendingPathComponent:", v7));

  v18 = sub_10008F56C();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 136315906;
    v27 = "-[W5DiagnosticsModeManager _runDiagnosticsForDiagnosticMode:]";
    v28 = 2080;
    v29 = "W5DiagnosticsModeManager.m";
    v30 = 1024;
    v31 = 1287;
    v32 = 2114;
    v33 = v17;
    LODWORD(v22) = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v19, 0, "[wifivelocity] %s (%s:%u) [DM] running fault log collection to dir='%{public}@'", &v26, v22);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localStore](self, "localStore"));
  v24[0] = CFSTR("diagnosticTestsRequestUUID");
  v24[1] = CFSTR("TestOutputDirectory");
  v25[0] = v8;
  v25[1] = v17;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
  objc_msgSend(v20, "addToStore:newInfo:", v4, v21);

}

- (void)_collectAnalyticsCSVsForDiagnosticMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  W5LogItemRequestInternal *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  W5LogItemRequestInternal *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  _QWORD v26[2];
  _QWORD v27[2];
  int v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  W5LogItemRequestInternal *v35;
  _QWORD v36[3];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DiagnosticsMode-%@-AnalyticsCSVs"), v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v9 = objc_alloc_init(W5LogItemRequestInternal);
  -[W5LogItemRequestInternal setUuid:](v9, "setUuid:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 85, &off_1000E5F30));
  v36[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 84, &off_1000E5F58));
  v36[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 88, &off_1000E5F80));
  v36[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 3));
  -[W5LogItemRequestInternal setItemRequests:](v9, "setItemRequests:", v13);

  -[W5LogItemRequestInternal setFilename:](v9, "setFilename:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[W5LogItemRequestInternal setAddedAt:](v9, "setAddedAt:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager logManager](self, "logManager"));
  objc_msgSend(v15, "addRequest:", v9);

  v16 = sub_10008F56C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 136315906;
    v29 = "-[W5DiagnosticsModeManager _collectAnalyticsCSVsForDiagnosticMode:]";
    v30 = 2080;
    v31 = "W5DiagnosticsModeManager.m";
    v32 = 1024;
    v33 = 1312;
    v34 = 2112;
    v35 = v9;
    v25 = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v17, 0, "[wifivelocity] %s (%s:%u) Added to W5LogManager queue: %@", &v28, v25);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/run/com.apple.wifivelocity")));
  v19 = (W5LogItemRequestInternal *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "URLByAppendingPathComponent:", v7));

  v20 = sub_10008F56C();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 136315906;
    v29 = "-[W5DiagnosticsModeManager _collectAnalyticsCSVsForDiagnosticMode:]";
    v30 = 2080;
    v31 = "W5DiagnosticsModeManager.m";
    v32 = 1024;
    v33 = 1315;
    v34 = 2114;
    v35 = v19;
    LODWORD(v24) = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v21, 0, "[wifivelocity] %s (%s:%u) [DM] collecting analytics CSVs to dir='%{public}@'", &v28, v24);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localStore](self, "localStore"));
  v26[0] = CFSTR("analyticsCSVsRequestUUID");
  v26[1] = CFSTR("analyticsCSVsOutputPath");
  v27[0] = v8;
  v27[1] = v19;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 2));
  objc_msgSend(v22, "addToStore:newInfo:", v4, v23);

}

- (void)_collectSystemLogsForDiagnosticMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  W5LogItemRequestInternal *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  W5LogItemRequestInternal *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  _QWORD v24[2];
  _QWORD v25[2];
  int v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  W5LogItemRequestInternal *v33;
  void *v34;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DiagnosticsMode-%@-SystemLogs"), v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v9 = objc_alloc_init(W5LogItemRequestInternal);
  -[W5LogItemRequestInternal setUuid:](v9, "setUuid:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 31, &off_1000E5FA8));
  v34 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
  -[W5LogItemRequestInternal setItemRequests:](v9, "setItemRequests:", v11);

  -[W5LogItemRequestInternal setFilename:](v9, "setFilename:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[W5LogItemRequestInternal setAddedAt:](v9, "setAddedAt:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager logManager](self, "logManager"));
  objc_msgSend(v13, "addRequest:", v9);

  v14 = sub_10008F56C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 136315906;
    v27 = "-[W5DiagnosticsModeManager _collectSystemLogsForDiagnosticMode:]";
    v28 = 2080;
    v29 = "W5DiagnosticsModeManager.m";
    v30 = 1024;
    v31 = 1334;
    v32 = 2112;
    v33 = v9;
    v23 = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] %s (%s:%u) Added to W5LogManager queue: %@", &v26, v23);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/run/com.apple.wifivelocity")));
  v17 = (W5LogItemRequestInternal *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URLByAppendingPathComponent:", v7));

  v18 = sub_10008F56C();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 136315906;
    v27 = "-[W5DiagnosticsModeManager _collectSystemLogsForDiagnosticMode:]";
    v28 = 2080;
    v29 = "W5DiagnosticsModeManager.m";
    v30 = 1024;
    v31 = 1337;
    v32 = 2114;
    v33 = v17;
    LODWORD(v22) = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v19, 0, "[wifivelocity] %s (%s:%u) [DM] collecting system logs to dir='%{public}@'", &v26, v22);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localStore](self, "localStore"));
  v24[0] = CFSTR("systemLogsRequestUUID");
  v24[1] = CFSTR("systemLogsOutputPath");
  v25[0] = v8;
  v25[1] = v17;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
  objc_msgSend(v20, "addToStore:newInfo:", v4, v21);

}

- (void)_collectNetworkInfoForDiagnosticMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  W5LogItemRequestInternal *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  NSObject *v13;
  W5LogItemRequestInternal *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  W5DiagnosticsModeManager *v29;
  id v30;
  _QWORD v31[2];
  _QWORD v32[2];
  int v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  W5LogItemRequestInternal *v40;
  _QWORD v41[3];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DiagnosticsMode-%@-NetworkInfo"), v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/run/com.apple.wifivelocity")));
  v9 = (W5LogItemRequestInternal *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5LogItemRequestInternal path](v9, "path"));
  v12 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, 0);

  if (v12)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v14 = objc_alloc_init(W5LogItemRequestInternal);
    -[W5LogItemRequestInternal setUuid:](v14, "setUuid:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 89, &off_1000E5FD0));
    v41[0] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 91, &off_1000E5FF8));
    v41[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[W5LogItemRequest requestWithItemID:configuration:](W5LogItemRequest, "requestWithItemID:configuration:", 92, 0));
    v41[2] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 3));
    -[W5LogItemRequestInternal setItemRequests:](v14, "setItemRequests:", v18);

    -[W5LogItemRequestInternal setFilename:](v14, "setFilename:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[W5LogItemRequestInternal setAddedAt:](v14, "setAddedAt:", v19);

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000D944;
    v27[3] = &unk_1000D52B8;
    v28 = v7;
    v29 = self;
    v20 = v4;
    v30 = v20;
    -[W5LogItemRequestInternal setReply:](v14, "setReply:", v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager logManager](self, "logManager"));
    objc_msgSend(v21, "addRequest:", v14);

    v22 = sub_10008F56C();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 136315906;
      v34 = "-[W5DiagnosticsModeManager _collectNetworkInfoForDiagnosticMode:]";
      v35 = 2080;
      v36 = "W5DiagnosticsModeManager.m";
      v37 = 1024;
      v38 = 1382;
      v39 = 2112;
      v40 = v14;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v23, 0, "[wifivelocity] %s (%s:%u) Added to W5LogManager queue: %@", &v33, 38);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localStore](self, "localStore"));
    v31[0] = CFSTR("networkInfoGenUUID");
    v31[1] = CFSTR("networkInfoOutputPath");
    v32[0] = v13;
    v32[1] = v9;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2));
    objc_msgSend(v24, "addToStore:newInfo:", v20, v25);

  }
  else
  {
    v26 = sub_10008F56C();
    v13 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 136315906;
      v34 = "-[W5DiagnosticsModeManager _collectNetworkInfoForDiagnosticMode:]";
      v35 = 2080;
      v36 = "W5DiagnosticsModeManager.m";
      v37 = 1024;
      v38 = 1389;
      v39 = 2112;
      v40 = v9;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v13, 0, "[wifivelocity] %s (%s:%u) [DM] Unable to create network info dir: %@", &v33, 38);
    }
  }

}

- (NSArray)registeredPeers
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[W5CloudStore sharedStore](W5CloudStore, "sharedStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "registeredPeers"));

  return (NSArray *)v3;
}

- (int64_t)registeredRoleForPeer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager registeredPeers](self, "registeredPeers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peer"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "peerID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peerID"));
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if (v13)
        {
          v6 = objc_msgSend(v9, "role");
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (int64_t)v6;
}

- (NSArray)activeDiagnostics
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager store](self, "store"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "diagnosticsModeWithState:", 3));

  return (NSArray *)v3;
}

- (id)finishedDiagnostics
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager store](self, "store"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "diagnosticsModeWithState:", 11));

  return v3;
}

- (NSArray)allDiagnostics
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager store](self, "store"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "diagnostics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));

  return (NSArray *)v4;
}

- (void)_finishedProcessingDiagnosticMode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager store](self, "store"));
  objc_msgSend(v5, "updateStoreWithDiagnosticsMode:", v4);

}

- (W5Peer)localPeer
{
  return self->_localPeer;
}

- (void)setLocalPeer:(id)a3
{
  objc_storeStrong((id *)&self->_localPeer, a3);
}

- (W5DiagnosticsModePeer)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (int64_t)role
{
  return self->_role;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setRegisteredPeers:(id)a3
{
  objc_storeStrong((id *)&self->_registeredPeers, a3);
}

- (W5FaultEventManager)faultEventManager
{
  return self->_faultEventManager;
}

- (void)setFaultEventManager:(id)a3
{
  objc_storeStrong((id *)&self->_faultEventManager, a3);
}

- (W5NetUsageManager)netUsageManager
{
  return self->_netUsageManager;
}

- (void)setNetUsageManager:(id)a3
{
  objc_storeStrong((id *)&self->_netUsageManager, a3);
}

- (W5PeerManager)peerManager
{
  return self->_peerManager;
}

- (void)setPeerManager:(id)a3
{
  objc_storeStrong((id *)&self->_peerManager, a3);
}

- (W5WiFiSniffManager)snifferManager
{
  return self->_snifferManager;
}

- (void)setSnifferManager:(id)a3
{
  objc_storeStrong((id *)&self->_snifferManager, a3);
}

- (W5LogManager)logManager
{
  return self->_logManager;
}

- (void)setLogManager:(id)a3
{
  objc_storeStrong((id *)&self->_logManager, a3);
}

- (NSUUID)stopNotificationUUID
{
  return self->_stopNotificationUUID;
}

- (void)setStopNotificationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_stopNotificationUUID, a3);
}

- (NSMutableDictionary)lastNotificationTimestamp
{
  return self->_lastNotificationTimestamp;
}

- (void)setLastNotificationTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_lastNotificationTimestamp, a3);
}

- (W5DiagnosticsModeStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (W5DiagnosticsModeLocalStore)localStore
{
  return self->_localStore;
}

- (void)setLocalStore:(id)a3
{
  objc_storeStrong((id *)&self->_localStore, a3);
}

- (NSMutableArray)processors
{
  return self->_processors;
}

- (void)setProcessors:(id)a3
{
  objc_storeStrong((id *)&self->_processors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processors, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_lastNotificationTimestamp, 0);
  objc_storeStrong((id *)&self->_stopNotificationUUID, 0);
  objc_storeStrong((id *)&self->_logManager, 0);
  objc_storeStrong((id *)&self->_snifferManager, 0);
  objc_storeStrong((id *)&self->_peerManager, 0);
  objc_storeStrong((id *)&self->_netUsageManager, 0);
  objc_storeStrong((id *)&self->_faultEventManager, 0);
  objc_storeStrong((id *)&self->_registeredPeers, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_localPeer, 0);
  objc_storeStrong((id *)&self->_statusManager, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
}

@end
