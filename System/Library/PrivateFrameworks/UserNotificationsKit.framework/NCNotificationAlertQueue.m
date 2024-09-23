@implementation NCNotificationAlertQueue

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NCNotificationAlertQueue destinationsRegistry](self, "destinationsRegistry", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registeredDestinations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

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
          objc_msgSend(v14, "updateNotificationSectionSettings:previousSectionSettings:", v6, v7);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (NCNotificationDestinationsRegistry)destinationsRegistry
{
  return self->_destinationsRegistry;
}

- (NCNotificationAlertQueue)init
{
  NCNotificationAlertQueue *v2;
  NCNotificationCollapsingQueue *v3;
  NCNotificationCollapsingQueue *queue;
  uint64_t v5;
  NCNotificationDestinationsRegistry *destinationsRegistry;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCNotificationAlertQueue;
  v2 = -[NCNotificationAlertQueue init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(NCNotificationCollapsingQueue);
    queue = v2->_queue;
    v2->_queue = v3;

    v5 = objc_opt_new();
    destinationsRegistry = v2->_destinationsRegistry;
    v2->_destinationsRegistry = (NCNotificationDestinationsRegistry *)v5;

  }
  return v2;
}

- (void)registerDestination:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NCNotificationAlertQueue destinationsRegistry](self, "destinationsRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerDestination:", v5);

  objc_msgSend(v5, "setDelegate:", self);
}

- (void)unregisterDestination:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NCNotificationAlertQueue destinationsRegistry](self, "destinationsRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterDestination:", v5);

  objc_msgSend(v5, "setDelegate:", 0);
}

- (void)setDestination:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[NCNotificationAlertQueue destinationsRegistry](self, "destinationsRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDestination:enabled:", v7, v4);

  -[NCNotificationAlertQueue setDestination:ready:](self, "setDestination:ready:", v7, v4);
}

- (BOOL)isRegisteredDestination:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[NCNotificationAlertQueue destinationsRegistry](self, "destinationsRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRegisteredDestination:", v4);

  return v6;
}

- (id)destinationsForRequestDestinations:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NCNotificationAlertQueue destinationsRegistry](self, "destinationsRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destinationsForRequestDestinations:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setDestination:(id)a3 ready:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[NCNotificationAlertQueue destinationsRegistry](self, "destinationsRegistry");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDestination:ready:", v6, v4);

}

- (BOOL)isAlertDestination
{
  return 1;
}

- (NSString)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BSServiceConnectionEndpoint)endpoint
{
  return 0;
}

- (BOOL)canReceiveNotificationRequest:(id)a3
{
  return 1;
}

- (void)postNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[NCNotificationAlertQueue _postNotificationRequest:](self, "_postNotificationRequest:", v4))
  {
    -[NCNotificationAlertQueue queue](self, "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addNotificationRequest:", v4);

    v6 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      objc_msgSend(v4, "notificationIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "un_logDigest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationAlertQueue queue](self, "queue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2048;
      v14 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_2149F4000, v7, OS_LOG_TYPE_DEFAULT, "Notification %{public}@ enqueued - %lu requests in the queue", (uint8_t *)&v11, 0x16u);

    }
  }

}

- (void)modifyNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  os_log_t *v19;
  uint64_t v20;
  void *v21;
  os_log_t v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  os_log_t *v26;
  id v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NCNotificationAlertQueue queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsNotificationRequestMatchingRequest:", v4);

  if (v6)
  {
    v7 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      objc_msgSend(v4, "notificationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "un_logDigest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v10;
      _os_log_impl(&dword_2149F4000, v8, OS_LOG_TYPE_DEFAULT, "Notification %{public}@ modify request hasn't yet been delivered to the destination, replacing in the queue", buf, 0xCu);

    }
    -[NCNotificationAlertQueue queue](self, "queue");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "replaceNotificationRequest:", v4);
  }
  else
  {
    -[NCNotificationAlertQueue destinationsRegistry](self, "destinationsRegistry");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestDestinations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "destinationsForRequestDestinations:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v11 = v14;
    v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v15)
    {
      v17 = v15;
      v18 = *(_QWORD *)v35;
      v19 = (os_log_t *)&NCUILogDispatch;
      *(_QWORD *)&v16 = 138543618;
      v32 = v16;
      do
      {
        v20 = 0;
        v33 = v17;
        do
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(v11);
          v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v20);
          v22 = *v19;
          if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
          {
            v23 = v22;
            objc_msgSend(v4, "notificationIdentifier");
            v24 = v18;
            v25 = v4;
            v26 = v19;
            v27 = v11;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "un_logDigest");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (objc_class *)objc_opt_class();
            NSStringFromClass(v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v32;
            v39 = v29;
            v40 = 2114;
            v41 = v31;
            _os_log_impl(&dword_2149F4000, v23, OS_LOG_TYPE_DEFAULT, "Modifying notification %{public}@ in destination %{public}@", buf, 0x16u);

            v11 = v27;
            v19 = v26;
            v4 = v25;
            v18 = v24;
            v17 = v33;

          }
          objc_msgSend(v21, "modifyNotificationRequest:", v4, v32);
          ++v20;
        }
        while (v17 != v20);
        v17 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v17);
    }

  }
}

