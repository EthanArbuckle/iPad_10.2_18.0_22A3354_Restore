@implementation PXSidebarOutlineSectionController

- (PXSidebarOutlineSectionController)initWithSidebarDataController:(id)a3 dataSource:(id)a4
{
  id v8;
  id v9;
  PXSidebarOutlineSectionController *v10;
  PXSidebarOutlineSectionController *v11;
  void *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXSidebarOutlineSectionController;
  v10 = -[PXSidebarOutlineSectionController init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_dataController, a3);
    objc_msgSend(v8, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("PXSidebarOutlineSectionController.m"), 32, CFSTR("Expected nil delegate instead of %@ on data controller %@"), v15, v8);

    }
    objc_msgSend(v8, "setDelegate:", v11);
    objc_storeStrong((id *)&v11->_dataSource, a4);
    v11->_animateDataSourceUpdates = 1;
  }

  return v11;
}

- (void)loadRootItems
{
  -[PXSidebarOutlineSectionController _configureInitialSnapshotAnimated:expandSubItems:applyOnQueue:](self, "_configureInitialSnapshotAnimated:expandSubItems:applyOnQueue:", 0, 0, 0);
}

- (void)sectionControllerWillExpandItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXSidebarOutlineSectionController appendChildrenForParentIfNeeded:](self, "appendChildrenForParentIfNeeded:", v4);
  -[PXSidebarOutlineSectionController dataController](self, "dataController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExpanded:forItem:", 1, v4);

}

- (void)sectionControllerWillCollapseItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXSidebarOutlineSectionController dataController](self, "dataController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExpanded:forItem:", 0, v4);

}

- (id)currentSectionSnapshot
{
  void *v2;
  void *v3;

  -[PXSidebarOutlineSectionController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshotForSection:", CFSTR("PXSidebarOutlineSectionControllerSectionIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)expandItemsForIdentifiersIfNeeded:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    -[PXSidebarOutlineSectionController currentSectionSnapshot](self, "currentSectionSnapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
          -[PXSidebarOutlineSectionController dataController](self, "dataController", (_QWORD)v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "itemForIdentifier:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "isExpandable"))
            -[PXSidebarOutlineSectionController _expandItem:inSnapshot:](self, "_expandItem:inSnapshot:", v15, v7);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

    -[PXSidebarOutlineSectionController currentSectionSnapshot](self, "currentSectionSnapshot");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v7, "isEqual:", v16);

    if ((v17 & 1) == 0)
    {
      -[PXSidebarOutlineSectionController dataSource](self, "dataSource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "applySnapshot:toSection:animatingDifferences:", v7, CFSTR("PXSidebarOutlineSectionControllerSectionIdentifier"), v4);

    }
  }

}

- (id)expandItemsToRevealFirstEditableItemIfNeededAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _BOOL4 v19;
  id v20;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v19 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  -[PXSidebarOutlineSectionController currentSectionSnapshot](self, "currentSectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__106434;
  v33 = __Block_byref_object_dispose__106435;
  v34 = 0;
  objc_msgSend(v4, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __90__PXSidebarOutlineSectionController_expandItemsToRevealFirstEditableItemIfNeededAnimated___block_invoke;
  v26[3] = &unk_1E5126FA8;
  v28 = &v29;
  v20 = v5;
  v27 = v20;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v26);

  if (!v30[5])
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v20;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v35, 16);
    if (v11)
    {
      v7 = 0;
      v12 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (-[PXSidebarOutlineSectionController _appendChildrenForParentIfNeeded:inSnapshot:](self, "_appendChildrenForParentIfNeeded:inSnapshot:", v14, v4))
          {
            objc_msgSend(v4, "childrenOfParent:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v21[0] = MEMORY[0x1E0C809B0];
            v21[1] = 3221225472;
            v21[2] = __90__PXSidebarOutlineSectionController_expandItemsToRevealFirstEditableItemIfNeededAnimated___block_invoke_2;
            v21[3] = &unk_1E5126FD0;
            v21[4] = &v29;
            objc_msgSend(v15, "enumerateObjectsUsingBlock:", v21);

            if (v30[5])
            {

              if (!v30[5])
                goto LABEL_21;
              v7 = 1;
              goto LABEL_3;
            }
            v7 = 1;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v35, 16);
        if (v11)
          continue;
        break;
      }

      if (v30[5])
        goto LABEL_3;
LABEL_17:
      if ((v7 & 1) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }

    if (!v30[5])
      goto LABEL_22;
  }
  v7 = 0;
LABEL_3:
  objc_msgSend(v4, "parentOfChild:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_17;
  do
  {
    -[PXSidebarOutlineSectionController _expandItem:inSnapshot:](self, "_expandItem:inSnapshot:", v8, v4);
    objc_msgSend(v4, "parentOfChild:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  while (v9);
LABEL_21:
  -[PXSidebarOutlineSectionController dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "applySnapshot:toSection:animatingDifferences:", v4, CFSTR("PXSidebarOutlineSectionControllerSectionIdentifier"), v19);

LABEL_22:
  v17 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  return v17;
}

- (void)reloadFromDataControllerApplyAnimated:(BOOL)a3 onQueue:(id)a4
{
  -[PXSidebarOutlineSectionController _configureInitialSnapshotAnimated:expandSubItems:applyOnQueue:](self, "_configureInitialSnapshotAnimated:expandSubItems:applyOnQueue:", a3, 1, a4);
}

- (id)_newSnapshotFromDataControllerWithRestoredExpansionState:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSObject *v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  _BOOL4 v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  PLSidebarGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 67109120;
    v26 = v3;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "_newSnapshotFromDataControllerWithRestoredExpansionState", "restoreExpansionState: %i", buf, 8u);
  }

  v9 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  -[PXSidebarOutlineSectionController dataController](self, "dataController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "childrenOfListItem:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v9, "appendItems:", v11);
    if (v3)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(v12);
            -[PXSidebarOutlineSectionController _expandItemIfNeeded:inSnapshot:](self, "_expandItemIfNeeded:inSnapshot:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), v9, (_QWORD)v20);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v14);
      }

    }
  }
  v17 = v8;
  v18 = v17;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v18, OS_SIGNPOST_INTERVAL_END, v6, "_newSnapshotFromDataControllerWithRestoredExpansionState", ", buf, 2u);
  }

  return v9;
}

