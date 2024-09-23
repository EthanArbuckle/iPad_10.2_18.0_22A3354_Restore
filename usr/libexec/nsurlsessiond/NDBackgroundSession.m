@implementation NDBackgroundSession

- (BOOL)sessionHasOutstandingTasks
{
  NSObject *v3;
  void *v4;
  id v5;
  int v7;
  void *v8;
  __int16 v9;
  id v10;

  v3 = (id)qword_1000C7158;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v5 = -[NSMutableArray count](self->_outstandingTaskIDs, "count");
    v7 = 138543618;
    v8 = v4;
    v9 = 2048;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> has %lu outstanding tasks", (uint8_t *)&v7, 0x16u);

  }
  return -[NSMutableArray count](self->_outstandingTaskIDs, "count") != 0;
}

- (id)descriptionForRequest:(id)a3
{
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "_timeWindowDelay");
  if (v4 == 0.0 && (objc_msgSend(v3, "_timeWindowDuration"), v5 == 0.0))
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ [allowsCellularAccess: %d]"), v3, objc_msgSend(v3, "allowsCellularAccess")));
  }
  else
  {
    objc_msgSend(v3, "_timeWindowDelay");
    v7 = v6;
    objc_msgSend(v3, "_timeWindowDuration");
    v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ [delay: %f, duration: %f, allowsCellularAccess: %d]"), v3, v7, v8, objc_msgSend(v3, "allowsCellularAccess")));
  }
  v10 = (void *)v9;

  return v10;
}

- (id)_URLSession:(id)a3 downloadTaskNeedsDownloadDirectory:(id)a4
{
  void *v5;
  NSURL *downloadDirectory;
  NSURL *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon", a3, a4));
  if ((objc_msgSend(v5, "isPrivileged") & 1) != 0)
    downloadDirectory = 0;
  else
    downloadDirectory = self->_downloadDirectory;
  v7 = downloadDirectory;

  return v7;
}

- (void)ensureSessionDownloadDirectoryExists
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  NSObject *v6;
  void *v7;
  NSString *identifier;
  NSString *clientBundleID;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  NSString *v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  void *v18;

  if (self->_downloadDirectory)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_downloadDirectory, "path"));
    v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (id)qword_1000C7158;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        identifier = self->_identifier;
        clientBundleID = self->_clientBundleID;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_downloadDirectory, "path"));
        v11 = 138544130;
        v12 = v7;
        v13 = 2112;
        v14 = clientBundleID;
        v15 = 2112;
        v16 = identifier;
        v17 = 2112;
        v18 = v10;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Session <%@>.<%@> download path %@ did not exist, recreating.", (uint8_t *)&v11, 0x2Au);

      }
      +[NDFileUtilities createDirectoryAtURL:](NDFileUtilities, "createDirectoryAtURL:", self->_downloadDirectory);
    }
  }
}

- (void)setTLSSessionCachePrefix:(id)a3
{
  id v4;

  v4 = a3;
  -[NSURLSession set_tlsSessionCachePrefix:](self->_userInitiatedSession, "set_tlsSessionCachePrefix:");
  -[NSURLSession set_tlsSessionCachePrefix:](self->_discretionaryPrioritySession, "set_tlsSessionCachePrefix:", v4);

}

- (BOOL)errorIfBlockedTracker:(id)a3 url:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  int neTrackerTCCResult;
  id v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[3];
  int v18;
  int v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v8 = -[NSString UTF8String](self->_monitoredAppBundleID, "UTF8String");
  v17[1] = 0;
  v17[2] = 0;
  v17[0] = v8;
  neTrackerTCCResult = self->_neTrackerTCCResult;
  v18 = 0;
  v19 = neTrackerTCCResult;
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "host")));
  v11 = ne_tracker_check_is_hostname_blocked(objc_msgSend(v10, "UTF8String"), v17);

  if (v11 == 1)
  {
    v12 = (id)qword_1000C7158;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_loggableDescription"));
      *(_DWORD *)buf = 138543618;
      v22 = v15;
      v23 = 2114;
      v24 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ is blocked due to tracker policy", buf, 0x16u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error:code:", NSURLErrorDomain, -1004));
    objc_msgSend(v6, "cancel_with_error:", v13);

  }
  return v11 == 1;
}

- (BOOL)hasConnectedClient
{
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  NSString *clientBundleID;
  NSString *identifier;
  int v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  NSString *v24;

  if (self->_xpcConn)
    v3 = self->_clientProxy != 0;
  else
    v3 = 0;
  v4 = (id)qword_1000C7158;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v6 = (void *)v5;
    if (v3)
      v7 = 89;
    else
      v7 = 78;
    if (self->_xpcConn)
      v8 = 89;
    else
      v8 = 78;
    identifier = self->_identifier;
    clientBundleID = self->_clientBundleID;
    if (self->_clientProxy)
      v11 = 89;
    else
      v11 = 78;
    v13 = 138544642;
    v14 = v5;
    v15 = 2112;
    v16 = clientBundleID;
    v17 = 1024;
    v18 = v7;
    v19 = 1024;
    v20 = v8;
    v21 = 1024;
    v22 = v11;
    v23 = 2112;
    v24 = identifier;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> client %@ connected result (%c), XPC(%c) proxy(%c) for %@", (uint8_t *)&v13, 0x32u);

  }
  return v3;
}

- (id)getTasksForReconnection
{
  id v3;
  NSObject *v4;
  void *v5;
  NSString *identifier;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  NSString *v12;
  __int16 v13;
  id v14;

  v3 = -[NSMutableDictionary copy](self->_identifiersToTaskInfo, "copy");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000FAD0;
  v8[3] = &unk_1000B1438;
  v8[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);
  v4 = (id)qword_1000C7158;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    identifier = self->_identifier;
    *(_DWORD *)buf = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = identifier;
    v13 = 2112;
    v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Session: %@ get tasks for reconnection: %@", buf, 0x20u);

  }
  return v3;
}

- (void)taskShouldResume:(unint64_t)a3
{
  NSMutableDictionary *identifiersToTasks;
  void *v6;
  void *v7;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *workQueue;
  dispatch_qos_class_t v16;
  dispatch_block_t v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  unint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;

  identifiersToTasks = self->_identifiersToTasks;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v6));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v9));

  if (v7)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
  {
    v12 = (id)qword_1000C7158;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_loggableDescription"));
      *(_DWORD *)buf = 138544130;
      v25 = v18;
      v26 = 2114;
      v27 = v19;
      v28 = 2112;
      v29 = v7;
      v30 = 2112;
      v31 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ cannot resume because task: %@ or taskInfo: %@ is nil", buf, 0x2Au);

    }
  }
  else
  {
    if (objc_msgSend(v7, "_hasSZExtractor"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "downloadFileURL"));

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "downloadFileURL"));
        +[NDFileUtilities removeStreamingZipModificationDate:](NDFileUtilities, "removeStreamingZipModificationDate:", v14);

      }
    }
    workQueue = self->_workQueue;
    v16 = objc_msgSend(v10, "qos");
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000196D4;
    v20[3] = &unk_1000B2468;
    v20[4] = self;
    v21 = v10;
    v22 = v7;
    v23 = a3;
    v17 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v16, 0, v20);
    dispatch_async(workQueue, v17);

  }
}

- (id)sanitizeTaskProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  NSObject *v10;
  void *v11;
  unsigned __int8 v12;
  NSObject *v13;
  void *v14;
  unsigned __int8 v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  unsigned __int8 v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  unsigned __int8 v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  unsigned __int8 v30;
  NSObject *v31;
  id v32;
  __CFString *v33;
  void *v34;
  unsigned __int8 v35;
  NSObject *v36;
  id v37;
  void *v38;
  unsigned __int8 v39;
  id v40;
  NSObject *v41;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __CFString *v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  const __CFString *v61;
  __int16 v62;
  int v63;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("effectiveConfig")));
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_sourceApplicationBundleIdentifier"));
    if (v8)
    {
      v9 = sub_1000131C4(v5, CFSTR("com.apple.private.nsurlsession.impersonate"));

      if ((v9 & 1) == 0)
      {
        objc_msgSend(v7, "set_sourceApplicationBundleIdentifier:", 0);
        v10 = (id)qword_1000C7158;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          *(_DWORD *)buf = 138543618;
          v59 = v46;
          v60 = 2112;
          v61 = CFSTR("com.apple.private.nsurlsession.impersonate");
          _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _sourceApplicationBundleIdentifier but is missing the %@ entitlement", buf, 0x16u);

        }
      }
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_sourceApplicationSecondaryIdentifier"));
    if (v11)
    {
      v12 = sub_1000131C4(v5, CFSTR("com.apple.private.nsurlsession.impersonate"));

      if ((v12 & 1) == 0)
      {
        objc_msgSend(v7, "set_sourceApplicationSecondaryIdentifier:", 0);
        v13 = (id)qword_1000C7158;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          *(_DWORD *)buf = 138543618;
          v59 = v47;
          v60 = 2112;
          v61 = CFSTR("com.apple.private.nsurlsession.impersonate");
          _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _sourceApplicationSecondaryIdentifier but is missing the %@ entitlement", buf, 0x16u);

        }
      }
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_sourceApplicationAuditTokenData"));
    if (v14)
    {
      v15 = sub_1000131C4(v5, CFSTR("com.apple.private.nsurlsession.impersonate"));

      if ((v15 & 1) == 0)
      {
        objc_msgSend(v7, "set_sourceApplicationAuditTokenData:", 0);
        v16 = (id)qword_1000C7158;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          *(_DWORD *)buf = 138543618;
          v59 = v48;
          v60 = 2112;
          v61 = CFSTR("com.apple.private.nsurlsession.impersonate");
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _sourceApplicationAuditTokenData but is missing the %@ entitlement", buf, 0x16u);

        }
      }
    }
    objc_msgSend(v7, "set_attributedBundleIdentifier:", 0);
    if (objc_msgSend(v7, "_respectsAllowsCellularAccessForDiscretionaryTasks")
      && (sub_1000131C4(v5, CFSTR("com.apple.private.nsurlsession.allow-discretionary-cellular")) & 1) == 0)
    {
      objc_msgSend(v7, "set_respectsAllowsCellularAccessForDiscretionaryTasks:", 0);
      v17 = (id)qword_1000C7158;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        *(_DWORD *)buf = 138543618;
        v59 = v51;
        v60 = 2112;
        v61 = CFSTR("com.apple.private.nsurlsession.allow-discretionary-cellular");
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _respectsAllowsCellularAccessForDiscretionaryTasks but is missing the %@ entitlement", buf, 0x16u);

      }
    }
    if (objc_msgSend(v7, "_allowsPowerNapScheduling")
      && (sub_1000131C4(v5, CFSTR("com.apple.private.dark-wake-network-reachability")) & 1) == 0)
    {
      objc_msgSend(v7, "set_allowsPowerNapScheduling:", 0);
      v18 = (id)qword_1000C7158;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        *(_DWORD *)buf = 138543618;
        v59 = v52;
        v60 = 2112;
        v61 = CFSTR("com.apple.private.dark-wake-network-reachability");
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _allowsPowerNapScheduling but is missing the %@ entitlement", buf, 0x16u);

      }
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_connectionPoolName"));
    if (v19)
    {
      v20 = sub_1000131C4(v5, CFSTR("com.apple.private.nsurlsession-allow-override-connection-pool"));

      if ((v20 & 1) == 0)
      {
        objc_msgSend(v7, "set_connectionPoolName:", 0);
        v21 = (id)qword_1000C7158;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          *(_DWORD *)buf = 138543618;
          v59 = v49;
          v60 = 2112;
          v61 = CFSTR("com.apple.private.nsurlsession-allow-override-connection-pool");
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _connectionPoolName but is missing the %@ entitlement", buf, 0x16u);

        }
      }
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_directoryForDownloadedFiles"));
    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
      if (objc_msgSend(v23, "isPrivileged"))
      {

      }
      else
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_directoryForDownloadedFiles"));
        v25 = objc_msgSend(v5, "processIdentifier");
        if (v5)
        {
          objc_msgSend(v5, "auditToken");
        }
        else
        {
          v56 = 0u;
          v57 = 0u;
        }
        v26 = objc_msgSend(v24, "_isSafeDirectoryForDownloads:withToken:", v25, &v56);

        if ((v26 & 1) == 0)
        {
          v27 = (id)qword_1000C7158;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
            v55 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_directoryForDownloadedFiles"));
            *(_DWORD *)buf = 138543618;
            v59 = v54;
            v60 = 2112;
            v61 = v55;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _directoryForDownloadedFiles but does not have access to directory %@", buf, 0x16u);

          }
          objc_msgSend(v7, "set_directoryForDownloadedFiles:", 0);
        }
      }
    }
    if (objc_msgSend(v7, "_duetPreauthorized", v56, v57)
      && (sub_1000131C4(v5, CFSTR("com.apple.private.nsurlsession.allow-duet-preauthorization")) & 1) == 0)
    {
      objc_msgSend(v7, "set_duetPreauthorized:", 0);
      v28 = (id)qword_1000C7158;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        *(_DWORD *)buf = 138543618;
        v59 = v53;
        v60 = 2112;
        v61 = CFSTR("com.apple.private.nsurlsession.allow-duet-preauthorization");
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _duetPreauthorized but is missing the %@ entitlement", buf, 0x16u);

      }
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_maximumWatchCellularTransferSize"));
    if (v29)
    {
      v30 = sub_1000131C4(v5, CFSTR("com.apple.private.nsurlsession.set-max-watch-cell-transfer-size"));

      if ((v30 & 1) == 0)
      {
        objc_msgSend(v7, "set_maximumWatchCellularTransferSize:", 0);
        v31 = (id)qword_1000C7158;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          *(_DWORD *)buf = 138543362;
          v59 = v50;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _maximumWatchCellularTransferSize but is missing the necessary entitlement", buf, 0xCu);

        }
      }
    }
    if ((sub_1000131C4(v5, CFSTR("get-task-allow")) & 1) != 0
      || (sub_1000131C4(v5, CFSTR("com.apple.security.get-task-allow")) & 1) != 0
      || os_variant_allows_internal_security_policies("com.apple.CFNetwork"))
    {
      v32 = objc_msgSend(v5, "processIdentifier");
    }
    else
    {
      v32 = 0;
    }
    objc_msgSend(v7, "set_pidForHAR:", v32);
  }
  v33 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pathToDownloadTaskFile")));
  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    v35 = sub_10006589C(v34, v33);

    if ((v35 & 1) == 0)
    {
      v36 = (id)qword_1000C7158;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        v44 = *__error();
        *(_DWORD *)buf = 138543874;
        v59 = v43;
        v60 = 2112;
        v61 = v33;
        v62 = 1024;
        v63 = v44;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _pathToDownloadTaskFile but is not allowed to create %@: %{errno}d", buf, 0x1Cu);

      }
      v37 = objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v37, "setObject:forKeyedSubscript:", 0, CFSTR("pathToDownloadTaskFile"));

      v4 = v37;
    }
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceApplicationBundleIdentifierForMobileAsset")));
  if (v38
    && (v39 = sub_1000131C4(v5, CFSTR("com.apple.private.nsurlsession.impersonate")),
        v38,
        (v39 & 1) == 0))
  {
    v41 = (id)qword_1000C7158;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      *(_DWORD *)buf = 138543618;
      v59 = v45;
      v60 = 2112;
      v61 = CFSTR("com.apple.private.nsurlsession.impersonate");
      _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client tried to set _sourceApplicationBundleIdentifier but is missing the %@ entitlement", buf, 0x16u);

    }
    v40 = objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v40, "setObject:forKeyedSubscript:", 0, CFSTR("sourceApplicationBundleIdentifierForMobileAsset"));

  }
  else
  {
    v40 = v4;
  }

  return v40;
}

- (void)handleWillBeginDelayedRequestForTaskWithIdentifier:(unint64_t)a3 completionHandler:(id)a4
{
  void (**v6)(_QWORD);
  NSMutableDictionary *identifiersToTasks;
  void *v8;
  void *v9;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void ***v23;
  PendingCallback *v24;
  void ***v25;
  void *v26;
  PendingCallback *v27;
  NDCallbackQueue *callbackQueue;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void **v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t, void *);
  void *v38;
  NDBackgroundSession *v39;
  id v40;
  void (**v41)(_QWORD);
  unint64_t v42;
  _QWORD v43[2];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;

  v6 = (void (**)(_QWORD))a4;
  identifiersToTasks = self->_identifiersToTasks;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v8));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v11));

  if (v9 && v12)
  {
    if (!self->_clientImplementsWillBeginDelayedRequest)
    {
      v14 = (id)qword_1000C7158;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
        *(_DWORD *)buf = 138543618;
        v45 = v19;
        v46 = 2114;
        v47 = v20;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ skipping delayed request callback - delegate not implemented", buf, 0x16u);

      }
      goto LABEL_24;
    }
    v13 = objc_msgSend(v12, "respondedToWillBeginDelayedRequestCallback");
    v14 = (id)qword_1000C7158;
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
        *(_DWORD *)buf = 138543618;
        v45 = v16;
        v46 = 2114;
        v47 = v17;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ already replied to delayed request callback - not calling again", buf, 0x16u);

      }
LABEL_24:

      v6[2](v6);
      goto LABEL_25;
    }
    if (v15)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
      *(_DWORD *)buf = 138543618;
      v45 = v21;
      v46 = 2114;
      v47 = v22;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ receiving delayed request callback", buf, 0x16u);

    }
    if (!self->_clientProxy
      && (!self->_sendsLaunchEvents || !-[NDApplication supportsWakes](self->_clientApplication, "supportsWakes")))
    {
      v30 = (id)qword_1000C7158;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
        *(_DWORD *)buf = 138543618;
        v45 = v31;
        v46 = 2114;
        v47 = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ client is not running and doesn't support wakes, continuing load for delayed request", buf, 0x16u);

      }
      objc_msgSend(v12, "setRespondedToWillBeginDelayedRequestCallback:", 1);
      v14 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "identifier")));
      -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v14, 9, 0);
      goto LABEL_24;
    }
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentRequest"));
    v35 = _NSConcreteStackBlock;
    v36 = 3221225472;
    v37 = sub_10003FA54;
    v38 = &unk_1000B1488;
    v39 = self;
    v42 = a3;
    v40 = v12;
    v41 = v6;
    v23 = objc_retainBlock(&v35);
    v24 = [PendingCallback alloc];
    v43[0] = v18;
    v25 = objc_retainBlock(v23);
    v43[1] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 2, v35, v36, v37, v38, v39));
    v27 = -[PendingCallback initWithCallbackType:taskIdentifier:args:](v24, "initWithCallbackType:taskIdentifier:args:", 9, a3, v26);

    callbackQueue = self->_callbackQueue;
    if (self->_sendsLaunchEvents)
    {
      if (-[NDApplication supportsWakes](self->_clientApplication, "supportsWakes"))
        v29 = 2;
      else
        v29 = 0;
    }
    else
    {
      v29 = 0;
    }
    -[NDCallbackQueue addPendingCallback:wakeRequirement:](callbackQueue, "addPendingCallback:wakeRequirement:", v27, v29);

  }
  else
  {
    v18 = (id)qword_1000C7158;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_loggableDescription"));
      *(_DWORD *)buf = 138544130;
      v45 = v33;
      v46 = 2114;
      v47 = v34;
      v48 = 2112;
      v49 = v9;
      v50 = 2112;
      v51 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ cannot handle delayed request callback because task: %@ or taskInfo: %@ is nil", buf, 0x2Au);

    }
  }

LABEL_25:
}

- (void)configureAdditionalPropertiesOnTask:(id)a3 taskInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "additionalProperties"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "additionalProperties"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("effectiveConfig")));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession configurationWithClientConfiguration:discretionary:](self, "configurationWithClientConfiguration:discretionary:", v9, objc_msgSend(v6, "isDiscretionary")));
      v11 = objc_msgSend(v8, "mutableCopy");
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("effectiveConfig"));

      v8 = v11;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "additionalProperties"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("TimeoutIntervalForResource")));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentRequest"));
      v15 = -[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:](self, "currentDiscretionaryStatus:withOptionalTaskInfo:", v14, v6);

      -[NDBackgroundSession setupDASPropertiesOnTask:taskInfo:discretionaryStatus:](self, "setupDASPropertiesOnTask:taskInfo:discretionaryStatus:", v16, v6, v15);
    }
    sub_10000C984(v16, v8);

  }
}

- (void)handleEarliestBeginDateForTaskWithIdentifier:(unint64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD);
  NSMutableDictionary *identifiersToTasks;
  void *v8;
  void *v9;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  dispatch_time_t v22;
  NSObject *workQueue;
  dispatch_qos_class_t v24;
  dispatch_block_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  NDBackgroundSession *v33;
  void (**v34)(id, _QWORD);
  unint64_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;

  v6 = (void (**)(id, _QWORD))a4;
  identifiersToTasks = self->_identifiersToTasks;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v8));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v11));

  if ((objc_msgSend(v12, "resumedAndWaitingForEarliestBeginDate") & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "earliestBeginDate"));

    v14 = (id)qword_1000C7158;
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_loggableDescription"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "earliestBeginDate"));
        *(_DWORD *)buf = 138543874;
        v37 = v16;
        v38 = 2114;
        v39 = v17;
        v40 = 2112;
        v41 = v18;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ should not begin before %@", buf, 0x20u);

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "earliestBeginDate"));
      objc_msgSend(v19, "timeIntervalSinceNow");
      v21 = v20;

      if (v21 <= 0.0)
      {
        v28 = (id)qword_1000C7158;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_loggableDescription"));
          *(_DWORD *)buf = 138543618;
          v37 = v29;
          v38 = 2114;
          v39 = v30;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ can begin immediately - begin date is in past", buf, 0x16u);

        }
        v6[2](v6, 0);
      }
      else
      {
        objc_msgSend(v12, "setResumedAndWaitingForEarliestBeginDate:", 1);
        v22 = dispatch_time(0x8000000000000000, (uint64_t)(v21 * 1000000000.0));
        workQueue = self->_workQueue;
        v24 = objc_msgSend(v12, "qos");
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_10003FE68;
        v31[3] = &unk_1000B1460;
        v32 = v12;
        v33 = self;
        v35 = a3;
        v34 = v6;
        v25 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v24, 0, v31);
        dispatch_after(v22, workQueue, v25);

      }
    }
    else
    {
      if (v15)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_loggableDescription"));
        *(_DWORD *)buf = 138543618;
        v37 = v26;
        v38 = 2114;
        v39 = v27;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ has not requested a begin delay", buf, 0x16u);

      }
      v6[2](v6, 0);
    }
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *identifiersToStreams;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  char v20;
  NSXPCProxyCreating *clientProxy;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  int v31;
  void *v32;
  _BOOL4 v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSString *v37;
  void *v38;
  void *v39;
  NSString *v40;
  void *v41;
  void *v42;
  NSString *v43;
  id v44;
  NSMutableArray *outstandingTaskIDs;
  void *v46;
  void *v47;
  BOOL v48;
  void *v49;
  PendingCallback *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  PendingCallback *v55;
  _QWORD *v56;
  void *v57;
  unsigned __int8 v58;
  NSObject *v59;
  void *v60;
  void *v61;
  NSString *clientBundleID;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  unsigned __int8 v67;
  void *v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  unsigned int v75;
  id v76;
  id v77;
  void *v78;
  _QWORD v79[4];
  _QWORD *v80;
  _QWORD v81[4];
  id v82;
  id v83;
  NDBackgroundSession *v84;
  _QWORD v85[3];
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  id v89;
  __int16 v90;
  NSString *v91;
  __int16 v92;
  id v93;
  __int16 v94;
  id v95;

  v7 = a4;
  v8 = a5;
  v78 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v7));
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "_metrics"));
  v77 = v10;
  objc_msgSend(v13, "setTaskMetrics:", v14);

  identifiersToStreams = self->_identifiersToStreams;
  if (identifiersToStreams)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
    -[NSMutableDictionary removeObjectForKey:](identifiersToStreams, "removeObjectForKey:", v16);

  }
  if (objc_msgSend(v78, "_hasSZExtractor"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "downloadFileURL"));
    if (v17)
    {
      v18 = objc_msgSend(v13, "_updatedStreamingZipModificationDate");

      if ((v18 & 1) == 0)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "downloadFileURL"));
        +[NDFileUtilities updateStreamingZipModificationDate:](NDFileUtilities, "updateStreamingZipModificationDate:", v19);

      }
    }
  }
  if (!v8
    || !sub_10001AEC8((_BOOL8)v8)
    || objc_msgSend(v13, "disablesRetry") && ((sub_10001AE20(v78) & 1) != 0 || !sub_10001F730(v8))
    || objc_msgSend(v13, "state") == (id)2)
  {
    v20 = 0;
    goto LABEL_14;
  }
  v59 = (id)qword_1000C7158;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "_loggableDescription"));
    clientBundleID = self->_clientBundleID;
    *(_DWORD *)buf = 138544386;
    v87 = v60;
    v88 = 2114;
    v89 = v61;
    v90 = 2112;
    v91 = clientBundleID;
    v92 = 2112;
    v93 = v8;
    v94 = 2048;
    v95 = objc_msgSend(v8, "code");
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ for client %@ will be retried after error %@ - code: %ld", buf, 0x34u);

  }
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NDUserSyncStakeholder sharedStakeholder](NDUserSyncStakeholder, "sharedStakeholder"));
  objc_msgSend(v63, "startBridgingUMTask:", v13);

  -[NDBackgroundSession handleCompletionOfTask:identifier:taskInfo:isRecoverable:suppressWake:](self, "handleCompletionOfTask:identifier:taskInfo:isRecoverable:suppressWake:", v78, v10, v13, 1, 1);
  -[NSMutableDictionary removeObjectForKey:](self->_tasksToIdentifiers, "removeObjectForKey:", v78);
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "_extractor"));
  objc_msgSend(v13, "set_extractor:", v64);

  objc_msgSend(v13, "set_hasSZExtractor:", objc_msgSend(v78, "_hasSZExtractor"));
  objc_msgSend(v13, "set_doesSZExtractorConsumeExtractedData:", objc_msgSend(v78, "_doesSZExtractorConsumeExtractedData"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "_metrics"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "_daemon_currentTransactionMetrics"));
  v67 = -[NDBackgroundSession retryTask:originalError:transactionMetrics:](self, "retryTask:originalError:transactionMetrics:", v13, v8, v66);

  if ((v67 & 1) == 0)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NDUserSyncStakeholder sharedStakeholder](NDUserSyncStakeholder, "sharedStakeholder"));
    objc_msgSend(v68, "endBridgingUMTask:", v13);

    v69 = (id)qword_1000C7158;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "_loggableDescription"));
      *(_DWORD *)buf = 138543618;
      v87 = v73;
      v88 = 2114;
      v89 = v74;
      _os_log_error_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ failed to retry", buf, 0x16u);

    }
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
    v71 = objc_claimAutoreleasedReturnValue(+[NSURLError errorWithDomain:code:userInfo:](NSURLError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -1, v70));

    v20 = 1;
    v8 = (id)v71;
LABEL_14:
    clientProxy = (NSXPCProxyCreating *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
    if (-[NSXPCProxyCreating isEqualToString:](clientProxy, "isEqualToString:", CFSTR("_nsurlsessiondErrorDomain")))
    {
      v22 = objc_msgSend(v8, "code") == (id)1;

      if (!v22)
        goto LABEL_20;
      v23 = (id)qword_1000C7158;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        *(_DWORD *)buf = 138543362;
        v87 = v72;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Removing client proxy due to task failure caused by app quit", buf, 0xCu);

      }
      clientProxy = self->_clientProxy;
      self->_clientProxy = 0;
    }

