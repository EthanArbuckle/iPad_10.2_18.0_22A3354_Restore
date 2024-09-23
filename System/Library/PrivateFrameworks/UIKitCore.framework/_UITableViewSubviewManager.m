@implementation _UITableViewSubviewManager

- (id)prefetchedCellAtIndexPath:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[5], "objectForKey:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)rebasePrefetchedCellIndexPathsWithMapping:(id *)a1
{
  void *v4;
  id WeakRetained;
  id v6;
  int has_internal_diagnostics;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  unint64_t v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a1 && objc_msgSend(a1[5], "count"))
  {
    v4 = (void *)objc_msgSend(a1[5], "copy");
    objc_msgSend(a1[5], "removeAllObjects");
    objc_msgSend(a1[6], "removeAllObjects");
    WeakRetained = objc_loadWeakRetained(a1 + 2);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __72___UITableViewSubviewManager_rebasePrefetchedCellIndexPathsWithMapping___block_invoke;
    v22[3] = &unk_1E16E4430;
    v24 = a2;
    v22[4] = a1;
    v6 = WeakRetained;
    v23 = v6;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v22);
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v8 = objc_msgSend(a1[5], "count");
    v9 = objc_msgSend(a1[6], "count");
    if (has_internal_diagnostics)
    {
      if (v8 == v9)
      {
LABEL_5:

        return;
      }
      __UIFaultDebugAssertLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v11 = objc_msgSend(a1[5], "count");
        v12 = objc_msgSend(a1[6], "count");
        v13 = a1[5];
        v14 = a1[6];
        *(_DWORD *)buf = 134218754;
        v26 = v11;
        v27 = 2048;
        v28 = v12;
        v29 = 2112;
        v30 = v13;
        v31 = 2112;
        v32 = v14;
        _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "UITableView internal inconsistency: prefetchedCells (%ld) and indexPathsForPrefetchedCells (%ld) are out of sync. prefetchedCells=%@; indexPathsForPrefetchedCells=%@",
          buf,
          0x2Au);
      }
    }
    else
    {
      if (v8 == v9)
        goto LABEL_5;
      v15 = rebasePrefetchedCellIndexPathsWithMapping____s_category;
      if (!rebasePrefetchedCellIndexPathsWithMapping____s_category)
      {
        v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&rebasePrefetchedCellIndexPathsWithMapping____s_category);
      }
      v16 = *(NSObject **)(v15 + 8);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_5;
      v17 = a1[5];
      v10 = v16;
      v18 = objc_msgSend(v17, "count");
      v19 = objc_msgSend(a1[6], "count");
      v20 = a1[5];
      v21 = a1[6];
      *(_DWORD *)buf = 134218754;
      v26 = v18;
      v27 = 2048;
      v28 = v19;
      v29 = 2112;
      v30 = v20;
      v31 = 2112;
      v32 = v21;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "UITableView internal inconsistency: prefetchedCells (%ld) and indexPathsForPrefetchedCells (%ld) are out of sync. prefetchedCells=%@; indexPathsForPrefetchedCells=%@",
        buf,
        0x2Au);
    }

    goto LABEL_5;
  }
}

