@implementation VUIMediaEntityFetchResponseChangesOperation

- (VUIMediaEntityFetchResponseChangesOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VUIMediaEntityFetchResponseChangesOperation)initWithLatestFetchResponses:(id)a3 currentFetchResponses:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  VUIMediaEntityFetchResponseChangesOperation *v11;
  uint64_t v12;
  NSArray *latestFetchResponses;
  uint64_t v14;
  NSArray *currentFetchResponses;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = (_QWORD *)MEMORY[0x1E0C99778];
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("latestFetchResponses"));
    if (v8)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v9, CFSTR("The %@ parameter must not be nil."), CFSTR("currentFetchResponses"));
    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_10;
LABEL_3:
  if (!objc_msgSend(v6, "count") || (v10 = objc_msgSend(v6, "count"), v10 != objc_msgSend(v8, "count")))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v9, CFSTR("The fetch responses arrays parameters must be non empty and contain the same number of response objects"));
  v17.receiver = self;
  v17.super_class = (Class)VUIMediaEntityFetchResponseChangesOperation;
  v11 = -[VUIMediaEntityFetchResponseChangesOperation init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v6, "copy");
    latestFetchResponses = v11->_latestFetchResponses;
    v11->_latestFetchResponses = (NSArray *)v12;

    v14 = objc_msgSend(v8, "copy");
    currentFetchResponses = v11->_currentFetchResponses;
    v11->_currentFetchResponses = (NSArray *)v14;

  }
  return v11;
}

- (void)executionDidBegin
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, uint64_t);
  void *v9;
  VUIMediaEntityFetchResponseChangesOperation *v10;
  id v11;

  -[VUIMediaEntityFetchResponseChangesOperation _preloadMediaEntityMetadata](self, "_preloadMediaEntityMetadata");
  if ((-[VUIMediaEntityFetchResponseChangesOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[VUIMediaEntityFetchResponseChangesOperation currentFetchResponses](self, "currentFetchResponses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __64__VUIMediaEntityFetchResponseChangesOperation_executionDidBegin__block_invoke;
    v9 = &unk_1E9FA1B58;
    v10 = self;
    v11 = v3;
    v5 = v3;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v6);

    -[VUIMediaEntityFetchResponseChangesOperation setFetchResponseChanges:](self, "setFetchResponseChanges:", v5, v6, v7, v8, v9, v10);
  }
  -[VUIAsynchronousOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

void __64__VUIMediaEntityFetchResponseChangesOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  VUIMediaEntityFetchResponseChanges *v9;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "latestFetchResponses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_mediaEntitiesChangeSetWithLatestFetchResponse:currentFetchResponse:", v11, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VUIMediaEntityFetchResponseChanges initWithMediaEntitiesChangeSet:]([VUIMediaEntityFetchResponseChanges alloc], "initWithMediaEntitiesChangeSet:", v8);
  objc_msgSend(*(id *)(a1 + 32), "_groupingChangeSetWithLatestFetchResponse:currentFetchResponse:", v11, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIMediaEntityFetchResponseChanges setGroupingChangeSet:](v9, "setGroupingChangeSet:", v10);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

}

- (void)_preloadMediaEntityMetadata
{
  void *v3;
  _QWORD v4[5];

  -[VUIMediaEntityFetchResponseChangesOperation currentFetchResponses](self, "currentFetchResponses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__VUIMediaEntityFetchResponseChangesOperation__preloadMediaEntityMetadata__block_invoke;
  v4[3] = &unk_1E9FA1B80;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __74__VUIMediaEntityFetchResponseChangesOperation__preloadMediaEntityMetadata__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_preloadMetadataForFetchResponse:", a2);
  objc_msgSend(*(id *)(a1 + 32), "latestFetchResponses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_preloadMetadataForFetchResponse:", v6);
}

- (void)_preloadMetadataForFetchResponse:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "mediaEntities");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
      if ((-[VUIMediaEntityFetchResponseChangesOperation isCancelled](self, "isCancelled", (_QWORD)v10) & 1) != 0)
        break;
      objc_msgSend(v9, "populateMetadata");
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)_mediaEntitiesChangeSetWithLatestFetchResponse:(id)a3 currentFetchResponse:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a4, "mediaEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaEntities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_changeSetFromCurrentMediaEntities:toLatestMediaEntities:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_groupingChangeSetWithLatestFetchResponse:(id)a3 currentFetchResponse:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "grouping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "grouping");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v8 && v7)
  {
    -[VUIMediaEntityFetchResponseChangesOperation _groupingChangeSetWithCurrentGrouping:latestGrouping:](self, "_groupingChangeSetWithCurrentGrouping:latestGrouping:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_groupingChangeSetWithCurrentGrouping:(id)a3 latestGrouping:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];

  v6 = (objc_class *)MEMORY[0x1E0DC6998];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __100__VUIMediaEntityFetchResponseChangesOperation__groupingChangeSetWithCurrentGrouping_latestGrouping___block_invoke_2;
  v12[3] = &unk_1E9FA1BE8;
  v12[4] = self;
  objc_msgSend(v9, "changeSetFromObjects:toObjects:identifierBlock:updateChangeSetBlock:", v8, v7, &__block_literal_global_122, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __100__VUIMediaEntityFetchResponseChangesOperation__groupingChangeSetWithCurrentGrouping_latestGrouping___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

id __100__VUIMediaEntityFetchResponseChangesOperation__groupingChangeSetWithCurrentGrouping_latestGrouping___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = a2;
  v6 = (void *)objc_opt_class();
  objc_msgSend(v5, "mediaEntities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "mediaEntities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_changeSetFromCurrentMediaEntities:toLatestMediaEntities:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_changeSetFromCurrentMediaEntities:(id)a3 toLatestMediaEntities:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0DC6998];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "changeSetFromObjects:toObjects:identifierBlock:isEqualBlock:", v7, v6, &__block_literal_global_16_2, &__block_literal_global_18_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __104__VUIMediaEntityFetchResponseChangesOperation__changeSetFromCurrentMediaEntities_toLatestMediaEntities___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __104__VUIMediaEntityFetchResponseChangesOperation__changeSetFromCurrentMediaEntities_toLatestMediaEntities___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isFetchedPropertiesEqualToFetchedMediaEntity:");
}

- (NSArray)fetchResponseChanges
{
  return self->_fetchResponseChanges;
}

- (void)setFetchResponseChanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSArray)latestFetchResponses
{
  return self->_latestFetchResponses;
}

- (void)setLatestFetchResponses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSArray)currentFetchResponses
{
  return self->_currentFetchResponses;
}

- (void)setCurrentFetchResponses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFetchResponses, 0);
  objc_storeStrong((id *)&self->_latestFetchResponses, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_fetchResponseChanges, 0);
}

@end