LABEL_20:
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientErrorForError:](self, "clientErrorForError:", v8));
    if (sub_10001B108((_BOOL8)v8))
      v75 = -[NDApplication canBeSuspended](self->_clientApplication, "canBeSuspended");
    else
      v75 = 0;
    objc_msgSend(v13, "setState:", 3);
    objc_msgSend(v13, "setError:", v24);
    objc_msgSend(v78, "setError:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "_trailers"));
    objc_msgSend(v13, "set_backgroundTrailers:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v77));
    -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v26, 14, 1);

    v27 = (id)qword_1000C7158;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "_loggableDescription"));
      v30 = objc_msgSend(v8, "code");
      if (sub_10001AE20(v78))
      {
        if (objc_msgSend(v78, "_connectionIsCellular"))
          v31 = 89;
        else
          v31 = 78;
      }
      else
      {
        v31 = 85;
      }
      *(_DWORD *)buf = 138544386;
      v87 = v28;
      v88 = 2114;
      v89 = v29;
      v90 = 2112;
      v91 = (NSString *)v8;
      v92 = 2048;
      v93 = v30;
      v94 = 1024;
      LODWORD(v95) = v31;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ completed with error %@ [%ld]. C(%c)", buf, 0x30u);

    }
    if (!v8)
    {
      v34 = (id)qword_1000C7158;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "_loggableDescription"));
        v40 = self->_clientBundleID;
        *(_DWORD *)buf = 138543874;
        v87 = v38;
        v88 = 2114;
        v89 = v39;
        v90 = 2112;
        v91 = v40;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ for client %@ completed successfully", buf, 0x20u);

      }
      goto LABEL_40;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
    if (objc_msgSend(v32, "isEqualToString:", NSURLErrorDomain))
    {
      v33 = objc_msgSend(v8, "code") == (id)-999;

      if (v33)
      {
        v34 = (id)qword_1000C7158;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "_loggableDescription"));
          v37 = self->_clientBundleID;
          *(_DWORD *)buf = 138543874;
          v87 = v35;
          v88 = 2114;
          v89 = v36;
          v90 = 2112;
          v91 = v37;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ for client %@ was cancelled", buf, 0x20u);

        }
LABEL_40:

        outstandingTaskIDs = self->_outstandingTaskIDs;
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v77));
        LOBYTE(outstandingTaskIDs) = -[NSMutableArray containsObject:](outstandingTaskIDs, "containsObject:", v46);

        if ((outstandingTaskIDs & 1) != 0)
        {
          v76 = objc_alloc_init((Class)NSMutableDictionary);
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_backgroundTrailers"));
          v48 = v47 == 0;

          if (!v48)
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_backgroundTrailers"));
            objc_msgSend(v76, "setObject:forKeyedSubscript:", v49, CFSTR("trailers"));

          }
          v50 = [PendingCallback alloc];
          v51 = v24;
          if (!v24)
            v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          v85[0] = v51;
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "taskMetrics"));
          v53 = v52;
          if (!v52)
            v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          v85[1] = v53;
          v85[2] = v76;
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v85, 3));
          v55 = -[PendingCallback initWithCallbackType:taskIdentifier:args:](v50, "initWithCallbackType:taskIdentifier:args:", 0, v77, v54);

          if (!v52)
          if (!v24)

          -[NDCallbackQueue addPendingCallback:wakeRequirement:](self->_callbackQueue, "addPendingCallback:wakeRequirement:", v55, 0);
          -[NDBackgroundSession removeOutstandingTaskWithIdentifier:](self, "removeOutstandingTaskWithIdentifier:", v77);
          -[NDBackgroundSession handleCompletionOfTask:identifier:taskInfo:isRecoverable:suppressWake:](self, "handleCompletionOfTask:identifier:taskInfo:isRecoverable:suppressWake:", v78, v77, v13, 0, v75);
          -[NDBackgroundSession removeUploadFileForTaskInfo:](self, "removeUploadFileForTaskInfo:", v13);
          v81[0] = _NSConcreteStackBlock;
          v81[1] = 3221225472;
          v81[2] = sub_10001AA74;
          v81[3] = &unk_1000B20B8;
          v82 = v13;
          v83 = v24;
          v84 = self;
          v56 = objc_retainBlock(v81);
          if ((v20 & (v8 != 0)) == 1
            && (v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "_extractor"))) != 0
            && (v58 = objc_msgSend(v78, "_extractorFinishedDecoding"), v57,
                                                                                        (v58 & 1) == 0))
          {
            v79[0] = _NSConcreteStackBlock;
            v79[1] = 3221225472;
            v79[2] = sub_10003EC94;
            v79[3] = &unk_1000B1EB8;
            v80 = v56;
            objc_msgSend(v78, "terminateExtractorWithError:completion:", v8, v79);

          }
          else
          {
            ((void (*)(_QWORD *))v56[2])(v56);
          }

        }
        goto LABEL_57;
      }
    }
    else
    {

    }
    v34 = (id)qword_1000C7158;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "_loggableDescription"));
      v43 = self->_clientBundleID;
      v44 = objc_msgSend(v8, "code");
      *(_DWORD *)buf = 138544130;
      v87 = v41;
      v88 = 2114;
      v89 = v42;
      v90 = 2112;
      v91 = v43;
      v92 = 2048;
      v93 = v44;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ for client %@ completed with error - code: %ld", buf, 0x2Au);

    }
    goto LABEL_40;
  }
LABEL_57:

}

- (void)uploadTaskWithRequest:(id)a3 originalRequest:(id)a4 fromFile:(id)a5 sandboxExtensionData:(id)a6 identifier:(unint64_t)a7 uniqueIdentifier:(id)a8 potentialCredentials:(id)a9 reply:(id)a10
{
  id v15;
  void (**v16)(id, _QWORD);
  NSObject *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  BOOL v26;
  uint64_t v27;
  void *v28;
  unsigned __int8 v29;
  NSObject *v30;
  void *v31;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[5];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  unint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;

  v37 = a3;
  v33 = a4;
  v15 = a5;
  v35 = a6;
  v36 = a8;
  v34 = a9;
  v16 = (void (**)(id, _QWORD))a10;
  v17 = (id)qword_1000C7158;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession descriptionForRequest:](self, "descriptionForRequest:", v37));
    *(_DWORD *)buf = 138544386;
    v40 = v18;
    v41 = 2114;
    v42 = v36;
    v43 = 2048;
    v44 = a7;
    v45 = 2112;
    v46 = v19;
    v47 = 2112;
    v48 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Task <%{public}@>.<%lu> uploadTaskWithRequest: %@ fromFile: %@", buf, 0x34u);

  }
  v20 = -[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:](self, "currentDiscretionaryStatus:withOptionalTaskInfo:", v37, 0);
  if (v15)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession makeTempUploadFile:withExtensionData:](self, "makeTempUploadFile:withExtensionData:", v15, v35));
    if (!v21)
    {
      v16[2](v16, 0);
      goto LABEL_24;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", v20));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uploadTaskWithRequest:fromFile:", v37, v21));
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", v20));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uploadTaskWithStreamedRequest:", v37));
    v21 = 0;
  }

  v24 = objc_msgSend(objc_alloc((Class)__NSCFURLSessionTaskInfo), "initWithUploadTask:uniqueIdentifier:bundleID:sessionID:", v23, v36, self->_clientBundleID, self->_identifier);
  v25 = v24;
  if (v23)
    v26 = v24 == 0;
  else
    v26 = 1;
  v27 = !v26;
  if (v26)
  {
    v30 = (id)qword_1000C7158;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      *(_DWORD *)buf = 138543874;
      v40 = v31;
      v41 = 2112;
      v42 = v23;
      v43 = 2112;
      v44 = (unint64_t)v25;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Couldn't create task or taskInfo: task = %@, taskInfo = %@", buf, 0x20u);

    }
  }
  else
  {
    if (v34)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
      v29 = objc_msgSend(v28, "isInSyncBubble");

      if ((v29 & 1) == 0)
      {
        if (self->_clientBundleID)
        {
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_10003F44C;
          v38[3] = &unk_1000B14D8;
          v38[4] = self;
          objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v38);
        }
      }
    }
    objc_msgSend(v23, "setOriginalRequest:", v33);
    objc_msgSend(v25, "setFileURL:", v21);
    -[NDBackgroundSession performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:](self, "performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:", v23, v25, a7, v20);
  }
  v16[2](v16, v27);

LABEL_24:
}

- (void)archiveTimerFired
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A9CC;
  block[3] = &unk_1000B23A0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (id)makeTempUploadFile:(id)a3 withExtensionData:(id)a4
{
  _BYTE *v6;
  id v7;
  _BYTE *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  NSObject *v17;
  void *v18;
  id v19;
  int v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  unsigned __int8 v25;
  id v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  _BYTE *v49;
  __int16 v50;
  uint64_t v51;

  v6 = a3;
  v7 = objc_retainAutorelease(a4);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");
  if (v9 && !v8[(_QWORD)v9 - 1])
  {
    v10 = sandbox_extension_consume(v8);
    v31 = (id)qword_1000C7158;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      *(_DWORD *)buf = 138543874;
      v47 = v32;
      v48 = 2112;
      v49 = v6;
      v50 = 2048;
      v51 = v10;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Consumed sandbox extension for file %@, extension = %lld", buf, 0x20u);

    }
    if (v10 < 0)
    {
      v33 = (id)qword_1000C7158;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        *(_DWORD *)buf = 138543874;
        v47 = v43;
        v48 = 2080;
        v49 = v8;
        v50 = 2112;
        v51 = (uint64_t)v6;
        _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Failed to consume sandbox extension %s for fileURL %@", buf, 0x20u);

      }
    }
  }
  else
  {
    v10 = -1;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CFNetworkUpload_%@"), v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_uploadsDirectory, "URLByAppendingPathComponent:", v13));
  LODWORD(v12) = objc_msgSend(v6, "fileDescriptor");
  v15 = objc_retainAutorelease(v14);
  if (!fclonefileat((int)v12, -2, (const char *)objc_msgSend(v15, "fileSystemRepresentation"), 0))
    goto LABEL_14;
  v16 = *__error();
  if (v16 == 45 || v16 == 18)
  {
    v17 = (id)qword_1000C7158;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      *(_DWORD *)buf = 138543362;
      v47 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Falling back to copy", buf, 0xCu);

    }
    v19 = objc_retainAutorelease(v15);
    v20 = open((const char *)objc_msgSend(v19, "fileSystemRepresentation"), 513, 384);
    if (v20 != -1)
    {
      v21 = fcopyfile((int)objc_msgSend(v6, "fileDescriptor"), v20, 0, 8u);
      close(v20);
      if (v21)
      {
        v22 = (id)qword_1000C7158;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          v39 = *__error();
          *(_DWORD *)buf = 138543618;
          v47 = v38;
          v48 = 1024;
          LODWORD(v49) = v39;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Error copying file: %{errno}d", buf, 0x12u);

        }
        v23 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v24 = 0;
        -[NSObject removeItemAtURL:error:](v23, "removeItemAtURL:error:", v19, 0);
        goto LABEL_39;
      }
LABEL_14:
      v45 = 0;
      v44 = 0;
      v25 = objc_msgSend(v15, "getResourceValue:forKey:error:", &v45, NSURLIsSymbolicLinkKey, &v44);
      v26 = v45;
      v23 = v44;
      if ((v25 & 1) != 0)
      {
        if (!objc_msgSend(v26, "BOOLValue"))
        {
LABEL_22:
          if (v10 >= 1)
          {
            sandbox_extension_release(v10);
            v29 = (id)qword_1000C7158;
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
              *(_DWORD *)buf = 138543618;
              v47 = v30;
              v48 = 2048;
              v49 = (_BYTE *)v10;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Released sandbox extension %lld", buf, 0x16u);

            }
          }
          v19 = v15;

          v24 = v19;
          goto LABEL_39;
        }
        v27 = (id)qword_1000C7158;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          *(_DWORD *)buf = 138543362;
          v47 = v42;
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> File is a symlink", buf, 0xCu);

        }
      }
      else
      {
        v27 = (id)qword_1000C7158;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          v36 = -[NSObject code](v23, "code");
          *(_DWORD *)buf = 138543874;
          v47 = v35;
          v48 = 2112;
          v49 = v23;
          v50 = 2048;
          v51 = (uint64_t)v36;
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Error checking resource value: %@ [%ld]", buf, 0x20u);

        }
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      objc_msgSend(v28, "removeItemAtURL:error:", v15, 0);

      v15 = 0;
      goto LABEL_22;
    }
    v23 = (id)qword_1000C7158;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v41 = *__error();
      *(_DWORD *)buf = 138543618;
      v47 = v40;
      v48 = 1024;
      LODWORD(v49) = v41;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Error creating file: %{errno}d", buf, 0x12u);

    }
    v24 = 0;
  }
  else
  {
    v23 = (id)qword_1000C7158;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      *(_DWORD *)buf = 138543618;
      v47 = v37;
      v48 = 1024;
      LODWORD(v49) = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Error cloning file: %{errno}d", buf, 0x12u);

    }
    v24 = 0;
    v19 = v15;
  }
LABEL_39:

  return v24;
}

- (void)resumeTaskWithIdentifier:(unint64_t)a3 withProperties:(id)a4
{
  id v6;
  NSMutableDictionary *identifiersToTasks;
  void *v8;
  void *v9;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;

  v6 = a4;
  identifiersToTasks = self->_identifiersToTasks;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v8));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v11));

  v13 = (id)qword_1000C7158;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
    v27 = 138543874;
    v28 = v14;
    v29 = 2114;
    v30 = v15;
    v31 = 2112;
    v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ resumeTaskWithIdentifier, props %@", (uint8_t *)&v27, 0x20u);

  }
  if (v12)
  {
    if (objc_msgSend(v12, "state") == (id)1
      && (v16 = (char *)objc_msgSend(v12, "suspendCount") - 1, objc_msgSend(v12, "setSuspendCount:", v16), !v16))
    {
      objc_msgSend(v12, "setState:", 0);
      objc_msgSend(v12, "setQos:", qos_class_self());
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentPersona"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "userPersonaUniqueString"));
      objc_msgSend(v12, "setPersonaUniqueString:", v20);

      v21 = (id)qword_1000C7158;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
        v24 = objc_msgSend(v12, "qos");
        v27 = 138543874;
        v28 = v22;
        v29 = 2114;
        v30 = v23;
        v31 = 1024;
        LODWORD(v32) = v24;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ resuming, QOS(0x%x)", (uint8_t *)&v27, 0x1Cu);

      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sanitizeTaskProperties:](self, "sanitizeTaskProperties:", v6));
      objc_msgSend(v12, "setAdditionalProperties:", v25);

      -[NDBackgroundSession configureAdditionalPropertiesOnTask:taskInfo:](self, "configureAdditionalPropertiesOnTask:taskInfo:", v9, v12);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentRequest"));
      objc_msgSend(v12, "setCurrentRequest:", v26);

      -[NSXPCProxyCreating backgroundTaskDidResume:](self->_clientProxy, "backgroundTaskDidResume:", a3);
      objc_msgSend(v9, "startResourceTimer");
      -[NDBackgroundSession taskShouldResume:](self, "taskShouldResume:", a3);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
      -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v17, 11, 1);

    }
  }

}

- (void)enqueueTaskWithIdentifier:(unint64_t)a3
{
  NSMutableDictionary *identifiersToTasks;
  void *v6;
  void *v7;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  identifiersToTasks = self->_identifiersToTasks;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v14 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v6));

  v7 = v14;
  if (v14)
  {
    identifiersToTaskInfo = self->_identifiersToTaskInfo;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NDUserSyncStakeholder sharedStakeholder](NDUserSyncStakeholder, "sharedStakeholder"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueIdentifier"));
    objc_msgSend(v11, "restoredTaskActive:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NDUserSyncStakeholder sharedStakeholder](NDUserSyncStakeholder, "sharedStakeholder"));
    objc_msgSend(v13, "endBridgingUMTask:", v10);

    v7 = v14;
  }

}

- (void)reconnectClient:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  NDApplication *clientApplication;
  NSString *identifier;
  void *v13;
  unsigned int v14;
  char v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  NSString *clientBundleID;
  NSString *v20;
  _QWORD *v21;
  id completeReconnectionBlock;
  void *v23;
  NSString *v24;
  NSString *v25;
  _BOOL4 hasBeenSignalledToDeliverPendingEvents;
  _QWORD v27[5];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  NSString *v33;
  __int16 v34;
  NSString *v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  unsigned int v39;

  v6 = a3;
  v7 = a4;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100009E20;
  v27[3] = &unk_1000B1F08;
  v27[4] = self;
  v8 = v6;
  v28 = v8;
  v9 = v7;
  v29 = v9;
  v10 = objc_retainBlock(v27);
  clientApplication = self->_clientApplication;
  identifier = self->_identifier;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
  v14 = -[NDApplication isHandlingBackgroundURLSessionWithIdentifier:withSessionUUID:](clientApplication, "isHandlingBackgroundURLSessionWithIdentifier:withSessionUUID:", identifier, v13);

  if (self->_hasBeenSignalledToDeliverPendingEvents)
    v15 = 0;
  else
    v15 = v14;
  v16 = (id)qword_1000C7158;
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if ((v15 & 1) != 0)
  {
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v20 = self->_identifier;
      clientBundleID = self->_clientBundleID;
      *(_DWORD *)buf = 138543874;
      v31 = v18;
      v32 = 2112;
      v33 = clientBundleID;
      v34 = 2112;
      v35 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Waiting for notification to deliver pending events for client session: <%@>.<%@>", buf, 0x20u);

    }
    v21 = objc_retainBlock(v10);
    completeReconnectionBlock = self->_completeReconnectionBlock;
    self->_completeReconnectionBlock = v21;

  }
  else
  {
    if (v17)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v25 = self->_identifier;
      v24 = self->_clientBundleID;
      hasBeenSignalledToDeliverPendingEvents = self->_hasBeenSignalledToDeliverPendingEvents;
      *(_DWORD *)buf = 138544386;
      v31 = v23;
      v32 = 2112;
      v33 = v24;
      v34 = 2112;
      v35 = v25;
      v36 = 1024;
      v37 = hasBeenSignalledToDeliverPendingEvents;
      v38 = 1024;
      v39 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Delivering pending events immediately for client session: <%@>.<%@>. Signalled already: %d, isHandlingBackgroundSession: %d", buf, 0x2Cu);

    }
    self->_hasBeenSignalledToDeliverPendingEvents = 0;
    ((void (*)(_QWORD *))v10[2])(v10);
  }

}

- (void)downloadTaskWithRequest:(id)a3 originalRequest:(id)a4 downloadFilePath:(id)a5 identifier:(unint64_t)a6 uniqueIdentifier:(id)a7 reply:(id)a8
{
  id v14;
  void (**v15)(id, uint64_t);
  NSObject *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  NSString *clientBundleID;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  unint64_t v44;
  __int16 v45;
  void *v46;

  v14 = a3;
  v36 = a4;
  v37 = a5;
  v38 = a7;
  v15 = (void (**)(id, uint64_t))a8;
  v16 = (id)qword_1000C7158;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession descriptionForRequest:](self, "descriptionForRequest:", v14));
    *(_DWORD *)buf = 138544130;
    v40 = v17;
    v41 = 2114;
    v42 = v38;
    v43 = 2048;
    v44 = a6;
    v45 = 2112;
    v46 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Task <%{public}@>.<%lu> downloadTaskWithRequest: %@", buf, 0x2Au);

  }
  if ((objc_msgSend(v14, "_isSafeRequestForBackgroundDownload") & 1) != 0)
  {
    v19 = -[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:](self, "currentDiscretionaryStatus:withOptionalTaskInfo:", v14, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
    v21 = objc_msgSend(v20, "isPrivileged");
    v22 = v37;
    if (!v21)
      v22 = 0;
    v35 = v22;

    -[NDBackgroundSession ensureSessionDownloadDirectoryExists](self, "ensureSessionDownloadDirectoryExists");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", v19));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_downloadTaskWithRequest:downloadFilePath:", v14, v35));

    v25 = objc_msgSend(objc_alloc((Class)__NSCFURLSessionTaskInfo), "initWithDownloadTask:uniqueIdentifier:bundleID:sessionID:", v24, v38, self->_clientBundleID, self->_identifier);
    v26 = v25;
    if (v24 && v25)
    {
      objc_msgSend(v24, "setOriginalRequest:", v36);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "downloadFile"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "path"));

      if (v28)
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v28));
      else
        v29 = 0;
      objc_msgSend(v26, "setDownloadFileURL:", v29, v35);
      if (v28)

      -[NDBackgroundSession performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:](self, "performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:", v24, v26, a6, v19);
      v15[2](v15, 1);

    }
    else
    {
      v31 = (id)qword_1000C7158;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        *(_DWORD *)buf = 138543874;
        v40 = v34;
        v41 = 2112;
        v42 = v24;
        v43 = 2112;
        v44 = (unint64_t)v26;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Couldn't create task or taskInfo: task = %@, taskInfo = %@", buf, 0x20u);

      }
      v15[2](v15, 0);
    }

  }
  else
  {
    v30 = (id)qword_1000C7158;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      clientBundleID = self->_clientBundleID;
      *(_DWORD *)buf = 138543874;
      v40 = v32;
      v41 = 2112;
      v42 = v14;
      v43 = 2112;
      v44 = (unint64_t)clientBundleID;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Received an unsafe request for background download: %@ from %@", buf, 0x20u);

    }
    v15[2](v15, 0);
  }

}

- (void)performCommonSetupForTask:(id)a3 taskInfo:(id)a4 identifier:(unint64_t)a5 discretionaryStatus:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  NSMutableDictionary *identifiersToTasks;
  void *v19;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = -[NDBackgroundSession priorityForDiscretionaryStatus:](self, "priorityForDiscretionaryStatus:", v6);
  sub_100014C18(v10, v12, self->_monitoredApplication);
  objc_msgSend(v10, "setTaskIdentifier:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIdentifier"));
  objc_msgSend(v10, "set_uniqueIdentifier:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "storagePartitionIdentifier"));
  objc_msgSend(v10, "set_storagePartitionIdentifier:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pathToDownloadTaskFile"));
  objc_msgSend(v10, "set_pathToDownloadTaskFile:", v15);

  objc_msgSend(v11, "setIdentifier:", a5);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v11, "setCreationTime:");
  objc_msgSend(v11, "setBasePriority:", v12);
  objc_msgSend(v11, "setDiscretionary:", v6);
  if (-[NDApplication hasForegroundBackgroundStates](self->_monitoredApplication, "hasForegroundBackgroundStates"))
    v16 = !self->_discretionary;
  else
    v16 = 0;
  objc_msgSend(v11, "setMayBeDemotedToDiscretionary:", v16);
  objc_msgSend(v11, "setSuspendCount:", 1);
  -[NDBackgroundSession setupDASPropertiesOnTask:taskInfo:discretionaryStatus:](self, "setupDASPropertiesOnTask:taskInfo:discretionaryStatus:", v10, v11, v6);
  -[NDBackgroundSession addOutstandingTaskWithIdentifier:](self, "addOutstandingTaskWithIdentifier:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tasksToIdentifiers, "setObject:forKeyedSubscript:", v17, v10);

  identifiersToTasks = self->_identifiersToTasks;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  -[NSMutableDictionary setObject:forKeyedSubscript:](identifiersToTasks, "setObject:forKeyedSubscript:", v10, v19);

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  -[NSMutableDictionary setObject:forKeyedSubscript:](identifiersToTaskInfo, "setObject:forKeyedSubscript:", v11, v21);

  v22 = (id)qword_1000C7158;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_loggableDescription"));
    v26 = 138543618;
    v27 = v23;
    v28 = 2114;
    v29 = v24;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ enqueueing", (uint8_t *)&v26, 0x16u);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v25, 14, 0);

  -[NDBackgroundSession enqueueTaskWithIdentifier:](self, "enqueueTaskWithIdentifier:", a5);
}

- (BOOL)currentDiscretionaryStatus:(id)a3 withOptionalTaskInfo:(id)a4
{
  id v6;
  id v7;
  NDApplication *v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  void *v12;
  __CFString *v13;
  id v14;
  int discretionary;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  int v20;
  NDApplication *monitoredApplication;
  NDApplication *v22;
  NSXPCConnection *xpcConn;
  void *v24;
  NSObject *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  unsigned int v29;
  __CFString *v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  _BOOL4 v38;
  int v40;
  void *v41;
  __int16 v42;
  __CFString *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  int v47;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (NDApplication *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_propertyForKey:", CFSTR("_NSURLRequestIsDiscretionaryOverrideValue")));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
      v10 = sub_1000131C4(v9, CFSTR("com.apple.private.nsurlsession.set-discretionary-override-value"));

      if (v10)
      {
        v11 = (id)qword_1000C7158;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          if (v7)
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_loggableDescription"));
          else
            v13 = CFSTR("New task");
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[NDApplication bundleIdentifier](self->_clientApplication, "bundleIdentifier"));
          v40 = 138544130;
          if (-[NDApplication BOOLValue](v8, "BOOLValue"))
            v36 = 89;
          else
            v36 = 78;
          v41 = v12;
          v42 = 2114;
          v43 = v13;
          v44 = 2112;
          v45 = (uint64_t)v35;
          v46 = 1024;
          v47 = v36;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ for %@ is overriding discretionary status by request - forcing to %c", (uint8_t *)&v40, 0x26u);
          if (v7)

        }
        LOBYTE(discretionary) = -[NDApplication BOOLValue](v8, "BOOLValue");
        goto LABEL_66;
      }
    }

  }
  if (!v7 || !objc_msgSend(v7, "discretionaryOverride"))
  {
    v8 = self->_clientApplication;
    if (self->_infersDiscretionary)
    {
      monitoredApplication = self->_monitoredApplication;
      if (monitoredApplication)
      {
        v22 = monitoredApplication;

        v8 = v22;
      }
    }
    xpcConn = self->_xpcConn;
    if (xpcConn)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection _xpcConnection](xpcConn, "_xpcConnection"));
      if ((xpc_connection_is_extension() & 1) != 0)
      {
        discretionary = self->_discretionary;

        if (!discretionary)
        {
          v25 = (id)qword_1000C7158;
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
LABEL_65:

            goto LABEL_66;
          }
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          if (v7)
            v27 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_loggableDescription"));
          else
            v27 = CFSTR("Task <?>.<0>");
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[NDApplication bundleIdentifier](self->_clientApplication, "bundleIdentifier"));
          v40 = 138543874;
          v41 = v26;
          v42 = 2114;
          v43 = v27;
          v44 = 2112;
          v45 = (uint64_t)v34;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ current discretionary status for %@ is non-discretionary because the connected client is an extension", (uint8_t *)&v40, 0x20u);
          if (v7)

          goto LABEL_63;
        }
      }
      else
      {

      }
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
    v29 = objc_msgSend(v28, "isInSyncBubble");

    if (v29)
    {
      v25 = (id)qword_1000C7158;
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
LABEL_64:
        LOBYTE(discretionary) = 0;
        goto LABEL_65;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      if (v7)
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_loggableDescription"));
      else
        v30 = CFSTR("Task <?>.<0>");
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NDApplication bundleIdentifier](v8, "bundleIdentifier"));
      v40 = 138543874;
      v41 = v26;
      v42 = 2114;
      v43 = v30;
      v44 = 2112;
      v45 = (uint64_t)v34;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ current discretionary status for %@ is non-discretionary, since nsurlsessiond is running in EDU sync mode", (uint8_t *)&v40, 0x20u);
      if (v7)

    }
    else
    {
      if (self->_discretionary
        || -[NDApplication hasForegroundBackgroundStates](v8, "hasForegroundBackgroundStates")
        && !-[NDApplication isForeground](v8, "isForeground")
        && !-[NDApplication hasBackgroundTaskCompletion](v8, "hasBackgroundTaskCompletion"))
      {
        v25 = (id)qword_1000C7158;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          if (v7)
            v32 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_loggableDescription"));
          else
            v32 = CFSTR("Task <?>.<0>");
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[NDApplication bundleIdentifier](v8, "bundleIdentifier"));
          v38 = self->_discretionary;
          v40 = 138544130;
          v41 = v31;
          v42 = 2114;
          v43 = v32;
          v44 = 2112;
          v45 = (uint64_t)v37;
          v46 = 1024;
          v47 = v38;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ current discretionary status for %@ is discretionary (opt-in: %d)", (uint8_t *)&v40, 0x26u);
          if (v7)

        }
        LOBYTE(discretionary) = 1;
        goto LABEL_65;
      }
      v25 = (id)qword_1000C7158;
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        goto LABEL_64;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      if (v7)
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_loggableDescription"));
      else
        v33 = CFSTR("Task <?>.<0>");
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NDApplication bundleIdentifier](v8, "bundleIdentifier"));
      v40 = 138543874;
      v41 = v26;
      v42 = 2114;
      v43 = v33;
      v44 = 2112;
      v45 = (uint64_t)v34;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ current discretionary status for %@ is non-discretionary", (uint8_t *)&v40, 0x20u);
      if (v7)

    }
