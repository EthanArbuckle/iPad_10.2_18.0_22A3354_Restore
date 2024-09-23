@implementation NDSessionManager

- (void)archiveTimerFired
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AA30;
  block[3] = &unk_1000B23A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)sendPendingCallbacksForIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v6));
  v9 = qword_1000C7158;
  if (v8)
  {
    v10 = (id)qword_1000C7158;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientBundleID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      *(_DWORD *)buf = 138543874;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@>.<%@>.<%@>: instructed to send pending callbacks", buf, 0x20u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_reconnectingProxies, "objectForKeyedSubscript:", v6));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001AA68;
    v16[3] = &unk_1000B1EB8;
    v17 = v7;
    objc_msgSend(v8, "reconnectClient:withCompletion:", v14, v16);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NDChronoKitLauncher sharedLauncher](NDChronoKitLauncher, "sharedLauncher"));
    objc_msgSend(v15, "removePendingLaunchForBundleID:sessionID:", self->_clientBundleID, v6);

    -[NSMutableDictionary removeObjectForKey:](self->_reconnectingProxies, "removeObjectForKey:", v6);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Asked to send pending callbacks for session %@ that we have no record of. This shouldn't happen", buf, 0xCu);
  }

}

- (void)boost
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Holding boost for %@"), self->_clientBundleID));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "beginActivityWithOptions:reason:", 0x80000000000, v4));

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F688;
  block[3] = &unk_1000B23F0;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

- (void)createSessionWithConfiguration:(id)a3 clientProxy:(id)a4 cachesDirectory:(id)a5 options:(id)a6 reply:(id)a7
{
  id v11;
  id v12;
  void *v13;
  int is_extension;
  id v15;
  unsigned __int8 v16;
  NSMutableDictionary *sessions;
  void *v18;
  void *v19;
  unsigned int v20;
  NSObject *v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *clientBundleID;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  NSMutableDictionary *v33;
  void *v34;
  void *v35;
  NSMutableDictionary *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  NSMutableDictionary *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  NSString *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  NSMutableDictionary *reconnectingProxies;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  NSObject *v55;
  void *v56;
  NSString *v57;
  unsigned int v58;
  __objc2_class **v59;
  NSObject *v60;
  void *v61;
  NSString *v62;
  void *v63;
  NSMutableDictionary *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  NSString *v73;
  id v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  const __CFString *v79;
  void *v80;
  _QWORD v81[3];
  _QWORD v82[3];
  const __CFString *v83;
  void *v84;
  const __CFString *v85;
  void *v86;
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  NSString *v90;
  __int16 v91;
  void *v92;

  v11 = a3;
  v76 = a4;
  v77 = a6;
  v78 = a7;
  v12 = -[NDSessionManager copyAndSanitizeClientConfiguration:](self, "copyAndSanitizeClientConfiguration:", v11);
  if (!objc_msgSend(v11, "_supportsAVAssetDownloads")
    || (objc_msgSend(v12, "_supportsAVAssetDownloads") & 1) != 0)
  {
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "_xpcConnection"));
    is_extension = xpc_connection_is_extension();

    if (is_extension)
    {
      v15 = objc_msgSend(objc_alloc((Class)LSApplicationExtensionRecord), "initWithBundleIdentifier:error:", self->_clientBundleID, 0);
      v16 = sub_10001FE28(v15);

    }
    else
    {
      v16 = 0;
    }
    v74 = objc_msgSend(v77, "mutableCopy");
    sessions = self->_sessions;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sessions, "objectForKeyedSubscript:", v18));
    v20 = objc_msgSend(v19, "hasConnectedClient");

    if (v20)
    {
      v21 = (id)qword_1000C7158;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = self->_sessions;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v23));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "uuid"));
        clientBundleID = self->_clientBundleID;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        *(_DWORD *)buf = 138543874;
        v88 = v25;
        v89 = 2112;
        v90 = clientBundleID;
        v91 = 2112;
        v92 = v27;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@>.<%@>.<%@>: already has a connected client, returning nil proxy object to client", buf, 0x20u);

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLError _web_errorWithDomain:code:URL:](NSURLError, "_web_errorWithDomain:code:URL:", NSURLErrorDomain, -996, 0));
      v85 = CFSTR("kNSURLSessionImmediateInvalidationErrorKey");
      v86 = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1));
      (*((void (**)(id, _QWORD, void *, _QWORD))v78 + 2))(v78, 0, v29, 0);
LABEL_10:

      v30 = 0;
      v31 = 0;
      v32 = 0;
