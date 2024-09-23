@implementation BKTouchEventServer

- (void)setSceneHostSettings:(id)a3 forContextID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  _BKSceneHostClientRecord *v16;
  id v17;
  NSMutableDictionary *sceneHostSettings;
  NSMutableDictionary *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  unsigned int v29;
  BKTouchEventServer *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  _BYTE v35[14];
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](BSServiceConnection, "currentContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "remoteProcess"));
  v32 = 0u;
  v33 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "auditToken"));
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "realToken");
  }
  else
  {
    v32 = 0u;
    v33 = 0u;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKSystemShellSentinel sharedInstance](BKSystemShellSentinel, "sharedInstance"));
  v13 = objc_msgSend(v12, "auditTokenRepresentsSystemApp:", &v32);

  if ((v13 & 1) != 0)
  {
    v15 = objc_claimAutoreleasedReturnValue(-[BKHIDDomainServiceServer userInfoForConnection:](self->_server, "userInfoForConnection:", v8));
    v16 = (_BKSceneHostClientRecord *)v15;
    if (v6 && !v15)
    {
      v16 = objc_alloc_init(_BKSceneHostClientRecord);
      -[BKHIDDomainServiceServer setUserInfo:forConnection:](self->_server, "setUserInfo:forConnection:", v16, v8);
      v17 = objc_alloc_init((Class)NSMutableDictionary);
      if (v16)
        objc_storeStrong((id *)&v16->_sceneHostSettings, v17);

    }
    if (v16)
      sceneHostSettings = v16->_sceneHostSettings;
    else
      sceneHostSettings = 0;
    v19 = sceneHostSettings;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v19, "objectForKey:", v7));
    v21 = BSEqualObjects(v20, v6);
    if ((v21 & 1) == 0)
    {
      v22 = BKLogTouchEvents(v21);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v29 = objc_msgSend(v7, "unsignedIntValue");
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
        v24 = NSStringFromBKSSceneHostTouchBehavior(objc_msgSend(v20, "touchBehavior"));
        v30 = self;
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        v26 = NSStringFromBKSSceneHostTouchBehavior(objc_msgSend(v6, "touchBehavior"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v35 = v29;
        *(_WORD *)&v35[4] = 2114;
        *(_QWORD *)&v35[6] = v31;
        v36 = 2114;
        v37 = v25;
        v38 = 2114;
        v39 = v27;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "new scene host settings: contextID:%X <%{public}@> %{public}@ -> %{public}@", buf, 0x26u);

        self = v30;
      }

      if (v6)
        -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v6, v7);
      else
        -[NSMutableDictionary removeObjectForKey:](v19, "removeObjectForKey:", v7);
      -[BKTouchEventServer _updateSceneHostSettings](self, "_updateSceneHostSettings");
    }

  }
  else
  {
    v28 = BKLogTouchEvents(v14);
    v16 = (_BKSceneHostClientRecord *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v35 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, &v16->super, OS_LOG_TYPE_ERROR, "non-shell process cannot modify scene host settings: %{public}@", buf, 0xCu);
    }
  }

}

- (void)_updateSceneHostSettings
{
  id v3;
  BKHIDDomainServiceServer *server;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  server = self->_server;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100018B08;
  v7[3] = &unk_1000EAC70;
  v8 = v3;
  v5 = v3;
  -[BKHIDDomainServiceServer enumerateUserInfoWithBlock:](server, "enumerateUserInfoWithBlock:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayController sharedInstance](BKDisplayController, "sharedInstance"));
  objc_msgSend(v6, "setSceneHostSettings:", v5);

}

- (BKTouchEventServer)init
{
  BKTouchEventServer *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  BKHIDDomainServiceServer *v7;
  BKHIDDomainServiceServer *server;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKTouchEventServer;
  v2 = -[BKTouchEventServer init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)BKHIDDomainServiceServer);
    v4 = BKSTouchEventBSServiceName;
    v5 = BKLogTouchEvents(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (BKHIDDomainServiceServer *)objc_msgSend(v3, "initWithDelegate:serverTarget:serverProtocol:clientProtocol:serviceName:queue:log:entitlement:", v2, v2, &OBJC_PROTOCOL___BKSTouchEventServer_IPC, &OBJC_PROTOCOL___BKSTouchEventClient_IPC, v4, 0, v6, 0);
    server = v2->_server;
    v2->_server = v7;

    -[BKHIDDomainServiceServer activate](v2->_server, "activate");
  }
  return v2;
}

- (id)transform3DForDisplayUUID:(id)a3 layerID:(id)a4 contextID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v24;
  void *v25;
  _OWORD v26[8];
  uint8_t buf[32];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](BSServiceConnection, "currentContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteProcess"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "auditToken"));
  v13 = BKLayerTransformLookupEntitlement;
  v14 = objc_msgSend(v12, "hasEntitlement:", BKLayerTransformLookupEntitlement);

  if ((v14 & 1) != 0)
  {
    if (v7)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CAWindowServer serverIfRunning](CAWindowServer, "serverIfRunning"));
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "displayWithUniqueId:", v7));

    }
    else
    {
      v20 = sub_10000F6DC();
      v17 = objc_claimAutoreleasedReturnValue(v20);
    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    memset(buf, 0, sizeof(buf));
    v21 = objc_msgSend(v8, "unsignedLongLongValue");
    v22 = objc_msgSend(v9, "unsignedIntValue");
    if (v17)
    {
      -[NSObject transformFromLayerId:inContextId:](v17, "transformFromLayerId:inContextId:", v21, v22);
    }
    else
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      memset(buf, 0, sizeof(buf));
    }
    v19 = objc_alloc_init((Class)_BKSCATransform3DContainer);
    v26[4] = v30;
    v26[5] = v31;
    v26[6] = v32;
    v26[7] = v33;
    v26[0] = *(_OWORD *)buf;
    v26[1] = *(_OWORD *)&buf[16];
    v26[2] = v28;
    v26[3] = v29;
    objc_msgSend(v19, "setTransform:", v26);
  }
  else
  {
    v18 = BKLogTouchEvents(v15);
    v17 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v24 = BSProcessDescriptionForPID(objc_msgSend(v11, "pid"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "process '%{public}@' must have entitlement %{public}@ to look up CA transforms", buf, 0x16u);

    }
    v19 = 0;
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
}

@end
