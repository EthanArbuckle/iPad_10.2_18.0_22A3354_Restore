@implementation PXSwipeSelectionManager

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToItemIndexPathAtLocation = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToItemIndexPathClosestLeadingLocation = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToItemIndexPathClosestAboveLocation = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToShouldSelectItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToShouldBeginSelectionAtLocation = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToShouldAutomaticallyTransitionToMultiSelectModeAtPoint = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToAutomaticallyTransitionToMultiSelectMode = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToIndexPathSetFromIndexPathToIndexPath = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToExtendSelectionInDirection = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidAutoScroll = objc_opt_respondsToSelector() & 1;
  }

}

- (NSArray)keyCommandsForSelectionExtension
{
  char v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = objc_opt_respondsToSelector();
  v4 = (id)MEMORY[0x1E0C9AA60];
  if ((v3 & 1) != 0)
  {
    -[UIMultiSelectInteraction keyCommandsForSelectionExtension](self->_multiSelectInteraction, "keyCommandsForSelectionExtension");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (void *)v5;
    else
      v7 = v4;
    v4 = v7;

  }
  return (NSArray *)v4;
}

- (PXSwipeSelectionManager)initWithSelectionManager:(id)a3 scrollView:(id)a4
{
  id v7;
  id v8;
  PXSwipeSelectionManager *v9;
  PXSwipeSelectionManager *v10;
  UIMultiSelectInteraction *v11;
  UIMultiSelectInteraction *multiSelectInteraction;
  PXUIAutoScroller *v13;
  PXUIAutoScroller *autoScroller;
  void *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PXSwipeSelectionManager;
  v9 = -[PXSwipeSelectionManager init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_selectionManager, a3);
    objc_storeStrong((id *)&v10->_scrollView, a4);
    v11 = (UIMultiSelectInteraction *)objc_alloc_init(MEMORY[0x1E0DC3A18]);
    multiSelectInteraction = v10->_multiSelectInteraction;
    v10->_multiSelectInteraction = v11;

    -[UIMultiSelectInteraction setDelegate:](v10->_multiSelectInteraction, "setDelegate:", v10);
    -[UIMultiSelectInteraction setSingleTouchPanGestureHysteresis:](v10->_multiSelectInteraction, "setSingleTouchPanGestureHysteresis:", 5.0);
    objc_msgSend(v8, "addInteraction:", v10->_multiSelectInteraction);
    v13 = -[PXAutoScroller initWithTargetScrollView:]([PXUIAutoScroller alloc], "initWithTargetScrollView:", v8);
    autoScroller = v10->__autoScroller;
    v10->__autoScroller = v13;

    -[PXAutoScroller setDelegate:](v10->__autoScroller, "setDelegate:", v10);
    v10->__currentDataSourceIdentifier = *(_QWORD *)off_1E50B7E98;
    objc_msgSend(v7, "dataSourceManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerChangeObserver:context:", v10, PXSwipeSelectionManagerDataSourceObserverContext);

  }
  return v10;
}

