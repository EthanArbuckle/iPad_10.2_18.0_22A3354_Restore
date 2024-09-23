@implementation UNSDaemonLauncher

void __59__UNSDaemonLauncher_didChangeSettings_forBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnectionForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__UNSDaemonLauncher_didChangeSettings_forBundleIdentifier___block_invoke_2;
  v4[3] = &unk_24D639E80;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didChangeSettings:forBundleIdentifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (id)_queue_ensureConnectionForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(id *);
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id from;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKey:](self->_connectionByBundleIdentifier, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BDF88C0], "serviceNameForBundleIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", v6, 0);
    -[NSMutableDictionary setObject:forKey:](self->_connectionByBundleIdentifier, "setObject:forKey:", v5, v4);
    objc_msgSend(MEMORY[0x24BDF88C0], "serverInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v7);

    objc_initWeak(&from, self->_queue);
    v8 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __64__UNSDaemonLauncher__queue_ensureConnectionForBundleIdentifier___block_invoke;
    v18[3] = &unk_24D639EF8;
    objc_copyWeak(&v20, &from);
    objc_copyWeak(&v21, &location);
    v9 = v4;
    v19 = v9;
    objc_msgSend(v5, "setInterruptionHandler:", v18);
    v11 = v8;
    v12 = 3221225472;
    v13 = __64__UNSDaemonLauncher__queue_ensureConnectionForBundleIdentifier___block_invoke_3;
    v14 = &unk_24D639EF8;
    objc_copyWeak(&v16, &from);
    objc_copyWeak(&v17, &location);
    v15 = v9;
    objc_msgSend(v5, "setInvalidationHandler:", &v11);
    objc_msgSend(v5, "resume", v11, v12, v13, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);

    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)didChangeSettings:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v7;
    _os_log_impl(&dword_216DCB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending didChangeSettings:forBundleIdentifier:", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__UNSDaemonLauncher_didChangeSettings_forBundleIdentifier___block_invoke;
  block[3] = &unk_24D639EA8;
  block[4] = self;
  v13 = v7;
  v14 = v6;
  v10 = v6;
  v11 = v7;
  dispatch_async(queue, block);

}

- (UNSDaemonLauncher)init
{
  UNSDaemonLauncher *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *connectionByBundleIdentifier;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *callOutQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UNSDaemonLauncher;
  v2 = -[UNSDaemonLauncher init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    connectionByBundleIdentifier = v2->_connectionByBundleIdentifier;
    v2->_connectionByBundleIdentifier = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.usernotifications.UNSDaemonLauncher", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.usernotifications.UNSDaemonLauncher.call-out", v8);
    callOutQueue = v2->_callOutQueue;
    v2->_callOutQueue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

- (void)didReceiveNotificationResponse:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v9;
    _os_log_impl(&dword_216DCB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending didReceiveNotificationResponse:forBundleIdentifier:", buf, 0xCu);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke;
  v16[3] = &unk_24D639E58;
  v16[4] = self;
  v17 = v9;
  v18 = v8;
  v19 = v10;
  v13 = v8;
  v14 = v10;
  v15 = v9;
  dispatch_async(queue, v16);

}

void __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnectionForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  v15[3] = &unk_24D639DE0;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v16 = v4;
  v17 = v5;
  v18 = *(id *)(a1 + 56);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_2_5;
  v11[3] = &unk_24D639E30;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 32);
  v12 = v9;
  v13 = v10;
  v14 = *(id *)(a1 + 56);
  objc_msgSend(v6, "didReceiveNotificationResponse:forBundleIdentifier:withCompletionHandler:", v8, v9, v11);

}

void __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1();
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  block[3] = &unk_24D639DB8;
  v7 = v4;
  dispatch_async(v5, block);

}

uint64_t __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_2_5(_QWORD *a1, char a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  char v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl(&dword_216DCB000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] didReceiveNotificationResponse:forBundleIdentifier: succeeded", buf, 0xCu);
  }
  v6 = (void *)a1[6];
  v7 = *(NSObject **)(a1[5] + 16);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_6;
  v8[3] = &unk_24D639E08;
  v9 = v6;
  v10 = a2;
  dispatch_async(v7, v8);

}

