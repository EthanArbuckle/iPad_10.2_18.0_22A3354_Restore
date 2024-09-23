@implementation SearchUIDowntimeManager

+ (id)screenTimeUserIDForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = v4;
  if (screenTimeUserIDForContact__onceToken != -1)
  {
    dispatch_once(&screenTimeUserIDForContact__onceToken, &__block_literal_global_32);
    if (v5)
      goto LABEL_3;
LABEL_12:
    v9 = 0;
    goto LABEL_13;
  }
  if (!v4)
    goto LABEL_12;
LABEL_3:
  v6 = (void *)screenTimeUserIDForContact__screenTimeUserIDForContactCache;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(a1, "familyMemberForContact:isMe:", v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && objc_msgSend(a1, "isChildOrTeenFamilyMember:", v10))
    {
      v11 = objc_alloc(MEMORY[0x1E0D8C068]);
      objc_msgSend(v10, "dsid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithDSID:", v12);

      v14 = (void *)screenTimeUserIDForContact__screenTimeUserIDForContactCache;
      objc_msgSend(v5, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v13, v15);

    }
    else
    {
      v13 = 0;
    }
    v9 = v13;

  }
LABEL_13:

  return v9;
}

void __54__SearchUIDowntimeManager_screenTimeUserIDForContact___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)screenTimeUserIDForContact__screenTimeUserIDForContactCache;
  screenTimeUserIDForContact__screenTimeUserIDForContactCache = v0;

}

+ (BOOL)isChildOrTeenFamilyMember:(id)a3
{
  return a3 && (unint64_t)(objc_msgSend(a3, "memberType") - 1) < 2;
}

+ (id)familyMemberForContact:(id)a3 isMe:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _BOOL4 v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v25;
  void *v26;
  void *v27;
  NSObject *obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v4 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v33 = 0;
  objc_msgSend(v6, "fetchFamilyCircleWithError:", &v33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v33;
  if (v8)
  {
    SearchUIGeneralLog();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      +[SearchUIDowntimeManager familyMemberForContact:isMe:].cold.1((uint64_t)v8, obj, v9, v10, v11, v12, v13, v14);
    v15 = 0;
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v7, "members");
    obj = objc_claimAutoreleasedReturnValue();
    v15 = (id)-[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v15)
    {
      v25 = v7;
      v26 = 0;
      v27 = v6;
      v16 = *(_QWORD *)v30;
      if (v5)
        v17 = 0;
      else
        v17 = v4;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v19, "contact", v25, v26, v27);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v21, "isEqualToString:", v22) & 1) != 0)
          {

LABEL_21:
            v15 = v19;
            goto LABEL_22;
          }
          if (v17)
          {
            v23 = objc_msgSend(v19, "isMe");

            if ((v23 & 1) != 0)
              goto LABEL_21;
          }
          else
          {

          }
        }
        v15 = (id)-[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v15)
          continue;
        break;
      }
LABEL_22:
      v8 = v26;
      v6 = v27;
      v7 = v25;
    }
  }

  return v15;
}

+ (BOOL)screenTimeIsEnabledForContact:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  id v16;

  objc_msgSend(a1, "screenTimeUserIDForContact:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v16 = 0;
    objc_msgSend(v4, "currentConfigurationForUser:error:", v3, &v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v16;
    if (v6)
    {
      SearchUIGeneralLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[SearchUIDowntimeManager screenTimeIsEnabledForContact:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    }
    v14 = objc_msgSend(v5, "screenTimeState") == 1;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_2 != -1)
    dispatch_once(&sharedManager_onceToken_2, &__block_literal_global_25_0);
  return (id)sharedManager_sharedObserver_1;
}

void __40__SearchUIDowntimeManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_sharedObserver_1;
  sharedManager_sharedObserver_1 = v0;

}

- (SearchUIDowntimeManager)init
{
  SearchUIDowntimeManager *v2;
  uint64_t v3;
  NSCache *downtimeStatuses;
  uint64_t v5;
  NSNotificationCenter *notificationCenter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchUIDowntimeManager;
  v2 = -[SearchUIDowntimeManager init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    downtimeStatuses = v2->_downtimeStatuses;
    v2->_downtimeStatuses = (NSCache *)v3;

    v5 = objc_opt_new();
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (NSNotificationCenter *)v5;

    -[SearchUIDowntimeManager setupSink](v2, "setupSink");
  }
  return v2;
}