- (BOOL)supportsKeyboardSelectionExtension
{
  return 1;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v8 = a3;
  if ((v6 & 1) != 0 && (void *)PXSwipeSelectionManagerDataSourceObserverContext == a5)
  {
    v11 = v8;
    objc_msgSend(v8, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "changeHistory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSwipeSelectionManager _updateWithDataSource:changeHistory:](self, "_updateWithDataSource:changeHistory:", v9, v10);

    v8 = v11;
  }

}

- (void)_updateWithDataSource:(id)a3 changeHistory:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[PXSwipeSelectionManager _currentDataSourceIdentifier](self, "_currentDataSourceIdentifier");
  if (v8 != *(_QWORD *)off_1E50B7E98)
  {
    v9 = v8;
    v10 = objc_msgSend(v6, "identifier");
    objc_msgSend(v7, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    -[PXSwipeSelectionManager _startingIndexPath](self, "_startingIndexPath");
    v27 = 0u;
    v28 = 0u;
    v25 = v29;
    v26 = v30;
    objc_msgSend(off_1E50B4A18, "indexPathAfterApplyingChanges:toIndexPath:hasIncrementalChanges:objectChanged:", v11, &v25, 0, 0);
    v25 = v27;
    v26 = v28;
    -[PXSwipeSelectionManager _setStartingIndexPath:](self, "_setStartingIndexPath:", &v25);
    -[PXSwipeSelectionManager _selectedIndexPathsBeforeSwipe](self, "_selectedIndexPathsBeforeSwipe");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B4A18, "indexPathSetAfterApplyingChanges:toIndexPathSet:hasIncrementalChanges:", v11, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSwipeSelectionManager _setSelectedIndexPathsBeforeSwipe:](self, "_setSelectedIndexPathsBeforeSwipe:", v13);
    -[PXSwipeSelectionManager _setCurrentDataSourceIdentifier:](self, "_setCurrentDataSourceIdentifier:", v10);
    if (v10 != (_QWORD)v27)
    {
      -[PXSwipeSelectionManager _endSelection](self, "_endSelection");
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      -[PXSwipeSelectionManager multiSelectInteraction](self, "multiSelectInteraction", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "gesturesForFailureRequirements");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v22 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v20, "setEnabled:", 0);
            objc_msgSend(v20, "setEnabled:", 1);
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
        }
        while (v17);
      }

    }
  }

}

- (int64_t)_currentDataSourceIdentifier
{
  return self->__currentDataSourceIdentifier;
}

- (PXSwipeSelectionManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSwipeSelectionManager.m"), 97, CFSTR("Not supported"));

  abort();
}

- (void)removeFromView
{
  void *v3;
  UIMultiSelectInteraction *multiSelectInteraction;

  -[UIMultiSelectInteraction view](self->_multiSelectInteraction, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeInteraction:", self->_multiSelectInteraction);

  multiSelectInteraction = self->_multiSelectInteraction;
  self->_multiSelectInteraction = 0;

}

- (NSArray)gesturesForFailureRequirements
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[UIMultiSelectInteraction gesturesForFailureRequirements](self->_multiSelectInteraction, "gesturesForFailureRequirements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (id)targetForKeyCommands
{
  if (self->_multiSelectInteraction)
    self = (PXSwipeSelectionManager *)self->_multiSelectInteraction;
  return self;
}

- (PXSimpleIndexPath)_itemIndexPathAtLocation:(SEL)a3
{
  double y;
  double x;
  __int128 v7;
  PXSimpleIndexPath *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;

  y = a4.y;
  x = a4.x;
  v7 = *((_OWORD *)off_1E50B8778 + 1);
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
  *(_OWORD *)&retstr->item = v7;
  if (BYTE1(self->section))
  {
    v8 = self;
    -[PXSimpleIndexPath delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "swipeSelectionManager:itemIndexPathAtLocation:", v8, x, y);
    }
    else
    {
      v11 = 0u;
      v12 = 0u;
    }
    *(_OWORD *)&retstr->dataSourceIdentifier = v11;
    *(_OWORD *)&retstr->item = v12;

  }
  return self;
}

- (PXSimpleIndexPath)_itemIndexPathClosestLeadingLocation:(SEL)a3
{
  double y;
  double x;
  __int128 v7;
  PXSimpleIndexPath *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;

  y = a4.y;
  x = a4.x;
  v7 = *((_OWORD *)off_1E50B8778 + 1);
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
  *(_OWORD *)&retstr->item = v7;
  if (BYTE2(self->section))
  {
    v8 = self;
    -[PXSimpleIndexPath delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "swipeSelectionManager:itemIndexPathClosestLeadingLocation:", v8, x, y);
    }
    else
    {
      v11 = 0u;
      v12 = 0u;
    }
    *(_OWORD *)&retstr->dataSourceIdentifier = v11;
    *(_OWORD *)&retstr->item = v12;

  }
  return self;
}

