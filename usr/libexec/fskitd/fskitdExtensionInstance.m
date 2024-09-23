@implementation fskitdExtensionInstance

- (id)initForBundle:(id)a3 user:(id)a4 instance:(id)a5
{
  id v8;
  id v9;
  id v10;
  fskitdExtensionInstance *v11;
  NSString *v12;
  NSString *bundleID;
  NSUUID *v14;
  NSUUID *instanceID;
  uint64_t v16;
  uint64_t v17;
  NSMutableArray *resourceIDs;
  uint64_t v19;
  uint64_t v20;
  NSMutableArray *volumeIDs;
  FSContainerIdentifier *v22;
  FSContainerIdentifier *containerID;
  uint64_t v24;
  uint64_t v25;
  NSMutableArray *taskIDs;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)fskitdExtensionInstance;
  v11 = -[fskitdExtensionInstance init](&v28, "init");
  if (v11)
  {
    v12 = (NSString *)objc_msgSend(v8, "copy");
    bundleID = v11->_bundleID;
    v11->_bundleID = v12;

    v11->_uid = getuid();
    v11->_ourUID = 1;
    v14 = (NSUUID *)objc_msgSend(v10, "copy");
    instanceID = v11->_instanceID;
    v11->_instanceID = v14;

    v17 = objc_opt_new(NSMutableArray, v16);
    resourceIDs = v11->_resourceIDs;
    v11->_resourceIDs = (NSMutableArray *)v17;

    v20 = objc_opt_new(NSMutableArray, v19);
    volumeIDs = v11->_volumeIDs;
    v11->_volumeIDs = (NSMutableArray *)v20;

    v22 = +[fskitdExtensionInstance newContainerID](fskitdExtensionInstance, "newContainerID");
    containerID = v11->_containerID;
    v11->_containerID = v22;

    v11->_running = 0;
    v25 = objc_opt_new(NSMutableArray, v24);
    taskIDs = v11->_taskIDs;
    v11->_taskIDs = (NSMutableArray *)v25;

    objc_storeStrong((id *)&v11->_initiatorAuditToken, a4);
  }

  return v11;
}

+ (id)newForBundle:(id)a3 user:(id)a4 instanceUUID:(id)a5 instanceID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc((Class)a1);
  if (v14)
  {
    v15 = objc_msgSend(v14, "initForBundle:user:instance:", v10, v11, v12);
    v16 = v15;
    if (v15)
    {
      if (objc_msgSend(v15, "isOurUID"))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C740, "configurationForInstance:ofBundle:", v13, v10));
        objc_msgSend(v16, "setInstanceConfig:", v17);

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "instanceConfig"));
        if (!v18)
          goto LABEL_9;
      }
      else
      {
        objc_msgSend(v16, "setBundleID:", v10);
        objc_msgSend(v16, "setInstanceUUID:", v12);
      }
    }
  }
  else
  {
    v16 = 0;
  }
  v16 = v16;
  v18 = v16;
LABEL_9:

  return v18;
}

+ (id)newWithDefaultInstanceForBundle:(id)a3 user:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FSModuleHost defaultInstanceUUID](FSModuleHost, "defaultInstanceUUID"));
  v9 = objc_msgSend(a1, "newForBundle:user:instance:", v7, v6, v8);

  return v9;
}

+ (id)newForBundle:(id)a3 user:(id)a4 instance:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)_EXExtensionInstanceIdentifier), "initWithIdentifier:", v8);
  v12 = objc_msgSend(a1, "newForBundle:user:instanceUUID:instanceID:", v10, v9, v8, v11);

  return v12;
}

- (void)dealloc
{
  NSXPCConnection *instanceConnection;
  NSXPCConnection *v4;
  objc_super v5;

  instanceConnection = self->_instanceConnection;
  if (instanceConnection)
  {
    -[NSXPCConnection invalidate](instanceConnection, "invalidate");
    v4 = self->_instanceConnection;
    self->_instanceConnection = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)fskitdExtensionInstance;
  -[fskitdExtensionInstance dealloc](&v5, "dealloc");
}

