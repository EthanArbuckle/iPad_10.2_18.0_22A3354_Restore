@implementation UNSUserNotificationServerConnectionListener

uint64_t __93__UNSUserNotificationServerConnectionListener_setNotificationCategories_forBundleIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __114__UNSUserNotificationServerConnectionListener_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notificationCategoryForNotificationCategoryRecord:", a2);
}

- (void)setBadgeCount:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  os_log_t *v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v12 = (int)objc_msgSend(v8, "intValue");
  else
    v12 = 0;
  v13 = (os_log_t *)MEMORY[0x24BDF8998];
  v14 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543618;
    v16 = v9;
    v17 = 2050;
    v18 = v12;
    _os_log_impl(&dword_216DCB000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting badge count to %{public}ld", (uint8_t *)&v15, 0x16u);
  }
  if (objc_msgSend(v11, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v9))
  {
    -[UNCNotificationRepository setBadgeCount:forBundleIdentifier:withCompletionHandler:](self->_notificationRepository, "setBadgeCount:forBundleIdentifier:withCompletionHandler:", v12, v9, v10);
  }
  else if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener setBadgeCount:forBundleIdentifier:withCompletionHandler:].cold.1();
  }

}

- (void)getNotificationCategoriesForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  os_log_t *v9;
  NSObject *v10;
  NSObject *queue;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (os_log_t *)MEMORY[0x24BDF8998];
  v10 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v6;
    _os_log_impl(&dword_216DCB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting notification categories", buf, 0xCu);
  }
  if (objc_msgSend(v8, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __114__UNSUserNotificationServerConnectionListener_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke;
    block[3] = &unk_24D63AAB0;
    block[4] = self;
    v13 = v6;
    v14 = &v15;
    dispatch_sync(queue, block);

  }
  else if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener getNotificationCategoriesForBundleIdentifier:withCompletionHandler:].cold.1();
  }
  if (v7)
    v7[2](v7, v16[5]);

  _Block_object_dispose(&v15, 8);
}

- (void)getDeliveredNotificationsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  os_log_t *v9;
  NSObject *v10;
  NSObject *queue;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (os_log_t *)MEMORY[0x24BDF8998];
  v10 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v6;
    _os_log_impl(&dword_216DCB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting delivered notifications", buf, 0xCu);
  }
  if (objc_msgSend(v8, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __114__UNSUserNotificationServerConnectionListener_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke;
    block[3] = &unk_24D63AAB0;
    block[4] = self;
    v13 = v6;
    v14 = &v15;
    dispatch_sync(queue, block);

  }
  else if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener getDeliveredNotificationsForBundleIdentifier:withCompletionHandler:].cold.1();
  }
  if (v7)
    v7[2](v7, v16[5]);

  _Block_object_dispose(&v15, 8);
}

- (void)getBadgeNumberForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  os_log_t *v9;
  NSObject *v10;
  NSObject *queue;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (os_log_t *)MEMORY[0x24BDF8998];
  v10 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v6;
    _os_log_impl(&dword_216DCB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting badge number", buf, 0xCu);
  }
  if (objc_msgSend(v8, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __103__UNSUserNotificationServerConnectionListener_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke;
    block[3] = &unk_24D63A2C0;
    v14 = &v15;
    block[4] = self;
    v13 = v6;
    dispatch_sync(queue, block);

  }
  else if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener getBadgeNumberForBundleIdentifier:withCompletionHandler:].cold.1();
  }
  if (v7)
    v7[2](v7, v16[5]);

  _Block_object_dispose(&v15, 8);
}

- (void)requestAuthorizationWithOptions:(unint64_t)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  os_log_t *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v10 = (os_log_t *)MEMORY[0x24BDF8998];
  v11 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543618;
    v16 = v8;
    v17 = 2048;
    v18 = a3;
    _os_log_impl(&dword_216DCB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting authorization with options %ld", (uint8_t *)&v15, 0x16u);
  }
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v8))
  {
    objc_msgSend(MEMORY[0x24BEBF420], "sourceDescriptionWithBundleIdentifier:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      {
        -[UNSUserNotificationServerConnectionListener requestAuthorizationWithOptions:forBundleIdentifier:completionHandler:].cold.1();
        if (!v9)
          goto LABEL_12;
      }
      else if (!v9)
      {
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "un_errorWithUNErrorCode:userInfo:", 1, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, v14);

      goto LABEL_12;
    }
    -[UNSNotificationAuthorizationService requestAuthorizationWithOptions:forNotificationSourceDescription:completionHandler:](self->_notificationsAuthorizationService, "requestAuthorizationWithOptions:forNotificationSourceDescription:completionHandler:", a3, v13, v9);
LABEL_12:

    goto LABEL_13;
  }
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener requestAuthorizationWithOptions:forBundleIdentifier:completionHandler:].cold.2();
    if (!v9)
      goto LABEL_13;
    goto LABEL_8;
  }
  if (v9)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1540], "un_errorWithUNErrorCode:userInfo:", 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v13);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)getNotificationSettingsForTopicsWithBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  os_log_t *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (os_log_t *)MEMORY[0x24BDF8998];
  v9 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v6;
    _os_log_impl(&dword_216DCB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting notification settings for topics", (uint8_t *)&v12, 0xCu);
  }
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6))
  {
    -[UNSNotificationSettingsService notificationSettingsForTopicsWithBundleIdentifier:](self->_notificationSettingsService, "notificationSettingsForTopicsWithBundleIdentifier:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    -[UNSUserNotificationServerConnectionListener getNotificationSettingsForTopicsWithBundleIdentifier:withCompletionHandler:].cold.1();
  v11 = 0;
  if (v7)
LABEL_9:
    v7[2](v7, v11);
LABEL_10:

}

- (void)setNotificationTopics:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  os_log_t *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (os_log_t *)MEMORY[0x24BDF8998];
  v13 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543618;
    v17 = v9;
    v18 = 2114;
    v19 = v8;
    _os_log_impl(&dword_216DCB000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting topics %{public}@", (uint8_t *)&v16, 0x16u);
  }
  objc_msgSend(v8, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bs_map:", *MEMORY[0x24BEBF520]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v9))
  {
    -[UNCNotificationTopicRepository setTopics:forBundleIdentifier:withCompletionHandler:](self->_topicRepository, "setTopics:forBundleIdentifier:withCompletionHandler:", v15, v9, v10);
  }
  else if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener setNotificationTopics:forBundleIdentifier:withCompletionHandler:].cold.1();
  }

}

