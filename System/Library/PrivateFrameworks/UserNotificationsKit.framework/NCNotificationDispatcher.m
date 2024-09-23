@implementation NCNotificationDispatcher

- (void)updateNotificationSectionSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(v4, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEBUG))
    -[NCNotificationDispatcher updateNotificationSectionSettings:].cold.1();
  -[NCNotificationDispatcher sectionSettings](self, "sectionSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationDispatcher sectionSettings](self, "sectionSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v4, v5);

  -[NCNotificationDispatcher destinationsRegistry](self, "destinationsRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registeredDestinations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = v10;
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
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "updateNotificationSectionSettings:previousSectionSettings:", v4, v7, (_QWORD)v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (NSMutableDictionary)sectionSettings
{
  return self->_sectionSettings;
}

- (void)notificationsLoadedForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEBUG))
    -[NCNotificationDispatcher notificationsLoadedForSectionIdentifier:].cold.1();
  -[NCNotificationDispatcher destinationsRegistry](self, "destinationsRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registeredDestinations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "notificationsLoadedForSectionIdentifier:", v4, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (NCNotificationDestinationsRegistry)destinationsRegistry
{
  return self->_destinationsRegistry;
}

- (NCNotificationDispatcher)init
{
  -[NCNotificationDispatcher doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (NCNotificationDispatcher)initWithAlertingController:(id)a3
{
  id v5;
  NCNotificationDispatcher *v6;
  NSObject *v7;
  uint64_t v8;
  NCNotificationDestinationsRegistry *destinationsRegistry;
  uint64_t v10;
  NSMutableDictionary *sectionSettings;
  uint64_t v12;
  NSHashTable *sourceDelegates;
  NCLayoutLoopDetector *v14;
  NCLayoutLoopDetector *layoutDetector;
  NCNotificationAlertQueue *v16;
  NCNotificationAlertQueue *alertQueue;
  objc_super v19;
  uint8_t buf[4];
  NCNotificationDispatcher *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NCNotificationDispatcher;
  v6 = -[NCNotificationDispatcher init](&v19, sel_init);
  if (v6)
  {
    NCRegisterUserNotificationsUILogging();
    v7 = NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v6;
      _os_log_impl(&dword_2149F4000, v7, OS_LOG_TYPE_DEFAULT, "Initializing notifications dispatcher %{public}@", buf, 0xCu);
    }
    v8 = objc_opt_new();
    destinationsRegistry = v6->_destinationsRegistry;
    v6->_destinationsRegistry = (NCNotificationDestinationsRegistry *)v8;

    v10 = objc_opt_new();
    sectionSettings = v6->_sectionSettings;
    v6->_sectionSettings = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v12 = objc_claimAutoreleasedReturnValue();
    sourceDelegates = v6->_sourceDelegates;
    v6->_sourceDelegates = (NSHashTable *)v12;

    v14 = objc_alloc_init(NCLayoutLoopDetector);
    layoutDetector = v6->_layoutDetector;
    v6->_layoutDetector = v14;

    objc_storeStrong((id *)&v6->_alertingController, a3);
    v16 = objc_alloc_init(NCNotificationAlertQueue);
    alertQueue = v6->_alertQueue;
    v6->_alertQueue = v16;

    -[NCNotificationAlertQueue setDelegate:](v6->_alertQueue, "setDelegate:", v6);
  }

  return v6;
}

- (void)postNotificationWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  __int128 *p_buf;
  os_activity_scope_state_s state;
  uint8_t v30[4];
  void *v31;
  __int128 buf;
  uint64_t v33;
  char v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BSDispatchQueueAssertMain();
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = _os_activity_create(&dword_2149F4000, "post-notification", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  v6 = (id)NCUILogDispatch;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "loggingDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_2149F4000, v6, OS_LOG_TYPE_DEFAULT, "Posting notification %{public}@", (uint8_t *)&buf, 0xCu);

  }
  -[NCNotificationDispatcher destinationsRegistry](self, "destinationsRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestDestinations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destinationIdentifiersForRequestDestinations:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationDispatcher alertingController](self, "alertingController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "alertOnPostForNotificationRequest:forRequestDestinations:", v4, v10);

  if (-[NCNotificationDispatcher _shouldPostNotificationRequest:](self, "_shouldPostNotificationRequest:", v4))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v33 = 0x2020000000;
    v34 = 0;
    -[NCNotificationDispatcher _willPostNotificationRequest:](self, "_willPostNotificationRequest:", v4);
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __56__NCNotificationDispatcher_postNotificationWithRequest___block_invoke;
    v26[3] = &unk_24D270370;
    v26[4] = self;
    v12 = v4;
    v27 = v12;
    p_buf = &buf;
    -[NCNotificationDispatcher _performOperationForRequestDestinations:block:](self, "_performOperationForRequestDestinations:block:", v12, v26);
    -[NCNotificationDispatcher _didPostNotificationRequest:](self, "_didPostNotificationRequest:", v12);
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      v13 = (id)NCUILogDispatch;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "notificationIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "un_logDigest");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v30 = 138543362;
        v31 = v15;
        _os_log_impl(&dword_2149F4000, v13, OS_LOG_TYPE_DEFAULT, "Not rolling banner for notification %{public}@; CoverSheet is active",
          v30,
          0xCu);

      }
    }
    else
    {
      -[NCNotificationDispatcher destinationsRegistry](self, "destinationsRegistry");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "requestDestinations");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "destinationsForRequestDestinations:", v20);
      v13 = objc_claimAutoreleasedReturnValue();

      -[NCNotificationDispatcher alertQueue](self, "alertQueue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = -[NSObject containsObject:](v13, "containsObject:", v21);

      if ((_DWORD)v20)
      {
        v22 = (id)NCUILogDispatch;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "notificationIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "un_logDigest");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v30 = 138543362;
          v31 = v24;
          _os_log_impl(&dword_2149F4000, v22, OS_LOG_TYPE_DEFAULT, "Rolling banner for notification %{public}@", v30, 0xCu);

        }
        -[NCNotificationDispatcher alertQueue](self, "alertQueue");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "postNotificationRequest:", v12);

      }
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v16 = (id)NCUILogDispatch;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "notificationIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "un_logDigest");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_2149F4000, v16, OS_LOG_TYPE_DEFAULT, "Not posting notification %{public}@ because it was marked as unsafe", (uint8_t *)&buf, 0xCu);

    }
    -[NCNotificationDispatcher _clearUnsafeNotification:](self, "_clearUnsafeNotification:", v4);
  }

  os_activity_scope_leave(&state);
}

