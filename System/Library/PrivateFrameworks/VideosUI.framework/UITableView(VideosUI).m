@implementation UITableView(VideosUI)

- (uint64_t)vui_applyChangeSet:()VideosUI completionHandler:
{
  return objc_msgSend(a1, "vui_applyChangeSet:inSection:completionHandler:", a3, 0, a4);
}

- (uint64_t)vui_applyChangeSet:()VideosUI inSection:completionHandler:
{
  return objc_msgSend(a1, "vui_applyChangeSet:inSection:rowAnimation:updateDataSourceBlock:completionHandler:", a3, a4, 100, 0, a5);
}

- (void)vui_applyChangeSet:()VideosUI inSection:rowAnimation:updateDataSourceBlock:completionHandler:
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __107__UITableView_VideosUI__vui_applyChangeSet_inSection_rowAnimation_updateDataSourceBlock_completionHandler___block_invoke;
  v24[3] = &unk_1E9F9E200;
  v26 = v13;
  v24[4] = a1;
  v25 = v12;
  v27 = a4;
  v28 = a5;
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __107__UITableView_VideosUI__vui_applyChangeSet_inSection_rowAnimation_updateDataSourceBlock_completionHandler___block_invoke_2;
  v19[3] = &unk_1E9F9E228;
  v19[4] = a1;
  v20 = v25;
  v22 = a4;
  v23 = a5;
  v21 = v14;
  v16 = v14;
  v17 = v25;
  v18 = v13;
  objc_msgSend(a1, "performBatchUpdates:completion:", v24, v19);

}

- (void)_vui_applyDeleteChange:()VideosUI inSection:rowAnimation:
{
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "sourceIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == -1)
    {
      VUIDefaultLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v8;
        _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_INFO, "Applying Delete Change: Deleting Sections At: %@", (uint8_t *)&v12, 0xCu);
      }

      objc_msgSend(a1, "deleteSections:withRowAnimation:", v8, 100);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_vui_indexPathsWithIndexSet:andSection:", v8, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      VUIDefaultLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v9;
        _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_INFO, "Applying Delete Change. Deleting Rows At: %@", (uint8_t *)&v12, 0xCu);
      }

      objc_msgSend(a1, "deleteRowsAtIndexPaths:withRowAnimation:", v9, a5);
    }

  }
}

- (void)_vui_applyInsertChange:()VideosUI inSection:rowAnimation:
{
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "destinationIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_vui_indexPathsWithIndexSet:andSection:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    VUIDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_INFO, "Applying Insert Change. Inserting Rows At: %@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(a1, "insertRowsAtIndexPaths:withRowAnimation:", v9, a5);
  }
}

- (void)_vui_applyMoveChanges:()VideosUI inSection:rowAnimation:
{
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  __int128 v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v22;
    *(_QWORD *)&v6 = 138412546;
    v18 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "sourceIndexes", v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "destinationIndexes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "firstIndex");
        v14 = objc_msgSend(v12, "firstIndex");
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v13, a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v14, a4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        VUIDefaultLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v18;
          v26 = v15;
          v27 = 2112;
          v28 = v16;
          _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_INFO, "Applying Move Change To Row %@ to %@", buf, 0x16u);
        }

        objc_msgSend(a1, "moveRowAtIndexPath:toIndexPath:", v15, v16);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v7);
  }

}

- (void)_vui_applyUpdateChanges:()VideosUI inSection:rowAnimation:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13), "destinationIndexes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "firstIndex");
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v15, a4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
  {
    VUIDefaultLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v18;
      v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_INFO, "Applying Update Change To Section: %@. Reloading Rows At: %@", buf, 0x16u);

    }
    objc_msgSend(a1, "reloadRowsAtIndexPaths:withRowAnimation:", v8, a5);
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
  v10[2] = __64__UITableView_VideosUI___vui_indexPathsWithIndexSet_andSection___block_invoke;
  v10[3] = &unk_1E9F9E250;
  v8 = v7;
  v11 = v8;
  v12 = a4;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v10);

  return v8;
}

@end