- (void)_configureInitialSnapshotAnimated:(BOOL)a3 expandSubItems:(BOOL)a4 applyOnQueue:(id)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  NSObject *v21;
  void (**v22)(_QWORD);
  void *v23;
  _QWORD aBlock[4];
  NSObject *v25;
  id v26;
  id v27;
  os_signpost_id_t v28;
  BOOL v29;
  BOOL v30;
  uint8_t buf[4];
  _BOOL4 v32;
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;

  v5 = a4;
  v6 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  PLSidebarGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  if (v10 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    v14 = v12;
  }
  else
  {
    if (os_signpost_enabled(v11))
    {
      *(_DWORD *)buf = 67109376;
      v32 = v6;
      v33 = 1024;
      v34 = v5;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "_configureInitialSnapshotAnimated_expandSubItems", "animated: %i, expandSubItem: %i", buf, 0xEu);
    }

    v13 = v12;
    if (os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 67109376;
      v32 = v6;
      v33 = 1024;
      v34 = v5;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v10, "_configureInitialSnapshotAnimated_expandSubItems.createSnaphot", "animated: %i, expandSubItem: %i", buf, 0xEu);
    }
  }

  -[PXSidebarOutlineSectionController dataSource](self, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PXSidebarOutlineSectionController _newSnapshotFromDataControllerWithRestoredExpansionState:](self, "_newSnapshotFromDataControllerWithRestoredExpansionState:", v5);
  v17 = v12;
  v18 = v17;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v18, OS_SIGNPOST_INTERVAL_END, v10, "_configureInitialSnapshotAnimated_expandSubItems.createSnaphot", ", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__PXSidebarOutlineSectionController__configureInitialSnapshotAnimated_expandSubItems_applyOnQueue___block_invoke;
  aBlock[3] = &unk_1E513CBB0;
  v29 = v6;
  v30 = v5;
  v25 = v18;
  v26 = v15;
  v27 = v16;
  v28 = v10;
  v19 = v16;
  v20 = v15;
  v21 = v18;
  v22 = (void (**)(_QWORD))_Block_copy(aBlock);
  v23 = v22;
  if (v8)
    dispatch_async(v8, v22);
  else
    v22[2](v22);

}

