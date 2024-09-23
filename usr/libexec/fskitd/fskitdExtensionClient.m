@implementation fskitdExtensionClient

+ (void)postTaskStatusUpdate:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  unsigned int v47;
  __int16 v48;
  void *v49;

  v3 = a3;
  v4 = fskit_std_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "taskID"));
    v7 = objc_msgSend(v3, "taskState");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "taskPurpose"));
    *(_DWORD *)buf = 138412802;
    v45 = v6;
    v46 = 1024;
    v47 = v7;
    v48 = 2112;
    v49 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Got task update id %@ state %d purpose %@", buf, 0x1Cu);

  }
  v9 = v3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  objc_sync_enter(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "taskID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v12));

  if (v13)
  {
    v15 = objc_msgSend(v9, "taskState");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "taskErrorState"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "updatedDescriptionInState:error:", v15, v16));

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "taskID"));
    -[NSObject setObject:forKey:](v18, "setObject:forKey:", v17, v19);

  }
  else
  {
    v20 = fskit_std_log(v14);
    v18 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "taskID"));
      sub_10003A58C(v21, buf, v18);
    }
    v17 = v9;
  }

  objc_sync_exit(v10);
  if (v13)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "taskResource"));
    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "taskResource"));
      v24 = objc_msgSend(v23, "kind") == (id)1;

      if (v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "taskResource"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[FSBlockDeviceResource dynamicCast:](FSBlockDeviceResource, "dynamicCast:", v25));

        if (v26)
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "BSDName"));
        else
          v22 = 0;

      }
      else
      {
        v22 = 0;
      }
    }
    if (objc_msgSend(v9, "taskState") == 3)
    {
      v27 = (void *)qword_10005C720;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "taskID"));
      objc_msgSend(v27, "removeReferencesToTask:", v28);

      objc_msgSend((id)qword_10005C720, "taskSetChanged");
      if (v22)
      {
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_100017424;
        v41[3] = &unk_100055460;
        v42 = v9;
        v43 = v22;
        +[fskitdDAOperations setFSKitAdditions:disk:replyHandler:](fskitdDAOperations, "setFSKitAdditions:disk:replyHandler:", 0, v43, v41);

        v29 = v42;
LABEL_23:

      }
    }
    else if (v22)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "taskID"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "description"));
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v31, FSDADiskTaskIDKey);

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "taskPurpose"));
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v32, FSDADiskTaskPurposeKey);

      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "taskBundleID"));
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v33, FSDADiskTaskBundleIDKey);

      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "taskExtensionInstanceID"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "description"));
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v35, FSDADiskTaskExtensionInstanceKey);

      v36 = objc_msgSend(v9, "taskState");
      if (v36 <= 3)
        objc_msgSend(v29, "setObject:forKeyedSubscript:", *(_QWORD *)*(&off_1000554C8 + (char)v36), FSDADiskTaskStateKey);
      +[fskitdDAOperations setFSKitAdditions:disk:replyHandler:](fskitdDAOperations, "setFSKitAdditions:disk:replyHandler:", v29, v22, &stru_100055480);
      goto LABEL_23;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "taskUpdateClients"));
    objc_sync_enter(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "taskUpdateClients"));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000174A8;
    v39[3] = &unk_1000554A8;
    v40 = v17;
    objc_msgSend(v38, "enumerateObjectsUsingBlock:", v39);

    objc_sync_exit(v37);
  }

}

+ (void)closeResource:(id)a3 andRevoke:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  v5 = a3;
  v6 = fskit_std_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_10003A5E0(v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_msgSend(v9, "removeResource:", v5);

  objc_sync_exit(v8);
  if (v4)
  {
    objc_msgSend(v5, "revoke");
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FSBlockDeviceResource dynamicCast:](FSBlockDeviceResource, "dynamicCast:", v5));
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "terminate");

  }
}

- (void)terminateExtension
{
  -[fskitdExtensionInstance terminate](self->_ourInstance, "terminate");
}