LABEL_38:

      goto LABEL_39;
    }
    v33 = self->_sessions;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v33, "objectForKeyedSubscript:", v34));

    if (v35)
    {
      if (((is_extension ^ 1 | v16) & 1) == 0)
      {
        v36 = self->_sessions;
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v36, "objectForKeyedSubscript:", v37));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "sharedContainerIdentifier"));
        v40 = -[NDSessionManager connection:canUseSharedContainerIdentifier:](self, "connection:canUseSharedContainerIdentifier:", v75, v39);

        if ((v40 & 1) == 0)
        {
          v65 = qword_1000C7158;
          if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Connected client is an extension is attempting to a connect to a session without a valid shared data container", buf, 2u);
          }
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLError _web_errorWithDomain:code:URL:](NSURLError, "_web_errorWithDomain:code:URL:", NSURLErrorDomain, -995, 0));
          v83 = CFSTR("kNSURLSessionImmediateInvalidationErrorKey");
          v84 = v28;
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1));
          (*((void (**)(id, _QWORD, void *, _QWORD))v78 + 2))(v78, 0, v29, 0);
          goto LABEL_10;
        }
      }
      v41 = self->_sessions;
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
      v31 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v41, "objectForKeyedSubscript:", v42));

      v43 = (id)qword_1000C7158;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "uuid"));
        v45 = self->_clientBundleID;
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        *(_DWORD *)buf = 138543874;
        v88 = v44;
        v89 = 2112;
        v90 = v45;
        v91 = 2112;
        v92 = v46;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@>.<%@>.<%@>: reconnecting existing session", buf, 0x20u);

      }
      objc_msgSend(v31, "updateOptions:", v77);
      v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "getTasksForReconnection"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "uuid"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "getTLSSessionCachePrefix"));
      v81[0] = CFSTR("NDBackgroundSessionManagerRestoredStateKeyTasks");
      v81[1] = CFSTR("NDBackgroundSessionManagerKeySessionUUID");
      v82[0] = v47;
      v82[1] = v48;
      v81[2] = CFSTR("NDBackgroundSessionManagerRestoredStateKeyTLSSessionCachePrefix");
      v82[2] = v49;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v82, v81, 3));
      reconnectingProxies = self->_reconnectingProxies;
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](reconnectingProxies, "setObject:forKeyedSubscript:", v76, v51);

      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities sessionPath:forBundleID:](NDFileUtilities, "sessionPath:forBundleID:", v52, self->_clientBundleID));

      v53 = 0;
    }
    else
    {
      if (((is_extension ^ 1 | v16) & 1) == 0)
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sharedContainerIdentifier"));

        if (!v54)
        {
          v71 = qword_1000C7158;
          if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Connected client is an extension and did not specify a valid shared container identifier", buf, 2u);
          }
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLError _web_errorWithDomain:code:URL:](NSURLError, "_web_errorWithDomain:code:URL:", NSURLErrorDomain, -995, 0));
          v79 = CFSTR("kNSURLSessionImmediateInvalidationErrorKey");
          v80 = v28;
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1));
          (*((void (**)(id, _QWORD, void *, _QWORD))v78 + 2))(v78, 0, v29, 0);
          goto LABEL_10;
        }
      }
      v55 = (id)qword_1000C7158;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        v57 = self->_clientBundleID;
        *(_DWORD *)buf = 138412546;
        v88 = v56;
        v89 = 2112;
        v90 = v57;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Creating session with identifier: %@ for bundle id: %@", buf, 0x16u);

      }
      v58 = objc_msgSend(v12, "_supportsAVAssetDownloads");
      v59 = off_1000B0350;
      if (!v58)
        v59 = &off_1000B0358;
      v31 = objc_msgSend(objc_alloc((Class)objc_opt_class(*v59)), "initWithConfiguration:bundleID:isSpringBoardApp:downloadDirectory:options:clientProxy:delegate:workQueue:db:", v12, self->_clientBundleID, self->_isSpringBoardApp, 0, v74, v76, self, self->_queue, self->_sessionTasksDB);
      v60 = (id)qword_1000C7158;
      v47 = v60;
      if (v31)
      {
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "uuid"));
          v62 = self->_clientBundleID;
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
          *(_DWORD *)buf = 138543874;
          v88 = v61;
          v89 = 2112;
          v90 = v62;
          v91 = 2112;
          v92 = v63;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@>.<%@>.<%@>: created successfully", buf, 0x20u);

        }
        v64 = self->_sessions;
        v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v64, "setObject:forKeyedSubscript:", v31, v47);
        v30 = 0;
        v32 = 0;
        v53 = 1;
      }
      else
      {
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
          v73 = self->_clientBundleID;
          *(_DWORD *)buf = 138412546;
          v88 = v72;
          v89 = 2112;
          v90 = v73;
          _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Coudn't create session with identifier: %@ for bundle id: %@", buf, 0x16u);

        }
        v30 = 0;
        v31 = 0;
        v53 = 0;
        v32 = 0;
      }
    }

    objc_msgSend(v31, "setXPCConnection:", v75);
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
    (*((void (**)(id, id, void *, id))v78 + 2))(v78, v31, v30, objc_msgSend(v66, "isPrivileged"));

    if (v32)
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringByAppendingPathComponent:", CFSTR("configuration.plist")));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringByAppendingPathComponent:", CFSTR("options.plist")));
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0));
      objc_msgSend(v69, "writeToFile:atomically:", v67, 1);

      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v74, 1, 0));
      objc_msgSend(v70, "writeToFile:atomically:", v68, 1);

    }
    if (v53)
      -[NDSessionManager setWorkState](self, "setWorkState");
    goto LABEL_38;
  }
  (*((void (**)(id, _QWORD, _UNKNOWN **, _QWORD))v78 + 2))(v78, 0, &off_1000B4AC0, 0);