- (void)setNotificationCategories:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_log_t *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (os_log_t *)MEMORY[0x24BDF8998];
  v10 = (void *)*MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v15 = 138543618;
    v16 = v7;
    v17 = 2048;
    v18 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_216DCB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting %ld notification categories", (uint8_t *)&v15, 0x16u);

  }
  if (objc_msgSend(v8, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v7))
  {
    objc_msgSend(v6, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "bs_map:", *MEMORY[0x24BEBF510]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSNotificationCategoryRepository setCategories:forBundleIdentifier:](self->_categoryRepository, "setCategories:forBundleIdentifier:", v14, v7);

  }
  else if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener setNotificationCategories:forBundleIdentifier:].cold.1();
  }

}

- (void)setConnectionDetails:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "uns_isAllowedFromDaemon"))
  {
    objc_msgSend(v5, "uns_setConnectionDetails:", v4);
  }
  else
  {
    v6 = *MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[UNSUserNotificationServerConnectionListener setConnectionDetails:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }

}

- (void)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  os_log_t *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (os_log_t *)MEMORY[0x24BDF8998];
  v13 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543618;
    v15 = v9;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_216DCB000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting badge number to %{public}@", (uint8_t *)&v14, 0x16u);
  }
  if (objc_msgSend(v11, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v9))
  {
    -[UNCNotificationRepository setBadgeNumber:forBundleIdentifier:withCompletionHandler:](self->_notificationRepository, "setBadgeNumber:forBundleIdentifier:withCompletionHandler:", v8, v9, v10);
  }
  else if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener setBadgeNumber:forBundleIdentifier:withCompletionHandler:].cold.1();
  }

}

- (void)getNotificationSettingsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  os_log_t *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (os_log_t *)MEMORY[0x24BDF8998];
  v9 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v6;
    _os_log_impl(&dword_216DCB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting notification settings", (uint8_t *)&v12, 0xCu);
  }
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6))
  {
    -[UNSNotificationSettingsService notificationSettingsForBundleIdentifier:](self->_notificationSettingsService, "notificationSettingsForBundleIdentifier:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    -[UNSUserNotificationServerConnectionListener getNotificationSettingsForBundleIdentifier:withCompletionHandler:].cold.1();
  v11 = 0;
  if (v7)
LABEL_9:
    v7[2](v7, v11);
LABEL_10:

}

- (id)_currentConnection
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = *MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      -[UNSUserNotificationServerConnectionListener _currentConnection].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  return v2;
}

uint64_t __89__UNSUserNotificationServerConnectionListener_didReceiveDeviceToken_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didReceiveDeviceToken:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v13[6];
  _QWORD v14[6];
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDF88C8], "clientInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v8);

  objc_msgSend(MEMORY[0x24BDF88C8], "serverInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v9);

  objc_msgSend(v7, "setExportedObject:", self);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__4;
  v15[4] = __Block_byref_object_dispose__4;
  v10 = v7;
  v16 = v10;
  v11 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __82__UNSUserNotificationServerConnectionListener_listener_shouldAcceptNewConnection___block_invoke;
  v14[3] = &unk_24D63A298;
  v14[4] = self;
  v14[5] = v15;
  objc_msgSend(v10, "setInterruptionHandler:", v14);
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __82__UNSUserNotificationServerConnectionListener_listener_shouldAcceptNewConnection___block_invoke_8;
  v13[3] = &unk_24D63A298;
  v13[4] = self;
  v13[5] = v15;
  objc_msgSend(v10, "setInvalidationHandler:", v13);
  objc_msgSend(v10, "resume");
  _Block_object_dispose(v15, 8);

  return 1;
}