- (PXSimpleIndexPath)_itemIndexPathClosestAboveLocation:(SEL)a3
{
  double y;
  double x;
  __int128 v7;
  PXSimpleIndexPath *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;

  y = a4.y;
  x = a4.x;
  v7 = *((_OWORD *)off_1E50B8778 + 1);
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
  *(_OWORD *)&retstr->item = v7;
  if (BYTE3(self->section))
  {
    v8 = self;
    -[PXSimpleIndexPath delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "swipeSelectionManager:itemIndexPathClosestAboveLocation:", v8, x, y);
    }
    else
    {
      v11 = 0u;
      v12 = 0u;
    }
    *(_OWORD *)&retstr->dataSourceIdentifier = v11;
    *(_OWORD *)&retstr->item = v12;

  }
  return self;
}

- (BOOL)_isSelecting
{
  return -[PXSwipeSelectionManager state](self, "state") != 0;
}

- (void)_beginSelectionFromIndexPath:(PXSimpleIndexPath *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_beginPausingChangesWithTimeout:identifier:", CFSTR("PXSwipeSelectionManager"), 60.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSwipeSelectionManager _setPausingChangesToken:](self, "_setPausingChangesToken:", v6);
  -[PXSwipeSelectionManager selectionManager](self, "selectionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectionSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedIndexPaths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSwipeSelectionManager _setSelectedIndexPathsBeforeSwipe:](self, "_setSelectedIndexPathsBeforeSwipe:", v9);
  v10 = *(_OWORD *)&a3->item;
  v16 = *(_OWORD *)&a3->dataSourceIdentifier;
  v17 = v10;
  -[PXSwipeSelectionManager _setStartingIndexPath:](self, "_setStartingIndexPath:", &v16);
  -[PXSwipeSelectionManager selectionManager](self, "selectionManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "selectionSnapshot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSwipeSelectionManager _setCurrentDataSourceIdentifier:](self, "_setCurrentDataSourceIdentifier:", objc_msgSend(v13, "identifier"));

  v14 = *(_OWORD *)&a3->item;
  v16 = *(_OWORD *)&a3->dataSourceIdentifier;
  v17 = v14;
  if (objc_msgSend(v9, "containsIndexPath:", &v16))
    v15 = 2;
  else
    v15 = 1;
  -[PXSwipeSelectionManager _setState:](self, "_setState:", v15);

}

- (void)_updateSelectionWithHitIndexPath:(PXSimpleIndexPath *)a3 leadingClosestIndexPath:(PXSimpleIndexPath *)a4 aboveClosestIndexPath:(PXSimpleIndexPath *)a5
{
  uint64_t v10;
  int64_t dataSourceIdentifier;
  int64_t v12;
  int64_t v13;
  __int128 v14;
  PXSimpleIndexPath *v17;
  __int128 v18;
  void *v19;
  _OWORD v20[2];
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  -[PXSwipeSelectionManager _startingIndexPath](self, "_startingIndexPath");
  v10 = *(_QWORD *)off_1E50B7E98;
  if (v23 == *(_QWORD *)off_1E50B7E98)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSwipeSelectionManager.m"), 202, CFSTR("Starting indexPath should be set"));

  }
  dataSourceIdentifier = a3->dataSourceIdentifier;
  v12 = a4->dataSourceIdentifier;
  v13 = a5->dataSourceIdentifier;
  v21 = 0u;
  v22 = 0u;
  if (-[PXSwipeSelectionManager _isSelecting](self, "_isSelecting"))
  {
    -[PXSwipeSelectionManager _currentIndexPath](self, "_currentIndexPath");
  }
  else
  {
    v14 = *((_OWORD *)off_1E50B8778 + 1);
    v21 = *(_OWORD *)off_1E50B8778;
    v22 = v14;
  }
  if (dataSourceIdentifier != v10 || v12 != v10 || v13 != v10)
  {
    if (v12 == v10)
      v17 = a5;
    else
      v17 = a4;
    if (dataSourceIdentifier != v10)
      v17 = a3;
    v18 = *(_OWORD *)&v17->item;
    v21 = *(_OWORD *)&v17->dataSourceIdentifier;
    v22 = v18;
  }
  v20[0] = v21;
  v20[1] = v22;
  -[PXSwipeSelectionManager _setCurrentIndexPath:](self, "_setCurrentIndexPath:", v20);
}

