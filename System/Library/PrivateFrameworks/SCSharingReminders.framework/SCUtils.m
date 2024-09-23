@implementation SCUtils

+ (void)registerDarwinNotification:(id)a3
{
  const char *v3;
  id v4;

  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 4);
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "Notification", v3);
  xpc_set_event();

}

+ (void)unregisterDarwinNotification:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 4);
  xpc_set_event();
}

+ (void)registerNeededNotificationsForManager:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__SCUtils_registerNeededNotificationsForManager_completionHandler___block_invoke;
  v8[3] = &unk_2516629A8;
  v9 = v6;
  v10 = a1;
  v7 = v6;
  objc_msgSend(a3, "getNeededNotificationsWithCompletion:", v8);

}

void __67__SCUtils_registerNeededNotificationsForManager_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(void);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    SCLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __67__SCUtils_registerNeededNotificationsForManager_completionHandler___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(a1 + 40), "registerDarwinNotification:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
        }
        v16 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v16);
    }
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v14();

}

+ (void)submitTaskRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE0B728], "sharedScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "taskRequestForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    SCLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_impl(&dword_2454C0000, v10, OS_LOG_TYPE_DEFAULT, "\"Not submitting task request %@ because one already exists\", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE0B728], "sharedScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v12 = objc_msgSend(v11, "submitTaskRequest:error:", v5, &v21);
    v13 = v21;

    if ((v12 & 1) == 0)
    {
      SCLogger();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[SCUtils submitTaskRequest:completion:].cold.1((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);

    }
    (*((void (**)(id, uint64_t, id))v6 + 2))(v6, v12, v13);

  }
}

void __67__SCUtils_registerNeededNotificationsForManager_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2454C0000, a2, a3, "\"Failed to get needed notifications for registering. Error: %@\", a5, a6, a7, a8, 2u);
}

+ (void)submitTaskRequest:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2454C0000, a2, a3, "@\"SCUtils Failed to submit task. Error: %@\", a5, a6, a7, a8, 2u);
}

@end