LABEL_63:

    goto LABEL_64;
  }
  v14 = objc_msgSend(v7, "discretionaryOverride");
  LOBYTE(discretionary) = v14 == (id)1;
  v8 = (NDApplication *)(id)qword_1000C7158;
  if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_loggableDescription"));
    v18 = objc_claimAutoreleasedReturnValue(-[NDApplication bundleIdentifier](self->_clientApplication, "bundleIdentifier"));
    v19 = (void *)v18;
    v40 = 138544130;
    if (v14 == (id)1)
      v20 = 89;
    else
      v20 = 78;
    v41 = v16;
    v42 = 2114;
    v43 = v17;
    v44 = 2112;
    v45 = v18;
    v46 = 1024;
    v47 = v20;
    _os_log_impl((void *)&_mh_execute_header, &v8->super, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ for %@ is overriding discretionary status - forcing to %c", (uint8_t *)&v40, 0x26u);

  }
LABEL_66:

  return discretionary;
}

- (void)storeTaskInfoUpdates:(BOOL)a3
{
  CFAbsoluteTime Current;
  NSObject *workQueue;
  _QWORD block[6];
  BOOL v8;

  Current = CFAbsoluteTimeGetCurrent();
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000149F8;
  block[3] = &unk_1000B1398;
  v8 = a3;
  *(CFAbsoluteTime *)&block[5] = Current;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)fillInPropertiesForTaskInfo:(id)a3 withTaskID:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_identifiersToTasks, "objectForKeyedSubscript:", a4));
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v8, "set_hasSZExtractor:", objc_msgSend(v6, "_hasSZExtractor"));
    objc_msgSend(v8, "set_doesSZExtractorConsumeExtractedData:", objc_msgSend(v7, "_doesSZExtractorConsumeExtractedData"));
  }

}

- (void)fillInByteCountsForTaskInfo:(id)a3 withTaskID:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_identifiersToTasks, "objectForKeyedSubscript:", a4));
  objc_msgSend(v7, "setCountOfBytesSent:", objc_msgSend(v6, "countOfBytesSent"));
  objc_msgSend(v7, "setCountOfBytesReceived:", objc_msgSend(v6, "countOfBytesReceived"));
  objc_msgSend(v7, "setCountOfBytesExpectedToSend:", objc_msgSend(v6, "countOfBytesExpectedToSend"));
  objc_msgSend(v7, "setCountOfBytesExpectedToReceive:", objc_msgSend(v6, "countOfBytesExpectedToReceive"));

}

- (void)setDescription:(id)a3 forTask:(unint64_t)a4
{
  NSMutableDictionary *identifiersToTasks;
  void *v7;
  void *v8;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  identifiersToTasks = self->_identifiersToTasks;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v7));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v10));

  objc_msgSend(v11, "setTaskDescription:", v13);
  objc_msgSend(v8, "setTaskDescription:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v12, 0, 1);

}

- (void)queueUpdatesForTask:(id)a3 updateType:(unint64_t)a4 highPriority:(BOOL)a5
{
  id v8;
  NSObject *workQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  BOOL v14;

  v8 = a3;
  workQueue = self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000FDF8;
  v11[3] = &unk_1000B13C0;
  v11[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_async(workQueue, v11);

}

- (void)setXPCConnection:(id)a3
{
  id v5;
  NSXPCConnection **p_xpcConn;
  NSObject *v7;
  void *v8;
  NSXPCConnection *xpcConn;
  NSString *clientBundleID;
  NSString *identifier;
  int clientPID;
  void *v13;
  int is_extension;
  NSXPCConnection *v15;
  NSObject *v16;
  void *v17;
  NSString *v18;
  NSString *v19;
  NDApplication *v20;
  NDApplication *connectedExtension;
  void *v22;
  __int128 v23;
  __int128 v24;
  NSXPCConnection *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  NSXPCConnection *v29;
  __int16 v30;
  NSString *v31;
  __int16 v32;
  NSString *v33;
  __int16 v34;
  int v35;

  v5 = a3;
  objc_msgSend(v5, "setUserInfo:", self);
  p_xpcConn = &self->_xpcConn;
  objc_storeStrong((id *)&self->_xpcConn, a3);
  self->_clientPID = objc_msgSend(v5, "processIdentifier");
  v7 = (id)qword_1000C7158;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    xpcConn = self->_xpcConn;
    identifier = self->_identifier;
    clientBundleID = self->_clientBundleID;
    clientPID = self->_clientPID;
    *(_DWORD *)buf = 138544386;
    v27 = v8;
    v28 = 2112;
    v29 = xpcConn;
    v30 = 2112;
    v31 = clientBundleID;
    v32 = 2112;
    v33 = identifier;
    v34 = 1024;
    v35 = clientPID;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Using XPC connection %@ for client %@ with identifier %@ and PID %d", buf, 0x30u);

  }
  if (self->_shouldPullInitialCredentials)
  {
    self->_shouldPullInitialCredentials = 0;
    -[NDCredentialStorage populateWithInitialCredentials](self->_credentialStorage, "populateWithInitialCredentials");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection _xpcConnection](*p_xpcConn, "_xpcConnection"));
  is_extension = xpc_connection_is_extension();

  if (is_extension)
  {
    v25 = 0;
    if (*p_xpcConn)
    {
      -[NSXPCConnection auditToken](*p_xpcConn, "auditToken");
    }
    else
    {
      v23 = 0u;
      v24 = 0u;
    }
    CPCopyBundleIdentifierAndTeamFromAuditToken(&v23, &v25, 0);
    v15 = v25;
    v16 = (id)qword_1000C7158;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v19 = self->_identifier;
      v18 = self->_clientBundleID;
      *(_DWORD *)buf = 138544130;
      v27 = v17;
      v28 = 2112;
      v29 = v15;
      v30 = 2112;
      v31 = v18;
      v32 = 2112;
      v33 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> XPC connection is to PlugIn %@ for session <%@>.<%@>", buf, 0x2Au);

    }
    if (v15)
    {
      v20 = (NDApplication *)objc_claimAutoreleasedReturnValue(+[NDApplication springboardApplicationWithBundleIdentifier:](NDApplication, "springboardApplicationWithBundleIdentifier:", v15));
      connectedExtension = self->_connectedExtension;
      self->_connectedExtension = v20;

      -[NDApplication addObserver:](self->_connectedExtension, "addObserver:", self);
    }

  }
  self->_shouldElevateDiscretionaryPriority = -[NDApplication shouldElevateDiscretionaryPriority](self->_clientApplication, "shouldElevateDiscretionaryPriority", v23, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NDUserEventAgentConnection sharedUserEventAgentConnection](NDUserEventAgentConnection, "sharedUserEventAgentConnection"));
  objc_msgSend(v22, "removePendingWakeForClient:sessionIdentifier:", self->_clientBundleID, self->_identifier);

}

- (NDBackgroundSession)initWithConfiguration:(id)a3 bundleID:(id)a4 isSpringBoardApp:(BOOL)a5 downloadDirectory:(id)a6 options:(id)a7 clientProxy:(id)a8 delegate:(id)a9 workQueue:(id)a10 db:(id)a11
{
  id v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t *v22;
  void *v23;
  id v24;
  id *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  NSObject *v57;
  _BOOL4 v58;
  void *v59;
  id v60;
  unsigned int v61;
  id v62;
  uint64_t v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  uint64_t v81;
  void *v82;
  NDCredentialStorage *v83;
  void *v84;
  void *v85;
  unsigned __int8 v86;
  NSObject *v87;
  NDBackgroundSession *v88;
  void *v89;
  unsigned int v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  NDCallbackQueue *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  unsigned __int8 v109;
  id v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  NSObject *v118;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unsigned int v126;
  unsigned int v127;
  void *v128;
  int v129;
  unsigned int v130;
  void *v132;
  void *v133;
  void *v134;
  _QWORD *v135;
  void *v136;
  _BOOL4 v137;
  void *v138;
  id v139;
  id v140;
  id v141;
  id v142;
  void *v143;
  id v144;
  id v145;
  id obj;
  id v147;
  objc_super v148;
  uint8_t buf[4];
  id v150;
  __int16 v151;
  id v152;
  __int16 v153;
  id v154;
  __int16 v155;
  id v156;
  __int16 v157;
  uint64_t v158;
  __int16 v159;
  uint64_t v160;
  __int16 v161;
  unsigned int v162;
  __int16 v163;
  unsigned int v164;
  __int16 v165;
  void *v166;
  __int16 v167;
  void *v168;
  __int16 v169;
  int v170;
  __int16 v171;
  unsigned int v172;

  v137 = a5;
  v15 = a3;
  v140 = a4;
  v147 = a7;
  v145 = a8;
  obj = a9;
  v141 = a10;
  v142 = a11;
  v148.receiver = self;
  v148.super_class = (Class)NDBackgroundSession;
  v16 = -[NDBackgroundSession init](&v148, "init");
  if (!v16)
  {
LABEL_66:
    v88 = v16;
    goto LABEL_67;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
  objc_msgSend(v17, "addTransaction");

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectForKeyedSubscript:", CFSTR("NDBackgroundSessionManagerKeySessionUUID")));
  v19 = v18;
  if (v18)
  {
    v135 = v16 + 264;
    v20 = v18;
  }
  else
  {
    v20 = objc_alloc_init((Class)NSUUID);
    v135 = v16 + 264;
  }
  v21 = (void *)*((_QWORD *)v16 + 33);
  *((_QWORD *)v16 + 33) = v20;

  objc_storeWeak((id *)v16 + 32, obj);
  v22 = (uint64_t *)(v16 + 280);
  objc_storeStrong((id *)v16 + 35, a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_sourceApplicationBundleIdentifier"));
  if (v23)
  {
    v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_sourceApplicationBundleIdentifier"));
    v25 = (id *)(v16 + 288);
  }
  else
  {
    v25 = (id *)(v16 + 288);
    v24 = *((id *)v16 + 35);
  }
  v26 = (void *)*((_QWORD *)v16 + 36);
  *((_QWORD *)v16 + 36) = v24;

  v16[248] = 1;
  v27 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v28 = (void *)*((_QWORD *)v16 + 23);
  *((_QWORD *)v16 + 23) = v27;

  v144 = objc_msgSend(objc_alloc((Class)LSApplicationExtensionRecord), "initWithBundleIdentifier:error:", *v22, 0);
  v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_sourceApplicationSecondaryIdentifier"));
  v30 = (void *)*((_QWORD *)v16 + 37);
  *((_QWORD *)v16 + 37) = v29;

  v143 = (void *)objc_claimAutoreleasedReturnValue(+[NDCloudContainer containerIDForPrimaryIdentifier:secondaryIdentifier:](NDCloudContainer, "containerIDForPrimaryIdentifier:secondaryIdentifier:", *((_QWORD *)v16 + 36), *((_QWORD *)v16 + 37)));
  if (v143)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NDCloudContainer bundleIDForPrimaryIdentifier:secondaryIdentifier:](NDCloudContainer, "bundleIDForPrimaryIdentifier:secondaryIdentifier:", *((_QWORD *)v16 + 36), *((_QWORD *)v16 + 37)));
    v32 = (id)qword_1000C7158;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uuid"));
      v34 = (void *)*v22;
      *(_DWORD *)buf = 138544130;
      v150 = v33;
      v151 = 2112;
      v152 = v34;
      v153 = 2112;
      v154 = v143;
      v155 = 2112;
      v156 = v31;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Client %@ is acting on behalf of cloud documents container with container id: %@ and bundle id: %@", buf, 0x2Au);

    }
    if (v31)
      v35 = v31;
    else
      v35 = v143;
    objc_storeStrong(v25, v35);
    v36 = objc_claimAutoreleasedReturnValue(+[NDApplication cloudContainerWithIdentifier:](NDApplication, "cloudContainerWithIdentifier:", v143));
    v37 = (void *)*((_QWORD *)v16 + 27);
    *((_QWORD *)v16 + 27) = v36;

  }
  v38 = (id *)(v16 + 216);
  if (!*((_QWORD *)v16 + 27))
  {
    v39 = *v25;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sharedContainerIdentifier"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NDFPProvider providerIDForBundle:sharedContainerIdentifier:](NDFPProvider, "providerIDForBundle:sharedContainerIdentifier:", v39, v40));

    if (v41)
    {
      v42 = objc_claimAutoreleasedReturnValue(+[NDApplication fileProviderWithIdentifer:applicationIdentifier:](NDApplication, "fileProviderWithIdentifer:applicationIdentifier:", v41, *v25));
      v43 = *v38;
      *v38 = (id)v42;

      v44 = (id)qword_1000C7158;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uuid"));
        v46 = (void *)*v22;
        v47 = *v25;
        *(_DWORD *)buf = 138544130;
        v150 = v45;
        v151 = 2112;
        v152 = v46;
        v153 = 2112;
        v154 = v41;
        v155 = 2112;
        v156 = v47;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Client %@ is acting on behalf of file provider id: %@ and bundle id: %@", buf, 0x2Au);

      }
    }

  }
  if (v144 && sub_10001FE28(v144))
  {
    v48 = (id)qword_1000C7158;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uuid"));
      v50 = (void *)*v22;
      *(_DWORD *)buf = 138543618;
      v150 = v49;
      v151 = 2112;
      v152 = v50;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Client %@ is an independent extension", buf, 0x16u);

    }
    v51 = objc_claimAutoreleasedReturnValue(+[NDApplication chronoKitExtensionWithIdentifier:](NDApplication, "chronoKitExtensionWithIdentifier:", *v22));
    v52 = (void *)*((_QWORD *)v16 + 4);
    *((_QWORD *)v16 + 4) = v51;

  }
  v53 = (void *)*((_QWORD *)v16 + 4);
  if (v53)
  {
    v54 = v53;
  }
  else
  {
    v55 = *v22;
    if (v137)
      v54 = (id)objc_claimAutoreleasedReturnValue(+[NDApplication springboardApplicationWithBundleIdentifier:](NDApplication, "springboardApplicationWithBundleIdentifier:", v55));
    else
      v54 = (id)objc_claimAutoreleasedReturnValue(+[NDApplication applicationWithIdentifier:](NDApplication, "applicationWithIdentifier:", v55));
  }
  v56 = (void *)*((_QWORD *)v16 + 4);
  *((_QWORD *)v16 + 4) = v54;

  if (!*((_QWORD *)v16 + 27))
  {
    if ((objc_msgSend(*v25, "isEqualToString:", *v22) & 1) != 0)
    {
      objc_storeStrong((id *)v16 + 27, *((id *)v16 + 4));
      v57 = (id)qword_1000C7158;
      v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
      if (v137)
      {
        if (v58)
        {
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uuid"));
          v60 = *v25;
          *(_DWORD *)buf = 138543618;
          v150 = v59;
          v151 = 2112;
          v152 = v60;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Client %@ is a SpringBoard application", buf, 0x16u);

        }
      }
      else if (v58)
      {
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uuid"));
        v65 = *v25;
        *(_DWORD *)buf = 138543618;
        v150 = v64;
        v151 = 2112;
        v152 = v65;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Client %@ is a daemon or non-SpringBoard application", buf, 0x16u);

      }
    }
    else
    {
      v61 = +[NDApplication springBoardApplicationExistsWithIdentifier:](NDApplication, "springBoardApplicationExistsWithIdentifier:", *v25);
      v62 = *v25;
      if (v61)
        v63 = objc_claimAutoreleasedReturnValue(+[NDApplication springboardApplicationWithBundleIdentifier:](NDApplication, "springboardApplicationWithBundleIdentifier:", v62));
      else
        v63 = objc_claimAutoreleasedReturnValue(+[NDApplication applicationWithIdentifier:](NDApplication, "applicationWithIdentifier:", v62));
      v66 = *v38;
      *v38 = (id)v63;

      v57 = (id)qword_1000C7158;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uuid"));
        v68 = (void *)*v22;
        v69 = *v25;
        *(_DWORD *)buf = 138544130;
        v150 = v67;
        v151 = 2112;
        v152 = v68;
        v153 = 2112;
        v154 = v69;
        v155 = 1024;
        LODWORD(v156) = v61;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Client %@ is acting on behalf of application %@, impersonatingSpringBoardApp: %d", buf, 0x26u);

      }
    }

  }
  v70 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
  v71 = (void *)*((_QWORD *)v16 + 34);
  *((_QWORD *)v16 + 34) = v70;

  v72 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sharedContainerIdentifier"));
  v73 = (void *)*((_QWORD *)v16 + 39);
  *((_QWORD *)v16 + 39) = v72;

  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities sessionPath:forBundleID:](NDFileUtilities, "sessionPath:forBundleID:", *((_QWORD *)v16 + 34), *((_QWORD *)v16 + 35)));
  v75 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v74));
  v76 = (void *)*((_QWORD *)v16 + 14);
  *((_QWORD *)v16 + 14) = v75;

  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_directoryForDownloadedFiles"));
  v78 = v77;
  if (v77)
    v79 = v77;
  else
    v79 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "setupDownloadDirectory"));
  v80 = (void *)*((_QWORD *)v16 + 15);
  *((_QWORD *)v16 + 15) = v79;

  v81 = objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v16 + 14), "URLByAppendingPathComponent:", CFSTR("Uploads")));
  v82 = (void *)*((_QWORD *)v16 + 16);
  *((_QWORD *)v16 + 16) = v81;

  if (*((_QWORD *)v16 + 15))
  {
    objc_storeStrong((id *)v16 + 25, a10);
    objc_storeStrong((id *)v16 + 29, a8);
    v83 = -[NDCredentialStorage initWithDelegate:forBundleID:]([NDCredentialStorage alloc], "initWithDelegate:forBundleID:", v16, *((_QWORD *)v16 + 35));
    v84 = (void *)*((_QWORD *)v16 + 3);
    *((_QWORD *)v16 + 3) = v83;

    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "configurationWithClientConfiguration:discretionary:", v15, 0));
    v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "configurationWithClientConfiguration:discretionary:", v15, 1));
    v16[142] = objc_msgSend(v15, "isDiscretionary");
    if ((objc_msgSend(v15, "sessionSendsLaunchEvents") & 1) != 0)
      v86 = 1;
    else
      v86 = objc_msgSend(v15, "_sessionSendsLaunchOnDemandEvents");
    v16[141] = v86;
    v89 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
    v90 = objc_msgSend(v89, "isInSyncBubble");

    if (v90)
      v16[141] = 0;
    v16[136] = objc_msgSend(v15, "_performsEVCertCheck");
    objc_msgSend(v16, "updateOptions:", v147);
    v91 = objc_claimAutoreleasedReturnValue(+[NSURLSession _sessionWithConfiguration:delegate:delegateDispatchQueue:](NSURLSession, "_sessionWithConfiguration:delegate:delegateDispatchQueue:", v85, v16, *((_QWORD *)v16 + 25)));
    v92 = (void *)*((_QWORD *)v16 + 1);
    *((_QWORD *)v16 + 1) = v91;

    v93 = objc_claimAutoreleasedReturnValue(+[NSURLSession _sessionWithConfiguration:delegate:delegateDispatchQueue:](NSURLSession, "_sessionWithConfiguration:delegate:delegateDispatchQueue:", v138, v16, *((_QWORD *)v16 + 25)));
    v94 = (void *)*((_QWORD *)v16 + 2);
    *((_QWORD *)v16 + 2) = v93;

    objc_msgSend(*((id *)v16 + 2), "_useTLSSessionCacheFromSession:", *((_QWORD *)v16 + 1));
    v95 = -[NDCallbackQueue initWithDelegate:]([NDCallbackQueue alloc], "initWithDelegate:", v16);
    v96 = (void *)*((_QWORD *)v16 + 26);
    *((_QWORD *)v16 + 26) = v95;

    v97 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v98 = (void *)*((_QWORD *)v16 + 6);
    *((_QWORD *)v16 + 6) = v97;

    v99 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v100 = (void *)*((_QWORD *)v16 + 7);
    *((_QWORD *)v16 + 7) = v99;

    v101 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v102 = (void *)*((_QWORD *)v16 + 28);
    *((_QWORD *)v16 + 28) = v101;

    v103 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v104 = (void *)*((_QWORD *)v16 + 8);
    *((_QWORD *)v16 + 8) = v103;

    v105 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v106 = (void *)*((_QWORD *)v16 + 9);
    *((_QWORD *)v16 + 9) = v105;

    v107 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v108 = (void *)*((_QWORD *)v16 + 11);
    *((_QWORD *)v16 + 11) = v107;

    v16[147] = v145 != 0;
    v16[192] = objc_msgSend(v15, "_allowsRetryForBackgroundDataTasks");
    if (v16[146])
      v109 = 1;
    else
      v109 = objc_msgSend(v15, "_infersDiscretionaryFromOriginatingClient");
    v16[146] = v109;
    *(_WORD *)(v16 + 143) = 0;
    *((_DWORD *)v16 + 40) = objc_msgSend(v15, "_neTrackerTCCResult");
    *((_DWORD *)v16 + 41) = -1;
    +[NDFileUtilities createDirectoryAtURL:](NDFileUtilities, "createDirectoryAtURL:", *((_QWORD *)v16 + 14));
    +[NDFileUtilities createDirectoryAtURL:](NDFileUtilities, "createDirectoryAtURL:", *((_QWORD *)v16 + 16));
    if (*((_QWORD *)v16 + 29))
    {
      v110 = objc_msgSend(v15, "copy");
      v111 = objc_msgSend(v147, "mutableCopy");
      objc_msgSend(v111, "setObject:forKeyedSubscript:", *v135, CFSTR("NDBackgroundSessionManagerKeySessionUUID"));
      v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v16 + 14), "URLByAppendingPathComponent:", CFSTR("configuration.plist")));
      v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "path"));

      v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v16 + 14), "URLByAppendingPathComponent:", CFSTR("options.plist")));
      v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "path"));

      v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v110, 1, 0));
      objc_msgSend(v116, "writeToFile:atomically:", v113, 1);

      v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v111, 1, 0));
      objc_msgSend(v117, "writeToFile:atomically:", v115, 1);

    }
    if (*v38)
      objc_msgSend(*v38, "addObserver:", v16);
    objc_storeStrong((id *)v16 + 30, a11);
    v118 = (id)qword_1000C7158;
    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
    {
      v136 = v85;
      v139 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uuid"));
      v119 = (void *)*((_QWORD *)v16 + 34);
      v120 = (void *)*((_QWORD *)v16 + 35);
      v121 = (void *)*((_QWORD *)v16 + 33);
      objc_msgSend(v15, "timeoutIntervalForResource");
      v123 = v122;
      objc_msgSend(v15, "timeoutIntervalForRequest");
      v125 = v124;
      v126 = objc_msgSend(v15, "allowsCellularAccess");
      v127 = objc_msgSend(v15, "allowsExpensiveNetworkAccess");
      v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_sourceApplicationBundleIdentifier"));
      v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_sourceApplicationSecondaryIdentifier"));
      v129 = v16[248];
      v130 = objc_msgSend(v15, "_allowsUCA");
      *(_DWORD *)buf = 138546178;
      v150 = v139;
      v151 = 2114;
      v152 = v121;
      v153 = 2112;
      v154 = v120;
      v155 = 2112;
      v156 = v119;
      v157 = 2048;
      v158 = v123;
      v159 = 2048;
      v160 = v125;
      v161 = 1024;
      v162 = v126;
      v163 = 1024;
      v164 = v127;
      v165 = 2112;
      v166 = v134;
      v167 = 2112;
      v168 = v128;
      v169 = 1024;
      v170 = v129;
      v171 = 1024;
      v172 = v130;
      _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Session <%{public}@> is for <%@>.<%@> using resource timeout: %f, request timeout: %f allowsCellularAccess: %d, allowsExpensiveAccess: %d, _sourceApplicationBundleIdentifier: %@, _sourceApplicationSecondaryIdentifier: %@, hasSqliteSupport: %u, _allowsUCA: %d", buf, 0x6Au);

      v85 = v136;
    }

    goto LABEL_66;
  }
  v87 = (id)qword_1000C7158;
  if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
  {
    v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uuid"));
    v133 = (void *)*v22;
    *(_DWORD *)buf = 138543618;
    v150 = v132;
    v151 = 2112;
    v152 = v133;
    _os_log_error_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Couldn't find out download directory for %@. Not creating session", buf, 0x16u);

  }
  v88 = 0;
LABEL_67:

  return v88;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 264, 1);
}

