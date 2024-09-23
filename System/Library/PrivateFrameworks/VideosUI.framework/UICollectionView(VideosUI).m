@implementation UICollectionView(VideosUI)

- (uint64_t)vui_applyChangeSet:()VideosUI inSection:updateDataSourceBlock:applyChangeBlock:completionHandler:
{
  return objc_msgSend(a1, "_vui_applyChangeSet:inSection:updateDataSourceBlock:applyChangeBlock:shouldWrapInUpdate:completionHandler:", a3, a4, a5, a6, 0, a7);
}

- (void)_vui_applyUpdateChanges:()VideosUI inSection:applyChangeBlock:updateDataSourceBlock:
{
  objc_class *v10;
  void (**v11)(id, id);
  id v12;
  id v13;
  id v14;

  if (a4 == -1)
  {
    v12 = a6;
    v13 = a5;
    v14 = a3;
    objc_msgSend(a1, "_vui_applySectionUpdateChanges:applyChangeBlock:updateDataSourceBlock:");
  }
  else
  {
    v10 = (objc_class *)MEMORY[0x1E0DC6990];
    v11 = a6;
    v12 = a5;
    v13 = a3;
    v14 = objc_alloc_init(v10);
    objc_msgSend(v14, "setUpdateChanges:", v13);
    v11[2](v11, v14);

    objc_msgSend(a1, "_vui_applyItemUpdateChanges:inSection:applyChangeBlock:", v13, a4, v12);
  }

}

- (void)_vui_applyMoveChanges:()VideosUI inSection:applyChangeBlock:
{
  id v7;
  uint64_t (**v8)(id, uint64_t, _QWORD);
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  __int128 v23;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v7;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v27;
    *(_QWORD *)&v10 = 134218240;
    v23 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (!v8 || (v8[2](v8, a4, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i)) & 1) == 0)
        {
          objc_msgSend(v14, "sourceIndexes", v23);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "destinationIndexes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "firstIndex");
          v18 = objc_msgSend(v16, "firstIndex");
          if (a4 == -1)
          {
            VUIDefaultLogObject();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v23;
              v31 = v17;
              v32 = 2048;
              v33 = v18;
              _os_log_impl(&dword_1D96EE000, v22, OS_LOG_TYPE_INFO, "Applying Move Change To Section %lu to %lu", buf, 0x16u);
            }

            objc_msgSend(a1, "moveSection:toSection:", v17, v18);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v17, a4);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v18, a4);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            VUIDefaultLogObject();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v31 = (uint64_t)v19;
              v32 = 2112;
              v33 = (uint64_t)v20;
              _os_log_impl(&dword_1D96EE000, v21, OS_LOG_TYPE_INFO, "Applying Move Change To Item %@ to %@", buf, 0x16u);
            }

            objc_msgSend(a1, "moveItemAtIndexPath:toIndexPath:", v19, v20);
          }

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v11);
  }

}

- (void)_vui_applyItemUpdateChanges:()VideosUI inSection:applyChangeBlock:
{
  id v7;
  uint64_t (**v8)(id, uint64_t, _QWORD);
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v14);
        if (!v8 || (v8[2](v8, a4, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v14)) & 1) == 0)
        {
          objc_msgSend(v15, "destinationIndexes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "firstIndex");
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v17, a4);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v18);

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
  {
    VUIDefaultLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = v20;
      v28 = 2112;
      v29 = v9;
      _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_INFO, "Applying Update Change To Section: %@. Reloading Items At: %@", buf, 0x16u);

    }
    objc_msgSend(a1, "reloadItemsAtIndexPaths:", v9);
  }

}

- (void)_vui_applyInsertChange:()VideosUI inSection:applyChangeBlock:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v8 && (!v9 || ((*((uint64_t (**)(id, void *, id))v9 + 2))(v9, a4, v8) & 1) == 0))
  {
    objc_msgSend(v8, "destinationIndexes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == (void *)-1)
    {
      VUIDefaultLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = 138412290;
        v18 = v11;
        _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_INFO, "Applying Insert Change: Inserting Sections At: %@", (uint8_t *)&v17, 0xCu);
      }

      objc_msgSend(a1, "insertSections:", v11);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_vui_indexPathsWithIndexSet:andSection:", v11, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)objc_msgSend(a1, "numberOfSections") <= (int)a4)
      {
        VUIDefaultLogObject();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v17 = 134217984;
          v18 = a4;
          _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_INFO, "Applying Insert Change: Inserting Section At: %lu", (uint8_t *)&v17, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "insertSections:", v14);

      }
      VUIDefaultLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v17 = 134218242;
        v18 = a4;
        v19 = 2112;
        v20 = v12;
        _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_INFO, "Applying Insert Change To Section: %lu. Insert Items At: %@", (uint8_t *)&v17, 0x16u);
      }

      objc_msgSend(a1, "insertItemsAtIndexPaths:", v12);
    }

  }
}