LABEL_39:

}

- (void)setWorkState
{
  +[NDFileUtilities setDaemonWorkState:](NDFileUtilities, "setDaemonWorkState:", -[NSMutableDictionary count](self->_sessions, "count") != 0);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (id)copyAndSanitizeClientConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  NSObject *v10;
  NSString *clientBundleID;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  NSObject *v15;
  void *v16;
  unsigned __int8 v17;
  NSObject *v18;
  void *v19;
  unsigned __int8 v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  unsigned __int8 v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  unsigned __int8 v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  unsigned __int8 v35;
  NSObject *v36;
  id v37;
  void *v39;
  __int128 v40;
  __int128 v41;
  _OWORD v42[2];
  _BYTE buf[32];
  uint64_t v44;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v6 = objc_msgSend(v4, "copy");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sharedContainerIdentifier"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sharedContainerIdentifier"));
    v9 = -[NDSessionManager connection:canUseSharedContainerIdentifier:](self, "connection:canUseSharedContainerIdentifier:", v5, v8);

    if ((v9 & 1) == 0)
    {
      objc_msgSend(v6, "setSharedContainerIdentifier:", 0);
      v10 = (id)qword_1000C7158;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        clientBundleID = self->_clientBundleID;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sharedContainerIdentifier"));
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = clientBundleID;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client %@ tried to specify a shared container that it cannot access: %@", buf, 0x16u);

      }
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_sourceApplicationBundleIdentifier"));
  if (v13)
  {
    v14 = sub_1000131C4(v5, CFSTR("com.apple.private.nsurlsession.impersonate"));

    if ((v14 & 1) == 0)
    {
      objc_msgSend(v6, "set_sourceApplicationBundleIdentifier:", 0);
      v15 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = CFSTR("com.apple.private.nsurlsession.impersonate");
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Client tried to set _sourceApplicationBundleIdentifier but is missing the %@ entitlement", buf, 0xCu);
      }
    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_sourceApplicationSecondaryIdentifier"));
  if (v16)
  {
    v17 = sub_1000131C4(v5, CFSTR("com.apple.private.nsurlsession.impersonate"));

    if ((v17 & 1) == 0)
    {
      objc_msgSend(v6, "set_sourceApplicationSecondaryIdentifier:", 0);
      v18 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = CFSTR("com.apple.private.nsurlsession.impersonate");
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Client tried to set _sourceApplicationSecondaryIdentifier but is missing the %@ entitlement", buf, 0xCu);
      }
    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_sourceApplicationAuditTokenData"));
  if (v19)
  {
    v20 = sub_1000131C4(v5, CFSTR("com.apple.private.nsurlsession.impersonate"));

    if ((v20 & 1) == 0)
    {
      objc_msgSend(v6, "set_sourceApplicationAuditTokenData:", 0);
      v21 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = CFSTR("com.apple.private.nsurlsession.impersonate");
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Client tried to set _sourceApplicationAuditTokenData but is missing the %@ entitlement", buf, 0xCu);
      }
    }
  }
  objc_msgSend(v6, "set_attributedBundleIdentifier:", 0);
  if (objc_msgSend(v6, "_respectsAllowsCellularAccessForDiscretionaryTasks"))
  {
    if ((sub_1000131C4(v5, CFSTR("com.apple.private.nsurlsession.allow-discretionary-cellular")) & 1) == 0)
    {
      objc_msgSend(v6, "set_respectsAllowsCellularAccessForDiscretionaryTasks:", 0);
      v22 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = CFSTR("com.apple.private.nsurlsession.allow-discretionary-cellular");
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Client tried to set _respectsAllowsCellularAccessForDiscretionaryTasks but is missing the %@ entitlement", buf, 0xCu);
      }
    }
  }
  if (objc_msgSend(v6, "_allowsPowerNapScheduling"))
  {
    if ((sub_1000131C4(v5, CFSTR("com.apple.private.dark-wake-network-reachability")) & 1) == 0)
    {
      objc_msgSend(v6, "set_allowsPowerNapScheduling:", 0);
      v23 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = CFSTR("com.apple.private.dark-wake-network-reachability");
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Client tried to set _allowsPowerNapScheduling but is missing the %@ entitlement", buf, 0xCu);
      }
    }
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_connectionPoolName"));
  if (v24)
  {
    v25 = sub_1000131C4(v5, CFSTR("com.apple.private.nsurlsession-allow-override-connection-pool"));

    if ((v25 & 1) == 0)
    {
      objc_msgSend(v6, "set_connectionPoolName:", 0);
      v26 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = CFSTR("com.apple.private.nsurlsession-allow-override-connection-pool");
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Client tried to set _connectionPoolName but is missing the %@ entitlement", buf, 0xCu);
      }
    }
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_directoryForDownloadedFiles"));
  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
    if (objc_msgSend(v28, "isPrivileged"))
    {

    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_directoryForDownloadedFiles"));
      v30 = objc_msgSend(v5, "processIdentifier");
      if (v5)
        objc_msgSend(v5, "auditToken");
      else
        memset(v42, 0, sizeof(v42));
      v31 = objc_msgSend(v29, "_isSafeDirectoryForDownloads:withToken:", v30, v42);

      if ((v31 & 1) == 0)
      {
        v32 = (id)qword_1000C7158;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_directoryForDownloadedFiles"));
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v39;
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Client tried to set _directoryForDownloadedFiles but does not have access to directory %@", buf, 0xCu);

        }
        objc_msgSend(v6, "set_directoryForDownloadedFiles:", 0);
      }
    }
  }
  if (objc_msgSend(v6, "_duetPreauthorized"))
  {
    if ((sub_1000131C4(v5, CFSTR("com.apple.private.nsurlsession.allow-duet-preauthorization")) & 1) == 0)
    {
      objc_msgSend(v6, "set_duetPreauthorized:", 0);
      v33 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = CFSTR("com.apple.private.nsurlsession.allow-duet-preauthorization");
        _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Client tried to set _duetPreauthorized but is missing the %@ entitlement", buf, 0xCu);
      }
    }
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maximumWatchCellularTransferSize"));
  if (v34)
  {
    v35 = sub_1000131C4(v5, CFSTR("com.apple.private.nsurlsession.set-max-watch-cell-transfer-size"));

    if ((v35 & 1) == 0)
    {
      objc_msgSend(v6, "set_maximumWatchCellularTransferSize:", 0);
      v36 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Client tried to set _maximumWatchCellularTransferSize but is missing the necessary entitlement", buf, 2u);
      }
    }
  }
  if ((sub_1000131C4(v5, CFSTR("get-task-allow")) & 1) != 0
    || (sub_1000131C4(v5, CFSTR("com.apple.security.get-task-allow")) & 1) != 0
    || os_variant_allows_internal_security_policies("com.apple.CFNetwork"))
  {
    v37 = objc_msgSend(v5, "processIdentifier");
  }
  else
  {
    v37 = 0;
  }
  objc_msgSend(v6, "set_pidForHAR:", v37);
  v40 = 0u;
  v41 = 0u;
  if (v5)
    objc_msgSend(v5, "auditToken", v40, v41);
  *(_QWORD *)buf = 0;
  *(_OWORD *)&buf[16] = 0u;
  v44 = 0;
  *(_QWORD *)&buf[8] = &v40;
  objc_msgSend(v6, "set_neTrackerTCCResult:", ne_tracker_check_tcc(buf));

  return v6;
}