void __103__UNSUserNotificationServerConnectionListener_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 88), "badgeNumberForBundleIdentifier:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __119__UNSUserNotificationServerConnectionListener_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "pendingNotificationRecordsForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_queue_notificationRequestsForNotificationRecords:bundleIdentifier:", v5, *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __114__UNSUserNotificationServerConnectionListener_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "notificationRecordsForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_filter:", &__block_literal_global_22);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_queue_notificationsForNotificationRecords:bundleIdentifier:", v2, *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_queue_notificationRequestsForNotificationRecords:(id)a3 bundleIdentifier:(id)a4
{
  UNCLocalizationService *localizationService;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  localizationService = self->_localizationService;
  v7 = a3;
  -[UNCLocalizationService bundleWithIdentifier:](localizationService, "bundleWithIdentifier:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBF400]), "initWithBundle:categoryRepository:", v8, self->_categoryRepository);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __114__UNSUserNotificationServerConnectionListener__queue_notificationRequestsForNotificationRecords_bundleIdentifier___block_invoke;
  v13[3] = &unk_24D63AB80;
  v14 = v9;
  v10 = v9;
  objc_msgSend(v7, "bs_map:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_queue_notificationsForNotificationRecords:(id)a3 bundleIdentifier:(id)a4
{
  UNCLocalizationService *localizationService;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  localizationService = self->_localizationService;
  v7 = a3;
  -[UNCLocalizationService bundleWithIdentifier:](localizationService, "bundleWithIdentifier:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBF400]), "initWithBundle:categoryRepository:", v8, self->_categoryRepository);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __107__UNSUserNotificationServerConnectionListener__queue_notificationsForNotificationRecords_bundleIdentifier___block_invoke;
  v13[3] = &unk_24D63AB80;
  v14 = v9;
  v10 = v9;
  objc_msgSend(v7, "bs_map:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __114__UNSUserNotificationServerConnectionListener_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(*(id *)(a1[4] + 56), "categoriesForBundleIdentifier:", a1[5]);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(*(id *)(a1[4] + 48), "bundleWithIdentifier:", a1[5]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBF3E8]), "initWithBundle:", v2);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __114__UNSUserNotificationServerConnectionListener_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke_2;
    v10[3] = &unk_24D63AA88;
    v11 = v3;
    v5 = v3;
    objc_msgSend(v4, "bs_map:", v10);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (void)removeAllPendingNotificationRequestsForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  os_log_t *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (os_log_t *)MEMORY[0x24BDF8998];
  v10 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v6;
    _os_log_impl(&dword_216DCB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing all pending notification requests", (uint8_t *)&v12, 0xCu);
  }
  v11 = objc_msgSend(v8, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6);
  if ((_DWORD)v11)
  {
    -[UNCNotificationSchedulingService removeAllPendingNotificationRecordsForBundleIdentifier:withCompletionHandler:](self->_notificationSchedulingService, "removeAllPendingNotificationRecordsForBundleIdentifier:withCompletionHandler:", v6, 0);
    if (!v7)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener removeAllPendingNotificationRequestsForBundleIdentifier:completionHandler:].cold.1();
    if (!v7)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (v7)
LABEL_8:
    v7[2](v7, v11, 0);
LABEL_9:

}

- (void)_queue_didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[UNSUserNotificationServerConnectionListener _queue_observerConnectionsForBundleIdentifier:](self, "_queue_observerConnectionsForBundleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    *(_DWORD *)buf = 138543618;
    v23 = v7;
    v24 = 2048;
    v25 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_216DCB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending received device token to %ld connections", buf, 0x16u);

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15), "remoteObjectProxy", (_QWORD)v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "didReceiveDeviceToken:forBundleIdentifier:", v6, v7);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (id)_queue_observerConnectionsForBundleIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_connectionsByBundleIdentifier, "objectForKey:", a3);
}

- (void)didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__UNSUserNotificationServerConnectionListener_didReceiveDeviceToken_forBundleIdentifier___block_invoke;
  block[3] = &unk_24D639EA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)removeDeliveredNotificationsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  os_log_t *v12;
  NSObject *v13;
  uint64_t v14;
  UNCNotificationRepository *notificationRepository;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (os_log_t *)MEMORY[0x24BDF8998];
  v13 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138543362;
    v18 = v9;
    _os_log_impl(&dword_216DCB000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing delivered notifications", (uint8_t *)&v17, 0xCu);
  }
  v14 = objc_msgSend(v11, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v9);
  if ((_DWORD)v14)
  {
    if (v8)
    {
      notificationRepository = self->_notificationRepository;
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNCNotificationRepository removeNotificationRecordsForIdentifiers:bundleIdentifier:](notificationRepository, "removeNotificationRecordsForIdentifiers:bundleIdentifier:", v16, v9);

      if (!v10)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener removeDeliveredNotificationsWithIdentifiers:forBundleIdentifier:completionHandler:].cold.1();
    if (!v10)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (v10)
LABEL_9:
    v10[2](v10, v14, 0);
LABEL_10:

}

- (void)getPendingNotificationRequestsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  os_log_t *v9;
  NSObject *v10;
  NSObject *queue;
  uint64_t v12;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (os_log_t *)MEMORY[0x24BDF8998];
  v10 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v6;
    _os_log_impl(&dword_216DCB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting pending notification requests", buf, 0xCu);
  }
  if (objc_msgSend(v8, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __119__UNSUserNotificationServerConnectionListener_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke;
    block[3] = &unk_24D63AAB0;
    block[4] = self;
    v14 = v6;
    v15 = &v16;
    dispatch_sync(queue, block);

  }
  else if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener getPendingNotificationRequestsForBundleIdentifier:withCompletionHandler:].cold.1();
  }
  if (v7)
  {
    v12 = v17[5];
    if (!v12)
    {
      v17[5] = MEMORY[0x24BDBD1A8];

      v12 = v17[5];
    }
    v7[2](v7, v12);
  }

  _Block_object_dispose(&v16, 8);
}

- (void)removePendingNotificationRequestsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  os_log_t *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (os_log_t *)MEMORY[0x24BDF8998];
  v13 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543362;
    v16 = v9;
    _os_log_impl(&dword_216DCB000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing pending notification requests", (uint8_t *)&v15, 0xCu);
  }
  v14 = objc_msgSend(v11, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v9);
  if ((_DWORD)v14)
  {
    -[UNCNotificationSchedulingService removePendingNotificationRecordsWithIdentifiers:forBundleIdentifier:withCompletionHandler:](self->_notificationSchedulingService, "removePendingNotificationRecordsWithIdentifiers:forBundleIdentifier:withCompletionHandler:", v8, v9, 0);
    if (!v10)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener removePendingNotificationRequestsWithIdentifiers:forBundleIdentifier:completionHandler:].cold.1();
    if (!v10)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (v10)
LABEL_8:
    v10[2](v10, v14, 0);
LABEL_9:

}