void __56__NCNotificationDispatcher_postNotificationWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  char v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "alertQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 40);
      v8 = v6;
      objc_msgSend(v7, "notificationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "un_logDigest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v12;
      _os_log_impl(&dword_2149F4000, v8, OS_LOG_TYPE_DEFAULT, "Posting notification %{public}@ to destination %{public}@", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(v3, "postNotificationRequest:", *(_QWORD *)(a1 + 40));
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v13 = 1;
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = objc_msgSend(v3, "interceptsQueueRequest:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      v13 = 0;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v13;
  }

}

- (void)modifyNotificationWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BSDispatchQueueAssertMain();
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = _os_activity_create(&dword_2149F4000, "modify-notification", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  v6 = (id)NCUILogDispatch;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "loggingDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v7;
    _os_log_impl(&dword_2149F4000, v6, OS_LOG_TYPE_DEFAULT, "Modify notification %{public}@", buf, 0xCu);

  }
  if (-[NCNotificationDispatcher _shouldPostNotificationRequest:](self, "_shouldPostNotificationRequest:", v4))
  {
    -[NCNotificationDispatcher _willPostNotificationRequest:](self, "_willPostNotificationRequest:", v4);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __58__NCNotificationDispatcher_modifyNotificationWithRequest___block_invoke;
    v12[3] = &unk_24D270398;
    v8 = v4;
    v13 = v8;
    -[NCNotificationDispatcher _performOperationForRequestDestinations:block:](self, "_performOperationForRequestDestinations:block:", v8, v12);
    -[NCNotificationDispatcher _didPostNotificationRequest:](self, "_didPostNotificationRequest:", v8);

  }
  else
  {
    v9 = (id)NCUILogDispatch;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "notificationIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "un_logDigest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v11;
      _os_log_impl(&dword_2149F4000, v9, OS_LOG_TYPE_DEFAULT, "Not modifying notification notification %{public}@ because it was marked as unsafe", buf, 0xCu);

    }
    -[NCNotificationDispatcher _clearUnsafeNotification:](self, "_clearUnsafeNotification:", v4);
  }
  os_activity_scope_leave(&state);

}