- (void)_vui_applyDeleteChange:()VideosUI inSection:applyChangeBlock:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  NSObject *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v8 && (!v9 || ((*((uint64_t (**)(id, void *, id))v9 + 2))(v9, a4, v8) & 1) == 0))
  {
    objc_msgSend(v8, "sourceIndexes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == (void *)-1)
    {
      VUIDefaultLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = 138412290;
        v20 = v11;
        _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_INFO, "Applying Delete Change: Deleting Sections At: %@", (uint8_t *)&v19, 0xCu);
      }

      objc_msgSend(a1, "deleteSections:", v11);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_vui_indexPathsWithIndexSet:andSection:", v11, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");
      v14 = objc_msgSend(a1, "numberOfItemsInSection:", a4);
      VUIDefaultLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
      if (v13 == v14)
      {
        if (v16)
        {
          v19 = 134217984;
          v20 = a4;
          _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_INFO, "Applying Delete Change: Deleting Section At: %lu", (uint8_t *)&v19, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "deleteSections:", v17);

      }
      else
      {
        if (v16)
        {
          v19 = 134218242;
          v20 = a4;
          v21 = 2112;
          v22 = v12;
          _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_INFO, "Applying Delete Change To Section: %lu. Delete Items At: %@", (uint8_t *)&v19, 0x16u);
        }

        objc_msgSend(a1, "deleteItemsAtIndexPaths:", v12);
      }

    }
  }

}

- (void)_vui_applyChangeSet:()VideosUI inSection:updateDataSourceBlock:applyChangeBlock:shouldWrapInUpdate:completionHandler:
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  char v29;
  _QWORD v30[4];
  id v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  char v36;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v18 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __136__UICollectionView_VideosUI___vui_applyChangeSet_inSection_updateDataSourceBlock_applyChangeBlock_shouldWrapInUpdate_completionHandler___block_invoke;
  v30[3] = &unk_1E9F9F068;
  v33 = v15;
  v36 = a7;
  v35 = a4;
  v31 = v14;
  v32 = a1;
  v34 = v16;
  v23[0] = v18;
  v23[1] = 3221225472;
  v23[2] = __136__UICollectionView_VideosUI___vui_applyChangeSet_inSection_updateDataSourceBlock_applyChangeBlock_shouldWrapInUpdate_completionHandler___block_invoke_2;
  v23[3] = &unk_1E9F9F090;
  v29 = a7;
  v23[4] = a1;
  v24 = v31;
  v25 = v34;
  v26 = v33;
  v27 = v17;
  v28 = a4;
  v19 = v17;
  v20 = v33;
  v21 = v34;
  v22 = v31;
  objc_msgSend(a1, "performBatchUpdates:completion:", v30, v23);

}

- (uint64_t)vui_applyChangeSet:()VideosUI completionHandler:
{
  return objc_msgSend(a1, "vui_applyChangeSet:inSection:completionHandler:", a3, 0, a4);
}

- (uint64_t)vui_applyChangeSet:()VideosUI inSection:completionHandler:
{
  return objc_msgSend(a1, "vui_applyChangeSet:inSection:updateDataSourceBlock:completionHandler:", a3, a4, 0, a5);
}

- (uint64_t)vui_applyChangeSet:()VideosUI inSection:updateDataSourceBlock:completionHandler:
{
  return objc_msgSend(a1, "vui_applyChangeSet:inSection:updateDataSourceBlock:applyChangeBlock:completionHandler:", a3, a4, a5, 0, a6);
}

- (void)_vui_applySectionUpdateChanges:()VideosUI applyChangeBlock:updateDataSourceBlock:
{
  id v8;
  uint64_t (**v9)(id, uint64_t, _QWORD);
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  uint64_t (**v27)(id, uint64_t, _QWORD);
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v8;
  v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v30;
    *(_QWORD *)&v12 = 138412290;
    v26 = v12;
    v27 = v9;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v15);
        if (!v9 || (v9[2](v9, -1, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v15)) & 1) == 0)
        {
          objc_msgSend(v16, "destinationIndexes", v26);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "firstIndex");
          VUIDefaultLogObject();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
            v20 = v13;
            v21 = v14;
            v22 = v10;
            v23 = a1;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v26;
            v34 = v24;
            _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_INFO, "Applying Update Change: Updating Sections At: %@", buf, 0xCu);

            a1 = v23;
            v10 = v22;
            v14 = v21;
            v13 = v20;
            v9 = v27;
          }

          objc_msgSend(v16, "updateChangeSet");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_vui_applyChangeSet:inSection:updateDataSourceBlock:applyChangeBlock:shouldWrapInUpdate:completionHandler:", v25, v18, v10, v9, 1, 0);

        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v13);
  }

}

+ (id)_vui_indexPathsWithIndexSet:()VideosUI andSection:
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__UICollectionView_VideosUI___vui_indexPathsWithIndexSet_andSection___block_invoke;
  v10[3] = &unk_1E9F9E250;
  v8 = v7;
  v11 = v8;
  v12 = a4;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v10);

  return v8;
}

@end
