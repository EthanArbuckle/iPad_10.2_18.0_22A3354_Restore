@implementation SearchUIHomeScreenModel

- (id)appIconForApplicationBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = a3;
  -[SearchUIHomeScreenModel dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginTrackingApplicationsWithBundleIdentifiers:", v6);

  -[SearchUIHomeScreenModel iconModel](self, "iconModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationIconForBundleIdentifier:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (SBHSelectedApplicationDataSource)dataSource
{
  return self->_dataSource;
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)sharedInstance_iconModel;
}

void __41__SearchUIHomeScreenModel_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_iconModel;
  sharedInstance_iconModel = v0;

}

- (SearchUIHomeScreenModel)init
{
  SearchUIHomeScreenModel *v2;
  SearchUIHomeScreenModel *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  APSubjectMonitorSubscription *subscription;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SearchUIHomeScreenModel;
  v2 = -[SearchUIHomeScreenModel init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SearchUIHomeScreenModel resetIconModel](v2, "resetIconModel");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_resetIconModel, *MEMORY[0x1E0DC4778], 0);

    objc_msgSend(MEMORY[0x1E0CF96A8], "subjectMonitorRegistry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addMonitor:subjectMask:", v3, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    subscription = v3->_subscription;
    v3->_subscription = (APSubjectMonitorSubscription *)v6;

  }
  return v3;
}

- (void)resetIconModel
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_opt_new();
  -[SearchUIHomeScreenModel setDataSource:](self, "setDataSource:", v3);

  v4 = objc_alloc(MEMORY[0x1E0DAA4B0]);
  -[SearchUIHomeScreenModel dataSource](self, "dataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "initWithStore:applicationDataSource:", 0, v6);
  -[SearchUIHomeScreenModel setIconModel:](self, "setIconModel:", v5);

}

- (void)setIconModel:(id)a3
{
  objc_storeStrong((id *)&self->_iconModel, a3);
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (id)clipIconForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = (void *)*MEMORY[0x1E0DC55F8];
    if (objc_msgSend(v4, "hasPrefix:", *MEMORY[0x1E0DC55F8]))
    {
      objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v6, "length"));
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    -[SearchUIHomeScreenModel iconModel](self, "iconModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3F68], "webClipWithIdentifier:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v8, "addBookmarkIconForWebClip:", v9);

    -[SearchUIHomeScreenModel iconModel](self, "iconModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bookmarkIconForWebClipIdentifier:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "isHidden"))
        {
          v11 = v10;
          objc_msgSend(v11, "bundleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __72__SearchUIHomeScreenModel_appProtectionSubjectsChanged_forSubscription___block_invoke;
          v14[3] = &unk_1EA1F6210;
          v14[4] = self;
          v15 = v12;
          v13 = v12;
          +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v14);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

void __72__SearchUIHomeScreenModel_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "appIconForApplicationBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x1E0DAAA20];
    v5 = *MEMORY[0x1E0DAABC0];
    v6[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:userInfo:", v3, 0, v4);

  }
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (APSubjectMonitorSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_subscription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
}

@end