- (id)configurationWithClientConfiguration:(id)a3 discretionary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  _UNKNOWN **v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
  objc_msgSend(v6, "timeoutIntervalForRequest");
  objc_msgSend(v7, "setTimeoutIntervalForRequest:");
  objc_msgSend(v6, "timeoutIntervalForResource");
  if (v8 == 0.0)
    objc_msgSend(v7, "timeoutIntervalForResource");
  objc_msgSend(v7, "setTimeoutIntervalForResource:");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connectionProxyDictionary"));
  objc_msgSend(v7, "setConnectionProxyDictionary:", v9);

  objc_msgSend(v7, "setTLSMinimumSupportedProtocol:", objc_msgSend(v6, "TLSMinimumSupportedProtocol"));
  objc_msgSend(v7, "setTLSMaximumSupportedProtocol:", objc_msgSend(v6, "TLSMaximumSupportedProtocol"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "HTTPAdditionalHeaders"));
  objc_msgSend(v7, "setHTTPAdditionalHeaders:", v10);

  objc_msgSend(v7, "setHTTPMaximumConnectionsPerHost:", objc_msgSend(v6, "HTTPMaximumConnectionsPerHost"));
  objc_msgSend(v7, "setNetworkServiceType:", objc_msgSend(v6, "networkServiceType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_authenticatorStatusCodes"));
  objc_msgSend(v7, "set_authenticatorStatusCodes:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_atsContext"));
  objc_msgSend(v7, "set_atsContext:", v12);

  objc_msgSend(v7, "set_allowsTLSFalseStart:", objc_msgSend(v6, "_allowsTLSFalseStart"));
  objc_msgSend(v7, "set_allowsTLSFallback:", objc_msgSend(v6, "_allowsTLSFallback"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_tlsTrustPinningPolicyName"));
  objc_msgSend(v7, "set_tlsTrustPinningPolicyName:", v13);

  objc_msgSend(v7, "set_allowsTLSECH:", objc_msgSend(v6, "_allowsTLSECH"));
  objc_msgSend(v7, "set_reportsDataStalls:", objc_msgSend(v6, "_reportsDataStalls"));
  objc_msgSend(v7, "set_TCPAdaptiveReadTimeout:", objc_msgSend(v6, "_TCPAdaptiveReadTimeout"));
  objc_msgSend(v7, "set_TCPAdaptiveWriteTimeout:", objc_msgSend(v6, "_TCPAdaptiveWriteTimeout"));
  objc_msgSend(v7, "set_onBehalfOfPairedDevice:", objc_msgSend(v6, "_onBehalfOfPairedDevice"));
  objc_msgSend(v7, "set_requiresSustainedDataDelivery:", objc_msgSend(v6, "_requiresSustainedDataDelivery"));
  objc_msgSend(v7, "set_IDSMessageTimeout:", objc_msgSend(v6, "_IDSMessageTimeout"));
  objc_msgSend(v7, "set_alwaysPerformDefaultTrustEvaluation:", objc_msgSend(v6, "_alwaysPerformDefaultTrustEvaluation"));
  objc_msgSend(v7, "set_prefersInfraWiFi:", objc_msgSend(v6, "_prefersInfraWiFi"));
  if (-[NDApplication canBeSuspended](self->_clientApplication, "canBeSuspended"))
    objc_msgSend(v7, "setNetworkServiceType:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maximumWatchCellularTransferSize"));
  objc_msgSend(v7, "set_maximumWatchCellularTransferSize:", v14);

  objc_msgSend(v7, "setHTTPCookieStorage:", 0);
  objc_msgSend(v7, "setURLCache:", 0);
  objc_msgSend(v7, "setURLCredentialStorage:", self->_credentialStorage);
  objc_msgSend(v7, "setAllowsCellularAccess:", objc_msgSend(v6, "allowsCellularAccess"));
  objc_msgSend(v7, "setWaitsForConnectivity:", 0);
  objc_msgSend(v7, "setShouldUseExtendedBackgroundIdleMode:", 0);
  objc_msgSend(v7, "setAllowsExpensiveNetworkAccess:", objc_msgSend(v6, "allowsExpensiveNetworkAccess"));
  objc_msgSend(v7, "setAllowsConstrainedNetworkAccess:", objc_msgSend(v6, "allowsConstrainedNetworkAccess"));
  objc_msgSend(v7, "_setAllowsUCA:", objc_msgSend(v6, "_allowsUCA"));
  objc_msgSend(v7, "set_allowsVirtualInterfaces:", objc_msgSend(v6, "_allowsVirtualInterfaces"));
  objc_msgSend(v7, "set_multipathAlternatePort:", objc_msgSend(v6, "_multipathAlternatePort"));
  objc_msgSend(v7, "set_allowsPowerNapScheduling:", objc_msgSend(v6, "_allowsPowerNapScheduling"));
  objc_msgSend(v7, "set_allowsHSTSWithUntrustedRootCertificate:", objc_msgSend(v6, "_allowsHSTSWithUntrustedRootCertificate"));
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_connectionPoolName"));
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = CFSTR("NSURLSessionBackgroundPoolName");
  objc_msgSend(v7, "set_tcpConnectionPoolName:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
  if (objc_msgSend(v18, "isInSyncBubble"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_connectionPoolName"));

    if (v19)
      goto LABEL_12;
    v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSURLSessionBackgroundPoolName-sync-%d"), geteuid());
    v18 = (void *)objc_claimAutoreleasedReturnValue(v20);
    objc_msgSend(v7, "set_tcpConnectionPoolName:", v18);
  }

LABEL_12:
  objc_msgSend(v7, "set_connectionCachePurgeTimeout:", 1.0);
  objc_msgSend(v7, "set_longLivedConnectionCachePurgeTimeout:", 1.0);
  objc_msgSend(v7, "set_preventsIdleSleepOnceConnected:", 1);
  objc_msgSend(v7, "set_timingDataOptions:", objc_msgSend(v6, "_timingDataOptions"));
  objc_msgSend(v7, "set_shouldSkipPreferredClientCertificateLookup:", objc_msgSend(v6, "_shouldSkipPreferredClientCertificateLookup"));
  objc_msgSend(v7, "set_requiresPowerPluggedIn:", objc_msgSend(v6, "_requiresPowerPluggedIn"));
  objc_msgSend(v7, "set_sourceApplicationBundleIdentifier:", self->_monitoredAppBundleID);
  objc_msgSend(v7, "set_sourceApplicationSecondaryIdentifier:", self->_secondaryID);
  objc_msgSend(v7, "set_watchExtensionBundleIdentifier:", self->_watchExtensionBundleIdentifier);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_sourceApplicationAuditTokenData"));
  objc_msgSend(v7, "set_sourceApplicationAuditTokenData:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_directoryForDownloadedFiles"));
  objc_msgSend(v7, "set_directoryForDownloadedFiles:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
  v24 = objc_msgSend(v23, "isPrivileged");

  if (v24)
    objc_msgSend(v7, "set_requiresClientToOpenFiles:", 1);
  objc_msgSend(v7, "set_duetPreauthorized:", objc_msgSend(v6, "_duetPreauthorized"));
  objc_msgSend(v7, "set_loggingPrivacyLevel:", objc_msgSend(v6, "_loggingPrivacyLevel"));
  objc_msgSend(v7, "set_duetPreClearedMode:", objc_msgSend(v6, "_duetPreClearedMode"));
  objc_msgSend(v7, "set_pidForHAR:", objc_msgSend(v6, "_pidForHAR"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((objc_msgSend(v6, "_duetPreauthorized") & 1) != 0)
    v26 = 0;
  else
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v25, "setObject:forKeyedSubscript:", kCFBooleanTrue, _kCFStreamPropertyLargeDownload);
  objc_msgSend(v25, "setObject:forKeyedSubscript:", kCFBooleanTrue, kCFStreamPropertyIndefiniteConnection);
  objc_msgSend(v25, "setObject:forKeyedSubscript:", &off_1000B49A0, _kCFStreamPropertyWatchdogTimeout);
  objc_msgSend(v25, "setObject:forKeyedSubscript:", &off_1000B49B8, _kCFStreamPropertyIndefiniteConnectionKickInterval);
  if (v4)
  {
    if (v26)
    {
      objc_msgSend(v7, "timeoutIntervalForResource");
      -[NDBackgroundSession defaultWindowDurationForResourceTimeout:](self, "defaultWindowDurationForResourceTimeout:");
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)v27));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, kConditionalConnectionRequirementTimeWindowDuration);

      objc_msgSend(v26, "setObject:forKeyedSubscript:", &off_1000B49D0, kConditionalConnectionRequirementTimeWindowDelay);
      objc_msgSend(v26, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kConditionalConnectionIsDiscretionary);
      objc_msgSend(v25, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kCFStreamPropertyDUETConditional);
      if (objc_msgSend(v6, "isDiscretionary")
        && (objc_msgSend(v6, "_clientIsNotExplicitlyDiscretionary") & 1) == 0)
      {
        objc_msgSend(v26, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kConditionalConnectionClientOptInDiscretionary);
      }
      else
      {
        objc_msgSend(v7, "set_clientIsNotExplicitlyDiscretionary:", 1);
      }
      if (objc_msgSend(v6, "_xpcActivityBudgeted"))
      {
        objc_msgSend(v26, "setObject:forKeyedSubscript:", &off_1000B49E8, kConditionalConnectionRequirementDuetPreClearedMode);
      }
      else
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v7, "_duetPreClearedMode")));
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v31, kConditionalConnectionRequirementDuetPreClearedMode);

      }
    }
    objc_msgSend(v7, "set_forcedNetworkServiceType:", 5);
    objc_msgSend(v7, "setDiscretionary:", 1);
  }
  else if (v26)
  {
    objc_msgSend(v26, "setObject:forKeyedSubscript:", &off_1000B4A00, kConditionalConnectionRequirementTimeWindowDuration);
    objc_msgSend(v26, "setObject:forKeyedSubscript:", &off_1000B49D0, kConditionalConnectionRequirementTimeWindowDelay);
    objc_msgSend(v26, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, kConditionalConnectionIsDiscretionary);
    if (objc_msgSend(v6, "_xpcActivityBudgeted"))
    {
      if (objc_msgSend(v6, "_xpcActivityBudgeted") == 1)
        v29 = &off_1000B49E8;
      else
        v29 = &off_1000B4A18;
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v29, kConditionalConnectionRequirementDuetPreClearedMode);
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v7, "_duetPreClearedMode")));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, kConditionalConnectionRequirementDuetPreClearedMode);

    }
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
  v33 = objc_msgSend(v32, "isInSyncBubble");

  if (v33)
    objc_msgSend(v7, "set_forcedNetworkServiceType:", 5);
  if (v26)
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, kCFStreamPropertyConditionalConnectionProperties);
  objc_msgSend(v7, "set_socketStreamProperties:", v25);
  objc_msgSend(v7, "setSkip_download_unlink:", 1);

  return v7;
}

- (id)setupDownloadDirectory
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  if (!self->_sharedContainerIdentifier)
    goto LABEL_14;
  v3 = objc_msgSend(objc_alloc((Class)LSApplicationExtensionRecord), "initWithBundleIdentifier:error:", self->_clientBundleID, 0);
  v4 = v3;
  if (v3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "groupContainerURLs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", self->_sharedContainerIdentifier));
  }
  else
  {
    v5 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", self->_clientBundleID, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "groupContainerURLs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", self->_sharedContainerIdentifier));

  }
  if (!v6)
  {
LABEL_14:
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NDApplication containerURL](self->_clientApplication, "containerURL"));
    if (!v6)
      goto LABEL_8;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Caches/com.apple.nsurlsessiond/Downloads"), 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", self->_clientBundleID, 1));

  if (!v9)
LABEL_8:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities defaultDownloadDirectoryForBundleID:](NDFileUtilities, "defaultDownloadDirectoryForBundleID:", self->_clientBundleID));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
  v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

  if ((v12 & 1) == 0)
    +[NDFileUtilities createDirectoryAtURL:](NDFileUtilities, "createDirectoryAtURL:", v9);

  return v9;
}

- (double)defaultWindowDurationForResourceTimeout:(double)a3
{
  return (double)(uint64_t)(a3 * 0.9);
}

- (id)getClientProxy
{
  return self->_clientProxy;
}

- (void)setupDASPropertiesOnTask:(id)a3 taskInfo:(id)a4 discretionaryStatus:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  unsigned __int8 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  NDApplication *v36;
  NDApplication *monitoredApplication;
  NDApplication *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  double v49;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[NDApplication currentRequestDelay](self->_clientApplication, "currentRequestDelay");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_effectiveConfiguration"));
  v13 = objc_msgSend(v12, "_duetPreauthorized");

  if ((v13 & 1) != 0)
  {
    v14 = (id)qword_1000C7158;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_loggableDescription"));
      *(_DWORD *)buf = 138543618;
      v45 = v15;
      v46 = 2114;
      v47 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ is duet preauthorized", buf, 0x16u);

    }
  }
  else
  {
    v14 = objc_msgSend(v8, "_copySocketStreamProperties");
    v43 = kCFStreamPropertyConditionalConnectionProperties;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:"));
    v41 = v17;
    if (v17)
      v18 = (NSMutableDictionary *)objc_msgSend(v17, "mutableCopy", v17);
    else
      v18 = objc_opt_new(NSMutableDictionary);
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_legacySocketStreamProperties", v41));
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_legacySocketStreamProperties"));
      v22 = (NSMutableDictionary *)objc_msgSend(v21, "mutableCopy");

    }
    else
    {
      v22 = objc_opt_new(NSMutableDictionary);
    }

    v23 = objc_opt_new(NSMutableDictionary);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_loggableDescription"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v24, kConditionalConnectionActivityName);

    if (objc_msgSend(v9, "taskKind") == (id)1
      || objc_msgSend(v9, "taskKind") == (id)2
      && (v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "originalRequest")),
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "HTTPBodyStream")),
          v26,
          v25,
          v26))
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kConditionalConnectionIsUpload);
    }
    objc_msgSend(v8, "set_DuetActivityProperties:", v23);
    if (v5 && v11 > 0.0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentRequest"));
      objc_msgSend(v27, "_timeWindowDelay");
      v29 = v28;

      if (v11 > v29)
      {
        v30 = (id)qword_1000C7158;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
          *(_DWORD *)buf = 138543874;
          v45 = v31;
          v46 = 2114;
          v47 = v32;
          v48 = 2048;
          v49 = v11;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ adding delay of %f", buf, 0x20u);

        }
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v33, kConditionalConnectionRequirementTimeWindowDelay);

        -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kConditionalConnectionIsDiscretionary);
      }
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_effectiveConfiguration"));
    v35 = objc_msgSend(v34, "_onBehalfOfPairedDevice");

    if (v35)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kConditionalConnectionOnBehalfOfPairedDevice);
    if (objc_msgSend(v9, "isDiscretionary") && objc_msgSend(v9, "startedUserInitiated"))
    {
      v36 = self->_clientApplication;
      if (self->_infersDiscretionary)
      {
        monitoredApplication = self->_monitoredApplication;
        if (monitoredApplication)
        {
          v38 = monitoredApplication;

          v36 = v38;
        }
      }
      if (-[NDApplication isInTransitionalDiscretionaryPeriod](v36, "isInTransitionalDiscretionaryPeriod"))
        -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kConditionalConnectionInTransitionalDiscretionaryPeriod);

    }
    if (self->_shouldElevateDiscretionaryPriority)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kConditionalConnectionRequirementDiscretionaryElevated);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "additionalProperties"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("TimeoutIntervalForResource")));

    if (v40)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v40, kConditionalConnectionRequirementTimeWindowDuration);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v19, v43);
    objc_msgSend(v8, "set_legacySocketStreamProperties:", v22);

  }
}

- (id)sessionForDiscretionaryStatus:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (a3)
    v3 = 16;
  return *(id *)((char *)&self->super.isa + v3);
}

- (void)removeUploadFileForTaskInfo:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "fileURL"));
  +[NDFileUtilities removeItemAtURL:](NDFileUtilities, "removeItemAtURL:");

}

- (void)removeOutstandingTaskWithIdentifier:(unint64_t)a3
{
  NSMutableArray *outstandingTaskIDs;
  id v4;

  outstandingTaskIDs = self->_outstandingTaskIDs;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableArray removeObject:](outstandingTaskIDs, "removeObject:");

}

- (void)removeDownloadFileForTaskInfo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathToDownloadTaskFile"));
  if (v3
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "additionalProperties")),
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pathToDownloadTaskFile"))),
        v4,
        v3))
  {
    +[NDFileUtilities removeItemAtPath:](NDFileUtilities, "removeItemAtPath:", v3);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "downloadFileURL"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "downloadFileURL"));
      +[NDFileUtilities removeItemAtURL:](NDFileUtilities, "removeItemAtURL:", v6);

    }
    v3 = 0;
  }

}

- (int64_t)priorityForDiscretionaryStatus:(BOOL)a3
{
  if (a3)
    return 600;
  else
    return 300;
}

- (void)pingForXPCObjectValidityWithReply:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)handleCompletionOfTask:(id)a3 identifier:(unint64_t)a4 taskInfo:(id)a5 isRecoverable:(BOOL)a6 suppressWake:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;

  v7 = a7;
  v13 = a3;
  v12 = a5;
  -[NDBackgroundSession cancelMonitorForTask:](self, "cancelMonitorForTask:", a4);
  sub_10000B8B4(3, self->_clientBundleID, self->_identifier, self->_monitoredAppBundleID, self->_secondaryID, v13, v12, a6);
  -[NDBackgroundSession finalizeTaskCompletionWithSuppressedWake:](self, "finalizeTaskCompletionWithSuppressedWake:", v7);

}

- (id)getTLSSessionCachePrefix
{
  NSURLSession *userInitiatedSession;

  userInitiatedSession = self->_userInitiatedSession;
  if (userInitiatedSession || (userInitiatedSession = self->_discretionaryPrioritySession) != 0)
    userInitiatedSession = (NSURLSession *)objc_claimAutoreleasedReturnValue(-[NSURLSession _tlsSessionCachePrefix](userInitiatedSession, "_tlsSessionCachePrefix"));
  return userInitiatedSession;
}

- (BOOL)finalizeTaskCompletionWithSuppressedWake:(BOOL)a3
{
  BOOL v5;

  if (!-[NDBackgroundSession sessionHasOutstandingTasks](self, "sessionHasOutstandingTasks")
    && !-[NDBackgroundSession clientIsActive](self, "clientIsActive"))
  {
    if (!a3)
    {
      v5 = 1;
      -[NDBackgroundSession wakeUpClient:](self, "wakeUpClient:", 1);
      return v5;
    }
    if (!-[NDCallbackQueue count](self->_callbackQueue, "count"))
      -[NDBackgroundSession cleanupSessionWithCompletionHandler:](self, "cleanupSessionWithCompletionHandler:", 0);
  }
  return 0;
}

- (id)descriptionForTaskWithIdentifier:(unint64_t)a3
{
  NSMutableDictionary *identifiersToTaskInfo;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v5));

  if (v6)
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_loggableDescription"));
  else
    v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Task <?>.<%lu>"), a3));
  v8 = (void *)v7;

  return v8;
}

- (id)clientErrorForError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  _UNKNOWN **v13;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (sub_10001B1B4(v3))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
        v7 = (NSMutableDictionary *)objc_msgSend(v6, "mutableCopy");

      }
      else
      {
        v7 = objc_opt_new(NSMutableDictionary);
      }

      v13 = sub_10001F7A4(v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (v11)
        -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v11, NSURLErrorBackgroundTaskCancelledReasonKey);
      v12 = objc_claimAutoreleasedReturnValue(+[NSURLError errorWithDomain:code:userInfo:](NSURLError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -999, v7));
      goto LABEL_12;
    }
    v9 = objc_opt_class(NSURLError);
    v8 = v4;
    if ((objc_opt_isKindOfClass(v4, v9) & 1) == 0)
    {
      v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
      v10 = objc_msgSend(v4, "code");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v12 = objc_claimAutoreleasedReturnValue(+[NSURLError errorWithDomain:code:userInfo:](NSURLError, "errorWithDomain:code:userInfo:", v7, v10, v11));
LABEL_12:
      v8 = (void *)v12;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)clientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)clientAcknowledgedTerminalCallbackForTask:(unint64_t)a3
{
  NSMutableDictionary *identifiersToTasks;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;

  identifiersToTasks = self->_identifiersToTasks;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
LABEL_4:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v10, 13, 0);

    -[NDCallbackQueue drainCallbacksForTaskIdentifier:](self->_callbackQueue, "drainCallbacksForTaskIdentifier:", a3);
    if (!-[NDCallbackQueue count](self->_callbackQueue, "count")
      && !-[NDBackgroundSession sessionHasOutstandingTasks](self, "sessionHasOutstandingTasks"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession invalidateReply](self, "invalidateReply"));

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession invalidateReply](self, "invalidateReply"));
        -[NDBackgroundSession setInvalidateReply:](self, "setInvalidateReply:", 0);
        -[NDBackgroundSession cleanupSessionWithCompletionHandler:](self, "cleanupSessionWithCompletionHandler:", v12);

      }
    }
    goto LABEL_11;
  }
  if (objc_msgSend(v7, "state") == (id)3)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_tasksToIdentifiers, "removeObjectForKey:", v7);
    v8 = self->_identifiersToTasks;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", v9);

    goto LABEL_4;
  }
  v13 = (id)qword_1000C7158;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_loggableDescription"));
    v16 = 138543618;
    v17 = v14;
    v18 = 2114;
    v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ skipping acknowledgement teardown since it's not actually complete", (uint8_t *)&v16, 0x16u);

  }
LABEL_11:

}

- (void)cancelMonitorForTask:(unint64_t)a3
{
  NSMutableDictionary *identifiersToMonitors;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;

  identifiersToMonitors = self->_identifiersToMonitors;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v9 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToMonitors, "objectForKeyedSubscript:", v6));

  objc_msgSend(v9, "cancel");
  v7 = self->_identifiersToMonitors;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", v8);

}

- (void)addOutstandingTaskWithIdentifier:(unint64_t)a3
{
  NSMutableArray *outstandingTaskIDs;
  id v4;

  outstandingTaskIDs = self->_outstandingTaskIDs;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableArray addObject:](outstandingTaskIDs, "addObject:");

}

- (void)updateOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NSURLSessionDelegateImplementsWillSendRequestForEstablishedConnectionKey")));
  self->_clientImplementsWillSendRequest = objc_msgSend(v4, "BOOLValue");

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NSURLSessionDelegateImplementsWillBeginDelayedRequestKey")));
  self->_clientImplementsWillBeginDelayedRequest = objc_msgSend(v5, "BOOLValue");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NSURLSessionDelegateImplementsSessionAuthChallengeKey")));
  self->_clientImplementsSessionChallenge = objc_msgSend(v6, "BOOLValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NSURLSessionDelegateImplementsTaskAuthChallengeKey")));
  self->_clientImplementsTaskChallenge = objc_msgSend(v7, "BOOLValue");

}

- (void)applicationWasSuspended:(id)a3 pid:(int)a4
{
  id v6;
  NSObject *workQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040E6C;
  block[3] = &unk_1000B1370;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(workQueue, block);

}

- (void)backgroundUpdatesEnabledForApplication:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100040DA8;
  v7[3] = &unk_1000B23F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)clientApplicationWasReinstalled
{
  NSObject *v3;
  void *v4;
  NSString *clientBundleID;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSString *v23;
  void *v24;
  NSMutableDictionary *obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  NSString *v34;

  v3 = (id)qword_1000C7158;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    clientBundleID = self->_clientBundleID;
    *(_DWORD *)buf = 138543618;
    v32 = v4;
    v33 = 2112;
    v34 = clientBundleID;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Application %@ was reinstalled, adjusting download paths", buf, 0x16u);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession setupDownloadDirectory](self, "setupDownloadDirectory"));
  v24 = v6;
  if (v6)
  {
    v7 = v6;
    if ((objc_msgSend(v6, "isEqual:", self->_downloadDirectory) & 1) == 0)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      obj = self->_identifiersToTaskInfo;
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v9)
              objc_enumerationMutation(obj);
            v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_identifiersToTaskInfo, "objectForKeyedSubscript:", v11));
            if (!objc_msgSend(v12, "taskKind"))
            {
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "downloadFileURL"));
              v14 = v13;
              if (v13)
              {
                v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "URLByAppendingPathComponent:", v15));

              }
              else
              {
                v16 = 0;
              }
              objc_msgSend(v12, "setDownloadFileURL:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "identifier")));
              -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v17, 3, 0);

              v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_identifiersToTasks, "objectForKeyedSubscript:", v11));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "path"));
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "downloadFile"));
              objc_msgSend(v20, "setPath:", v19);

            }
          }
          v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v8);
      }

      objc_storeStrong((id *)&self->_downloadDirectory, v24);
      v7 = v24;
    }
  }
  else
  {
    v21 = (id)qword_1000C7158;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v23 = self->_clientBundleID;
      *(_DWORD *)buf = 138543618;
      v32 = v22;
      v33 = 2112;
      v34 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Couldn't find out download directory for re-installed application %@. It must not have been re-installed properly. Obliterating session", buf, 0x16u);

    }
    v7 = 0;
    -[NDBackgroundSession obliterate](self, "obliterate");
  }

}

- (void)cleanupSessionWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSURLSession *userInitiatedSession;
  NSURLSession *discretionaryPrioritySession;
  NDTaskStorageDB *tasksDB;
  NDTaskStorageDB *v10;
  id WeakRetained;
  void *v12;
  int v13;
  void *v14;

  v4 = a3;
  if (!self->_cleanedUp)
  {
    self->_cleanedUp = 1;
    v5 = (id)qword_1000C7158;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v13 = 138543362;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Cleaning up", (uint8_t *)&v13, 0xCu);

    }
    -[NSURLSession finishTasksAndInvalidate](self->_userInitiatedSession, "finishTasksAndInvalidate");
    -[NSURLSession finishTasksAndInvalidate](self->_discretionaryPrioritySession, "finishTasksAndInvalidate");
    userInitiatedSession = self->_userInitiatedSession;
    self->_userInitiatedSession = 0;

    discretionaryPrioritySession = self->_discretionaryPrioritySession;
    self->_discretionaryPrioritySession = 0;

    +[NDFileUtilities removeItemAtURL:](NDFileUtilities, "removeItemAtURL:", self->_uploadsDirectory);
    tasksDB = self->tasksDB;
    if (tasksDB)
    {
      -[NDTaskStorageDB _deleteAllTaskEntriesForSession:sessionUUID:](tasksDB, "_deleteAllTaskEntriesForSession:sessionUUID:", self->_identifier, self->_uuid);
      v10 = self->tasksDB;
      self->tasksDB = 0;

    }
    +[NDFileUtilities removeItemAtURL:](NDFileUtilities, "removeItemAtURL:", self->_sessionDirectory);
    -[NDApplication removeObserver:](self->_monitoredApplication, "removeObserver:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sessionCompleted:withCompletionHandler:", self, v4);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
    objc_msgSend(v12, "releaseTransaction");

  }
}

- (void)obliterate
{
  NSObject *v3;
  void *v4;
  NSString *clientBundleID;
  NSString *identifier;
  NSXPCProxyCreating *clientProxy;
  NSMutableArray *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  NSString *v24;

  v3 = (id)qword_1000C7158;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    identifier = self->_identifier;
    clientBundleID = self->_clientBundleID;
    *(_DWORD *)buf = 138543874;
    v20 = v4;
    v21 = 2112;
    v22 = clientBundleID;
    v23 = 2112;
    v24 = identifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Obliterating session: <%@>.<%@>", buf, 0x20u);

  }
  self->_obliterated = 1;
  clientProxy = self->_clientProxy;
  self->_clientProxy = 0;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_outstandingTaskIDs;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_identifiersToTasks, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11), (_QWORD)v14));
        objc_msgSend(v12, "cancel");

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[NDBackgroundSession cleanupSessionWithCompletionHandler:](self, "cleanupSessionWithCompletionHandler:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NDUserEventAgentConnection sharedUserEventAgentConnection](NDUserEventAgentConnection, "sharedUserEventAgentConnection"));
  objc_msgSend(v13, "removePendingWakeForClient:sessionIdentifier:", self->_clientBundleID, self->_identifier);

}

- (id)tasksArchivePath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_sessionDirectory, "URLByAppendingPathComponent:", CFSTR("tasks.plist")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "path"));

  return v3;
}

