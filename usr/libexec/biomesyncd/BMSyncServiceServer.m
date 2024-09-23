@implementation BMSyncServiceServer

- (BMSyncServiceServer)initWithQueue:(id)a3 core:(id)a4
{
  id v7;
  id v8;
  BMSyncServiceServer *v9;
  BMSyncServiceServer *v10;
  NSXPCListener *v11;
  NSXPCListener *listener;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMSyncServiceServer;
  v9 = -[BMSyncServiceServer init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_core, a4);
    objc_storeStrong((id *)&v10->_queue, a3);
    v11 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.biomesyncd.sync"));
    listener = v10->_listener;
    v10->_listener = v11;

    -[NSXPCListener setDelegate:](v10->_listener, "setDelegate:", v10);
    -[NSXPCListener resume](v10->_listener, "resume");
  }

  return v10;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BMProcess processWithXPCConnection:](BMProcess, "processWithXPCConnection:", v5));
  if ((objc_msgSend(v6, "BOOLForEntitlement:", CFSTR("com.apple.private.biome.sync")) & 1) != 0
    || os_variant_allows_internal_security_policies("com.apple.biomesyncd")
    && (objc_msgSend(v6, "BOOLForEntitlement:", CFSTR("com.apple.internal.biome.sync")) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___BMSyncServiceServerProtocol));
    objc_msgSend(v5, "setExportedInterface:", v7);

    objc_msgSend(v5, "setExportedObject:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___BMSyncServiceClientProtocol));
    objc_msgSend(v5, "setRemoteObjectInterface:", v8);

    objc_msgSend(v5, "resume");
    v9 = 1;
  }
  else
  {
    objc_msgSend(v5, "invalidate");
    v9 = 0;
  }

  return v9;
}

- (void)_cloudKitSyncWithSyncTriggeredHandler:(id)a3 syncCompletedHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  id v10;
  void *v11;
  id v12;
  OS_dispatch_queue *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD block[5];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000214EC;
  block[3] = &unk_100069290;
  block[4] = self;
  v9 = v6;
  v20 = v9;
  v10 = v7;
  v21 = v10;
  dispatch_sync((dispatch_queue_t)queue, block);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncCore syncScheduler](self->_core, "syncScheduler"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100021604;
  v17[3] = &unk_1000692B8;
  v18 = v10;
  v12 = v10;
  objc_msgSend(v11, "syncCloudKitNowIfPolicyAllowsWithReason:activity:completionHandler:", 5, 0, v17);

  v13 = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100021618;
  v15[3] = &unk_1000692E0;
  v16 = v9;
  v14 = v9;
  dispatch_sync((dispatch_queue_t)v13, v15);

}

- (void)_rapportSyncWithSyncTriggeredHandler:(id)a3 syncCompletedHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000216D8;
  block[3] = &unk_100069290;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)_rapportSyncWithDevices:(id)a3 syncTriggeredHandler:(id)a4 syncCompletedHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *queue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021958;
  block[3] = &unk_100069308;
  v17 = v9;
  v18 = v10;
  block[4] = self;
  v16 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)triggerRapportSyncWithReply:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)os_transaction_create("-[BMSyncServiceServer triggerRapportSyncWithReply:]");
  v6 = __biome_log_for_category(11);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "triggerRapportSyncWithReply called", buf, 2u);
  }

  v11 = v5;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100021C1C;
  v12[3] = &unk_100069330;
  v13 = v4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = nullsub_1;
  v10[3] = &unk_100068C78;
  v8 = v5;
  v9 = v4;
  -[BMSyncServiceServer _rapportSyncWithSyncTriggeredHandler:syncCompletedHandler:](self, "_rapportSyncWithSyncTriggeredHandler:syncCompletedHandler:", v12, v10);

}

- (void)triggerRapportSyncDeviceIdentifiers:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  v8 = (void *)os_transaction_create("-[BMSyncServiceServer triggerRapportSyncDeviceIdentifiers:reply:]");
  v9 = __biome_log_for_category(11);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "triggerRapportSyncDeviceIdentifiers called", buf, 2u);
  }

  v14 = v8;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100021D60;
  v15[3] = &unk_100069330;
  v16 = v6;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = nullsub_2;
  v13[3] = &unk_100068C78;
  v11 = v8;
  v12 = v6;
  -[BMSyncServiceServer _rapportSyncWithDevices:syncTriggeredHandler:syncCompletedHandler:](self, "_rapportSyncWithDevices:syncTriggeredHandler:syncCompletedHandler:", v7, v15, v13);

}

- (void)rapportSyncWithReply:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)os_transaction_create("-[BMSyncServiceServer rapportSyncWithError:]");
  v6 = __biome_log_for_category(11);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "rapportSyncWithError called", buf, 2u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100021E6C;
  v10[3] = &unk_100069358;
  v11 = v5;
  v12 = v4;
  v8 = v5;
  v9 = v4;
  -[BMSyncServiceServer _rapportSyncWithSyncTriggeredHandler:syncCompletedHandler:](self, "_rapportSyncWithSyncTriggeredHandler:syncCompletedHandler:", 0, v10);

}

- (void)cascadeRapportSyncWithReply:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[16];

  v3 = a3;
  v4 = (void *)os_transaction_create("-[BMSyncServiceServer cascadeRapportSyncWithReply:]");
  v5 = __biome_log_for_category(11);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "rapportSyncWithError called", buf, 2u);
  }

  v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = dispatch_queue_create("com.apple.biomesyncd.cascde", v8);

  v10 = objc_msgSend(objc_alloc((Class)CCRapportSyncEngine), "initWithQueue:", v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100021FC0;
  v13[3] = &unk_100069358;
  v14 = v4;
  v15 = v3;
  v11 = v4;
  v12 = v3;
  objc_msgSend(v10, "syncNowWithReason:activity:completionHandler:", 5, 0, v13);

}

- (void)triggerCloudKitSyncWithReply:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)os_transaction_create("-[BMSyncServiceServer triggerCloudKitSyncWithReply:]");
  v6 = __biome_log_for_category(11);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "triggerCloudKitSyncWithReply called", buf, 2u);
  }

  v11 = v5;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000220E4;
  v12[3] = &unk_100069330;
  v13 = v4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = nullsub_3;
  v10[3] = &unk_100068C78;
  v8 = v5;
  v9 = v4;
  -[BMSyncServiceServer _cloudKitSyncWithSyncTriggeredHandler:syncCompletedHandler:](self, "_cloudKitSyncWithSyncTriggeredHandler:syncCompletedHandler:", v12, v10);

}

- (void)cloudKitSyncWithReply:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)os_transaction_create("-[BMSyncServiceServer cloudKitSyncWithError:]");
  v6 = __biome_log_for_category(11);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cloudKitSyncWithError called", buf, 2u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000221F0;
  v10[3] = &unk_100069358;
  v11 = v5;
  v12 = v4;
  v8 = v5;
  v9 = v4;
  -[BMSyncServiceServer _cloudKitSyncWithSyncTriggeredHandler:syncCompletedHandler:](self, "_cloudKitSyncWithSyncTriggeredHandler:syncCompletedHandler:", 0, v10);

}

- (void)remoteDevicesForAccount:(id)a3 reply:(id)a4
{
  id v5;
  OS_dispatch_queue *queue;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022280;
  block[3] = &unk_100068B60;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)peerInformationWithReply:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002262C;
  block[3] = &unk_100068B60;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_core, 0);
}

@end
