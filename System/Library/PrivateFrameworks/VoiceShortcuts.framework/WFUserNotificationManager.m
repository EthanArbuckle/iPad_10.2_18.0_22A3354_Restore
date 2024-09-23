@implementation WFUserNotificationManager

- (WFUserNotificationManager)init
{
  WFUserNotificationManager *v2;
  uint64_t v3;
  NSMutableSet *categories;
  uint64_t v5;
  NSMutableDictionary *observers;
  id v7;
  uint64_t v8;
  UNUserNotificationCenter *notificationCenter;
  WFUserNotificationManager *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFUserNotificationManager;
  v2 = -[WFUserNotificationManager init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    categories = v2->_categories;
    v2->_categories = (NSMutableSet *)v3;

    v5 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (NSMutableDictionary *)v5;

    v7 = objc_alloc(MEMORY[0x1E0CEC7A0]);
    v8 = objc_msgSend(v7, "initWithBundleIdentifier:", *MEMORY[0x1E0DC7FD8]);
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (UNUserNotificationCenter *)v8;

    -[UNUserNotificationCenter setDelegate:](v2->_notificationCenter, "setDelegate:", v2);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](v2->_notificationCenter, "setWantsNotificationResponsesDelivered");
    v10 = v2;
  }

  return v2;
}

- (void)registerCategoriesIfNecessary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  WFUserNotificationManager *v9;

  v4 = a3;
  -[WFUserNotificationManager notificationCenter](self, "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__WFUserNotificationManager_registerCategoriesIfNecessary___block_invoke;
  v7[3] = &unk_1E7AA5CF0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "getNotificationCategoriesWithCompletionHandler:", v7);

}

- (void)addObserver:(id)a3 forCategory:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[WFUserNotificationManager categories](self, "categories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if ((v8 & 1) == 0)
  {
    -[WFUserNotificationManager categories](self, "categories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v6);

  }
  -[WFUserNotificationManager observers](self, "observers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFUserNotificationManager observers](self, "observers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v12, v14);

  }
  objc_msgSend(v12, "addObject:", v15);

}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[WFUserNotificationManager categories](self, "categories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        -[WFUserNotificationManager observers](self, "observers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "removeObject:", v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  getWFUserNotificationManagerLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "notification");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "content");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "categoryIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFUserNotificationManager observers](self, "observers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v34 = "-[WFUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
    v35 = 2112;
    v36 = v9;
    v37 = 2112;
    v38 = v15;
    v39 = 2112;
    v40 = v16;
    _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_DEFAULT, "%s Notification Manager received a notification response (%@) for category: %@, distributing to observers: %@", buf, 0x2Au);

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[WFUserNotificationManager observers](self, "observers", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notification");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "request");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "content");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "categoryIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v29;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v26);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v27, "userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:", v8, v9, v10);
        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v24);
  }

}

- (id)categoryIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  -[WFUserNotificationManager categories](self, "categories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(v3, "if_map:", &__block_literal_global_112);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)removeStaleNotificationsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFUserNotificationManagerLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[WFUserNotificationManager categories](self, "categories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v12 = "-[WFUserNotificationManager removeStaleNotificationsWithCompletion:]";
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Attempting to remove stale notifications for categories: %{public}@", buf, 0x16u);

  }
  -[WFUserNotificationManager notificationCenter](self, "notificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__WFUserNotificationManager_removeStaleNotificationsWithCompletion___block_invoke;
  v9[3] = &unk_1E7AA5D98;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "getDeliveredNotificationsWithCompletionHandler:", v9);

}

- (void)removeNotificationsWithIdentifiers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFUserNotificationManager notificationCenter](self, "notificationCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeDeliveredNotificationsWithIdentifiers:", v4);

}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSMutableSet)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_storeStrong((id *)&self->_categories, a3);
}

- (NSMutableDictionary)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

void __68__WFUserNotificationManager_removeStaleNotificationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v42 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v39 = a1;
    objc_msgSend(*(id *)(a1 + 32), "categoryIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v40 = v3;
    v6 = v3;
    v7 = v4;
    obj = v6;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v47;
      v41 = v4;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v47 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v12, "request");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "content");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "categoryIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v5, "containsObject:", v15);

          if (v16)
          {
            objc_msgSend(v12, "date");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "components:fromDate:toDate:options:", 16, v17, v43, 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v19 = objc_msgSend(v18, "day");
            getWFUserNotificationManagerLogObject();
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
            if (v19 < 7)
            {
              v22 = v42;
              if (v21)
              {
                objc_msgSend(v12, "request");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "identifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "date");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v51 = "-[WFUserNotificationManager removeStaleNotificationsWithCompletion:]_block_invoke";
                v52 = 2112;
                v53 = v27;
                v54 = 2112;
                v55 = v28;
                _os_log_impl(&dword_1C146A000, v20, OS_LOG_TYPE_DEFAULT, "%s Keeping notification (%@) (posted on %@)", buf, 0x20u);

                v7 = v41;
                v22 = v42;
              }
            }
            else
            {
              v22 = v7;
              if (v21)
              {
                objc_msgSend(v12, "request");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "identifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "date");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v51 = "-[WFUserNotificationManager removeStaleNotificationsWithCompletion:]_block_invoke";
                v52 = 2112;
                v53 = v24;
                v54 = 2112;
                v55 = v25;
                _os_log_impl(&dword_1C146A000, v20, OS_LOG_TYPE_DEFAULT, "%s Marking notification (%@) as stale (posted on %@)", buf, 0x20u);

                v7 = v41;
                v22 = v41;
              }
            }

            objc_msgSend(v22, "addObject:", v12);
          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      }
      while (v9);
    }

    objc_msgSend(v7, "if_map:", &__block_literal_global_117);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allObjects");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v7;
    objc_msgSend(*(id *)(v39 + 32), "notificationCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "removeDeliveredNotificationsWithIdentifiers:", v30);

    v33 = *(_QWORD *)(v39 + 40);
    if (v33)
    {
      objc_msgSend(v7, "allObjects");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "allObjects");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *))(v33 + 16))(v33, v34, v35);

    }
    v3 = v40;
  }
  else
  {
    getWFUserNotificationManagerLogObject();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "categories");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v51 = "-[WFUserNotificationManager removeStaleNotificationsWithCompletion:]_block_invoke";
      v52 = 2114;
      v53 = v37;
      _os_log_impl(&dword_1C146A000, v36, OS_LOG_TYPE_DEFAULT, "%s Not removing any notifications because no delivered notifications were found for categories: %{public}@", buf, 0x16u);

    }
    v38 = *(_QWORD *)(a1 + 40);
    if (v38)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v38 + 16))(v38, 0, 0);
  }

}

id __68__WFUserNotificationManager_removeStaleNotificationsWithCompletion___block_invoke_115(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __48__WFUserNotificationManager_categoryIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __59__WFUserNotificationManager_registerCategoriesIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v3, "containsObject:", v10, (_QWORD)v13) & 1) == 0)
        {
          if (!v7)
            v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v7, "addObject:", v10);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "setByAddingObjectsFromSet:", v3);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNotificationCategories:", v11);

    v3 = (id)v11;
  }

}

@end
