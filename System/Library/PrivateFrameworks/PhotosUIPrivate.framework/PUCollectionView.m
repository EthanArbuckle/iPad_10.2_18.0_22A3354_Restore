@implementation PUCollectionView

- (PUCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  PUCollectionView *v4;
  uint64_t v5;
  UILongPressGestureRecognizer *dragGestureRecognizer;
  uint64_t v7;
  _UIDragSnappingFeedbackGenerator *feedbackDragBehavior;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)PUCollectionView;
  v4 = -[PUCollectionView initWithFrame:collectionViewLayout:](&v20, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v4, sel__handleDrag_);
    dragGestureRecognizer = v4->_dragGestureRecognizer;
    v4->_dragGestureRecognizer = (UILongPressGestureRecognizer *)v5;

    -[UILongPressGestureRecognizer setMinimumPressDuration:](v4->_dragGestureRecognizer, "setMinimumPressDuration:", 0.2);
    -[UILongPressGestureRecognizer setDelegate:](v4->_dragGestureRecognizer, "setDelegate:", v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4110]), "initWithCoordinateSpace:", v4);
    feedbackDragBehavior = v4->__feedbackDragBehavior;
    v4->__feedbackDragBehavior = (_UIDragSnappingFeedbackGenerator *)v7;

    -[PUCollectionView gestureRecognizers](v4, "gestureRecognizers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v14, "requireGestureRecognizerToFail:", v4->_dragGestureRecognizer);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v11);
    }
    -[PUCollectionView addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_dragGestureRecognizer);

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[UILongPressGestureRecognizer setDelegate:](self->_dragGestureRecognizer, "setDelegate:", 0);
  -[PUCollectionView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_dragGestureRecognizer);
  v3.receiver = self;
  v3.super_class = (Class)PUCollectionView;
  -[PUCollectionView dealloc](&v3, sel_dealloc);
}

- (void)adjustedContentInsetDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUCollectionView;
  -[PUCollectionView adjustedContentInsetDidChange](&v4, sel_adjustedContentInsetDidChange);
  -[PUCollectionView collectionViewLayout](self, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "invalidateLayoutForVerticalScroll");

}

- (void)insertItemsAtIndexPaths:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUCollectionView;
  -[PUCollectionView insertItemsAtIndexPaths:](&v8, sel_insertItemsAtIndexPaths_, v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__PUCollectionView_insertItemsAtIndexPaths___block_invoke;
  v6[3] = &unk_1E589DCF8;
  v7 = v4;
  v5 = v4;
  -[PUCollectionView _updateDragUsingIndexPathUpdateBlock:](self, "_updateDragUsingIndexPathUpdateBlock:", v6);

}

- (void)deleteItemsAtIndexPaths:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUCollectionView;
  -[PUCollectionView deleteItemsAtIndexPaths:](&v8, sel_deleteItemsAtIndexPaths_, v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__PUCollectionView_deleteItemsAtIndexPaths___block_invoke;
  v6[3] = &unk_1E589DCF8;
  v7 = v4;
  v5 = v4;
  -[PUCollectionView _updateDragUsingIndexPathUpdateBlock:](self, "_updateDragUsingIndexPathUpdateBlock:", v6);

}

- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PUCollectionView;
  -[PUCollectionView moveItemAtIndexPath:toIndexPath:](&v13, sel_moveItemAtIndexPath_toIndexPath_, v6, v7);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__PUCollectionView_moveItemAtIndexPath_toIndexPath___block_invoke;
  v10[3] = &unk_1E589DD20;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PUCollectionView _updateDragUsingIndexPathUpdateBlock:](self, "_updateDragUsingIndexPathUpdateBlock:", v10);

}

- (void)reloadData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUCollectionView;
  -[PUCollectionView reloadData](&v3, sel_reloadData);
  -[UILongPressGestureRecognizer pu_cancel](self->_dragGestureRecognizer, "pu_cancel");
}