- (void)withdrawNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  os_log_t *v19;
  uint64_t v20;
  void *v21;
  os_log_t v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  os_log_t *v26;
  id v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NCNotificationAlertQueue queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsNotificationRequestMatchingRequest:", v4);

  if (v6)
  {
    v7 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      objc_msgSend(v4, "notificationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "un_logDigest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v10;
      _os_log_impl(&dword_2149F4000, v8, OS_LOG_TYPE_DEFAULT, "Notification %{public}@ withdraw request hasn't yet been delivered to the destination, removing from the queue", buf, 0xCu);

    }
    -[NCNotificationAlertQueue queue](self, "queue");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeNotificationRequest:", v4);
  }
  else
  {
    -[NCNotificationAlertQueue destinationsRegistry](self, "destinationsRegistry");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestDestinations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "destinationsForRequestDestinations:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v11 = v14;
    v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v15)
    {
      v17 = v15;
      v18 = *(_QWORD *)v35;
      v19 = (os_log_t *)&NCUILogDispatch;
      *(_QWORD *)&v16 = 138543618;
      v32 = v16;
      do
      {
        v20 = 0;
        v33 = v17;
        do
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(v11);
          v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v20);
          v22 = *v19;
          if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
          {
            v23 = v22;
            objc_msgSend(v4, "notificationIdentifier");
            v24 = v18;
            v25 = v4;
            v26 = v19;
            v27 = v11;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "un_logDigest");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (objc_class *)objc_opt_class();
            NSStringFromClass(v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v32;
            v39 = v29;
            v40 = 2114;
            v41 = v31;
            _os_log_impl(&dword_2149F4000, v23, OS_LOG_TYPE_DEFAULT, "Withdrawing notification %{public}@ from destination %{public}@", buf, 0x16u);

            v11 = v27;
            v19 = v26;
            v4 = v25;
            v18 = v24;
            v17 = v33;

          }
          objc_msgSend(v21, "withdrawNotificationRequest:", v4, v32);
          ++v20;
        }
        while (v17 != v20);
        v17 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v17);
    }

  }
}

- (void)destination:(id)a3 requestPermissionToExecuteAction:(id)a4 forNotificationRequest:(id)a5 withParameters:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "destination:requestPermissionToExecuteAction:forNotificationRequest:withParameters:completion:", v16, v15, v14, v13, v12);

}

- (void)destination:(id)a3 executeAction:(id)a4 forNotificationRequest:(id)a5 requestAuthentication:(BOOL)a6 withParameters:(id)a7 completion:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v9 = a6;
  v14 = a8;
  v15 = a7;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "destination:executeAction:forNotificationRequest:requestAuthentication:withParameters:completion:", v18, v17, v16, v9, v15, v14);

}

- (id)notificationSectionSettingsForDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationSectionSettingsForDestination:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)notificationSectionSettingsForDestination:(id)a3 forSectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationSectionSettingsForDestination:forSectionIdentifier:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)notificationSystemSettingsForDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationSystemSettingsForDestination:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)destination:(id)a3 requestsClearingNotificationRequests:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destination:requestsClearingNotificationRequests:", v7, v6);

}

- (void)destination:(id)a3 requestsClearingNotificationRequests:(id)a4 fromDestinations:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "destination:requestsClearingNotificationRequests:fromDestinations:", v10, v9, v8);

}

- (void)destination:(id)a3 requestsClearingNotificationRequestsFromDate:(id)a4 toDate:(id)a5 inSections:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "destination:requestsClearingNotificationRequestsFromDate:toDate:inSections:", v13, v12, v11, v10);

}

- (void)destination:(id)a3 requestsClearingNotificationRequestsInSections:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destination:requestsClearingNotificationRequestsInSections:", v7, v6);

}

- (void)destination:(id)a3 setAllowsNotifications:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destination:setAllowsNotifications:forSectionIdentifier:", v9, v5, v8);

}