- (void)appendChildrenForParentIfNeeded:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PXSidebarOutlineSectionController dataSource](self, "dataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "snapshotForSection:", CFSTR("PXSidebarOutlineSectionControllerSectionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[PXSidebarOutlineSectionController _appendChildrenForParentIfNeeded:inSnapshot:](self, "_appendChildrenForParentIfNeeded:inSnapshot:", v4, v5);

  if ((_DWORD)self)
    objc_msgSend(v6, "applySnapshot:toSection:animatingDifferences:", v5, CFSTR("PXSidebarOutlineSectionControllerSectionIdentifier"), 0);

}

- (BOOL)_appendChildrenForParentIfNeeded:(id)a3 inSnapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "childrenOfParent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    -[PXSidebarOutlineSectionController dataController](self, "dataController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "childrenOfListItem:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "count");
    v10 = v13 != 0;
    if (v13)
    {
      objc_msgSend(v7, "appendItems:intoParent:", v12, v6);
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v14 = v12;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v21 != v17)
              objc_enumerationMutation(v14);
            -[PXSidebarOutlineSectionController _expandItemIfNeeded:inSnapshot:](self, "_expandItemIfNeeded:inSnapshot:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), v7, (_QWORD)v20);
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v16);
      }

    }
  }

  return v10;
}

- (void)_expandItem:(id)a3 inSnapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[PXSidebarOutlineSectionController dataController](self, "dataController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExpanded:forItem:", 1, v7);

  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expandItems:", v9);

  -[PXSidebarOutlineSectionController _appendChildrenForParentIfNeeded:inSnapshot:](self, "_appendChildrenForParentIfNeeded:inSnapshot:", v7, v6);
}

- (void)_expandItemIfNeeded:(id)a3 inSnapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PXSidebarOutlineSectionController dataController](self, "dataController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isItemExpanded:", v6);

  if (v9)
  {
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "expandItems:", v10);

    -[PXSidebarOutlineSectionController _appendChildrenForParentIfNeeded:inSnapshot:](self, "_appendChildrenForParentIfNeeded:inSnapshot:", v6, v7);
  }

}

- (void)_transferStateOfItem:(id)a3 oldSnapshot:(id)a4 toNewItem:(id)a5 newSnapshot:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "containsItem:", v9))
  {
    if (objc_msgSend(v10, "isExpanded:", v9))
    {
      v15[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "expandItems:", v13);

    }
    objc_msgSend(v10, "childSnapshotOfParent:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setChildrenWithSnapshot:forParent:", v14, v11);

  }
}