- (void)taskStatusUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  fskitdExtensionInstance **p_ourInstance;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  fskitdExtensionInstance *v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "tasks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "taskID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v7));

  objc_sync_exit(v5);
  if (!v8)
  {
    v21 = fskit_std_log(v9);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_10003A668(v4);
    goto LABEL_14;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "taskExtensionInstanceID"));
  p_ourInstance = &self->_ourInstance;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[fskitdExtensionInstance instanceID](self->_ourInstance, "instanceID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fs_containerIdentifier"));
  v14 = objc_msgSend(v10, "isEqual:", v13);

  if ((v14 & 1) == 0)
  {
    v23 = fskit_std_log(v15);
    v22 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_10003A778(v4, (id *)p_ourInstance, v22);
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend((id)objc_opt_class(self), "postTaskStatusUpdate:", v4);
  if (objc_msgSend(v4, "taskState") == 3)
  {
    v16 = *p_ourInstance;
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "taskID"));
      -[fskitdExtensionInstance removeTaskID:](v16, "removeTaskID:", v17);

    }
    v18 = objc_msgSend(v8, "terminateExtensionWhenFinished");
    if ((_DWORD)v18)
    {
      v19 = fskit_std_log(v18);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        sub_10003A6F0(v4);

      -[fskitdExtensionClient terminateExtension](self, "terminateExtension");
    }
  }
LABEL_15:

}

- (void)wipeResource:(id)a3 includingRanges:(id)a4 excludingRanges:(id)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void (**v37)(id, void *);
  void *v38;
  uint64_t v39;
  NSObject *v40;
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
  void *v53;
  _QWORD v54[4];
  void (**v55)(id, void *);
  _QWORD v56[4];
  void (**v57)(id, void *);

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  v14 = fskit_std_log(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    sub_10003AAE0(v15, v16, v17, v18, v19, v20, v21, v22);

  if (!v10 || (v23 = objc_msgSend(v10, "kind"), v23 != (id)1))
  {
    v48 = fskit_std_log(v23);
    v49 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      sub_10003A85C(v49);
    goto LABEL_14;
  }
  v24 = fskit_std_log(1);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    sub_10003AA58(v10);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[fskitdExtensionInstance resourceIDs](self->_ourInstance, "resourceIDs"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getResourceID"));
  v28 = objc_msgSend(v26, "containsObject:", v27);

  if ((v28 & 1) == 0)
  {
    v51 = fskit_std_log(v29);
    v49 = objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      sub_10003A9D0(v10);
    goto LABEL_14;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  objc_sync_enter(v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C720, "resourceManager"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getResourceID"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "getResource:", v32));

  objc_sync_exit(v30);
  if (!v33)
  {
    v52 = fskit_std_log(v34);
    v49 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      sub_10003A8D8(v10);
LABEL_14:

    v50 = fs_errorForPOSIXError(22);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v50);
    v13[2](v13, v33);
    goto LABEL_15;
  }
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[FSBlockDeviceResource dynamicCast:](FSBlockDeviceResource, "dynamicCast:", v33));
  v35 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.fskit.fskit_helper"), 4096);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[FSKitConstants FSKitHelperProtocol](FSKitConstants, "FSKitHelperProtocol"));
  objc_msgSend(v35, "setRemoteObjectInterface:", v36);

  objc_msgSend(v35, "resume");
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_100017BB4;
  v56[3] = &unk_1000551E8;
  v37 = v13;
  v57 = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "remoteObjectProxyWithErrorHandler:", v56));
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_100017C20;
  v54[3] = &unk_1000551E8;
  v55 = v37;
  v39 = fskit_std_log(objc_msgSend(v38, "wipeFS:includingRanges:excludingRanges:replyHandler:", v53, v11, v12, v54));
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    sub_10003A960(v40, v41, v42, v43, v44, v45, v46, v47);

LABEL_15:
}

- (void)isVolumeIDUsed:(id)a3 bundle:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = fskit_std_log(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_10003AD0C(v12, v13, v14, v15, v16, v17, v18, v19);

  v20 = (void *)qword_10005C728;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[fskitdExtensionInstance initiatorAuditToken](self->_ourInstance, "initiatorAuditToken"));
  objc_msgSend(v20, "isVolumeIDUsed:bundle:user:replyHandler:", v10, v9, v21, v8);

  v23 = fskit_std_log(v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    sub_10003AC9C(v24, v25, v26, v27, v28, v29, v30, v31);

}