- (id)descriptionForTCPConnectionWaitingReason:(int64_t)a3
{
  int64_t v3;
  void *v4;

  v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) < 0x13 && ((0x7F7FFu >> v3) & 1) != 0)
    v4 = *(&off_1000B1688 + v3);
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown (%llu)"), a3));
  return v4;
}

- (id)requestWithAdjustedWindowForTaskInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentRequest"));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originalRequest"));
  objc_msgSend(v7, "_timeWindowDuration");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originalRequest"));
  objc_msgSend(v10, "_timeWindowDelay");
  v12 = v11;

  v13 = objc_msgSend(v4, "isDiscretionary");
  if (v9 == 0.0)
    v14 = v13;
  else
    v14 = 0;
  if (v14 == 1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSession configuration](self->_discretionaryPrioritySession, "configuration"));
    objc_msgSend(v15, "timeoutIntervalForResource");
    -[NDBackgroundSession defaultWindowDurationForResourceTimeout:](self, "defaultWindowDurationForResourceTimeout:");
    v9 = v16;

  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v18 = v17;
  objc_msgSend(v4, "creationTime");
  v20 = v18 - v19;
  if (v18 - v19 < 0.0)
  {
    v20 = 0.0;
    objc_msgSend(v4, "setCreationTime:", v18);
  }
  v21 = v12 - v20;
  v22 = -0.0;
  if (v12 - v20 < 0.0)
    v22 = v12 - v20;
  v23 = v9 + v22;
  if (v9 + v22 <= 0.0)
  {
    if (objc_msgSend(v4, "isDiscretionary"))
      v23 = 60.0;
    else
      v23 = 0.0;
  }
  v24 = fmax(v21, 0.0);
  v25 = (id)qword_1000C7158;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_loggableDescription"));
    v29 = 138544386;
    v30 = v26;
    v31 = 2114;
    v32 = v27;
    v33 = 2048;
    v34 = v20;
    v35 = 2048;
    v36 = v24;
    v37 = 2048;
    v38 = v23;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ %f seconds past start time, new delay: %f, new window: %f", (uint8_t *)&v29, 0x34u);

  }
  objc_msgSend(v6, "_setTimeWindowDuration:", v23);
  objc_msgSend(v6, "_setTimeWindowDelay:", v24);

  return v6;
}

- (void)updateTaskInfoBasedOnCurrentDiscretionaryStatus:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  _BOOL4 v17;

  v4 = a3;
  if ((objc_msgSend(v4, "isDiscretionary") & 1) != 0
    || objc_msgSend(v4, "mayBeDemotedToDiscretionary"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentRequest"));
    v6 = -[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:](self, "currentDiscretionaryStatus:withOptionalTaskInfo:", v5, v4);

    v7 = (id)qword_1000C7158;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_loggableDescription"));
      v10 = 138544130;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      v14 = 1024;
      v15 = objc_msgSend(v4, "isDiscretionary");
      v16 = 1024;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ potentially discretionary, re-scheduling, was discretionary: %d, is now discretionary: %d", (uint8_t *)&v10, 0x22u);

    }
    objc_msgSend(v4, "setDiscretionary:", v6);
    if ((objc_msgSend(v4, "basePrioritySetExplicitly") & 1) == 0)
      objc_msgSend(v4, "setBasePriority:", -[NDBackgroundSession priorityForDiscretionaryStatus:](self, "priorityForDiscretionaryStatus:", v6));
  }

}

- (id)adjustDiscretionaryStatusForTaskInfo:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NDBackgroundSession updateTaskInfoBasedOnCurrentDiscretionaryStatus:](self, "updateTaskInfoBasedOnCurrentDiscretionaryStatus:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", objc_msgSend(v4, "isDiscretionary")));

  return v5;
}

- (void)configureTask:(id)a3 withTaskInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend(v14, "setTaskIdentifier:", objc_msgSend(v6, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "taskDescription"));
  objc_msgSend(v14, "setTaskDescription:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "earliestBeginDate"));
  objc_msgSend(v14, "setEarliestBeginDate:", v8);

  objc_msgSend(v14, "setCountOfBytesClientExpectsToSend:", objc_msgSend(v6, "countOfBytesClientExpectsToSend"));
  objc_msgSend(v14, "setCountOfBytesClientExpectsToReceive:", objc_msgSend(v6, "countOfBytesClientExpectsToReceive"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueIdentifier"));
  objc_msgSend(v14, "set_uniqueIdentifier:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storagePartitionIdentifier"));
  objc_msgSend(v14, "set_storagePartitionIdentifier:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathToDownloadTaskFile"));
  objc_msgSend(v14, "set_pathToDownloadTaskFile:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "taskMetrics"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "taskMetrics"));
    objc_msgSend(v14, "set_metrics:", v13);

    objc_msgSend(v6, "setTaskMetrics:", 0);
  }
  -[NDBackgroundSession configureAdditionalPropertiesOnTask:taskInfo:](self, "configureAdditionalPropertiesOnTask:taskInfo:", v14, v6);

}

- (id)createNewTaskFromInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  Class Class;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;

  v4 = a3;
  -[NDBackgroundSession removeDownloadFileForTaskInfo:](self, "removeDownloadFileForTaskInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession adjustDiscretionaryStatusForTaskInfo:](self, "adjustDiscretionaryStatusForTaskInfo:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession requestWithAdjustedWindowForTaskInfo:](self, "requestWithAdjustedWindowForTaskInfo:", v4));
  if (!v6)
  {
    v14 = (id)qword_1000C7158;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_loggableDescription"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentRequest"));
      v34 = 138543874;
      v35 = v15;
      v36 = 2114;
      v37 = v16;
      v38 = 2112;
      v39 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ couldn't create new task becuase adjusted request is nil, taskInfo.currentRequest = %@", (uint8_t *)&v34, 0x20u);

    }
    v8 = 0;
    goto LABEL_18;
  }
  if (objc_msgSend(v4, "taskKind"))
  {
    if (objc_msgSend(v4, "taskKind") == (id)1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileURL"));
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uploadTaskWithRequest:fromFile:", v6, v7));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resumableUploadData"));
      if (v9)
      {
        Class = objc_getClass("__NSCFResumableUploadState");
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resumableUploadData"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originalRequest"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class rusWithResumeData:originalRequest:](Class, "rusWithResumeData:originalRequest:", v11, v12));

        if (v13)
          objc_msgSend(v8, "setResumableUploadState:", v13);

      }
    }
    else
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataTaskWithRequest:", v6));
    }
    goto LABEL_18;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
  if (objc_msgSend(v18, "isPrivileged"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "downloadFileURL"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "path"));

  }
  else
  {
    v20 = 0;
  }

  -[NDBackgroundSession ensureSessionDownloadDirectoryExists](self, "ensureSessionDownloadDirectoryExists");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_downloadTaskWithRequest:downloadFilePath:", v6, v20));
  v8 = v21;
  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "downloadFile"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "path"));

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "downloadFile"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "path"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v25));
      objc_msgSend(v4, "setDownloadFileURL:", v26);

LABEL_18:
      objc_msgSend(v8, "set_suspensionThreshhold:", 0x80000);
      v8 = v8;
      v27 = v8;
      goto LABEL_19;
    }
  }
  v29 = (id)qword_1000C7158;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_loggableDescription"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "downloadFile"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "path"));
    v34 = 138544130;
    v35 = v30;
    v36 = 2114;
    v37 = v31;
    v38 = 2112;
    v39 = v8;
    v40 = 2112;
    v41 = v33;
    _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ couldn't create new task. task: %@, path: %@", (uint8_t *)&v34, 0x2Au);

  }
  v27 = 0;
LABEL_19:

  return v27;
}

- (id)restoreInProgressTask:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  id v8;
  const char *v9;
  void *v10;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession adjustDiscretionaryStatusForTaskInfo:](self, "adjustDiscretionaryStatusForTaskInfo:", v5));
  if (objc_msgSend(v5, "taskKind"))
    goto LABEL_29;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "response"));
  if (!v12)
    goto LABEL_29;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "downloadFileURL"));

  if (!v13)
    goto LABEL_29;
  -[NDBackgroundSession ensureSessionDownloadDirectoryExists](self, "ensureSessionDownloadDirectoryExists");
  v14 = objc_alloc(objc_getClass("__NSCFLocalDownloadTask"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "defaultTaskGroup"));
  v16 = objc_msgSend(v14, "initWithBackgroundTaskInfo:taskGroup:", v5, v15);

  -[NDBackgroundSession configureAdditionalPropertiesOnTask:taskInfo:](self, "configureAdditionalPropertiesOnTask:taskInfo:", v16, v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession requestWithAdjustedWindowForTaskInfo:](self, "requestWithAdjustedWindowForTaskInfo:", v5));
  objc_msgSend(v16, "updateCurrentRequest:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathToDownloadTaskFile"));
  if (v18
    || (v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "additionalProperties")),
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("pathToDownloadTaskFile"))),
        v19,
        v18))
  {
    v20 = 0;
    v21 = v18;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "downloadFileURL"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
    v18 = 0;
    v20 = 1;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "createResumeInformation:", v21));
  if (v20)
  {

  }
  if (v22)
  {
    v23 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
    -[NSObject encodeObject:forKey:](v23, "encodeObject:forKey:", v22, CFSTR("NSKeyedArchiveRootObjectKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject encodedData](v23, "encodedData"));
    v10 = v24 ? (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "downloadTaskWithResumeData:", v24)) : 0;

  }
  else
  {
    v23 = (id)qword_1000C7158;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_loggableDescription"));
      *(_DWORD *)buf = 138543618;
      v31 = v28;
      v32 = 2114;
      v33 = v29;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ could not create resume data. The server might not support resumable downloads. Will retry full download", buf, 0x16u);

    }
    v10 = 0;
  }

  if (v10)
  {
    v25 = (id)qword_1000C7158;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_loggableDescription"));
      *(_DWORD *)buf = 138543618;
      v31 = v26;
      v32 = 2114;
      v33 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ download created from resume data", buf, 0x16u);

    }
  }
  else
  {
LABEL_29:
    if (!objc_msgSend(v5, "taskKind"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "additionalProperties"));
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pathToDownloadTaskFile"))));
      v9 = (const char *)objc_msgSend(v8, "UTF8String");

      if (v9)
        unlink(v9);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession createNewTaskFromInfo:](self, "createNewTaskFromInfo:", v5));
  }

  return v10;
}

- (id)restoreCompletedTask:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  PendingCallback *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  PendingCallback *v20;
  id v21;
  void *v22;
  BOOL v23;
  void *v24;
  PendingCallback *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PendingCallback *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  _QWORD v41[3];
  _QWORD v42[2];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;

  v4 = a3;
  if (objc_msgSend(v4, "taskKind"))
  {
    if (objc_msgSend(v4, "taskKind") == (id)1)
      v5 = "__NSCFLocalUploadTask";
    else
      v5 = "__NSCFLocalDataTask";
  }
  else
  {
    v5 = "__NSCFLocalDownloadTask";
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", objc_msgSend(v4, "isDiscretionary")));
  v6 = objc_alloc(objc_getClass(v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "defaultTaskGroup"));
  v8 = objc_msgSend(v6, "initWithBackgroundTaskInfo:taskGroup:", v4, v7);

  v39 = v8;
  -[NDBackgroundSession configureAdditionalPropertiesOnTask:taskInfo:](self, "configureAdditionalPropertiesOnTask:taskInfo:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathToDownloadTaskFile"));
  if (v9
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "additionalProperties")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("pathToDownloadTaskFile"))),
        v10,
        v9))
  {
    v11 = v9;
    v37 = v11;
  }
  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "downloadFileURL"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "path"));

    v37 = 0;
    v38 = 0;
    if (!v11)
      goto LABEL_18;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v13 = objc_msgSend(v12, "fileExistsAtPath:", v11);

  if (v13)
  {
    v14 = (id)qword_1000C7158;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_loggableDescription"));
      *(_DWORD *)buf = 138543874;
      v44 = v35;
      v45 = 2114;
      v46 = v36;
      v47 = 2112;
      v48 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "NDSession <%{public}@> %{public}@ is being restored as completed with download file still at %@", buf, 0x20u);

    }
    v15 = [PendingCallback alloc];
    v16 = objc_msgSend(v4, "identifier");
    v42[0] = v4;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "response"));
    v18 = v17;
    if (!v17)
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v42[1] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 2));
    v20 = -[PendingCallback initWithCallbackType:taskIdentifier:args:](v15, "initWithCallbackType:taskIdentifier:args:", 1, v16, v19);

    if (!v17)
    -[NDCallbackQueue addPendingCallback:wakeRequirement:](self->_callbackQueue, "addPendingCallback:wakeRequirement:", v20, 0);

  }
  v38 = v11;
LABEL_18:
  v21 = objc_alloc_init((Class)NSMutableDictionary);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_backgroundTrailers"));
  v23 = v22 == 0;

  if (!v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_backgroundTrailers"));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("trailers"));

  }
  v25 = [PendingCallback alloc];
  v26 = objc_msgSend(v4, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));
  v28 = v27;
  if (!v27)
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v41[0] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "taskMetrics"));
  v30 = v29;
  if (!v29)
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v41[1] = v30;
  v41[2] = v21;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 3));
  v32 = -[PendingCallback initWithCallbackType:taskIdentifier:args:](v25, "initWithCallbackType:taskIdentifier:args:", 0, v26, v31);

  if (!v29)
  if (!v27)

  -[NDCallbackQueue addPendingCallback:wakeRequirement:](self->_callbackQueue, "addPendingCallback:wakeRequirement:", v32, 0);
  return v39;
}

- (id)restoreTask:(id)a3 isOutstanding:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  NSObject *workQueue;
  id v18;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;

  v6 = a3;
  *a4 = 1;
  if (objc_msgSend(v6, "state") == (id)2)
  {
    objc_msgSend(v6, "setState:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentRequest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLError _web_errorWithDomain:code:URL:](NSURLError, "_web_errorWithDomain:code:URL:", NSURLErrorDomain, -999, v8));
    objc_msgSend(v6, "setError:", v9);

  }
  if (objc_msgSend(v6, "state") == (id)3)
  {
    *a4 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession restoreCompletedTask:](self, "restoreCompletedTask:", v6));
  }
  else
  {
    if (!objc_msgSend(v6, "hasStarted"))
    {
      v13 = (id)qword_1000C7158;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_loggableDescription"));
        *(_DWORD *)buf = 138543618;
        v27 = v20;
        v28 = 2114;
        v29 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ not restoring, which had never been started", buf, 0x16u);

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleID"));
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.mobileassetd"));

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "resourceTimeoutError"));
        workQueue = self->_workQueue;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100040C98;
        v22[3] = &unk_1000B13E8;
        v22[4] = self;
        v23 = v6;
        v24 = 0;
        v25 = v16;
        v18 = v16;
        dispatch_async(workQueue, v22);

      }
      goto LABEL_13;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession restoreInProgressTask:](self, "restoreInProgressTask:", v6));
  }
  v11 = v10;
  if (!v10)
  {
LABEL_13:
    v11 = 0;
    *a4 = 0;
    goto LABEL_14;
  }
  sub_100014C18(v10, objc_msgSend(v6, "basePriority"), self->_monitoredApplication);
  -[NDBackgroundSession configureTask:withTaskInfo:](self, "configureTask:withTaskInfo:", v11, v6);
  objc_msgSend(v6, "loadingPriority");
  objc_msgSend(v11, "set_loadingPriority:");
  objc_msgSend(v11, "set_bytesPerSecondLimit:", objc_msgSend(v6, "bytesPerSecondLimit"));
  objc_msgSend(v11, "set_expectedProgressTarget:", objc_msgSend(v6, "expectedProgressTarget"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "originalRequest"));
  objc_msgSend(v11, "setOriginalRequest:", v12);

  objc_msgSend(v6, "creationTime");
  objc_msgSend(v11, "setStartTime:");
  objc_msgSend(v11, "set_TLSMinimumSupportedProtocolVersion:", objc_msgSend(v6, "_TLSMinimumSupportedProtocolVersion"));
  objc_msgSend(v11, "set_TLSMaximumSupportedProtocolVersion:", objc_msgSend(v6, "_TLSMaximumSupportedProtocolVersion"));
LABEL_14:

  return v11;
}

- (id)restoreTasksFromSqliteDB:(id)a3
{
  NSObject *v4;
  void *v5;
  NDTaskStorageDB *tasksDB;
  void *v7;
  id v8;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSString *clientBundleID;
  NSString *v31;
  NSString *v32;
  NSURL *downloadDirectory;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSString *v38;
  void *v39;
  NSString *v40;
  NSString *identifier;
  void *v42;
  NSString *v43;
  NSString *v44;
  void *v45;
  NSString *v46;
  id v47;
  __int128 v49;
  uint64_t v50;
  id v51;
  id v52;
  id obj;
  uint64_t v54;
  uint64_t v55;
  char v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  NSString *v64;
  __int16 v65;
  NSString *v66;
  __int16 v67;
  NSString *v68;
  _BYTE v69[128];

  v51 = a3;
  v4 = (id)qword_1000C7158;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    *(_DWORD *)buf = 138543362;
    v62 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> restoreTasksFromSqliteDB", buf, 0xCu);

  }
  tasksDB = self->tasksDB;
  if (tasksDB)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _getAllTasksFromDBForSession:sessionUUID:](tasksDB, "_getAllTasksFromDBForSession:sessionUUID:", self->_identifier, self->_uuid));
  else
    v7 = 0;
  v52 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
  if (v8)
  {
    v50 = 0;
    v54 = *(_QWORD *)v58;
    *(_QWORD *)&v9 = 138543618;
    v49 = v9;
    do
    {
      v10 = 0;
      v55 = v50 + 1;
      v50 += (uint64_t)v8;
      do
      {
        if (*(_QWORD *)v58 != v54)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)v10);
        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)v10), "downloadFileURL"));
          v13 = v12 == 0;

          if (!v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "downloadFileURL"));
            v15 = objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
            if ((-[NSObject isPrivileged](v15, "isPrivileged") & 1) != 0)
              goto LABEL_14;
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_downloadDirectory, "path"));
            v18 = objc_msgSend(v16, "hasPrefix:", v17);

            if ((v18 & 1) == 0)
            {
              v28 = (id)qword_1000C7158;
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v29 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
                clientBundleID = self->_clientBundleID;
                v31 = (NSString *)(id)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_downloadDirectory, "path"));
                v32 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path"));
                *(_DWORD *)buf = 138544130;
                v62 = v29;
                v63 = 2112;
                v64 = clientBundleID;
                v65 = 2112;
                v66 = v31;
                v67 = 2112;
                v68 = v32;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Download directory for bundle %@ has moved to %@, but saved download file path is %@. Need to fix download path", buf, 0x2Au);

              }
              downloadDirectory = self->_downloadDirectory;
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent"));
              v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](downloadDirectory, "URLByAppendingPathComponent:", v34));
              objc_msgSend(v11, "setDownloadFileURL:", v35);

              v15 = (id)qword_1000C7158;
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                v36 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "downloadFileURL"));
                v38 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "path"));
                *(_DWORD *)buf = v49;
                v62 = v36;
                v63 = 2112;
                v64 = v38;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> New download path: %@", buf, 0x16u);

              }
LABEL_14:

            }
          }
          v19 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "identifier", v49)));
          v56 = 0;
          if (objc_msgSend(v11, "shouldCancelOnDisconnect") && (uint64_t)objc_msgSend(v11, "state") <= 2)
          {
            objc_msgSend(v11, "setState:", 3);
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentRequest"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URL"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLError _web_errorWithDomain:code:URL:](NSURLError, "_web_errorWithDomain:code:URL:", NSURLErrorDomain, -997, v21));
            objc_msgSend(v11, "setError:", v22);

            v23 = (id)qword_1000C7158;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              v42 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
              v43 = (NSString *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_loggableDescription"));
              v44 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "error"));
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "error"));
              v46 = (NSString *)objc_msgSend(v45, "code");
              *(_DWORD *)buf = 138544130;
              v62 = v42;
              v63 = 2114;
              v64 = v43;
              v65 = 2112;
              v66 = v44;
              v67 = 2048;
              v68 = v46;
              _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ completed with error %@ [%ld] (was active before nsurlsessiond exit)", buf, 0x2Au);

            }
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession restoreTask:isOutstanding:](self, "restoreTask:isOutstanding:", v11, &v56));
          if (v24)
          {
            if (v56)
            {
              v25 = (id)qword_1000C7158;
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_loggableDescription"));
                *(_DWORD *)buf = 138543362;
                v62 = v26;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Adding %{public}@ to outstanding tasks", buf, 0xCu);

              }
              -[NDBackgroundSession addOutstandingTaskWithIdentifier:](self, "addOutstandingTaskWithIdentifier:", objc_msgSend(v11, "identifier"));
              objc_msgSend(v52, "addObject:", v11);
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_identifiersToTaskInfo, "setObject:forKeyedSubscript:", v11, v19);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_identifiersToTasks, "setObject:forKeyedSubscript:", v24, v19);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tasksToIdentifiers, "setObject:forKeyedSubscript:", v19, v24);
          }
          else
          {
            objc_msgSend(v51, "addObject:", v19);
            v27 = (id)qword_1000C7158;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v39 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
              identifier = self->_identifier;
              v40 = self->_clientBundleID;
              *(_DWORD *)buf = 138544130;
              v62 = v39;
              v63 = 2112;
              v64 = v19;
              v65 = 2112;
              v66 = v40;
              v67 = 2112;
              v68 = identifier;
              _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Couldn't recreate existing task with identifier: %@ in session: <%@>.<%@>", buf, 0x2Au);

            }
          }

        }
        if ((unint64_t)v10 + v55 > 0x200)
          goto LABEL_40;
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
      v8 = v47;
    }
    while (v47);
  }
LABEL_40:

  return v52;
}

- (id)restoreTasksFromArchivedInfo:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[4];

  v4 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000404D4;
  v10[3] = &unk_1000B1410;
  v10[4] = self;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = v5;
  v13 = v14;
  v6 = v4;
  v12 = v6;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);
  v7 = v12;
  v8 = v5;

  _Block_object_dispose(v14, 8);
  return v8;
}

- (id)restoreTasks:(BOOL *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSMutableDictionary *v11;
  id v12;
  uint64_t v13;
  void *i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (self->_hasSqliteSupport)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession restoreTasksFromSqliteDB:](self, "restoreTasksFromSqliteDB:", v5));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession tasksArchivePath](self, "tasksArchivePath"));
    v8 = sub_10001F820((uint64_t)NSKeyedUnarchiver, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession restoreTasksFromArchivedInfo:](self, "restoreTasksFromArchivedInfo:", v9));

  }
  v10 = -[NSMutableDictionary count](self->_identifiersToTaskInfo, "count");
  if (!v10)
    -[NDBackgroundSession cleanupSessionWithCompletionHandler:](self, "cleanupSessionWithCompletionHandler:", 0);
  if (a3)
    *a3 = v10 == 0;
  if (v10)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = self->_identifiersToTaskInfo;
    v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v11);
          -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), 14, 1, (_QWORD)v16);
        }
        v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

    if (objc_msgSend(v5, "count"))
      -[NDTaskStorageDB _deleteTaskEntriesWithIdentifiers:forSession:sessionUUID:](self->tasksDB, "_deleteTaskEntriesWithIdentifiers:forSession:sessionUUID:", v5, self->_identifier, self->_uuid);
  }
  if (-[NSMutableDictionary count](self->_identifiersToTaskInfo, "count", (_QWORD)v16)
    && !-[NDBackgroundSession sessionHasOutstandingTasks](self, "sessionHasOutstandingTasks")
    && self->_sendsLaunchEvents
    && !-[NDApplication canBeSuspended](self->_clientApplication, "canBeSuspended"))
  {
    -[NDBackgroundSession wakeUpClient:](self, "wakeUpClient:", 2);
  }

  return v6;
}

- (void)statusMonitor:(id)a3 callbackForIdentifier:(unint64_t)a4 networkChanged:(BOOL)a5
{
  NSObject *workQueue;
  _QWORD block[6];
  BOOL v7;

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004040C;
  block[3] = &unk_1000B1398;
  block[4] = self;
  block[5] = a4;
  v7 = a5;
  dispatch_async(workQueue, block);
}

- (BOOL)retryTask:(id)a3 originalError:(id)a4 transactionMetrics:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *identifiersToTasks;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  double v32;
  char *v33;
  double v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  int v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  uint64_t v45;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession restoreInProgressTask:](self, "restoreInProgressTask:", v8));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "taskDescription"));
    objc_msgSend(v11, "setTaskDescription:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "earliestBeginDate"));
    objc_msgSend(v11, "setEarliestBeginDate:", v13);

    objc_msgSend(v11, "setCountOfBytesClientExpectsToSend:", objc_msgSend(v8, "countOfBytesClientExpectsToSend"));
    objc_msgSend(v11, "setCountOfBytesClientExpectsToReceive:", objc_msgSend(v8, "countOfBytesClientExpectsToReceive"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "originalRequest"));
    objc_msgSend(v11, "setOriginalRequest:", v14);

    objc_msgSend(v11, "setTaskIdentifier:", objc_msgSend(v8, "identifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueIdentifier"));
    objc_msgSend(v11, "set_uniqueIdentifier:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "storagePartitionIdentifier"));
    objc_msgSend(v11, "set_storagePartitionIdentifier:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathToDownloadTaskFile"));
    objc_msgSend(v11, "set_pathToDownloadTaskFile:", v17);

    objc_msgSend(v11, "setState:", 1);
    objc_msgSend(v8, "creationTime");
    objc_msgSend(v11, "setStartTime:");
    sub_100014C18(v11, objc_msgSend(v8, "basePriority"), self->_monitoredApplication);
    objc_msgSend(v8, "loadingPriority");
    objc_msgSend(v11, "set_loadingPriority:");
    objc_msgSend(v11, "set_bytesPerSecondLimit:", objc_msgSend(v8, "bytesPerSecondLimit"));
    objc_msgSend(v11, "set_expectedProgressTarget:", objc_msgSend(v8, "expectedProgressTarget"));
    objc_msgSend(v11, "set_TLSMinimumSupportedProtocolVersion:", objc_msgSend(v8, "_TLSMinimumSupportedProtocolVersion"));
    objc_msgSend(v11, "set_TLSMaximumSupportedProtocolVersion:", objc_msgSend(v8, "_TLSMaximumSupportedProtocolVersion"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_extractor"));

    if (!v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_extractor"));
      objc_msgSend(v11, "set_extractor:", v19);

    }
    objc_msgSend(v11, "set_hasSZExtractor:", objc_msgSend(v8, "_hasSZExtractor"));
    objc_msgSend(v11, "set_doesSZExtractorConsumeExtractedData:", objc_msgSend(v8, "_doesSZExtractorConsumeExtractedData"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "taskMetrics"));
    objc_msgSend(v11, "set_metrics:", v20);

    objc_msgSend(v8, "setTaskMetrics:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "additionalProperties"));

    if (v21)
      -[NDBackgroundSession configureAdditionalPropertiesOnTask:taskInfo:](self, "configureAdditionalPropertiesOnTask:taskInfo:", v11, v8);
    -[NDBackgroundSession setupDASPropertiesOnTask:taskInfo:discretionaryStatus:](self, "setupDASPropertiesOnTask:taskInfo:discretionaryStatus:", v11, v8, objc_msgSend(v8, "isDiscretionary"));
    identifiersToTasks = self->_identifiersToTasks;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "identifier")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](identifiersToTasks, "setObject:forKeyedSubscript:", v11, v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "identifier")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tasksToIdentifiers, "setObject:forKeyedSubscript:", v24, v11);

    objc_msgSend(v11, "startResourceTimer");
    if (objc_msgSend(v8, "taskKind") == (id)2
      || objc_msgSend(v8, "taskKind") == (id)1
      && (v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fileURL")), v26, !v26))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientErrorForError:](self, "clientErrorForError:", v9));
      -[NSXPCProxyCreating willRetryBackgroundDataTask:withError:transactionMetrics:](self->_clientProxy, "willRetryBackgroundDataTask:withError:transactionMetrics:", objc_msgSend(v8, "identifier"), v25, v10);

    }
    -[NDBackgroundSession requeueTask:skipResume:](self, "requeueTask:skipResume:", objc_msgSend(v8, "identifier"), 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
    if (objc_msgSend(v27, "isEqualToString:", CFSTR("_nsurlsessiondErrorDomain")))
    {
      v28 = objc_msgSend(v9, "code");

      if (v28 == (id)3)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NDStatusMonitor sharedMonitor](NDStatusMonitor, "sharedMonitor"));
        objc_msgSend(v29, "performCallbackAfterNetworkChangedEvent:identifier:numberOfPreviousRetries:", self, objc_msgSend(v8, "identifier"), objc_msgSend(v8, "lowThroughputTimerRetryCount"));

        objc_msgSend(v8, "setLowThroughputTimerRetryCount:", (char *)objc_msgSend(v8, "lowThroughputTimerRetryCount") + 1);
        goto LABEL_19;
      }
    }
    else
    {

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
    v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("_nsurlsessiondErrorDomain"));

    v32 = 1.0;
    if ((v31 & 1) == 0)
    {
      v33 = (char *)objc_msgSend(v8, "retryCount", 1.0);
      objc_msgSend(v8, "setRetryCount:", v33 + 1);
      v32 = exp2((double)(unint64_t)v33);
    }
    v34 = fmin(v32, 1800.0);
    v35 = (id)qword_1000C7158;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_loggableDescription"));
      v40 = 138543874;
      v41 = v36;
      v42 = 2114;
      v43 = v37;
      v44 = 2048;
      v45 = (uint64_t)v34;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ will retry after %lld seconds", (uint8_t *)&v40, 0x20u);

    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NDStatusMonitor sharedMonitor](NDStatusMonitor, "sharedMonitor"));
    objc_msgSend(v38, "performCallbackAfterNetworkChangedEvent:identifier:delay:", self, objc_msgSend(v8, "identifier"), (uint64_t)v34);

  }
