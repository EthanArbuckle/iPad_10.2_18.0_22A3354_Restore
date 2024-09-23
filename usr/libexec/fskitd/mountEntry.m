@implementation mountEntry

- (mountEntry)initWithName:(id)a3 fileSystem:(id)a4 displayName:(id)a5 storageName:(id)a6 provider:(id)a7 path:(id)a8 mountID:(unsigned int)a9 auditToken:(id)a10 mntTable:(id)a11
{
  id v18;
  id v19;
  mountEntry *v20;
  mountEntry *v21;
  id WeakRetained;
  uint64_t v23;
  uint64_t v24;
  NSCondition *theLock;
  id v26;
  NSUUID *mountTaskUUID;
  FSResource *resource;
  fskitdExtensionInstance *instance;
  FSVolumeIdentifier *volumeID;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  objc_super v42;

  v18 = a3;
  v41 = a4;
  v40 = a5;
  v39 = a6;
  v38 = a7;
  v37 = a8;
  v36 = a10;
  v19 = a11;
  v42.receiver = self;
  v42.super_class = (Class)mountEntry;
  v20 = -[mountEntry init](&v42, "init");
  v21 = v20;
  if (v20)
  {
    v20->_is_connected = 0;
    v20->_connecting = 0;
    v20->_is_inet = byte_10005C70C;
    *(_WORD *)&v20->_is_killing_io = 0;
    v35 = v19;
    objc_storeWeak((id *)&v20->_mntTable, v19);
    if (a9 == -1)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v21->_mntTable);
      v21->_midx = objc_msgSend(WeakRetained, "nextIndex");

    }
    else
    {
      v21->_midx = a9;
    }
    objc_storeStrong((id *)&v21->_volumeName, a3);
    objc_storeStrong((id *)&v21->_displayName, a5);
    objc_storeStrong((id *)&v21->_fileSystem, a4);
    objc_storeStrong((id *)&v21->_storageName, a6);
    objc_storeStrong((id *)&v21->_providerName, a7);
    v24 = objc_opt_new(NSCondition, v23);
    theLock = v21->_theLock;
    v21->_theLock = (NSCondition *)v24;

    objc_storeStrong((id *)&v21->_mntOn, a8);
    objc_storeStrong((id *)&v21->_auditToken, a10);
    v26 = objc_loadWeakRetained((id *)&v21->_mntTable);
    objc_msgSend(v26, "add:", v21);

    mountTaskUUID = v21->_mountTaskUUID;
    v21->_currentState = 0;
    v21->_mountTaskUUID = 0;
    v21->_fileno = 2;

    resource = v21->_resource;
    v21->_resource = 0;

    v19 = v35;
    if (v41)
    {
      if ((objc_msgSend(v41, "isEqualToString:", CFSTR("exfat")) & 1) != 0
        || (objc_msgSend(v41, "isEqualToString:", CFSTR("ntfs")) & 1) != 0
        || (objc_msgSend(v41, "isEqualToString:", CFSTR("apfs")) & 1) != 0
        || objc_msgSend(v41, "isEqualToString:", CFSTR("hfs")))
      {
        v21->_isFSKitModule = 0;
      }
      else if (objc_msgSend(v41, "containsString:", CFSTR("msdos")))
      {
        v21->_isFSKitModule = _os_feature_enabled_impl("FSKit", "msdosUseFSKitModule");
      }
      else
      {
        v21->_isFSKitModule = 1;
      }
    }
    else
    {
      v21->_isFSKitModule = 0;
    }
    instance = v21->_instance;
    v21->_instance = 0;

    volumeID = v21->_volumeID;
    v21->_volumeID = 0;

    v32 = fskit_std_log(v31);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      sub_10003CC8C();

  }
  return v21;
}

- (mountEntry)initWithObject:(id)a3 path:(id)a4 mntTable:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  mountEntry *v13;
  id v14;
  void *v15;
  NSString *v16;
  NSObject *rootLIFileHandle;
  uint64_t v18;
  mountEntry *v19;
  uint64_t v21;
  _QWORD v22[6];
  _QWORD v23[5];
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken token](FSAuditToken, "token"));
  LODWORD(v21) = -1;
  v13 = -[mountEntry initWithName:fileSystem:displayName:storageName:provider:path:mountID:auditToken:mntTable:](self, "initWithName:fileSystem:displayName:storageName:provider:path:mountID:auditToken:mntTable:", 0, 0, 0, 0, 0, v10, v21, v12, v11);

  if (!v13)
    goto LABEL_7;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_10002C0D0;
  v29 = sub_10002C0E0;
  v30 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_10002C0D0;
  v23[4] = sub_10002C0E0;
  v24 = 0;
  v13->_is_connected = 1;
  v13->_midx = 0;
  objc_storeStrong((id *)&v13->_fsObj, a3);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002C888;
  v22[3] = &unk_100055C58;
  v22[4] = v23;
  v22[5] = &v25;
  v14 = objc_msgSend(v9, "getRootFileHandleWithError:", v22);
  v15 = (void *)v26[5];
  if (v15)
  {
    v16 = v15;
    rootLIFileHandle = v13->_rootLIFileHandle;
    v13->_rootLIFileHandle = v16;
  }
  else
  {
    v18 = livefs_std_log(v14);
    rootLIFileHandle = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(rootLIFileHandle, OS_LOG_TYPE_ERROR))
      sub_10003CD00();
  }

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

  if (!v15)
    v19 = 0;
  else
LABEL_7:
    v19 = v13;

  return v19;
}

+ (id)newWithName:(id)a3 fileSystem:(id)a4 displayName:(id)a5 storageName:(id)a6 provider:(id)a7 path:(id)a8 mountID:(unsigned int)a9 auditToken:(id)a10 mntTable:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v28;

  v18 = a11;
  v19 = a10;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  LODWORD(v28) = a9;
  v26 = objc_msgSend(objc_alloc((Class)a1), "initWithName:fileSystem:displayName:storageName:provider:path:mountID:auditToken:mntTable:", v25, v24, v23, v22, v21, v20, v28, v19, v18);

  return v26;
}

+ (id)newWithObject:(id)a3 path:(id)a4 mntTable:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithObject:path:mntTable:", v10, v9, v8);

  return v11;
}

- (void)refreshPath:(id)a3 displayName:(id)a4 storageName:(id)a5
{
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *mntOn;
  NSString *displayName;
  NSString *v13;
  NSString *storageName;
  NSString *v15;

  v8 = (NSString *)a3;
  v9 = (NSString *)a4;
  v10 = (NSString *)a5;
  mntOn = self->_mntOn;
  self->_mntOn = v8;
  v15 = v8;

  displayName = self->_displayName;
  self->_displayName = v9;
  v13 = v9;

  storageName = self->_storageName;
  self->_storageName = v10;

}