- (id)indexPathsForSelectedItems
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[PUCollectionView selectionDelegate](self, "selectionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "indexPathsForSelectedItemsInCollectionView:", self);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PUCollectionView;
    -[PUCollectionView indexPathsForSelectedItems](&v7, sel_indexPathsForSelectedItems);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (void)didScrollToInitialPosition
{
  _QWORD block[5];

  self->_shouldWorkaround34630932 = 1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PUCollectionView_didScrollToInitialPosition__block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_applyAutomaticAdjustedContentOffset:(CGPoint)a3
{
  objc_super v3;

  if (!self->_shouldWorkaround34630932)
  {
    v3.receiver = self;
    v3.super_class = (Class)PUCollectionView;
    -[PUCollectionView _applyAutomaticAdjustedContentOffset:](&v3, sel__applyAutomaticAdjustedContentOffset_, a3.x, a3.y);
  }
}

- (void)_handleDrag:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  UIView *v14;
  UIView *draggedView;
  UIView *v16;
  UIView *v17;
  double v18;
  double v19;
  PXUIAutoScroller *v20;
  PXUIAutoScroller *autoScroller;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  uint64_t v28;
  char v29;
  void *v30;
  void *v31;
  uint64_t v32;
  PXUIAutoScroller *v33;
  void *v34;
  UIView *v35;
  NSIndexPath *dragTargetIndexPath;
  NSIndexPath *dragSourceIndexPath;
  PXUIAutoScroller *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t);
  void *v43;
  PUCollectionView *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  PUCollectionView *v48;
  id v49;
  _QWORD v50[5];

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  objc_msgSend(v4, "locationInView:", self);
  -[PUCollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCollectionView _reorderableLayout](self, "_reorderableLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCollectionView superview](self, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v8);
  v10 = v9;
  v12 = v11;
  switch(v5)
  {
    case 1:
      -[PUCollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "snapshotViewAfterScreenUpdates:", 1);
      v14 = (UIView *)objc_claimAutoreleasedReturnValue();
      -[UIView removeFromSuperview](self->_draggedView, "removeFromSuperview");
      draggedView = self->_draggedView;
      self->_draggedView = v14;
      v16 = v14;

      objc_msgSend(v8, "addSubview:", self->_draggedView);
      v17 = self->_draggedView;
      objc_msgSend(v13, "frame");
      objc_msgSend(v8, "convertRect:fromView:", self);
      -[UIView setFrame:](v17, "setFrame:");
      -[UIView center](self->_draggedView, "center");
      self->_draggedViewCenterOffset.x = v10 - v18;
      -[UIView center](self->_draggedView, "center");
      self->_draggedViewCenterOffset.y = v12 - v19;
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __32__PUCollectionView__handleDrag___block_invoke;
      v50[3] = &unk_1E58ABD10;
      v50[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v50, 0.3);
      objc_msgSend(v7, "beginReorderingItemAtIndexPath:", v6);
      objc_storeStrong((id *)&self->_dragTargetIndexPath, v6);
      objc_storeStrong((id *)&self->_dragSourceIndexPath, v6);
      v20 = (PXUIAutoScroller *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7BB40]), "initWithTargetScrollView:", self);
      autoScroller = self->_autoScroller;
      self->_autoScroller = v20;

      -[PUCollectionView _feedbackDragBehavior](self, "_feedbackDragBehavior");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "userInteractionStarted");

      -[PUCollectionView _feedbackDragBehavior](self, "_feedbackDragBehavior");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "draggedObjectLifted");

      break;
    case 2:
      if (v6)
      {
        objc_msgSend(v7, "reorderedIndexPath:", v6);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          -[PUCollectionView reorderDelegate](self, "reorderDelegate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_opt_respondsToSelector();

          if ((v26 & 1) == 0
            || (-[PUCollectionView reorderDelegate](self, "reorderDelegate"),
                v27 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v27, "collectionView:targetIndexPathForMoveFromIndexPath:toProposedIndexPath:", self, self->_dragSourceIndexPath, v24), v28 = objc_claimAutoreleasedReturnValue(), v24, v27, (v24 = (void *)v28) != 0))
          {
            v29 = objc_msgSend(v24, "isEqual:", self->_dragTargetIndexPath);
            objc_storeStrong((id *)&self->_dragTargetIndexPath, v24);
            objc_msgSend(v7, "updateReorderingTargetIndexPath:", self->_dragTargetIndexPath);
            if ((v29 & 1) == 0)
            {
              -[PUCollectionView _feedbackDragBehavior](self, "_feedbackDragBehavior");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "dropTargetUpdated");

            }
          }
        }
      }
      else
      {
        v24 = 0;
      }
      -[UIView setCenter:](self->_draggedView, "setCenter:", v10 - self->_draggedViewCenterOffset.x, v12 - self->_draggedViewCenterOffset.y);
      -[PXUIAutoScroller updateWithGestureRecognizer:](self->_autoScroller, "updateWithGestureRecognizer:", v4);
      v6 = v24;
      break;
    case 3:
      v31 = (void *)MEMORY[0x1E0DC3F10];
      v32 = MEMORY[0x1E0C809B0];
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __32__PUCollectionView__handleDrag___block_invoke_2;
      v46[3] = &unk_1E58AB790;
      v47 = v7;
      v48 = self;
      v49 = v8;
      v40 = v32;
      v41 = 3221225472;
      v42 = __32__PUCollectionView__handleDrag___block_invoke_3;
      v43 = &unk_1E58AAE08;
      v44 = self;
      v45 = v47;
      objc_msgSend(v31, "animateWithDuration:animations:completion:", v46, &v40, 0.3);
      -[PXUIAutoScroller stop](self->_autoScroller, "stop", v40, v41, v42, v43, v44);
      v33 = self->_autoScroller;
      self->_autoScroller = 0;

      -[PUCollectionView _feedbackDragBehavior](self, "_feedbackDragBehavior");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "userInteractionEnded");

      break;
    case 4:
      objc_msgSend(v7, "endReordering");
      -[PUCollectionView reloadData](self, "reloadData");
      -[UIView removeFromSuperview](self->_draggedView, "removeFromSuperview");
      v35 = self->_draggedView;
      self->_draggedView = 0;

      dragTargetIndexPath = self->_dragTargetIndexPath;
      self->_dragTargetIndexPath = 0;

      dragSourceIndexPath = self->_dragSourceIndexPath;
      self->_dragSourceIndexPath = 0;

      -[PXUIAutoScroller stop](self->_autoScroller, "stop");
      v38 = self->_autoScroller;
      self->_autoScroller = 0;

      -[PUCollectionView _feedbackDragBehavior](self, "_feedbackDragBehavior");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "userInteractionCancelled");

      break;
    default:
      break;
  }

}