- (BOOL)connection:(id)a3 canUseSharedContainerIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  NSObject *v11;
  NSString *clientBundleID;
  int v14;
  id v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  int v19;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.security.application-groups")));
    v9 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0 && (objc_msgSend(v8, "containsObject:", v7) & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      v11 = qword_1000C7158;
      v10 = 0;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
      {
        clientBundleID = self->_clientBundleID;
        v14 = 138412802;
        v15 = v7;
        v16 = 2112;
        v17 = clientBundleID;
        v18 = 1024;
        v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Client specified shared container identifier %@. %@ can access: %d", (uint8_t *)&v14, 0x1Cu);
        v10 = 0;
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isSpringBoardApp
{
  return self->_isSpringBoardApp;
}

- (NDSessionManager)initWithDelegate:(id)a3 bundleID:(id)a4 isSpringBoardApp:(BOOL)a5 forPersona:(id)a6 dataSeparatedPath:(id)a7 db:(id)a8
{
  id v14;
  id v15;
  id v16;
  NDSessionManager *v17;
  NDSessionManager *v18;
  uint64_t v19;
  NSMutableDictionary *sessions;
  uint64_t v21;
  NSMutableDictionary *reconnectingProxies;
  void *v23;
  uint64_t v24;
  NSURL *bundleDirectory;
  dispatch_queue_attr_t v26;
  NSObject *v27;
  dispatch_queue_t v28;
  OS_dispatch_queue *queue;
  id boost;
  dispatch_source_t v31;
  OS_dispatch_source *powerlogPeriodicUpdateTimer;
  NSObject *v33;
  NSObject *v34;
  dispatch_time_t v35;
  id v37;
  id v38;
  _QWORD handler[4];
  NDSessionManager *v40;
  objc_super v41;

  v14 = a3;
  v38 = a4;
  v37 = a6;
  v15 = a7;
  v16 = a8;
  v41.receiver = self;
  v41.super_class = (Class)NDSessionManager;
  v17 = -[NDSessionManager init](&v41, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_delegate, v14);
    objc_storeStrong((id *)&v18->_clientBundleID, a4);
    v19 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    sessions = v18->_sessions;
    v18->_sessions = (NSMutableDictionary *)v19;

    v21 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    reconnectingProxies = v18->_reconnectingProxies;
    v18->_reconnectingProxies = (NSMutableDictionary *)v21;

    objc_storeStrong((id *)&v18->_persona, a6);
    objc_storeStrong((id *)&v18->_containerPath, a7);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities bundleManagerPath:](NDFileUtilities, "bundleManagerPath:", v18->_clientBundleID));
    v24 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v23));
    bundleDirectory = v18->_bundleDirectory;
    v18->_bundleDirectory = (NSURL *)v24;

    v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    v28 = dispatch_queue_create("com.apple.nsurlsessiond.session-manager", v27);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v28;

    objc_storeStrong((id *)&v18->_sessionTasksDB, a8);
    boost = v18->_boost;
    v18->_boost = 0;

    v18->_isSpringBoardApp = a5;
    +[NDFileUtilities createDirectoryAtURL:](NDFileUtilities, "createDirectoryAtURL:", v18->_bundleDirectory);
    v31 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v18->_queue);
    powerlogPeriodicUpdateTimer = v18->_powerlogPeriodicUpdateTimer;
    v18->_powerlogPeriodicUpdateTimer = (OS_dispatch_source *)v31;

    v33 = v18->_powerlogPeriodicUpdateTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100031FF0;
    handler[3] = &unk_1000B23A0;
    v40 = v18;
    dispatch_source_set_event_handler(v33, handler);
    v34 = v18->_powerlogPeriodicUpdateTimer;
    v35 = dispatch_time(0, 7200000000000);
    dispatch_source_set_timer(v34, v35, 0x68C61714000uLL, 0x3B9ACA00uLL);
    dispatch_resume((dispatch_object_t)v18->_powerlogPeriodicUpdateTimer);

  }
  return v18;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_source_cancel((dispatch_source_t)self->_powerlogPeriodicUpdateTimer);
  v3.receiver = self;
  v3.super_class = (Class)NDSessionManager;
  -[NDSessionManager dealloc](&v3, "dealloc");
}