- (void)destination:(id)a3 setDeliverQuietly:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destination:setDeliverQuietly:forSectionIdentifier:", v9, v5, v8);

}

- (void)destination:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v9 = a4;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "destination:setMuted:untilDate:forSectionIdentifier:threadIdentifier:", v15, v9, v14, v13, v12);

}

- (void)destination:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destination:setAllowsCriticalAlerts:forSectionIdentifier:", v9, v5, v8);

}

- (void)destination:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destination:setAllowsTimeSensitive:forSectionIdentifier:", v9, v5, v8);

}

- (void)destination:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destination:setAllowsDirectMessages:forSectionIdentifier:", v9, v5, v8);

}

- (void)destination:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destination:setScheduledDelivery:forSectionIdentifier:", v9, v5, v8);

}

- (void)destination:(id)a3 setSystemScheduledDeliveryEnabled:(BOOL)a4 scheduledDeliveryTimes:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destination:setSystemScheduledDeliveryEnabled:scheduledDeliveryTimes:", v9, v5, v8);

}

- (void)destination:(id)a3 setNotificationSystemSettings:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destination:setNotificationSystemSettings:", v7, v6);

}

- (void)destinationDidBecomeReadyToReceiveNotifications:(id)a3
{
  id v4;

  -[NCNotificationAlertQueue setDestination:ready:](self, "setDestination:ready:", a3, 1);
  -[NCNotificationAlertQueue setCoalescingRequest:](self, "setCoalescingRequest:", 0);
  -[NCNotificationAlertQueue _postNextNotificationRequest](self, "_postNextNotificationRequest");
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destinationDidBecomeReadyToReceiveNotifications:", self);

}

- (void)destination:(id)a3 didBecomeReadyToReceiveNotificationsPassingTest:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[NCNotificationAlertQueue setDestination:ready:](self, "setDestination:ready:", a3, 1);
  -[NCNotificationAlertQueue setCoalescingRequest:](self, "setCoalescingRequest:", 0);
  -[NCNotificationAlertQueue _postNextNotificationRequestPassingTest:](self, "_postNextNotificationRequestPassingTest:", v6);
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "destination:didBecomeReadyToReceiveNotificationsPassingTest:", self, v6);

}

- (void)destination:(id)a3 didBecomeReadyToReceiveNotificationsCoalescedWith:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[NCNotificationAlertQueue setDestination:ready:](self, "setDestination:ready:", a3, 1);
  -[NCNotificationAlertQueue setCoalescingRequest:](self, "setCoalescingRequest:", v6);
  -[NCNotificationAlertQueue _postEnqueuedNotificationRequestsCoalescingWith:](self, "_postEnqueuedNotificationRequestsCoalescingWith:", v6);
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "destination:didBecomeReadyToReceiveNotificationsCoalescedWith:", self, v6);

}

- (void)destination:(id)a3 willPresentNotificationRequest:(id)a4
{
  -[NCNotificationAlertQueue destination:willPresentNotificationRequest:suppressAlerts:](self, "destination:willPresentNotificationRequest:suppressAlerts:", a3, a4, 0);
}

- (void)destination:(id)a3 willPresentNotificationRequest:(id)a4 suppressAlerts:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v10 = a3;
  v8 = a4;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "destination:willPresentNotificationRequest:suppressAlerts:", v10, v8, v5);

}

- (void)destination:(id)a3 didPresentNotificationRequest:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "destination:didPresentNotificationRequest:", v8, v6);

}

- (void)destination:(id)a3 willDismissNotificationRequest:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "destination:willDismissNotificationRequest:", v8, v6);

}

- (void)destination:(id)a3 didDismissNotificationRequest:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NCNotificationAlertQueue delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "destination:didDismissNotificationRequest:", v8, v6);

}

- (void)_postNextNotificationRequest
{
  -[NCNotificationAlertQueue _postNextNotificationRequestPassingTest:](self, "_postNextNotificationRequestPassingTest:", 0);
}

- (void)_postNextNotificationRequestPassingTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[NCNotificationAlertQueue queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peekNextNotificationRequestPassingTest:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 && -[NCNotificationAlertQueue _postNotificationRequest:](self, "_postNotificationRequest:", v7))
  {
    -[NCNotificationAlertQueue queue](self, "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeNotificationRequest:", v7);

  }
}