- (id)_reorderableLayout
{
  void *v2;

  -[PUCollectionView collectionViewLayout](self, "collectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "conformsToProtocol:", &unk_1EEC9EA88) & 1) == 0)
  {

    v2 = 0;
  }
  return v2;
}

- (void)_updateDragUsingIndexPathUpdateBlock:(id)a3
{
  NSIndexPath **p_dragSourceIndexPath;
  void (**v5)(id, _QWORD);
  void *v6;
  NSIndexPath **p_dragTargetIndexPath;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  id v13;

  p_dragSourceIndexPath = &self->_dragSourceIndexPath;
  if (self->_dragSourceIndexPath)
  {
    v5 = (void (**)(id, _QWORD))a3;
    -[PUCollectionView _reorderableLayout](self, "_reorderableLayout");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, NSIndexPath *))v5)[2](v5, *p_dragSourceIndexPath);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    p_dragTargetIndexPath = &self->_dragTargetIndexPath;
    ((void (**)(id, NSIndexPath *))v5)[2](v5, self->_dragTargetIndexPath);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "item") == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[UILongPressGestureRecognizer pu_cancel](self->_dragGestureRecognizer, "pu_cancel");
    }
    else
    {
      if ((objc_msgSend(v6, "isEqual:", *p_dragSourceIndexPath) & 1) == 0)
      {
        objc_msgSend(v13, "endReordering");
        objc_storeStrong((id *)p_dragSourceIndexPath, v6);
        objc_msgSend(v13, "beginReorderingItemAtIndexPath:", *p_dragSourceIndexPath);
      }
      if (objc_msgSend(v6, "item") != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_storeStrong((id *)&self->_dragTargetIndexPath, v8);
        objc_msgSend(v13, "updateReorderingTargetIndexPath:", *p_dragTargetIndexPath);
      }
      -[PUCollectionView reorderDelegate](self, "reorderDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        -[PUCollectionView reorderDelegate](self, "reorderDelegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "collectionView:targetIndexPathForMoveFromIndexPath:toProposedIndexPath:", self, *p_dragSourceIndexPath, *p_dragTargetIndexPath);
        v12 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v12;
      }
      if (v8)
      {
        if ((objc_msgSend(v8, "isEqual:", *p_dragTargetIndexPath) & 1) == 0)
        {
          objc_storeStrong((id *)p_dragTargetIndexPath, v8);
          objc_msgSend(v13, "updateReorderingTargetIndexPath:", *p_dragTargetIndexPath);
        }
      }
    }

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UILongPressGestureRecognizer *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  objc_super v13;

  v4 = (UILongPressGestureRecognizer *)a3;
  if (self->_dragGestureRecognizer != v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)PUCollectionView;
    v5 = -[PUCollectionView gestureRecognizerShouldBegin:](&v13, sel_gestureRecognizerShouldBegin_, v4);
    goto LABEL_13;
  }
  -[PUCollectionView collectionViewLayout](self, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EEC9EA88) & 1) == 0)
  {

    goto LABEL_9;
  }
  -[PUCollectionView reorderDelegate](self, "reorderDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_9:
    v5 = 0;
    goto LABEL_13;
  }
  -[UILongPressGestureRecognizer locationInView:](v4, "locationInView:", self);
  -[PUCollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PUCollectionView reorderDelegate](self, "reorderDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[PUCollectionView reorderDelegate](self, "reorderDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v11, "collectionView:canReorderItemAtIndexPath:", self, v8);

    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }

LABEL_13:
  return v5;
}

- (void)visiblyInsertItemAtIndexPath:(id)a3 modelUpdate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __79__PUCollectionView_visiblyInsertItemAtIndexPath_modelUpdate_completionHandler___block_invoke;
  v18[3] = &unk_1E58ABAF0;
  v20 = v9;
  v18[4] = self;
  v19 = v8;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __79__PUCollectionView_visiblyInsertItemAtIndexPath_modelUpdate_completionHandler___block_invoke_2;
  v15[3] = &unk_1E58A6BF8;
  v15[4] = self;
  v16 = v19;
  v17 = v10;
  v12 = v10;
  v13 = v19;
  v14 = v9;
  -[PUCollectionView performBatchUpdates:completion:](self, "performBatchUpdates:completion:", v18, v15);

}

- (PUCollectionViewReorderDelegate)reorderDelegate
{
  return (PUCollectionViewReorderDelegate *)objc_loadWeakRetained((id *)&self->_reorderDelegate);
}

- (void)setReorderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_reorderDelegate, a3);
}

- (PUCollectionViewSelectionDelegate)selectionDelegate
{
  return (PUCollectionViewSelectionDelegate *)objc_loadWeakRetained((id *)&self->_selectionDelegate);
}

- (void)setSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_selectionDelegate, a3);
}

- (_UIDragSnappingFeedbackGenerator)_feedbackDragBehavior
{
  return self->__feedbackDragBehavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__feedbackDragBehavior, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_destroyWeak((id *)&self->_reorderDelegate);
  objc_storeStrong((id *)&self->_autoScroller, 0);
  objc_storeStrong((id *)&self->_draggedView, 0);
  objc_storeStrong((id *)&self->_dragTargetIndexPath, 0);
  objc_storeStrong((id *)&self->_dragSourceIndexPath, 0);
  objc_storeStrong((id *)&self->_dragGestureRecognizer, 0);
}