- (UNSUserNotificationServerConnectionListener)initWithCategoryRepository:(id)a3 notificationSchedulingService:(id)a4 notificationAuthorizationService:(id)a5 notificationSettingsService:(id)a6 notificationRepository:(id)a7 remoteNotificationConnectionListener:(id)a8 remoteNotificationService:(id)a9 applicationLauncher:(id)a10 attachmentsService:(id)a11 locationMonitor:(id)a12 topicRepository:(id)a13 localizationService:(id)a14 communicationContextService:(id)a15
{
  UNSUserNotificationServerConnectionListener *v20;
  UNSUserNotificationServerConnectionListener *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *connectionsByBundleIdentifier;
  uint64_t v24;
  NSMapTable *bundleIdentifiersByConnection;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *queue;
  id v29;
  uint64_t v30;
  NSXPCListener *listener;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  objc_super v48;

  v47 = a3;
  v46 = a4;
  v45 = a5;
  v44 = a6;
  v43 = a7;
  v42 = a8;
  v41 = a9;
  v40 = a10;
  v39 = a11;
  v38 = a12;
  v37 = a13;
  v36 = a14;
  v35 = a15;
  v48.receiver = self;
  v48.super_class = (Class)UNSUserNotificationServerConnectionListener;
  v20 = -[UNSUserNotificationServerConnectionListener init](&v48, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_categoryRepository, a3);
    objc_storeStrong((id *)&v21->_notificationSchedulingService, a4);
    objc_storeStrong((id *)&v21->_notificationsAuthorizationService, a5);
    objc_storeStrong((id *)&v21->_notificationSettingsService, a6);
    objc_storeStrong((id *)&v21->_notificationRepository, a7);
    objc_storeStrong((id *)&v21->_remoteNotificationConnectionListener, a8);
    objc_storeStrong((id *)&v21->_remoteNotificationService, a9);
    objc_storeStrong((id *)&v21->_applicationLauncher, a10);
    objc_storeStrong((id *)&v21->_attachmentsService, a11);
    objc_storeStrong((id *)&v21->_locationMonitor, a12);
    objc_storeStrong((id *)&v21->_topicRepository, a13);
    objc_storeStrong((id *)&v21->_localizationService, a14);
    objc_storeStrong((id *)&v21->_communicationContextService, a15);
    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    connectionsByBundleIdentifier = v21->_connectionsByBundleIdentifier;
    v21->_connectionsByBundleIdentifier = v22;

    v24 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
    bundleIdentifiersByConnection = v21->_bundleIdentifiersByConnection;
    v21->_bundleIdentifiersByConnection = (NSMapTable *)v24;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = dispatch_queue_create("com.apple.usernotificationsserver.ConnectionListener", v26);
    queue = v21->_queue;
    v21->_queue = (OS_dispatch_queue *)v27;

    v29 = objc_alloc(MEMORY[0x24BDD1998]);
    v30 = objc_msgSend(v29, "initWithMachServiceName:", *MEMORY[0x24BDF8AD8]);
    listener = v21->_listener;
    v21->_listener = (NSXPCListener *)v30;

    -[NSXPCListener setDelegate:](v21->_listener, "setDelegate:", v21);
  }

  return v21;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)UNSUserNotificationServerConnectionListener;
  -[UNSUserNotificationServerConnectionListener dealloc](&v4, sel_dealloc);
}

- (void)resume
{
  -[NSXPCListener resume](self->_listener, "resume");
}

uint64_t __82__UNSUserNotificationServerConnectionListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_216DCB000, v2, OS_LOG_TYPE_DEFAULT, "connection interrupted", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_removeConnectionForAllBundleIdentifiers:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __82__UNSUserNotificationServerConnectionListener_listener_shouldAcceptNewConnection___block_invoke_8(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_216DCB000, v2, OS_LOG_TYPE_DEFAULT, "connection invalidated", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_removeConnectionForAllBundleIdentifiers:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)setObservingUserNotifications:(BOOL)a3 forBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  _QWORD v9[5];
  id v10;
  id v11;
  BOOL v12;

  v6 = a4;
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6))
  {
    queue = self->_queue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __97__UNSUserNotificationServerConnectionListener_setObservingUserNotifications_forBundleIdentifier___block_invoke;
    v9[3] = &unk_24D63A458;
    v12 = a3;
    v9[4] = self;
    v10 = v7;
    v11 = v6;
    dispatch_async(queue, v9);

  }
}

uint64_t __97__UNSUserNotificationServerConnectionListener_setObservingUserNotifications_forBundleIdentifier___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  if (v2)
    return objc_msgSend(v3, "_queue_addConnection:forBundleIdentifier:", v4, v5);
  else
    return objc_msgSend(v3, "_queue_removeConnection:forBundleIdentifier:", v4, v5);
}

- (void)requestRemoveAuthorizationForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  os_log_t *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = (os_log_t *)MEMORY[0x24BDF8998];
  v9 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = v6;
    _os_log_impl(&dword_216DCB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting remove authorization", (uint8_t *)&v13, 0xCu);
  }
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "uns_isInternalUserNotificationsTool"))
  {
    objc_msgSend(MEMORY[0x24BEBF420], "sourceDescriptionWithBundleIdentifier:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      {
        -[UNSUserNotificationServerConnectionListener requestRemoveAuthorizationForBundleIdentifier:completionHandler:].cold.1();
        if (!v7)
          goto LABEL_12;
      }
      else if (!v7)
      {
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "un_errorWithUNErrorCode:userInfo:", 1, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v12);

      goto LABEL_12;
    }
    -[UNSNotificationAuthorizationService requestRemoveAuthorizationForNotificationSourceDescription:completionHandler:](self->_notificationsAuthorizationService, "requestRemoveAuthorizationForNotificationSourceDescription:completionHandler:", v11, v7);
