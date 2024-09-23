@implementation PXSettingsIndex

- (PXSettingsIndex)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSettingsIndex.m"), 179, CFSTR("%s is not available as initializer"), "-[PXSettingsIndex init]");

  abort();
}

- (id)_initWithEntries:(id)a3
{
  id v4;
  PXSettingsIndex *v5;
  uint64_t v6;
  NSArray *entries;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSettingsIndex;
  v5 = -[PXSettingsIndex init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    entries = v5->_entries;
    v5->_entries = (NSArray *)v6;

  }
  return v5;
}

- (id)searchForText:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[PXSettingsIndex entries](self, "entries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    dispatch_get_global_queue(2, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__PXSettingsIndex_searchForText_resultHandler___block_invoke;
    v12[3] = &unk_1E5148370;
    v13 = v8;
    v14 = v9;
    v15 = v6;
    v16 = v7;
    dispatch_async(v10, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60]);
  }

  return v9;
}

- (NSArray)entries
{
  return self->_entries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

void __47__PXSettingsIndex_searchForText_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
      if ((objc_msgSend(*(id *)(a1 + 40), "isCancelled") & 1) != 0)
        break;
      if (objc_msgSend(v8, "matchesSearchString:", *(_QWORD *)(a1 + 48)))
      {
        v9 = -[PXSettingsSearchResult _initWithEntry:]([PXSettingsSearchResult alloc], "_initWithEntry:", v8);
        objc_msgSend(v2, "addObject:", v9);

      }
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PXSettingsIndex_searchForText_resultHandler___block_invoke_2;
  block[3] = &unk_1E5145688;
  v13 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 56);
  v14 = v2;
  v15 = v10;
  v11 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __47__PXSettingsIndex_searchForText_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return result;
}

+ (id)createIndexForSettings:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("PXSettingsIndex", 0);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__PXSettingsIndex_createIndexForSettings_resultHandler___block_invoke;
  v16[3] = &unk_1E513A6B0;
  v17 = v6;
  v10 = v8;
  v19 = v7;
  v20 = a1;
  v18 = v10;
  v11 = v7;
  v12 = v6;
  dispatch_async(v9, v16);

  v13 = v19;
  v14 = v10;

  return v14;
}

+ (id)_entriesForSettingsController:(id)a3 usingProgress:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  _QWORD aBlock[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  _QWORD *v31;
  _QWORD *v32;
  SEL v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  _QWORD v39[4];
  _QWORD v40[5];

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v12 = MEMORY[0x1E0C809B0];
  v38 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PXSettingsIndex__entriesForSettingsController_usingProgress___block_invoke;
  aBlock[3] = &unk_1E511E800;
  v30 = &v35;
  v13 = v8;
  v25 = v13;
  v14 = v7;
  v26 = v14;
  v31 = v40;
  v32 = v39;
  v15 = v11;
  v27 = v15;
  v16 = v9;
  v28 = v16;
  v17 = v10;
  v29 = v17;
  v33 = a2;
  v34 = a1;
  v18 = _Block_copy(aBlock);
  if (!*((_BYTE *)v36 + 24))
  {
    v19 = MEMORY[0x1E0C80D38];
    do
    {
      v22[0] = v12;
      v22[1] = 3221225472;
      v22[2] = __63__PXSettingsIndex__entriesForSettingsController_usingProgress___block_invoke_5;
      v22[3] = &unk_1E5148A40;
      v23 = v18;
      dispatch_sync(v19, v22);

    }
    while (!*((_BYTE *)v36 + 24));
  }
  v20 = v16;

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v40, 8);

  return v20;
}

void __63__PXSettingsIndex__entriesForSettingsController_usingProgress___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
LABEL_4:
    *(_BYTE *)(v1 + 24) = 1;
    return;
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__PXSettingsIndex__entriesForSettingsController_usingProgress___block_invoke_2;
  v5[3] = &unk_1E513D358;
  v6 = *(id *)(a1 + 40);
  v10 = *(_OWORD *)(a1 + 80);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v3 = *(id *)(a1 + 64);
  v12 = *(_OWORD *)(a1 + 96);
  v4 = *(_QWORD *)(a1 + 72);
  v9 = v3;
  v11 = v4;
  PXSettingsPerformIndexingOperation(v5);

}