- (id)fsObjWithErrorHandler:(id)a3
{
  id v4;
  LiveFSVolumeCore_FSFileName *v5;
  LiveFSVolumeCore_FSFileName *v6;
  void *v7;

  v4 = a3;
  if (!self->_midx)
  {
    v5 = self->_fsObj;
    goto LABEL_5;
  }
  if (self->_isFSKitModule)
  {
    v5 = +[FSVolumeConnectorBridge newWithConnection:errorHandler:](FSVolumeConnectorBridge, "newWithConnection:errorHandler:", self->_theConn, v4);
LABEL_5:
    v6 = v5;
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_theConn, "remoteObjectProxyWithErrorHandler:", v4));
  if (v7)
    v6 = +[LiveFSVolumeCore_FSFileNameBridge newWithProxy:](LiveFSVolumeCore_FSFileNameBridge, "newWithProxy:", v7);
  else
    v6 = 0;

LABEL_10:
  return v6;
}

- (id)fsSynchObjWithErrorHandler:(id)a3
{
  id v4;
  LiveFSVolumeCore_FSFileName *v5;
  LiveFSVolumeCore_FSFileName *v6;
  void *v7;

  v4 = a3;
  if (!self->_midx)
  {
    v5 = self->_fsObj;
    goto LABEL_5;
  }
  if (self->_isFSKitModule)
  {
    v5 = +[FSVolumeConnectorBridge newWithSyncConnection:errorHandler:](FSVolumeConnectorBridge, "newWithSyncConnection:errorHandler:", self->_theConn, v4);
LABEL_5:
    v6 = v5;
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_theConn, "synchronousRemoteObjectProxyWithErrorHandler:", v4));
  if (v7)
    v6 = +[LiveFSVolumeCore_FSFileNameBridge newWithProxy:](LiveFSVolumeCore_FSFileNameBridge, "newWithProxy:", v7);
  else
    v6 = 0;

LABEL_10:
  return v6;
}

- (void)doWait
{
  self->_waiters = 1;
  -[NSCondition wait](self->_theLock, "wait");
}

- (void)doWakeAndUnlock
{
  _BOOL4 waiters;

  waiters = self->_waiters;
  self->_waiters = 0;
  -[NSCondition unlock](self->_theLock, "unlock");
  if (waiters)
    -[NSCondition broadcast](self->_theLock, "broadcast");
}

- (unint64_t)currentState
{
  unint64_t currentState;

  -[NSCondition lock](self->_theLock, "lock");
  currentState = self->_currentState;
  -[NSCondition unlock](self->_theLock, "unlock");
  return currentState;
}

- (NSString)stateAsString
{
  unint64_t v2;

  v2 = -[mountEntry currentState](self, "currentState");
  if (v2 > 2)
    return (NSString *)CFSTR("unknown");
  else
    return &off_100055E80[v2]->isa;
}

- (void)setCurrentState:(unint64_t)a3
{
  -[NSCondition lock](self->_theLock, "lock");
  self->_currentState = a3;
  -[mountEntry doWakeAndUnlock](self, "doWakeAndUnlock");
}

- (void)getLiveFilesConnectionForPath:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  NSString *providerName;
  NSString *volumeName;
  NSString *fileSystem;
  FSAuditToken *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  FSVolumeIdentifier *v21;
  FSVolumeIdentifier *volumeID;
  uint64_t *p_volumeID;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  FSAuditToken *auditToken;
  FSVolumeIdentifier *v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  fskitdExtensionInstance **p_instance;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  fskitdExtensionInstance *v36;
  id *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  id v54;
  id v55;
  _QWORD v56[4];
  __CFString *v57;
  _QWORD v58[6];
  _QWORD v59[5];
  id obj;
  _QWORD v61[6];
  _QWORD v62[6];
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint8_t v75[4];
  const char *v76;
  __int16 v77;
  _BYTE v78[24];
  _BYTE buf[24];
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (self->_isFSKitModule)
  {
    objc_msgSend((id)qword_10005C720, "taskSetChanged");
    if (-[NSString localizedCaseInsensitiveContainsString:](self->_fileSystem, "localizedCaseInsensitiveContainsString:", CFSTR("MSDOS")))
    {
      v9 = CFSTR("com.apple.fskit.msdos");
LABEL_15:
      v20 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", self->_volumeName);
      v21 = (FSVolumeIdentifier *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "fs_volumeIdentifier"));
      p_volumeID = (uint64_t *)&self->_volumeID;
      volumeID = self->_volumeID;
      self->_volumeID = v21;

      v69 = 0;
      v70 = &v69;
      v71 = 0x3032000000;
      v72 = sub_10002C0D0;
      v73 = sub_10002C0E0;
      v74 = 0;
      v63 = 0;
      v64 = &v63;
      v65 = 0x3032000000;
      v66 = sub_10002C0D0;
      v67 = sub_10002C0E0;
      v68 = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v80 = sub_10002C0D0;
      v81 = sub_10002C0E0;
      v82 = 0;
      v25 = fskit_std_log(v24);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v75 = 136315650;
        v76 = "-[mountEntry getLiveFilesConnectionForPath:withCompletionHandler:]";
        v77 = 2112;
        *(_QWORD *)v78 = v9;
        *(_WORD *)&v78[8] = 2112;
        *(_QWORD *)&v78[10] = v20;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: Trying to find a FSVolumeConnector using bundleID (%@) and volumeID (%@)", v75, 0x20u);
      }

      auditToken = self->_auditToken;
      v28 = self->_volumeID;
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_10002D6A8;
      v61[3] = &unk_100055748;
      v61[4] = &v69;
      v61[5] = &v63;
      v29 = objc_msgSend((id)qword_10005C728, "existingExtensionForBundle:user:volume:replyHandler:", v9, auditToken, v28, v61);
      if (v70[5])
      {
        v30 = fskit_std_log(v29);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v75 = 136315906;
          v76 = "-[mountEntry getLiveFilesConnectionForPath:withCompletionHandler:]";
          v77 = 1024;
          *(_DWORD *)v78 = 637;
          *(_WORD *)&v78[4] = 2112;
          *(_QWORD *)&v78[6] = v9;
          *(_WORD *)&v78[14] = 2112;
          *(_QWORD *)&v78[16] = v20;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s:%d: No extension instance found for bundleID (%@) volumeID (%@)", v75, 0x26u);
        }

        v8[2](v8, 0, v70[5]);
      }
      else
      {
        p_instance = &self->_instance;
        objc_storeStrong((id *)p_instance, (id)v64[5]);
        v34 = fskit_std_log(v33);
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v75 = 136315906;
          v76 = "-[mountEntry getLiveFilesConnectionForPath:withCompletionHandler:]";
          v77 = 1024;
          *(_DWORD *)v78 = 642;
          *(_WORD *)&v78[4] = 2112;
          *(_QWORD *)&v78[6] = v9;
          *(_WORD *)&v78[14] = 2112;
          *(_QWORD *)&v78[16] = v20;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s:%d: Found extension instance for bundleID (%@) volumeID (%@)", v75, 0x26u);
        }

        v36 = *p_instance;
        v37 = (id *)(v70 + 5);
        obj = (id)v70[5];
        v38 = -[fskitdExtensionInstance newXPCConnectionWithError:](v36, "newXPCConnectionWithError:", &obj);
        objc_storeStrong(v37, obj);
        if (v70[5])
        {
          v40 = fskit_std_log(v39);
          v41 = objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = v70[5];
            *(_DWORD *)v75 = 136315394;
            v76 = "-[mountEntry getLiveFilesConnectionForPath:withCompletionHandler:]";
            v77 = 2112;
            *(_QWORD *)v78 = v42;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%s: Connecting to extension instance reported error %@", v75, 0x16u);
          }

          v8[2](v8, 0, v70[5]);
        }
        else
        {
          v43 = fskit_std_log(v39);
          v44 = objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v75 = 136315394;
            v76 = "-[mountEntry getLiveFilesConnectionForPath:withCompletionHandler:]";
            v77 = 1024;
            *(_DWORD *)v78 = 648;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%s:%d: creating FSModuleXPC sync proxy", v75, 0x12u);
          }

          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472;
          v59[2] = sub_10002D714;
          v59[3] = &unk_100054868;
          v59[4] = &v69;
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "synchronousRemoteObjectProxyWithErrorHandler:", v59));
          v46 = fskit_std_log(v45);
          v47 = objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            sub_10003CDF0(p_volumeID, v47);

          v48 = *p_volumeID;
          v58[0] = _NSConcreteStackBlock;
          v58[1] = 3221225472;
          v58[2] = sub_10002D724;
          v58[3] = &unk_100055CA8;
          v58[4] = buf;
          v58[5] = &v69;
          v49 = objc_msgSend(v45, "getVolumeEndpoint:replyHandler:", v48, v58);
          if (v70[5])
          {
            v50 = fskit_std_log(v49);
            v51 = objc_claimAutoreleasedReturnValue(v50);
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v75 = 136315394;
              v76 = "-[mountEntry getLiveFilesConnectionForPath:withCompletionHandler:]";
              v77 = 1024;
              *(_DWORD *)v78 = 663;
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%s:%d: No FSVolumeConnector endpoint found", v75, 0x12u);
            }

            v8[2](v8, 0, v70[5]);
          }
          else
          {
            v52 = fskit_std_log(v49);
            v53 = objc_claimAutoreleasedReturnValue(v52);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v75 = 136315394;
              v76 = "-[mountEntry getLiveFilesConnectionForPath:withCompletionHandler:]";
              v77 = 1024;
              *(_DWORD *)v78 = 666;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%s:%d: FSVolumeConnector endpoint found", v75, 0x12u);
            }

            v54 = objc_alloc((Class)NSXPCConnection);
            v55 = objc_msgSend(v54, "initWithListenerEndpoint:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
            ((void (**)(_QWORD, id, uint64_t))v8)[2](v8, v55, v70[5]);

          }
        }

      }
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v63, 8);
      _Block_object_dispose(&v69, 8);

      goto LABEL_41;
    }
    if (-[NSString localizedCaseInsensitiveContainsString:](self->_fileSystem, "localizedCaseInsensitiveContainsString:", CFSTR("passthroughfs")))
    {
      v9 = CFSTR("com.apple.fskit.passthroughfs");
      goto LABEL_15;
    }
    v69 = 0;
    v70 = &v69;
    v71 = 0x3032000000;
    v72 = sub_10002C0D0;
    v73 = sub_10002C0E0;
    v74 = 0;
    v63 = 0;
    v64 = &v63;
    v65 = 0x3032000000;
    v66 = sub_10002C0D0;
    v67 = sub_10002C0E0;
    v68 = 0;
    fileSystem = self->_fileSystem;
    v15 = self->_auditToken;
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_10002D634;
    v62[3] = &unk_100055C80;
    v62[4] = &v69;
    v62[5] = &v63;
    v16 = objc_msgSend((id)qword_10005C748, "currentExtensionForShortName:auditToken:replyHandler:", fileSystem, v15, v62);
    v17 = v64[5];
    if (v17)
    {
      v18 = fskit_std_log(v16);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[mountEntry getLiveFilesConnectionForPath:withCompletionHandler:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s: No extension instance found for bundleID (%@)", buf, 0x16u);
      }

      v8[2](v8, 0, v64[5]);
      v9 = 0;
    }
    else
    {
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v70[5], "bundleIdentifier"));
    }
    _Block_object_dispose(&v63, 8);

    _Block_object_dispose(&v69, 8);
    if (!v17)
      goto LABEL_15;
  }
  else
  {
    v10 = fskit_std_log(v7);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_10003CD74();

    providerName = self->_providerName;
    volumeName = self->_volumeName;
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_10002D798;
    v56[3] = &unk_100055CD0;
    v57 = v8;
    +[LIFSClientConnector getLiveFilesConnectionForProvider:volume:withHandler:](LIFSClientConnector, "getLiveFilesConnectionForProvider:volume:withHandler:", providerName, volumeName, v56);
    v9 = v57;
  }