void __79__PUCollectionView_visiblyInsertItemAtIndexPath_modelUpdate_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = a1[6];
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = (void *)a1[4];
  v5[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertItemsAtIndexPaths:", v4);

}

void __79__PUCollectionView_visiblyInsertItemAtIndexPath_modelUpdate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "indexPathsForVisibleItems");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "scrollToItemAtIndexPath:atScrollPosition:animated:", *(_QWORD *)(a1 + 40), 0, 1);
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();

}

uint64_t __32__PUCollectionView__handleDrag___block_invoke(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 3304);
  CGAffineTransformMakeScale(&v3, 1.20000005, 1.20000005);
  return objc_msgSend(v1, "setTransform:", &v3);
}

void __32__PUCollectionView__handleDrag___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "layoutAttributesForItemAtIndexPath:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 3288));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "center");
  objc_msgSend(*(id *)(a1 + 48), "convertPoint:fromView:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 3304), "setCenter:");
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 3304);
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", v5);

}

void __32__PUCollectionView__handleDrag___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "reorderDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(v4 + 3288);
  v6 = *(_QWORD *)(v4 + 3296);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[2] = __32__PUCollectionView__handleDrag___block_invoke_4;
  v9[3] = &unk_1E58ABCA8;
  v9[1] = 3221225472;
  v7 = v3;
  v8 = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v11 = v8;
  objc_msgSend(v2, "collectionView:moveItemAtIndexPath:toIndexPath:completionHandler:", v4, v5, v6, v9);

}

void __32__PUCollectionView__handleDrag___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "endReordering");
  objc_msgSend(*(id *)(a1 + 40), "reloadData");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 3304), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 3304);
  *(_QWORD *)(v2 + 3304) = 0;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 3296);
  *(_QWORD *)(v4 + 3296) = 0;

  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(v6 + 3288);
  *(_QWORD *)(v6 + 3288) = 0;

  objc_msgSend(*(id *)(a1 + 40), "_feedbackDragBehavior");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "draggedObjectLanded");

}

uint64_t __46__PUCollectionView_didScrollToInitialPosition__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 3336) = 0;
  return result;
}

uint64_t __52__PUCollectionView_moveItemAtIndexPath_toIndexPath___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pu_alteredIndexPathAfterMovingItemAtIndexPath:toIndexPath:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __44__PUCollectionView_deleteItemsAtIndexPaths___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pu_alteredIndexPathAfterDeletingItemsAtIndexPaths:", *(_QWORD *)(a1 + 32));
}

uint64_t __44__PUCollectionView_insertItemsAtIndexPaths___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pu_alteredIndexPathAfterInsertingItemsAtIndexPaths:", *(_QWORD *)(a1 + 32));
}

+ (id)_reuseKeyForSupplementaryViewOfKind:(id)a3 withReuseIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t block;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;

  v5 = a3;
  v6 = a4;
  if (v5 == v6)
  {
    v12 = v5;
  }
  else
  {
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __76__PUCollectionView__reuseKeyForSupplementaryViewOfKind_withReuseIdentifier___block_invoke;
    v17 = &unk_1E58ABCA8;
    v7 = v5;
    v18 = v7;
    v8 = v6;
    v9 = v8;
    v19 = v8;
    if (_reuseKeyForSupplementaryViewOfKind_withReuseIdentifier__onceToken == -1)
    {
      v10 = v7;
      v11 = v8;
    }
    else
    {
      dispatch_once(&_reuseKeyForSupplementaryViewOfKind_withReuseIdentifier__onceToken, &block);
      v10 = v18;
      v11 = v19;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v7, v9, block, v15, v16, v17);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

void __76__PUCollectionView__reuseKeyForSupplementaryViewOfKind_withReuseIdentifier___block_invoke(uint64_t a1)
{
  NSLog(CFSTR("Weird element kind %@ associated with identifier %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
