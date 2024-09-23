@implementation PUImportChangeDetailsCollectionViewHelper

- (PUImportChangeDetailsCollectionViewHelper)initWithCollectionView:(id)a3 dataSourceSettingHandler:(id)a4
{
  id v6;
  id v7;
  PUImportChangeDetailsCollectionViewHelper *v8;
  PUImportChangeDetailsCollectionViewHelper *v9;
  void *v10;
  id dataSourceSettingHandler;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PUImportChangeDetailsCollectionViewHelper;
  v8 = -[PUImportChangeDetailsCollectionViewHelper init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_collectionView, v6);
    v10 = _Block_copy(v7);
    dataSourceSettingHandler = v9->_dataSourceSettingHandler;
    v9->_dataSourceSettingHandler = v10;

  }
  return v9;
}

- (void)transitionFromDataSource:(id)a3 toDataSource:(id)a4 changeHistory:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  void (**v26)(_QWORD, _QWORD);
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  BOOL v34;
  _QWORD v35[4];
  id v36;
  _BYTE *v37;
  uint8_t v38[4];
  const char *v39;
  __int16 v40;
  const __CFString *v41;
  _BYTE buf[24];
  BOOL v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  objc_msgSend(v14, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v12, "identifier"), objc_msgSend(v13, "identifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Applying changes:\n%@"), v16);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  _importGridLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[PUImportChangeDetailsCollectionViewHelper transitionFromDataSource:toDataSource:changeHistory"
                         ":animated:completionHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v28;
    _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v43 = 0;
  if (objc_msgSend(v16, "count") == 1)
  {
    -[PUImportChangeDetailsCollectionViewHelper collectionView](self, "collectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 != 0;

  }
  else
  {
    v20 = 0;
  }
  v43 = v20;
  if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    goto LABEL_11;
  objc_msgSend(v16, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sectionsWithItemChanges");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __124__PUImportChangeDetailsCollectionViewHelper_transitionFromDataSource_toDataSource_changeHistory_animated_completionHandler___block_invoke;
  v35[3] = &unk_1E58A0330;
  v24 = v21;
  v36 = v24;
  v37 = buf;
  objc_msgSend(v22, "enumerateIndexesUsingBlock:", v35);

  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    if (!a6)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    }
    v29[0] = v23;
    v29[1] = 3221225472;
    v29[2] = __124__PUImportChangeDetailsCollectionViewHelper_transitionFromDataSource_toDataSource_changeHistory_animated_completionHandler___block_invoke_5;
    v29[3] = &unk_1E58A0358;
    v34 = a6;
    v30 = v12;
    v31 = v13;
    v32 = v16;
    v33 = v15;
    -[PUImportChangeDetailsCollectionViewHelper applyChangeDetails:forNewDataSource:completionBlock:](self, "applyChangeDetails:forNewDataSource:completionBlock:", v32, v31, v29);

  }
  else
  {
LABEL_11:
    _importGridLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v38 = 136315394;
      v39 = "-[PUImportChangeDetailsCollectionViewHelper transitionFromDataSource:toDataSource:changeHistory:animated:com"
            "pletionHandler:]";
      v40 = 2112;
      v41 = CFSTR("Reloading data");
      _os_log_impl(&dword_1AAB61000, v25, OS_LOG_TYPE_DEFAULT, "%s: %@", v38, 0x16u);
    }

    -[PUImportChangeDetailsCollectionViewHelper dataSourceSettingHandler](self, "dataSourceSettingHandler");
    v26 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v26)[2](v26, v13);

    -[PUImportChangeDetailsCollectionViewHelper collectionView](self, "collectionView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "reloadData");

    if (v15)
      (*((void (**)(id, _QWORD, _QWORD))v15 + 2))(v15, 0, 0);
  }
  _Block_object_dispose(buf, 8);

}

- (void)applyChangeDetails:(id)a3 forNewDataSource:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[PUImportChangeDetailsCollectionViewHelper collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __97__PUImportChangeDetailsCollectionViewHelper_applyChangeDetails_forNewDataSource_completionBlock___block_invoke;
  v17[3] = &unk_1E58A9AE0;
  v17[4] = self;
  v18 = v9;
  v19 = v8;
  v20 = v11;
  v14[0] = v13;
  v14[1] = 3221225472;
  v14[2] = __97__PUImportChangeDetailsCollectionViewHelper_applyChangeDetails_forNewDataSource_completionBlock___block_invoke_3;
  v14[3] = &unk_1E58AB7D8;
  v16 = v10;
  v15 = v20;
  objc_msgSend(v12, "performBatchUpdates:completion:", v17, v14);

}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (id)dataSourceSettingHandler
{
  return self->_dataSourceSettingHandler;
}

