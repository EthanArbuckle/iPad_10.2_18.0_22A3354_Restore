@implementation PXPhotosDetailsLoadCoordinator

- (PXPhotosDetailsLoadCoordinator)init
{
  PXPhotosDetailsLoadCoordinator *v2;
  PXPhotosDetailsLoadCoordinator *v3;
  uint64_t v4;
  NSHashTable *tokens;
  NSMutableArray *v6;
  NSMutableArray *relatedBlocks;
  NSMutableArray *v8;
  NSMutableArray *suggestionsBlocks;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXPhotosDetailsLoadCoordinator;
  v2 = -[PXPhotosDetailsLoadCoordinator init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_timeoutDelay = 10.0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    tokens = v3->__tokens;
    v3->__tokens = (NSHashTable *)v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    relatedBlocks = v3->__relatedBlocks;
    v3->__relatedBlocks = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    suggestionsBlocks = v3->__suggestionsBlocks;
    v3->__suggestionsBlocks = v8;

  }
  return v3;
}

- (id)_createToken
{
  id v3;
  void *v4;

  v3 = -[PXPhotosDetailsLoadCoordinationToken _initWithLoadCoordinator:]([PXPhotosDetailsLoadCoordinationToken alloc], "_initWithLoadCoordinator:", self);
  -[PXPhotosDetailsLoadCoordinator _tokens](self, "_tokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v3);

  return v3;
}

- (id)tokenForLivePhotoVariations
{
  return -[PXPhotosDetailsLoadCoordinationToken _initWithLoadCoordinator:]([PXPhotosDetailsLoadCoordinationToken alloc], "_initWithLoadCoordinator:", 0);
}

- (void)performBlockWhenReadyToFetchRelated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  if (-[PXPhotosDetailsLoadCoordinator _canPerformRelatedFetch](self, "_canPerformRelatedFetch"))
  {
    v7[2]();
  }
  else
  {
    -[PXPhotosDetailsLoadCoordinator _relatedBlocks](self, "_relatedBlocks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v7, "copy");
    v6 = _Block_copy(v5);
    objc_msgSend(v4, "addObject:", v6);

  }
}

- (void)performBlockWhenReadyToFetchSuggestions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  if (-[PXPhotosDetailsLoadCoordinator _canPerformSuggestionsFetch](self, "_canPerformSuggestionsFetch"))
  {
    v7[2]();
  }
  else
  {
    -[PXPhotosDetailsLoadCoordinator _suggestionsBlocks](self, "_suggestionsBlocks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v7, "copy");
    v6 = _Block_copy(v5);
    objc_msgSend(v4, "addObject:", v6);

  }
}

- (void)_tokenDidComplete:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  px_dispatch_on_main_queue();

}

- (BOOL)_canPerformRelatedFetch
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PXPhotosDetailsLoadCoordinator _tokens](self, "_tokens");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

- (BOOL)_canPerformSuggestionsFetch
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PXPhotosDetailsLoadCoordinator _tokens](self, "_tokens");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

- (NSHashTable)_tokens
{
  return self->__tokens;
}

- (NSMutableArray)_relatedBlocks
{
  return self->__relatedBlocks;
}

- (NSMutableArray)_suggestionsBlocks
{
  return self->__suggestionsBlocks;
}

- (double)timeoutDelay
{
  return self->_timeoutDelay;
}

- (void)setTimeoutDelay:(double)a3
{
  self->_timeoutDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__suggestionsBlocks, 0);
  objc_storeStrong((id *)&self->__relatedBlocks, 0);
  objc_storeStrong((id *)&self->__tokens, 0);
}

void __52__PXPhotosDetailsLoadCoordinator__tokenDidComplete___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_tokens");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 32));

  }
  if (objc_msgSend(*(id *)(a1 + 40), "_canPerformRelatedFetch"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_relatedBlocks");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

    objc_msgSend(*(id *)(a1 + 40), "_relatedBlocks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10++) + 16))();
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v8);
    }

  }
  if (objc_msgSend(*(id *)(a1 + 40), "_canPerformSuggestionsFetch"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_suggestionsBlocks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    objc_msgSend(*(id *)(a1 + 40), "_suggestionsBlocks");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeAllObjects");

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
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
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18) + 16))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18));
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v16);
    }

  }
}

+ (id)loadCoordinatorForContext:(id)a3
{
  id v3;
  PXPhotosDetailsLoadCoordinator *v4;

  v3 = a3;
  objc_getAssociatedObject(v3, (const void *)PXPhotosDetailsLoadCoordinatorAssociationKey);
  v4 = (PXPhotosDetailsLoadCoordinator *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(PXPhotosDetailsLoadCoordinator);
    objc_setAssociatedObject(v3, (const void *)PXPhotosDetailsLoadCoordinatorAssociationKey, v4, (void *)1);
  }

  return v4;
}

@end