- (void)weDied
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  FSContainerIdentifier *containerID;
  fskitdExtensionInstance *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *taskIDs;
  _EXExtensionProcess *instanceProc;
  _EXExtensionProcess *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void *v22;
  id v23;
  fskitdExtensionInstance *v24;
  uint8_t buf[4];
  FSContainerIdentifier *v26;

  v3 = fs_errorForPOSIXError(3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = fskit_std_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    containerID = self->_containerID;
    *(_DWORD *)buf = 138412290;
    v26 = containerID;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Boom!🤯 Instance %@ died", buf, 0xCu);
  }

  v8 = self;
  objc_sync_enter(v8);
  v9 = v8->_taskIDs;
  v11 = objc_opt_new(NSMutableArray, v10);
  taskIDs = v8->_taskIDs;
  v8->_taskIDs = (NSMutableArray *)v11;

  instanceProc = v8->_instanceProc;
  v8->_instanceProc = 0;
  v14 = instanceProc;

  v8->_running = 0;
  objc_sync_exit(v8);

  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_100032124;
  v22 = &unk_100055EA0;
  v23 = v4;
  v24 = v8;
  v15 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](v9, "enumerateObjectsUsingBlock:", &v19);

  v17 = fskit_std_log(v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Death came for them", buf, 2u);
  }

  objc_msgSend((id)qword_10005C728, "cleanUpInstance:", v8, v19, v20, v21, v22);
}

- (id)errorFromStartingProc
{
  fskitdExtensionInstance *v2;
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  FSContainerIdentifier *containerID;
  uint64_t v15;
  NSString *bundleID;
  NSUUID *instanceUUID;
  uint64_t uid;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  FSContainerIdentifier *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  BOOL v28;
  id v29;
  fskitdExtensionInstance *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  BKSAssertion *v38;
  NSObject *instanceMemoryAssertion;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[7];
  id location;
  id *p_location;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _OWORD v64[2];
  id obj;
  _QWORD v66[4];
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint8_t v74[4];
  FSContainerIdentifier *v75;
  __int16 v76;
  uint64_t v77;
  _BYTE buf[24];
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;

  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = sub_1000327E4;
  v72 = sub_1000327F4;
  v73 = 0;
  v2 = self;
  objc_sync_enter(v2);
  v3 = !v2->_running;
  objc_sync_exit(v2);

  if (!v3)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
LABEL_3:
    v8 = 0;
    goto LABEL_4;
  }
  if (v2->_ourUID)
  {
    objc_initWeak(&location, v2);
    v6 = -[_EXHostConfiguration copy](v2->_instanceConfig, "copy");
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_1000327FC;
    v66[3] = &unk_100054DB0;
    objc_copyWeak(&v67, &location);
    objc_msgSend(v6, "setInterruptionHandler:", v66);
    v10 = (id *)(v69 + 5);
    obj = (id)v69[5];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[_EXExtensionProcess extensionProcessWithConfiguration:error:](_EXExtensionProcess, "extensionProcessWithConfiguration:error:", v6, &obj));
    objc_storeStrong(v10, obj);
    if (v69[5])
    {
      v12 = fskit_std_log(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        containerID = v2->_containerID;
        v15 = v69[5];
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = containerID;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failed to start instance %@: %@", buf, 0x16u);
      }

      v8 = (id)v69[5];
      objc_destroyWeak(&v67);
      objc_destroyWeak(&location);
      v4 = 0;
      v5 = 0;
      goto LABEL_4;
    }
    v25 = objc_msgSend(v7, "rbs_pid");
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[_EXHostConfiguration extensionIdentity](v2->_instanceConfig, "extensionIdentity"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "attributes"));

    if (v7)
      objc_msgSend(v7, "auditToken");
    else
      memset(v64, 0, sizeof(v64));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FSAuditToken tokenWithToken:](FSAuditToken, "tokenWithToken:", v64));
    objc_destroyWeak(&v67);
    objc_destroyWeak(&location);
