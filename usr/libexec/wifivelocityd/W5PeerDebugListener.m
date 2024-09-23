@implementation W5PeerDebugListener

- (W5PeerDebugListener)initWithDebugManager:(id)a3
{
  id v5;
  W5PeerDebugListener *v6;
  W5PeerDebugListener *v7;
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
  v12.super_class = (Class)W5PeerDebugListener;
  v6 = -[W5PeerDebugListener init](&v12, "init");
  v7 = v6;
  if (!v6 || (objc_storeStrong((id *)&v6->_debugManager, a3), !v7->_debugManager))
  {

    v8 = sub_10008F56C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = "-[W5PeerDebugListener initWithDebugManager:]";
      v15 = 2080;
      v16 = "W5PeerDebugListener.m";
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
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  W5PeerDebugResponsePayload *v10;
  void *v11;
  void *v12;
  id v13;
  int64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  const char *v29;
  int v30;
  id v31;
  NSErrorUserInfoKey v32;
  const __CFString *v33;
  NSErrorUserInfoKey v34;
  const __CFString *v35;
  NSErrorUserInfoKey v36;
  const __CFString *v37;
  int v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
  v6 = objc_msgSend(v5, "requestType");
  v7 = sub_10008F56C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
    v38 = 136316674;
    v39 = "-[W5PeerDebugListener handleClientRequest:]";
    v40 = 2080;
    v41 = "W5PeerDebugListener.m";
    v42 = 1024;
    v43 = 46;
    v44 = 2114;
    v45 = v4;
    v46 = 2114;
    v47 = v5;
    v48 = 2114;
    v49 = v9;
    v50 = 2050;
    v51 = objc_msgSend(v5, "requestType");
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) incoming request='%{public}@', payload='%{public}@', debug_config='%{public}@', type='%{public}ld'", &v38, 68);

  }
  v10 = objc_alloc_init(W5PeerDebugResponsePayload);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[W5PeerDebugListener currentVersion](self, "currentVersion")));
  -[W5PeerDebugResponsePayload setVersion:](v10, "setVersion:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "version"));
  v13 = objc_msgSend(v12, "integerValue");
  v14 = -[W5PeerDebugListener currentVersion](self, "currentVersion");

  if (v13 != (id)v14)
  {
    -[W5PeerDebugResponsePayload setStatus:](v10, "setStatus:", 3);
    v32 = NSLocalizedFailureReasonErrorKey;
    v33 = CFSTR("W5NotSupportedErr");
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 4, v17));
LABEL_21:

    goto LABEL_22;
  }
  if (v6 == (id)2)
  {
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
    if (v17)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugListener debugManager](self, "debugManager"));
      objc_msgSend(v20, "setDebugConfiguration:reply:", v17, 0);
      v18 = 0;
      v21 = 1;
    }
    else
    {
      v25 = sub_10008F56C();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v38 = 136315650;
        v39 = "-[W5PeerDebugListener handleClientRequest:]";
        v40 = 2080;
        v41 = "W5PeerDebugListener.m";
        v42 = 1024;
        v43 = 69;
        LODWORD(v29) = 28;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v26, 0, "[wifivelocity] %s (%s:%u) failed to unarchive responseObject object", (const char *)&v38, v29, v30);
      }

      v34 = NSLocalizedFailureReasonErrorKey;
      v35 = CFSTR("W5ParamErr");
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v20));
      v21 = 2;
    }

    -[W5PeerDebugResponsePayload setStatus:](v10, "setStatus:", v21);
    goto LABEL_21;
  }
  if (v6 == (id)1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugListener debugManager](self, "debugManager"));
    v31 = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "queryDebugConfigurationAndReturnError:", &v31));
    v17 = v31;

    if (v17 || !v16)
    {
      v22 = sub_10008F56C();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v38 = 136315906;
        v39 = "-[W5PeerDebugListener handleClientRequest:]";
        v40 = 2080;
        v41 = "W5PeerDebugListener.m";
        v42 = 1024;
        v43 = 60;
        v44 = 2114;
        v45 = v17;
        LODWORD(v29) = 38;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v23, 0, "[wifivelocity] %s (%s:%u) failed to retrieve debug configuration error='%{public}@'", &v38, v29);
      }

      v36 = NSLocalizedFailureReasonErrorKey;
      v37 = CFSTR("W5ParamErr");
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, v24));

      v19 = 2;
    }
    else
    {
      -[W5PeerDebugResponsePayload setConfiguration:](v10, "setConfiguration:", v16);
      v18 = 0;
      v19 = 1;
    }
    -[W5PeerDebugResponsePayload setStatus:](v10, "setStatus:", v19);

    goto LABEL_21;
  }
  v18 = 0;
LABEL_22:
  v27 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handler"));
  ((void (**)(_QWORD, W5PeerDebugResponsePayload *, void *))v27)[2](v27, v10, v18);

  return 1;
}

- (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.wifi.peer.debugConfiguration");
}

- (int64_t)currentVersion
{
  return 1;
}

- (Class)requestPayloadClass
{
  return (Class)objc_opt_class(W5PeerDebugRequestPayload, a2);
}

- (W5DebugManager)debugManager
{
  return self->_debugManager;
}

- (void)setDebugManager:(id)a3
{
  objc_storeStrong((id *)&self->_debugManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugManager, 0);
}

@end
