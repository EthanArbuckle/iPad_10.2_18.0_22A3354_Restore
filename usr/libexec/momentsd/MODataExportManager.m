@implementation MODataExportManager

- (MODataExportManager)init
{
  MODataExportManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MODataExportManager;
  v2 = -[MODataExportManager init](&v4, "init");
  if (v2)
  {
    v2->_isAvailable = +[MOPlatformInfo isInternalBuild](MOPlatformInfo, "isInternalBuild");
    -[MODataExportManager _initConnectionToService](v2, "_initConnectionToService");
  }
  return v2;
}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  if (self->_isAvailable)
  {
    connection = self->connection;
    if (connection)
      -[NSXPCConnection invalidate](connection, "invalidate");
  }
  v4.receiver = self;
  v4.super_class = (Class)MODataExportManager;
  -[MODataExportManager dealloc](&v4, "dealloc");
}

- (void)_initConnectionToService
{
  NSXPCConnection *v3;
  NSXPCConnection *connection;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSSet *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSSet *v21;
  void *v22;
  id os_log;
  NSObject *v24;
  uint8_t buf[16];

  if (self->_isAvailable)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithServiceName:", CFSTR("com.apple.MomentsDataExportService"));
    connection = self->connection;
    self->connection = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MomentsDataExportServiceProtocol));
    v7 = objc_opt_class(NSArray, v6);
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(MOEvent, v8), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v10, "addEventsToDataExportSession:", 0, 0);

    v12 = objc_opt_class(NSArray, v11);
    v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(MOEventBundle, v13), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v15, "addBundlesToDataExportSession:", 0, 0);

    v17 = objc_opt_class(MOEventBundleRanking, v16);
    v19 = objc_opt_class(NSNumber, v18);
    v21 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, v19, objc_opt_class(NSDictionary, v20), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v22, "addRankingModelToDataExportSession:", 0, 0);

    -[NSXPCConnection setRemoteObjectInterface:](self->connection, "setRemoteObjectInterface:", v5);
    -[NSXPCConnection setInterruptionHandler:](self->connection, "setInterruptionHandler:", &__block_literal_global_10);
    -[NSXPCConnection setInvalidationHandler:](self->connection, "setInvalidationHandler:", &__block_literal_global_92);
    -[NSXPCConnection activate](self->connection, "activate");
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
    v24 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Initialized connection to service", buf, 2u);
    }

  }
}

void __47__MODataExportManager__initConnectionToService__block_invoke(id a1)
{
  id os_log;
  NSObject *v2;
  uint8_t v3[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
  v2 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Connection to XPC service interrupted", v3, 2u);
  }

}

void __47__MODataExportManager__initConnectionToService__block_invoke_91(id a1)
{
  id os_log;
  NSObject *v2;
  uint8_t v3[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
  v2 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Connection to XPC service invalidated", v3, 2u);
  }

}

+ (BOOL)isServiceAvailable
{
  return +[MOPlatformInfo isInternalBuild](MOPlatformInfo, "isInternalBuild");
}

- (void)_scheduleSendBarrierBlock:(id)a3
{
  void (**v3)(_QWORD);
  void *v4;
  id v5;

  v3 = (void (**)(_QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "scheduleSendBarrierBlock:", v3);
  else
    v3[2](v3);

}

- (void)startDataExportSession
{
  id os_log;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (self->_isAvailable)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Starting session", v6, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->connection, "remoteObjectProxy"));
    objc_msgSend(v5, "startDataExportSession");

  }
}

- (void)addEventsToDataExportSession:(id)a3
{
  id v4;
  id os_log;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  if (self->_isAvailable)
  {
    v4 = a3;
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Adding events to session session", v8, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->connection, "remoteObjectProxy"));
    objc_msgSend(v7, "addEventsToDataExportSession:", v4);

    -[MODataExportManager _scheduleSendBarrierBlock:](self, "_scheduleSendBarrierBlock:", &__block_literal_global_93);
  }
}

- (void)addBundlesToDataExportSession:(id)a3
{
  id v4;
  id os_log;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  if (self->_isAvailable)
  {
    v4 = a3;
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Adding bundles to session session", v8, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->connection, "remoteObjectProxy"));
    objc_msgSend(v7, "addBundlesToDataExportSession:", v4);

    -[MODataExportManager _scheduleSendBarrierBlock:](self, "_scheduleSendBarrierBlock:", &__block_literal_global_94_0);
  }
}

- (void)addMetadataToDataExportSession:(id)a3
{
  id v4;
  id os_log;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  if (self->_isAvailable)
  {
    v4 = a3;
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Adding metadata to session", v8, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->connection, "remoteObjectProxy"));
    objc_msgSend(v7, "addMetadataToDataExportSession:", v4);

    -[MODataExportManager _scheduleSendBarrierBlock:](self, "_scheduleSendBarrierBlock:", &__block_literal_global_95);
  }
}

- (void)addRankingModelToDataExportSession:(id)a3
{
  id v4;
  id os_log;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  if (self->_isAvailable)
  {
    v4 = a3;
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Adding ranking model to session", v8, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->connection, "remoteObjectProxy"));
    objc_msgSend(v7, "addRankingModelToDataExportSession:", v4);

    -[MODataExportManager _scheduleSendBarrierBlock:](self, "_scheduleSendBarrierBlock:", &__block_literal_global_96);
  }
}

- (void)endSessionAndUploadAsync
{
  id os_log;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (self->_isAvailable)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Ending session", v6, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->connection, "remoteObjectProxy"));
    objc_msgSend(v5, "endSessionAndUploadAsync");

  }
}

- (void)endSessionSyncWithReply:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  id os_log;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[5];
  uint8_t buf[16];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  if (self->_isAvailable)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__12;
    v16 = __Block_byref_object_dispose__12;
    v17 = 0;
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Ending session", buf, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_98));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __47__MODataExportManager_endSessionSyncWithReply___block_invoke_99;
    v10[3] = &unk_1002AD558;
    v10[4] = &v12;
    objc_msgSend(v7, "endSessionSyncWithReply:", v10);

    v4[2](v4, v13[5], 0);
    v8 = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Completed request for data export", buf, 2u);
    }

    _Block_object_dispose(&v12, 8);
  }

}

void __47__MODataExportManager_endSessionSyncWithReply___block_invoke(id a1, NSError *a2)
{
  NSError *v2;
  id os_log;
  NSObject *v4;

  v2 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityDataExporter);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__MODataExportManager_endSessionSyncWithReply___block_invoke_cold_1((uint64_t)v2, v4);

}

void __47__MODataExportManager_endSessionSyncWithReply___block_invoke_99(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  id v7;

  v6 = a2;
  if (!a3)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v6 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->connection, 0);
}

void __47__MODataExportManager_endSessionSyncWithReply___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to invoke synchronous API: %@", (uint8_t *)&v2, 0xCu);
}

@end