LABEL_19:

  return v11 != 0;
}

- (BOOL)clientIsActive
{
  NSXPCProxyCreating *clientProxy;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  NSString *clientBundleID;
  NSString *identifier;
  int v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  NSString *v24;

  clientProxy = self->_clientProxy;
  v4 = (id)qword_1000C7158;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v6 = (void *)v5;
    if (clientProxy)
      v7 = 89;
    else
      v7 = 78;
    if (self->_xpcConn)
      v8 = 89;
    else
      v8 = 78;
    identifier = self->_identifier;
    clientBundleID = self->_clientBundleID;
    if (self->_clientProxy)
      v11 = 89;
    else
      v11 = 78;
    v13 = 138544642;
    v14 = v5;
    v15 = 2112;
    v16 = clientBundleID;
    v17 = 1024;
    v18 = v7;
    v19 = 1024;
    v20 = v8;
    v21 = 1024;
    v22 = v11;
    v23 = 2112;
    v24 = identifier;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> client %@ is active result (%c), XPC(%c) proxy(%c) for %@", (uint8_t *)&v13, 0x32u);

  }
  return clientProxy != 0;
}

- (void)cancelTasksRequiringClientConnectionAndResumeUnstartedTasks
{
  NSMutableArray *v3;
  id v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = self->_outstandingTaskIDs;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v22;
    *(_QWORD *)&v5 = 138543618;
    v19 = v5;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_identifiersToTaskInfo, "objectForKeyedSubscript:", v8, v19));
        if (objc_msgSend(v9, "shouldCancelOnDisconnect"))
        {
          objc_msgSend(v9, "setResumedAndWaitingForEarliestBeginDate:", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_identifiersToTasks, "objectForKeyedSubscript:", v8));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error:code:", NSURLErrorDomain, -997));
          objc_msgSend(v10, "cancel_with_error:", v11);
          goto LABEL_8;
        }
        if ((objc_msgSend(v9, "hasStarted") & 1) == 0)
        {
          if (-[NSString isEqualToString:](self->_clientBundleID, "isEqualToString:", CFSTR("com.apple.mobileassetd")))
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_identifiersToTasks, "objectForKeyedSubscript:", v8));
            v12 = (id)qword_1000C7158;
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
              *(_DWORD *)buf = v19;
              v26 = v20;
              v27 = 2114;
              v28 = v17;
              _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ not resumed but client disconnected, terminating it with timeout", buf, 0x16u);

            }
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resourceTimeoutError"));
            objc_msgSend(v10, "cancel_with_error:", v11);
LABEL_8:

          }
          else
          {
            v13 = (id)qword_1000C7158;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
              *(_DWORD *)buf = v19;
              v26 = v15;
              v27 = 2114;
              v28 = v16;
              _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ not resumed but client disconnected, resuming it implicitly", buf, 0x16u);

            }
            v14 = objc_msgSend(v9, "identifier");
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "additionalProperties"));
            -[NDBackgroundSession resumeTaskWithIdentifier:withProperties:](self, "resumeTaskWithIdentifier:withProperties:", v14, v10);
          }

        }
        v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      v4 = v18;
    }
    while (v18);
  }

}

- (void)clientDidDisconnect
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  NSString *clientBundleID;
  NSString *identifier;
  NSXPCProxyCreating *clientProxy;
  NSXPCConnection *xpcConn;
  NDApplication *connectedExtension;
  NDApplication *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  NSString *v29;

  v3 = (id)qword_1000C7158;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v5 = (void *)v4;
    if (self->_xpcConn)
      v6 = 89;
    else
      v6 = 78;
    if (self->_clientProxy)
      v7 = 89;
    else
      v7 = 78;
    identifier = self->_identifier;
    clientBundleID = self->_clientBundleID;
    v20 = 138544386;
    v21 = v4;
    v22 = 2112;
    v23 = clientBundleID;
    v24 = 1024;
    v25 = v6;
    v26 = 1024;
    v27 = v7;
    v28 = 2112;
    v29 = identifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> client %@ disconnected, XPC(%c) proxy(%c) for %@", (uint8_t *)&v20, 0x2Cu);

  }
  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    self->_clientProxy = 0;

    self->_clientPID = -1;
    -[NDBackgroundSession cancelTasksRequiringClientConnectionAndResumeUnstartedTasks](self, "cancelTasksRequiringClientConnectionAndResumeUnstartedTasks");
    if (!-[NDBackgroundSession sessionHasOutstandingTasks](self, "sessionHasOutstandingTasks")
      && !-[NDCallbackQueue count](self->_callbackQueue, "count"))
    {
      -[NDBackgroundSession cleanupSessionWithCompletionHandler:](self, "cleanupSessionWithCompletionHandler:", 0);
    }
  }
  xpcConn = self->_xpcConn;
  self->_xpcConn = 0;

  connectedExtension = self->_connectedExtension;
  if (connectedExtension)
  {
    -[NDApplication removeObserver:](connectedExtension, "removeObserver:", self);
    v13 = self->_connectedExtension;
    self->_connectedExtension = 0;

  }
  -[NDBackgroundSession setInvalidateReply:](self, "setInvalidateReply:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_sessionDirectory, "URLByAppendingPathComponent:", CFSTR("options.plist")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NDSessionManager restoreOptionsFromArchivePath:](NDSessionManager, "restoreOptionsFromArchivePath:", v15));
  v17 = objc_msgSend(v16, "mutableCopy");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("NSURLSessionLastDisconnectDateKey"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, 0));
  objc_msgSend(v19, "writeToFile:atomically:", v15, 1);

}

- (void)allowReconnect
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040164;
  block[3] = &unk_1000B23A0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)triggerPowerlogPeriodicUpdate
{
  NSMutableArray *v3;
  id v4;
  uint64_t v5;
  void *i;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_outstandingTaskIDs;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_identifiersToTaskInfo, "objectForKeyedSubscript:", v7, (_QWORD)v10));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_identifiersToTasks, "objectForKeyedSubscript:", v7));
        sub_10000B8B4(6, self->_clientBundleID, self->_identifier, self->_monitoredAppBundleID, self->_secondaryID, v9, v8, 0);

      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)taskShouldSuspend:(unint64_t)a3
{
  NSMutableDictionary *identifiersToTasks;
  void *v6;
  void *v7;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *identifiersToMonitors;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;

  identifiersToTasks = self->_identifiersToTasks;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v6));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v9));

  v11 = (id)qword_1000C7158;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_loggableDescription"));
    v17 = 138543618;
    v18 = v12;
    v19 = 2114;
    v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ suspending", (uint8_t *)&v17, 0x16u);

  }
  objc_msgSend(v7, "suspend");
  identifiersToMonitors = self->_identifiersToMonitors;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToMonitors, "objectForKeyedSubscript:", v15));

  objc_msgSend(v16, "taskWillSuspend");
  if ((objc_msgSend(v10, "resumedAndWaitingForEarliestBeginDate") & 1) == 0)
    sub_10000B8B4(2, self->_clientBundleID, self->_identifier, self->_monitoredAppBundleID, self->_secondaryID, v7, v10, 0);
  objc_msgSend(v10, "setResumedAndWaitingForEarliestBeginDate:", 0);

}

- (void)requeueTask:(unint64_t)a3 skipResume:(BOOL)a4
{
  NSObject *workQueue;
  _QWORD block[6];
  BOOL v6;

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F8B8;
  block[3] = &unk_1000B1398;
  block[4] = self;
  block[5] = a3;
  v6 = a4;
  dispatch_async(workQueue, block);
}

- (void)requeueTask:(unint64_t)a3
{
  -[NDBackgroundSession requeueTask:skipResume:](self, "requeueTask:skipResume:", a3, 0);
}

- (id)inputStreamWithFileHandle:(id)a3 taskIdentifier:(unint64_t)a4
{
  id v6;
  CFSocketNativeHandle v7;
  NSObject *v8;
  void *v9;
  CFReadStreamRef v10;
  NSMutableDictionary *identifiersToStreams;
  void *v12;
  CFReadStreamRef v13;
  CFReadStreamRef readStream;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  CFSocketNativeHandle v19;

  v6 = a3;
  readStream = 0;
  v7 = dup((int)objc_msgSend(v6, "fileDescriptor"));
  CFStreamCreatePairWithSocket(0, v7, &readStream, 0);
  CFReadStreamSetProperty(readStream, kCFStreamPropertyShouldCloseNativeSocket, kCFBooleanTrue);
  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    *(_DWORD *)buf = 138543618;
    v17 = v9;
    v18 = 1024;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Created stream with file descriptor: %d", buf, 0x12u);

  }
  objc_msgSend(v6, "closeFile");
  v10 = readStream;
  identifiersToStreams = self->_identifiersToStreams;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](identifiersToStreams, "setObject:forKeyedSubscript:", v10, v12);

  v13 = readStream;
  return v13;
}

- (void)errorOccurredDuringFinishedCallbackDelivery:(id)a3
{
  id v4;
  NSObject *v5;
  NSXPCProxyCreating *clientProxy;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = (id)qword_1000C7158;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Encountered error %@ during task completion callback delivery", (uint8_t *)&v8, 0x16u);

  }
  clientProxy = self->_clientProxy;
  self->_clientProxy = 0;

  if (!-[NDBackgroundSession sessionHasOutstandingTasks](self, "sessionHasOutstandingTasks"))
    -[NDBackgroundSession wakeUpClient:](self, "wakeUpClient:", 1);

}

- (void)errorOccurredDuringAuthCallbackDelivery:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  NSXPCProxyCreating *clientProxy;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v11 = 138543618;
    v12 = v10;
    v13 = 2112;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Encountered error %@ error delivering auth challenge to client, performing default handling", (uint8_t *)&v11, 0x16u);

  }
  clientProxy = self->_clientProxy;
  self->_clientProxy = 0;

  v7[2](v7, 1, 0);
}

- (void)wakeUpClient:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  NSString *clientBundleID;
  void *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  NSString *v16;
  void *v17;
  PendingCallback *v18;
  void *v19;
  PendingCallback *v20;
  PendingCallback *v21;
  void *v22;
  PendingCallback *v23;
  NSString *v24;
  NSObject *v25;
  void *v26;
  NDApplication *clientApplication;
  NSString *identifier;
  void *v29;
  unsigned __int8 v30;
  NSObject *v31;
  void *v32;
  NSString *v33;
  void *v34;
  _QWORD v35[6];
  NSObject *v36;
  NSObject *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  NSString *v41;

  if (a3)
  {
    if (self->_sendsLaunchEvents)
    {
      if (-[NDApplication supportsWakes](self->_clientApplication, "supportsWakes"))
      {
        if (self->_obliterated)
        {
          v5 = (id)qword_1000C7158;
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            v6 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
            clientBundleID = self->_clientBundleID;
            *(_DWORD *)buf = 138543618;
            v39 = v6;
            v40 = 2112;
            v41 = clientBundleID;
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Not waking up client %@ since session is obliterated", buf, 0x16u);

          }
        }
        else if (-[NDBackgroundSession clientIsActive](self, "clientIsActive"))
        {
          v5 = (id)qword_1000C7158;
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
            v16 = self->_clientBundleID;
            *(_DWORD *)buf = 138543618;
            v39 = v15;
            v40 = 2112;
            v41 = v16;
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Not waking up client %@ since it's already connected", buf, 0x16u);

          }
        }
        else if (-[NDApplication backgroundUpdatesEnabled](self->_clientApplication, "backgroundUpdatesEnabled"))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
          v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));

          v18 = [PendingCallback alloc];
          v37 = v5;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
          v20 = -[PendingCallback initWithCallbackType:taskIdentifier:args:](v18, "initWithCallbackType:taskIdentifier:args:", 3, 0, v19);

          v21 = [PendingCallback alloc];
          v36 = v5;
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
          v23 = -[PendingCallback initWithCallbackType:taskIdentifier:args:](v21, "initWithCallbackType:taskIdentifier:args:", 4, 0, v22);

          -[NDCallbackQueue addPendingCallbackToFront:](self->_callbackQueue, "addPendingCallbackToFront:", v20);
          -[NDCallbackQueue addPendingCallback:wakeRequirement:](self->_callbackQueue, "addPendingCallback:wakeRequirement:", v23, 0);
          v24 = self->_clientBundleID;
          v25 = (id)qword_1000C7158;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
            *(_DWORD *)buf = 138543618;
            v39 = v26;
            v40 = 2112;
            v41 = v24;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Waking up the client app: %@", buf, 0x16u);

          }
          clientApplication = self->_clientApplication;
          identifier = self->_identifier;
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          v30 = -[NDApplication wakeForSessionIdentifier:withSessionUUID:wakeRequirement:](clientApplication, "wakeForSessionIdentifier:withSessionUUID:wakeRequirement:", identifier, v29, a3);

          if ((v30 & 1) == 0)
          {
            v31 = (id)qword_1000C7158;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              v34 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
              *(_DWORD *)buf = 138543618;
              v39 = v34;
              v40 = 2112;
              v41 = v24;
              _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Failed to wake app: %@", buf, 0x16u);

            }
          }

        }
        else
        {
          v5 = (id)qword_1000C7158;
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
            v33 = self->_clientBundleID;
            *(_DWORD *)buf = 138543618;
            v39 = v32;
            v40 = 2112;
            v41 = v33;
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Not waking up client %@ since background updates are not enabled", buf, 0x16u);

          }
        }
      }
      else
      {
        if (-[NDApplication maySupportWakesLater](self->_clientApplication, "maySupportWakesLater"))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NDUserEventAgentConnection sharedUserEventAgentConnection](NDUserEventAgentConnection, "sharedUserEventAgentConnection"));
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_10003F8AC;
          v35[3] = &unk_1000B2440;
          v35[4] = self;
          v35[5] = a3;
          objc_msgSend(v12, "performWake:uponNotification:sessionIdentifier:", v35, self->_clientBundleID, self->_identifier);

        }
        v5 = (id)qword_1000C7158;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          v14 = self->_clientBundleID;
          *(_DWORD *)buf = 138543618;
          v39 = v13;
          v40 = 2112;
          v41 = v14;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Not waking up client %@ since it doesn't support app wakes", buf, 0x16u);

        }
      }
    }
    else
    {
      v5 = (id)qword_1000C7158;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        v11 = self->_clientBundleID;
        *(_DWORD *)buf = 138543618;
        v39 = v10;
        v40 = 2112;
        v41 = v11;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Not waking up client %@ since sessionSendsLaunchEvents is NO", buf, 0x16u);

      }
    }
  }
  else
  {
    v5 = (id)qword_1000C7158;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v9 = self->_clientBundleID;
      *(_DWORD *)buf = 138543618;
      v39 = v8;
      v40 = 2112;
      v41 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Not waking up client %@ since wake request is unnecessary", buf, 0x16u);

    }
  }

}

- (void)downloadTaskWithResumeData:(id)a3 identifier:(unint64_t)a4 uniqueIdentifier:(id)a5 reply:(id)a6
{
  id v10;
  void (**v11)(id, uint64_t);
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSString *clientBundleID;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  NSString *v31;
  __int16 v32;
  void *v33;

  v10 = a3;
  v27 = a5;
  v11 = (void (**)(id, uint64_t))a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_requestFromResumeData"));
  v13 = v12;
  if (v12 && (objc_msgSend(v12, "_isSafeRequestForBackgroundDownload") & 1) != 0)
  {
    v14 = -[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:](self, "currentDiscretionaryStatus:withOptionalTaskInfo:", v13, 0);
    -[NDBackgroundSession ensureSessionDownloadDirectoryExists](self, "ensureSessionDownloadDirectoryExists");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "downloadTaskWithResumeData:", v10));

    v17 = objc_msgSend(objc_alloc((Class)__NSCFURLSessionTaskInfo), "initWithDownloadTask:uniqueIdentifier:bundleID:sessionID:", v16, v27, self->_clientBundleID, self->_identifier);
    v18 = v17;
    if (v16 && v17)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "downloadFile"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "path"));

      if (v20)
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v20));
      else
        v21 = 0;
      objc_msgSend(v18, "setDownloadFileURL:", v21);
      if (v20)

      objc_msgSend(v18, "setExpectingResumeCallback:", 1);
      -[NDBackgroundSession performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:](self, "performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:", v16, v18, a4, v14);
      v11[2](v11, 1);

    }
    else
    {
      v23 = (id)qword_1000C7158;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        *(_DWORD *)buf = 138543874;
        v29 = v26;
        v30 = 2112;
        v31 = (NSString *)v16;
        v32 = 2112;
        v33 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Couldn't create task or taskInfo: task = %@, taskInfo = %@", buf, 0x20u);

      }
      v11[2](v11, 0);
    }

  }
  else
  {
    v22 = (id)qword_1000C7158;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      clientBundleID = self->_clientBundleID;
      *(_DWORD *)buf = 138543618;
      v29 = v24;
      v30 = 2112;
      v31 = clientBundleID;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Received a background download request from unsafe resume data from %@", buf, 0x16u);

    }
    v11[2](v11, 0);
  }

}

- (void)uploadTaskWithResumableUploadState:(id)a3 request:(id)a4 originalRequest:(id)a5 fromFile:(id)a6 sandboxExtensionData:(id)a7 identifier:(unint64_t)a8 uniqueIdentifier:(id)a9 potentialCredentials:(id)a10 reply:(id)a11
{
  id v16;
  void (**v17)(id, _QWORD);
  NSObject *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  unsigned __int8 v30;
  NSObject *v31;
  void *v32;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[5];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  unint64_t v47;

  v38 = a3;
  v40 = a4;
  v35 = a5;
  v16 = a6;
  v37 = a7;
  v39 = a9;
  v36 = a10;
  v17 = (void (**)(id, _QWORD))a11;
  v18 = (id)qword_1000C7158;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    *(_DWORD *)buf = 138543874;
    v43 = v19;
    v44 = 2114;
    v45 = v39;
    v46 = 2048;
    v47 = a8;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Task <%{public}@>.<%lu> uploadTaskWithResumableUploadState", buf, 0x20u);

  }
  v20 = -[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:](self, "currentDiscretionaryStatus:withOptionalTaskInfo:", v40, 0);
  if (v16)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession makeTempUploadFile:withExtensionData:](self, "makeTempUploadFile:withExtensionData:", v16, v37));
    if (!v21)
    {
      v17[2](v17, 0);
      goto LABEL_26;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", v20));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uploadTaskWithRequest:fromFile:", v40, v21));
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", v20));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uploadTaskWithStreamedRequest:", v40));
    v21 = 0;
  }

  if (v38)
    objc_msgSend(v23, "setResumableUploadState:", v38);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "resumableUploadState", a8));
  objc_msgSend(v24, "setUploadFile:", v21);

  v25 = objc_msgSend(objc_alloc((Class)__NSCFURLSessionTaskInfo), "initWithUploadTask:uniqueIdentifier:bundleID:sessionID:", v23, v39, self->_clientBundleID, self->_identifier);
  v26 = v25;
  if (v23)
    v27 = v25 == 0;
  else
    v27 = 1;
  v28 = !v27;
  if (v27)
  {
    v31 = (id)qword_1000C7158;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      *(_DWORD *)buf = 138543874;
      v43 = v32;
      v44 = 2112;
      v45 = v23;
      v46 = 2112;
      v47 = (unint64_t)v26;
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Couldn't create task or taskInfo: task = %@, taskInfo = %@", buf, 0x20u);

    }
  }
  else
  {
    if (v36)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
      v30 = objc_msgSend(v29, "isInSyncBubble");

      if ((v30 & 1) == 0)
      {
        if (self->_clientBundleID)
        {
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_10003F67C;
          v41[3] = &unk_1000B14D8;
          v41[4] = self;
          objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v41);
        }
      }
    }
    objc_msgSend(v23, "setOriginalRequest:", v35);
    objc_msgSend(v26, "setFileURL:", v21);
    -[NDBackgroundSession performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:](self, "performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:", v23, v26, v34, v20);
  }
  v17[2](v17, v28);

LABEL_26:
}

- (void)dataTaskWithRequest:(id)a3 originalRequest:(id)a4 identifier:(unint64_t)a5 uniqueIdentifier:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, uint64_t);
  NSObject *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  void *v35;

  v12 = a3;
  v27 = a4;
  v13 = a6;
  v14 = (void (**)(id, uint64_t))a7;
  v15 = (id)qword_1000C7158;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession descriptionForRequest:](self, "descriptionForRequest:", v12));
    *(_DWORD *)buf = 138544130;
    v29 = v16;
    v30 = 2114;
    v31 = v13;
    v32 = 2048;
    v33 = a5;
    v34 = 2112;
    v35 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Task <%{public}@>.<%lu> dataTaskWithRequest: %@", buf, 0x2Au);

  }
  v18 = -[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:](self, "currentDiscretionaryStatus:withOptionalTaskInfo:", v12, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", v18));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dataTaskWithRequest:", v12));

  v21 = objc_msgSend(objc_alloc((Class)__NSCFURLSessionTaskInfo), "initWithDataTask:uniqueIdentifier:bundleID:sessionID:", v20, v13, self->_clientBundleID, self->_identifier);
  v22 = v21;
  if (v20)
    v23 = v21 == 0;
  else
    v23 = 1;
  v24 = !v23;
  if (v23)
  {
    v25 = (id)qword_1000C7158;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      *(_DWORD *)buf = 138543874;
      v29 = v26;
      v30 = 2112;
      v31 = v20;
      v32 = 2112;
      v33 = (unint64_t)v22;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Couldn't create task or taskInfo: task = %@, taskInfo = %@", buf, 0x20u);

    }
  }
  else
  {
    objc_msgSend(v20, "setOriginalRequest:", v27);
    if (!self->_clientImplementsWillSendRequest || !self->_sendsLaunchEvents)
      objc_msgSend(v22, "setShouldCancelOnDisconnect:", 1);
    objc_msgSend(v22, "setDisablesRetry:", !self->_retryDataTasks);
    -[NDBackgroundSession performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:](self, "performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:", v20, v22, a5, v18);
  }
  v14[2](v14, v24);

}

- (void)avAssetDownloadTaskWithDownloadToken:(unint64_t)a3 URL:(id)a4 destinationURL:(id)a5 temporaryDestinationURL:(id)a6 assetTitle:(id)a7 assetArtworkData:(id)a8 options:(id)a9 assetOptions:(id)a10 identifier:(unint64_t)a11 uniqueIdentifier:(id)a12 taskKind:(unint64_t)a13 enableSPIDelegateCallbacks:(BOOL)a14 reply:(id)a15
{
  (*((void (**)(id, _QWORD))a15 + 2))(a15, 0);
}

- (void)avAggregateAssetDownloadTaskWithDownloadToken:(unint64_t)a3 serializedMediaSelections:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7 assetOptions:(id)a8 childDownloadSessionIdentifier:(id)a9 identifier:(unint64_t)a10 uniqueIdentifier:(id)a11 reply:(id)a12
{
  (*((void (**)(id, _QWORD))a12 + 2))(a12, 0);
}

- (void)cancelTaskWithIdentifier:(unint64_t)a3 byProducingResumeData:(id)a4
{
  id v6;
  NSMutableDictionary *identifiersToTasks;
  void *v8;
  void *v9;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD v18[7];
  _QWORD v19[7];

  v6 = a4;
  identifiersToTasks = self->_identifiersToTasks;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v8));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v11));

  objc_msgSend(v12, "setState:", 2);
  objc_msgSend(v12, "setResumedAndWaitingForEarliestBeginDate:", 0);
  v13 = objc_opt_class(NSURLSessionDownloadTask);
  if ((objc_opt_isKindOfClass(v9, v13) & 1) != 0)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10003F1E4;
    v19[3] = &unk_1000B1500;
    v14 = v19;
    v19[4] = self;
    v15 = v9;
    v19[5] = v15;
    v19[6] = v6;
    objc_msgSend(v15, "cancelByProducingResumeData:", v19);
  }
  else
  {
    v16 = objc_opt_class(NSURLSessionUploadTask);
    if ((objc_opt_isKindOfClass(v9, v16) & 1) == 0)
    {
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
      goto LABEL_7;
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10003F318;
    v18[3] = &unk_1000B1500;
    v14 = v18;
    v18[4] = self;
    v17 = v9;
    v18[5] = v17;
    v18[6] = v6;
    objc_msgSend(v17, "cancelByProducingResumeData:", v18);
  }

LABEL_7:
}