LABEL_21:
    v30 = v2;
    objc_sync_enter(v30);
    if (v2->_running)
    {
      objc_sync_exit(v30);

      goto LABEL_3;
    }
    v2->_running = 1;
    objc_storeStrong((id *)&v30->_instanceProc, v7);
    v30->_pid = (int)v25;
    objc_storeStrong((id *)&v30->_attributes, v5);
    objc_storeStrong((id *)&v30->_instanceAuditToken, v4);
    objc_sync_exit(v30);

    v32 = fskit_std_log(v31);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = (_DWORD)v25;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "About to grab assertion on pid %d", buf, 8u);
    }

    v34 = objc_alloc((Class)BKSProcessAssertion);
    v35 = objc_msgSend(v34, "initWithPID:flags:reason:name:", v25, 14, 13, CFSTR("com.apple.extension.session"));

    if (v35)
    {
      v37 = objc_msgSend(v35, "acquire");
      if ((v37 & 1) == 0)
      {
        v48 = fskit_std_log(v37);
        v49 = objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          sub_10003DCAC(v49, v50, v51, v52, v53, v54, v55, v56);

        objc_msgSend(v35, "invalidate");
        goto LABEL_34;
      }
      v38 = (BKSAssertion *)v35;
      instanceMemoryAssertion = v30->_instanceMemoryAssertion;
      v30->_instanceMemoryAssertion = v38;
    }
    else
    {
      v40 = fskit_std_log(v36);
      instanceMemoryAssertion = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(instanceMemoryAssertion, OS_LOG_TYPE_ERROR))
        sub_10003DC78(instanceMemoryAssertion, v41, v42, v43, v44, v45, v46, v47);
    }

LABEL_34:
    goto LABEL_3;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v79 = sub_1000327E4;
  v80 = sub_1000327F4;
  v81 = 0;
  location = 0;
  p_location = &location;
  v60 = 0x3032000000;
  v61 = sub_1000327E4;
  v62 = sub_1000327F4;
  v63 = 0;
  bundleID = v2->_bundleID;
  instanceUUID = v2->_instanceUUID;
  uid = v2->_uid;
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_10003282C;
  v57[3] = &unk_100055EC8;
  v57[4] = buf;
  v57[5] = &location;
  v57[6] = &v68;
  v19 = objc_msgSend((id)qword_10005C748, "startExtension:instanceID:uid:replyHandler:", bundleID, instanceUUID, uid, v57);
  v20 = v69[5];
  if (v20)
  {
    v21 = fskit_std_log(v19);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v2->_containerID;
      v24 = v69[5];
      *(_DWORD *)v74 = 138412546;
      v75 = v23;
      v76 = 2112;
      v77 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Failed to start instance %@: %@", v74, 0x16u);
    }

    v25 = 0;
    v4 = 0;
    v5 = 0;
    v26 = (id)v69[5];
    v8 = v26;
  }
  else
  {
    v25 = objc_msgSend(p_location[5], "pid");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "attributes"));
    v8 = 0;
    v26 = p_location[5];
    v4 = v26;
  }
  v28 = v20 == 0;
  v29 = v26;
  _Block_object_dispose(&location, 8);

  _Block_object_dispose(buf, 8);
  v6 = 0;
  v7 = 0;
  if (v28)
    goto LABEL_21;
LABEL_4:

  _Block_object_dispose(&v68, 8);
  return v8;
}