LABEL_41:

}

- (id)doConnect
{
  dispatch_semaphore_t v3;
  BOOL isFSKitModule;
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSString *mntOn;
  NSXPCConnection *theConn;
  NSString *rootLIFileHandle;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSError *domainError;
  uint64_t *v15;
  NSError *v16;
  NSString *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  intptr_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSString *v26;
  void *v27;
  NSString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  FSResource *v46;
  FSResource *resource;
  uint64_t v48;
  NSUUID *v49;
  NSUUID *mountTaskUUID;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v58;
  _QWORD v59[6];
  _QWORD v60[6];
  _QWORD v61[5];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  _QWORD v74[6];
  _QWORD v75[5];
  _QWORD v76[4];
  NSObject *v77;
  mountEntry *v78;
  uint64_t *v79;
  BOOL v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  __int128 buf;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;

  v81 = 0;
  v82 = &v81;
  v83 = 0x3032000000;
  v84 = sub_10002C0D0;
  v85 = sub_10002C0E0;
  v86 = 0;
  v3 = dispatch_semaphore_create(0);
  isFSKitModule = self->_isFSKitModule;
  v5 = -[NSCondition lock](self->_theLock, "lock");
  self->_is_connected = 0;
  if (dword_10005C708)
  {
    v6 = livefs_std_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      mntOn = self->_mntOn;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = mntOn;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "doConnect: starting at %@", (uint8_t *)&buf, 0xCu);
    }

  }
  theConn = self->_theConn;
  self->_theConn = 0;

  rootLIFileHandle = self->_rootLIFileHandle;
  self->_rootLIFileHandle = 0;

  if (self->_domainError)
  {
    v12 = livefs_std_log(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      domainError = self->_domainError;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = domainError;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "doConnect exiting as domain has error %@", (uint8_t *)&buf, 0xCu);
    }

    v15 = v82;
    v16 = self->_domainError;
    v17 = 0;
    v18 = v15[5];
    v15[5] = (uint64_t)v16;
  }
  else
  {
    -[NSCondition unlock](self->_theLock, "unlock");
    v17 = self->_mntOn;
    v19 = livefs_std_log(v17);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v17;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Tweaked path is %{public}@", (uint8_t *)&buf, 0xCu);
    }

    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_10002DF3C;
    v76[3] = &unk_100055CF8;
    v79 = &v81;
    v21 = v3;
    v80 = isFSKitModule;
    v77 = v21;
    v78 = self;
    -[mountEntry getLiveFilesConnectionForPath:withCompletionHandler:](self, "getLiveFilesConnectionForPath:withCompletionHandler:", v17, v76);
    v22 = dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
    if (self->_theConn)
    {
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472;
      v75[2] = sub_10002E22C;
      v75[3] = &unk_100054868;
      v75[4] = &v81;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[mountEntry fsSynchObjWithErrorHandler:](self, "fsSynchObjWithErrorHandler:", v75));
      v24 = livefs_std_log(v23);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "About to get root fh", (uint8_t *)&buf, 2u);
      }

      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_10002E23C;
      v74[3] = &unk_100055D20;
      v74[4] = self;
      v74[5] = &v81;
      objc_msgSend(v23, "getRootFileHandleWithError:", v74);
      if (self->_is_connected)
      {
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v88 = 0x3032000000;
        v89 = sub_10002C0D0;
        v90 = sub_10002C0E0;
        v91 = 0;
        v68 = 0;
        v69 = &v68;
        v70 = 0x3032000000;
        v71 = sub_10002C0D0;
        v72 = sub_10002C0E0;
        v73 = 0;
        v62 = 0;
        v63 = &v62;
        v64 = 0x3032000000;
        v65 = sub_10002C0D0;
        v66 = sub_10002C0E0;
        v67 = 0;
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_10002E3D4;
        v61[3] = &unk_100054868;
        v61[4] = &v62;
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[mountEntry fsSynchObjWithErrorHandler:](self, "fsSynchObjWithErrorHandler:", v61));
        v26 = self->_rootLIFileHandle;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[FSFileName nameWithCString:](FSFileName, "nameWithCString:", "_S_f_location"));
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_10002E3E4;
        v60[3] = &unk_100055D48;
        v60[4] = &buf;
        v60[5] = &v62;
        objc_msgSend(v58, "otherAttributeOf:named:requestID:reply:", v26, v27, 0, v60);

        if (!v63[5])
        {
          v28 = self->_rootLIFileHandle;
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[FSFileName nameWithCString:](FSFileName, "nameWithCString:", "_S_f_type"));
          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472;
          v59[2] = sub_10002E4E4;
          v59[3] = &unk_100055D48;
          v59[4] = &v68;
          v59[5] = &v62;
          objc_msgSend(v58, "otherAttributeOf:named:requestID:reply:", v28, v29, 0, v59);

        }
        if (!self->_mountTaskUUID)
        {
          v30 = (id)v69[5];
          if (!v30 || (v30 = objc_msgSend(v30, "caseInsensitiveCompare:", CFSTR("smb"))) != 0)
          {
            if (v63[5])
            {
              v31 = fskit_std_log(v30);
              v32 = objc_claimAutoreleasedReturnValue(v31);
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                sub_10003CF40();
            }
            else
            {
              v44 = fskit_std_log(v30);
              v45 = objc_claimAutoreleasedReturnValue(v44);
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                sub_10003CEB8();

              v46 = (FSResource *)objc_claimAutoreleasedReturnValue(+[FSBlockDeviceResource proxyResourceForBSDName:](FSBlockDeviceResource, "proxyResourceForBSDName:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40)));
              resource = self->_resource;
              self->_resource = v46;

              -[FSResource setState:](self->_resource, "setState:", 6);
              v49 = (NSUUID *)objc_opt_new(NSUUID, v48);
              mountTaskUUID = self->_mountTaskUUID;
              self->_mountTaskUUID = v49;

              v32 = objc_claimAutoreleasedReturnValue(+[FSTaskDescription taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:](FSTaskDescription, "taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:", self->_mountTaskUUID, 1, FSTaskPurposeActivate, 0, CFSTR("Unknown"), 0, self->_resource));
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
              objc_sync_enter(v51);
              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
              objc_msgSend(v52, "setObject:forKey:", v32, self->_mountTaskUUID);

              objc_sync_exit(v51);
              objc_msgSend((id)qword_10005C720, "taskSetChanged");
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
              objc_sync_enter(v53);
              v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
              objc_msgSend(v54, "addResource:", self->_resource);

              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
              objc_msgSend(v55, "addTaskUUID:resource:", self->_mountTaskUUID, self->_resource);

              objc_sync_exit(v53);
            }

          }
        }

        _Block_object_dispose(&v62, 8);
        _Block_object_dispose(&v68, 8);

        _Block_object_dispose(&buf, 8);
      }
    }
    else
    {
      v33 = fskit_std_log(v22);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        sub_10003CE88(v34, v35, v36, v37, v38, v39, v40, v41);

      v42 = fs_errorForPOSIXError(61);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      v23 = (void *)v82[5];
      v82[5] = v43;
    }

    -[NSCondition lock](self->_theLock, "lock");
    v18 = v77;
  }

  self->_connecting = 0;
  objc_storeStrong((id *)&self->lastConnectError, (id)v82[5]);
  -[mountEntry doWakeAndUnlock](self, "doWakeAndUnlock");
  v56 = (id)v82[5];

  _Block_object_dispose(&v81, 8);
  return v56;
}

