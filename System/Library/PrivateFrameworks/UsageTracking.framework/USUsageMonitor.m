@implementation USUsageMonitor

- (USUsageMonitor)init
{
  USUsageMonitor *v2;
  NSXPCConnection *v3;
  NSXPCConnection *xpcConnection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)USUsageMonitor;
  v2 = -[USUsageMonitor init](&v6, sel_init);
  v3 = +[USTrackingAgentPrivateConnection newConnection](USTrackingAgentPrivateConnection, "newConnection");
  xpcConnection = v2->_xpcConnection;
  v2->_xpcConnection = v3;

  -[NSXPCConnection resume](v2->_xpcConnection, "resume");
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)USUsageMonitor;
  -[USUsageMonitor dealloc](&v3, sel_dealloc);
}

- (void)startMonitoringBudgets:(id)a3 darwinNotificationName:(id)a4 notificationTimes:(id)a5 completionHandler:(id)a6
{
  -[USUsageMonitor startMonitoringBudgets:darwinNotificationName:notificationTimes:clientIdentifier:completionHandler:](self, "startMonitoringBudgets:darwinNotificationName:notificationTimes:clientIdentifier:completionHandler:", a3, a4, a5, 0, a6);
}

- (void)startMonitoringBudgets:(id)a3 darwinNotificationName:(id)a4 notificationTimes:(id)a5 clientIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  USUsageMonitor *v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[USUsageMonitor xpcConnection](self, "xpcConnection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __117__USUsageMonitor_startMonitoringBudgets_darwinNotificationName_notificationTimes_clientIdentifier_completionHandler___block_invoke;
  v23[3] = &unk_24C7DAD00;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = self;
  v29 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  +[USXPCRemoteObjectProxy proxyFromConnection:withRetryCount:proxyHandler:](USXPCRemoteObjectProxy, "proxyFromConnection:withRetryCount:proxyHandler:", v17, 1, v23);

}

void __117__USUsageMonitor_startMonitoringBudgets_darwinNotificationName_notificationTimes_clientIdentifier_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  if (a2)
  {
    v3 = a1[4];
    v4 = a1[5];
    v5 = a1[6];
    v6 = a1[7];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __117__USUsageMonitor_startMonitoringBudgets_darwinNotificationName_notificationTimes_clientIdentifier_completionHandler___block_invoke_2;
    v8[3] = &unk_24C7DACD8;
    v7 = (void *)a1[9];
    v8[4] = a1[8];
    v9 = v7;
    objc_msgSend(a2, "startMonitoringBudgets:darwinNotificationName:notificationTimes:clientIdentifier:replyHandler:", v3, v4, v5, v6, v8);

  }
  else
  {
    (*(void (**)(void))(a1[9] + 16))();
  }
}

uint64_t __117__USUsageMonitor_startMonitoringBudgets_darwinNotificationName_notificationTimes_clientIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)startMonitoringBudgets:(id)a3 darwinNotificationName:(id)a4 notificationTimes:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  -[USUsageMonitor xpcConnection](self, "xpcConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __88__USUsageMonitor_startMonitoringBudgets_darwinNotificationName_notificationTimes_error___block_invoke;
  v19[3] = &unk_24C7DAD50;
  v14 = v10;
  v20 = v14;
  v15 = v11;
  v21 = v15;
  v16 = v12;
  v22 = v16;
  v23 = &v24;
  +[USXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](USXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v13, 1, v19);

  v17 = (void *)v25[5];
  if (a6 && v17)
    *a6 = objc_retainAutorelease(v17);

  _Block_object_dispose(&v24, 8);
  return v17 == 0;
}

void __88__USUsageMonitor_startMonitoringBudgets_darwinNotificationName_notificationTimes_error___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];

  v6 = a3;
  if (a2)
  {
    v7 = a1[4];
    v8 = a1[5];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __88__USUsageMonitor_startMonitoringBudgets_darwinNotificationName_notificationTimes_error___block_invoke_2;
    v10[3] = &unk_24C7DAD28;
    v9 = a1[6];
    v10[4] = a1[7];
    objc_msgSend(a2, "startMonitoringBudgets:darwinNotificationName:notificationTimes:clientIdentifier:replyHandler:", v7, v8, v9, 0, v10);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a3);
  }

}

