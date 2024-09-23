@implementation TUConversationMediaController

- (TUConversationMediaController)initWithConversationDataSource:(id)a3
{
  id v5;
  TUConversationMediaController *v6;
  TUConversationMediaController *v7;
  uint64_t v8;
  NSHashTable *delegates;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUConversationMediaController;
  v6 = -[TUConversationMediaController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    -[TUConversationManagerDataSource setMediaDelegate:](v7->_dataSource, "setMediaDelegate:", v7);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    delegates = v7->_delegates;
    v7->_delegates = (NSHashTable *)v8;

  }
  return v7;
}

- (void)addDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[TUConversationMediaController delegates](self, "delegates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[TUConversationMediaController delegates](self, "delegates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (TUConversationMediaControllerDelegate)delegate
{
  void *v2;
  void *v3;

  -[TUConversationMediaController delegates](self, "delegates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUConversationMediaControllerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TUConversationMediaController delegates](self, "delegates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[TUConversationMediaController delegates](self, "delegates");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

}

- (void)updateConversationWithUUID:(id)a3 participantPresentationContexts:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Updating participants presentation contexts: %@ for conversation UUID: %@", (uint8_t *)&v10, 0x16u);
  }

  -[TUConversationMediaController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateConversationWithUUID:participantPresentationContexts:", v6, v7);

}

- (void)mediaPrioritiesChangeForConversation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__TUConversationMediaController_mediaPrioritiesChangeForConversation___block_invoke;
  v6[3] = &unk_1E38A1388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __70__TUConversationMediaController_mediaPrioritiesChangeForConversation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegates", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "mediaController:participantMediaPrioritiesChangedForConversation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (TUConversationManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
