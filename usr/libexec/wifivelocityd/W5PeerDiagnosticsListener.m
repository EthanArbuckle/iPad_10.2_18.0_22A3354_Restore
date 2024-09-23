@implementation W5PeerDiagnosticsListener

- (W5PeerDiagnosticsListener)initWithDiagnosticsManager:(id)a3
{
  id v5;
  W5PeerDiagnosticsListener *v6;
  W5PeerDiagnosticsListener *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v11;
  objc_super v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)W5PeerDiagnosticsListener;
  v6 = -[W5PeerDiagnosticsListener init](&v12, "init");
  v7 = v6;
  if (!v6 || (objc_storeStrong((id *)&v6->_diagnosticsManager, a3), !v7->_diagnosticsManager))
  {

    v8 = sub_10008F56C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = "-[W5PeerDiagnosticsListener initWithDiagnosticsManager:]";
      v15 = 2080;
      v16 = "W5PeerDiagnosticsListener.m";
      v17 = 1024;
      v18 = 36;
      LODWORD(v11) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) init error!", (const char *)&v13, v11, LODWORD(v12.receiver));
    }

    v7 = 0;
  }

  return v7;
}

- (BOOL)handleClientRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  W5PeerDiagnosticsResponsePayload *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "version"));
    v8 = sub_10008F56C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136316418;
      v21 = "-[W5PeerDiagnosticsListener handleClientRequest:]";
      v22 = 2080;
      v23 = "W5PeerDiagnosticsListener.m";
      v24 = 1024;
      v25 = 45;
      v26 = 2114;
      v27 = v4;
      v28 = 2114;
      v29 = v6;
      v30 = 2114;
      v31 = v7;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) incoming request='%{public}@', payload='%{public}@' version='%{public}@'", &v20, 58);
    }

    v10 = objc_alloc_init(W5PeerDiagnosticsResponsePayload);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[W5PeerDiagnosticsListener currentVersion](self, "currentVersion")));
    -[W5PeerDiagnosticsResponsePayload setVersion:](v10, "setVersion:", v11);

    -[W5PeerDiagnosticsResponsePayload setStatus:](v10, "setStatus:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tests"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configuration"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsListener _runDiagnostics:uuid:configuration:](self, "_runDiagnostics:uuid:configuration:", v12, v14, v13));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("testResults")));
    if (v16)
    {
      -[W5PeerDiagnosticsResponsePayload setResults:](v10, "setResults:", v16);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("testError")));
      -[W5PeerDiagnosticsResponsePayload setError:](v10, "setError:", v17);

    }
    v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handler"));
    ((void (**)(_QWORD, W5PeerDiagnosticsResponsePayload *, _QWORD))v18)[2](v18, v10, 0);

  }
  return 1;
}

- (Class)requestPayloadClass
{
  return (Class)objc_opt_class(W5PeerDiagnosticsRequestPayload, a2);
}

- (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.wifi.peer.peerDiagnostics");
}

- (int64_t)currentVersion
{
  return 1;
}

- (id)_runDiagnostics:(id)a3 uuid:(id)a4 configuration:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  dispatch_semaphore_t v12;
  W5DiagnosticsTestRequestInternal *v13;
  void *v14;
  id v15;
  NSObject *v16;
  dispatch_time_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString **v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  int v27;
  void **v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *);
  void *v31;
  id v32;
  NSObject *v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t *v37;
  _QWORD v38[3];
  char v39;
  _QWORD v40[3];
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  const __CFString *v54;
  uint64_t v55;
  const __CFString *v56;
  uint64_t v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  uint64_t v65;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = sub_10001E334;
  v52 = sub_10001E344;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = sub_10001E334;
  v46 = sub_10001E344;
  v47 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v39 = 0;
  v11 = objc_alloc_init((Class)NSLock);
  v12 = dispatch_semaphore_create(0);
  v13 = objc_alloc_init(W5DiagnosticsTestRequestInternal);
  -[W5DiagnosticsTestRequestInternal setUuid:](v13, "setUuid:", v9);
  -[W5DiagnosticsTestRequestInternal setTestRequests:](v13, "setTestRequests:", v8);
  -[W5DiagnosticsTestRequestInternal setConfiguration:](v13, "setConfiguration:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("IncludeEvents")));
  -[W5DiagnosticsTestRequestInternal setIncludeEvents:](v13, "setIncludeEvents:", objc_msgSend(v14, "BOOLValue"));

  v28 = _NSConcreteStackBlock;
  v29 = 3221225472;
  v30 = sub_10001E34C;
  v31 = &unk_1000D5BD0;
  v15 = v11;
  v32 = v15;
  v34 = v40;
  v35 = v38;
  v36 = &v42;
  v37 = &v48;
  v16 = v12;
  v33 = v16;
  -[W5DiagnosticsTestRequestInternal setReply:](v13, "setReply:", &v28);
  -[W5DiagnosticsManager addRequest:](self->_diagnosticsManager, "addRequest:", v13);
  v17 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v16, v17) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v59 = 0x404E000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  if (v43[5])
  {
    v18 = sub_10008F56C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v43[5];
      *(_DWORD *)buf = 136315906;
      v59 = (uint64_t)"-[W5PeerDiagnosticsListener _runDiagnostics:uuid:configuration:]";
      v60 = 2080;
      v61 = "W5PeerDiagnosticsListener.m";
      v62 = 1024;
      v63 = 116;
      v64 = 2114;
      v65 = v20;
      v27 = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v19, 0, "[wifivelocity] %s (%s:%u) Replying with error %{public}@", buf, v27, v28, v29, v30, v31, v32);
    }

    v21 = v43[5];
    v56 = CFSTR("testError");
    v57 = v21;
    v22 = &v56;
    v23 = &v57;
  }
  else
  {
    v24 = v49[5];
    v54 = CFSTR("testResults");
    v55 = v24;
    v22 = &v54;
    v23 = &v55;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 1));

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
  return v25;
}

- (W5DiagnosticsManager)diagnosticsManager
{
  return self->_diagnosticsManager;
}

- (void)setDiagnosticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticsManager, 0);
}

@end