- (void)storePrefetchedCell:(void *)a3 forIndexPath:
{
  int has_internal_diagnostics;
  void *v7;
  int v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (has_internal_diagnostics)
  {
    if (!v7)
      goto LABEL_4;
    __UIFaultDebugAssertLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      goto LABEL_23;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IP(%ld,%ld)"), objc_msgSend(a3, "section"), objc_msgSend(a3, "row"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "section");
    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("IP(%ld,%ld)"), v17, objc_msgSend(v18, "row"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    v48 = (uint64_t)v14;
    v49 = 2112;
    v50 = (uint64_t)v19;
    v51 = 2112;
    v52 = a2;
    v53 = 2112;
    v54 = v20;
    _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "UITableView internal inconsistency: cell prefetched for %@ already stored for %@. Cell: %@; Prefetched Cells: %@",
      buf,
      0x2Au);
LABEL_22:

LABEL_23:
    goto LABEL_4;
  }
  if (v7)
  {
    v30 = _MergedGlobals_1247;
    if (!_MergedGlobals_1247)
    {
      v30 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v30, (unint64_t *)&_MergedGlobals_1247);
    }
    v31 = *(NSObject **)(v30 + 8);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = (void *)MEMORY[0x1E0CB3940];
      v13 = v31;
      objc_msgSend(v32, "stringWithFormat:", CFSTR("IP(%ld,%ld)"), objc_msgSend(a3, "section"), objc_msgSend(a3, "row"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 48), "objectForKey:", a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v16, "section");
      objc_msgSend(*(id *)(a1 + 48), "objectForKey:", a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringWithFormat:", CFSTR("IP(%ld,%ld)"), v34, objc_msgSend(v18, "row"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138413058;
      v48 = (uint64_t)v14;
      v49 = 2112;
      v50 = (uint64_t)v19;
      v51 = 2112;
      v52 = a2;
      v53 = 2112;
      v54 = v35;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "UITableView internal inconsistency: cell prefetched for %@ already stored for %@. Cell: %@; Prefetched Cells: %@",
        buf,
        0x2Au);
      goto LABEL_22;
    }
  }
LABEL_4:
  v8 = os_variant_has_internal_diagnostics();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (!v9)
      goto LABEL_6;
    __UIFaultDebugAssertLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      goto LABEL_29;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IP(%ld,%ld)"), objc_msgSend(a3, "section"), objc_msgSend(a3, "row"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    v48 = (uint64_t)v22;
    v49 = 2112;
    v50 = (uint64_t)v23;
    v51 = 2112;
    v52 = a2;
    v53 = 2112;
    v54 = v24;
    _os_log_fault_impl(&dword_185066000, v21, OS_LOG_TYPE_FAULT, "UITableView internal inconsistency: cell already prefetched for %@. Existing: %@; New: %@; Prefetched Cells: %@",
      buf,
      0x2Au);
LABEL_28:

LABEL_29:
    goto LABEL_6;
  }
  if (v9)
  {
    v36 = qword_1ECD819C0;
    if (!qword_1ECD819C0)
    {
      v36 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v36, (unint64_t *)&qword_1ECD819C0);
    }
    v37 = *(NSObject **)(v36 + 8);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = (void *)MEMORY[0x1E0CB3940];
      v21 = v37;
      objc_msgSend(v38, "stringWithFormat:", CFSTR("IP(%ld,%ld)"), objc_msgSend(a3, "section"), objc_msgSend(a3, "row"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138413058;
      v48 = (uint64_t)v22;
      v49 = 2112;
      v50 = (uint64_t)v23;
      v51 = 2112;
      v52 = a2;
      v53 = 2112;
      v54 = v39;
      _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "UITableView internal inconsistency: cell already prefetched for %@. Existing: %@; New: %@; Prefetched Cells: %@",
        buf,
        0x2Au);
      goto LABEL_28;
    }
  }
