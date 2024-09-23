@implementation MOPersonalizedSensingServiceManager

+ (BOOL)isServiceDeployed
{
  return !+[MOPlatformInfo isIpad](MOPlatformInfo, "isIpad");
}

- (void)createConnection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint8_t buf[16];

  if (+[MOPersonalizedSensingServiceManager isServiceDeployed](MOPersonalizedSensingServiceManager, "isServiceDeployed"))
  {
    connection = self->_connection;
    if (connection)
    {
      self->_connection = 0;

    }
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.PersonalizedSensingService"));
    v5 = self->_connection;
    self->_connection = v4;

    if (self->_connection)
    {
      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2572E0DD0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BDBCF20];
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      v13 = objc_opt_class();
      v14 = objc_opt_class();
      objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_fetchPersonalizedContextWithOptions_withReply_, 0, 1);

      v16 = (void *)MEMORY[0x24BDBCF20];
      v17 = objc_opt_class();
      v18 = objc_opt_class();
      v19 = objc_opt_class();
      v20 = objc_opt_class();
      v21 = objc_opt_class();
      v22 = objc_opt_class();
      v23 = objc_opt_class();
      objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v20, v21, v22, v23, objc_opt_class(), 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_notifyContextFeedback_withReply_, 0, 1);

      -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);
      -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_0);
      -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", &__block_literal_global_35);
      -[NSXPCConnection activate](self->_connection, "activate");

    }
    _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_243AAA000, v25, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,createConnection successful", buf, 2u);
    }

  }
}

void __55__MOPersonalizedSensingServiceManager_createConnection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_243AAA000, v0, OS_LOG_TYPE_DEFAULT, "Connection to XPC service interrupted", v1, 2u);
  }

}

void __55__MOPersonalizedSensingServiceManager_createConnection__block_invoke_34()
{
  NSObject *v0;
  uint8_t v1[16];

  _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_243AAA000, v0, OS_LOG_TYPE_DEFAULT, "Connection to XPC service invalidated", v1, 2u);
  }

}

- (MOPersonalizedSensingServiceManager)init
{
  MOPersonalizedSensingServiceManager *v2;
  id v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MOPersonalizedSensingServiceManager;
  v2 = -[MOPersonalizedSensingServiceManager init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MOPersonalizedSensingServiceManager, %p"), v2);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    -[MOPersonalizedSensingServiceManager createConnection](v2, "createConnection");
  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  OS_dispatch_queue *queue;
  objc_super v6;
  uint8_t buf[16];

  _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_243AAA000, v3, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,dealloc", buf, 2u);
  }

  -[MOPersonalizedSensingServiceManager connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[MOPersonalizedSensingServiceManager setConnection:](self, "setConnection:", 0);
  queue = self->_queue;
  if (queue)
  {
    self->_queue = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)MOPersonalizedSensingServiceManager;
  -[MOPersonalizedSensingServiceManager dealloc](&v6, sel_dealloc);
}

- (void)_fetchPersonalizedSyncContextWithOptions:(id)a3 withReply:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = _fetchPersonalizedSyncContextWithOptions_withReply__onceToken;
  v6 = a4;
  v7 = a3;
  v9 = v7;
  if (v5 == -1)
  {
    v8 = v7;
  }
  else
  {
    dispatch_once(&_fetchPersonalizedSyncContextWithOptions_withReply__onceToken, &__block_literal_global_42);
    v8 = v9;
  }
  objc_msgSend((id)_fetchPersonalizedSyncContextWithOptions_withReply__fetchSyncReader, "loadPersonalizedContextWithOptions:withReply:", v8, v6);

}

void __90__MOPersonalizedSensingServiceManager__fetchPersonalizedSyncContextWithOptions_withReply___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_fetchPersonalizedSyncContextWithOptions_withReply__fetchSyncReader;
  _fetchPersonalizedSyncContextWithOptions_withReply__fetchSyncReader = v0;

}

