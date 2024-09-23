@implementation WAXPCConnection

- (WAXPCConnection)initWithXPCConnection:(id)a3
{
  id v5;
  WAXPCConnection *v6;
  WAXPCConnection *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WAXPCConnection;
  v6 = -[WAXPCConnection init](&v12, sel_init);
  v7 = v6;
  if (!v5)
    goto LABEL_4;
  if (!v6)
    goto LABEL_4;
  objc_storeStrong((id *)&v6->_connection, a3);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("com.apple.wifianalytics.xpc-connection", v8);
  queue = v7->_queue;
  v7->_queue = (OS_dispatch_queue *)v9;

  if (!v7->_queue)
  {
LABEL_4:

    v7 = 0;
  }

  return v7;
}

- (void)establishConnectionWithToken:(id)a3 andReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__WAXPCConnection_establishConnectionWithToken_andReply___block_invoke;
  v11[3] = &unk_24CDDDD40;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __57__WAXPCConnection_establishConnectionWithToken_andReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:establishConnectionWithToken:andReply:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  objc_autoreleasePoolPop(v2);
}

- (void)registerMessageGroup:(int64_t)a3 andReply:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__WAXPCConnection_registerMessageGroup_andReply___block_invoke;
  v9[3] = &unk_24CDDDD68;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __49__WAXPCConnection_registerMessageGroup_andReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:registerMessageGroup:andReply:", WeakRetained, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 withCopy:(id)a5 andReply:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21[2];
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __67__WAXPCConnection_getNewMessageForKey_groupType_withCopy_andReply___block_invoke;
  v17[3] = &unk_24CDDDD90;
  objc_copyWeak(v21, &location);
  v18 = v10;
  v19 = v11;
  v21[1] = (id)a4;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __67__WAXPCConnection_getNewMessageForKey_groupType_withCopy_andReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:getNewMessageForKey:groupType:withCopy:andReply:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_autoreleasePoolPop(v2);
}

- (void)getNewMessageForKey:(id)a3 groupType:(int64_t)a4 andReply:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__WAXPCConnection_getNewMessageForKey_groupType_andReply___block_invoke;
  block[3] = &unk_24CDDDDB8;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __58__WAXPCConnection_getNewMessageForKey_groupType_andReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:getNewMessageForKey:groupType:withCopy:andReply:", WeakRetained, v5, v6, v7, *(_QWORD *)(a1 + 40));

  objc_autoreleasePoolPop(v2);
}

- (void)getMessagesModelForGroupType:(int64_t)a3 andReply:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__WAXPCConnection_getMessagesModelForGroupType_andReply___block_invoke;
  v9[3] = &unk_24CDDDD68;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __57__WAXPCConnection_getMessagesModelForGroupType_andReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:getMessagesModelForGroupType:andReply:", WeakRetained, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)submitMessage:(id)a3 groupType:(int64_t)a4 andReply:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__WAXPCConnection_submitMessage_groupType_andReply___block_invoke;
  block[3] = &unk_24CDDDDB8;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __52__WAXPCConnection_submitMessage_groupType_andReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:submitMessage:groupType:andReply:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

  objc_autoreleasePoolPop(v2);
}

- (void)submitWiFiAnalyticsMessageAdvanced:(id)a3 andReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __63__WAXPCConnection_submitWiFiAnalyticsMessageAdvanced_andReply___block_invoke;
  v11[3] = &unk_24CDDDD40;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __63__WAXPCConnection_submitWiFiAnalyticsMessageAdvanced_andReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:submitWiFiAnalyticsMessageAdvanced:andReply:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  objc_autoreleasePoolPop(v2);
}

- (void)triggerQueryForNWActivity:(int64_t)a3 andReply:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__WAXPCConnection_triggerQueryForNWActivity_andReply___block_invoke;
  v9[3] = &unk_24CDDDD68;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __54__WAXPCConnection_triggerQueryForNWActivity_andReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:triggerQueryForNWActivity:andReply:", WeakRetained, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)convertWiFiStatsIntoPercentile:(id)a3 analysisGroup:(int64_t)a4 groupTarget:(id)a5 andReply:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21[2];
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __85__WAXPCConnection_convertWiFiStatsIntoPercentile_analysisGroup_groupTarget_andReply___block_invoke;
  v17[3] = &unk_24CDDDD90;
  objc_copyWeak(v21, &location);
  v18 = v10;
  v19 = v11;
  v21[1] = (id)a4;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __85__WAXPCConnection_convertWiFiStatsIntoPercentile_analysisGroup_groupTarget_andReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:andReply:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_autoreleasePoolPop(v2);
}

- (void)triggerDatapathDiagnosticsAndCollectUpdates:(int64_t)a3 waMessage:(id)a4 andReply:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__WAXPCConnection_triggerDatapathDiagnosticsAndCollectUpdates_waMessage_andReply___block_invoke;
  block[3] = &unk_24CDDDDB8;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a3;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __82__WAXPCConnection_triggerDatapathDiagnosticsAndCollectUpdates_waMessage_andReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:triggerDatapathDiagnosticsAndCollectUpdates:waMessage:andReply:", WeakRetained, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  objc_autoreleasePoolPop(v2);
}