uint64_t __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (void)didOpenApplicationForResponse:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v7;
    _os_log_impl(&dword_216DCB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending didOpenApplicationForResponse:forBundleIdentifier:", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__UNSDaemonLauncher_didOpenApplicationForResponse_forBundleIdentifier___block_invoke;
  block[3] = &unk_24D639EA8;
  block[4] = self;
  v13 = v7;
  v14 = v6;
  v10 = v6;
  v11 = v7;
  dispatch_async(queue, block);

}

void __71__UNSDaemonLauncher_didOpenApplicationForResponse_forBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnectionForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__UNSDaemonLauncher_didOpenApplicationForResponse_forBundleIdentifier___block_invoke_2;
  v4[3] = &unk_24D639E80;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didOpenApplicationForResponse:forBundleIdentifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void __71__UNSDaemonLauncher_didOpenApplicationForResponse_forBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    __71__UNSDaemonLauncher_didOpenApplicationForResponse_forBundleIdentifier___block_invoke_2_cold_1();

}

void __59__UNSDaemonLauncher_didChangeSettings_forBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    __59__UNSDaemonLauncher_didChangeSettings_forBundleIdentifier___block_invoke_2_cold_1();

}

void __64__UNSDaemonLauncher__queue_ensureConnectionForBundleIdentifier___block_invoke(id *a1)
{
  NSObject *WeakRetained;
  _QWORD v3[4];
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __64__UNSDaemonLauncher__queue_ensureConnectionForBundleIdentifier___block_invoke_2;
    v3[3] = &unk_24D639ED0;
    objc_copyWeak(&v5, a1 + 6);
    v4 = a1[4];
    dispatch_async(WeakRetained, v3);

    objc_destroyWeak(&v5);
  }

}

void __64__UNSDaemonLauncher__queue_ensureConnectionForBundleIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_interruptedConnectionForBundleIdentifier:", *(_QWORD *)(a1 + 32));

}

void __64__UNSDaemonLauncher__queue_ensureConnectionForBundleIdentifier___block_invoke_3(id *a1)
{
  NSObject *WeakRetained;
  _QWORD v3[4];
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __64__UNSDaemonLauncher__queue_ensureConnectionForBundleIdentifier___block_invoke_4;
    v3[3] = &unk_24D639ED0;
    objc_copyWeak(&v5, a1 + 6);
    v4 = a1[4];
    dispatch_async(WeakRetained, v3);

    objc_destroyWeak(&v5);
  }

}

void __64__UNSDaemonLauncher__queue_ensureConnectionForBundleIdentifier___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_invalidatedConnectionForBundleIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)_queue_interruptedConnectionForBundleIdentifier:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)_queue_invalidatedConnectionForBundleIdentifier:(id)a3
{
  NSObject *queue;
  id v5;
  id v6;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[NSMutableDictionary objectForKey:](self->_connectionByBundleIdentifier, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");
  objc_msgSend(v6, "setInterruptionHandler:", 0);
  objc_msgSend(v6, "setInvalidationHandler:", 0);
  objc_msgSend(v6, "setExportedObject:", 0);
  -[NSMutableDictionary removeObjectForKey:](self->_connectionByBundleIdentifier, "removeObjectForKey:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_216DCB000, v0, v1, "[%{public}@] didReceiveNotificationResponse:forBundleIdentifier: failed with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

void __71__UNSDaemonLauncher_didOpenApplicationForResponse_forBundleIdentifier___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_216DCB000, v0, v1, "[%{public}@] didOpenApplicationForResponse:forBundleIdentifier: failed with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

void __59__UNSDaemonLauncher_didChangeSettings_forBundleIdentifier___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_216DCB000, v0, v1, "[%{public}@] didChangeSettings:forBundleIdentifier: failed with error: %{public}@");
  OUTLINED_FUNCTION_2();
}

@end