- (void)fetchPersonalizedContextWithOptions:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSXPCConnection *connection;
  id *v12;
  uint64_t v13;
  NSXPCConnection *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_243AAA000, v8, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,fetchPersonalizedContextWithOptions", buf, 2u);
  }

  if (!+[MOPersonalizedSensingServiceManager isServiceDeployed](MOPersonalizedSensingServiceManager, "isServiceDeployed"))
  {
    -[MOPersonalizedSensingServiceManager _fetchPersonalizedSyncContextWithOptions:withReply:](self, "_fetchPersonalizedSyncContextWithOptions:withReply:", v6, v7);
    goto LABEL_14;
  }
  v9 = objc_msgSend(v6, "contextRetrieval");
  v10 = MEMORY[0x24BDAC760];
  if (v9 == 1)
  {
    connection = self->_connection;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __85__MOPersonalizedSensingServiceManager_fetchPersonalizedContextWithOptions_withReply___block_invoke;
    v21[3] = &unk_251442778;
    v12 = &v22;
    v22 = v7;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v6, "contextRetrieval") != 2)
    {
      v15 = 0;
      goto LABEL_11;
    }
    v14 = self->_connection;
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __85__MOPersonalizedSensingServiceManager_fetchPersonalizedContextWithOptions_withReply___block_invoke_45;
    v19[3] = &unk_251442778;
    v12 = &v20;
    v20 = v7;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v14, "remoteObjectProxyWithErrorHandler:", v19);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v13;

LABEL_11:
  _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_243AAA000, v16, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,calling fetchPersonalizedContextWithOptions", buf, 2u);
  }

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __85__MOPersonalizedSensingServiceManager_fetchPersonalizedContextWithOptions_withReply___block_invoke_46;
  v17[3] = &unk_2514427A0;
  v18 = v7;
  objc_msgSend(v15, "fetchPersonalizedContextWithOptions:withReply:", v6, v17);

LABEL_14:
}

void __85__MOPersonalizedSensingServiceManager_fetchPersonalizedContextWithOptions_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134349571;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2113;
    v13 = v7;
    _os_log_impl(&dword_243AAA000, v4, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,fetchPersonalizedContextWithOptions,XPCService synchronous error,%{public}lld,domain,%{public}@,description,\"%{private}@\", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __85__MOPersonalizedSensingServiceManager_fetchPersonalizedContextWithOptions_withReply___block_invoke_45(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134349571;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2113;
    v13 = v7;
    _os_log_impl(&dword_243AAA000, v4, OS_LOG_TYPE_INFO, "PersonalizedSensingServiceManager,fetchPersonalizedContextWithOptions,XPCService asynchronous error,%{public}lld,domain,%{public}@,description,\"%{private}@\", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __85__MOPersonalizedSensingServiceManager_fetchPersonalizedContextWithOptions_withReply___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v13 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "contextIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "contextStrings");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v20 = v11;
          v21 = 2112;
          v22 = v12;
          _os_log_impl(&dword_243AAA000, v10, OS_LOG_TYPE_DEFAULT, "PSServiceMgr, id, %@, contextString, %@", buf, 0x16u);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v6);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)notifyContextFeedback:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_243AAA000, v8, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,notifyContextFeedback", buf, 2u);
  }

  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_48);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_243AAA000, v10, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,calling notifyContextFeedback", buf, 2u);
  }

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__MOPersonalizedSensingServiceManager_notifyContextFeedback_withReply___block_invoke_49;
  v12[3] = &unk_251442808;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v9, "notifyContextFeedback:withReply:", v7, v12);

}

void __71__MOPersonalizedSensingServiceManager_notifyContextFeedback_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "code");
    objc_msgSend(v2, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134349571;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    v11 = 2113;
    v12 = v6;
    _os_log_impl(&dword_243AAA000, v3, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,notifyContextFeedback,XPCService synchronous error,%{public}lld,domain,%{public}@,description,\"%{private}@\", (uint8_t *)&v7, 0x20u);

  }
}