- (id)connect
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  unsigned int midx;
  BOOL v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  NSError *v12;
  unint64_t currentState;
  uint64_t v15;
  NSObject *v16;
  NSError *lastConnectError;
  NSError *v18;
  dispatch_queue_global_t global_queue;
  NSObject *v20;
  _BOOL4 is_connected;
  unint64_t v22;
  uint64_t v23;
  NSError *v24;
  NSError *v25;
  NSError *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  uint8_t v44;
  _BYTE v45[15];
  uint8_t v46[8];
  _QWORD block[5];
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  unsigned int v53;
  __int16 v54;
  const char *v55;

  if (!self->_midx)
  {
    v10 = livefs_std_log(self);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v49 = "-[mountEntry connect]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s returning without connection, idx 0", buf, 0xCu);
    }

    goto LABEL_17;
  }
  v3 = -[NSCondition lock](self->_theLock, "lock");
  if (dword_10005C708)
  {
    v4 = livefs_std_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_is_connected)
        v6 = "";
      else
        v6 = "not ";
      midx = self->_midx;
      v8 = !self->_connecting;
      *(_DWORD *)buf = 136315906;
      v49 = "-[mountEntry connect]";
      v50 = 2080;
      v51 = v6;
      if (v8)
        v9 = "no";
      else
        v9 = "yes";
      v52 = 1024;
      v53 = midx;
      v54 = 2080;
      v55 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s entered is %sConnected id %d connecting %s", buf, 0x26u);
    }

  }
  if (self->_is_connected)
  {
    -[NSCondition unlock](self->_theLock, "unlock");
LABEL_17:
    v12 = 0;
    return v12;
  }
  while (1)
  {
    currentState = self->_currentState;
    if (currentState)
      break;
    v15 = livefs_std_log(v3);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10003D210(buf, &buf[1], v16);

    v3 = -[mountEntry doWait](self, "doWait");
  }
  if (currentState == 2)
  {
    lastConnectError = self->lastConnectError;
    if (lastConnectError)
    {
      v18 = lastConnectError;
    }
    else
    {
      v27 = fs_errorForPOSIXError(61);
      v18 = (NSError *)objc_claimAutoreleasedReturnValue(v27);
    }
    v12 = v18;
    v28 = livefs_std_log(-[NSCondition unlock](self->_theLock, "unlock"));
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_10003D24C(v29, v30, v31, v32, v33, v34, v35, v36);

  }
  else
  {
    if (!self->_connecting)
    {
      self->_connecting = 1;
      global_queue = dispatch_get_global_queue(2, 0);
      v20 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002EA30;
      block[3] = &unk_100054D88;
      block[4] = self;
      dispatch_async(v20, block);

    }
    if (self->_is_connected)
    {
LABEL_29:
      is_connected = 1;
LABEL_30:
      v22 = self->_currentState;
    }
    else
    {
      v37 = 0;
      while (1)
      {
        if (self->lastConnectError)
        {
          is_connected = 0;
          goto LABEL_30;
        }
        v22 = self->_currentState;
        if (v22 != 1)
          break;
        if ((dword_10005C708 != 0) | v37 & 1)
        {
          v38 = livefs_std_log(v3);
          v39 = objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v46 = 0;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "About to sleep for connecting", v46, 2u);
          }

        }
        v3 = -[mountEntry doWait](self, "doWait");
        if ((dword_10005C708 != 0) | v37 & 1)
        {
          v40 = livefs_std_log(v3);
          v41 = objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v46 = 0;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Waking from sleep for connecting", v46, 2u);
          }

        }
        if (!self->_is_connected)
        {
          if (self->lastConnectError || (self->_currentState != 1) | v37 & 1)
            continue;
          v42 = livefs_std_log(v3);
          v43 = objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
            sub_10003D1D4(&v44, v45, v43);

          v37 = 1;
          if (!self->_is_connected)
            continue;
        }
        goto LABEL_29;
      }
      is_connected = 0;
    }
    if (v22 == 2 && !self->lastConnectError)
    {
      v23 = fs_errorForPOSIXError(53);
      v24 = (NSError *)objc_claimAutoreleasedReturnValue(v23);
      v25 = self->lastConnectError;
      self->lastConnectError = v24;

      is_connected = self->_is_connected;
    }
    v26 = self->lastConnectError;
    -[NSCondition unlock](self->_theLock, "unlock");
    if (is_connected)
      v12 = 0;
    else
      v12 = v26;

  }
  return v12;
}