LABEL_12:

    goto LABEL_13;
  }
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener requestRemoveAuthorizationForBundleIdentifier:completionHandler:].cold.2();
    if (!v7)
      goto LABEL_13;
    goto LABEL_8;
  }
  if (v7)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1540], "un_errorWithUNErrorCode:userInfo:", 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v11);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)addNotificationRequest:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  UNSUserNotificationServerConnectionListener *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  __CFString *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "destinations");
  v13 = (id)*MEMORY[0x24BDF8998];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v24 = self;
    v25 = v11;
    v26 = v9;
    objc_msgSend(v8, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "un_logDigest");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v12 == 15)
    {
      v16 = CFSTR("Default");
    }
    else
    {
      UNNotificationDestinationStrings();
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "content");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "un_logString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v28 = v26;
    v29 = 2114;
    v30 = v15;
    v31 = 2114;
    v32 = v16;
    v33 = 2114;
    v34 = v19;
    _os_log_impl(&dword_216DCB000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Adding notification request %{public}@ to destinations: %{public}@, contentDate: %{public}@", buf, 0x2Au);

    if (v12 != 15)
    v11 = v25;
    v9 = v26;
    self = v24;
  }

  if (UNIsInternalInstall()
    && (objc_msgSend(v8, "content"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v20, "userInfo"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v11, "uns_requestContainsDisallowedPrivateUserInfo:", v21),
        v21,
        v20,
        v22))
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    {
      -[UNSUserNotificationServerConnectionListener addNotificationRequest:forBundleIdentifier:withCompletionHandler:].cold.1();
      if (!v10)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else
  {
    if (objc_msgSend(v11, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v9))
    {
      -[UNSUserNotificationServerConnectionListener _saveNotificationRequest:shouldRepost:deliveredDate:forBundleIdentifier:withCompletionHandler:](self, "_saveNotificationRequest:shouldRepost:deliveredDate:forBundleIdentifier:withCompletionHandler:", v8, 1, 0, v9, v10);
      goto LABEL_18;
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
    {
      -[UNSUserNotificationServerConnectionListener addNotificationRequest:forBundleIdentifier:withCompletionHandler:].cold.2();
      if (!v10)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  if (v10)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x24BDD1540], "un_errorWithUNErrorCode:userInfo:", 1, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v23);

  }
LABEL_18:

}

- (void)replaceContentForRequestWithIdentifier:(id)a3 bundleIdentifier:(id)a4 replacementContent:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  os_log_t *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (os_log_t *)MEMORY[0x24BDF8998];
  v16 = (void *)*MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    objc_msgSend(v10, "un_logDigest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "date");
    v19 = v14;
    v20 = v12;
    v21 = v10;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "un_logString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v46 = v11;
    v47 = 2114;
    v48 = v18;
    v49 = 2114;
    v50 = v23;
    _os_log_impl(&dword_216DCB000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Replacing notification content %{public}@, contentDate: %{public}@", buf, 0x20u);

    v10 = v21;
    v12 = v20;
    v14 = v19;
    v15 = (os_log_t *)MEMORY[0x24BDF8998];

  }
  if (UNIsInternalInstall()
    && (objc_msgSend(v12, "userInfo"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = objc_msgSend(v14, "uns_requestContainsDisallowedPrivateUserInfo:", v24),
        v24,
        v25))
  {
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
    {
      -[UNSUserNotificationServerConnectionListener addNotificationRequest:forBundleIdentifier:withCompletionHandler:].cold.1();
      if (!v13)
        goto LABEL_20;
      goto LABEL_14;
    }
  }
  else
  {
    if (objc_msgSend(v14, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v11))
    {
      -[UNCNotificationRepository notificationRecordForIdentifier:bundleIdentifier:](self->_notificationRepository, "notificationRecordForIdentifier:bundleIdentifier:", v10, v11);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (v26)
      {
        v44 = v26;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[UNSUserNotificationServerConnectionListener _queue_notificationsForNotificationRecords:bundleIdentifier:](self, "_queue_notificationsForNotificationRecords:bundleIdentifier:", v28, v11);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = v29;
        objc_msgSend(v29, "firstObject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "request");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[UNCNotificationSchedulingService undeliveredNotificationRecordsForBundleIdentifier:](self->_notificationSchedulingService, "undeliveredNotificationRecordsForBundleIdentifier:", v11);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x24BDAC760];
        v42[1] = 3221225472;
        v42[2] = __140__UNSUserNotificationServerConnectionListener_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke;
        v42[3] = &unk_24D63AB18;
        v32 = v10;
        v43 = v32;
        v40 = v10;
        if (objc_msgSend(v31, "bs_containsObjectPassingTest:", v42))
        {
          objc_msgSend(v30, "trigger");
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = v30;
          v35 = (void *)v33;
        }
        else
        {
          v34 = v30;
          v35 = 0;
        }
        v38 = v34;
        objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:destinations:", v32, v12, v35, objc_msgSend(v34, "destinations"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "date");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[UNSUserNotificationServerConnectionListener _saveNotificationRequest:shouldRepost:deliveredDate:forBundleIdentifier:withCompletionHandler:](self, "_saveNotificationRequest:shouldRepost:deliveredDate:forBundleIdentifier:withCompletionHandler:", v36, 0, v37, v11, v13);

        v10 = v40;
      }
      else if (v13)
      {
        v13[2](v13, 0);
      }
      goto LABEL_19;
    }
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
    {
      -[UNSUserNotificationServerConnectionListener replaceContentForRequestWithIdentifier:bundleIdentifier:replacementContent:completionHandler:].cold.2();
      if (!v13)
        goto LABEL_20;
      goto LABEL_14;
    }
  }
  if (v13)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x24BDD1540], "un_errorWithUNErrorCode:userInfo:", 1, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v13)[2](v13, v27);
LABEL_19:

  }
LABEL_20:

}