- (void)cancelTaskWithIdentifier:(unint64_t)a3
{
  NSMutableDictionary *identifiersToTasks;
  void *v6;
  void *v7;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  identifiersToTasks = self->_identifiersToTasks;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v6));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v9));

  v11 = (id)qword_1000C7158;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_loggableDescription"));
    v14 = 138543618;
    v15 = v12;
    v16 = 2114;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ cancelTaskWithIdentifier", (uint8_t *)&v14, 0x16u);

  }
  objc_msgSend(v10, "setState:", 2);
  objc_msgSend(v10, "setResumedAndWaitingForEarliestBeginDate:", 0);
  objc_msgSend(v7, "cancel");

}

- (void)suspendTaskWithIdentifier:(unint64_t)a3
{
  NSMutableDictionary *identifiersToTaskInfo;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v6));

  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_loggableDescription"));
    v13 = 138543618;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ suspendTaskWithIdentifier", (uint8_t *)&v13, 0x16u);

  }
  if (v7)
  {
    v11 = (char *)objc_msgSend(v7, "suspendCount");
    objc_msgSend(v7, "setSuspendCount:", v11 + 1);
    if (!v11)
    {
      objc_msgSend(v7, "setState:", 1);
      -[NSXPCProxyCreating backgroundTaskDidSuspend:](self->_clientProxy, "backgroundTaskDidSuspend:", a3);
      -[NDBackgroundSession taskShouldSuspend:](self, "taskShouldSuspend:", a3);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v12, 11, 1);

  }
}

- (void)setPropertyOnStreamWithIdentifier:(unint64_t)a3 propDict:(id)a4 propKey:(id)a5 withReply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id);
  NSMutableDictionary *identifiersToTaskInfo;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSString *clientBundleID;
  NSMutableDictionary *identifiersToStreams;
  void *v21;
  void *v22;
  id v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  NSString *v29;
  __int16 v30;
  id v31;

  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, id))a6;
  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v14));

  v16 = (id)qword_1000C7158;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_loggableDescription"));
    clientBundleID = self->_clientBundleID;
    v24 = 138544130;
    v25 = v17;
    v26 = 2114;
    v27 = v18;
    v28 = 2112;
    v29 = clientBundleID;
    v30 = 2112;
    v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ setPropertyOnStreamWithIdentifier, client %@ property %@", (uint8_t *)&v24, 0x2Au);

  }
  if (v10 && v11 && v12)
  {
    identifiersToStreams = self->_identifiersToStreams;
    if (identifiersToStreams)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToStreams, "objectForKeyedSubscript:", v21));
      v23 = objc_msgSend(v22, "setProperty:forKey:", v10, v11);

    }
    else
    {
      v23 = 0;
    }
    v12[2](v12, v23);
  }

}

- (void)setPriority:(int64_t)a3 forTaskWithIdentifier:(unint64_t)a4
{
  void *v7;
  unsigned __int8 v8;
  NSMutableDictionary *identifiersToTasks;
  void *v10;
  NSObject *v11;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSString *v17;
  unsigned __int8 v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  NSString *clientBundleID;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  NSMutableDictionary *identifiersToMonitors;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  NSString *v48;
  __int16 v49;
  const __CFString *v50;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v8 = sub_1000131C4(v7, CFSTR("com.apple.private.nsurlsession.set-task-priority"));

  if ((v8 & 1) != 0)
  {
    identifiersToTasks = self->_identifiersToTasks;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v11 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v10));

    identifiersToTaskInfo = self->_identifiersToTaskInfo;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v13));

    v15 = (id)qword_1000C7158;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v17 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSObject _loggableDescription](v11, "_loggableDescription"));
      *(_DWORD *)buf = 138543874;
      v46 = v16;
      v47 = 2114;
      v48 = v17;
      v49 = 2048;
      v50 = (const __CFString *)a3;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ setting priority to %ld", buf, 0x20u);

    }
    v18 = objc_msgSend(v14, "hasStarted");
    if (a3 > 300)
      v19 = 1;
    else
      v19 = v18;
    if ((v19 & 1) == 0 && objc_msgSend(v14, "isDiscretionary"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", 0));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "configuration"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "_socketStreamProperties"));
      v23 = objc_msgSend(v22, "mutableCopy");

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", 0));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "configuration"));
      if ((objc_msgSend(v25, "allowsCellularAccess") & 1) != 0)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "originalRequest"));
        v27 = objc_msgSend(v26, "allowsCellularAccess");

        if (v27)
          objc_msgSend(v23, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, kCFStreamPropertyNoCellular);
      }
      else
      {

      }
      objc_msgSend(v23, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, kCFStreamPropertyDUETConditional);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", 0));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "configuration"));
      v32 = objc_msgSend(v31, "_duetPreauthorized");

      if ((v32 & 1) == 0)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", 0));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "configuration"));
        v35 = objc_msgSend(v34, "_requiresPowerPluggedIn");

        if (v35)
        {
          v43 = kConditionalConnectionRequirementPowerPluggedIn;
          v44 = &__kCFBooleanTrue;
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v36, kCFStreamPropertyConditionalConnectionProperties);
        }
        else
        {
          v41 = kConditionalConnectionIsDiscretionary;
          v42 = &__kCFBooleanFalse;
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v36, kCFStreamPropertyConditionalConnectionProperties);
        }

      }
      -[NSObject set_legacySocketStreamProperties:](v11, "set_legacySocketStreamProperties:", v23);
      objc_msgSend(v14, "setDiscretionary:", 0);

    }
    objc_msgSend(v14, "setBasePriority:", a3);
    objc_msgSend(v14, "setBasePrioritySetExplicitly:", 1);
    identifiersToMonitors = self->_identifiersToMonitors;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToMonitors, "objectForKeyedSubscript:", v38));

    objc_msgSend(v39, "setBasePriority:", a3);
    sub_100014C18(v11, (id)a3, self->_monitoredApplication);
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v40, 12, 0);

  }
  else
  {
    v11 = (id)qword_1000C7158;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      clientBundleID = self->_clientBundleID;
      *(_DWORD *)buf = 138543874;
      v46 = v28;
      v47 = 2112;
      v48 = clientBundleID;
      v49 = 2112;
      v50 = CFSTR("com.apple.private.nsurlsession.set-task-priority");
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %@ tried to set the priority of a task but is missing the %@ entitlement", buf, 0x20u);

    }
  }

}

- (void)setLoadingPoolPriority:(double)a3 forTaskWithIdentifier:(unint64_t)a4
{
  void *v7;
  unsigned __int8 v8;
  NSMutableDictionary *identifiersToTasks;
  void *v10;
  NSObject *v11;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  NSString *clientBundleID;
  int v21;
  void *v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  double v26;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v8 = sub_1000131C4(v7, CFSTR("com.apple.private.nsurlsession.set-task-priority"));

  if ((v8 & 1) != 0)
  {
    identifiersToTasks = self->_identifiersToTasks;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v11 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v10));

    identifiersToTaskInfo = self->_identifiersToTaskInfo;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v13));

    v15 = (id)qword_1000C7158;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v17 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSObject _loggableDescription](v11, "_loggableDescription"));
      v21 = 138543874;
      v22 = v16;
      v23 = 2114;
      v24 = v17;
      v25 = 2048;
      v26 = a3;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ setting loading priority to %f", (uint8_t *)&v21, 0x20u);

    }
    -[NSObject set_loadingPriority:](v11, "set_loadingPriority:", a3);
    objc_msgSend(v14, "setLoadingPriority:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v18, 4, 0);

  }
  else
  {
    v11 = (id)qword_1000C7158;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      clientBundleID = self->_clientBundleID;
      v21 = 138543874;
      v22 = v19;
      v23 = 2112;
      v24 = clientBundleID;
      v25 = 2112;
      v26 = COERCE_DOUBLE(CFSTR("com.apple.private.nsurlsession.set-task-priority"));
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %@ tried to set the loading priority of a task but is missing the %@ entitlement", (uint8_t *)&v21, 0x20u);

    }
  }

}

- (void)setBytesPerSecondLimit:(int64_t)a3 forTaskWithIdentifier:(unint64_t)a4
{
  NSMutableDictionary *identifiersToTasks;
  void *v8;
  void *v9;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int64_t v22;

  identifiersToTasks = self->_identifiersToTasks;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v8));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v11));

  v13 = (id)qword_1000C7158;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
    v17 = 138543874;
    v18 = v14;
    v19 = 2114;
    v20 = v15;
    v21 = 2048;
    v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ setting limit of %lld bytes per second", (uint8_t *)&v17, 0x20u);

  }
  objc_msgSend(v9, "set_bytesPerSecondLimit:", a3);
  objc_msgSend(v12, "setBytesPerSecondLimit:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v16, 5, 0);

}

- (void)setExpectedProgressTarget:(unint64_t)a3 forTaskWithIdentifier:(unint64_t)a4
{
  NSMutableDictionary *identifiersToTasks;
  void *v8;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  identifiersToTasks = self->_identifiersToTasks;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v13 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v8));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v10));

  objc_msgSend(v13, "set_expectedProgressTarget:", a3);
  objc_msgSend(v11, "setExpectedProgressTarget:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v12, 6, 0);

}

- (void)setTLSMinimumSupportedProtocolVersion:(unsigned __int16)a3 forTaskWithIdentifier:(unint64_t)a4
{
  uint64_t v5;
  NSMutableDictionary *identifiersToTasks;
  void *v8;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  identifiersToTasks = self->_identifiersToTasks;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v13 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v8));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v10));

  objc_msgSend(v13, "set_TLSMinimumSupportedProtocolVersion:", v5);
  objc_msgSend(v11, "set_TLSMinimumSupportedProtocolVersion:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v12, 7, 0);

}

- (void)setTLSMaximumSupportedProtocolVersion:(unsigned __int16)a3 forTaskWithIdentifier:(unint64_t)a4
{
  uint64_t v5;
  NSMutableDictionary *identifiersToTasks;
  void *v8;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  identifiersToTasks = self->_identifiersToTasks;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v13 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v8));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v10));

  objc_msgSend(v13, "set_TLSMaximumSupportedProtocolVersion:", v5);
  objc_msgSend(v11, "set_TLSMaximumSupportedProtocolVersion:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v12, 7, 0);

}

- (void)setDiscretionaryOverride:(int64_t)a3 forTaskWithIdentifier:(unint64_t)a4
{
  NSMutableDictionary *identifiersToTasks;
  void *v8;
  void *v9;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  void *v16;
  id v17;
  int v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  unsigned int v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const __CFString *v34;

  identifiersToTasks = self->_identifiersToTasks;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v8));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v14 = sub_1000131C4(v13, CFSTR("com.apple.private.nsurlsession.set-discretionary-override-value"));

  if (v14)
  {
    objc_msgSend(v12, "setQos:", qos_class_self());
    v15 = (id)qword_1000C7158;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
      if (a3)
      {
        if (a3 == 1)
        {
          v18 = 68;
        }
        else if (a3 == 2)
        {
          v18 = 78;
        }
        else
        {
          v18 = 63;
        }
      }
      else
      {
        v18 = 45;
      }
      v27 = 138544130;
      v28 = v16;
      v29 = 2114;
      v30 = (uint64_t)v17;
      v31 = 1024;
      v32 = v18;
      v33 = 1024;
      LODWORD(v34) = objc_msgSend(v12, "qos");
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ setting discretionaryOverrride to %c, QOS(0x%x)", (uint8_t *)&v27, 0x22u);

    }
    objc_msgSend(v9, "set_discretionaryOverride:", a3);
    objc_msgSend(v12, "setDiscretionaryOverride:", a3);
    objc_msgSend(v12, "setMayBeDemotedToDiscretionary:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentRequest"));
    v25 = -[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:](self, "currentDiscretionaryStatus:withOptionalTaskInfo:", v24, v12);

    if ((!sub_10001AE20(v9) || (objc_msgSend(v9, "_seenFirstResume") & 1) == 0)
      && v25 != objc_msgSend(v12, "isDiscretionary"))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error:code:", CFSTR("_nsurlsessiondErrorDomain"), 6));
      objc_msgSend(v9, "cancel_with_error:", v26);

    }
    v19 = objc_claimAutoreleasedReturnValue(+[NDStatusMonitor sharedMonitor](NDStatusMonitor, "sharedMonitor"));
    -[NSObject simulateNetworkChangedEvent:identifier:](v19, "simulateNetworkChangedEvent:identifier:", self, a4);
  }
  else
  {
    v19 = (id)qword_1000C7158;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
      v22 = (void *)v21;
      if (a3)
      {
        if (a3 == 1)
        {
          v23 = 68;
        }
        else if (a3 == 2)
        {
          v23 = 78;
        }
        else
        {
          v23 = 63;
        }
      }
      else
      {
        v23 = 45;
      }
      v27 = 138544130;
      v28 = v20;
      v29 = 2114;
      v30 = v21;
      v31 = 1024;
      v32 = v23;
      v33 = 2112;
      v34 = CFSTR("com.apple.private.nsurlsession.set-discretionary-override-value");
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ attempted to set discretionaryOverrride to %c but lacks required entitlement %@", (uint8_t *)&v27, 0x26u);

    }
  }

}

- (void)resetStorageWithReply:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  -[NDCredentialStorage reset](self->_credentialStorage, "reset");
  v4[2]();

}

- (void)invalidateWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSString *identifier;
  NSString *clientBundleID;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  NSString *v18;

  v4 = a3;
  v5 = (id)qword_1000C7158;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    identifier = self->_identifier;
    clientBundleID = self->_clientBundleID;
    v13 = 138543874;
    v14 = v6;
    v15 = 2112;
    v16 = identifier;
    v17 = 2112;
    v18 = clientBundleID;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> InvalidateWithReply: for session %@ bundle ID %@", (uint8_t *)&v13, 0x20u);

  }
  if (-[NDCallbackQueue count](self->_callbackQueue, "count")
    && -[NSMutableDictionary count](self->_identifiersToTasks, "count")
    || -[NDBackgroundSession sessionHasOutstandingTasks](self, "sessionHasOutstandingTasks"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession invalidateReply](self, "invalidateReply"));
    v10 = v9 == 0;

    if (v10)
      -[NDBackgroundSession setInvalidateReply:](self, "setInvalidateReply:", v4);
  }
  else
  {
    v11 = (id)qword_1000C7158;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v13 = 138543362;
      v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Cleaning up and invalidating immediately since there are no tasks", (uint8_t *)&v13, 0xCu);

    }
    -[NDBackgroundSession cleanupSessionWithCompletionHandler:](self, "cleanupSessionWithCompletionHandler:", v4);
  }

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v10 = 138544130;
    v11 = v9;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2048;
    v17 = objc_msgSend(v7, "code");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Session %@ didBecomeInvalidWithError: %@ [%ld]", (uint8_t *)&v10, 0x2Au);

  }
}

- (BOOL)trustPassesExtendedValidation:(__SecTrust *)a3
{
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  const void *Value;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  void *v12;
  CFErrorRef v13;
  id v14;
  void *v15;
  CFErrorRef error;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;

  if (a3)
  {
    error = 0;
    if (!SecTrustEvaluateWithError(a3, &error))
    {
      v8 = (id)qword_1000C7158;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        v13 = error;
        v14 = -[__CFError code](error, "code");
        *(_DWORD *)buf = 138543618;
        v18 = v12;
        v19 = 2048;
        v20 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Invalid trust status: %ld", buf, 0x16u);

      }
      v9 = 0;
      goto LABEL_15;
    }
    v5 = (const __CFDictionary *)SecTrustCopyInfo(a3);
    v6 = v5;
    if (v5)
    {
      Value = CFDictionaryGetValue(v5, kSecTrustInfoExtendedValidationKey);
      v8 = objc_claimAutoreleasedReturnValue(Value);
      if ((objc_opt_respondsToSelector(v8, "BOOLValue") & 1) != 0
        && (-[NSObject BOOLValue](v8, "BOOLValue") & 1) != 0)
      {
        v9 = 1;
      }
      else
      {
        v10 = (id)qword_1000C7158;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          *(_DWORD *)buf = 138543362;
          v18 = v15;
          _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Extended trust validation failed", buf, 0xCu);

        }
        v9 = 0;
      }
      CFRelease(v6);
LABEL_15:

      return v9;
    }
  }
  return 0;
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  NSString *clientBundleID;
  void *v17;
  void *v18;
  id v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  __SecTrust *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  PendingCallback *v48;
  id v49;
  id v50;
  void *v51;
  PendingCallback *v52;
  NDCallbackQueue *callbackQueue;
  uint64_t v54;
  void *v55;
  BOOL v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  _BYTE *v66;
  uint8_t v67[4];
  void *v68;
  __int16 v69;
  void *v70;
  _BYTE buf[24];
  id v72;
  __int16 v73;
  id v74;
  __int16 v75;
  NSString *v76;
  __int16 v77;
  void *v78;

  v9 = a4;
  v10 = a5;
  v62 = a6;
  v63 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v9));
  v61 = objc_msgSend(v11, "unsignedIntegerValue");

  v12 = (id)qword_1000C7158;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "protectionSpace"));
    clientBundleID = self->_clientBundleID;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "protectionSpace"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "authenticationMethod"));
    *(_DWORD *)buf = 138544642;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    v72 = v10;
    v73 = 2112;
    v74 = v15;
    v75 = 2112;
    v76 = clientBundleID;
    v77 = 2112;
    v78 = v18;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ didReceiveChallenge: %@ protection space: %@ for client %@ received auth challenge with type %@", buf, 0x3Eu);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v72) = 0;
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_10003F0FC;
  v64[3] = &unk_1000B1528;
  v66 = buf;
  v19 = v62;
  v65 = v19;
  v20 = objc_retainBlock(v64);
  if (!self->_performsEVCertCheck
    || (v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "protectionSpace")),
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "authenticationMethod")),
        v23 = objc_msgSend(v22, "isEqualToString:", NSURLAuthenticationMethodServerTrust),
        v22,
        v21,
        !v23))
  {
    if (!sub_10003F120(v10)
      || self->_clientImplementsSessionChallenge
      || self->_clientImplementsTaskChallenge)
    {
      if (sub_10003F120(v10) || self->_clientImplementsTaskChallenge)
      {
        if (self->_clientProxy)
          goto LABEL_36;
        if (self->_sendsLaunchEvents && -[NDApplication supportsWakes](self->_clientApplication, "supportsWakes"))
        {
          if (self->_clientProxy)
            goto LABEL_36;
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "protectionSpace"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "authenticationMethod"));
          v36 = objc_msgSend(v35, "isEqualToString:", NSURLAuthenticationMethodServerTrust);

          if (v36)
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "protectionSpace"));
            v38 = (__SecTrust *)objc_msgSend(v37, "serverTrust");

            if (!SecTrustEvaluateWithError(v38, 0))
              goto LABEL_36;
            v39 = (id)qword_1000C7158;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              v40 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "_loggableDescription"));
              *(_DWORD *)v67 = 138543618;
              v68 = v40;
              v69 = 2114;
              v70 = v41;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ client is not running and trust is valid, performing default handling for auth challenge", v67, 0x16u);

            }
          }
          else
          {
            if (self->_clientProxy)
              goto LABEL_36;
            if (objc_msgSend(v10, "previousFailureCount"))
              goto LABEL_36;
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "proposedCredential"));
            v56 = v55 == 0;

            if (v56)
              goto LABEL_36;
            v39 = (id)qword_1000C7158;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              v57 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
              v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "_loggableDescription"));
              *(_DWORD *)v67 = 138543618;
              v68 = v57;
              v69 = 2114;
              v70 = v58;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ client is not running and challenge has a previousFailureCount of 0 and a proposedCredential, performing default handling for auth challenge", v67, 0x16u);

            }
          }
        }
        else
        {
          v39 = (id)qword_1000C7158;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "_loggableDescription"));
            *(_DWORD *)v67 = 138543618;
            v68 = v42;
            v69 = 2114;
            v70 = v43;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ client is not running and doesn't support app wakes, performing default handling for auth challenge", v67, 0x16u);

          }
        }
      }
      else
      {
        v39 = (id)qword_1000C7158;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "_loggableDescription"));
          *(_DWORD *)v67 = 138543618;
          v68 = v44;
          v69 = 2114;
          v70 = v45;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ client doesn't implement task-level auth challenge delegate, performing default handling for auth challenge", v67, 0x16u);

        }
      }
    }
    else
    {
      v39 = (id)qword_1000C7158;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "_loggableDescription"));
        *(_DWORD *)v67 = 138543618;
        v68 = v46;
        v69 = 2114;
        v70 = v47;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ client doesn't implement session-level or task-level auth challenge delegate, performing default handling for auth challenge", v67, 0x16u);

      }
    }

    ((void (*)(_QWORD *))v20[2])(v20);
    goto LABEL_36;
  }
  v24 = (id)qword_1000C7158;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "_loggableDescription"));
    *(_DWORD *)v67 = 138543618;
    v68 = v25;
    v69 = 2114;
    v70 = v26;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ performing Extended Validation Trust evaluation", v67, 0x16u);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "protectionSpace"));
  v28 = objc_msgSend(v27, "serverTrust");

  LODWORD(v27) = -[NDBackgroundSession trustPassesExtendedValidation:](self, "trustPassesExtendedValidation:", v28);
  v29 = (id)qword_1000C7158;
  v30 = v29;
  if ((_DWORD)v27)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "_loggableDescription"));
      *(_DWORD *)v67 = 138543618;
      v68 = v31;
      v69 = 2114;
      v70 = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ Extended Validation Trust evaluation succeeded", v67, 0x16u);

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", v28));
    (*((void (**)(id, _QWORD, void *))v19 + 2))(v19, 0, v33);

  }
  else
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "_loggableDescription"));
      *(_DWORD *)v67 = 138543618;
      v68 = v59;
      v69 = 2114;
      v70 = v60;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ Extended Validation Trust evaluation failed", v67, 0x16u);

    }
    (*((void (**)(id, uint64_t, _QWORD))v19 + 2))(v19, 2, 0);
  }
  *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = 1;
LABEL_36:
  if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    v48 = [PendingCallback alloc];
    v49 = objc_retainBlock(v19);
    v50 = objc_msgSend(v49, "copy");
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v10, v50, 0));
    v52 = -[PendingCallback initWithCallbackType:taskIdentifier:args:](v48, "initWithCallbackType:taskIdentifier:args:", 2, v61, v51);

    objc_msgSend(v63, "_releasePreventIdleSleepAssertionIfAppropriate");
    callbackQueue = self->_callbackQueue;
    if (self->_sendsLaunchEvents)
    {
      if (-[NDApplication supportsWakes](self->_clientApplication, "supportsWakes"))
        v54 = 2;
      else
        v54 = 0;
    }
    else
    {
      v54 = 0;
    }
    -[NDCallbackQueue addPendingCallback:wakeRequirement:](callbackQueue, "addPendingCallback:wakeRequirement:", v52, v54);

  }
  _Block_object_dispose(buf, 8);

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  void *v7;
  id v12;
  void *v13;
  id v14;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v16;
  void *v17;
  id v18;
  id v19;
  unsigned int v20;
  int v21;
  void *v22;
  void *v23;
  unsigned int v24;
  int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSMutableDictionary *v30;
  uint64_t v31;
  void *v32;
  NSMutableDictionary *v33;
  void *v34;
  id v35;
  void *v36;
  NSMutableDictionary *v37;
  NSMutableDictionary *v38;
  void *v39;
  unsigned __int8 v40;
  id v41;
  _QWORD *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSXPCProxyCreating *clientProxy;
  id v47;
  _QWORD *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  _QWORD *v67;
  void *v68;
  id v69;
  _QWORD v70[5];
  id v71;
  id v72;
  _QWORD *v73;
  _QWORD v74[5];
  id v75;
  id v76;
  id v77;
  _QWORD v78[4];
  id v79;
  NDBackgroundSession *v80;
  id v81;
  id v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  id v88;
  __int16 v89;
  id v90;

  v12 = a4;
  v66 = a5;
  v69 = a6;
  v65 = a7;
  v68 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v12));
  v14 = objc_msgSend(v13, "unsignedIntegerValue");

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v14));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v16));

  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_10003EE70;
  v78[3] = &unk_1000B1550;
  v18 = v17;
  v79 = v18;
  v80 = self;
  v82 = v14;
  v19 = v65;
  v81 = v19;
  v67 = objc_retainBlock(v78);
  if (!objc_msgSend(v18, "isDiscretionary"))
    goto LABEL_24;
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "URL"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "host"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentRequest"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "URL"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "host"));
  v20 = objc_msgSend(v64, "isEqualToString:");
  if (v20)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "URL"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "scheme"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentRequest"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "URL"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "scheme"));
    if (objc_msgSend(v59, "isEqualToString:"))
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "URL"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "port"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentRequest"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "URL"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "port"));
      if (v58 == v7)
      {
        v25 = 0;
        v7 = v58;
        goto LABEL_9;
      }
      v21 = 1;
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "_taskGroup"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "_groupConfiguration"));
  v24 = objc_msgSend(v23, "_duetPreauthorized");

  v25 = v24 ^ 1;
  if (!v21)
  {
    if (!v20)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_9:

  if ((v20 & 1) != 0)
  {
LABEL_12:

  }
LABEL_13:

  if (v25)
  {
    v26 = (id)qword_1000C7158;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "_loggableDescription"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentRequest"));
      *(_DWORD *)buf = 138544130;
      v84 = v27;
      v85 = 2114;
      v86 = v28;
      v87 = 2112;
      v88 = v69;
      v89 = 2112;
      v90 = v29;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ modifying conditional connection properties since new request %@ is to a different host than previous request %@", buf, 0x2Au);

    }
    v30 = (NSMutableDictionary *)objc_msgSend(v68, "_copySocketStreamProperties");
    if (!v30)
      v30 = objc_opt_new(NSMutableDictionary);
    v31 = kCFStreamPropertyConditionalConnectionProperties;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", kCFStreamPropertyConditionalConnectionProperties));
    v33 = (NSMutableDictionary *)objc_msgSend(v32, "mutableCopy");

    if (!v33)
      v33 = objc_opt_new(NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", &off_1000B49D0, kConditionalConnectionRequirementTimeWindowDelay);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", &off_1000B4A00, kConditionalConnectionRequirementTimeWindowDuration);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kConditionalConnectionIsDiscretionary);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "_legacySocketStreamProperties"));
    v35 = objc_msgSend(v34, "mutableCopy");
    v36 = v35;
    if (v35)
      v37 = (NSMutableDictionary *)v35;
    else
      v37 = objc_opt_new(NSMutableDictionary);
    v38 = v37;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v33, v31);
    objc_msgSend(v68, "set_legacySocketStreamProperties:", v38);

  }
LABEL_24:
  objc_msgSend(v18, "setCurrentRequest:", v69);
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "URL"));
  v40 = -[NDBackgroundSession errorIfBlockedTracker:url:](self, "errorIfBlockedTracker:url:", v68, v39);

  if ((v40 & 1) != 0)
  {
    v41 = 0;
    v42 = v19;
LABEL_30:
    ((void (*)(_QWORD *, id))v42[2])(v42, v41);
    goto LABEL_31;
  }
  v43 = (id)qword_1000C7158;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "_loggableDescription"));
    *(_DWORD *)buf = 138544130;
    v84 = v44;
    v85 = 2114;
    v86 = v45;
    v87 = 2112;
    v88 = v66;
    v89 = 2112;
    v90 = v69;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ willPerformHTTPRedirection, response: %@, new request: %@", buf, 0x2Au);

  }
  clientProxy = self->_clientProxy;
  v42 = v67;
  v41 = v69;
  if (!clientProxy)
    goto LABEL_30;
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_10003EF18;
  v74[3] = &unk_1000B1578;
  v74[4] = self;
  v47 = v68;
  v75 = v47;
  v48 = v67;
  v77 = v48;
  v49 = v69;
  v76 = v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](clientProxy, "remoteObjectProxyWithErrorHandler:", v74));
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_10003F058;
  v70[3] = &unk_1000B15A0;
  v70[4] = self;
  v71 = v47;
  v72 = v19;
  v73 = v48;
  objc_msgSend(v50, "backgroundTask:willPerformHTTPRedirection:withNewRequest:reply:", v14, v66, v49, v70);