void __88__USUsageMonitor_startMonitoringBudgets_darwinNotificationName_notificationTimes_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)stopMonitoringBudgets:(id)a3 completionHandler:(id)a4
{
  -[USUsageMonitor stopMonitoringBudgets:clientIdentifier:completionHandler:](self, "stopMonitoringBudgets:clientIdentifier:completionHandler:", a3, 0, a4);
}

- (void)stopMonitoringBudgets:(id)a3 clientIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  USUsageMonitor *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[USUsageMonitor xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __75__USUsageMonitor_stopMonitoringBudgets_clientIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_24C7DAD78;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  +[USXPCRemoteObjectProxy proxyFromConnection:withRetryCount:proxyHandler:](USXPCRemoteObjectProxy, "proxyFromConnection:withRetryCount:proxyHandler:", v11, 1, v15);

}

void __75__USUsageMonitor_stopMonitoringBudgets_clientIdentifier_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  if (a2)
  {
    v3 = a1[4];
    v4 = a1[5];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __75__USUsageMonitor_stopMonitoringBudgets_clientIdentifier_completionHandler___block_invoke_2;
    v6[3] = &unk_24C7DACD8;
    v5 = (void *)a1[7];
    v6[4] = a1[6];
    v7 = v5;
    objc_msgSend(a2, "stopMonitoringBudgets:clientIdentifier:replyHandler:", v3, v4, v6);

  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

uint64_t __75__USUsageMonitor_stopMonitoringBudgets_clientIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)stopMonitoringAllBudgetsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[USUsageMonitor xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__USUsageMonitor_stopMonitoringAllBudgetsWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C7DADA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  +[USXPCRemoteObjectProxy proxyFromConnection:withRetryCount:proxyHandler:](USXPCRemoteObjectProxy, "proxyFromConnection:withRetryCount:proxyHandler:", v5, 1, v7);

}

void __64__USUsageMonitor_stopMonitoringAllBudgetsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  if (a2)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __64__USUsageMonitor_stopMonitoringAllBudgetsWithCompletionHandler___block_invoke_2;
    v4[3] = &unk_24C7DACD8;
    v3 = *(void **)(a1 + 40);
    v4[4] = *(_QWORD *)(a1 + 32);
    v5 = v3;
    objc_msgSend(a2, "stopMonitoringAllBudgetsWithReplyHandler:", v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __64__USUsageMonitor_stopMonitoringAllBudgetsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)checkStatusOfBudgets:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__USUsageMonitor_checkStatusOfBudgets_completionHandler___block_invoke;
  v8[3] = &unk_24C7DADC8;
  v9 = v6;
  v7 = v6;
  -[USUsageMonitor checkStatusOfBudgets:clientIdentifier:completionHandler:](self, "checkStatusOfBudgets:clientIdentifier:completionHandler:", a3, 0, v8);

}

void __57__USUsageMonitor_checkStatusOfBudgets_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v9 = a5;
  v10 = *(_QWORD *)(a1 + 32);
  if (v12)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjects:forKeys:", v9, v12);
    (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v11, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v10 + 16))(v10, 0, a6);
  }

}

- (void)checkStatusOfBudgets:(id)a3 clientIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  USUsageMonitor *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[USUsageMonitor xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __74__USUsageMonitor_checkStatusOfBudgets_clientIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_24C7DAD78;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  +[USXPCRemoteObjectProxy proxyFromConnection:withRetryCount:proxyHandler:](USXPCRemoteObjectProxy, "proxyFromConnection:withRetryCount:proxyHandler:", v11, 1, v15);

}

void __74__USUsageMonitor_checkStatusOfBudgets_clientIdentifier_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  if (a2)
  {
    v3 = a1[4];
    v4 = a1[5];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __74__USUsageMonitor_checkStatusOfBudgets_clientIdentifier_completionHandler___block_invoke_2;
    v6[3] = &unk_24C7DADF0;
    v5 = (void *)a1[7];
    v6[4] = a1[6];
    v7 = v5;
    objc_msgSend(a2, "checkStatusOfBudgets:clientIdentifier:replyHandler:", v3, v4, v6);

  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

uint64_t __74__USUsageMonitor_checkStatusOfBudgets_clientIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)checkStatusOfBudgets:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  -[USUsageMonitor xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __45__USUsageMonitor_checkStatusOfBudgets_error___block_invoke;
  v12[3] = &unk_24C7DAE40;
  v8 = v6;
  v13 = v8;
  v14 = &v22;
  v15 = &v16;
  +[USXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](USXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v7, 1, v12);

  v9 = (void *)v23[5];
  if (a4 && !v9)
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v9 = (void *)v23[5];
  }
  v10 = v9;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __45__USUsageMonitor_checkStatusOfBudgets_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  __int128 v9;

  v6 = a3;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __45__USUsageMonitor_checkStatusOfBudgets_error___block_invoke_2;
    v8[3] = &unk_24C7DAE18;
    v9 = *(_OWORD *)(a1 + 40);
    objc_msgSend(a2, "checkStatusOfBudgets:clientIdentifier:replyHandler:", v7, 0, v8);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }

}

