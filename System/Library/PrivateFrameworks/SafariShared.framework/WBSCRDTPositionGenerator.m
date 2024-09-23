@implementation WBSCRDTPositionGenerator

- (WBSCRDTPositionGenerator)initWithDelegate:(id)a3
{
  id v4;
  WBSCRDTPositionGenerator *v5;
  WBSCRDTPositionGenerator *v6;
  WBSCRDTPositionGenerator *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WBSCRDTPositionGenerator;
  v5 = -[WBSCRDTPositionGenerator init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (WBSCRDTPositionGenerator)init
{

  return 0;
}

- (void)generatePositionsForChildRecordNamesGroupedByParentFolders:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *recordNamesToPositions;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__WBSCRDTPositionGenerator_generatePositionsForChildRecordNamesGroupedByParentFolders___block_invoke;
  v10[3] = &unk_1E4B38190;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  v7 = (NSDictionary *)objc_msgSend(v9, "copy");
  recordNamesToPositions = self->_recordNamesToPositions;
  self->_recordNamesToPositions = v7;

}

void __87__WBSCRDTPositionGenerator_generatePositionsForChildRecordNamesGroupedByParentFolders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A8599CE4]();
  objc_msgSend(*(id *)(a1 + 32), "_stridesForSiblingRecords:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __87__WBSCRDTPositionGenerator_generatePositionsForChildRecordNamesGroupedByParentFolders___block_invoke_cold_1((uint64_t)v5, (uint64_t)v8, v9);
  v10 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_generatePositionsForStrides:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addEntriesFromDictionary:", v11);

  objc_autoreleasePoolPop(v7);
}

- (id)positionForBookmarkWithRecordName:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_recordNamesToPositions, "objectForKeyedSubscript:", a3);
}

- (id)_stridesForSiblingRecords:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _WBSCRDTPositionGeneratorStride *v15;
  _WBSCRDTPositionGeneratorStride *v16;
  uint64_t v17;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  WBSCRDTPositionGenerator *v26;
  uint64_t *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  WBSCRDTPositionGenerator *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      v8 = (void *)MEMORY[0x1A8599CE4]();
      objc_msgSend(v5, "removeObject:", v7);
      if (!objc_msgSend(MEMORY[0x1E0C95050], "safari_folderTypeForRecordName:", v7))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0;
        v42 = &v41;
        v43 = 0x3032000000;
        v44 = __Block_byref_object_copy__7;
        v45 = __Block_byref_object_dispose__7;
        v46 = 0;
        v35 = 0;
        v36 = &v35;
        v37 = 0x3032000000;
        v38 = __Block_byref_object_copy__7;
        v39 = __Block_byref_object_dispose__7;
        v40 = 0;
        objc_msgSend(v9, "addObject:", v7);
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __54__WBSCRDTPositionGenerator__stridesForSiblingRecords___block_invoke;
        v28[3] = &unk_1E4B381B8;
        v10 = v4;
        v29 = v10;
        v11 = v9;
        v30 = v11;
        v12 = v5;
        v31 = v12;
        v34 = &v41;
        v13 = v20;
        v32 = v13;
        v33 = self;
        -[WBSCRDTPositionGenerator _enumerateRecordNamesBeforeRecordWithName:usingBlock:](self, "_enumerateRecordNamesBeforeRecordWithName:usingBlock:", v7, v28);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __54__WBSCRDTPositionGenerator__stridesForSiblingRecords___block_invoke_2;
        v21[3] = &unk_1E4B381B8;
        v22 = v10;
        v14 = v11;
        v23 = v14;
        v24 = v12;
        v27 = &v35;
        v25 = v13;
        v26 = self;
        -[WBSCRDTPositionGenerator _enumerateRecordNamesAfterRecordWithName:usingBlock:](self, "_enumerateRecordNamesAfterRecordWithName:usingBlock:", v7, v21);
        v15 = [_WBSCRDTPositionGeneratorStride alloc];
        v16 = -[_WBSCRDTPositionGeneratorStride initWithRecordNames:beforePosition:afterPosition:](v15, "initWithRecordNames:beforePosition:afterPosition:", v14, v42[5], v36[5]);
        objc_msgSend(v19, "addObject:", v16);

        _Block_object_dispose(&v35, 8);
        _Block_object_dispose(&v41, 8);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(v5, "anyObject");
      v17 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v17;
    }
    while (v17);
  }

  return v19;
}