- (id)newXPCConnectionWithError:(id *)a3
{
  fskitdExtensionInstance *v4;
  NSXPCConnection *instanceConnection;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSXPCConnection *v13;
  uint64_t v14;
  NSString *bundleID;
  NSUUID *instanceUUID;
  uint64_t uid;
  void *v18;
  id v19;
  NSXPCConnection *v20;
  NSXPCConnection *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSXPCConnection *v25;
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  NSXPCConnection *v41;

  v4 = self;
  objc_sync_enter(v4);
  if (!v4->_running)
  {
    if (a3)
    {
      v14 = fs_errorForPOSIXError(76);
      v13 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue(v14);
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  instanceConnection = v4->_instanceConnection;
  if (!instanceConnection)
  {
    if (v4->_ourUID)
    {
      v6 = (NSXPCConnection *)-[_EXExtensionProcess newXPCConnectionWithError:](v4->_instanceProc, "newXPCConnectionWithError:", a3);
      v7 = v4->_instanceConnection;
      v4->_instanceConnection = v6;

LABEL_5:
      instanceConnection = v4->_instanceConnection;
      if (instanceConnection)
      {
        v8 = instanceConnection;
        v10 = (void *)objc_opt_new(fskitdExtensionClient, v9);
        objc_msgSend(v10, "setOurInstance:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[FSKitConstants FSModuleExtensionXPCProtocol](FSKitConstants, "FSModuleExtensionXPCProtocol"));
        -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v11);

        -[NSXPCConnection setExportedObject:](v8, "setExportedObject:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[FSKitConstants FSModuleExtensionHostXPCProtocol](FSKitConstants, "FSModuleExtensionHostXPCProtocol"));
        -[NSXPCConnection setExportedInterface:](v8, "setExportedInterface:", v12);

        -[NSXPCConnection resume](v8, "resume");
        instanceConnection = v4->_instanceConnection;
      }
      goto LABEL_7;
    }
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = sub_1000327E4;
    v38 = sub_1000327F4;
    v39 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = sub_1000327E4;
    v32 = sub_1000327F4;
    v33 = 0;
    bundleID = v4->_bundleID;
    instanceUUID = v4->_instanceUUID;
    uid = v4->_uid;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100032BD8;
    v27[3] = &unk_100055CA8;
    v27[4] = &v34;
    v27[5] = &v28;
    objc_msgSend((id)qword_10005C748, "getNSXPCListenerEndpoint:instanceID:uid:replyHandler:", bundleID, instanceUUID, uid, v27);
    v18 = (void *)v29[5];
    if (v18)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v18);
    }
    else
    {
      v19 = objc_alloc((Class)NSXPCConnection);
      v20 = (NSXPCConnection *)objc_msgSend(v19, "initWithListenerEndpoint:", v35[5]);
      v21 = v4->_instanceConnection;
      v4->_instanceConnection = v20;

      v23 = fskit_std_log(v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v4->_instanceConnection;
        *(_DWORD *)buf = 138412290;
        v41 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "non-ours instance connection got %@", buf, 0xCu);
      }

    }
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v34, 8);
    if (!v18)
      goto LABEL_5;
LABEL_17:
    v13 = 0;
    goto LABEL_18;
  }
LABEL_7:
  v13 = instanceConnection;
LABEL_18:
  objc_sync_exit(v4);

  return v13;
}