uint64_t __140__UNSUserNotificationServerConnectionListener_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_saveNotificationRequest:(id)a3 shouldRepost:(BOOL)a4 deliveredDate:(id)a5 forBundleIdentifier:(id)a6 withCompletionHandler:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  unsigned int v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v12, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "length"))
  {
    v26 = 0;
    -[UNSUserNotificationServerConnectionListener _serviceResolvedNotificationRequest:forBundleIdentifier:error:](self, "_serviceResolvedNotificationRequest:forBundleIdentifier:error:", v12, v14, &v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v26;
    if (v17)
    {
      (*(void (**)(void))(*MEMORY[0x24BEBF518] + 16))();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDate:", v13);
      if ((objc_msgSend(v19, "hasPendingTrigger") & 1) == 0)
      {
        v22 = v10;
        objc_msgSend(v17, "content");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v20, "uns_willNotifyUser");

        -[UNSNotificationSettingsService notificationSettingsForBundleIdentifier:](self->_notificationSettingsService, "notificationSettingsForBundleIdentifier:", v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v21, "alertSetting") != 2 || !objc_msgSend(v21, "alertStyle"))
          && objc_msgSend(v21, "notificationCenterSetting") != 2)
        {
          objc_msgSend(v21, "lockScreenSetting", v23);
        }
        UNCPowerLogUserNotificationDefaultTriggerEvent();

        v10 = v22;
      }
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __141__UNSUserNotificationServerConnectionListener__saveNotificationRequest_shouldRepost_deliveredDate_forBundleIdentifier_withCompletionHandler___block_invoke;
      v24[3] = &unk_24D639DB8;
      v25 = v15;
      -[UNSUserNotificationServerConnectionListener _saveNotificationRecord:shouldRepost:forBundleIdentifier:withCompletionHandler:](self, "_saveNotificationRecord:shouldRepost:forBundleIdentifier:withCompletionHandler:", v19, v10, v14, v24);

    }
    else if (v15)
    {
      (*((void (**)(id, id))v15 + 2))(v15, v18);
    }

  }
  else if (v15)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_ERROR))
      -[UNSUserNotificationServerConnectionListener _saveNotificationRequest:shouldRepost:deliveredDate:forBundleIdentifier:withCompletionHandler:].cold.1();
    (*((void (**)(id, _QWORD))v15 + 2))(v15, 0);
  }

}

uint64_t __141__UNSUserNotificationServerConnectionListener__saveNotificationRequest_shouldRepost_deliveredDate_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (id)_serviceResolvedNotificationRequest:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *log;
  void *v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSAttachmentsService resolveAttachmentsForRequest:bundleIdentifier:fromLocalClientConnection:error:](self->_attachmentsService, "resolveAttachmentsForRequest:bundleIdentifier:fromLocalClientConnection:error:", v8, v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationCommunicationContextService resolveCommunicationContextForRequest:bundleIdentifier:](self->_communicationContextService, "resolveCommunicationContextForRequest:bundleIdentifier:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)*MEMORY[0x24BDF8990];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8990], OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    objc_msgSend(v8, "content");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "communicationContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "content");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "communicationContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "content");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v23 = v9;
    v24 = 1026;
    v25 = v12 != v11;
    v26 = 1026;
    v27 = v20 != 0;
    v28 = 1026;
    v29 = v15 != 0;
    v30 = 2114;
    v31 = v17;
    _os_log_impl(&dword_216DCB000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notification serviced by the communication context service: %{public}d. Has original context: %{public}d. Has serviced context: %{public}d. Type: %{public}@", buf, 0x28u);

  }
  return v12;
}

- (void)_saveNotificationRecord:(id)a3 shouldRepost:(BOOL)a4 forBundleIdentifier:(id)a5 withCompletionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  UNCNotificationSchedulingService *notificationSchedulingService;
  void *v14;
  id *v15;
  id v16;
  void *v17;
  void *v18;
  UNCNotificationRepository *notificationRepository;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[2];

  v8 = a4;
  v25[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "hasPendingTrigger"))
  {
    notificationSchedulingService = self->_notificationSchedulingService;
    v25[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __126__UNSUserNotificationServerConnectionListener__saveNotificationRecord_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke;
    v23[3] = &unk_24D639DB8;
    v15 = &v24;
    v24 = v12;
    v16 = v12;
    -[UNCNotificationSchedulingService addPendingNotificationRecords:forBundleIdentifier:withCompletionHandler:](notificationSchedulingService, "addPendingNotificationRecords:forBundleIdentifier:withCompletionHandler:", v14, v11, v23);

  }
  else
  {
    objc_msgSend(v10, "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDate:", v18);

    }
    notificationRepository = self->_notificationRepository;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __126__UNSUserNotificationServerConnectionListener__saveNotificationRecord_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke_2;
    v21[3] = &unk_24D63A770;
    v15 = &v22;
    v22 = v12;
    v20 = v12;
    -[UNCNotificationRepository saveNotificationRecord:shouldRepost:forBundleIdentifier:withCompletionHandler:](notificationRepository, "saveNotificationRecord:shouldRepost:forBundleIdentifier:withCompletionHandler:", v10, v8, v11, v21);
  }

}

uint64_t __126__UNSUserNotificationServerConnectionListener__saveNotificationRecord_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __126__UNSUserNotificationServerConnectionListener__saveNotificationRecord_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setNotificationRequests:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  id v19;
  BOOL v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    *(_DWORD *)buf = 138543618;
    v34 = v7;
    v35 = 2048;
    v36 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_216DCB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting %ld notification requests", buf, 0x16u);

  }
  if (objc_msgSend(v8, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v7))
  {
    v24 = v8;
    -[UNCNotificationRepository removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:](self->_notificationRepository, "removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:", v7);
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v25 = v6;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          v27 = 0;
          -[UNSUserNotificationServerConnectionListener _serviceResolvedNotificationRequest:forBundleIdentifier:error:](self, "_serviceResolvedNotificationRequest:forBundleIdentifier:error:", v17, v7, &v27);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v27;
          if (v19)
            v20 = 1;
          else
            v20 = v18 == 0;
          if (v20)
          {
            v21 = (void *)*MEMORY[0x24BDF8998];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
            {
              v22 = v21;
              objc_msgSend(v19, "localizedDescription");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v34 = v7;
              v35 = 2114;
              v36 = (uint64_t)v26;
              _os_log_error_impl(&dword_216DCB000, v22, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot set notification requests because there are no validated requests. Error: %{public}@", buf, 0x16u);

            }
          }
          else
          {
            objc_msgSend(v11, "addObject:", v18);
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v14);
    }

    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "bs_map:", *MEMORY[0x24BEBF518]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNCNotificationSchedulingService setPendingNotificationRecords:forBundleIdentifier:](self->_notificationSchedulingService, "setPendingNotificationRecords:forBundleIdentifier:", v23, v7);

    }
    v8 = v24;
    v6 = v25;
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener setNotificationRequests:forBundleIdentifier:].cold.1();
  }

}