- (id)downloadDirectoryDataPath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_bundleDirectory, "URLByAppendingPathComponent:", CFSTR("downloadDirectoryPath.plist")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "path"));

  return v3;
}

- (id)restoreState:(BOOL *)a3
{
  NSObject *v4;
  NSString *clientBundleID;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  unsigned int v20;
  __objc2_class **v21;
  objc_class *v22;
  uint64_t v23;
  void *v24;
  double v25;
  int v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  double v33;
  NSString *v34;
  NSObject *v35;
  NSString *v36;
  NSObject *v37;
  NSObject *v38;
  NSString *v39;
  void *v40;
  double v41;
  NSMutableDictionary *sessions;
  NSObject *v43;
  NSObject *v44;
  NSString *v45;
  double v46;
  NSString *v47;
  double v48;
  double v49;
  NSString *v50;
  NSString *v51;
  id v52;
  BOOL v53;
  NSString *v55;
  NSString *v56;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id obj;
  id obja;
  void *v65;
  uint64_t v66;
  void *v67;
  id v68;
  unsigned __int8 v69;
  char v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  double v76;
  __int16 v77;
  NSString *v78;
  __int16 v79;
  NSString *v80;
  _BYTE v81[128];

  v4 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    clientBundleID = self->_clientBundleID;
    *(_DWORD *)buf = 138412290;
    v76 = *(double *)&clientBundleID;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "restoreState: %@", buf, 0xCu);
  }
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  obj = (id)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _getAllSessionIDsForBundle:](self->_sessionTasksDB, "_getAllSessionIDsForBundle:", self->_clientBundleID));
  if ((unint64_t)objc_msgSend(obj, "count") >= 0x401)
  {
    v6 = (id)qword_1000C7158;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v55 = self->_clientBundleID;
      v56 = (NSString *)objc_msgSend(obj, "count");
      *(_DWORD *)buf = 138543618;
      v76 = *(double *)&v55;
      v77 = 2048;
      v78 = v56;
      _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Too many sessions for app <%{public}@> (%zu > 1024)", buf, 0x16u);
    }

    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "subarrayWithRange:", 0, 1024));
    obj = (id)v7;
  }
  v58 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  obja = obj;
  v8 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
  if (v8)
  {
    v66 = *(_QWORD *)v72;
    do
    {
      v9 = 0;
      v68 = v8;
      do
      {
        if (*(_QWORD *)v72 != v66)
          objc_enumerationMutation(obja);
        v10 = *(NSString **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)v9);
        v11 = objc_autoreleasePoolPush();
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities sessionPath:forBundleID:](NDFileUtilities, "sessionPath:forBundleID:", v10, self->_clientBundleID));
        v70 = 0;
        v13 = objc_msgSend(v67, "fileExistsAtPath:isDirectory:", v12, &v70);
        if (v70)
          v14 = v13;
        else
          v14 = 0;
        if (v14 != 1)
        {
          v35 = qword_1000C7158;
          if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
          {
            v36 = self->_clientBundleID;
            *(_DWORD *)buf = 138412546;
            v76 = *(double *)&v36;
            v77 = 2112;
            v78 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "No directory for bundleID: %@, sessionID: %@", buf, 0x16u);
          }
          goto LABEL_35;
        }
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("configuration.plist")));
        v15 = sub_10001F820((uint64_t)NSKeyedUnarchiver, v65);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = v16;
        if (!v16
          || (v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier")),
              v19 = objc_msgSend(v18, "isEqualToString:", v10),
              v18,
              !v19))
        {
          v37 = qword_1000C7158;
          if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
          {
            v45 = self->_clientBundleID;
            *(_DWORD *)buf = 138412546;
            v76 = *(double *)&v45;
            v77 = 2112;
            v78 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Missing or invalid configuration.plist for bundleID: %@, sessionID: %@. Removing session directory", buf, 0x16u);
          }
          +[NDFileUtilities removeItemAtPath:](NDFileUtilities, "removeItemAtPath:", v12);

          goto LABEL_35;
        }
        v20 = objc_msgSend(v17, "_supportsAVAssetDownloads");
        v21 = off_1000B0350;
        if (!v20)
          v21 = &off_1000B0358;
        v22 = (objc_class *)objc_opt_class(*v21);
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("options.plist")));
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[NDSessionManager restoreOptionsFromArchivePath:](NDSessionManager, "restoreOptionsFromArchivePath:", v23));
        v60 = (void *)v23;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("NSURLSessionLastDisconnectDateKey")));
        if (!v24)
          goto LABEL_23;
        v61 = v24;
        objc_msgSend(v24, "timeIntervalSinceNow");
        if (v25 < -31536000.0)
        {

LABEL_23:
          v61 = 0;
          v26 = 1;
          goto LABEL_24;
        }
        objc_msgSend(v61, "timeIntervalSinceNow");
        if (v41 <= -2592000.0)
        {
          v43 = (id)qword_1000C7158;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v61, "timeIntervalSinceNow");
            v49 = v48;
            v50 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
            v51 = self->_clientBundleID;
            *(_DWORD *)buf = 134218498;
            v76 = -v49;
            v77 = 2112;
            v78 = v50;
            v79 = 2112;
            v80 = v51;
            _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Ignoring stale session (inactive for %fs) with identifier: %@ for bundle id: %@", buf, 0x20u);

          }
