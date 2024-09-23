@implementation fskitdAgentManager

- (fskitdAgentManager)init
{
  fskitdAgentManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *currentAgents;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)fskitdAgentManager;
  v2 = -[fskitdAgentManager init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    currentAgents = v2->_currentAgents;
    v2->_currentAgents = v3;

  }
  return v2;
}

- (id)getCurrentAgentForUID:(unsigned int)a3
{
  uint64_t v3;
  fskitdAgentManager *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  int v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id buf;

  v3 = *(_QWORD *)&a3;
  v4 = self;
  v5 = objc_sync_enter(v4);
  v6 = fskit_std_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "About to get current agent for %{darwin.uid}d", (uint8_t *)&buf, 8u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
  v9 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4->_currentAgents, "objectForKeyedSubscript:", v8));
  if (!v9)
  {
    v9 = objc_msgSend(objc_alloc((Class)FSAgentClient), "initToUser:", v3);
    if (v9)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_currentAgents, "setObject:forKeyedSubscript:", v9, v8);
      objc_initWeak(&buf, v4);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100016008;
      v13[3] = &unk_100055288;
      v13[4] = v4;
      objc_copyWeak(&v15, &buf);
      v14 = v8;
      objc_msgSend(v9, "setInterruptionHandler:", v13);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100016078;
      v11[3] = &unk_1000552A8;
      v12 = v3;
      objc_msgSend(v9, "setInstanceDeathHandler:", v11);
      v9 = v9;

      objc_destroyWeak(&v15);
      objc_destroyWeak(&buf);

    }
  }

  objc_sync_exit(v4);
  return v9;
}

- (id)getCurrentAgentForToken:(id)a3
{
  return -[fskitdAgentManager getCurrentAgentForUID:](self, "getCurrentAgentForUID:", objc_msgSend(a3, "ruid"));
}

- (void)currentExtensionsForToken:(id)a3 replyHandler:(id)a4
{
  void (**v5)(id, void *, _QWORD);
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v5 = (void (**)(id, void *, _QWORD))a4;
  v6 = fskit_std_log(objc_msgSend(a3, "isOurUID"));
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Getting own modules", v10, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C740, "currentExtensions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fs_map:", &stru_1000552E8));
  v5[2](v5, v9, 0);

}

- (void)setEnabledStateForToken:(id)a3 identifier:(id)a4 newState:(BOOL)a5 replyHandler:(id)a6
{
  _BOOL4 v6;
  void (**v9)(id, _QWORD);
  id v10;
  id v11;

  v6 = a5;
  v9 = (void (**)(id, _QWORD))a6;
  v10 = a4;
  objc_msgSend(a3, "isOurUID");
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10005C740, "moduleForBundleID:", v10));

  if (v6)
    objc_msgSend((id)qword_10005C740, "addBundleToEnableModules:", v11);
  else
    objc_msgSend((id)qword_10005C740, "removeBundleFromEnabledModules:", v11);
  v9[2](v9, 0);

}

- (void)currentExtensionForShortName:(id)a3 auditToken:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_100016458;
  v36 = sub_100016468;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_100016458;
  v30 = sub_100016468;
  v31 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100016470;
  v25[3] = &unk_100055338;
  v25[4] = &v26;
  v25[5] = &v32;
  -[fskitdAgentManager currentExtensionsForToken:replyHandler:](self, "currentExtensionsForToken:replyHandler:", v9, v25);
  if (v27[5])
  {
    v10[2](v10, 0);
  }
  else
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = sub_100016458;
    v23 = sub_100016468;
    v24 = 0;
    v11 = fs_errorForPOSIXError(3);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)v27[5];
    v27[5] = v12;

    v14 = (void *)v33[5];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000164DC;
    v15[3] = &unk_100055360;
    v16 = v8;
    v17 = &v19;
    v18 = &v26;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v15);
    ((void (*)(void (**)(id, _QWORD), uint64_t, uint64_t))v10[2])(v10, v20[5], v27[5]);

    _Block_object_dispose(&v19, 8);
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
}

- (void)startExtension:(id)a3 instanceID:(id)a4 uid:(unsigned int)a5 replyHandler:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = dispatch_group_create();
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[fskitdAgentManager getCurrentAgentForUID:](self, "getCurrentAgentForUID:", v7));
  dispatch_group_enter(v13);
  v16 = fskit_std_log(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v24 = v10;
    v25 = 2112;
    v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "About to call to fskit_agent, bundle ID %@, instanceUUID %@", buf, 0x16u);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100016754;
  v20[3] = &unk_100055388;
  v21 = v13;
  v22 = v12;
  v18 = v13;
  v19 = v12;
  objc_msgSend(v14, "startExtension:instanceID:replyHandler:", v10, v11, v20);
  dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)getNSXPCListenerEndpoint:(id)a3 instanceID:(id)a4 uid:(unsigned int)a5 replyHandler:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  uint8_t buf[16];

  v6 = *(_QWORD *)&a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = dispatch_group_create();
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[fskitdAgentManager getCurrentAgentForUID:](self, "getCurrentAgentForUID:", v6));
  dispatch_group_enter(v13);
  v16 = fskit_std_log(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "About to call to fskit_agent", buf, 2u);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100016934;
  v20[3] = &unk_1000553B0;
  v21 = v13;
  v22 = v10;
  v18 = v13;
  v19 = v10;
  objc_msgSend(v14, "getNSXPCListenerEndpoint:instanceID:replyHandler:", v12, v11, v20);

  dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)stopExtension:(id)a3 instanceID:(id)a4 uid:(unsigned int)a5 replyHandler:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  uint8_t buf[16];

  v6 = *(_QWORD *)&a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = dispatch_group_create();
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[fskitdAgentManager getCurrentAgentForUID:](self, "getCurrentAgentForUID:", v6));
  dispatch_group_enter(v13);
  v16 = fskit_std_log(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "About to call to fskit_agent", buf, 2u);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100016AF0;
  v20[3] = &unk_100055310;
  v21 = v13;
  v22 = v10;
  v18 = v13;
  v19 = v10;
  objc_msgSend(v14, "stopExtension:instanceID:replyHandler:", v12, v11, v20);

  dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
}

- (NSMutableDictionary)currentAgents
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCurrentAgents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAgents, 0);
}

@end
