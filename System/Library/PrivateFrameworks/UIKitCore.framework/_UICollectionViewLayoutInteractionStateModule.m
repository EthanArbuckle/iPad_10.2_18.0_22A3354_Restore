@implementation _UICollectionViewLayoutInteractionStateModule

- (void)performPreferredAttributesProcessingBlock:(void *)a3 withLayoutAttributes:(void *)a4 forView:
{
  id v7;
  _WORD *v8;
  void *v9;
  int v10;
  void *v11;
  void (**v12)(void);

  v12 = a2;
  v7 = a4;
  if (a1)
  {
    v8 = a3;
    v9 = v8;
    if (v8)
      v10 = v8[144] & 1;
    else
      v10 = 0;
    objc_msgSend(v8, "indexPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[_UICollectionViewLayoutInteractionStateModule _noteCellWillBeginProcessing:atIndexPath:](a1, v7, v11);
      v12[2]();
      objc_msgSend(*(id *)(a1 + 8), "removeObjectForKey:", v11);
    }
    else
    {
      v12[2]();
    }

  }
}

- (void)_noteCellWillBeginProcessing:(void *)a3 atIndexPath:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = v5;
  if (a1)
  {
    v7 = v13;
    if (v13)
    {
      if (v5)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__noteCellWillBeginProcessing_atIndexPath_, a1, CFSTR("_UICollectionViewLayoutInteractionStateModule.m"), 317, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cell"));

      v7 = 0;
      if (v6)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__noteCellWillBeginProcessing_atIndexPath_, a1, CFSTR("_UICollectionViewLayoutInteractionStateModule.m"), 318, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

    v7 = v13;
LABEL_4:
    v8 = *(void **)(a1 + 8);
    if (v8)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v7, v6);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v9;

    }
  }

}

- (uint64_t)itemAtIndexPathIsSelected:(uint64_t)a1
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if (!a1)
    return 0;
  v2 = (id *)(a1 + 24);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_selectionController");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = objc_msgSend(*(id *)(v6 + 8), "containsObject:", v3);
  else
    v8 = 0;

  return v8;
}

- (uint64_t)itemAtIndexPathIsBeingReordered:(uint64_t)result
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;

  if (result)
  {
    v2 = (id *)(result + 24);
    v3 = a2;
    WeakRetained = objc_loadWeakRetained(v2);
    objc_msgSend(WeakRetained, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_isReorderingItemAtIndexPath:", v3);

    return v6;
  }
  return result;
}

- (BOOL)enumerateSectionsAfterSectionIndex:(void *)a3 enumerator:
{
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double);
  id WeakRetained;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  _BOOL8 i;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;
  void *v21;
  char v22;

  v5 = a3;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double))v5;
  if (!a1)
  {
    i = 0;
    goto LABEL_17;
  }
  if (a2 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel_enumerateSectionsAfterSectionIndex_enumerator_, a1, CFSTR("_UICollectionViewLayoutInteractionStateModule.m"), 230, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIndex >= 0"));

    if (v6)
      goto LABEL_4;
  }
  else if (v5)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel_enumerateSectionsAfterSectionIndex_enumerator_, a1, CFSTR("_UICollectionViewLayoutInteractionStateModule.m"), 231, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerator != nil"));

