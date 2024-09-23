@implementation PXPeopleSwipeSelectionManager

- (PXPeopleSwipeSelectionManager)initWithScrollView:(id)a3
{
  id v5;
  PXPeopleSwipeSelectionManager *v6;
  PXPeopleSwipeSelectionManager *v7;
  UIGestureRecognizer *v8;
  UIGestureRecognizer *swipeGestureRecognizer;
  UIGestureRecognizer *v10;
  PXUIAutoScroller *v11;
  PXUIAutoScroller *autoScroller;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXPeopleSwipeSelectionManager;
  v6 = -[PXPeopleSwipeSelectionManager init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scrollView, a3);
    v8 = (UIGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v7, sel__handleSwipeSelectionGesture_);
    -[UIGestureRecognizer setMaximumNumberOfTouches:](v8, "setMaximumNumberOfTouches:", 1);
    swipeGestureRecognizer = v7->_swipeGestureRecognizer;
    v7->_swipeGestureRecognizer = v8;
    v10 = v8;

    v11 = -[PXAutoScroller initWithTargetScrollView:]([PXUIAutoScroller alloc], "initWithTargetScrollView:", v5);
    autoScroller = v7->_autoScroller;
    v7->_autoScroller = v11;

    -[PXAutoScroller setDelegate:](v7->_autoScroller, "setDelegate:", v7);
  }

  return v7;
}

- (PXPeopleSwipeSelectionManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleSwipeSelectionManager.m"), 59, CFSTR("Not supported"));

  abort();
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[PXPeopleSwipeSelectionManager swipeGestureRecognizer](self, "swipeGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeGestureRecognizer:", v3);

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleSwipeSelectionManager;
  -[PXPeopleSwipeSelectionManager dealloc](&v5, sel_dealloc);
}

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
  }

}

- (BOOL)isSelecting
{
  return -[PXPeopleSwipeSelectionManager state](self, "state") != 0;
}

- (void)setCurrentIndexPath:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_currentIndexPath) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentIndexPath, a3);
    -[PXPeopleSwipeSelectionManager _invalidateSelectedIndexPaths](self, "_invalidateSelectedIndexPaths");
    -[PXPeopleSwipeSelectionManager _updateSelectedIndexPaths](self, "_updateSelectedIndexPaths");
  }

}