void __58__NCNotificationDispatcher_modifyNotificationWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)NCUILogDispatch;
  if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "notificationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "un_logDigest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_2149F4000, v6, OS_LOG_TYPE_DEFAULT, "Modifying notification %{public}@ in destination %{public}@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(v3, "modifyNotificationRequest:", *(_QWORD *)(a1 + 32));

}

- (void)withdrawNotificationWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BSDispatchQueueAssertMain();
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = _os_activity_create(&dword_2149F4000, "withdraw-notification", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  v6 = (id)NCUILogDispatch;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "loggingDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v7;
    _os_log_impl(&dword_2149F4000, v6, OS_LOG_TYPE_DEFAULT, "Withdraw notification %{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __60__NCNotificationDispatcher_withdrawNotificationWithRequest___block_invoke;
  v22 = &unk_24D2703C0;
  v9 = v4;
  v23 = v9;
  v10 = v8;
  v24 = v10;
  -[NCNotificationDispatcher _performOperationForRequestDestinations:block:](self, "_performOperationForRequestDestinations:block:", v9, &v19);
  -[NCNotificationDispatcher destinationsRegistry](self, "destinationsRegistry", v19, v20, v21, v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestDestinations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "destinationsForRequestDestinations:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "count"))
  {
    objc_msgSend(v9, "requestDestinations");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count") == 0;

    if (!v16)
    {
      v14 = (id)NCUILogDispatch;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "notificationIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "un_logDigest");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationDispatcher withdrawNotificationWithRequest:].cold.1(v18, (uint64_t)buf, v14, v17);
      }
      goto LABEL_9;
    }
  }
  if (objc_msgSend(v10, "isEqualToSet:", v13))
  {
    -[NCNotificationDispatcher alertingController](self, "alertingController");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject killAlertsForNotificationRequest:](v14, "killAlertsForNotificationRequest:", v9);
LABEL_9:

  }
  -[NCNotificationDispatcher _didRemoveNotificationRequest:](self, "_didRemoveNotificationRequest:", v9);

  os_activity_scope_leave(&state);
}

void __60__NCNotificationDispatcher_withdrawNotificationWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)NCUILogDispatch;
  if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "notificationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "un_logDigest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_2149F4000, v6, OS_LOG_TYPE_DEFAULT, "Withdrawing notification %{public}@ from destination %{public}@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(v3, "withdrawNotificationRequest:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (void)updateNotificationSystemSettings:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BSDispatchQueueAssertMain();
  -[NCNotificationDispatcher notificationSystemSettings](self, "notificationSystemSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationDispatcher setNotificationSystemSettings:](self, "setNotificationSystemSettings:", v4);
  v6 = NCUILogDispatch;
  if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl(&dword_2149F4000, v6, OS_LOG_TYPE_DEFAULT, "Posting updated system settings %@", buf, 0xCu);
  }
  -[NCNotificationDispatcher destinationsRegistry](self, "destinationsRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registeredDestinations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "updateNotificationSystemSettings:previousSystemSettings:", v4, v5, (_QWORD)v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (void)removeNotificationSectionWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  BSDispatchQueueAssertMain();
  if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEBUG))
    -[NCNotificationDispatcher removeNotificationSectionWithIdentifier:].cold.1();
  -[NCNotificationDispatcher sectionSettings](self, "sectionSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (void)registerDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[NCNotificationDispatcher _isRegisteredDestination:](self, "_isRegisteredDestination:", v4)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[NCNotificationDispatcher sectionSettings](self, "sectionSettings", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v4, "updateNotificationSectionSettings:previousSectionSettings:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), 0);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v4, "isAlertDestination"))
    -[NCNotificationDispatcher _registerAlertDestination:](self, "_registerAlertDestination:", v4);
  else
    -[NCNotificationDispatcher _registerDestination:](self, "_registerDestination:", v4);

}

- (void)unregisterDestination:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NCNotificationDispatcher alertQueue](self, "alertQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterDestination:", v4);

  -[NCNotificationDispatcher destinationsRegistry](self, "destinationsRegistry");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterDestination:", v4);

}