void __71__MOPersonalizedSensingServiceManager_notifyContextFeedback_withReply___block_invoke_49(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218242;
    v8 = a2;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_243AAA000, v6, OS_LOG_TYPE_DEFAULT, "PSServiceMgr, notifyContextFeedback, result, %lu, error, %@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestDBAccessForPersonalizedSensingServiceWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  NSXPCConnection *connection;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  v4 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_243AAA000, v5, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,requestDBAccessForPersonalizedSensingService", buf, 2u);
  }

  connection = self->_connection;
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __93__MOPersonalizedSensingServiceManager_requestDBAccessForPersonalizedSensingServiceWithReply___block_invoke;
  v14[3] = &unk_251442778;
  v8 = v4;
  v15 = v8;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_243AAA000, v10, OS_LOG_TYPE_DEFAULT, "PSServiceMgr,calling requestDBAccessForPersonalizedSensingService", buf, 2u);
  }

  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __93__MOPersonalizedSensingServiceManager_requestDBAccessForPersonalizedSensingServiceWithReply___block_invoke_51;
  v12[3] = &unk_251442830;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v9, "requestDBAccessForPersonalizedSensingServiceWithReply:", v12);

}

void __93__MOPersonalizedSensingServiceManager_requestDBAccessForPersonalizedSensingServiceWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134349571;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2113;
    v13 = v7;
    _os_log_impl(&dword_243AAA000, v4, OS_LOG_TYPE_INFO, "PersonalizedSensingServiceManager,requestDBAccessForPersonalizedSensingService,XPCService asynchronous error,%{public}lld,domain,%{public}@,description,\"%{private}@\", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __93__MOPersonalizedSensingServiceManager_requestDBAccessForPersonalizedSensingServiceWithReply___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)primeService
{
  OUTLINED_FUNCTION_0(&dword_243AAA000, a2, a3, "Failed to submit task with error: %@", a5, a6, a7, a8, 2u);
}

uint64_t __51__MOPersonalizedSensingServiceManager_primeService__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[MOPersonalizedSensingServiceManager handleDbAccessRenewalTask:](MOPersonalizedSensingServiceManager, "handleDbAccessRenewalTask:", a2);
}

+ (void)handleDbAccessRenewalTask:(id)a3
{
  id v3;
  uint64_t v4;
  dispatch_semaphore_t v5;
  MOPersonalizedSensingServiceManager *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  char v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v3 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v4 = MEMORY[0x24BDAC760];
  v26 = 0;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __65__MOPersonalizedSensingServiceManager_handleDbAccessRenewalTask___block_invoke;
  v22[3] = &unk_251442898;
  v22[4] = &v23;
  objc_msgSend(v3, "setExpirationHandler:", v22);
  v5 = dispatch_semaphore_create(0);
  v6 = objc_alloc_init(MOPersonalizedSensingServiceManager);
  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __65__MOPersonalizedSensingServiceManager_handleDbAccessRenewalTask___block_invoke_2;
  v20[3] = &unk_2514428C0;
  v7 = v5;
  v21 = v7;
  -[MOPersonalizedSensingServiceManager requestDBAccessForPersonalizedSensingServiceWithReply:](v6, "requestDBAccessForPersonalizedSensingServiceWithReply:", v20);
  v8 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[MOPersonalizedSensingServiceManager handleDbAccessRenewalTask:].cold.2(v9);

  }
  if (!*((_BYTE *)v24 + 24))
  {
    v11 = 0;
LABEL_11:
    objc_msgSend(v3, "setTaskCompleted");
    goto LABEL_12;
  }
  v19 = 0;
  v10 = objc_msgSend(v3, "setTaskExpiredWithRetryAfter:error:", &v19, 0.0);
  v11 = v19;
  if ((v10 & 1) == 0)
  {
    _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[MOPersonalizedSensingServiceManager handleDbAccessRenewalTask:].cold.1((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);

    goto LABEL_11;
  }
LABEL_12:

  _Block_object_dispose(&v23, 8);
}

uint64_t __65__MOPersonalizedSensingServiceManager_handleDbAccessRenewalTask___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