- (void)setDataSourceSettingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataSourceSettingHandler, 0);
  objc_destroyWeak((id *)&self->_collectionView);
}

void __97__PUImportChangeDetailsCollectionViewHelper_applyChangeDetails_forNewDataSource_completionBlock___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dataSourceSettingHandler");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v3 = *(id *)(a1 + 48);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v29;
    v7 = 0x1E0C99000uLL;
    v8 = MEMORY[0x1E0C809B0];
    v24 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v9);
        objc_msgSend(*(id *)(v7 + 3640), "null", v24);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if ((v12 & 1) == 0)
        {
          objc_msgSend(v10, "sectionChanges");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "hasAnyChanges"))
          {
            v14 = v3;
            objc_msgSend(v13, "removedIndexes");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "insertedIndexes");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "changedIndexes");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "count"))
            {
              objc_msgSend(*(id *)(a1 + 32), "collectionView");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "deleteSections:", v15);

            }
            if (objc_msgSend(v16, "count"))
            {
              objc_msgSend(*(id *)(a1 + 32), "collectionView");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "insertSections:", v16);

            }
            if (objc_msgSend(v17, "count"))
            {
              objc_msgSend(*(id *)(a1 + 32), "collectionView");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "reloadSections:", v17);

            }
            v3 = v14;
            v6 = v24;
            v7 = 0x1E0C99000;
            v8 = MEMORY[0x1E0C809B0];
          }
          objc_msgSend(v10, "sectionsWithItemChanges");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v25[0] = v8;
          v25[1] = 3221225472;
          v25[2] = __97__PUImportChangeDetailsCollectionViewHelper_applyChangeDetails_forNewDataSource_completionBlock___block_invoke_2;
          v25[3] = &unk_1E58A0380;
          v25[4] = v10;
          v22 = *(id *)(a1 + 56);
          v23 = *(_QWORD *)(a1 + 32);
          v26 = v22;
          v27 = v23;
          objc_msgSend(v21, "enumerateIndexesUsingBlock:", v25);

        }
        ++v9;
      }
      while (v5 != v9);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v5);
  }

}

uint64_t __97__PUImportChangeDetailsCollectionViewHelper_applyChangeDetails_forNewDataSource_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), 0);
  return result;
}

void __97__PUImportChangeDetailsCollectionViewHelper_applyChangeDetails_forNewDataSource_completionBlock___block_invoke_2(id *a1, uint64_t a2)
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(a1[4], "itemChangesInSection:", a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v15, "hasAnyChanges");
  v5 = v15;
  if (v4)
  {
    objc_msgSend(v15, "removedIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "insertedIndexes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "changedIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v6, a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v7, a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v8, a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(a1[5], "addIndex:", a2);
      objc_msgSend(a1[6], "collectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deleteItemsAtIndexPaths:", v9);

    }
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(a1[5], "addIndex:", a2);
      objc_msgSend(a1[6], "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "insertItemsAtIndexPaths:", v10);

    }
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(a1[6], "collectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reloadItemsAtIndexPaths:", v11);

    }
    v5 = v15;
  }

}

void __124__PUImportChangeDetailsCollectionViewHelper_transitionFromDataSource_toDataSource_changeHistory_animated_completionHandler___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "itemChangesInSection:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removedIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(v5, "removedIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertedIndexes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToIndexSet:", v9);

    if ((v10 & 1) == 0)
    {
      _importGridLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315394;
        v13 = "-[PUImportChangeDetailsCollectionViewHelper transitionFromDataSource:toDataSource:changeHistory:animated:c"
              "ompletionHandler:]_block_invoke";
        v14 = 2112;
        v15 = CFSTR("Skipping animating changes, as there are deletes in the change details");
        _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v12, 0x16u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *a3 = 1;
    }
  }

}

void __124__PUImportChangeDetailsCollectionViewHelper_transitionFromDataSource_toDataSource_changeHistory_animated_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v5 = a3;
  if (v5)
  {
    v10 = v5;
    if (!*(_BYTE *)(a1 + 64))
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error applying change from \n%@\nto\n%@\nData Source Diff:\n%@\n%@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v10);
    v7 = objc_claimAutoreleasedReturnValue();
    _importGridLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[PUImportChangeDetailsCollectionViewHelper transitionFromDataSource:toDataSource:changeHistory:animated:com"
            "pletionHandler:]_block_invoke";
      v13 = 2112;
      v14 = v7;
      _os_log_error_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "%s: %@", buf, 0x16u);
    }

    objc_exception_throw(objc_retainAutorelease(v10));
  }
  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, *(unsigned __int8 *)(a1 + 64), v9);
  if (!*(_BYTE *)(a1 + 64))
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

@end