- (void)setDestination:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v8, "isAlertDestination"))
  {
    -[NCNotificationDispatcher alertQueue](self, "alertQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NCNotificationDispatcher destinationsRegistry](self, "destinationsRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(v6, "setDestination:enabled:", v8, v4);

}

- (void)_registerDestination:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NCNotificationDispatcher destinationsRegistry](self, "destinationsRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerDestination:", v5);

  objc_msgSend(v5, "setDelegate:", self);
}

- (void)_registerAlertDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[NCNotificationDispatcher alertQueue](self, "alertQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerDestination:", v4);

  objc_msgSend(v4, "identifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[NCNotificationDispatcher destinationsRegistry](self, "destinationsRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationDispatcher alertQueue](self, "alertQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerDestination:forIdentifier:", v7, v9);

  -[NCNotificationDispatcher destinationsRegistry](self, "destinationsRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDestinationWithIdentifier:enabled:", v9, 1);

}

- (BOOL)_isRegisteredDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v4, "isAlertDestination"))
  {
    -[NCNotificationDispatcher alertQueue](self, "alertQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NCNotificationDispatcher destinationsRegistry](self, "destinationsRegistry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  v7 = objc_msgSend(v5, "isRegisteredDestination:", v4);

  return v7;
}

- (void)addDispatcherSourceDelegate:(id)a3
{
  -[NSHashTable addObject:](self->_sourceDelegates, "addObject:", a3);
}

- (void)removeDispatcherSourceDelegate:(id)a3
{
  -[NSHashTable removeObject:](self->_sourceDelegates, "removeObject:", a3);
}

- (void)destination:(id)a3 requestPermissionToExecuteAction:(id)a4 forNotificationRequest:(id)a5 withParameters:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  void (**v16)(id, uint64_t);
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  NSObject *log;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (__CFString *)a6;
  v16 = (void (**)(id, uint64_t))a7;
  v17 = objc_msgSend(v13, "isSiriAction");
  -[NCNotificationDispatcher delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18 || (v17 & 1) != 0)
  {
    v16[2](v16, 1);
  }
  else
  {
    v19 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
    {
      log = v19;
      objc_msgSend(v13, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "notificationIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "un_logDigest");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[__CFString count](v15, "count");
      v23 = CFSTR("{}");
      *(_DWORD *)buf = 138543875;
      v27 = v24;
      if (v22)
        v23 = v15;
      v28 = 2114;
      v29 = v21;
      v30 = 2113;
      v31 = v23;
      _os_log_impl(&dword_2149F4000, log, OS_LOG_TYPE_DEFAULT, "Dispatcher will request permission to execute action %{public}@ for notification %{public}@ with parameters %{private}@", buf, 0x20u);

    }
    objc_msgSend(v18, "dispatcher:requestPermissionToExecuteAction:forDestination:notificationRequest:withParameters:completionBlock:", self, v13, v12, v14, v15, v16);
  }

}

- (void)destination:(id)a3 executeAction:(id)a4 forNotificationRequest:(id)a5 requestAuthentication:(BOOL)a6 withParameters:(id)a7 completion:(id)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  __CFString *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  __CFString *v38;
  NCNotificationDispatcher *v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  const __CFString *v47;
  uint64_t v48;

  v10 = a6;
  v48 = *MEMORY[0x24BDAC8D0];
  v34 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (__CFString *)a7;
  v17 = a8;
  -[NCNotificationDispatcher delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v33 = v17;
    v19 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      objc_msgSend(v14, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "notificationIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "un_logDigest");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[__CFString count](v16, "count");
      v25 = CFSTR("{}");
      *(_DWORD *)buf = 138543875;
      v43 = v21;
      if (v24)
        v25 = v16;
      v44 = 2114;
      v45 = v23;
      v46 = 2113;
      v47 = v25;
      _os_log_impl(&dword_2149F4000, v20, OS_LOG_TYPE_DEFAULT, "Dispatcher will execute action %{public}@ for notification %{public}@ with parameters %{private}@", buf, 0x20u);

    }
    if (objc_msgSend(v14, "isSiriAction"))
    {
      v26 = (void *)NCUILogDispatch;
      v10 = 0;
      if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
      {
        v27 = v26;
        objc_msgSend(v14, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "notificationIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "un_logDigest");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[__CFString count](v16, "count");
        v32 = CFSTR("{}");
        *(_DWORD *)buf = 138543875;
        v43 = v28;
        if (v31)
          v32 = v16;
        v44 = 2114;
        v45 = v30;
        v46 = 2113;
        v47 = v32;
        _os_log_impl(&dword_2149F4000, v27, OS_LOG_TYPE_DEFAULT, "Action can be run with Siri. Dispatcher is bypassing lockscreen authentication. Action %{public}@ for notification %{public}@ with parameters %{private}@", buf, 0x20u);

        v10 = 0;
      }
    }
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __125__NCNotificationDispatcher_destination_executeAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke;
    v35[3] = &unk_24D270460;
    v36 = v34;
    v37 = v14;
    v38 = v16;
    v17 = v33;
    v41 = v33;
    v39 = self;
    v40 = v15;
    objc_msgSend(v18, "dispatcher:willExecuteAction:forDestination:notificationRequest:requestAuthentication:withParameters:completionBlock:", self, v37, v36, v40, v10, v38, v35);

  }
}

void __125__NCNotificationDispatcher_destination_executeAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke(id *a1, int a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    objc_msgSend(a1[4], "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "endpoint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)NCUILogDispatch;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1[5], "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(a1[6], "count"))
        v9 = (const __CFString *)a1[6];
      else
        v9 = CFSTR("{}");
      *(_DWORD *)buf = 138543875;
      v29 = v6;
      v30 = 2114;
      v31 = v8;
      v32 = 2113;
      v33 = v9;
      _os_log_impl(&dword_2149F4000, v5, OS_LOG_TYPE_DEFAULT, "Dispatcher executing action %{public}@ from destination %{public}@ with parameters %{private}@", buf, 0x20u);

    }
    objc_msgSend(a1[5], "actionRunner");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(a1[5], "actionRunner");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = a1[5];
      v20 = a1[6];
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __125__NCNotificationDispatcher_destination_executeAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke_43;
      v26[3] = &unk_24D270410;
      v21 = &v27;
      v27 = a1[9];
      objc_msgSend(v18, "executeAction:fromOrigin:endpoint:withParameters:completion:", v19, v3, v4, v20, v26);

    }
    else
    {
      v22 = (void *)NCUILogDispatch;
      if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_ERROR))
        __125__NCNotificationDispatcher_destination_executeAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke_cold_1(a1 + 5, v22);
      v23 = a1[9];
      if (!v23)
        goto LABEL_18;
      v21 = &v25;
      v25 = v23;
      BSDispatchMain();
    }