- (id)_itemIndexPathAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;

  if (self->_delegateFlags.respondsToItemIndexPathAtLocation)
  {
    y = a3.y;
    x = a3.x;
    -[PXPeopleSwipeSelectionManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "swipeSelectionManager:itemIndexPathAtLocation:", self, x, y);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_itemIndexPathClosestLeadingLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;

  if (self->_delegateFlags.respondsToItemIndexPathClosestLeadingLocation)
  {
    y = a3.y;
    x = a3.x;
    -[PXPeopleSwipeSelectionManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "swipeSelectionManager:itemIndexPathClosestLeadingLocation:", self, x, y);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_itemIndexPathClosestAboveLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;

  if (self->_delegateFlags.respondsToItemIndexPathClosestAboveLocation)
  {
    y = a3.y;
    x = a3.x;
    -[PXPeopleSwipeSelectionManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "swipeSelectionManager:itemIndexPathClosestAboveLocation:", self, x, y);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_handleSwipeSelectionGesture:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = objc_msgSend(v16, "state");
  if ((unint64_t)(v4 - 3) >= 3)
  {
    v5 = v4;
    if (v4)
    {
      -[PXPeopleSwipeSelectionManager scrollView](self, "scrollView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "locationInView:", v6);
      v8 = v7;
      v10 = v9;

      -[PXPeopleSwipeSelectionManager _itemIndexPathAtLocation:](self, "_itemIndexPathAtLocation:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleSwipeSelectionManager _itemIndexPathClosestLeadingLocation:](self, "_itemIndexPathClosestLeadingLocation:", v8, v10);
      v12 = objc_claimAutoreleasedReturnValue();
      -[PXPeopleSwipeSelectionManager _itemIndexPathClosestAboveLocation:](self, "_itemIndexPathClosestAboveLocation:", v8, v10);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v11 || v5 != 1 && v12 | v13 && -[PXPeopleSwipeSelectionManager isSelecting](self, "isSelecting"))
      {
        if (v5 == 1 || !-[PXPeopleSwipeSelectionManager isSelecting](self, "isSelecting"))
          -[PXPeopleSwipeSelectionManager _beginSelectionFromIndexPath:](self, "_beginSelectionFromIndexPath:", v11);
        -[PXPeopleSwipeSelectionManager _updateSelectionWithHitIndexPath:leadingClosestIndexPath:aboveClosestIndexPath:](self, "_updateSelectionWithHitIndexPath:leadingClosestIndexPath:aboveClosestIndexPath:", v11, v12, v14);
        if (v5 == 2)
        {
          -[PXPeopleSwipeSelectionManager autoScroller](self, "autoScroller");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "updateWithGestureRecognizer:", v16);

        }
      }

    }
  }
  else if (-[PXPeopleSwipeSelectionManager isSelecting](self, "isSelecting"))
  {
    -[PXPeopleSwipeSelectionManager _endSelection](self, "_endSelection");
  }

}

- (void)_beginSelectionFromIndexPath:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CD16F8];
  v5 = a3;
  objc_msgSend(v4, "px_deprecated_appPhotoLibrary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "px_beginPausingChangesWithTimeout:identifier:", CFSTR("PXPeopleSwipeSelectionManager"), 60.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleSwipeSelectionManager setPausingChangesToken:](self, "setPausingChangesToken:", v6);
  -[PXPeopleSwipeSelectionManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "initialSelectedIndexPathsForSwipeSelectionManager:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleSwipeSelectionManager setSelectedIndexPathsBeforeSwipe:](self, "setSelectedIndexPathsBeforeSwipe:", v8);
  -[PXPeopleSwipeSelectionManager setStartingIndexPath:](self, "setStartingIndexPath:", v5);
  LODWORD(v7) = objc_msgSend(v8, "containsObject:", v5);

  if ((_DWORD)v7)
    v9 = 2;
  else
    v9 = 1;
  -[PXPeopleSwipeSelectionManager setState:](self, "setState:", v9);

}

- (void)_updateSelectionWithHitIndexPath:(id)a3 leadingClosestIndexPath:(id)a4 aboveClosestIndexPath:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = a5;
  -[PXPeopleSwipeSelectionManager startingIndexPath](self, "startingIndexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleSwipeSelectionManager.m"), 201, CFSTR("Starting indexPath should be set"));

  }
  if (-[PXPeopleSwipeSelectionManager isSelecting](self, "isSelecting"))
  {
    -[PXPeopleSwipeSelectionManager currentIndexPath](self, "currentIndexPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  if (v9 || v10 || v16)
  {
    if (v9)
      v13 = v9;
    else
      v13 = v10;
    if (v16)
      v13 = v16;
    v14 = v13;

    v12 = v14;
  }
  -[PXPeopleSwipeSelectionManager setCurrentIndexPath:](self, "setCurrentIndexPath:", v12);

}

- (void)_endSelection
{
  void *v3;
  void *v4;
  id v5;

  -[PXPeopleSwipeSelectionManager setState:](self, "setState:", 0);
  -[PXPeopleSwipeSelectionManager setSelectedIndexPathsBeforeSwipe:](self, "setSelectedIndexPathsBeforeSwipe:", 0);
  -[PXPeopleSwipeSelectionManager setStartingIndexPath:](self, "setStartingIndexPath:", 0);
  -[PXPeopleSwipeSelectionManager autoScroller](self, "autoScroller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  -[PXPeopleSwipeSelectionManager pausingChangesToken](self, "pausingChangesToken");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_endPausingChanges:", v5);
    -[PXPeopleSwipeSelectionManager setPausingChangesToken:](self, "setPausingChangesToken:", 0);

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
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_needsUpdateFlags.selectedIndexPaths)
  {
    self->_needsUpdateFlags.selectedIndexPaths = 0;
    -[PXPeopleSwipeSelectionManager selectedIndexPathsBeforeSwipe](self, "selectedIndexPathsBeforeSwipe");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v11 = v3;
      -[PXPeopleSwipeSelectionManager startingIndexPath](self, "startingIndexPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleSwipeSelectionManager currentIndexPath](self, "currentIndexPath");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      if (v4 && v5)
      {
        -[PXPeopleSwipeSelectionManager delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "swipeSelectionManager:indexPathSetFromIndexPath:toIndexPath:", self, v4, v6);
        v8 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = objc_alloc_init(MEMORY[0x1E0C99E60]);
      }
      v9 = (void *)objc_msgSend(v11, "mutableCopy");
      if (-[PXPeopleSwipeSelectionManager state](self, "state") == 1)
        objc_msgSend(v9, "unionSet:", v8);
      else
        objc_msgSend(v9, "minusSet:", v8);
      -[PXPeopleSwipeSelectionManager delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "swipeSelectionManager:didSelectIndexPaths:", self, v9);

      v3 = v11;
    }

  }
}

- (void)autoScroller:(id)a3 didAutoscrollWithTimestamp:(double)a4
{
  id v5;

  if (-[PXPeopleSwipeSelectionManager isSelecting](self, "isSelecting", a3, a4))
  {
    -[PXPeopleSwipeSelectionManager swipeGestureRecognizer](self, "swipeGestureRecognizer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PXPeopleSwipeSelectionManager _handleSwipeSelectionGesture:](self, "_handleSwipeSelectionGesture:", v5);

  }
}

- (PXPeopleSwipeSelectionManagerDelegate)delegate
{
  return (PXPeopleSwipeSelectionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (UIGestureRecognizer)swipeGestureRecognizer
{
  return self->_swipeGestureRecognizer;
}

- (NSIndexPath)startingIndexPath
{
  return self->_startingIndexPath;
}

- (void)setStartingIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_startingIndexPath, a3);
}

- (NSIndexPath)currentIndexPath
{
  return self->_currentIndexPath;
}

- (NSSet)selectedIndexPathsBeforeSwipe
{
  return self->_selectedIndexPathsBeforeSwipe;
}

- (void)setSelectedIndexPathsBeforeSwipe:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)pausingChangesToken
{
  return self->_pausingChangesToken;
}

- (void)setPausingChangesToken:(id)a3
{
  objc_storeStrong(&self->_pausingChangesToken, a3);
}

- (PXUIAutoScroller)autoScroller
{
  return self->_autoScroller;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoScroller, 0);
  objc_storeStrong(&self->_pausingChangesToken, 0);
  objc_storeStrong((id *)&self->_selectedIndexPathsBeforeSwipe, 0);
  objc_storeStrong((id *)&self->_currentIndexPath, 0);
  objc_storeStrong((id *)&self->_startingIndexPath, 0);
  objc_storeStrong((id *)&self->_swipeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