- (void)_endSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  -[PXSwipeSelectionManager _setState:](self, "_setState:", 0);
  -[PXSwipeSelectionManager _setCurrentDataSourceIdentifier:](self, "_setCurrentDataSourceIdentifier:", *(_QWORD *)off_1E50B7E98);
  -[PXSwipeSelectionManager _setSelectedIndexPathsBeforeSwipe:](self, "_setSelectedIndexPathsBeforeSwipe:", 0);
  v8 = *((_OWORD *)off_1E50B8778 + 1);
  v9 = *(_OWORD *)off_1E50B8778;
  v7 = v9;
  v10 = v8;
  -[PXSwipeSelectionManager _setStartingIndexPath:](self, "_setStartingIndexPath:", &v9);
  v9 = v7;
  v10 = v8;
  -[PXSwipeSelectionManager _setCurrentIndexPath:](self, "_setCurrentIndexPath:", &v9);
  -[PXSwipeSelectionManager _autoScroller](self, "_autoScroller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  -[PXSwipeSelectionManager _pausingChangesToken](self, "_pausingChangesToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSwipeSelectionManager _pausingChangesToken](self, "_pausingChangesToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_endPausingChanges:", v6);

    -[PXSwipeSelectionManager _setPausingChangesToken:](self, "_setPausingChangesToken:", 0);
  }
}

- (void)_setCurrentIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v4;

  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)&self->__currentIndexPath.dataSourceIdentifier, *(int64x2_t *)&a3->dataSourceIdentifier), (int32x4_t)vceqq_s64(*(int64x2_t *)&self->__currentIndexPath.item, *(int64x2_t *)&a3->item))), 0xFuLL))) & 1) == 0)
  {
    v4 = *(_OWORD *)&a3->item;
    *(_OWORD *)&self->__currentIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
    *(_OWORD *)&self->__currentIndexPath.item = v4;
    -[PXSwipeSelectionManager _invalidateSelectedIndexPaths](self, "_invalidateSelectedIndexPaths");
    -[PXSwipeSelectionManager _updateSelectedIndexPaths](self, "_updateSelectedIndexPaths");
  }
}

- (void)_invalidateSelectedIndexPaths
{
  self->_needsUpdateFlags.selectedIndexPaths = 1;
}