- (id)_applyChangeDetails:(id)a3 forItem:(id)a4 toSnapshot:(id)a5 outChangedItemsBeforeChange:(id *)a6 outChangedItemsAfterChange:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  BOOL v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id *v42;
  id *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  PXSidebarOutlineSectionController *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  _QWORD v60[5];
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[4];
  id v67;
  id v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  BOOL v73;
  uint8_t v74[128];
  uint8_t buf[4];
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = v14;
  if (v13)
  {
    if ((objc_msgSend(v14, "containsItem:", v13) & 1) != 0 && !objc_msgSend(v12, "needsReload"))
    {
      v42 = a7;
      v43 = a6;
      objc_msgSend(v15, "childSnapshotOfParent:", v13);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else if ((objc_msgSend(v12, "needsReload") & 1) == 0)
  {
    v42 = a7;
    v43 = a6;
    v16 = v15;
LABEL_9:
    v19 = v16;
    objc_msgSend(v12, "arrayChangeDetails");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "insertedIndexes");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "changedIndexes");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSidebarOutlineSectionController dataController](self, "dataController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "childrenOfListItem:", v13);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = 0;
    v71 = &v70;
    v72 = 0x2020000000;
    v73 = 0;
    if ((objc_msgSend(v48, "hasAnyInsertionsRemovalsOrMoves") & 1) != 0)
    {
      v21 = 1;
    }
    else
    {
      v22 = objc_msgSend(v47, "count");
      objc_msgSend(v19, "rootItems");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v22 != objc_msgSend(v23, "count");

    }
    v73 = v21;
    if (*((_BYTE *)v71 + 24) || !objc_msgSend(v44, "count"))
      goto LABEL_21;
    v24 = objc_msgSend(v44, "lastIndex");
    objc_msgSend(v19, "rootItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24 >= objc_msgSend(v25, "count"))
    {

    }
    else
    {
      v26 = objc_msgSend(v44, "lastIndex");
      LOBYTE(v26) = v26 < objc_msgSend(v47, "count");

      if ((v26 & 1) != 0)
      {
        objc_msgSend(v48, "changedIndexes");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __131__PXSidebarOutlineSectionController__applyChangeDetails_forItem_toSnapshot_outChangedItemsBeforeChange_outChangedItemsAfterChange___block_invoke;
        v66[3] = &unk_1E512F440;
        v67 = v19;
        v68 = v47;
        v69 = &v70;
        objc_msgSend(v27, "enumerateIndexesUsingBlock:", v66);

LABEL_21:
        if (*((_BYTE *)v71 + 24))
        {
          v29 = objc_alloc_init(MEMORY[0x1E0DC3390]);
          objc_msgSend(v29, "appendItems:", v47);
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v30 = v47;
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
          if (v31)
          {
            v32 = *(_QWORD *)v63;
            do
            {
              for (i = 0; i != v31; ++i)
              {
                if (*(_QWORD *)v63 != v32)
                  objc_enumerationMutation(v30);
                -[PXSidebarOutlineSectionController _transferStateOfItem:oldSnapshot:toNewItem:newSnapshot:](self, "_transferStateOfItem:oldSnapshot:toNewItem:newSnapshot:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i), v19, *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i), v29);
              }
              v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
            }
            while (v31);
          }

          if (objc_msgSend(v46, "count"))
          {
            v60[0] = MEMORY[0x1E0C809B0];
            v60[1] = 3221225472;
            v60[2] = __131__PXSidebarOutlineSectionController__applyChangeDetails_forItem_toSnapshot_outChangedItemsBeforeChange_outChangedItemsAfterChange___block_invoke_2;
            v60[3] = &unk_1E5126FF8;
            v60[4] = self;
            v29 = v29;
            v61 = v29;
            objc_msgSend(v30, "enumerateObjectsAtIndexes:options:usingBlock:", v46, 0, v60);

          }
        }
        else
        {
          v29 = (id)objc_msgSend(v19, "copy");
        }
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "changedItems");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "count");

        if (v36)
        {
          objc_msgSend(v12, "previousDataSection");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "changedIndexes");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v46, "count"))
          {
            v39 = (void *)objc_msgSend(v38, "mutableCopy");
            objc_msgSend(v39, "removeIndexes:", v46);

          }
          else
          {
            v39 = v38;
          }
          v49[0] = MEMORY[0x1E0C809B0];
          v49[1] = 3221225472;
          v49[2] = __131__PXSidebarOutlineSectionController__applyChangeDetails_forItem_toSnapshot_outChangedItemsBeforeChange_outChangedItemsAfterChange___block_invoke_3;
          v49[3] = &unk_1E5127020;
          v50 = v48;
          v40 = v37;
          v51 = v40;
          v52 = v47;
          v53 = self;
          v54 = v19;
          v55 = v29;
          v56 = v13;
          v57 = v15;
          v58 = v45;
          v59 = v34;
          objc_msgSend(v39, "enumerateIndexesUsingBlock:", v49);

        }
        if (v43)
          *v43 = (id)objc_msgSend(v45, "copy");
        if (v42)
          *v42 = (id)objc_msgSend(v34, "copy");
        if (v13)
        {
          v18 = (id)objc_msgSend(v15, "copy");
          objc_msgSend(v18, "setChildrenWithSnapshot:forParent:", v29, v13);
        }
        else
        {
          v18 = v29;
        }

        _Block_object_dispose(&v70, 8);
        goto LABEL_45;
      }
    }
    PXAssertGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v76 = v48;
      _os_log_fault_impl(&dword_1A6789000, v28, OS_LOG_TYPE_FAULT, "Incorrect change details:%@", buf, 0xCu);
    }

    *((_BYTE *)v71 + 24) = 1;
    goto LABEL_21;
  }
  v17 = -[PXSidebarOutlineSectionController _newSnapshotFromDataControllerWithRestoredExpansionState:](self, "_newSnapshotFromDataControllerWithRestoredExpansionState:", 1);
  v18 = v17;
  if (a7)
  {
    objc_msgSend(v17, "visibleItems");
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_45:

  return v18;
}