LABEL_4:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  objc_msgSend(WeakRetained, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_collectionViewData");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (_QWORD *)v9;
  i = 0;
  if (WeakRetained && v8 && v9)
  {
    if ((*(_BYTE *)(v9 + 96) & 2) == 0)
      -[UICollectionViewData _updateItemCounts](v9);
    v12 = (uint64_t)(v10[14] - v10[13]) >> 3;
    if (v12 - 1 <= a2)
    {
      i = 0;
    }
    else
    {
      objc_msgSend(WeakRetained, "_interactionStateModule:layoutSectionForIndex:", a1, a2 + 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = v13 != 0; v13; a2 = v18 - 1)
      {
        objc_msgSend(WeakRetained, "_interactionStateModule:spacingAfterLayoutSection:", a1, a2);
        v15 = v14;
        v22 = 0;
        v16 = a2 + 1;
        v17 = -[UICollectionViewData numberOfItemsInSection:]((uint64_t)v10, v16);
        ((void (**)(_QWORD, void *, uint64_t, uint64_t, char *, double))v6)[2](v6, v13, v16, v17, &v22, v15);
        if (v22)
          break;

        v18 = v16 + 1;
        if (v18 == v12)
        {
          i = 1;
          goto LABEL_16;
        }
        objc_msgSend(WeakRetained, "_interactionStateModule:layoutSectionForIndex:", a1, v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }
LABEL_16:

LABEL_17:
  return i;
}

- (BOOL)_shouldAdjustLayoutToDrawTopSeparatorInSection:(uint64_t)a1
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  _BYTE *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v12;

  if (!a1)
    return 0;
  if (a2 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__shouldAdjustLayoutToDrawTopSeparatorInSection_, a1, CFSTR("_UICollectionViewLayoutInteractionStateModule.m"), 213, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIndex >= 0"));

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  objc_msgSend(WeakRetained, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_collectionViewData");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (_BYTE *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    if (objc_msgSend(v5, "_shouldAdjustLayoutToDrawTopSeparator"))
    {
      -[UICollectionViewData validatedIndexPathForItemAtGlobalIndex:](v7, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
        v8 = objc_msgSend(v9, "section") == a2;
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)selectionGroupingForItemAtIndexPath:(uint64_t)a1
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  unint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  unint64_t v32;
  NSObject *v33;
  const __CFString *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  unint64_t v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
  {
    v9 = 0;
    goto LABEL_15;
  }
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", sel_selectionGroupingForItemAtIndexPath_, a1, CFSTR("_UICollectionViewLayoutInteractionStateModule.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  objc_msgSend(WeakRetained, "_interactionStateModule:layoutSectionForIndex:", a1, objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_13;
  v7 = qword_1ECD829A0;
  if (!qword_1ECD829A0)
  {
    v7 = __UILogCategoryGetNode("UICVGrouping", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v7, (unint64_t *)&qword_1ECD829A0);
  }
  if ((*(_BYTE *)v7 & 1) != 0)
  {
    v36 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v4;
      _os_log_impl(&dword_185066000, v36, OS_LOG_TYPE_ERROR, "Grouping check: Beginning at indexPath: %@", buf, 0xCu);
    }
  }
  v44 = 0;
  v43 = 0;
  v8 = -[_UICollectionViewLayoutInteractionStateModule _itemIsSelectedOrHighlightedAndHasBackgroundFillForGroupingAtIndexPath:cellGroupingPreference:backgroundIsInset:](a1, v4, &v44, &v43);
  v9 = v44;
  if ((v8 & 1) != 0 || v44)
  {
    if (v44)
    {
      if (v44 >= 5)
      {
        v28 = (void *)MEMORY[0x1E0C99DA0];
        v29 = *MEMORY[0x1E0C99778];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown list cell grouping received: %ld"), v44);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "exceptionWithName:reason:userInfo:", v29, v30, 0);
        v31 = (id)objc_claimAutoreleasedReturnValue();

        objc_exception_throw(v31);
      }
      v12 = qword_1ECD829B0;
      if (!qword_1ECD829B0)
      {
        v12 = __UILogCategoryGetNode("UICVGrouping", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&qword_1ECD829B0);
      }
      if ((*(_BYTE *)v12 & 1) == 0)
        goto LABEL_14;
      v13 = *(NSObject **)(v12 + 8);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      if (v9 > 4)
        v14 = CFSTR("unknown");
      else
        v14 = off_1E16ECE58[v9 - 1];
      *(_DWORD *)buf = 138412546;
      v46 = v4;
      v47 = 2112;
      v48 = v14;
      v39 = v13;
      _os_log_impl(&dword_185066000, v39, OS_LOG_TYPE_ERROR, "Grouping check: Returning explicit grouping preference from cell at indexPath: %@. Grouping: %@\n\n===", buf, 0x16u);
      goto LABEL_64;
    }
    if (v43)
    {
      v15 = qword_1ECD829B8;
      if (!qword_1ECD829B8)
      {
        v15 = __UILogCategoryGetNode("UICVGrouping", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&qword_1ECD829B8);
      }
      if ((*(_BYTE *)v15 & 1) != 0)
      {
        v38 = *(NSObject **)(v15 + 8);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v4;
          _os_log_impl(&dword_185066000, v38, OS_LOG_TYPE_ERROR, "Grouping check: Forcing grouping to alone for inset background at indexPath: %@\n\n===", buf, 0xCu);
        }
      }
      v9 = 1;
      goto LABEL_14;
    }
    buf[0] = 0;
    v16 = (void *)MEMORY[0x1E0CB36B0];
    v17 = v4;
    v18 = objc_msgSend(v17, "item") + 1;
    v19 = objc_msgSend(v17, "section");

    objc_msgSend(v16, "indexPathForItem:inSection:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[_UICollectionViewLayoutInteractionStateModule _itemIsSelectedOrHighlightedAndHasBackgroundFillForGroupingAtIndexPath:cellGroupingPreference:backgroundIsInset:](a1, v20, 0, buf);

    if (buf[0])
      v21 = 0;
    v22 = v17;
    if (objc_msgSend(v22, "item") <= 0)
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v22, "item") - 1, objc_msgSend(v22, "section"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      buf[0] = 0;
      if (v23)
      {
        v24 = -[_UICollectionViewLayoutInteractionStateModule _itemIsSelectedOrHighlightedAndHasBackgroundFillForGroupingAtIndexPath:cellGroupingPreference:backgroundIsInset:](a1, v23, 0, buf);
        if (buf[0])
          v25 = 0;
        else
          v25 = v24;

        v26 = 1;
        if (v21)
          v26 = 2;
        v27 = 3;
        if (!v21)
          v27 = 4;
        if ((v25 & 1) != 0)
          v9 = v27;
        else
          v9 = v26;
        goto LABEL_48;
      }
    }
    if (v21)
      v9 = 2;
    else
      v9 = 1;
LABEL_48:
    v32 = qword_1ECD829C0;
    if (!qword_1ECD829C0)
    {
      v32 = __UILogCategoryGetNode("UICVGrouping", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v32, (unint64_t *)&qword_1ECD829C0);
    }
    if ((*(_BYTE *)v32 & 1) == 0)
      goto LABEL_14;
    v33 = *(NSObject **)(v32 + 8);
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    if (v9 - 1 > 3)
      v34 = CFSTR("unknown");
    else
      v34 = off_1E16ECE58[v9 - 1];
    v39 = v33;
    NSStringFromBOOL();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v46 = v22;
    v47 = 2112;
    v48 = v34;
    v49 = 2112;
    v50 = v40;
    v51 = 2112;
    v52 = v41;
    v53 = 2112;
    v54 = v42;
    _os_log_impl(&dword_185066000, v39, OS_LOG_TYPE_ERROR, "Grouping check: Returning grouping value at index path: %@ -- grouping: %@ -- currentIsSelected: %@ -- previousIsSelected: %@ -- nextIsSelected: %@\n\n===", buf, 0x34u);

LABEL_64:
    goto LABEL_14;
  }
  v10 = qword_1ECD829A8;
  if (!qword_1ECD829A8)
  {
    v10 = __UILogCategoryGetNode("UICVGrouping", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v10, (unint64_t *)&qword_1ECD829A8);
  }
  if ((*(_BYTE *)v10 & 1) != 0)
  {
    v37 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v4;
      _os_log_impl(&dword_185066000, v37, OS_LOG_TYPE_ERROR, "Grouping check: Returning none because cell is unselected and has no explicit grouping at indexPath: %@.\n\n===", buf, 0xCu);
    }
  }
LABEL_13:
  v9 = 0;
LABEL_14:

LABEL_15:
  return v9;
}

- (uint64_t)_itemIsSelectedOrHighlightedAndHasBackgroundFillForGroupingAtIndexPath:(_QWORD *)a3 cellGroupingPreference:(_BYTE *)a4 backgroundIsInset:
{
  id v7;
  id *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  id *v12;
  unint64_t v13;
  NSObject *v14;
  const char *v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  char v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = (id *)(a1 + 24);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  objc_msgSend(WeakRetained, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_selectionController");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (id *)v11;
  if (!v10 || !v11)
  {
    v16 = _MergedGlobals_1339;
    if (!_MergedGlobals_1339)
    {
      v16 = __UILogCategoryGetNode("UICVGrouping", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v16, (unint64_t *)&_MergedGlobals_1339);
    }
    if ((*(_BYTE *)v16 & 1) == 0)
      goto LABEL_12;
    v14 = *(NSObject **)(v16 + 8);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)buf = 138412290;
    v36 = v7;
    v15 = "Fill state check: Cannot execute without a selection controller. indexPath: %@";
    goto LABEL_45;
  }
  if (objc_msgSend(v10, "_isReorderingItemAtIndexPath:", v7))
  {
    v13 = qword_1ECD82980;
    if (!qword_1ECD82980)
    {
      v13 = __UILogCategoryGetNode("UICVGrouping", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&qword_1ECD82980);
    }
    if ((*(_BYTE *)v13 & 1) == 0)
      goto LABEL_12;
    v14 = *(NSObject **)(v13 + 8);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)buf = 138412290;
    v36 = v7;
    v15 = "Fill state check: Early return for reordered item. indexPath: %@";
LABEL_45:
    _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
LABEL_12:
    v17 = 0;
    goto LABEL_42;
  }
  if ((objc_msgSend(v12[1], "containsObject:", v7) & 1) != 0)
    v18 = 1;
  else
    v18 = objc_msgSend(v12[2], "containsObject:", v7);
  v19 = v7;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", sel__cellForItemAtIndexPath_, a1, CFSTR("_UICollectionViewLayoutInteractionStateModule.m"), 332, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

  }
  objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    v21 = objc_loadWeakRetained(v8);
    objc_msgSend(v21, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "cellForItemAtIndexPath:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      *a3 = objc_msgSend(v20, "_backgroundViewConfigurationGrouping");
  }
  if ((v18 & 1) != 0)
  {
    if (v20)
    {
      objc_msgSend(v20, "_layoutAttributes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v20, "_isStyledAsHeaderOrFooterFromLayoutAttributes:", v23);

      if ((v24 & 1) != 0)
        v17 = 0;
      else
        v17 = objc_msgSend(v20, "_backgroundFillIsCustomized");
      if (a4)
        *a4 = objc_msgSend(v20, "_backgroundIsVerticallyInset");
      v27 = qword_1ECD82998;
      if (!qword_1ECD82998)
      {
        v27 = __UILogCategoryGetNode("UICVGrouping", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v27, (unint64_t *)&qword_1ECD82998);
      }
      if ((*(_BYTE *)v27 & 1) != 0)
      {
        v31 = *(NSObject **)(v27 + 8);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = v31;
          NSStringFromBOOL();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v36 = v19;
          v37 = 2112;
          v38 = v33;
          _os_log_impl(&dword_185066000, v32, OS_LOG_TYPE_ERROR, "Fill state check: Returning live state at indexPath: %@. Has fill: %@", buf, 0x16u);

        }
      }
    }
    else
    {
      v26 = qword_1ECD82990;
      if (!qword_1ECD82990)
      {
        v26 = __UILogCategoryGetNode("UICVGrouping", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v26, (unint64_t *)&qword_1ECD82990);
      }
      if ((*(_BYTE *)v26 & 1) != 0)
      {
        v34 = *(NSObject **)(v26 + 8);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v19;
          _os_log_impl(&dword_185066000, v34, OS_LOG_TYPE_ERROR, "Fill state check: No visible cell at indexPath: %@, but is selected or highlighted in the selection controller. Has fill: YES", buf, 0xCu);
        }
      }
      v17 = 1;
    }
  }
  else
  {
    v25 = qword_1ECD82988;
    if (!qword_1ECD82988)
    {
      v25 = __UILogCategoryGetNode("UICVGrouping", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v25, (unint64_t *)&qword_1ECD82988);
    }
    if ((*(_BYTE *)v25 & 1) != 0)
    {
      v30 = *(NSObject **)(v25 + 8);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v19;
        _os_log_impl(&dword_185066000, v30, OS_LOG_TYPE_ERROR, "Fill state check: Early return for unselected at indexPath: %@. Has fill: NO", buf, 0xCu);
      }
    }
    v17 = 0;
  }