- (void)setNotificationRequests:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;

  v9 = a5;
  -[UNSUserNotificationServerConnectionListener setNotificationRequests:forBundleIdentifier:](self, "setNotificationRequests:forBundleIdentifier:", a3, a4);
  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    v8 = v9;
  }

}

- (void)removeSimilarNotificationRequests:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  os_log_t *v12;
  NSObject *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (os_log_t *)MEMORY[0x24BDF8998];
  v13 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543362;
    v16 = v9;
    _os_log_impl(&dword_216DCB000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing similar notification requests", (uint8_t *)&v15, 0xCu);
  }
  if (!objc_msgSend(v11, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v9))
  {
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
    {
      -[UNSUserNotificationServerConnectionListener removeSimilarNotificationRequests:forBundleIdentifier:completionHandler:].cold.1();
      if (!v10)
        goto LABEL_10;
    }
    else if (!v10)
    {
      goto LABEL_10;
    }
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    goto LABEL_10;
  }
  objc_msgSend(v8, "bs_map:", *MEMORY[0x24BEBF518]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationRepository removeSimilarNotificationRecords:bundleIdentifier:](self->_notificationRepository, "removeSimilarNotificationRecords:bundleIdentifier:", v14, v9);
  -[UNCNotificationSchedulingService removeSimilarPendingNotificationRecords:forBundleIdentifier:](self->_notificationSchedulingService, "removeSimilarPendingNotificationRecords:forBundleIdentifier:", v14, v9);
  if (v10)
    (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, 1, 0);

LABEL_10:
}

uint64_t __114__UNSUserNotificationServerConnectionListener_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "triggerType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BEBF538]) ^ 1;

  return v3;
}

- (void)removeAllDeliveredNotificationsForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  os_log_t *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (os_log_t *)MEMORY[0x24BDF8998];
  v10 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v6;
    _os_log_impl(&dword_216DCB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing all delivered notifications", (uint8_t *)&v12, 0xCu);
  }
  v11 = objc_msgSend(v8, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6);
  if ((_DWORD)v11)
  {
    -[UNCNotificationRepository removeAllNotificationRecordsForBundleIdentifier:](self->_notificationRepository, "removeAllNotificationRecordsForBundleIdentifier:", v6);
    if (!v7)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener removeAllDeliveredNotificationsForBundleIdentifier:completionHandler:].cold.1();
    if (!v7)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (v7)
LABEL_8:
    v7[2](v7, v11, 0);
LABEL_9:

}

- (void)setBadgeString:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  os_log_t *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (os_log_t *)MEMORY[0x24BDF8998];
  v13 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543618;
    v15 = v9;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_216DCB000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting badge string to %{public}@", (uint8_t *)&v14, 0x16u);
  }
  if (objc_msgSend(v11, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v9))
  {
    -[UNCNotificationRepository setBadgeString:forBundleIdentifier:withCompletionHandler:](self->_notificationRepository, "setBadgeString:forBundleIdentifier:withCompletionHandler:", v8, v9, v10);
  }
  else if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener setBadgeString:forBundleIdentifier:withCompletionHandler:].cold.1();
  }

}

- (void)getNotificationTopicsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  id v8;
  void *v9;
  os_log_t *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (os_log_t *)MEMORY[0x24BDF8998];
  v11 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v6;
    _os_log_impl(&dword_216DCB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting topics", buf, 0xCu);
  }
  if (!objc_msgSend(v9, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6))
  {
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      -[UNSUserNotificationServerConnectionListener getNotificationTopicsForBundleIdentifier:withCompletionHandler:].cold.1();
      if (!v7)
        goto LABEL_16;
    }
    else if (!v7)
    {
      goto LABEL_16;
    }
LABEL_15:
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v20);

    goto LABEL_16;
  }
  -[UNCNotificationTopicRepository topicsForBundleIdentifier:](self->_topicRepository, "topicsForBundleIdentifier:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCLocalizationService bundleWithIdentifier:](self->_localizationService, "bundleWithIdentifier:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBF440]), "initWithBundle:", v21);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v13, "notificationTopicForNotificationTopicRecord:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v18));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  if (v7)
    goto LABEL_15;
LABEL_16:

}

- (void)isAccessToNotificationCenterAllowedForServiceExtensionWithIdentifier:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "uns_isAllowedFromDaemon"))
    v8 = objc_msgSend(MEMORY[0x24BEBF418], "isAccessToNotificationCenterAllowedForServiceExtensionWithIdentifier:", v9);
  else
    v8 = 0;
  v6[2](v6, v8, 0);

}

- (void)getClearedInfoForDataProviderMigrationWithBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  os_log_t *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (os_log_t *)MEMORY[0x24BDF8998];
  v9 = *MEMORY[0x24BDF8998];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543362;
    v16 = v6;
    _os_log_impl(&dword_216DCB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting cleared info", (uint8_t *)&v15, 0xCu);
  }
  -[UNSUserNotificationServerConnectionListener _currentConnection](self, "_currentConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6))
  {
    v11 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(CFSTR("~/Library/BulletinBoard/ClearedSections.plist"), "stringByExpandingTildeInPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryWithContentsOfFile:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectForKey:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    -[UNSUserNotificationServerConnectionListener getClearedInfoForDataProviderMigrationWithBundleIdentifier:withCompletionHandler:].cold.1();
  v14 = 0;
  if (v7)
LABEL_9:
    v7[2](v7, v14);
LABEL_10:

}

- (void)_removeConnectionForAllBundleIdentifiers:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __88__UNSUserNotificationServerConnectionListener__removeConnectionForAllBundleIdentifiers___block_invoke;
  v7[3] = &unk_24D639C20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __88__UNSUserNotificationServerConnectionListener__removeConnectionForAllBundleIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeConnectionForAllBundleIdentifiers:", *(_QWORD *)(a1 + 40));
}

uint64_t __107__UNSUserNotificationServerConnectionListener__queue_notificationsForNotificationRecords_bundleIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notificationForNotificationRecord:", a2);
}