- (unsigned)encryptedIdx
{
  return dword_10005C768 + self->_midx;
}

- (void)handleConnectionInvalidated
{
  NSXPCConnection *theConn;
  id v4;

  self->_is_connected = 0;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection exportedObject](self->_theConn, "exportedObject"));
  if (v4)
    objc_msgSend(v4, "connectionWasInterupted");
  theConn = self->_theConn;
  self->_theConn = 0;

}

- (void)handleConnectionInterrupted
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(2, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002EB2C;
  block[3] = &unk_100054D88;
  block[4] = self;
  dispatch_async(v4, block);

}

- (BOOL)ensureConnected:(int)a3 status:(id *)a4
{
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;

  -[NSCondition lock](self->_theLock, "lock");
  *a4 = 0;
  if (self->_is_connected)
  {
    -[NSCondition unlock](self->_theLock, "unlock");
    LOBYTE(v7) = 1;
  }
  else
  {
    -[NSCondition unlock](self->_theLock, "unlock");
    if (a3)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      v8 = objc_claimAutoreleasedReturnValue(-[mountEntry connect](self, "connect"));
      v9 = (void *)v8;
      v7 = v8 == 0;
      if (v8)
      {
        v10 = livefs_std_log(v8);
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_10003D2EC();

        *a4 = objc_retainAutorelease(v9);
      }

    }
  }
  return v7;
}

- (void)copyDisconnectedRootAttrs:(_LIFileAttributes *)a3
{
  *(_OWORD *)&a3->var0 = 0u;
  *(_OWORD *)&a3->var2 = 0u;
  *(_QWORD *)&a3->var19 = 0;
  a3->var17 = 0u;
  a3->var18 = 0u;
  a3->var15 = 0u;
  a3->var16 = 0u;
  a3->var13 = 0u;
  a3->var14 = 0u;
  *(_OWORD *)&a3->var9 = 0u;
  *(_OWORD *)&a3->var11 = 0u;
  *(_OWORD *)&a3->var5 = 0u;
  a3->var1 = 7647;
  *(_QWORD *)&a3->var3 = 0x16D00000002;
  a3->var11 = self->_fileno;
  a3->var13.tv_sec = 1546329600;
  a3->var15.tv_sec = 1546329600;
  a3->var14.tv_sec = 1546329600;
  a3->var5 = 2;
  a3->var6 = getuid();
  a3->var7 = getgid();
  *(int64x2_t *)&a3->var9 = vdupq_n_s64(1uLL);
}

- (id)mount:(int)a3
{
  return -[mountEntry mount:options:](self, "mount:options:", *(_QWORD *)&a3, 0);
}

- (id)mount:(int)a3 options:(id)a4
{
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSString *v9;
  NSString *realMountPath;
  NSString **p_realMountPath;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSString *v15;
  void *v16;
  NSString *v17;
  unsigned __int8 v18;
  uint64_t v19;
  NSString *v20;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  NSString *rootLIFileHandle;
  char *v31;
  void *v32;
  uint64_t v33;
  _BYTE *v34;
  unint64_t v35;
  uint64_t v36;
  NSObject *v37;
  unsigned int v38;
  const __CFString *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  const char *v47;
  const char **v48;
  const char *v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  int *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  NSObject *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id v82;
  posix_spawnattr_t v83;
  pid_t v84[2];
  posix_spawn_file_actions_t v85[2];
  uint64_t v86;
  char *__argv;
  _QWORD v88[4];
  __int128 v89;
  _OWORD v90[4];
  uint8_t buf[32];
  __int128 v92;
  uint64_t v93;

  memset(v90, 0, sizeof(v90));
  v6 = livefs_std_log(self);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[mountEntry mount:options:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: will mount over LIFSv2", buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[mountEntry mntOn](self, "mntOn"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByStandardizingPath"));
  p_realMountPath = &self->realMountPath;
  realMountPath = self->realMountPath;
  self->realMountPath = v9;

  if (dword_10005C708 >= 2)
  {
    v13 = livefs_std_log(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = self->realMountPath;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[mountEntry mntOn](self, "mntOn"));
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "realMountPath = %@, mntOn = %@", buf, 0x16u);

    }
  }
  v17 = (NSString *)objc_claimAutoreleasedReturnValue(-[mountEntry mntOn](self, "mntOn"));
  if (-[NSString hasPrefix:](v17, "hasPrefix:", CFSTR("/private/")))
  {
    v18 = -[NSString hasPrefix:](*p_realMountPath, "hasPrefix:", CFSTR("/private"));

    if ((v18 & 1) != 0)
      goto LABEL_11;
    v20 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@%@"), CFSTR("/private"), *p_realMountPath);
    v17 = *p_realMountPath;
    *p_realMountPath = v20;
  }

