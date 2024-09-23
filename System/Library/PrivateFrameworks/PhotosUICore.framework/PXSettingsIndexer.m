@implementation PXSettingsIndexer

- (PXSettingsIndexer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSettingsIndexer.m"), 35, CFSTR("%s is not available as initializer"), "-[PXSettingsIndexer init]");

  abort();
}

- (PXSettingsIndexer)initWithRootSettings:(id)a3
{
  id v5;
  PXSettingsIndexer *v6;
  PXSettingsIndexer *v7;
  uint64_t v8;
  NSMutableArray *completionHandlers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXSettingsIndexer;
  v6 = -[PXSettingsIndexer init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rootSettings, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    completionHandlers = v7->_completionHandlers;
    v7->_completionHandlers = (NSMutableArray *)v8;

  }
  return v7;
}

- (id)startIndexingWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PXSettingsIndexer completionHandlers](self, "completionHandlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "copy");

  v7 = _Block_copy(v6);
  objc_msgSend(v5, "addObject:", v7);

  -[PXSettingsIndexer _startIndexingIfNecessary](self, "_startIndexingIfNecessary");
  -[PXSettingsIndexer _callCompletionHandlersIfNecessary](self, "_callCompletionHandlersIfNecessary");
  return -[PXSettingsIndexer indexingProgress](self, "indexingProgress");
}

- (void)_startIndexingIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id location;

  if (!-[PXSettingsIndexer state](self, "state"))
  {
    -[PXSettingsIndexer setState:](self, "setState:", 1);
    objc_initWeak(&location, self);
    -[PXSettingsIndexer rootSettings](self, "rootSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __46__PXSettingsIndexer__startIndexingIfNecessary__block_invoke;
    v8 = &unk_1E513A060;
    objc_copyWeak(&v9, &location);
    +[PXSettingsIndex createIndexForSettings:resultHandler:](PXSettingsIndex, "createIndexForSettings:resultHandler:", v3, &v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSettingsIndexer setIndexingProgress:](self, "setIndexingProgress:", v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_handleResultIndex:(id)a3
{
  id v4;

  v4 = a3;
  -[PXSettingsIndexer setIndexingProgress:](self, "setIndexingProgress:", 0);
  if (v4)
  {
    -[PXSettingsIndexer setIndex:](self, "setIndex:", v4);
    -[PXSettingsIndexer setState:](self, "setState:", 2);
    -[PXSettingsIndexer _callCompletionHandlersIfNecessary](self, "_callCompletionHandlersIfNecessary");
  }
  else
  {
    -[PXSettingsIndexer setState:](self, "setState:", 0);
  }

}

- (void)_callCompletionHandlersIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
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

  v16 = *MEMORY[0x1E0C80C00];
  if (-[PXSettingsIndexer state](self, "state") == 2)
  {
    -[PXSettingsIndexer completionHandlers](self, "completionHandlers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

    if (objc_msgSend(v4, "count"))
    {
      -[PXSettingsIndexer completionHandlers](self, "completionHandlers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeAllObjects");

      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v6 = v4;
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
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }

    }
  }
}

- (PXSettings)rootSettings
{
  return self->_rootSettings;
}

- (PXSettingsIndex)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
  objc_storeStrong((id *)&self->_index, a3);
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSProgress)indexingProgress
{
  return self->_indexingProgress;
}

- (void)setIndexingProgress:(id)a3
{
  objc_storeStrong((id *)&self->_indexingProgress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexingProgress, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_rootSettings, 0);
}

void __46__PXSettingsIndexer__startIndexingIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleResultIndex:", v3);

}

@end