uint64_t __114__UNSUserNotificationServerConnectionListener__queue_notificationRequestsForNotificationRecords_bundleIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notificationRequestForNotificationRecord:", a2);
}

- (void)_queue_addConnection:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_connectionsByBundleIdentifier, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_connectionsByBundleIdentifier, "setObject:forKey:", v7, v6);
  }
  objc_msgSend(v7, "addObject:", v9);
  -[NSMapTable objectForKey:](self->_bundleIdentifiersByConnection, "objectForKey:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_bundleIdentifiersByConnection, "setObject:forKey:", v8, v9);
  }
  objc_msgSend(v8, "addObject:", v6);

}

- (void)_queue_removeConnection:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_connectionsByBundleIdentifier, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v9);
  if (!objc_msgSend(v7, "count"))
    -[NSMutableDictionary removeObjectForKey:](self->_connectionsByBundleIdentifier, "removeObjectForKey:", v6);
  -[NSMapTable objectForKey:](self->_bundleIdentifiersByConnection, "objectForKey:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v6);
  if (!objc_msgSend(v8, "count"))
    -[NSMapTable removeObjectForKey:](self->_bundleIdentifiersByConnection, "removeObjectForKey:", v9);

}

- (void)_queue_removeConnectionForAllBundleIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMapTable objectForKey:](self->_bundleIdentifiersByConnection, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[UNSUserNotificationServerConnectionListener _queue_removeConnection:forBundleIdentifier:](self, "_queue_removeConnection:forBundleIdentifier:", v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)_queue_delegateConnectionForBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_connectionsByBundleIdentifier, "objectForKey:", v4);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "processIdentifier", (_QWORD)v12);
        BSBundleIDForPID();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "isEqualToString:", v10))
        {
          v6 = v9;

          goto LABEL_11;
        }

      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_communicationContextService, 0);
  objc_storeStrong((id *)&self->_locationMonitor, 0);
  objc_storeStrong((id *)&self->_attachmentsService, 0);
  objc_storeStrong((id *)&self->_remoteNotificationService, 0);
  objc_storeStrong((id *)&self->_remoteNotificationConnectionListener, 0);
  objc_storeStrong((id *)&self->_topicRepository, 0);
  objc_storeStrong((id *)&self->_notificationRepository, 0);
  objc_storeStrong((id *)&self->_notificationSettingsService, 0);
  objc_storeStrong((id *)&self->_notificationsAuthorizationService, 0);
  objc_storeStrong((id *)&self->_notificationSchedulingService, 0);
  objc_storeStrong((id *)&self->_categoryRepository, 0);
  objc_storeStrong((id *)&self->_localizationService, 0);
  objc_storeStrong((id *)&self->_applicationLauncher, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiersByConnection, 0);
  objc_storeStrong((id *)&self->_connectionsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)requestAuthorizationWithOptions:forBundleIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Requesting authorization failed because bundle identifier does not match a known application or bundle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)requestAuthorizationWithOptions:forBundleIdentifier:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Requesting authorization failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)requestRemoveAuthorizationForBundleIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Requesting remove authorization failed because bundle identifier does not match a known application or bundle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)requestRemoveAuthorizationForBundleIdentifier:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Requesting remove authorization failed because client is not internal user notifications tool", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getNotificationSettingsForBundleIdentifier:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Getting notification settings failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getNotificationCategoriesForBundleIdentifier:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Getting notification categories failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setNotificationCategories:forBundleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Setting notification categories failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addNotificationRequest:forBundleIdentifier:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Adding notification request failed because of disallowed userInfo", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addNotificationRequest:forBundleIdentifier:withCompletionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Adding notification request failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)replaceContentForRequestWithIdentifier:bundleIdentifier:replacementContent:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Replacing notification content failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_saveNotificationRequest:shouldRepost:deliveredDate:forBundleIdentifier:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "Attempted to add notification request with invalid identifier for bundle '%{public}@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setNotificationRequests:forBundleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Setting notification requests failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getPendingNotificationRequestsForBundleIdentifier:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Getting pending notification requests failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removePendingNotificationRequestsWithIdentifiers:forBundleIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Removing pending notification requests failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeSimilarNotificationRequests:forBundleIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Removing similar notification requests failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeAllPendingNotificationRequestsForBundleIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Removing all pending notification requests failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getDeliveredNotificationsForBundleIdentifier:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Getting delivered notifications failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeDeliveredNotificationsWithIdentifiers:forBundleIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Removing delivered notifications failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeAllDeliveredNotificationsForBundleIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Removing all delivered notifications failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getBadgeNumberForBundleIdentifier:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Getting badge number failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setBadgeNumber:forBundleIdentifier:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Setting badge number failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setBadgeCount:forBundleIdentifier:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Setting badge count failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setBadgeString:forBundleIdentifier:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Setting badge string failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setNotificationTopics:forBundleIdentifier:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Setting topics failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getNotificationTopicsForBundleIdentifier:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Getting notification topics failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getNotificationSettingsForTopicsWithBundleIdentifier:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Getting notification settings for topics failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setConnectionDetails:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_216DCB000, a1, a3, "Failed to set connection details", a5, a6, a7, a8, 0);
}

- (void)getClearedInfoForDataProviderMigrationWithBundleIdentifier:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Getting cleared info for topic failed because of missing entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_currentConnection
{
  OUTLINED_FUNCTION_3(&dword_216DCB000, a1, a3, "XPC current connection is unexpectedly nil", a5, a6, a7, a8, 0);
}

@end