- (void)setupSink
{
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id location;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.SearchUI.SearchUIScreenTimeUtilities.queue", v3);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:waking:", CFSTR("com.apple.SearchUI.SearchUIScreenTimeUtilities.scheduler"), v4, 0);
  objc_initWeak(&location, self);
  BiomeLibrary();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "Family");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ScreenTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ChildState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "DSLPublisher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subscribeOn:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __36__SearchUIDowntimeManager_setupSink__block_invoke_2;
  v16 = &unk_1EA1F61A0;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v11, "sinkWithCompletion:receiveInput:", &__block_literal_global_33, &v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDowntimeManager setBiomeSink:](self, "setBiomeSink:", v12, v13, v14, v15, v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __36__SearchUIDowntimeManager_setupSink__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "updateWithChildState:", v4);
}

- (int)statusForSTUserID:(id)a3 forceRecheck:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  _QWORD v13[4];
  id v14;
  SearchUIDowntimeManager *v15;
  id v16;

  v6 = a3;
  objc_msgSend(v6, "dsid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SearchUIDowntimeManager downtimeStatuses](self, "downtimeStatuses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 || !v10)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __58__SearchUIDowntimeManager_statusForSTUserID_forceRecheck___block_invoke;
      v13[3] = &unk_1EA1F6518;
      v14 = v6;
      v15 = self;
      v16 = v8;
      +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v13);

    }
    v11 = objc_msgSend(v10, "intValue");

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __58__SearchUIDowntimeManager_statusForSTUserID_forceRecheck___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v2, "isDowntimeEnabledForUserID:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "downtimeStatuses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 48);
  v10[0] = CFSTR("userDSIDKey");
  v10[1] = CFSTR("statusKey");
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("downtimeStatusDidChangeNotification"), 0, v9);

}

- (id)addObserverForDowntimeStatuses:(id)a3
{
  id v4;
  NSNotificationCenter *notificationCenter;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  notificationCenter = self->_notificationCenter;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__SearchUIDowntimeManager_addObserverForDowntimeStatuses___block_invoke;
  v9[3] = &unk_1EA1F61C8;
  v10 = v4;
  v6 = v4;
  -[NSNotificationCenter addObserverForName:object:queue:usingBlock:](notificationCenter, "addObserverForName:object:queue:usingBlock:", CFSTR("downtimeStatusDidChangeNotification"), 0, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __58__SearchUIDowntimeManager_addObserverForDowntimeStatuses___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("userDSIDKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("statusKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v2 + 16))(v2, v4, objc_msgSend(v6, "intValue"));

}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[NSNotificationCenter removeObserver:](self->_notificationCenter, "removeObserver:");
}

- (void)updateWithChildState:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSNotificationCenter *notificationCenter;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SearchUIDowntimeManager downtimeStatuses](self, "downtimeStatuses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "starting");
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "state"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &unk_1EA228D68;
  }
  objc_msgSend(v4, "userDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, v8);

  if (v6)
  notificationCenter = self->_notificationCenter;
  v13[0] = CFSTR("userDSIDKey");
  objc_msgSend(v4, "userDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("statusKey");
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "state"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter postNotificationName:object:userInfo:](notificationCenter, "postNotificationName:object:userInfo:", CFSTR("downtimeStatusDidChangeNotification"), 0, v12);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SearchUIDowntimeManager biomeSink](self, "biomeSink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)SearchUIDowntimeManager;
  -[SearchUIDowntimeManager dealloc](&v4, sel_dealloc);
}

- (BPSSink)biomeSink
{
  return (BPSSink *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBiomeSink:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (NSCache)downtimeStatuses
{
  return (NSCache *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downtimeStatuses, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_biomeSink, 0);
}

+ (void)familyMemberForContact:(uint64_t)a3 isMe:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DAD39000, a2, a3, "SearchUIPersonHeaderViewController: fetched family circle with error: %@", a5, a6, a7, a8, 2u);
}

+ (void)screenTimeIsEnabledForContact:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DAD39000, a2, a3, "SearchUIPersonHeaderViewController: grabbed config with error: %@", a5, a6, a7, a8, 2u);
}

@end