- (void)sidebarDataSourceController:(id)a3 didChangeChildrenOfItem:(id)a4 changeDetails:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  void (**v25)(_QWORD);
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  void (**v35)(_QWORD);
  _QWORD aBlock[4];
  id v37;
  id v38;
  PXSidebarOutlineSectionController *v39;
  id v40;
  __CFString *v41;
  NSObject *v42;
  os_signpost_id_t v43;
  BOOL v44;
  id v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  PLSidebarGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v48 = v13;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "sidebarDataSourceController_didChangeChildrenOfItem_changeDetails", "identifier: %@", buf, 0xCu);

  }
  -[PXSidebarOutlineSectionController dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "snapshotForSection:", CFSTR("PXSidebarOutlineSectionControllerSectionIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v46 = 0;
  v33 = v7;
  -[PXSidebarOutlineSectionController _applyChangeDetails:forItem:toSnapshot:outChangedItemsBeforeChange:outChangedItemsAfterChange:](self, "_applyChangeDetails:forItem:toSnapshot:outChangedItemsBeforeChange:outChangedItemsAfterChange:", v8, v7, v15, &v46, &v45);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v46;
  v30 = v45;
  objc_msgSend(v8, "insertedIndexes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v8;
  if (objc_msgSend(v17, "count"))
  {
    v18 = 1;
  }
  else
  {
    objc_msgSend(v8, "removedIndexes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v19, "count") != 0;

  }
  v20 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__PXSidebarOutlineSectionController_sidebarDataSourceController_didChangeChildrenOfItem_changeDetails___block_invoke;
  aBlock[3] = &unk_1E5127048;
  v21 = v15;
  v37 = v21;
  v22 = v16;
  v38 = v22;
  v39 = self;
  v44 = v18;
  v23 = v14;
  v40 = v23;
  v41 = CFSTR("PXSidebarOutlineSectionControllerSectionIdentifier");
  v24 = v12;
  v42 = v24;
  v43 = v10;
  v25 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[PXSidebarOutlineSectionController delegate](self, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[PXSidebarOutlineSectionController delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v20;
    v34[1] = 3221225472;
    v34[2] = __103__PXSidebarOutlineSectionController_sidebarDataSourceController_didChangeChildrenOfItem_changeDetails___block_invoke_11;
    v34[3] = &unk_1E5148A40;
    v35 = v25;
    v28 = v30;
    objc_msgSend(v27, "sidebarOutlineSectionController:willApplySnapshotWithChangedItemsAfterChange:applyBlock:", self, v30, v34);

    v29 = v33;
  }
  else
  {
    v25[2](v25);
    v29 = v33;
    v28 = v30;
  }

}

- (PXSidebarDataController)dataController
{
  return self->_dataController;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (BOOL)animateDataSourceUpdates
{
  return self->_animateDataSourceUpdates;
}

- (void)setAnimateDataSourceUpdates:(BOOL)a3
{
  self->_animateDataSourceUpdates = a3;
}

- (PXSidebarOutlineSectionControllerDelegate)delegate
{
  return (PXSidebarOutlineSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_dataController, 0);
}

void __103__PXSidebarOutlineSectionController_sidebarDataSourceController_didChangeChildrenOfItem_changeDetails___block_invoke(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 48), "animateDataSourceUpdates");
    if (*(_BYTE *)(a1 + 88))
      v3 = v2;
    else
      v3 = 0;
    objc_msgSend(*(id *)(a1 + 56), "applySnapshot:toSection:animatingDifferences:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), v3);
  }
  v4 = *(id *)(a1 + 72);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 80);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v6, "sidebarDataSourceController_didChangeChildrenOfItem_changeDetails", ", v7, 2u);
  }

}

uint64_t __103__PXSidebarOutlineSectionController_sidebarDataSourceController_didChangeChildrenOfItem_changeDetails___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __131__PXSidebarOutlineSectionController__applyChangeDetails_forItem_toSnapshot_outChangedItemsBeforeChange_outChangedItemsAfterChange___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  id v7;
  char v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "rootItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v7)
  {

  }
  else
  {
    v8 = objc_msgSend(v9, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *a3 = 1;
    }
  }

}

