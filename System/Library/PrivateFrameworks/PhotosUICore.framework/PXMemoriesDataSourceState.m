@implementation PXMemoriesDataSourceState

- (PXMemoriesDataSourceState)initWithMemories:(id)a3 infosByMemory:(id)a4
{
  id v7;
  id v8;
  PXMemoriesDataSourceState *v9;
  PXMemoriesDataSourceState *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXMemoriesDataSourceState;
  v9 = -[PXMemoriesDataSourceState init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memories, a3);
    objc_storeStrong((id *)&v10->_infosByMemory, a4);
  }

  return v10;
}

- (id)stateUpdatedWithChange:(id)a3 outMemoriesChangeDetails:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (**v10)(void *, _QWORD);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  PXMemoriesDataSourceState *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  PXMemoriesDataSourceState *v41;
  void *v42;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD aBlock[4];
  id v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PXMemoriesDataSourceState memories](self, "memories");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeDetailsForFetchResult:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v6;
  if (v8)
  {
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__PXMemoriesDataSourceState_stateUpdatedWithChange_outMemoriesChangeDetails___block_invoke;
    aBlock[3] = &unk_1E5124F08;
    v59 = v7;
    v10 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v8, "insertedObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v55 != v14)
            objc_enumerationMutation(v11);
          v10[2](v10, *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i));
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
      }
      while (v13);
    }

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v8, "changedObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v51 != v19)
            objc_enumerationMutation(v16);
          v10[2](v10, *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j));
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
      }
      while (v18);
    }

    objc_msgSend(v8, "fetchResultAfterChanges");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v44;
  }
  else
  {
    v9 = MEMORY[0x1E0C809B0];
    v21 = v6;
  }
  objc_msgSend(v8, "changedIndexes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v8, "changedIndexes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[PXMemoriesDataSourceState infosByMemory](self, "infosByMemory");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v45[0] = v9;
  v45[1] = 3221225472;
  v45[2] = __77__PXMemoriesDataSourceState_stateUpdatedWithChange_outMemoriesChangeDetails___block_invoke_2;
  v45[3] = &unk_1E5124F30;
  v26 = v7;
  v46 = v26;
  v27 = v21;
  v47 = v27;
  v28 = v5;
  v48 = v28;
  v29 = v24;
  v49 = v29;
  objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v45);
  objc_msgSend(v8, "removedObjects");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {

  }
  else if (!objc_msgSend(v26, "count"))
  {
    v31 = v25;
    goto LABEL_27;
  }
  v31 = (id)objc_msgSend(v25, "mutableCopy");
  objc_msgSend(v8, "removedObjects");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v8, "removedObjects");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "removeObjectsForKeys:", v33);

  }
  objc_msgSend(v31, "addEntriesFromDictionary:", v26);
LABEL_27:
  v42 = v28;
  if (v27 == v6 && v31 == v25)
    v34 = self;
  else
    v34 = -[PXMemoriesDataSourceState initWithMemories:infosByMemory:]([PXMemoriesDataSourceState alloc], "initWithMemories:infosByMemory:", v27, v31);
  v41 = v34;
  v35 = objc_alloc((Class)off_1E50B1608);
  objc_msgSend(v8, "removedIndexes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertedIndexes");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "movedIndexes");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v35, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v36, v37, v38, objc_msgSend(v8, "movedFromIndexes"), v29);

  if (a4)
    *a4 = objc_retainAutorelease(v39);

  return v41;
}

- (PHFetchResult)memories
{
  return self->_memories;
}

- (NSDictionary)infosByMemory
{
  return self->_infosByMemory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infosByMemory, 0);
  objc_storeStrong((id *)&self->_memories, 0);
}

void __77__PXMemoriesDataSourceState_stateUpdatedWithChange_outMemoriesChangeDetails___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  +[PXMemoryInfo memoryInfoWithMemory:](PXMemoryInfo, "memoryInfoWithMemory:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);

}

void __77__PXMemoriesDataSourceState_stateUpdatedWithChange_outMemoriesChangeDetails___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(v5, "keyAssetFetchResult");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v14);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
    }
    else
    {
      v10 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v14);

      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_6;
      v11 = *(void **)(a1 + 48);
      objc_msgSend(v5, "keyAssetFetchResult");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "changeDetailsForFetchResult:", v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_5;
      objc_msgSend(v7, "fetchResultAfterChanges");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "memoryInfoWithUpdatedKeyAssetFetchResult:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v14);
      objc_msgSend(*(id *)(a1 + 56), "addIndex:", v10);
    }

LABEL_5:
  }
LABEL_6:

}

@end