LABEL_18:
    objc_msgSend(a1[7], "_notifyDidExecuteAction:forNotificationRequest:", a1[5], a1[8]);

    goto LABEL_19;
  }
  v10 = (void *)NCUILogDispatch;
  if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
  {
    v11 = a1[5];
    v12 = v10;
    objc_msgSend(v11, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[8], "notificationIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "un_logDigest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v13;
    v30 = 2114;
    v31 = v15;
    _os_log_impl(&dword_2149F4000, v12, OS_LOG_TYPE_DEFAULT, "Dispatcher delegate prevented execution of action %{public}@ for notification %{public}@", buf, 0x16u);

  }
  v16 = a1[9];
  if (v16)
  {
    v24 = v16;
    BSDispatchMain();
    v3 = v24;
LABEL_19:

  }
}

void __125__NCNotificationDispatcher_destination_executeAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke_43(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v2 = v1;
    BSDispatchMain();

  }
}

uint64_t __125__NCNotificationDispatcher_destination_executeAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __125__NCNotificationDispatcher_destination_executeAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke_46(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __125__NCNotificationDispatcher_destination_executeAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)notificationSectionSettingsForDestination:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCF20];
  -[NCNotificationDispatcher sectionSettings](self, "sectionSettings", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (id)notificationSectionSettingsForDestination:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[NCNotificationDispatcher sectionSettings](self, "sectionSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)destination:(id)a3 requestsClearingNotificationRequests:(id)a4
{
  id v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_sourceDelegates;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "dispatcher:requestsClearingNotificationRequests:", self, v5, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)destination:(id)a3 requestsClearingNotificationRequests:(id)a4 fromDestinations:(id)a5
{
  id v7;
  id v8;
  NSHashTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_sourceDelegates;
  v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "dispatcher:requestsClearingNotificationRequests:fromDestinations:", self, v7, v8, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)destination:(id)a3 requestsClearingNotificationRequestsInSections:(id)a4
{
  id v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_sourceDelegates;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "dispatcher:requestsClearingNotificationRequestsInSections:", self, v5, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)destination:(id)a3 requestsClearingNotificationRequestsFromDate:(id)a4 toDate:(id)a5 inSections:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSHashTable *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_sourceDelegates;
  v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "dispatcher:requestsClearingNotificationRequestsFromDate:toDate:inSections:", self, v9, v10, v11, (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (void)destination:(id)a3 setAllowsNotifications:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v5 = a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_sourceDelegates;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "dispatcher:setAllowsNotifications:forSectionIdentifier:", self, v5, v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)destination:(id)a3 setDeliverQuietly:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v5 = a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_sourceDelegates;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "dispatcher:setDeliverQuietly:forSectionIdentifier:", self, v5, v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)destination:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  NSHashTable *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v9 = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_sourceDelegates;
  v15 = -[NSHashTable countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "dispatcher:setMuted:untilDate:forSectionIdentifier:threadIdentifier:", self, v9, v11, v12, v13, (_QWORD)v19);
      }
      while (v16 != v18);
      v16 = -[NSHashTable countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

}