- (void)_postEnqueuedNotificationRequestsCoalescingWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NCNotificationAlertQueue queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationRequestsCoalescebleWithCoalescedRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (-[NCNotificationAlertQueue _postNotificationRequest:](self, "_postNotificationRequest:", v12, (_QWORD)v14))
        {
          -[NCNotificationAlertQueue queue](self, "queue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeNotificationRequest:", v12);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (BOOL)_postNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _QWORD v14[4];
  id v15;
  id v16;
  NCNotificationAlertQueue *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NCNotificationAlertQueue coalescingRequest](self, "coalescingRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NCNotificationAlertQueue _readyToReceiveForNotificationRequest:](self, "_readyToReceiveForNotificationRequest:", v4)&& (!v5 || objc_msgSend(v5, "matchesThreadForRequest:", v4)))
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __53__NCNotificationAlertQueue__postNotificationRequest___block_invoke;
    v14[3] = &unk_24D2701D0;
    v15 = v4;
    v16 = v5;
    v17 = self;
    v6 = -[NCNotificationAlertQueue _performDestinationOperationForRequest:block:](self, "_performDestinationOperationForRequest:block:", v15, v14);

  }
  else
  {
    v7 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      objc_msgSend(v4, "notificationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "un_logDigest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v10;
      _os_log_impl(&dword_2149F4000, v8, OS_LOG_TYPE_DEFAULT, "Queue not ready, not posting queued notification %{public}@", buf, 0xCu);

    }
    objc_msgSend(v4, "options");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "preemptsPresentedNotification");

    if (v12)
      -[NCNotificationAlertQueue _prepareDestinationsToReceiveCriticalNotificationRequest:](self, "_prepareDestinationsToReceiveCriticalNotificationRequest:", v4);
    v6 = 0;
  }

  return v6;
}

void __53__NCNotificationAlertQueue__postNotificationRequest___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2149F4000, v6, OS_LOG_TYPE_DEFAULT, "Posting notification %{public}@ to destination %{public}@", (uint8_t *)&v11, 0x16u);

  }
  if (!*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 48), "setDestination:ready:", v3, 0);
  objc_msgSend(v3, "postNotificationRequest:", *(_QWORD *)(a1 + 32));

}

- (BOOL)_performDestinationOperationForRequest:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[NCNotificationAlertQueue destinationsRegistry](self, "destinationsRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestDestinations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destinationsForRequestDestinations:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)NCUILogDispatch;
  if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    objc_msgSend(v6, "notificationIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "un_logDigest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v14;
    v29 = 2048;
    v30 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_2149F4000, v12, OS_LOG_TYPE_DEFAULT, "Posting queued notification %{public}@ to %ld destinations", buf, 0x16u);

  }
  if (-[NCNotificationAlertQueue _destinations:canReceiveNotificationRequest:](self, "_destinations:canReceiveNotificationRequest:", v10, v6))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = v10;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    v17 = v16 != 0;
    if (v16)
    {
      v18 = v16;
      v19 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v15);
          v7[2](v7, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        }
        v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v18);
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)_destinations:(id)a3 canReceiveNotificationRequest:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    v10 = 1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        if ((v10 & 1) != 0)
          v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "canReceiveNotificationRequest:", v6);
        else
          v10 = 0;
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)_readyToReceiveForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[NCNotificationAlertQueue destinationsRegistry](self, "destinationsRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestDestinations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destinationsForRequestDestinations:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationAlertQueue destinationsRegistry](self, "destinationsRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestDestinations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "readyDestinationsForRequestDestinations:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = objc_msgSend(v10, "isEqualToSet:", v7);
  return (char)v8;
}

- (void)_prepareDestinationsToReceiveCriticalNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[NCNotificationAlertQueue destinationsRegistry](self, "destinationsRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestDestinations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destinationsForRequestDestinations:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __85__NCNotificationAlertQueue__prepareDestinationsToReceiveCriticalNotificationRequest___block_invoke;
  v9[3] = &unk_24D2701F8;
  v10 = v4;
  v7 = v4;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

}

void __85__NCNotificationAlertQueue__prepareDestinationsToReceiveCriticalNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v4, "isAlertDestination"))
  {
    v3 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "prepareDestinationToReceiveCriticalNotificationRequest:", *(_QWORD *)(a1 + 32));

  }
}

- (NCNotificationAlertDestinationDelegate)delegate
{
  return (NCNotificationAlertDestinationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setDestinationsRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_destinationsRegistry, a3);
}

- (NCNotificationCollapsingQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NCNotificationRequest)coalescingRequest
{
  return self->_coalescingRequest;
}

- (void)setCoalescingRequest:(id)a3
{
  objc_storeStrong((id *)&self->_coalescingRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescingRequest, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_destinationsRegistry, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