LABEL_6:
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", a2, a3);
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", a3, a2);
  v10 = os_variant_has_internal_diagnostics();
  v11 = objc_msgSend(*(id *)(a1 + 40), "count");
  v12 = objc_msgSend(*(id *)(a1 + 48), "count");
  if (v10)
  {
    if (v11 != v12)
    {
      __UIFaultDebugAssertLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        v26 = objc_msgSend(*(id *)(a1 + 40), "count");
        v27 = objc_msgSend(*(id *)(a1 + 48), "count");
        v28 = *(_QWORD *)(a1 + 40);
        v29 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 134218754;
        v48 = v26;
        v49 = 2048;
        v50 = v27;
        v51 = 2112;
        v52 = v28;
        v53 = 2112;
        v54 = v29;
        _os_log_fault_impl(&dword_185066000, v25, OS_LOG_TYPE_FAULT, "UITableView internal inconsistency: prefetchedCells (%ld) and indexPathsForPrefetchedCells (%ld) are out of sync. prefetchedCells=%@; indexPathsForPrefetchedCells=%@",
          buf,
          0x2Au);
      }
      goto LABEL_34;
    }
  }
  else if (v11 != v12)
  {
    v40 = qword_1ECD819C8;
    if (!qword_1ECD819C8)
    {
      v40 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v40, (unint64_t *)&qword_1ECD819C8);
    }
    v41 = *(NSObject **)(v40 + 8);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = *(void **)(a1 + 40);
      v25 = v41;
      v43 = objc_msgSend(v42, "count");
      v44 = objc_msgSend(*(id *)(a1 + 48), "count");
      v45 = *(_QWORD *)(a1 + 40);
      v46 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218754;
      v48 = v43;
      v49 = 2048;
      v50 = v44;
      v51 = 2112;
      v52 = v45;
      v53 = 2112;
      v54 = v46;
      _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "UITableView internal inconsistency: prefetchedCells (%ld) and indexPathsForPrefetchedCells (%ld) are out of sync. prefetchedCells=%@; indexPathsForPrefetchedCells=%@",
        buf,
        0x2Au);
LABEL_34:

    }
  }
}

- (id)indexPathForPrefetchedCell:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[6], "objectForKey:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)shouldDeferReuseOfCell:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (result)
  {
    v3 = result;
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_shouldDeferReuseOfCell_);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel_shouldDeferReuseOfCell_, v3, CFSTR("_UITableViewSubviewManager.m"), 81, CFSTR("UITableView internal inconsistency: cell should not be nil in %@"), v5);

    }
    return objc_msgSend(*(id *)(v3 + 24), "containsObject:", a2);
  }
  return result;
}

- (void)filterPrefetchedCells:(id *)a1
{
  id v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  id v8;
  int has_internal_diagnostics;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t, uint64_t);
  void *v26;
  id *v27;
  id v28;
  _QWORD v29[6];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (a1 && objc_msgSend(a1[5], "count"))
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__193;
    v34 = __Block_byref_object_dispose__193;
    v35 = 0;
    v4 = a1[5];
    v5 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __52___UITableViewSubviewManager_filterPrefetchedCells___block_invoke;
    v29[3] = &unk_1E16E4458;
    v29[4] = a2;
    v29[5] = &v30;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v29);
    if (!v31[5])
    {
LABEL_7:
      _Block_object_dispose(&v30, 8);

      return;
    }
    WeakRetained = objc_loadWeakRetained(a1 + 2);
    v7 = (void *)v31[5];
    v23 = v5;
    v24 = 3221225472;
    v25 = __52___UITableViewSubviewManager_filterPrefetchedCells___block_invoke_2;
    v26 = &unk_1E16E4480;
    v27 = a1;
    v8 = WeakRetained;
    v28 = v8;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v23);
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v10 = a1[5];
    if (has_internal_diagnostics)
    {
      v12 = objc_msgSend(v10, "count", v23, v24, v25, v26, v27);
      if (v12 == objc_msgSend(a1[6], "count"))
        goto LABEL_6;
      __UIFaultDebugAssertLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v14 = objc_msgSend(a1[5], "count");
        v15 = objc_msgSend(a1[6], "count");
        v16 = a1[5];
        v17 = a1[6];
        *(_DWORD *)buf = 134218754;
        v37 = v14;
        v38 = 2048;
        v39 = v15;
        v40 = 2112;
        v41 = v16;
        v42 = 2112;
        v43 = v17;
        _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "UITableView internal inconsistency: prefetchedCells (%ld) and indexPathsForPrefetchedCells (%ld) are out of sync. prefetchedCells=%@; indexPathsForPrefetchedCells=%@",
          buf,
          0x2Au);
      }
    }
    else
    {
      v11 = objc_msgSend(v10, "count", v23, v24, v25, v26, v27);
      if (v11 == objc_msgSend(a1[6], "count"))
      {
LABEL_6:

        goto LABEL_7;
      }
      v18 = filterPrefetchedCells____s_category;
      if (!filterPrefetchedCells____s_category)
      {
        v18 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&filterPrefetchedCells____s_category);
      }
      v13 = *(id *)(v18 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_msgSend(a1[5], "count");
        v20 = objc_msgSend(a1[6], "count");
        v21 = a1[5];
        v22 = a1[6];
        *(_DWORD *)buf = 134218754;
        v37 = v19;
        v38 = 2048;
        v39 = v20;
        v40 = 2112;
        v41 = v21;
        v42 = 2112;
        v43 = v22;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "UITableView internal inconsistency: prefetchedCells (%ld) and indexPathsForPrefetchedCells (%ld) are out of sync. prefetchedCells=%@; indexPathsForPrefetchedCells=%@",
          buf,
          0x2Au);
      }
    }

    goto LABEL_6;
  }
}