- (void)_updateSelectedIndexPaths
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  if (self->_needsUpdateFlags.selectedIndexPaths)
  {
    self->_needsUpdateFlags.selectedIndexPaths = 0;
    -[PXSwipeSelectionManager _selectedIndexPathsBeforeSwipe](self, "_selectedIndexPathsBeforeSwipe");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
LABEL_19:

      return;
    }
    v27 = 0u;
    v28 = 0u;
    -[PXSwipeSelectionManager _startingIndexPath](self, "_startingIndexPath");
    v25 = 0u;
    v26 = 0u;
    -[PXSwipeSelectionManager _currentIndexPath](self, "_currentIndexPath");
    -[PXSwipeSelectionManager selectionManager](self, "selectionManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataSourceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_QWORD *)off_1E50B7E98)
      v7 = (_QWORD)v25 == *(_QWORD *)off_1E50B7E98;
    else
      v7 = 1;
    if (v7)
    {
      objc_msgSend(off_1E50B3180, "indexPathSet");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (self->_delegateFlags.respondsToIndexPathSetFromIndexPathToIndexPath)
      {
        -[PXSwipeSelectionManager delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v28;
        v21 = v25;
        v22 = v26;
        v23 = v27;
        objc_msgSend(v9, "swipeSelectionManager:indexPathSetFromIndexPath:toIndexPath:", self, &v23, &v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
        v11 = MEMORY[0x1E0C809B0];
        if (self->_delegateFlags.respondsToShouldSelectItemAtIndexPath)
        {
          objc_msgSend(off_1E50B3668, "indexPathSet");
          v19[0] = v11;
          v19[1] = 3221225472;
          v19[2] = __52__PXSwipeSelectionManager__updateSelectedIndexPaths__block_invoke;
          v19[3] = &unk_1E5142450;
          v19[4] = self;
          v20 = (id)objc_claimAutoreleasedReturnValue();
          v12 = v20;
          objc_msgSend(v10, "enumerateAllIndexPathsUsingBlock:", v19);
          v13 = (void *)objc_msgSend(v10, "mutableCopy");
          objc_msgSend(v13, "minusIndexPathSet:", v12);

          v10 = v13;
        }
        v14 = (void *)objc_msgSend(v3, "mutableCopy");
        if (-[PXSwipeSelectionManager state](self, "state") == 1)
          objc_msgSend(v14, "unionIndexPathSet:", v10);
        else
          objc_msgSend(v14, "minusIndexPathSet:", v10);
        -[PXSwipeSelectionManager selectionManager](self, "selectionManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v11;
        v17[1] = 3221225472;
        v17[2] = __52__PXSwipeSelectionManager__updateSelectedIndexPaths__block_invoke_2;
        v17[3] = &unk_1E513C668;
        v18 = v14;
        v16 = v14;
        objc_msgSend(v15, "performChanges:", v17);

        goto LABEL_19;
      }
      v24 = v28;
      v21 = v25;
      v22 = v26;
      v23 = v27;
      objc_msgSend(v6, "indexPathSetFromIndexPath:toIndexPath:", &v23, &v21);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v8;
    goto LABEL_13;
  }
}

- (id)sectionedDataSourceManagerInterestingObjectReferences:(id)a3
{
  return 0;
}

- (void)autoScroller:(id)a3 didAutoscrollWithTimestamp:(double)a4
{
  id v5;

  if (self->_delegateFlags.respondsToDidAutoScroll)
  {
    -[PXSwipeSelectionManager delegate](self, "delegate", a3, a4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "swipeSelectionManagerDidAutoScroll:", self);

  }
}

- (BOOL)_shouldBeginMultiSelectAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  int v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  y = a3.y;
  x = a3.x;
  if (self->_delegateFlags.respondsToShouldBeginSelectionAtLocation)
  {
    -[PXSwipeSelectionManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "swipeSelectionManager:shouldBeginSelectionAtLocation:", self, x, y);

    if (!v7)
      return 0;
  }
  -[PXSwipeSelectionManager _itemIndexPathAtLocation:](self, "_itemIndexPathAtLocation:", x, y);
  v8 = v12;
  v15 = v13;
  v16 = v14;
  if (v12 == *(_QWORD *)off_1E50B7E98)
    return 0;
  if (!self->_delegateFlags.respondsToShouldSelectItemAtIndexPath)
    return 1;
  -[PXSwipeSelectionManager delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  v13 = v15;
  v14 = v16;
  v9 = objc_msgSend(v10, "swipeSelectionManager:shouldSelectItemAtIndexPath:", self, &v12);

  return v9;
}

- (BOOL)supportsMultiSelectInteraction:(id)a3
{
  return 1;
}

- (BOOL)isInMultiSelectMode
{
  PXSwipeSelectionManager *v2;
  void *v3;

  v2 = self;
  -[PXSwipeSelectionManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "swipeSelectionManagerIsInMultiSelectMode:", v2);

  return (char)v2;
}

- (void)automaticallyTransitionToMultiSelectModeKeepingCurrentSelection:(BOOL)a3
{
  id v4;

  if (self->_delegateFlags.respondsToAutomaticallyTransitionToMultiSelectMode)
  {
    -[PXSwipeSelectionManager delegate](self, "delegate", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode:", self);

  }
}

- (BOOL)interaction:(id)a3 shouldAutomaticallyTransitionToMultiSelectModeAtPoint:(CGPoint)a4
{
  return -[PXSwipeSelectionManager interaction:shouldAutomaticallyTransitionToMultiSelectModeAtPoint:withVelocity:](self, "interaction:shouldAutomaticallyTransitionToMultiSelectModeAtPoint:withVelocity:", a3, a4.x, a4.y, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (BOOL)interaction:(id)a3 shouldAutomaticallyTransitionToMultiSelectModeAtPoint:(CGPoint)a4 withVelocity:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  void *v10;
  _BOOL4 respondsToAutomaticallyTransitionToMultiSelectMode;
  void *v12;
  int v13;
  _BOOL4 v14;
  BOOL v15;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  +[PXGridSettings sharedInstance](PXGridSettings, "sharedInstance", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "enableAutomaticTransitionToSelectMode"))
  {

    return 0;
  }
  respondsToAutomaticallyTransitionToMultiSelectMode = self->_delegateFlags.respondsToAutomaticallyTransitionToMultiSelectMode;

  if (!respondsToAutomaticallyTransitionToMultiSelectMode)
    return 0;
  if (self->_delegateFlags.respondsToShouldAutomaticallyTransitionToMultiSelectModeAtPoint)
  {
    -[PXSwipeSelectionManager delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "swipeSelectionManager:shouldAutomaticallyTransitionToMultiSelectModeAtPoint:", self, v8, v7);

    if (!v13)
      return 0;
  }
  v14 = -[PXSwipeSelectionManager _shouldBeginMultiSelectAtLocation:](self, "_shouldBeginMultiSelectAtLocation:", v8, v7);
  v15 = fabs(x) > fabs(y);
  return v14 && v15;
}

- (BOOL)shouldBeginMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4 withVelocity:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  _BOOL4 v10;
  _BOOL4 v11;
  BOOL v12;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v10 = -[PXSwipeSelectionManager isInMultiSelectMode](self, "isInMultiSelectMode", a3);
  if (v10)
  {
    v11 = -[PXSwipeSelectionManager _shouldBeginMultiSelectAtLocation:](self, "_shouldBeginMultiSelectAtLocation:", v8, v7);
    v12 = fabs(x) > fabs(y);
    LOBYTE(v10) = v11 && v12;
  }
  return v10;
}

- (void)willBeginMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  _OWORD v7[2];
  __int128 v8;
  __int128 v9;

  y = a4.y;
  x = a4.x;
  if (!-[PXSwipeSelectionManager _isSelecting](self, "_isSelecting", a3))
  {
    if (PXPointIsValid())
    {
      v8 = 0u;
      v9 = 0u;
      -[PXSwipeSelectionManager _itemIndexPathAtLocation:](self, "_itemIndexPathAtLocation:", x, y);
      v7[0] = v8;
      v7[1] = v9;
      -[PXSwipeSelectionManager _beginSelectionFromIndexPath:](self, "_beginSelectionFromIndexPath:", v7);
    }
  }
}

- (void)multiSelectInteraction:(id)a3 toggleSelectionStateUpToPoint:(CGPoint)a4
{
  double y;
  double x;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  _OWORD v11[2];
  _OWORD v12[2];
  _OWORD v13[2];
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  y = a4.y;
  x = a4.x;
  v19 = 0u;
  v20 = 0u;
  -[PXSwipeSelectionManager _itemIndexPathAtLocation:](self, "_itemIndexPathAtLocation:", a3, a4.x);
  v17 = 0u;
  v18 = 0u;
  -[PXSwipeSelectionManager _itemIndexPathClosestLeadingLocation:](self, "_itemIndexPathClosestLeadingLocation:", x, y);
  v15 = 0u;
  v16 = 0u;
  -[PXSwipeSelectionManager _itemIndexPathClosestAboveLocation:](self, "_itemIndexPathClosestAboveLocation:", x, y);
  v7 = *(_QWORD *)off_1E50B7E98;
  if (*(_QWORD *)off_1E50B7E98)
  {
    if ((_QWORD)v19 == v7)
      goto LABEL_9;
    v8 = 0;
  }
  else
  {
    v8 = (_QWORD)v15 == (_QWORD)v17;
    if ((_QWORD)v19 == (_QWORD)v17)
    {
      if ((_QWORD)v15 == (_QWORD)v17)
        return;
LABEL_9:
      if (!-[PXSwipeSelectionManager _isSelecting](self, "_isSelecting"))
        return;
      goto LABEL_10;
    }
  }
  -[PXSwipeSelectionManager _startingIndexPath](self, "_startingIndexPath");
  if (v14 == v7 && !v8)
    goto LABEL_9;
  if (v14 == v7)
    return;
LABEL_10:
  v13[0] = v19;
  v13[1] = v20;
  v12[0] = v17;
  v12[1] = v18;
  v11[0] = v15;
  v11[1] = v16;
  -[PXSwipeSelectionManager _updateSelectionWithHitIndexPath:leadingClosestIndexPath:aboveClosestIndexPath:](self, "_updateSelectionWithHitIndexPath:leadingClosestIndexPath:aboveClosestIndexPath:", v13, v12, v11);
  -[PXSwipeSelectionManager _autoScroller](self, "_autoScroller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSwipeSelectionManager scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateWithUserInteractionLocation:inCoordinateSpace:", v10, x, y);

}

- (BOOL)shouldAllowSelectionExtensionAtPoint:(CGPoint)a3
{
  return 0;
}

- (void)didEndMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4
{
  if (-[PXSwipeSelectionManager _isSelecting](self, "_isSelecting", a3, a4.x, a4.y))
    -[PXSwipeSelectionManager _endSelection](self, "_endSelection");
}

- (void)didCancelMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4
{
  if (-[PXSwipeSelectionManager _isSelecting](self, "_isSelecting", a3, a4.x, a4.y))
    -[PXSwipeSelectionManager _endSelection](self, "_endSelection");
}

- (BOOL)shouldAllowSelectionExtensionAtIndexPath:(id)a3
{
  return 1;
}

- (void)multiSelectInteraction:(id)a3 extendSelectionInDirection:(unint64_t)a4
{
  uint64_t v5;
  id v6;

  if (self->_delegateFlags.respondsToExtendSelectionInDirection)
  {
    if (a4 > 3)
      v5 = 0;
    else
      v5 = qword_1A7C0ADB8[a4];
    -[PXSwipeSelectionManager delegate](self, "delegate", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "swipeSelectionManager:extendSelectionInDirection:", self, v5);

  }
}

- (PXSwipeSelectionManagerDelegate)delegate
{
  return (PXSwipeSelectionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)_setState:(unint64_t)a3
{
  self->_state = a3;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (void)_setCurrentDataSourceIdentifier:(int64_t)a3
{
  self->__currentDataSourceIdentifier = a3;
}

- (PXSimpleIndexPath)_startingIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].item;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[3].dataSourceIdentifier;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (void)_setStartingIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->__startingIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->__startingIndexPath.item = v3;
}

- (PXSimpleIndexPath)_currentIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].item;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[4].dataSourceIdentifier;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXIndexPathSet)_selectedIndexPathsBeforeSwipe
{
  return self->__selectedIndexPathsBeforeSwipe;
}