LABEL_49:
          v44 = (id)qword_1000C7158;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            v46 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier")));
            v47 = self->_clientBundleID;
            *(_DWORD *)buf = 138412546;
            v76 = v46;
            v77 = 2112;
            v78 = v47;
            _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Coudn't restore session with identifier: %@ for bundle id: %@", buf, 0x16u);

          }
          +[NDFileUtilities removeItemAtPath:](NDFileUtilities, "removeItemAtPath:", v12);

LABEL_35:
          if (-[NSString isEqualToString:](self->_clientBundleID, "isEqualToString:", CFSTR("com.apple.OTACrashCopier")))
          {
            v38 = qword_1000C7158;
            if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
            {
              v39 = self->_clientBundleID;
              *(_DWORD *)buf = 138412546;
              v76 = *(double *)&v39;
              v77 = 2112;
              v78 = v10;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Launching application %@ since we could not restore session %@", buf, 0x16u);
            }
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NDApplication applicationWithIdentifier:](NDApplication, "applicationWithIdentifier:", self->_clientBundleID));
            objc_msgSend(v40, "wakeForSessionIdentifier:withSessionUUID:wakeRequirement:", v10, 0, 2);

          }
          goto LABEL_39;
        }
        v26 = 0;
LABEL_24:
        v27 = objc_msgSend([v22 alloc], "initWithConfiguration:bundleID:isSpringBoardApp:downloadDirectory:options:clientProxy:delegate:workQueue:db:", v17, self->_clientBundleID, self->_isSpringBoardApp, 0, v62, 0, self, self->_queue, self->_sessionTasksDB);
        if (v26)
        {
          v28 = objc_msgSend(v62, "mutableCopy");
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
          objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, CFSTR("NSURLSessionLastDisconnectDateKey"));

          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v28, 1, 0));
          objc_msgSend(v30, "writeToFile:atomically:", v60, 1);

        }
        if (!v27)
          goto LABEL_49;
        v69 = 0;
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "restoreTasks:", &v69));
        v31 = v69;
        if (v69)
        {
          v32 = (id)qword_1000C7158;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier")));
            v34 = self->_clientBundleID;
            *(_DWORD *)buf = 138412546;
            v76 = v33;
            v77 = 2112;
            v78 = v34;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Not restoring session with identifier: %@ for bundleID: %@ since it does not have any tasks", buf, 0x16u);

          }
        }
        else
        {
          objc_msgSend(v58, "addObjectsFromArray:", v59);
          sessions = self->_sessions;
          v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](sessions, "setObject:forKeyedSubscript:", v27, v32);
        }

        if (v31)
          goto LABEL_35;