- (void)configureUserClient:(id)a3 replyHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  id v29;
  id v30;
  int v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  int v43;
  const char *v44;
  __int16 v45;
  unsigned int v46;
  __int16 v47;
  unsigned int v48;
  __int16 v49;
  unsigned int v50;
  __int16 v51;
  unsigned int v52;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = fskit_std_log(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10003ADEC(v9, v10, v11, v12, v13, v14, v15, v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[fskitdExtensionInstance attributes](self->_ourInstance, "attributes"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", FSModuleIdentityAttributeSupportsBlockResources));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[fskitdExtensionInstance attributes](self->_ourInstance, "attributes"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", FSModuleIdentityAttributeSupportsKOIO));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[fskitdExtensionInstance instanceAuditToken](self->_ourInstance, "instanceAuditToken"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[LiveFSUserClient defaultClient](LiveFSUserClient, "defaultClient"));
  v23 = fskit_std_log(v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = objc_msgSend(v21, "pid");
    v26 = objc_msgSend(v21, "pidversion");
    if (v18)
    {
      v27 = objc_msgSend(v18, "BOOLValue");
      if (v20)
      {
LABEL_6:
        v28 = objc_msgSend(v20, "BOOLValue");
LABEL_9:
        v43 = 136316162;
        v44 = "-[fskitdExtensionClient configureUserClient:replyHandler:]";
        v45 = 1024;
        v46 = v25;
        v47 = 1024;
        v48 = v26;
        v49 = 1024;
        v50 = v27;
        v51 = 1024;
        v52 = v28;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s: pid %d pidversion %d supportsBlockResources %d supportsKOIO %d", (uint8_t *)&v43, 0x24u);
        goto LABEL_10;
      }
    }
    else
    {
      v27 = 0;
      if (v20)
        goto LABEL_6;
    }
    v28 = 0;
    goto LABEL_9;
  }
LABEL_10:

  if (v18)
  {
    v29 = 0;
    if (objc_msgSend(v18, "BOOLValue") && v20)
      v29 = objc_msgSend(v20, "BOOLValue");
  }
  else
  {
    v29 = 0;
  }
  v30 = objc_msgSend(v22, "configureUserClient:pid:pidversion:supportKOIO:", objc_msgSend(v6, "machPort"), objc_msgSend(v21, "pid"), objc_msgSend(v21, "pidversion"), v29);
  v31 = (int)v30;
  v32 = fskit_std_log(v30);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    sub_10003AD7C(v33, v34, v35, v36, v37, v38, v39, v40);

  if (v31)
  {
    v41 = fs_errorForPOSIXError(102);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    v7[2](v7, v42);

  }
  else
  {
    v7[2](v7, 0);
  }

}

- (void)revokeResource:(id)a3 replyHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  NSObject *v9;
  fskitdExtensionInstance *ourInstance;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = fskit_std_log(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10003AEE0(v6);

  objc_msgSend((id)objc_opt_class(self), "closeResource:andRevoke:", v6, 1);
  ourInstance = self->_ourInstance;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getResourceID"));
  -[fskitdExtensionInstance removeResourceID:](ourInstance, "removeResourceID:", v11);

  v13 = fskit_std_log(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    sub_10003AE5C(v6);

  v7[2](v7, 0);
}

- (void)closeResource:(id)a3 replyHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  NSObject *v9;
  fskitdExtensionInstance *ourInstance;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = fskit_std_log(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10003AFE8(v6);

  objc_msgSend((id)objc_opt_class(self), "closeResource:andRevoke:", v6, 0);
  ourInstance = self->_ourInstance;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getResourceID"));
  -[fskitdExtensionInstance removeResourceID:](ourInstance, "removeResourceID:", v11);

  v13 = fskit_std_log(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    sub_10003AF64(v6);

  v7[2](v7, 0);
}

- (fskitdExtensionInstance)ourInstance
{
  return (fskitdExtensionInstance *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOurInstance:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ourInstance, 0);
}

@end