- (void)_setSelectedIndexPathsBeforeSwipe:(id)a3
{
  objc_storeStrong((id *)&self->__selectedIndexPathsBeforeSwipe, a3);
}

- (id)_pausingChangesToken
{
  return self->__pausingChangesToken;
}

- (void)_setPausingChangesToken:(id)a3
{
  objc_storeStrong(&self->__pausingChangesToken, a3);
}

- (PXUIAutoScroller)_autoScroller
{
  return self->__autoScroller;
}

- (UIMultiSelectInteraction)multiSelectInteraction
{
  return self->_multiSelectInteraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiSelectInteraction, 0);
  objc_storeStrong((id *)&self->__autoScroller, 0);
  objc_storeStrong(&self->__pausingChangesToken, 0);
  objc_storeStrong((id *)&self->__selectedIndexPathsBeforeSwipe, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __52__PXSwipeSelectionManager__updateSelectedIndexPaths__block_invoke(uint64_t a1, __int128 *a2)
{
  void *v4;
  uint64_t v5;
  __int128 v6;
  char v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2[1];
  v10 = *a2;
  v11 = v6;
  v7 = objc_msgSend(v4, "swipeSelectionManager:shouldSelectItemAtIndexPath:", v5, &v10);

  if ((v7 & 1) == 0)
  {
    v8 = *(void **)(a1 + 40);
    v9 = a2[1];
    v10 = *a2;
    v11 = v9;
    objc_msgSend(v8, "addIndexPath:", &v10);
  }
}

uint64_t __52__PXSwipeSelectionManager__updateSelectedIndexPaths__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectedIndexPaths:", *(_QWORD *)(a1 + 32));
}

@end
