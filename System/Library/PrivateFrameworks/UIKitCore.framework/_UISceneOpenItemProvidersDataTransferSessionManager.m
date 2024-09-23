@implementation _UISceneOpenItemProvidersDataTransferSessionManager

+ (id)sharedInstance
{
  if (_MergedGlobals_1147 != -1)
    dispatch_once(&_MergedGlobals_1147, &__block_literal_global_167_0);
  return (id)qword_1ECD7F140;
}

- (_UISceneOpenItemProvidersDataTransferSessionManager)init
{
  _UISceneOpenItemProvidersDataTransferSessionManager *v2;
  uint64_t v3;
  NSMutableSet *sessions;
  dispatch_queue_t v5;
  OS_dispatch_queue *workQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UISceneOpenItemProvidersDataTransferSessionManager;
  v2 = -[_UISceneOpenItemProvidersDataTransferSessionManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    sessions = v2->_sessions;
    v2->_sessions = (NSMutableSet *)v3;

    v5 = dispatch_queue_create("com.apple.UIKit.OpenItemProvidersActionHandler.TransferSessionWorkQueue", MEMORY[0x1E0C80D50]);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)addSession:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  _UISceneOpenItemProvidersDataTransferSessionManager *v9;

  v4 = a3;
  -[_UISceneOpenItemProvidersDataTransferSessionManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66___UISceneOpenItemProvidersDataTransferSessionManager_addSession___block_invoke;
  block[3] = &unk_1E16B1B50;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)dataTransferSessionBeganTransfers:(id)a3
{
  id v3;
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = dataTransferSessionBeganTransfers____s_category;
  if (!dataTransferSessionBeganTransfers____s_category)
  {
    v4 = __UILogCategoryGetNode("OpenItemProviders", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&dataTransferSessionBeganTransfers____s_category);
  }
  if ((*(_BYTE *)v4 & 1) != 0)
  {
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      objc_msgSend(v3, "itemCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "data transfer began for item collection uuid: %@", (uint8_t *)&v10, 0xCu);

    }
  }

}

- (void)dataTransferSessionFinishedTransfers:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[_UISceneOpenItemProvidersDataTransferSessionManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92___UISceneOpenItemProvidersDataTransferSessionManager_dataTransferSessionFinishedTransfers___block_invoke;
  block[3] = &unk_1E16B1B50;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (NSMutableSet)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
  objc_storeStrong((id *)&self->_sessions, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
}

@end