- (void)killDaemonAndReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__WAXPCConnection_killDaemonAndReply___block_invoke;
  block[3] = &unk_24CDDDDE0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __38__WAXPCConnection_killDaemonAndReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:killDaemonAndReply:", WeakRetained, *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)clearMessageStoreAndReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__WAXPCConnection_clearMessageStoreAndReply___block_invoke;
  block[3] = &unk_24CDDDDE0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __45__WAXPCConnection_clearMessageStoreAndReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:clearMessageStoreAndReply:", WeakRetained, *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)trapCrashMiniTracerDumpReadyForInterfaceWithName:(id)a3 andReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__WAXPCConnection_trapCrashMiniTracerDumpReadyForInterfaceWithName_andReply___block_invoke;
  v11[3] = &unk_24CDDDD40;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __77__WAXPCConnection_trapCrashMiniTracerDumpReadyForInterfaceWithName_andReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:trapCrashMiniTracerDumpReadyForInterfaceWithName:andReply:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  objc_autoreleasePoolPop(v2);
}

- (void)lqmCrashTracerNotifyForInterfaceWithName:(id)a3 andReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __69__WAXPCConnection_lqmCrashTracerNotifyForInterfaceWithName_andReply___block_invoke;
  v11[3] = &unk_24CDDDD40;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __69__WAXPCConnection_lqmCrashTracerNotifyForInterfaceWithName_andReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:lqmCrashTracerNotifyForInterfaceWithName:andReply:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  objc_autoreleasePoolPop(v2);
}

- (void)lqmCrashTracerReceiveBlock:(id)a3 forInterfaceWithName:(id)a4 andReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__WAXPCConnection_lqmCrashTracerReceiveBlock_forInterfaceWithName_andReply___block_invoke;
  block[3] = &unk_24CDDDE08;
  objc_copyWeak(&v19, &location);
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __76__WAXPCConnection_lqmCrashTracerReceiveBlock_forInterfaceWithName_andReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:lqmCrashTracerReceiveBlock:forInterfaceWithName:andReply:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_autoreleasePoolPop(v2);
}

- (void)setDeviceAnalyticsConfiguration:(id)a3 andReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__WAXPCConnection_setDeviceAnalyticsConfiguration_andReply___block_invoke;
  v11[3] = &unk_24CDDDD40;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __60__WAXPCConnection_setDeviceAnalyticsConfiguration_andReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:setDeviceAnalyticsConfiguration:andReply:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  objc_autoreleasePoolPop(v2);
}

- (void)getDeviceAnalyticsConfigurationAndReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__WAXPCConnection_getDeviceAnalyticsConfigurationAndReply___block_invoke;
  block[3] = &unk_24CDDDDE0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __59__WAXPCConnection_getDeviceAnalyticsConfigurationAndReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:getDeviceAnalyticsConfigurationAndReply:", WeakRetained, *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)summarizeDeviceAnalyticsForNetwork:(id)a3 maxAgeInDays:(unint64_t)a4 andReply:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__WAXPCConnection_summarizeDeviceAnalyticsForNetwork_maxAgeInDays_andReply___block_invoke;
  block[3] = &unk_24CDDDDB8;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __76__WAXPCConnection_summarizeDeviceAnalyticsForNetwork_maxAgeInDays_andReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:summarizeDeviceAnalyticsForNetwork:maxAgeInDays:andReply:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

  objc_autoreleasePoolPop(v2);
}

- (void)getDpsStatsandReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__WAXPCConnection_getDpsStatsandReply___block_invoke;
  block[3] = &unk_24CDDDDE0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __39__WAXPCConnection_getDpsStatsandReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:getDpsStatsandReply:", WeakRetained, *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)getUsageStatsandReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__WAXPCConnection_getUsageStatsandReply___block_invoke;
  block[3] = &unk_24CDDDDE0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __41__WAXPCConnection_getUsageStatsandReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:getUsageStatsandReply:", WeakRetained, *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)triggerDeviceAnalyticsStoreMigrationAndReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__WAXPCConnection_triggerDeviceAnalyticsStoreMigrationAndReply___block_invoke;
  block[3] = &unk_24CDDDDE0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __64__WAXPCConnection_triggerDeviceAnalyticsStoreMigrationAndReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:triggerDeviceAnalyticsStoreMigrationAndReply:", WeakRetained, *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)sendMemoryPressureRequestAndReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__WAXPCConnection_sendMemoryPressureRequestAndReply___block_invoke;
  block[3] = &unk_24CDDDDE0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __53__WAXPCConnection_sendMemoryPressureRequestAndReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:sendMemoryPressureRequestAndReply:", WeakRetained, *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (void)issueIOReportManagementCommand:(unint64_t)a3 andReply:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[WAXPCConnection queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__WAXPCConnection_issueIOReportManagementCommand_andReply___block_invoke;
  v9[3] = &unk_24CDDDD68;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __59__WAXPCConnection_issueIOReportManagementCommand_andReply___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x212BEF45C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcConnection:issueIOReportManagementCommand:andReply:", WeakRetained, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v2);
}

- (WAXPCConnectionDelegate)delegate
{
  return (WAXPCConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