void __54__WBSCRDTPositionGenerator__stridesForSiblingRecords___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v12, 0);
    objc_msgSend(*(id *)(a1 + 48), "removeObject:", v12);
  }
  else
  {
    *a3 = 1;
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v12);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 64), "_positionForRecordName:", v12);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      if (v11)
        objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v11, v12);
    }
  }

}

void __54__WBSCRDTPositionGenerator__stridesForSiblingRecords___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
    objc_msgSend(*(id *)(a1 + 48), "removeObject:", v12);
  }
  else
  {
    *a3 = 1;
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v12);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 64), "_positionForRecordName:", v12);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      if (v11)
        objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v11, v12);
    }
  }

}

- (void)_enumerateRecordNamesBeforeRecordWithName:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, _BYTE *);
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  _QWORD v13[5];

  v6 = a3;
  v7 = (void (**)(id, void *, _BYTE *))a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__WBSCRDTPositionGenerator__enumerateRecordNamesBeforeRecordWithName_usingBlock___block_invoke;
  v13[3] = &unk_1E4B381E0;
  v13[4] = self;
  v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8599ED0](v13);
  ((void (**)(_QWORD, id))v8)[2](v8, v6);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    do
    {
      if (!objc_msgSend(MEMORY[0x1E0C95050], "safari_folderTypeForRecordName:", v10))
      {
        v12 = 0;
        v7[2](v7, v10, &v12);
        if (v12)
          break;
      }
      ((void (**)(_QWORD, void *))v8)[2](v8, v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }
    while (v11);

  }
}

id __81__WBSCRDTPositionGenerator__enumerateRecordNamesBeforeRecordWithName_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "positionGenerator:recordNameOfBookmarksBeforeRecordWithName:", *(_QWORD *)(a1 + 32), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_enumerateRecordNamesAfterRecordWithName:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, _BYTE *);
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  _QWORD v13[5];

  v6 = a3;
  v7 = (void (**)(id, void *, _BYTE *))a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__WBSCRDTPositionGenerator__enumerateRecordNamesAfterRecordWithName_usingBlock___block_invoke;
  v13[3] = &unk_1E4B381E0;
  v13[4] = self;
  v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8599ED0](v13);
  ((void (**)(_QWORD, id))v8)[2](v8, v6);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    do
    {
      if (!objc_msgSend(MEMORY[0x1E0C95050], "safari_folderTypeForRecordName:", v10))
      {
        v12 = 0;
        v7[2](v7, v10, &v12);
        if (v12)
          break;
      }
      ((void (**)(_QWORD, void *))v8)[2](v8, v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }
    while (v11);

  }
}