LABEL_42:
  return v17;
}

- (_QWORD)initWithHost:(_QWORD *)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v9;
  objc_super v10;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithHost_, a1, CFSTR("_UICollectionViewLayoutInteractionStateModule.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("host"));

    }
    v10.receiver = a1;
    v10.super_class = (Class)_UICollectionViewLayoutInteractionStateModule;
    v5 = objc_msgSendSuper2(&v10, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeWeak((id *)v5 + 3, v4);
      objc_msgSend((id)objc_opt_class(), "invalidationContextClass");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)a1[2];
      a1[2] = v6;

    }
  }

  return a1;
}

- (uint64_t)swipeActionsStyleForSwipedItemAtIndexPath:(uint64_t)a1
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel_swipeActionsStyleForSwipedItemAtIndexPath_, a1, CFSTR("_UICollectionViewLayoutInteractionStateModule.m"), 274, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath != nil"));

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    a1 = objc_msgSend(WeakRetained, "_interactionStateModule:swipeActionsStyleForSwipedItemAtIndexPath:", a1, v4);

  }
  return a1;
}

- (_UICollectionViewLayoutInteractionStateModuleHost)host
{
  return (_UICollectionViewLayoutInteractionStateModuleHost *)objc_loadWeakRetained((id *)&self->_host);
}

- (void)setHost:(id)a3
{
  objc_storeWeak((id *)&self->_host, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_invalidationContextClass, 0);
  objc_storeStrong((id *)&self->_processingCellsMap, 0);
}

@end