uint64_t __63__PXSettingsIndex__entriesForSettingsController_usingProgress___block_invoke_5(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t result;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v3 = v2 + 0.0333333333;
  while (1)
  {
    result = objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    if (v5 > v3)
      break;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

void __63__PXSettingsIndex__entriesForSettingsController_usingProgress___block_invoke_2(uint64_t a1)
{
  void *v2;
  char isKindOfClass;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _PXSettingsIndexEntry *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[5];
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;

  objc_msgSend(*(id *)(a1 + 32), "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "topViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if (v6 < objc_msgSend(v4, "numberOfSectionsInTableView:", v5))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      if (v7 >= objc_msgSend(v4, "tableView:numberOfRowsInSection:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)))
      {
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
LABEL_21:

        return;
      }
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_PXSettingsIndexEntry initWithRowAtIndexPath:inTableView:]([_PXSettingsIndexEntry alloc], "initWithRowAtIndexPath:inTableView:", v8, v5);
      objc_msgSend(*(id *)(a1 + 40), "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PXSettingsIndexEntry setParentEntry:](v9, "setParentEntry:", v10);

      objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
      objc_msgSend(v5, "scrollToRowAtIndexPath:atScrollPosition:animated:", v8, 0, 0);
      +[_PXSettingsIndexEntry _cellForRowAtIndexPath:inTableView:](_PXSettingsIndexEntry, "_cellForRowAtIndexPath:inTableView:", v8, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "accessoryType") != 1)
        goto LABEL_10;
      v29 = v11;
      objc_msgSend(*(id *)(a1 + 32), "viewControllers");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v12 = isIndexingQueryCount;
      v37 = 0;
      v38 = &v37;
      v39 = 0x2020000000;
      v40 = 0;
      v13 = *(void **)(a1 + 32);
      v14 = MEMORY[0x1E0C809B0];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __63__PXSettingsIndex__entriesForSettingsController_usingProgress___block_invoke_3;
      v33[3] = &unk_1E51457C8;
      v34 = v4;
      v35 = v5;
      v28 = v8;
      v36 = v28;
      v32[0] = v14;
      v32[1] = 3221225472;
      v32[2] = __63__PXSettingsIndex__entriesForSettingsController_usingProgress___block_invoke_4;
      v32[3] = &unk_1E51482E0;
      v32[4] = &v37;
      objc_msgSend(v13, "px_performWithoutAnimations:completionHandler:", v33, v32);
      if (*((_BYTE *)v38 + 24))
      {
        objc_msgSend(*(id *)(a1 + 32), "viewControllers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v30;
        v17 = v15;
        if (isIndexingQueryCount > v12 && (objc_msgSend(v15, "isEqualToArray:", v30) & 1) != 0)
        {

          _Block_object_dispose(&v37, 8);
LABEL_9:

          v11 = v29;
LABEL_10:
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
LABEL_20:

          goto LABEL_21;
        }
        v19 = objc_msgSend(v17, "count");
        if (v19 == objc_msgSend(v30, "count") + 1)
        {
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v30, "count"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectsAtIndexes:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v21, "isEqualToArray:", v30) & 1) != 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v22)
            {
              objc_msgSend(*(id *)(a1 + 56), "addObject:", v28);
              objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;

              _Block_object_dispose(&v37, 8);
              v11 = v29;
              goto LABEL_20;
            }
          }
          else
          {

          }
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1 + 88);
      v25 = *(_QWORD *)(a1 + 96);
      -[_PXSettingsIndexEntry subtitle](v9, "subtitle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PXSettingsIndexEntry title](v9, "title");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", v24, v25, CFSTR("PXSettingsIndex.m"), 141, CFSTR("The action for '%@ %@' didn't push a view controller as expected. Please use PXSettingsIsIndexing() to bail out of non-indexable actions."), v26, v27);

      _Block_object_dispose(&v37, 8);
      v16 = v30;
      goto LABEL_9;
    }

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v18 = (id)objc_msgSend(*(id *)(a1 + 32), "popViewControllerAnimated:", 0);
    objc_msgSend(*(id *)(a1 + 56), "lastObject");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "removeLastObject");
    objc_msgSend(*(id *)(a1 + 40), "removeLastObject");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v31, "section");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v31, "row") + 1;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  }
}

uint64_t __63__PXSettingsIndex__entriesForSettingsController_usingProgress___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tableView:didSelectRowAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __63__PXSettingsIndex__entriesForSettingsController_usingProgress___block_invoke_4(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __56__PXSettingsIndex_createIndexForSettings_resultHandler___block_invoke(id *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[5];
  _QWORD block[4];
  id v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[5];
  id v24;

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__58857;
  v23[4] = __Block_byref_object_dispose__58858;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__58857;
  v21 = __Block_byref_object_dispose__58858;
  v22 = 0;
  v2 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PXSettingsIndex_createIndexForSettings_resultHandler___block_invoke_1;
  block[3] = &unk_1E51401A8;
  v15 = v23;
  v16 = &v17;
  v14 = a1[4];
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  if ((objc_msgSend(a1[5], "isCancelled") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_entriesForSettingsController:usingProgress:", v18[5], a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v2;
  v12[1] = 3221225472;
  v12[2] = __56__PXSettingsIndex_createIndexForSettings_resultHandler___block_invoke_2;
  v12[3] = &unk_1E51482E0;
  v12[4] = v23;
  v4 = (void *)MEMORY[0x1E0C80D38];
  dispatch_sync(MEMORY[0x1E0C80D38], v12);

  if ((objc_msgSend(a1[5], "isCancelled") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithEntries:", v3);
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __56__PXSettingsIndex_createIndexForSettings_resultHandler___block_invoke_3;
    v9[3] = &unk_1E5148CE0;
    v6 = a1[6];
    v10 = v5;
    v11 = v6;
    v7 = v5;
    v8 = (void *)MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(v23, 8);
}

uint64_t __56__PXSettingsIndex_createIndexForSettings_resultHandler___block_invoke_1(_QWORD *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = objc_alloc(MEMORY[0x1E0DC3F98]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v4 = objc_msgSend(v2, "initWithFrame:");
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D83120]), "initWithRootSettings:", a1[4]);
  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "setRootViewController:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "setHidden:", 0);
}

uint64_t __56__PXSettingsIndex_createIndexForSettings_resultHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setHidden:", 1);
}

uint64_t __56__PXSettingsIndex_createIndexForSettings_resultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