- (void)destination:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v5 = a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_sourceDelegates;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "dispatcher:setAllowsCriticalAlerts:forSectionIdentifier:", self, v5, v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)destination:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v5 = a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_sourceDelegates;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "dispatcher:setAllowsTimeSensitive:forSectionIdentifier:", self, v5, v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)destination:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v5 = a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_sourceDelegates;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "dispatcher:setAllowsDirectMessages:forSectionIdentifier:", self, v5, v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)destination:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v5 = a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_sourceDelegates;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "dispatcher:setScheduledDelivery:forSectionIdentifier:", self, v5, v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)destination:(id)a3 setSystemScheduledDeliveryEnabled:(BOOL)a4 scheduledDeliveryTimes:(id)a5
{
  _BOOL8 v5;
  id v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v5 = a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_sourceDelegates;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "dispatcher:setSystemScheduledDeliveryEnabled:scheduledDeliveryTimes:", self, v5, v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (id)destination:(id)a3 notificationRequestForUUID:(id)a4
{
  id v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_sourceDelegates;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "dispatcher:notificationRequestForUUID:", self, v5, (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        ++v11;
        v12 = v9;
      }
      while (v8 != v11);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)destination:(id)a3 setNotificationSystemSettings:(id)a4
{
  id v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_sourceDelegates;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "dispatcher:setNotificationSystemSettings:", self, v5, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)destination:(id)a3 willPresentNotificationRequest:(id)a4
{
  -[NCNotificationDispatcher destination:willPresentNotificationRequest:suppressAlerts:](self, "destination:willPresentNotificationRequest:suppressAlerts:", a3, a4, 0);
}

- (void)destination:(id)a3 willPresentNotificationRequest:(id)a4 suppressAlerts:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  if (!a5)
  {
    v7 = a4;
    v8 = a3;
    -[NCNotificationDispatcher alertingController](self, "alertingController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "alertOnPresentationForNotificationRequest:presentingDestination:", v7, v9);
  }
}

- (void)destination:(id)a3 didPresentNotificationRequest:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[NCNotificationDispatcher alertingController](self, "alertingController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetAutomaticLockStateForNotificationRequest:", v5);

}

- (void)destination:(id)a3 didDismissNotificationRequest:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[NCNotificationDispatcher alertingController](self, "alertingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "killAlertsForNotificationRequest:", v5);

  -[NCNotificationDispatcher alertingController](self, "alertingController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetAutomaticLockStateForNotificationRequest:", v5);

}

- (void)_performOperationForRequestDestinations:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = (void *)objc_opt_new();
  -[NCNotificationDispatcher destinationsRegistry](self, "destinationsRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestDestinations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "destinationsForRequestDestinations:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16);
        if (v17
          && (objc_msgSend(v8, "containsObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16), (_QWORD)v21) & 1) == 0)
        {
          v7[2](v7, v17);
          objc_msgSend(v8, "addObject:", v17);
        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(v6, "requestDestinations");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      v20 = (void *)NCUILogDispatch;
      if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_ERROR))
        -[NCNotificationDispatcher _performOperationForRequestDestinations:block:].cold.1(v20, v6);
    }
  }

}