id __80__WBSCRDTPositionGenerator__enumerateRecordNamesAfterRecordWithName_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "positionGenerator:recordNameOfBookmarksAfterRecordWithName:", *(_QWORD *)(a1 + 32), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_generatePositionsForStrides:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  _WBSCRDTPositionGeneratorStride *v11;
  void *v12;
  _WBSCRDTPositionGeneratorStride *v13;
  _WBSCRDTPositionGeneratorStride *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *context;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  uint64_t *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1A8599CE4]();
  v25 = (void *)objc_msgSend(v24, "mutableCopy");
  objc_msgSend(v25, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    do
    {
      objc_msgSend(v25, "removeObjectAtIndex:", 0);
      objc_msgSend(v5, "recordNames");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "beforePosition");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      v35 = &v34;
      v36 = 0x3032000000;
      v37 = __Block_byref_object_copy__7;
      v38 = __Block_byref_object_dispose__7;
      objc_msgSend(v5, "afterPosition");
      v39 = (id)objc_claimAutoreleasedReturnValue();
      if (v35[5])
      {
        if (v6)
        {
          -[WBSCRDTPositionGenerator _generatePositionBetweenPosition:andPosition:](self, "_generatePositionBetweenPosition:andPosition:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v26, "count");
          objc_msgSend(v26, "objectAtIndexedSubscript:", v8 >> 1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v9);

          objc_msgSend(v26, "subarrayWithRange:", 0, v8 >> 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "count"))
          {
            v11 = -[_WBSCRDTPositionGeneratorStride initWithRecordNames:beforePosition:afterPosition:]([_WBSCRDTPositionGeneratorStride alloc], "initWithRecordNames:beforePosition:afterPosition:", v10, v6, v7);
            objc_msgSend(v25, "addObject:", v11);

          }
          objc_msgSend(v26, "subarrayWithRange:", (v8 >> 1) + 1, v8 + ~(v8 >> 1));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count"))
          {
            v13 = [_WBSCRDTPositionGeneratorStride alloc];
            v14 = -[_WBSCRDTPositionGeneratorStride initWithRecordNames:beforePosition:afterPosition:](v13, "initWithRecordNames:beforePosition:afterPosition:", v12, v7, v35[5]);
            objc_msgSend(v25, "addObject:", v14);

          }
        }
        else
        {
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __57__WBSCRDTPositionGenerator__generatePositionsForStrides___block_invoke;
          v27[3] = &unk_1E4B38208;
          v29 = &v34;
          v27[4] = self;
          v28 = v4;
          objc_msgSend(v26, "enumerateObjectsWithOptions:usingBlock:", 2, v27);

        }
      }
      else
      {
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v15 = v26;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v31;
          do
          {
            v18 = 0;
            v19 = v6;
            do
            {
              if (*(_QWORD *)v31 != v17)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v18);
              -[WBSCRDTPositionGenerator _generatePositionBetweenPosition:andPosition:](self, "_generatePositionBetweenPosition:andPosition:", v19, 0);
              v6 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v20);
              ++v18;
              v19 = v6;
            }
            while (v16 != v18);
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
          }
          while (v16);
        }

      }
      _Block_object_dispose(&v34, 8);

      objc_msgSend(v25, "firstObject");
      v21 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v21;
    }
    while (v21);
  }

  objc_autoreleasePoolPop(context);
  return v4;
}

void __57__WBSCRDTPositionGenerator__generatePositionsForStrides___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v8 = a2;
  objc_msgSend(v3, "_generatePositionBetweenPosition:andPosition:", 0, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v8);
}

- (id)_generatePositionBetweenPosition:(id)a3 andPosition:(id)a4
{
  WBSCRDTPositionGeneratorDelegate **p_delegate;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;

  p_delegate = &self->_delegate;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "deviceIdentifierForPositionGenerator:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSCRDTPosition positionBetweenPosition:andPosition:withDeviceIdentifier:changeID:](WBSCRDTPosition, "positionBetweenPosition:andPosition:withDeviceIdentifier:changeID:", v8, v7, v10, objc_msgSend(WeakRetained, "nextChangeIDForPositionInPositionGenerator:", self));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_positionForRecordName:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "positionGenerator:positionForRecordName:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[WBSCRDTPositionGenerator _positionForRecordName:].cold.1((uint64_t)v4, v7);
  }

  return v6;
}

- (WBSCRDTPositionGeneratorDelegate)delegate
{
  return (WBSCRDTPositionGeneratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recordNamesToPositions, 0);
}

void __87__WBSCRDTPositionGenerator_generatePositionsForChildRecordNamesGroupedByParentFolders___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_1A3D90000, log, OS_LOG_TYPE_DEBUG, "Generate positions for children of record %{public}@, strides: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)_positionForRecordName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_ERROR, "Delegate returned nil position for record with name: %{public}@, we should never ask for the position of a record known to not have one!", (uint8_t *)&v2, 0xCu);
}

@end
