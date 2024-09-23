@implementation SHSheetHostToClientActionManager

- (SHSheetHostToClientActionManager)init
{
  SHSheetHostToClientActionManager *v2;
  uint64_t v3;
  NSMutableDictionary *sceneProvidersToHandlers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SHSheetHostToClientActionManager;
  v2 = -[SHSheetHostToClientActionManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    sceneProvidersToHandlers = v2->_sceneProvidersToHandlers;
    v2->_sceneProvidersToHandlers = (NSMutableDictionary *)v3;

  }
  return v2;
}

+ (SHSheetHostToClientActionManager)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_2);
  return (SHSheetHostToClientActionManager *)(id)shared_sharedHandler;
}

void __42__SHSheetHostToClientActionManager_shared__block_invoke()
{
  SHSheetHostToClientActionManager *v0;
  void *v1;

  v0 = objc_alloc_init(SHSheetHostToClientActionManager);
  v1 = (void *)shared_sharedHandler;
  shared_sharedHandler = (uint64_t)v0;

}

+ (void)registerHandler:(id)a3 forHostedWindowScene:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = a3;
  +[SHSheetHostToClientActionManager shared](SHSheetHostToClientActionManager, "shared");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sceneProvidersToHandlers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);

  v8 = (void *)objc_msgSend(v6, "copy");
  v9 = (void *)MEMORY[0x1A1AE9514](v8);
  objc_msgSend(v11, "sceneProvidersToHandlers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v5);

}

+ (void)unregisterHandlerForHostedWindowScene:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[SHSheetHostToClientActionManager shared](SHSheetHostToClientActionManager, "shared");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneProvidersToHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v3);

}

+ (void)receivedAction:(id)a3 forWindowScene:(id)a4
{
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v8 = a3;
  v5 = a4;
  +[SHSheetHostToClientActionManager shared](SHSheetHostToClientActionManager, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_handlerForHostingController:", v5);
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v7)
    ((void (**)(_QWORD, id))v7)[2](v7, v8);

}

- (id)_handlerForHostingController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SHSheetHostToClientActionManager sceneProvidersToHandlers](self, "sceneProvidersToHandlers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "hostedWindowScene");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4)
        {
          -[SHSheetHostToClientActionManager sceneProvidersToHandlers](self, "sceneProvidersToHandlers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (NSMutableDictionary)sceneProvidersToHandlers
{
  return self->_sceneProvidersToHandlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneProvidersToHandlers, 0);
}

@end