void __45__USUsageMonitor_checkStatusOfBudgets_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;

  v16 = a2;
  v9 = a5;
  v10 = a6;
  if (v16)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjects:forKeys:", v9, v16);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
  }
  else
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = v10;
    v13 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v15;
  }

}

- (void)checkStatusOfAllBudgetsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[USUsageMonitor xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__USUsageMonitor_checkStatusOfAllBudgetsWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C7DADA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  +[USXPCRemoteObjectProxy proxyFromConnection:withRetryCount:proxyHandler:](USXPCRemoteObjectProxy, "proxyFromConnection:withRetryCount:proxyHandler:", v5, 1, v7);

}

void __63__USUsageMonitor_checkStatusOfAllBudgetsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  if (a2)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __63__USUsageMonitor_checkStatusOfAllBudgetsWithCompletionHandler___block_invoke_2;
    v4[3] = &unk_24C7DADF0;
    v3 = *(void **)(a1 + 40);
    v4[4] = *(_QWORD *)(a1 + 32);
    v5 = v3;
    objc_msgSend(a2, "checkStatusOfAllBudgetsWithReplyHandler:", v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __63__USUsageMonitor_checkStatusOfAllBudgetsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)checkStatusOfBudgets:(id)a3 clientIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  USUsageMonitor *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[USUsageMonitor xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __75__USUsageMonitor_checkStatusOfBudgets_clientIdentifiers_completionHandler___block_invoke;
  v15[3] = &unk_24C7DAD78;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  +[USXPCRemoteObjectProxy proxyFromConnection:withRetryCount:proxyHandler:](USXPCRemoteObjectProxy, "proxyFromConnection:withRetryCount:proxyHandler:", v11, 1, v15);

}

void __75__USUsageMonitor_checkStatusOfBudgets_clientIdentifiers_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  if (a2)
  {
    v3 = a1[4];
    v4 = a1[5];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __75__USUsageMonitor_checkStatusOfBudgets_clientIdentifiers_completionHandler___block_invoke_2;
    v6[3] = &unk_24C7DADF0;
    v5 = (void *)a1[7];
    v6[4] = a1[6];
    v7 = v5;
    objc_msgSend(a2, "checkStatusOfBudgets:clientIdentifiers:replyHandler:", v3, v4, v6);

  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

uint64_t __75__USUsageMonitor_checkStatusOfBudgets_clientIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)checkStatusOfBudgets:(id)a3 clientIdentifiers:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v8 = a3;
  v9 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  -[USUsageMonitor xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __63__USUsageMonitor_checkStatusOfBudgets_clientIdentifiers_error___block_invoke;
  v16[3] = &unk_24C7DAE68;
  v11 = v8;
  v17 = v11;
  v12 = v9;
  v18 = v12;
  v19 = &v27;
  v20 = &v21;
  +[USXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](USXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v10, 1, v16);

  v13 = (void *)v28[5];
  if (a5 && !v13)
  {
    *a5 = objc_retainAutorelease((id)v22[5]);
    v13 = (void *)v28[5];
  }
  v14 = v13;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

void __63__USUsageMonitor_checkStatusOfBudgets_clientIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  __int128 v10;

  v6 = a3;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __63__USUsageMonitor_checkStatusOfBudgets_clientIdentifiers_error___block_invoke_2;
    v9[3] = &unk_24C7DAE18;
    v10 = *(_OWORD *)(a1 + 48);
    objc_msgSend(a2, "checkStatusOfBudgets:clientIdentifiers:replyHandler:", v7, v8, v9);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }

}

void __63__USUsageMonitor_checkStatusOfBudgets_clientIdentifiers_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;

  v16 = a2;
  v9 = a5;
  v10 = a6;
  if (v16)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjects:forKeys:", v9, v16);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
  }
  else
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = v10;
    v13 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v15;
  }

}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