- (BOOL)_shouldPostNotificationRequest:(id)a3
{
  return !-[NCLayoutLoopDetector layoutInProgressContainsNotificationRequest:](self->_layoutDetector, "layoutInProgressContainsNotificationRequest:", a3);
}

- (void)_willPostNotificationRequest:(id)a3
{
  -[NCLayoutLoopDetector addNotificationRequestToLayoutsInProgress:](self->_layoutDetector, "addNotificationRequestToLayoutsInProgress:", a3);
}

- (void)_didPostNotificationRequest:(id)a3
{
  -[NCLayoutLoopDetector removeNotificationRequestFromLayoutsInProgress:](self->_layoutDetector, "removeNotificationRequestFromLayoutsInProgress:", a3);
}

- (void)_didRemoveNotificationRequest:(id)a3
{
  -[NCLayoutLoopDetector removeNotificationRequestFromLayoutsInProgress:](self->_layoutDetector, "removeNotificationRequestFromLayoutsInProgress:", a3);
}

- (void)_clearUnsafeNotification:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_sourceDelegates;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4, (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dispatcher:requestsClearingNotificationRequests:", self, v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)_notifyDidExecuteAction:(id)a3 forNotificationRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSHashTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NCNotificationDispatcher delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatcher:didExecuteAction:forNotificationRequest:", self, v6, v7);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_sourceDelegates;
  v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "dispatcher:didExecuteAction:forNotificationRequest:", self, v6, v7, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (NCNotificationDispatcherDelegate)delegate
{
  return (NCNotificationDispatcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setDestinationsRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_destinationsRegistry, a3);
}

- (NCNotificationAlertQueue)alertQueue
{
  return self->_alertQueue;
}

- (void)setAlertQueue:(id)a3
{
  objc_storeStrong((id *)&self->_alertQueue, a3);
}

- (void)setSectionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_sectionSettings, a3);
}

- (NSHashTable)sourceDelegates
{
  return self->_sourceDelegates;
}

- (void)setSourceDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_sourceDelegates, a3);
}

- (NCLayoutLoopDetector)layoutDetector
{
  return self->_layoutDetector;
}

- (void)setLayoutDetector:(id)a3
{
  objc_storeStrong((id *)&self->_layoutDetector, a3);
}

- (NCNotificationSystemSettings)notificationSystemSettings
{
  return self->_notificationSystemSettings;
}

- (void)setNotificationSystemSettings:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSystemSettings, a3);
}

- (NCAlertingController)alertingController
{
  return self->_alertingController;
}

- (void)setAlertingController:(id)a3
{
  objc_storeStrong((id *)&self->_alertingController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertingController, 0);
  objc_storeStrong((id *)&self->_notificationSystemSettings, 0);
  objc_storeStrong((id *)&self->_layoutDetector, 0);
  objc_storeStrong((id *)&self->_sourceDelegates, 0);
  objc_storeStrong((id *)&self->_sectionSettings, 0);
  objc_storeStrong((id *)&self->_alertQueue, 0);
  objc_storeStrong((id *)&self->_destinationsRegistry, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)withdrawNotificationWithRequest:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_1(&dword_2149F4000, a3, (uint64_t)a3, "No destination withdraws performed for notification %{public}@", (uint8_t *)a2);

}

- (void)updateNotificationSectionSettings:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_2149F4000, v0, v1, "Posting section settings %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)removeNotificationSectionWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_2149F4000, v0, v1, "Removing section settings %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)notificationsLoadedForSectionIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_2149F4000, v0, v1, "Notifications loaded for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __125__NCNotificationDispatcher_destination_executeAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke_cold_1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_2149F4000, v3, v5, "Action %{public}@ can't be executed because it has no runner", v6);

  OUTLINED_FUNCTION_4();
}

- (void)_performOperationForRequestDestinations:(void *)a1 block:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "requestDestinations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_2149F4000, v3, v5, "No active destinations for request destinations: %{public}@", v6);

  OUTLINED_FUNCTION_4();
}

@end