intptr_t __65__MOPersonalizedSensingServiceManager_handleDbAccessRenewalTask___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_243AAA000, v4, OS_LOG_TYPE_DEFAULT, "DB access token renewal succeeded: %d", (uint8_t *)v6, 8u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)generatePromptSuggestionWithTemplate:(id)a3 context:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  signed int v51;
  void *v52;
  void *v53;
  void *v54;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(v7, "copy");
  if ((objc_msgSend(v7, "contentType") & 1) != 0)
  {
    objc_msgSend(v8, "associatedContacts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      objc_msgSend(v8, "associatedContacts");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "contactName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (((objc_msgSend(v15, "hasSuffix:", CFSTR("s")) & 1) != 0
         || objc_msgSend(v15, "hasSuffix:", CFSTR("S")))
        && (objc_msgSend(v10, "textString"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "containsString:", CFSTR("Taylor's")),
            v16,
            v17))
      {
        objc_msgSend(v10, "textString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByAppendingString:", CFSTR("'"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Taylor's"), v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v10, "textString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "containsString:", CFSTR("Taylor"));

        if (!v22)
        {
LABEL_10:

          goto LABEL_11;
        }
        objc_msgSend(v10, "textString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Taylor"), v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v10, "setTextString:", v20);
      goto LABEL_10;
    }
  }
LABEL_11:
  if ((objc_msgSend(v7, "contentType") & 4) == 0)
    goto LABEL_16;
  objc_msgSend(v8, "associatedLocations");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "count"))
  {
    objc_msgSend(v10, "textString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "containsString:", CFSTR("placeName"));

    if (!v25)
      goto LABEL_16;
    objc_msgSend(v8, "associatedLocations");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "place");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "textString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringByReplacingOccurrencesOfString:withString:", CFSTR("placeName"), v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setTextString:", v29);
  }

LABEL_16:
  if ((objc_msgSend(v7, "contentType") & 8) == 0)
    goto LABEL_21;
  objc_msgSend(v8, "associatedLocations");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "count"))
  {
    objc_msgSend(v10, "textString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "containsString:", CFSTR("cityName"));

    if (!v32)
      goto LABEL_21;
    objc_msgSend(v8, "associatedLocations");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "city");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "textString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringByReplacingOccurrencesOfString:withString:", CFSTR("cityName"), v30);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setTextString:", v36);
  }

LABEL_21:
  if ((objc_msgSend(v7, "contentType") & 0x4000) != 0)
  {
    objc_msgSend(v8, "associatedTime");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v37, "count"))
    {
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend(v10, "textString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "containsString:", CFSTR("timeReference"));

    if (v39)
    {
      objc_msgSend(v8, "associatedTime");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "firstObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "timeReferenceString");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "textString");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "stringByReplacingOccurrencesOfString:withString:", CFSTR("timeReference"), v37);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setTextString:", v43);
      goto LABEL_25;
    }
  }
LABEL_26:
  if (objc_msgSend(v9, "appendMusicString"))
  {
    objc_msgSend(v8, "associatedMusic");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "count");

    if (v45)
    {
      objc_msgSend(v8, "associatedMusic");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "count");

      if (v47 == 1)
      {
        objc_msgSend(v10, "textString");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "associatedMusic");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "firstObject");
      }
      else
      {
        objc_msgSend(v8, "associatedMusic");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = arc4random_uniform(objc_msgSend(v50, "count"));

        objc_msgSend(v10, "textString");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "associatedMusic");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectAtIndexedSubscript:", v51);
      }
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "musicString");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "stringByAppendingString:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTextString:", v54);

    }
  }

  return v10;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (void)handleDbAccessRenewalTask:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_243AAA000, a2, a3, "Failed to expire task with error: %@", a5, a6, a7, a8, 2u);
}

+ (void)handleDbAccessRenewalTask:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_243AAA000, log, OS_LOG_TYPE_ERROR, "Task timed out. Unable to renew access token for DB", v1, 2u);
}

@end