- (void)terminate
{
  void *v3;
  void *v4;
  id v5;
  uint64_t pid;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _EXExtensionProcess *instanceProc;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[fskitdExtensionInstance resourceIDs](self, "resourceIDs"));
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &stru_100055EE8);

  objc_sync_exit(v3);
  if (self->_running)
  {
    if (!self->_ourUID)
      v5 = objc_msgSend((id)qword_10005C748, "stopExtension:instanceID:uid:replyHandler:", self->_bundleID, self->_instanceUUID, self->_uid, &stru_100055F08);
    pid = self->_pid;
    v7 = fskit_std_log(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_10003DDD8(pid, v8);

    v9 = objc_alloc_init((Class)RBSTerminateContext);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Request to terminate instance process (%d)"), pid));
    objc_msgSend(v9, "setExplanation:", v10);

    v11 = objc_alloc((Class)RBSTerminateRequest);
    v12 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", pid));
    v13 = objc_msgSend(v11, "initWithProcessIdentifier:context:", v12, v9);

    v29 = 0;
    LOBYTE(v12) = objc_msgSend(v13, "execute:", &v29);
    v14 = v29;
    v15 = v14;
    if ((v12 & 1) == 0)
    {
      v16 = fskit_std_log(v14);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        sub_10003DD50(v15);

    }
    instanceProc = self->_instanceProc;
    self->_instanceProc = 0;

    v20 = fskit_std_log(v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      sub_10003DCE0(v21, v22, v23, v24, v25, v26, v27, v28);

  }
}

+ (id)dynamicCast:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)addResourceID:(id)a3
{
  NSMutableArray *v4;
  id v5;

  v5 = a3;
  v4 = self->_resourceIDs;
  objc_sync_enter(v4);
  if ((-[NSMutableArray containsObject:](self->_resourceIDs, "containsObject:", v5) & 1) == 0)
    -[NSMutableArray addObject:](self->_resourceIDs, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)removeResourceID:(id)a3
{
  NSMutableArray *v4;
  id v5;

  v5 = a3;
  v4 = self->_resourceIDs;
  objc_sync_enter(v4);
  if (-[NSMutableArray containsObject:](self->_resourceIDs, "containsObject:", v5))
    -[NSMutableArray removeObject:](self->_resourceIDs, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)addVolumeID:(id)a3
{
  NSMutableArray *v4;
  id v5;

  v5 = a3;
  v4 = self->_volumeIDs;
  objc_sync_enter(v4);
  if ((-[NSMutableArray containsObject:](self->_volumeIDs, "containsObject:", v5) & 1) == 0)
    -[NSMutableArray addObject:](self->_volumeIDs, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)removeVolumeID:(id)a3
{
  NSMutableArray *v4;
  id v5;

  v5 = a3;
  v4 = self->_volumeIDs;
  objc_sync_enter(v4);
  if (-[NSMutableArray containsObject:](self->_volumeIDs, "containsObject:", v5))
    -[NSMutableArray removeObject:](self->_volumeIDs, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)addTaskID:(id)a3
{
  NSMutableArray *v4;
  id v5;

  v5 = a3;
  v4 = self->_taskIDs;
  objc_sync_enter(v4);
  if ((-[NSMutableArray containsObject:](self->_taskIDs, "containsObject:", v5) & 1) == 0)
    -[NSMutableArray addObject:](self->_taskIDs, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)removeTaskID:(id)a3
{
  NSMutableArray *v4;
  id v5;

  v5 = a3;
  v4 = self->_taskIDs;
  objc_sync_enter(v4);
  if (-[NSMutableArray containsObject:](self->_taskIDs, "containsObject:", v5))
    -[NSMutableArray removeObject:](self->_taskIDs, "removeObject:", v5);
  objc_sync_exit(v4);

}

+ (id)newContainerID
{
  return (id)objc_opt_new(FSContainerIdentifier, a2);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSUUID)instanceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInstanceUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSUUID)instanceID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (FSContainerIdentifier)containerID
{
  return (FSContainerIdentifier *)objc_getProperty(self, a2, 56, 1);
}

- (void)setContainerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (FSAuditToken)initiatorAuditToken
{
  return (FSAuditToken *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInitiatorAuditToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (FSAuditToken)instanceAuditToken
{
  return (FSAuditToken *)objc_getProperty(self, a2, 72, 1);
}

- (unsigned)uid
{
  return self->_uid;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (NSMutableArray)resourceIDs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setResourceIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMutableArray)volumeIDs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setVolumeIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSXPCConnection)instanceConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInstanceConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BKSAssertion)instanceMemoryAssertion
{
  return (BKSAssertion *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInstanceMemoryAssertion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSMutableArray)taskIDs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTaskIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BOOL)isOurUID
{
  return self->_ourUID;
}

- (int)pid
{
  return self->_pid;
}

- (_EXHostConfiguration)instanceConfig
{
  return (_EXHostConfiguration *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInstanceConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (_EXExtensionProcess)instanceProc
{
  return (_EXExtensionProcess *)objc_getProperty(self, a2, 128, 1);
}

- (void)setInstanceProc:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceProc, 0);
  objc_storeStrong((id *)&self->_instanceConfig, 0);
  objc_storeStrong((id *)&self->_taskIDs, 0);
  objc_storeStrong((id *)&self->_instanceMemoryAssertion, 0);
  objc_storeStrong((id *)&self->_instanceConnection, 0);
  objc_storeStrong((id *)&self->_volumeIDs, 0);
  objc_storeStrong((id *)&self->_resourceIDs, 0);
  objc_storeStrong((id *)&self->_instanceAuditToken, 0);
  objc_storeStrong((id *)&self->_initiatorAuditToken, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_instanceUUID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
