@implementation UNCNotificationSystemServiceConnection

- (UNCNotificationSystemServiceConnection)initWithConnection:(id)a3 connectionDelegate:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  UNCNotificationSystemServiceConnection *v12;
  UNCNotificationSystemServiceConnection *v13;
  BSServiceConnectionHost *connection;
  _QWORD v16[4];
  UNCNotificationSystemServiceConnection *v17;
  id v18;
  id location;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)UNCNotificationSystemServiceConnection;
  v12 = -[UNCNotificationSystemServiceConnection init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    objc_storeWeak((id *)&v13->_connectionDelegate, v10);
    objc_storeWeak((id *)&v13->_delegate, v11);
    objc_initWeak(&location, v13);
    connection = v13->_connection;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __89__UNCNotificationSystemServiceConnection_initWithConnection_connectionDelegate_delegate___block_invoke;
    v16[3] = &unk_251AE07A8;
    v17 = v13;
    objc_copyWeak(&v18, &location);
    -[BSServiceConnectionHost configureConnection:](connection, "configureConnection:", v16);
    -[BSServiceConnectionHost activate](v13->_connection, "activate");
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }

  return v13;
}

void __89__UNCNotificationSystemServiceConnection_initWithConnection_connectionDelegate_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE0FA38], "userInitiated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[UNCNotificationSystemService serviceInterface](UNCNotificationSystemService, "serviceInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __89__UNCNotificationSystemServiceConnection_initWithConnection_connectionDelegate_delegate___block_invoke_2;
  v9[3] = &unk_251AE0780;
  a1 += 40;
  objc_copyWeak(&v10, (id *)a1);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __89__UNCNotificationSystemServiceConnection_initWithConnection_connectionDelegate_delegate___block_invoke_2;
  v7[3] = &unk_251AE0780;
  objc_copyWeak(&v8, (id *)a1);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);

}

void __89__UNCNotificationSystemServiceConnection_initWithConnection_connectionDelegate_delegate___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;
  id v3;
  void *v4;
  uint8_t v5[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = *MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2499A5000, v2, OS_LOG_TYPE_INFO, "System service connection is interrupted", v5, 2u);
    }
    v3 = objc_loadWeakRetained(WeakRetained + 1);
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "systemServiceConnectionDidInvalidate:", WeakRetained);

  }
}

{
  id *WeakRetained;
  NSObject *v2;
  id v3;
  void *v4;
  uint8_t v5[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = *MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2499A5000, v2, OS_LOG_TYPE_INFO, "System service connection is invalidated", v5, 2u);
    }
    v3 = objc_loadWeakRetained(WeakRetained + 1);
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "systemServiceConnectionDidInvalidate:", WeakRetained);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnectionHost invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UNCNotificationSystemServiceConnection;
  -[UNCNotificationSystemServiceConnection dealloc](&v3, sel_dealloc);
}

- (id)badgeNumberForBundleIdentifier:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "badgeNumberForBundleIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8A08], OS_LOG_TYPE_ERROR))
      -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:].cold.1();
    v7 = 0;
  }

  return v7;
}

- (BOOL)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = objc_msgSend(WeakRetained, "setBadgeNumber:forBundleIdentifier:", v6, v7);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8A08], OS_LOG_TYPE_ERROR))
      -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:].cold.1();
    v10 = 0;
  }

  return v10;
}

- (BOOL)setBadgeString:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = objc_msgSend(WeakRetained, "setBadgeString:forBundleIdentifier:", v6, v7);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8A08], OS_LOG_TYPE_ERROR))
      -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:].cold.1();
    v10 = 0;
  }

  return v10;
}

- (BOOL)isApplicationForeground:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  char v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = objc_msgSend(WeakRetained, "isApplicationForeground:", v4);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8A08], OS_LOG_TYPE_ERROR))
      -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:].cold.1();
    v7 = 0;
  }

  return v7;
}

- (void)willPresentNotification:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __104__UNCNotificationSystemServiceConnection_willPresentNotification_forBundleIdentifier_completionHandler___block_invoke;
    v13[3] = &unk_251AE07D0;
    v14 = v10;
    objc_msgSend(WeakRetained, "willPresentNotification:forBundleIdentifier:withCompletionHandler:", v8, v9, v13);
    v12 = v14;
LABEL_6:

    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8A08], OS_LOG_TYPE_ERROR))
  {
    -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:].cold.1();
    if (!v10)
      goto LABEL_7;
    goto LABEL_5;
  }
  if (v10)
  {
LABEL_5:
    _UNCNilDelegateError((uint64_t)"-[UNCNotificationSystemServiceConnection willPresentNotification:forBundleIdentifier:c"
                                  "ompletionHandler:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, void *))v10 + 2))(v10, &unk_251B12788, v12);
    goto LABEL_6;
  }
LABEL_7:

}

void __104__UNCNotificationSystemServiceConnection_willPresentNotification_forBundleIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  void *v5;
  id v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    v6 = a3;
    objc_msgSend(v5, "numberWithInteger:", a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v7, v6);

  }
}

- (void)notificationRepositoryDidPerformUpdates:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "notificationRepositoryDidPerformUpdates:forBundleIdentifier:", v6, v7);
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8A08], OS_LOG_TYPE_ERROR))
  {
    -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:].cold.1();
  }

}

- (void)notificationRepositoryDidDiscoverContentOnFirstUnlockForBundleIdentifier:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "notificationRepositoryDidDiscoverContentOnFirstUnlockForBundleIdentifier:", v4);
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8A08], OS_LOG_TYPE_ERROR))
  {
    -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:].cold.1();
  }

}

- (void)pendingNotificationRepositoryDidPerformUpdates:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "pendingNotificationRepositoryDidPerformUpdates:forBundleIdentifier:", v6, v7);
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8A08], OS_LOG_TYPE_ERROR))
  {
    -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:].cold.1();
  }

}

- (void)categoryRepositoryDidChangeCategoriesForBundleIdentifier:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "categoryRepositoryDidChangeCategoriesForBundleIdentifier:", v4);
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8A08], OS_LOG_TYPE_ERROR))
  {
    -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:].cold.1();
  }

}

- (void)topicRepositoryDidChangeTopicsForBundleIdentifier:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "topicRepositoryDidChangeTopicsForBundleIdentifier:", v4);
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8A08], OS_LOG_TYPE_ERROR))
  {
    -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:].cold.1();
  }

}

- (void)removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "removeNotificationRecordsForIdentifiers:bundleIdentifier:", v6, v7);
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8A08], OS_LOG_TYPE_ERROR))
  {
    -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:].cold.1();
  }

}

- (id)allBundleIdentifiersForCategories
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "allBundleIdentifiersForCategories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8A08], OS_LOG_TYPE_ERROR))
      -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:].cold.1();
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v4;
}

- (id)categoryForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "categoryForIdentifier:bundleIdentifier:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8A08], OS_LOG_TYPE_ERROR))
      -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:].cold.1();
    v10 = 0;
  }

  return v10;
}

- (id)categoriesForBundleIdentifier:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "categoriesForBundleIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8A08], OS_LOG_TYPE_ERROR))
      -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:].cold.1();
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v7;
}

- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setCategories:forBundleIdentifier:", v6, v7);
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8A08], OS_LOG_TYPE_ERROR))
  {
    -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:].cold.1();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_connectionDelegate);
}

- (void)badgeNumberForBundleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2499A5000, v0, v1, "Delegate is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