uint64_t __131__PXSidebarOutlineSectionController__applyChangeDetails_forItem_toSnapshot_outChangedItemsBeforeChange_outChangedItemsAfterChange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_expandItemIfNeeded:inSnapshot:", a2, *(_QWORD *)(a1 + 40));
}

void __131__PXSidebarOutlineSectionController__applyChangeDetails_forItem_toSnapshot_outChangedItemsBeforeChange_outChangedItemsAfterChange___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "indexAfterRevertingChangesFromIndex:", a2));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "_transferStateOfItem:oldSnapshot:toNewItem:newSnapshot:", v5, *(_QWORD *)(a1 + 64), v4, *(_QWORD *)(a1 + 72));
  if (!*(_QWORD *)(a1 + 80) || objc_msgSend(*(id *)(a1 + 88), "isExpanded:"))
  {
    if (objc_msgSend(*(id *)(a1 + 64), "containsItem:", v5))
    {
      objc_msgSend(*(id *)(a1 + 96), "addObject:", v5);
      objc_msgSend(*(id *)(a1 + 104), "addObject:", v4);
    }
  }

}

void __99__PXSidebarOutlineSectionController__configureInitialSnapshotAnimated_expandSubItems_applyOnQueue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  int v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  _DWORD v13[2];
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    v5 = *(unsigned __int8 *)(a1 + 64);
    v6 = *(unsigned __int8 *)(a1 + 65);
    v13[0] = 67109376;
    v13[1] = v5;
    v14 = 1024;
    v15 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "_configureInitialSnapshotAnimated_expandSubItems.applySnapshot", "animated: %i, expandSubItem: %i", (uint8_t *)v13, 0xEu);
  }

  objc_msgSend(*(id *)(a1 + 40), "applySnapshot:toSection:animatingDifferences:", *(_QWORD *)(a1 + 48), CFSTR("PXSidebarOutlineSectionControllerSectionIdentifier"), *(unsigned __int8 *)(a1 + 64));
  v7 = *(id *)(a1 + 32);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v13[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_END, v9, "_configureInitialSnapshotAnimated_expandSubItems.applySnapshot", ", (uint8_t *)v13, 2u);
  }

  v10 = *(id *)(a1 + 32);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 56);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v13[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_END, v12, "_configureInitialSnapshotAnimated_expandSubItems", ", (uint8_t *)v13, 2u);
  }

}

void __90__PXSidebarOutlineSectionController_expandItemsToRevealFirstEditableItemIfNeededAnimated___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "isReorderable") & 1) != 0 || objc_msgSend(v7, "isDeletable"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
  else if (objc_msgSend(v7, "isExpandable"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  }

}

void __90__PXSidebarOutlineSectionController_expandItemsToRevealFirstEditableItemIfNeededAnimated___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "isReorderable") & 1) != 0 || objc_msgSend(v7, "isDeletable"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

@end