- (void)removeAllPrefetchedCells
{
  void *v2;
  id WeakRetained;
  id v4;
  int has_internal_diagnostics;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  unint64_t v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a1 && objc_msgSend(a1[5], "count"))
  {
    v2 = (void *)objc_msgSend(a1[5], "copy");
    objc_msgSend(a1[5], "removeAllObjects");
    objc_msgSend(a1[6], "removeAllObjects");
    WeakRetained = objc_loadWeakRetained(a1 + 2);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __54___UITableViewSubviewManager_removeAllPrefetchedCells__block_invoke;
    v20[3] = &unk_1E16E40F8;
    v4 = WeakRetained;
    v21 = v4;
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v20);
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v6 = objc_msgSend(a1[5], "count");
    v7 = objc_msgSend(a1[6], "count");
    if (has_internal_diagnostics)
    {
      if (v6 == v7)
      {
LABEL_5:

        return;
      }
      __UIFaultDebugAssertLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        v9 = objc_msgSend(a1[5], "count");
        v10 = objc_msgSend(a1[6], "count");
        v11 = a1[5];
        v12 = a1[6];
        *(_DWORD *)buf = 134218754;
        v23 = v9;
        v24 = 2048;
        v25 = v10;
        v26 = 2112;
        v27 = v11;
        v28 = 2112;
        v29 = v12;
        _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "UITableView internal inconsistency: prefetchedCells (%ld) and indexPathsForPrefetchedCells (%ld) are out of sync. prefetchedCells=%@; indexPathsForPrefetchedCells=%@",
          buf,
          0x2Au);
      }
    }
    else
    {
      if (v6 == v7)
        goto LABEL_5;
      v13 = removeAllPrefetchedCells___s_category;
      if (!removeAllPrefetchedCells___s_category)
      {
        v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v13, (unint64_t *)&removeAllPrefetchedCells___s_category);
      }
      v14 = *(NSObject **)(v13 + 8);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_5;
      v15 = a1[5];
      v8 = v14;
      v16 = objc_msgSend(v15, "count");
      v17 = objc_msgSend(a1[6], "count");
      v18 = a1[5];
      v19 = a1[6];
      *(_DWORD *)buf = 134218754;
      v23 = v16;
      v24 = 2048;
      v25 = v17;
      v26 = 2112;
      v27 = v18;
      v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "UITableView internal inconsistency: prefetchedCells (%ld) and indexPathsForPrefetchedCells (%ld) are out of sync. prefetchedCells=%@; indexPathsForPrefetchedCells=%@",
        buf,
        0x2Au);
    }

    goto LABEL_5;
  }
}

- (_QWORD)initWithTableView:(void *)a1
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  if (!a1)
    return 0;
  v14.receiver = a1;
  v14.super_class = (Class)_UITableViewSubviewManager;
  v3 = objc_msgSendSuper2(&v14, sel_init);
  v4 = v3;
  if (v3)
  {
    objc_storeWeak((id *)v3 + 2, a2);
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v4[3];
    v4[3] = v5;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 512);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v4[4];
    v4[4] = v7;

    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = (void *)v4[5];
    v4[5] = v9;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v4[6];
    v4[6] = v11;

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathsForPrefetchedCells, 0);
  objc_storeStrong((id *)&self->_prefetchedCells, 0);
  objc_storeStrong((id *)&self->_cellsReadyForReuse, 0);
  objc_storeStrong((id *)&self->_reusePreventedCells, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_reorderingCell, 0);
}