LABEL_11:
  if (self->_midx)
  {
    self->_mnt_flags = a3;
    return 0;
  }
  if (dword_10005C708 >= 2)
  {
    v22 = livefs_std_log(v19);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "mountTable->mount: Enter", buf, 2u);
    }

  }
  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C750, "mkMountPath:mountID:", *p_realMountPath, 0));
  if (v24)
  {
    v25 = (void *)v24;
    v26 = livefs_std_log(v24);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_10003D6F8();

    return v25;
  }
  if (dword_10005C708 >= 2)
  {
    v28 = livefs_std_log(0);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      rootLIFileHandle = self->_rootLIFileHandle;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = rootLIFileHandle;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Got fh = %@", buf, 0xCu);
    }

  }
  if (!self->_rootLIFileHandle)
    return (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
  sub_100003CD4(-[mountEntry midx](self, "midx"), self->_rootLIFileHandle, v90);
  v31 = (char *)malloc_type_malloc(0x81uLL, 0xCF491FD8uLL);
  v32 = v31;
  if (v31)
  {
    v33 = 0;
    v34 = v31 + 1;
    do
    {
      v35 = *((unsigned __int8 *)v90 + v33);
      *(v34 - 1) = a0123456789abcd[v35 >> 4];
      *v34 = a0123456789abcd[v35 & 0xF];
      v34 += 2;
      ++v33;
    }
    while (v33 != 64);
    v31[128] = 0;
  }
  if (dword_10005C708 >= 2)
  {
    v36 = livefs_std_log(v31);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = off_10005C388;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v32;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Mounting filesystem on port %@ with rootfh = %s", buf, 0x16u);
    }

  }
  v38 = -[mountEntry is_inet](self, "is_inet");
  v39 = CFSTR("proto=ticotsord");
  if (v38)
    v39 = CFSTR("proto=tcp");
  v40 = 10;
  if ((a3 & 8) != 0)
    v40 = 0;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("fpnfs,noatime,%@,port=%@,rsize=%d,wsize=%d,readahead=%d,dsize=%d,actimeo=%d,locallocks,noquota,noexec,noowners,nobrowse"), v39, off_10005C388, 0x80000, 0x10000, 4, 0x10000, v40));
  v42 = v41;
  if ((a3 & 0x10) == 0)
  {
    if ((a3 & 0x400) == 0)
      goto LABEL_40;
LABEL_44:
    objc_msgSend(v42, "appendString:", CFSTR(",nofollow"));
    if (v32)
      goto LABEL_41;
    goto LABEL_45;
  }
  objc_msgSend(v41, "appendString:", CFSTR(",sync"));
  if ((a3 & 0x400) != 0)
    goto LABEL_44;
LABEL_40:
  if (v32)
  {
LABEL_41:
    objc_msgSend(v42, "appendFormat:", CFSTR(",fh=%s"), v32);
    free(v32);
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v42, "appendString:", CFSTR(",pfh"));
LABEL_46:
  __argv = "/sbin/mount_lifs";
  v88[0] = "-v";
  v88[1] = "-o";
  v43 = objc_retainAutorelease(v42);
  v88[2] = objc_msgSend(v43, "UTF8String");
  v88[3] = ":/";
  v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[mountEntry mntOn](self, "mntOn")));
  v89 = (unint64_t)objc_msgSend(v44, "UTF8String");

  v45 = objc_alloc_init((Class)NSMutableString);
  v46 = v45;
  v47 = "/sbin/mount_lifs";
  if ("/sbin/mount_lifs")
  {
    v48 = (const char **)v88;
    do
    {
      v45 = objc_msgSend(v46, "appendFormat:", CFSTR("%s "), v47);
      v49 = *v48++;
      v47 = v49;
    }
    while (v49);
  }
  *(_QWORD *)v84 = 0;
  v85[0] = 0;
  v83 = 0;
  v50 = livefs_std_log(v45);
  v51 = objc_claimAutoreleasedReturnValue(v50);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v46;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "cmd: %@", buf, 0xCu);
  }

  posix_spawn_file_actions_init(v85);
  posix_spawn_file_actions_addinherit_np(v85, 0);
  posix_spawn_file_actions_addinherit_np(v85, 1);
  posix_spawn_file_actions_addinherit_np(v85, 2);
  posix_spawnattr_init(&v83);
  posix_spawnattr_setflags(&v83, 0x4000);
  v52 = posix_spawn(v84, "/sbin/mount_lifs", v85, &v83, &__argv, environ);
  if ((_DWORD)v52)
  {
    v53 = livefs_std_log(v52);
    v54 = objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      sub_10003D688();
    goto LABEL_62;
  }
  do
  {
    v56 = waitpid(v84[0], &v84[1], 0);
    if ((_DWORD)v56 != -1)
    {
      if ((v84[1] & 0x7F) != 0)
      {
        v57 = livefs_std_log(v56);
        v58 = objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          sub_10003D60C();
        v59 = -1;
      }
      else
      {
        v59 = BYTE1(v84[1]);
        if (!BYTE1(v84[1]))
          goto LABEL_72;
        v64 = livefs_std_log(v56);
        v58 = objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          sub_10003D59C();
      }

LABEL_72:
      posix_spawnattr_destroy(&v83);
      posix_spawn_file_actions_destroy(v85);

      if (v59)
        goto LABEL_63;
      v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[mountEntry mntOn](self, "mntOn")));
      v66 = (const char *)-[NSObject UTF8String](v65, "UTF8String");
      *(_OWORD *)v85 = xmmword_100044880;
      v86 = 0;
      v93 = 0;
      v92 = 0u;
      memset(buf, 0, sizeof(buf));
      v67 = getattrlist(v66, v85, buf, 0x38uLL, 0);
      if ((_DWORD)v67)
      {
        v68 = livefs_std_log(v67);
        v69 = objc_claimAutoreleasedReturnValue(v68);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          sub_10003D4EC((uint64_t)v66, v69);
      }
      else
      {
        if ((buf[10] & 2) != 0)
        {
          v73 = *(_DWORD *)&buf[24];
          v72 = *(_DWORD *)&buf[28];

          v75 = livefs_std_log(v74);
          v76 = objc_claimAutoreleasedReturnValue(v75);
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            v77 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[mountEntry mntOn](self, "mntOn")));
            v78 = objc_msgSend(v77, "UTF8String");
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = v78;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v73;
            _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%s: FMT CAPS: 0x%08x", buf, 0x12u);

          }
          v80 = livefs_std_log(v79);
          v65 = objc_claimAutoreleasedReturnValue(v80);
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            v81 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[mountEntry mntOn](self, "mntOn")));
            v82 = objc_msgSend(v81, "UTF8String");
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = v82;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v72;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%s: INT CAPS: 0x%08x", buf, 0x12u);

          }
          goto LABEL_80;
        }
        v70 = livefs_std_log(v67);
        v69 = objc_claimAutoreleasedReturnValue(v70);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          sub_10003D470((uint64_t)v66, v69, v71);
      }

LABEL_80:
      v25 = 0;
      self->_mnt_flags = a3;
      goto LABEL_66;
    }
    v55 = __error();
  }
  while (*v55 == 4);
  v60 = livefs_std_log(v55);
  v54 = objc_claimAutoreleasedReturnValue(v60);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    sub_10003D3E4(v54);
LABEL_62:

  v59 = -1;
LABEL_63:
  v62 = livefs_std_log(v61);
  v63 = objc_claimAutoreleasedReturnValue(v62);
  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    sub_10003D35C(v59, v63);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v59, 0));
  -[mountEntry removeMountTask](self, "removeMountTask");
LABEL_66:

  return v25;
}