LABEL_31:
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v11;
  NSMutableDictionary *identifiersToMonitors;
  void *v13;
  id v14;
  id v15;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", a4));
  v11 = objc_msgSend(v14, "unsignedIntegerValue");

  identifiersToMonitors = self->_identifiersToMonitors;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
  v15 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToMonitors, "objectForKeyedSubscript:", v13));

  if (v15)
    objc_msgSend(v15, "taskTransferredData:countOfBytesReceived:", a5, 0);
  -[NSXPCProxyCreating backgroundTask:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:](self->_clientProxy, "backgroundTask:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:", v11, a5, a6, a7);

}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSXPCProxyCreating *clientProxy;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v7));
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v12));

  objc_msgSend(v13, "setShouldCancelOnDisconnect:", 1);
  objc_msgSend(v13, "setDisablesRetry:", !self->_retryDataTasks);
  v14 = (id)qword_1000C7158;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_loggableDescription"));
    *(_DWORD *)buf = 138543618;
    v29 = v15;
    v30 = 2114;
    v31 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ needs new body stream", buf, 0x16u);

  }
  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10003ECA0;
    v25[3] = &unk_1000B2210;
    v25[4] = self;
    v18 = v7;
    v26 = v18;
    v19 = v8;
    v27 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](clientProxy, "remoteObjectProxyWithErrorHandler:", v25));
    v21 = sub_10001AE20(v18);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10003EDE4;
    v22[3] = &unk_1000B15C8;
    v22[4] = self;
    v24 = v10;
    v23 = v19;
    objc_msgSend(v20, "backgroundTask:needNewBodyStream:withReply:", v10, v21, v22);

  }
  else
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveInformationalResponse:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  unsigned int v30;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v7));
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  v11 = (id)qword_1000C7158;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_loggableDescription"));
    v23 = 138544130;
    v24 = v12;
    v25 = 2114;
    v26 = v13;
    v27 = 2112;
    v28 = v8;
    v29 = 1024;
    v30 = objc_msgSend(v8, "statusCode");
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ didReceiveInformationalResponse: %@, status code: %d", (uint8_t *)&v23, 0x26u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resumableUploadState"));
  v15 = objc_msgSend(v14, "isResumable");

  if (v15)
  {
    identifiersToTaskInfo = self->_identifiersToTaskInfo;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v17));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "resumableUploadData"));
    LODWORD(v17) = v19 == 0;

    if ((_DWORD)v17)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resumableUploadState"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "createResumeDataForTaskInfo"));
      objc_msgSend(v18, "setResumableUploadData:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
      -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v22, 2, 0);

    }
  }
  -[NSXPCProxyCreating backgroundTask:didReceiveInformationalResponse:](self->_clientProxy, "backgroundTask:didReceiveInformationalResponse:", v10, v8);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  id v23;
  NSXPCProxyCreating *clientProxy;
  void *v25;
  void *v26;
  id v27;
  void (**v28)(id, uint64_t);
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void (**v37)(id, uint64_t);
  _QWORD v38[5];
  id v39;
  void (**v40)(id, uint64_t);
  _QWORD v41[5];
  id v42;
  void (**v43)(id, uint64_t);
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  unsigned int v51;

  v9 = a4;
  v10 = a5;
  v37 = (void (**)(id, uint64_t))a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v9));
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  v13 = (id)qword_1000C7158;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
    *(_DWORD *)buf = 138544130;
    v45 = v14;
    v46 = 2114;
    v47 = v15;
    v48 = 2112;
    v49 = v10;
    v50 = 1024;
    v51 = objc_msgSend(v10, "statusCode");
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ didReceiveResponse: %@, status code: %d", buf, 0x26u);

  }
  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v12));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v17));

  objc_msgSend(v18, "setResponse:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v12));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v19, 1, 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "resumableUploadData"));
  v21 = v20 == 0;

  if (!v21)
  {
    objc_msgSend(v18, "setResumableUploadData:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v12));
    -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v22, 2, 0);

  }
  v23 = objc_msgSend(v18, "taskKind");
  clientProxy = self->_clientProxy;
  if (v23 == (id)1)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_metrics"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "_daemon_currentTransactionMetrics"));
    -[NSXPCProxyCreating backgroundTask:didReceiveResponse:transactionMetrics:](clientProxy, "backgroundTask:didReceiveResponse:transactionMetrics:", v12, v10, v26);

    -[NDBackgroundSession ensureSessionDownloadDirectoryExists](self, "ensureSessionDownloadDirectoryExists");
    v37[2](v37, 2);
  }
  else if (clientProxy)
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10003E9EC;
    v41[3] = &unk_1000B2210;
    v41[4] = self;
    v36 = v9;
    v27 = v9;
    v42 = v27;
    v28 = v37;
    v43 = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](clientProxy, "remoteObjectProxyWithErrorHandler:", v41));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "_metrics"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "_daemon_currentTransactionMetrics"));
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10003EB68;
    v38[3] = &unk_1000B15F0;
    v38[4] = self;
    v39 = v27;
    v40 = v28;
    objc_msgSend(v29, "backgroundTask:didReceiveResponse:transactionMetrics:reply:", v12, v10, v31, v38);

    v9 = v36;
  }
  else
  {
    v32 = (id)qword_1000C7158;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
      *(_DWORD *)buf = 138543618;
      v45 = v34;
      v46 = 2114;
      v47 = v35;
      _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ received data task didReceiveResponse callback and there is no connected client. Canceling task.", buf, 0x16u);

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error:code:", NSURLErrorDomain, -997));
    objc_msgSend(v9, "cancel_with_error:", v33);
    v37[2](v37, 0);

  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 _didReceiveData:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  id v13;
  NSMutableDictionary *identifiersToMonitors;
  void *v15;
  void *v16;
  NSObject *v17;
  NSXPCProxyCreating *clientProxy;
  void (**v19)(_QWORD);
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  void (**v28)(_QWORD);
  _QWORD v29[5];
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;

  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD))a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v9));
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  identifiersToMonitors = self->_identifiersToMonitors;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToMonitors, "objectForKeyedSubscript:", v15));

  if (v16)
    objc_msgSend(v16, "taskTransferredData:countOfBytesReceived:", 0, objc_msgSend(v10, "length"));
  v17 = (id)qword_1000C7158;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
    *(_DWORD *)buf = 138544130;
    v33 = v25;
    v34 = 2114;
    v35 = v26;
    v36 = 2048;
    v37 = objc_msgSend(v9, "countOfBytesReceived");
    v38 = 2048;
    v39 = objc_msgSend(v9, "countOfBytesExpectedToReceive");
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "NDSession <%{public}@> %{public}@ did receive data (%lld of %lld total bytes)", buf, 0x2Au);

  }
  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10003E8A0;
    v29[3] = &unk_1000B2210;
    v29[4] = self;
    v30 = v9;
    v19 = v11;
    v31 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](clientProxy, "remoteObjectProxyWithErrorHandler:", v29));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10003E9E0;
    v27[3] = &unk_1000B1EB8;
    v28 = v19;
    objc_msgSend(v20, "backgroundDataTask:didReceiveData:withReply:", v13, v10, v27);

  }
  else
  {
    v21 = (id)qword_1000C7158;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
      *(_DWORD *)buf = 138543618;
      v33 = v22;
      v34 = 2114;
      v35 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ received data and there is no connected client. Canceling task.", buf, 0x16u);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error:code:", NSURLErrorDomain, -997));
    objc_msgSend(v9, "cancel_with_error:", v24);
    v11[2](v11);

  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *identifiersToTasks;
  void *v16;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v7));
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  v11 = (id)qword_1000C7158;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_loggableDescription"));
    v24 = 138543618;
    v25 = v12;
    v26 = 2114;
    v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ became download task", (uint8_t *)&v24, 0x16u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tasksToIdentifiers, "setObject:forKeyedSubscript:", v14, v8);

  -[NSMutableDictionary removeObjectForKey:](self->_tasksToIdentifiers, "removeObjectForKey:", v7);
  identifiersToTasks = self->_identifiersToTasks;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
  -[NSMutableDictionary setObject:forKeyedSubscript:](identifiersToTasks, "setObject:forKeyedSubscript:", v8, v16);

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "downloadFile"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "path"));

  if (v21)
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v21));
  else
    v22 = 0;
  objc_msgSend(v19, "setDownloadFileURL:", v22);
  if (v21)

  if (objc_msgSend(v19, "taskKind") == (id)2)
  {
    -[NSXPCProxyCreating backgroundDataTaskDidBecomeDownloadTask:](self->_clientProxy, "backgroundDataTaskDidBecomeDownloadTask:", v10);
    objc_msgSend(v19, "setTaskKind:", 0);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v23, 14, 0);

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v15;
  void *v16;
  PendingCallback *v17;
  void *v18;
  void *v19;
  void *v20;
  PendingCallback *v21;
  _QWORD v22[2];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v7));
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  v11 = (id)qword_1000C7158;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_loggableDescription"));
    *(_DWORD *)buf = 138543874;
    v24 = v12;
    v25 = 2114;
    v26 = v13;
    v27 = 2112;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ finished downloading to %@", buf, 0x20u);

  }
  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v15));

  if (objc_msgSend(v7, "_hasSZExtractor"))
  {
    +[NDFileUtilities updateStreamingZipModificationDate:](NDFileUtilities, "updateStreamingZipModificationDate:", v8);
    objc_msgSend(v16, "set_updatedStreamingZipModificationDate:", 1);
  }
  v17 = [PendingCallback alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "response", v16));
  v19 = v18;
  if (!v18)
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v22[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
  v21 = -[PendingCallback initWithCallbackType:taskIdentifier:args:](v17, "initWithCallbackType:taskIdentifier:args:", 1, v10, v20);

  if (!v18)
  -[NDCallbackQueue addPendingCallback:wakeRequirement:](self->_callbackQueue, "addPendingCallback:wakeRequirement:", v21, 0);

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didResumeAtOffset:(int64_t)a5 expectedTotalBytes:(int64_t)a6
{
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  int64_t v26;

  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v9));
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  v12 = (id)qword_1000C7158;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
    v19 = 138544130;
    v20 = v13;
    v21 = 2114;
    v22 = v14;
    v23 = 2048;
    v24 = a5;
    v25 = 2048;
    v26 = a6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ didResumeAtOffset: %lld expectedTotalBytes: %lld", (uint8_t *)&v19, 0x2Au);

  }
  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v16));

  if (objc_msgSend(v17, "expectingResumeCallback"))
  {
    -[NSXPCProxyCreating backgroundDownloadTask:didResumeAtOffset:expectedTotalBytes:](self->_clientProxy, "backgroundDownloadTask:didResumeAtOffset:expectedTotalBytes:", v11, a5, a6);
    objc_msgSend(v17, "setExpectingResumeCallback:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
    -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v18, 14, 0);

  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v11;
  NSMutableDictionary *identifiersToMonitors;
  void *v13;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v17 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", a4));
  v11 = objc_msgSend(v17, "unsignedIntegerValue");

  identifiersToMonitors = self->_identifiersToMonitors;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
  v18 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToMonitors, "objectForKeyedSubscript:", v13));

  if (v18)
    objc_msgSend(v18, "taskTransferredData:countOfBytesReceived:", 0, a5);
  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v15));

  if (!objc_msgSend(v16, "taskKind"))
    -[NSXPCProxyCreating backgroundDownloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:](self->_clientProxy, "backgroundDownloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:", v11, a5, a6, a7);

}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  void *v9;
  id v10;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSString *v16;
  NSString *clientBundleID;
  id v18;
  id v19;
  _QWORD *v20;
  PendingCallback *v21;
  _QWORD *v22;
  id v23;
  void *v24;
  PendingCallback *v25;
  NDCallbackQueue *callbackQueue;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  unsigned int v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  NSString *v34;
  void *v35;
  void *v36;
  NSString *v37;
  void *v38;
  NSString *v39;
  id v40;
  void (**v41)(id, id);
  id v42;
  _QWORD v43[4];
  id v44;
  NDBackgroundSession *v45;
  id v46;
  id v47;
  void (**v48)(id, id);
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  NSString *v53;
  __int16 v54;
  NSString *v55;

  v42 = a4;
  v40 = a5;
  v41 = (void (**)(id, id))a6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v42));
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v12));

  v14 = (id)qword_1000C7158;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v16 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "_loggableDescription"));
    clientBundleID = self->_clientBundleID;
    *(_DWORD *)buf = 138543874;
    v51 = v15;
    v52 = 2114;
    v53 = v16;
    v54 = 2112;
    v55 = clientBundleID;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ for client %@ _willSendRequestForEstablishedConnection", buf, 0x20u);

  }
  sub_10000B8B4(1, self->_clientBundleID, self->_identifier, self->_monitoredAppBundleID, self->_secondaryID, v42, v13, 0);
  if (!objc_msgSend(v13, "taskKind"))
    -[NDBackgroundSession ensureSessionDownloadDirectoryExists](self, "ensureSessionDownloadDirectoryExists");
  if (!self->_clientImplementsWillSendRequest
    && (!objc_msgSend(v13, "taskKind")
     || objc_msgSend(v13, "taskKind") == (id)1 && (objc_msgSend(v13, "shouldCancelOnDisconnect") & 1) == 0))
  {
    v28 = (id)qword_1000C7158;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      *(_DWORD *)buf = 138543362;
      v51 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Client does not implement _willSendRequestForEstablishedConnection, so using proposed request", buf, 0xCu);

    }
LABEL_29:

    v41[2](v41, v40);
    goto LABEL_30;
  }
  if (self->_clientProxy
    || self->_sendsLaunchEvents && -[NDApplication supportsWakes](self->_clientApplication, "supportsWakes"))
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10003E6BC;
    v43[3] = &unk_1000B1618;
    v44 = v13;
    v45 = self;
    v49 = v10;
    v18 = v40;
    v46 = v18;
    v19 = v42;
    v47 = v19;
    v48 = v41;
    v20 = objc_retainBlock(v43);
    v21 = [PendingCallback alloc];
    v22 = objc_retainBlock(v20);
    v23 = objc_msgSend(v22, "copy");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v18, v23, 0));
    v25 = -[PendingCallback initWithCallbackType:taskIdentifier:args:](v21, "initWithCallbackType:taskIdentifier:args:", 5, v10, v24);

    objc_msgSend(v19, "_releasePreventIdleSleepAssertionIfAppropriate");
    callbackQueue = self->_callbackQueue;
    if (self->_sendsLaunchEvents)
    {
      if (-[NDApplication supportsWakes](self->_clientApplication, "supportsWakes"))
        v27 = 2;
      else
        v27 = 0;
    }
    else
    {
      v27 = 0;
    }
    -[NDCallbackQueue addPendingCallback:wakeRequirement:](callbackQueue, "addPendingCallback:wakeRequirement:", v25, v27);

    v35 = v44;
  }
  else
  {
    v30 = objc_msgSend(v13, "shouldCancelOnDisconnect");
    v31 = (id)qword_1000C7158;
    v28 = v31;
    if (!v30)
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        v37 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "_loggableDescription"));
        *(_DWORD *)buf = 138543618;
        v51 = v36;
        v52 = 2114;
        v53 = v37;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ using proposed request since the client application is not running and doesn't support wakes", buf, 0x16u);

      }
      goto LABEL_29;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v39 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "_loggableDescription"));
      *(_DWORD *)buf = 138543618;
      v51 = v38;
      v52 = 2114;
      v53 = v39;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ established a connection which requires the client to be running, but it isn't running and doesn't support app wakes. Canceling the task.", buf, 0x16u);

    }
    v32 = (id)qword_1000C7158;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v34 = self->_clientBundleID;
      *(_DWORD *)buf = 138543618;
      v51 = v33;
      v52 = 2112;
      v53 = v34;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Perhaps the client %@ was uninstalled?", buf, 0x16u);

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "error:code:", NSURLErrorDomain, -997));
    objc_msgSend(v42, "cancel_with_error:", v35);
    v41[2](v41, 0);
  }

LABEL_30:
}

- (void)URLSession:(id)a3 task:(id)a4 _isWaitingForConnectionWithReason:(int64_t)a5
{
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSString *clientBundleID;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  int64_t v22;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v7));
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  v10 = (id)qword_1000C7158;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_loggableDescription"));
    clientBundleID = self->_clientBundleID;
    v15 = 138544130;
    v16 = v11;
    v17 = 2114;
    v18 = v12;
    v19 = 2112;
    v20 = clientBundleID;
    v21 = 2048;
    v22 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ for client %@ is waiting for connection - reason: %lld", (uint8_t *)&v15, 0x2Au);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLError errorWithDomain:code:userInfo:](NSURLError, "errorWithDomain:code:userInfo:", NSTCPConnectionConditionsUnmetReasonErrorDomain, a5, 0));
  -[NSXPCProxyCreating backgroundTask:hasConnectionWaitingWithError:](self->_clientProxy, "backgroundTask:hasConnectionWaitingWithError:", v9, v14);

}

- (void)URLSession:(id)a3 task:(id)a4 _conditionalRequirementsChanged:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSString *clientBundleID;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  _BOOL4 v22;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (id)qword_1000C7158;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
    clientBundleID = self->_clientBundleID;
    v15 = 138544130;
    v16 = v11;
    v17 = 2114;
    v18 = v12;
    v19 = 2112;
    v20 = clientBundleID;
    v21 = 1024;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ for client %@ conditions changed - satisfied: %d", (uint8_t *)&v15, 0x26u);

  }
  if (!v5)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error:code:", CFSTR("_nsurlsessiondErrorDomain"), 5));
    objc_msgSend(v9, "cancel_with_error:", v14);

  }
}

- (void)_URLSession:(id)a3 downloadTask:(id)a4 didReceiveResponse:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSString *clientBundleID;
  NSMutableDictionary *identifiersToTaskInfo;
  void *v16;
  void *v17;
  void *v18;
  NSXPCProxyCreating *clientProxy;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  unsigned int v29;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v7));
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  v11 = (id)qword_1000C7158;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_loggableDescription"));
    clientBundleID = self->_clientBundleID;
    v22 = 138544130;
    v23 = v12;
    v24 = 2114;
    v25 = v13;
    v26 = 2112;
    v27 = clientBundleID;
    v28 = 1024;
    v29 = objc_msgSend(v8, "statusCode");
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ download for client %@ received response, status code: %d", (uint8_t *)&v22, 0x26u);

  }
  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v16));

  objc_msgSend(v17, "setResponse:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:](self, "queueUpdatesForTask:updateType:highPriority:", v18, 1, 1);

  clientProxy = self->_clientProxy;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_metrics"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_daemon_currentTransactionMetrics"));
  -[NSXPCProxyCreating backgroundTask:didReceiveResponse:transactionMetrics:](clientProxy, "backgroundTask:didReceiveResponse:transactionMetrics:", v10, v8, v21);

}

- (void)_URLSession:(id)a3 openFileAtPath:(id)a4 mode:(int)a5 completionHandler:(id)a6
{
  uint64_t v7;
  id v10;
  NSString *v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSXPCProxyCreating *clientProxy;
  NSObject *v16;
  _BOOL4 v17;
  void ***v18;
  PendingCallback *v19;
  void *v20;
  id v21;
  void *v22;
  PendingCallback *v23;
  NDCallbackQueue *callbackQueue;
  uint64_t v25;
  void *v26;
  NSString *clientBundleID;
  void *v28;
  NSString *v29;
  void **v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *);
  void *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  NSString *v38;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = (NSString *)a4;
  v12 = a6;
  v13 = (id)qword_1000C7158;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    *(_DWORD *)buf = 138543618;
    v36 = v14;
    v37 = 2112;
    v38 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Need file descriptor for file at path %@", buf, 0x16u);

  }
  if (self->_sendsLaunchEvents && -[NDApplication supportsWakes](self->_clientApplication, "supportsWakes"))
    goto LABEL_9;
  clientProxy = self->_clientProxy;
  v16 = (id)qword_1000C7158;
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
  if (clientProxy)
  {
    if (v17)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      clientBundleID = self->_clientBundleID;
      *(_DWORD *)buf = 138543618;
      v36 = v26;
      v37 = 2112;
      v38 = clientBundleID;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client %@ does not support app wakes, but it is still running. Will attempt to get file descriptor for download file.", buf, 0x16u);

    }
LABEL_9:
    v30 = _NSConcreteStackBlock;
    v31 = 3221225472;
    v32 = sub_10003E648;
    v33 = &unk_1000B1640;
    v34 = v12;
    v18 = objc_retainBlock(&v30);
    v19 = [PendingCallback alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
    v21 = objc_msgSend(v18, "copy");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v11, v20, v21, 0, v30, v31, v32, v33));
    v23 = -[PendingCallback initWithCallbackType:taskIdentifier:args:](v19, "initWithCallbackType:taskIdentifier:args:", 6, 0, v22);

    callbackQueue = self->_callbackQueue;
    if (self->_sendsLaunchEvents)
    {
      if (-[NDApplication supportsWakes](self->_clientApplication, "supportsWakes"))
        v25 = 2;
      else
        v25 = 0;
    }
    else
    {
      v25 = 0;
    }
    -[NDCallbackQueue addPendingCallback:wakeRequirement:](callbackQueue, "addPendingCallback:wakeRequirement:", v23, v25);

    goto LABEL_18;
  }
  if (v17)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v29 = self->_clientBundleID;
    *(_DWORD *)buf = 138543618;
    v36 = v28;
    v37 = 2112;
    v38 = v29;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Client %@ does not support app wakes, cannot get file descriptor for download file!", buf, 0x16u);

  }
  (*((void (**)(id, uint64_t))v12 + 2))(v12, 0xFFFFFFFFLL);
LABEL_18:

}

- (void)_URLSession:(id)a3 task:(id)a4 getAuthHeadersForResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  NSString *clientBundleID;
  _BOOL4 sendsLaunchEvents;
  unsigned int v21;
  const char *v22;
  const char *v23;
  NSXPCProxyCreating *clientProxy;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSString *v31;
  PendingCallback *v32;
  id v33;
  id v34;
  void *v35;
  PendingCallback *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  _QWORD v44[5];
  id v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  NSString *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v9));
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  v14 = (id)qword_1000C7158;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v40 = v11;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    v16 = v10;
    v17 = v9;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
    clientBundleID = self->_clientBundleID;
    sendsLaunchEvents = self->_sendsLaunchEvents;
    v21 = -[NDApplication supportsWakes](self->_clientApplication, "supportsWakes");
    v22 = "Y";
    *(_DWORD *)buf = 138544386;
    v49 = 2114;
    v48 = v15;
    if (sendsLaunchEvents)
      v23 = "Y";
    else
      v23 = "N";
    v50 = v18;
    v51 = 2112;
    if (!v21)
      v22 = "N";
    v52 = clientBundleID;
    v53 = 2080;
    v54 = v23;
    v55 = 2080;
    v56 = v22;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ getAuthHeadersForResponse for %@ _sendsLaunchEvents=%s [_clientApplication supportsWakes]=%s", buf, 0x34u);

    v10 = v16;
    v11 = v40;
    v9 = v17;

  }
  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10003E370;
    v44[3] = &unk_1000B2210;
    v44[4] = self;
    v25 = v9;
    v45 = v25;
    v26 = v11;
    v46 = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](clientProxy, "remoteObjectProxyWithErrorHandler:", v44));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10003E4CC;
    v41[3] = &unk_1000B1668;
    v41[4] = self;
    v42 = v25;
    v43 = v26;
    objc_msgSend(v27, "backgroundTask:getAuthHeadersForResponse:reply:", v13, v10, v41);

  }
  else if (self->_sendsLaunchEvents && -[NDApplication supportsWakes](self->_clientApplication, "supportsWakes"))
  {
    v28 = (id)qword_1000C7158;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
      v31 = self->_clientBundleID;
      *(_DWORD *)buf = 138543874;
      v48 = v29;
      v49 = 2114;
      v50 = v30;
      v51 = 2112;
      v52 = v31;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ waking %@ for auth headers", buf, 0x20u);

    }
    v32 = [PendingCallback alloc];
    v33 = objc_retainBlock(v11);
    v34 = objc_msgSend(v33, "copy");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v34, v10, 0));
    v36 = -[PendingCallback initWithCallbackType:taskIdentifier:args:](v32, "initWithCallbackType:taskIdentifier:args:", 10, v13, v35);

    objc_msgSend(v9, "_releasePreventIdleSleepAssertionIfAppropriate");
    -[NDCallbackQueue addPendingCallback:wakeRequirement:](self->_callbackQueue, "addPendingCallback:wakeRequirement:", v36, 2);

  }
  else
  {
    v37 = (id)qword_1000C7158;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
      *(_DWORD *)buf = 138543618;
      v48 = v38;
      v49 = 2114;
      v50 = v39;
      _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ getAuthHeadersForResponse does not have a remote object and does not support app wakes, canceling.", buf, 0x16u);

    }
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v11 + 2))(v11, 0, 0, 0);
  }

}

- (NDBackgroundSessionDelegate)delegate
{
  return (NDBackgroundSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)monitoredAppBundleID
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (NSString)secondaryID
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (id)invalidateReply
{
  return objc_getProperty(self, a2, 304, 1);
}

- (void)setInvalidateReply:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 304);
}

- (NSString)sharedContainerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 312, 1);
}

- (void)setSharedContainerIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 312);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedContainerIdentifier, 0);
  objc_storeStrong(&self->_invalidateReply, 0);
  objc_storeStrong((id *)&self->_secondaryID, 0);
  objc_storeStrong((id *)&self->_monitoredAppBundleID, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->tasksDB, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_identifiersToTaskInfo, 0);
  objc_storeStrong((id *)&self->_monitoredApplication, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_identifiersToUpdates, 0);
  objc_storeStrong((id *)&self->_watchExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_xpcConn, 0);
  objc_storeStrong(&self->_completeReconnectionBlock, 0);
  objc_storeStrong((id *)&self->_uploadsDirectory, 0);
  objc_storeStrong((id *)&self->_downloadDirectory, 0);
  objc_storeStrong((id *)&self->_sessionDirectory, 0);
  objc_storeStrong((id *)&self->_outstandingTaskIDs, 0);
  objc_storeStrong((id *)&self->_identifiersToStreamQueues, 0);
  objc_storeStrong((id *)&self->_identifiersToStreams, 0);
  objc_storeStrong((id *)&self->_identifiersToMonitors, 0);
  objc_storeStrong((id *)&self->_identifiersToTasks, 0);
  objc_storeStrong((id *)&self->_tasksToIdentifiers, 0);
  objc_storeStrong((id *)&self->_connectedExtension, 0);
  objc_storeStrong((id *)&self->_clientApplication, 0);
  objc_storeStrong((id *)&self->_credentialStorage, 0);
  objc_storeStrong((id *)&self->_discretionaryPrioritySession, 0);
  objc_storeStrong((id *)&self->_userInitiatedSession, 0);
}

@end