- (void)cellReadyForReuse:(void *)a3 withIndexPath:(char)a4 didEndDisplaying:
{
  _UITableViewCellReuseParameters *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  objc_super v14;

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_cellReadyForReuse_withIndexPath_didEndDisplaying_);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_cellReadyForReuse_withIndexPath_didEndDisplaying_, a1, CFSTR("_UITableViewSubviewManager.m"), 87, CFSTR("UITableView internal inconsistency: cell should not be nil in %@"), v11);

    }
    if ((-[_UITableViewSubviewManager shouldDeferReuseOfCell:](a1, a2) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel_cellReadyForReuse_withIndexPath_didEndDisplaying_, a1, CFSTR("_UITableViewSubviewManager.m"), 88, CFSTR("UITableView internal inconsistency: cells that are not prevented from being reused should not be deferred from being reused: %@"), a2);

    }
    v8 = [_UITableViewCellReuseParameters alloc];
    v9 = a3;
    if (v8
      && (v14.receiver = v8,
          v14.super_class = (Class)_UITableViewCellReuseParameters,
          (v13 = (id *)objc_msgSendSuper2(&v14, sel_init)) != 0))
    {
      objc_storeStrong(v13 + 2, a3);
      *((_BYTE *)v13 + 8) = a4;
    }
    else
    {
      v13 = 0;
    }

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v13, a2);
  }
}

- (uint64_t)preventReuseOfCell:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (result)
  {
    v3 = result;
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_preventReuseOfCell_);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel_preventReuseOfCell_, v3, CFSTR("_UITableViewSubviewManager.m"), 95, CFSTR("UITableView internal inconsistency: cell should not be nil in %@"), v5);

    }
    return objc_msgSend(*(id *)(v3 + 24), "addObject:", a2);
  }
  return result;
}

- (void)resumeReuseOfCell:(id *)a1
{
  _QWORD *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_resumeReuseOfCell_);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_resumeReuseOfCell_, a1, CFSTR("_UITableViewSubviewManager.m"), 101, CFSTR("UITableView internal inconsistency: cell should not be nil in %@"), v7);

    }
    if ((-[_UITableViewSubviewManager shouldDeferReuseOfCell:]((uint64_t)a1, a2) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_resumeReuseOfCell_, a1, CFSTR("_UITableViewSubviewManager.m"), 102, CFSTR("UITableView internal inconsistency: attempted to resume reuse of a cell that was never prevented from being reused: %@"), a2);

    }
    objc_msgSend(a1[3], "removeObject:", a2);
    if ((objc_msgSend(a1[3], "containsObject:", a2) & 1) == 0)
    {
      objc_msgSend(a1[4], "objectForKey:", a2);
      v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v9 = v4;
        objc_msgSend(a1[4], "removeObjectForKey:", a2);
        WeakRetained = objc_loadWeakRetained(a1 + 2);
        objc_msgSend(WeakRetained, "_reuseTableViewCell:withIndexPath:didEndDisplaying:", a2, v9[2], *((unsigned __int8 *)v9 + 8));

        v4 = v9;
      }

    }
  }
}

- (void)setReorderingCell:(id *)a1
{
  id *v4;
  id v5;
  id v6;

  if (a1)
  {
    v4 = a1 + 1;
    v5 = a1[1];
    if (v5 != a2)
    {
      v6 = v5;
      if (v5)
        -[_UITableViewSubviewManager resumeReuseOfCell:](a1, (uint64_t)v5);
      objc_storeStrong(v4, a2);
      v5 = v6;
      if (a2)
      {
        objc_msgSend(a1[3], "addObject:", a2);
        v5 = v6;
      }
    }

  }
}

@end