- (void)renameToName:(id)a3 reply:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  void *v9;
  NSString *volumeName;
  NSString *providerName;
  id v12;
  void *v13;
  id v14;
  void **v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  v9 = (void *)qword_10005C720;
  volumeName = self->_volumeName;
  providerName = self->_providerName;
  v20 = 0;
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_10002F7B8;
  v18 = &unk_100055630;
  v12 = v7;
  v19 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "updateMountEntry:provider:settingsDictionary:updateBlock:", volumeName, providerName, &v20, &v15));
  v14 = v20;
  if (v13)
  {
    v8[2](v8, v13);
  }
  else
  {
    objc_storeStrong((id *)&self->_displayName, a3);
    +[LivefsDomainManager updateDomain:reply:](LivefsDomainManager, "updateDomain:reply:", v14, v8, v15, v16, v17, v18);
  }

}

- (int)isMountAtPath:(id)a3 err:(id *)a4
{
  id v5;
  int v6;
  uint64_t v7;
  const char *v8;
  int v9;
  statfs *v10;
  const char *v11;
  char *f_mntonname;
  NSError *v13;
  statfs *v15;

  v5 = a3;
  v15 = 0;
  if (v5)
  {
    v6 = getmntinfo_r_np(&v15, 2);
    if (v6)
    {
      LODWORD(v7) = v6;
      v8 = (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      v9 = 0;
      v10 = v15;
      if (v8 && (int)v7 >= 1)
      {
        v11 = v8;
        v7 = v7;
        f_mntonname = v15->f_mntonname;
        while (strcmp(v11, f_mntonname))
        {
          f_mntonname += 2168;
          if (!--v7)
          {
            v9 = 0;
            goto LABEL_14;
          }
        }
        v9 = 1;
      }
LABEL_14:
      free(v10);
    }
    else
    {
      if (a4)
      {
        v13 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, *__error(), 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue(v13);
      }
      v9 = -1;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)unmountPreflight:(int)a3
{
  mountEntry *v3;
  BOOL v5;

  if (!self->realMountPath)
    return 0;
  v3 = self;
  objc_sync_enter(v3);
  if (*(_WORD *)&v3->_is_in_unmount_method)
  {
    v5 = 0;
  }
  else
  {
    v5 = 1;
    v3->_is_in_unmount_method = 1;
  }
  objc_sync_exit(v3);

  return v5;
}

- (void)removeMountTask
{
  NSUUID **p_mountTaskUUID;
  NSUUID *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSUUID *v8;
  FSResource *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  FSResource *resource;
  uint64_t v17;

  p_mountTaskUUID = &self->_mountTaskUUID;
  v4 = self->_mountTaskUUID;
  v5 = objc_sync_enter(v4);
  if (*p_mountTaskUUID)
  {
    v6 = livefs_std_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_10003D7D0();

    objc_msgSend((id)qword_10005C720, "removeReferencesToTask:", *p_mountTaskUUID);
    v8 = *p_mountTaskUUID;
    *p_mountTaskUUID = 0;

  }
  objc_sync_exit(v4);

  v9 = self->_resource;
  v10 = objc_sync_enter(v9);
  if (self->_resource)
  {
    v11 = livefs_std_log(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FSResource getResourceID](self->_resource, "getResourceID"));
      sub_10003D770(v13, (uint64_t)&v17, v12);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
    objc_sync_enter(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
    objc_msgSend(v15, "removeResource:", self->_resource);

    objc_sync_exit(v14);
    resource = self->_resource;
    self->_resource = 0;

  }
  objc_sync_exit(v9);

}

- (id)unmountPostflight:(int)a3
{
  char v3;
  NSString *v5;
  NSXPCConnection *theConn;
  NSString *v7;
  int v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  mountEntry *v12;

  v3 = a3;
  v5 = self->realMountPath;
  if ((v3 & 2) != 0)
  {
    self->_is_connected = 0;
    theConn = self->_theConn;
    self->_theConn = 0;

    v7 = objc_retainAutorelease(v5);
    v8 = rmdir(-[NSString fileSystemRepresentation](v7, "fileSystemRepresentation"));
    v9 = -[mountEntry setCurrentState:](self, "setCurrentState:", 2);
    if (v8)
    {
      v10 = livefs_std_log(v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10003D844(v7, v11);

    }
  }
  v12 = self;
  objc_sync_enter(v12);
  *(_WORD *)&v12->_is_killing_io = 0;
  objc_sync_exit(v12);

  -[mountEntry removeMountTask](v12, "removeMountTask");
  return 0;
}

- (id)unmount:(int)a3
{
  char v3;
  NSString *v5;
  NSString *v6;
  int *v7;
  uint64_t NSErrorFromLiveFSErrno;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  mountEntry *v12;
  unsigned int v13;
  id v14;
  uint64_t v15;
  int v16;
  NSString *v17;
  int *v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  BOOL v22;
  int v23;
  id v25;
  NSString *storageName;
  uint64_t v27;
  NSObject *v28;
  _BOOL4 v29;
  NSString *v30;
  NSObject *v31;
  const char *v32;
  uint32_t v33;
  uint64_t v34;
  NSObject *v35;
  NSString *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  mountEntry *v43;
  uint64_t v44;
  NSString *realMountPath;
  NSString *v47;
  id v48;
  uint8_t buf[4];
  NSString *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;

  v3 = a3;
  v5 = self->realMountPath;
  v6 = v5;
  if ((v3 & 2) == 0
    || (-[NSString isEqual:](v5, "isEqual:", CFSTR("/private/var/mobile/Library/LiveFiles")) & 1) != 0
    || !-[NSString hasPrefix:](v6, "hasPrefix:", CFSTR("/private/var/mobile/Library/LiveFiles"))
    || !fsctl(-[NSString fileSystemRepresentation](objc_retainAutorelease(v6), "fileSystemRepresentation"), 0x20006E04uLL, 0, 0))
  {
    v9 = 0;
    if ((v3 & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  v7 = __error();
  NSErrorFromLiveFSErrno = getNSErrorFromLiveFSErrno(*v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(NSErrorFromLiveFSErrno);
  v10 = livefs_std_log(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    sub_10003D934();

  if ((v3 & 4) != 0)
  {
LABEL_10:
    v12 = self;
    objc_sync_enter(v12);
    v12->_is_killing_io = 1;
    objc_sync_exit(v12);

  }
LABEL_11:
  v48 = v9;
  v13 = -[mountEntry isMountAtPath:err:](self, "isMountAtPath:err:", v6, &v48);
  v14 = v48;

  if ((v13 & 0x80000000) != 0)
  {
    v37 = livefs_std_log(v15);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      sub_10003D8D4();

    goto LABEL_39;
  }
  if (v13 != 1)
  {
LABEL_39:
    v39 = 0;
    goto LABEL_49;
  }
  v47 = v6;
  v16 = (v3 & 1) << 19;
  v17 = objc_retainAutorelease(v6);
  v18 = (int *)unmount(-[NSString fileSystemRepresentation](v17, "fileSystemRepresentation"), v16);
  if (!(_DWORD)v18)
    goto LABEL_34;
  v19 = 0;
  while (1)
  {
    v20 = v19;
    v18 = __error();
    v21 = *v18;
    v22 = (v3 & 1) != 0 && v21 == 35;
    v23 = v22;
    if (v22)
      ++v19;
    if (!v23 || v20 > 3)
      break;
    v25 = +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", 0.002);
    storageName = self->_storageName;
    v27 = livefs_std_log(v25);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
    if (storageName)
    {
      if (v29)
      {
        v30 = self->_storageName;
        *(_DWORD *)buf = 138412290;
        v50 = v30;
        v31 = v28;
        v32 = "unmount for %@ slept while looping";
        v33 = 12;
LABEL_32:
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, v32, buf, v33);
      }
    }
    else if (v29)
    {
      *(_WORD *)buf = 0;
      v31 = v28;
      v32 = "unmount for <unknown> slept while looping";
      v33 = 2;
      goto LABEL_32;
    }

    v18 = (int *)unmount(-[NSString fileSystemRepresentation](objc_retainAutorelease(v17), "fileSystemRepresentation"), (v3 & 1) << 19);
    if (!(_DWORD)v18)
      goto LABEL_34;
  }
  if ((v3 & 5) != 0 || !(_DWORD)v21)
  {
    if ((_DWORD)v21)
    {
      v44 = livefs_std_log(v18);
      v35 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        realMountPath = self->realMountPath;
        *(_DWORD *)buf = 138412802;
        v50 = realMountPath;
        v51 = 1024;
        v52 = v16;
        v53 = 1024;
        v54 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "unmount for %@ with %#x returned %{darwin.errno}d", buf, 0x18u);
      }
      goto LABEL_48;
    }
LABEL_34:
    v34 = livefs_std_log(v18);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = self->realMountPath;
      *(_DWORD *)buf = 138412802;
      v50 = v36;
      v51 = 1024;
      v52 = v16;
      v53 = 1024;
      v54 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "unmount for %@ with %#x returned %d", buf, 0x18u);
    }
LABEL_48:

    v39 = 0;
    v6 = v47;
    goto LABEL_49;
  }
  v40 = livefs_std_log(v18);
  v41 = objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v50 = v17;
    v51 = 1024;
    v52 = v16;
    v53 = 1024;
    v54 = v21;
    _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "unmount for %@ with %#x failed: %{darwin.errno}d]", buf, 0x18u);
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v21, 0));
  v43 = self;
  objc_sync_enter(v43);
  v43->_is_in_unmount_method = 0;
  objc_sync_exit(v43);

  v14 = v42;
  v39 = v14;
  v6 = v47;
LABEL_49:

  return v39;
}

- (void)forgetModuleVolumeWithFlags:(unsigned int)a3 reply:(id)a4
{
  void (**v6)(id, void *);
  _BOOL8 v7;
  fskitdExtensionInstance *instance;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  FSVolumeIdentifier *volumeID;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[6];
  id obj;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  const char *v37;

  v6 = (void (**)(id, void *))a4;
  v7 = -[mountEntry isFSKitModule](self, "isFSKitModule");
  if (!v7)
  {
    v13 = fskit_std_log(v7);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10003DA8C();
    goto LABEL_9;
  }
  instance = self->_instance;
  if (!instance)
  {
    v17 = fskit_std_log(0);
    v14 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10003D9A8();
LABEL_9:

    v15 = fs_errorForPOSIXError(22);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v6[2](v6, v16);

    goto LABEL_17;
  }
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_10002C0D0;
  v34 = sub_10002C0E0;
  v35 = 0;
  obj = 0;
  v9 = -[fskitdExtensionInstance newXPCConnectionWithError:](instance, "newXPCConnectionWithError:", &obj);
  objc_storeStrong(&v35, obj);
  if (v31[5])
  {
    v11 = fskit_std_log(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10003DA1C();

    v6[2](v6, (void *)v31[5]);
  }
  else
  {
    v18 = fskit_std_log(v10);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[mountEntry forgetModuleVolumeWithFlags:reply:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s: Creating FSModuleXPC sync proxy", buf, 0xCu);
    }

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000303F8;
    v28[3] = &unk_100055568;
    v28[4] = self;
    v28[5] = &v30;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v28));
    volumeID = self->_volumeID;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100030470;
    v27[3] = &unk_100054868;
    v27[4] = &v30;
    objc_msgSend(v20, "deactivateVolume:numericOptions:replyHandler:", volumeID, a3, v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
    objc_sync_enter(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[FSResource getResourceID](self->_resource, "getResourceID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "getResource:", v24));

    objc_msgSend(v25, "setState:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
    objc_msgSend(v26, "updateResource:", v25);

    objc_sync_exit(v22);
    -[FSResource revoke](self->_resource, "revoke");
    -[fskitdExtensionInstance terminate](self->_instance, "terminate");
    v6[2](v6, (void *)v31[5]);

  }
  _Block_object_dispose(&v30, 8);

LABEL_17:
}

- (BOOL)is_connected
{
  return self->_is_connected;
}

- (void)setIs_connected:(BOOL)a3
{
  self->_is_connected = a3;
}

- (BOOL)is_inet
{
  return self->_is_inet;
}

- (void)setIs_inet:(BOOL)a3
{
  self->_is_inet = a3;
}

- (BOOL)is_killing_io
{
  return self->_is_killing_io;
}

- (void)setIs_killing_io:(BOOL)a3
{
  self->_is_killing_io = a3;
}

- (BOOL)is_in_unmount_method
{
  return self->_is_in_unmount_method;
}

- (void)setIs_in_unmount_method:(BOOL)a3
{
  self->_is_in_unmount_method = a3;
}

- (BOOL)is_in_unmount_syscall
{
  return self->_is_in_unmount_syscall;
}

- (void)setIs_in_unmount_syscall:(BOOL)a3
{
  self->_is_in_unmount_syscall = a3;
}

- (unsigned)midx
{
  return self->_midx;
}

- (NSString)volumeName
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)fileSystem
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (NSString)storageName
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (NSString)providerName
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSString)mntOn
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (mountTable)mntTable
{
  return (mountTable *)objc_loadWeakRetained((id *)&self->_mntTable);
}

- (NSString)rootLIFileHandle
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (NSError)domainError
{
  return (NSError *)objc_getProperty(self, a2, 184, 1);
}

- (void)setDomainError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (unsigned)fileno
{
  return self->_fileno;
}

- (void)setFileno:(unsigned int)a3
{
  self->_fileno = a3;
}

- (int)mnt_flags
{
  return self->_mnt_flags;
}

- (BOOL)isFSKitModule
{
  return self->_isFSKitModule;
}

- (FSAuditToken)auditToken
{
  return (FSAuditToken *)objc_getProperty(self, a2, 192, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_domainError, 0);
  objc_storeStrong((id *)&self->_rootLIFileHandle, 0);
  objc_destroyWeak((id *)&self->_mntTable);
  objc_storeStrong((id *)&self->_mntOn, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_storageName, 0);
  objc_storeStrong((id *)&self->_fileSystem, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_volumeName, 0);
  objc_storeStrong((id *)&self->_volumeID, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_mountTaskUUID, 0);
  objc_storeStrong((id *)&self->lastConnectError, 0);
  objc_storeStrong((id *)&self->_theLock, 0);
  objc_storeStrong((id *)&self->_theConn, 0);
  objc_storeStrong((id *)&self->_fsObj, 0);
  objc_storeStrong((id *)&self->realMountPath, 0);
}

@end