LABEL_39:

        objc_autoreleasePoolPop(v11);
        v9 = (char *)v9 + 1;
      }
      while (v68 != v9);
      v8 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
    }
    while (v8);
  }

  v52 = -[NSMutableDictionary count](self->_sessions, "count");
  v53 = v52 == 0;
  if (!v52)
    +[NDFileUtilities removeItemAtURL:](NDFileUtilities, "removeItemAtURL:", self->_bundleDirectory);
  if (a3)
    *a3 = v53;
  -[NDSessionManager setWorkState](self, "setWorkState");

  return v58;
}

- (void)dropBoost
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031EF0;
  block[3] = &unk_1000B23A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)releaseAssertionForSession:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  int v10;
  id v11;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "releaseAssertionForSession: %@", (uint8_t *)&v10, 0xCu);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](NDSpringBoard, "sharedSpringBoard"));
  objc_msgSend(v9, "releaseAssertionForBundleID:sessionID:", self->_clientBundleID, v6);

  v7[2](v7);
}

- (void)okayToSendPendingCallbacksForIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v6));
  v9 = qword_1000C7158;
  if (v8)
  {
    v10 = (id)qword_1000C7158;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientBundleID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      v14 = 138543874;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@>.<%@>.<%@>: notified it is OK to send pending callbacks", (uint8_t *)&v14, 0x20u);

    }
    objc_msgSend(v8, "allowReconnect");
  }
  else if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
  {
    v14 = 138412290;
    v15 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Signalled that it is okay to send pending callbacks for session %@ that we have no record of. This shouldn't happen", (uint8_t *)&v14, 0xCu);
  }
  v7[2](v7);

}

- (void)getActiveSessionIdentifiersWithReply:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_sessions, "allKeys"));
  v5[2](v5, v4);

  if (!-[NSMutableDictionary count](self->_sessions, "count"))
    -[NDSessionManager cleanupWithCompletionHandler:](self, "cleanupWithCompletionHandler:", 0);

}

- (void)obliterateAllSessionsWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *clientBundleID;
  int v7;
  NSString *v8;

  v4 = a3;
  v5 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    clientBundleID = self->_clientBundleID;
    v7 = 138412290;
    v8 = clientBundleID;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "obliterateAllSessions for bundleID %@", (uint8_t *)&v7, 0xCu);
  }
  if (-[NSMutableDictionary count](self->_sessions, "count"))
  {
    -[NDSessionManager setObliterationCompletion:](self, "setObliterationCompletion:", v4);
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_sessions, "enumerateKeysAndObjectsUsingBlock:", &stru_1000B12C0);
  }
  else
  {
    -[NDSessionManager cleanupWithCompletionHandler:](self, "cleanupWithCompletionHandler:", v4);
  }

}

- (void)cleanupWithCompletionHandler:(id)a3
{
  id v4;
  id WeakRetained;
  NSString *clientBundleID;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  +[NDFileUtilities removeItemAtURL:](NDFileUtilities, "removeItemAtURL:", self->_bundleDirectory);
  -[NDSessionManager dropBoost](self, "dropBoost");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  clientBundleID = self->_clientBundleID;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100031E4C;
  v8[3] = &unk_1000B12E8;
  v7 = v4;
  v8[4] = self;
  v9 = v7;
  objc_msgSend(WeakRetained, "managerBecameEmpty:bundleID:withCompletionHandler:", self, clientBundleID, v8);

}

- (void)sessionCompleted:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSMutableDictionary *sessions;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  sessions = self->_sessions;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v10 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sessions, "objectForKeyedSubscript:", v9));

  if (v10 != v6)
  {
    if (!v7)
      goto LABEL_11;
    goto LABEL_9;
  }
  v11 = (id)qword_1000C7158;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "clientBundleID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v17 = 138543874;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    v21 = 2112;
    v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@>.<%@>.<%@>: removing session", (uint8_t *)&v17, 0x20u);

  }
  v15 = self->_sessions;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  -[NSMutableDictionary removeObjectForKey:](v15, "removeObjectForKey:", v16);

  if (!-[NSMutableDictionary count](self->_sessions, "count"))
  {
    -[NDSessionManager cleanupWithCompletionHandler:](self, "cleanupWithCompletionHandler:", v7);
    goto LABEL_11;
  }
  if (v7)
  {
    -[NDSessionManager setWorkState](self, "setWorkState");
LABEL_9:
    v7[2](v7);
  }
LABEL_11:

}

- (id)getSessionWithIdentifier:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", a3));
}

- (void)clientApplicationWasReinstalled
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031E30;
  block[3] = &unk_1000B23A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)obliterate
{
  NSObject *v3;
  NSString *clientBundleID;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  NSString *v8;

  v3 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    clientBundleID = self->_clientBundleID;
    *(_DWORD *)buf = 138412290;
    v8 = clientBundleID;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Obliterating session manager for bundle ID: %@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031E14;
  block[3] = &unk_1000B23A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSXPCConnection)xpcConn
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConn);
}

- (void)setXpcConn:(id)a3
{
  objc_storeWeak((id *)&self->_xpcConn, a3);
}

- (NDSessionManagerDelegate)delegate
{
  return (NDSessionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setIsSpringBoardApp:(BOOL)a3
{
  self->_isSpringBoardApp = a3;
}

- (NSString)persona
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPersona:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)containerPath
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setContainerPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (id)obliterationCompletion
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setObliterationCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_obliterationCompletion, 0);
  objc_storeStrong((id *)&self->_containerPath, 0);
  objc_storeStrong((id *)&self->_persona, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_xpcConn);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionTasksDB, 0);
  objc_storeStrong((id *)&self->_powerlogPeriodicUpdateTimer, 0);
  objc_storeStrong(&self->_boost, 0);
  objc_storeStrong((id *)&self->_bundleDirectory, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_reconnectingProxies, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
}

+ (id)restoreOptionsFromArchivePath:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (!v5)
    goto LABEL_5;
  v6 = sub_10001F820((uint64_t)NSKeyedUnarchiver, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    v8 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
    {

LABEL_5:
      v7 = 0;
    }
  }

  return v7;
}

@end
