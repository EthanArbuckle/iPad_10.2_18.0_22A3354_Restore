@implementation PXPeopleDragAndDropCollectionView

- (void)layoutSubviews
{
  void *v3;
  char v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPeopleDragAndDropCollectionView;
  -[PXPeopleDragAndDropCollectionView layoutSubviews](&v6, sel_layoutSubviews);
  -[PXPeopleDragAndDropCollectionView dragDropDelegate](self, "dragDropDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PXPeopleDragAndDropCollectionView dragDropDelegate](self, "dragDropDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionViewDidLayout:", self);

  }
}

- (void)resetTransformForSourceIndex:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  -[PXPeopleDragAndDropCollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PXPeopleDragAndDropCollectionView_resetTransformForSourceIndex___block_invoke;
  v6[3] = &unk_1E5149198;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "animateWithDuration:animations:", v6, 0.2);

}

- (id)sortedIndexPathsForSelectedItems
{
  void *v2;
  void *v3;

  -[PXPeopleDragAndDropCollectionView indexPathsForSelectedItems](self, "indexPathsForSelectedItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_26786);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)reloadData
{
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  if (-[PXPeopleDragAndDropCollectionView interactiveMode](self, "interactiveMode"))
  {
    objc_initWeak(&location, self);
    v3 = dispatch_time(0, 500000000);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __47__PXPeopleDragAndDropCollectionView_reloadData__block_invoke;
    v4[3] = &unk_1E5148D30;
    objc_copyWeak(&v5, &location);
    dispatch_after(v3, MEMORY[0x1E0C80D38], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXPeopleDragAndDropCollectionView;
    -[PXPeopleDragAndDropCollectionView reloadData](&v7, sel_reloadData);
  }
}

- (BOOL)beginInteractiveMovementAtLocation:(CGPoint)a3 forItemAtIndexPath:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  unsigned int v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  CGFloat v17;
  CGFloat v18;
  objc_super v19;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PXPeopleDragAndDropCollectionView setInteractiveMode:](self, "setInteractiveMode:", 1);
  -[PXPeopleDragAndDropCollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDragAndDropCollectionView _highestVisibleCellZOrder](self, "_highestVisibleCellZOrder");
  v10 = v9 + 1.0;
  objc_msgSend(v8, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setZPosition:", v10);

  -[PXPeopleDragAndDropCollectionView setDragSourceIndexPath:](self, "setDragSourceIndexPath:", v7);
  -[PXPeopleDragAndDropCollectionView setDragSourceCell:](self, "setDragSourceCell:", v8);
  v19.receiver = self;
  v19.super_class = (Class)PXPeopleDragAndDropCollectionView;
  v12 = -[PXPeopleDragAndDropCollectionView beginInteractiveMovementForItemAtIndexPath:](&v19, sel_beginInteractiveMovementForItemAtIndexPath_, v7);

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0DC3F10];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __91__PXPeopleDragAndDropCollectionView_beginInteractiveMovementAtLocation_forItemAtIndexPath___block_invoke;
    v15[3] = &unk_1E5149060;
    v16 = v8;
    v17 = x;
    v18 = y;
    objc_msgSend(v13, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v15, 0, 0.5, 0.0, 0.4, 0.2);

  }
  return v12;
}

- (void)endInteractiveMovement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  dispatch_time_t v12;
  _QWORD block[5];
  id v14;
  id location;
  objc_super v16;

  -[PXPeopleDragAndDropCollectionView collectionViewLayout](self, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v3, "performMergeIfPossible") & 1) == 0)
  {
    -[PXPeopleDragAndDropCollectionView dragSourceCell](self, "dragSourceCell");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleDragAndDropCollectionView indexPathForCell:](self, "indexPathForCell:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPeopleDragAndDropCollectionView resetTransformForSourceIndex:](self, "resetTransformForSourceIndex:", v5);
    -[PXPeopleDragAndDropCollectionView dragDropDelegate](self, "dragDropDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "collectionViewDidEndDrag:", self);
    -[PXPeopleDragAndDropCollectionView dragSourceIndexPath](self, "dragSourceIndexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleDragAndDropCollectionView dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "collectionView:numberOfItemsInSection:", self, 0) == 1)
    {
      v9 = objc_msgSend(v7, "section");

      if (v9)
        goto LABEL_9;
      -[PXPeopleDragAndDropCollectionView collectionViewLayout](self, "collectionViewLayout");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "invalidateLayout");
    }

LABEL_9:
    v16.receiver = self;
    v16.super_class = (Class)PXPeopleDragAndDropCollectionView;
    -[PXPeopleDragAndDropCollectionView endInteractiveMovement](&v16, sel_endInteractiveMovement);
    -[PXPeopleDragAndDropCollectionView dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "collectionView:numberOfItemsInSection:", self, 0))
    {
      v11 = objc_msgSend(v7, "section");

      if (v11)
        goto LABEL_12;
      -[PXPeopleDragAndDropCollectionView collectionViewLayout](self, "collectionViewLayout");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "invalidateLayout");
    }

LABEL_12:
    -[PXPeopleDragAndDropCollectionView setDragSourceIndexPath:](self, "setDragSourceIndexPath:", 0);
    objc_initWeak(&location, self);
    v12 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__PXPeopleDragAndDropCollectionView_endInteractiveMovement__block_invoke;
    block[3] = &unk_1E5147280;
    block[4] = self;
    objc_copyWeak(&v14, &location);
    dispatch_after(v12, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
}

- (void)cancelInteractiveMovement
{
  void *v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD block[5];
  id v8;
  id location;
  objc_super v10;

  -[PXPeopleDragAndDropCollectionView dragSourceCell](self, "dragSourceCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDragAndDropCollectionView indexPathForCell:](self, "indexPathForCell:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleDragAndDropCollectionView resetTransformForSourceIndex:](self, "resetTransformForSourceIndex:", v4);
  -[PXPeopleDragAndDropCollectionView dragDropDelegate](self, "dragDropDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "collectionViewDidCancelDrag:", self);
  -[PXPeopleDragAndDropCollectionView setDragSourceIndexPath:](self, "setDragSourceIndexPath:", 0);
  v10.receiver = self;
  v10.super_class = (Class)PXPeopleDragAndDropCollectionView;
  -[PXPeopleDragAndDropCollectionView cancelInteractiveMovement](&v10, sel_cancelInteractiveMovement);
  objc_initWeak(&location, self);
  v6 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PXPeopleDragAndDropCollectionView_cancelInteractiveMovement__block_invoke;
  block[3] = &unk_1E5147280;
  block[4] = self;
  objc_copyWeak(&v8, &location);
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (double)_highestVisibleCellZOrder
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PXPeopleDragAndDropCollectionView visibleCells](self, "visibleCells", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "layer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "zPosition");
        v10 = v9;

        if (v6 < v10)
          v6 = v10;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (id)_footerAttributes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = *MEMORY[0x1E0DC48A0];
  while (1)
  {
    -[PXPeopleDragAndDropCollectionView collectionViewLayout](self, "collectionViewLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      break;
    objc_msgSend(v3, "addObject:", v8);
    ++v4;

  }
  return v3;
}

- (int64_t)sectionAtPoint:(CGPoint)a3
{
  double y;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  int64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  y = a3.y;
  v19 = *MEMORY[0x1E0C80C00];
  -[PXPeopleDragAndDropCollectionView _footerAttributes](self, "_footerAttributes", a3.x);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "center", (_QWORD)v14);
        if (y < v10)
        {
          objc_msgSend(v9, "indexPath");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v12, "section");

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v11;
}

- (PXPeopleDragAndDropCollectionViewDelegate)dragDropDelegate
{
  return (PXPeopleDragAndDropCollectionViewDelegate *)objc_loadWeakRetained((id *)&self->_dragDropDelegate);
}

- (void)setDragDropDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dragDropDelegate, a3);
}

- (BOOL)interactiveMode
{
  return self->_interactiveMode;
}

- (void)setInteractiveMode:(BOOL)a3
{
  self->_interactiveMode = a3;
}

- (PXPeopleCollectionViewCell)dragSourceCell
{
  return self->_dragSourceCell;
}

- (void)setDragSourceCell:(id)a3
{
  objc_storeStrong((id *)&self->_dragSourceCell, a3);
}

- (NSIndexPath)dragSourceIndexPath
{
  return self->_dragSourceIndexPath;
}

- (void)setDragSourceIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_dragSourceIndexPath, a3);
}

- (BOOL)validDrop
{
  return self->_validDrop;
}

- (void)setValidDrop:(BOOL)a3
{
  self->_validDrop = a3;
}

- (UIVisualEffect)blurEffect
{
  return self->_blurEffect;
}

- (void)setBlurEffect:(id)a3
{
  objc_storeStrong((id *)&self->_blurEffect, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_storeStrong((id *)&self->_dragSourceIndexPath, 0);
  objc_storeStrong((id *)&self->_dragSourceCell, 0);
  objc_destroyWeak((id *)&self->_dragDropDelegate);
}

void __62__PXPeopleDragAndDropCollectionView_cancelInteractiveMovement__block_invoke(id *a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;

  v1 = a1;
  objc_msgSend(a1[4], "setDragSourceCell:", 0);
  v1 += 5;
  WeakRetained = objc_loadWeakRetained(v1);
  objc_msgSend(WeakRetained, "setInteractiveMode:", 0);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "dragDropDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "collectionViewDidEndInteractiveMode:", v4);

}

void __59__PXPeopleDragAndDropCollectionView_endInteractiveMovement__block_invoke(id *a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;

  v1 = a1;
  objc_msgSend(a1[4], "setDragSourceCell:", 0);
  v1 += 5;
  WeakRetained = objc_loadWeakRetained(v1);
  objc_msgSend(WeakRetained, "setInteractiveMode:", 0);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "dragDropDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "collectionViewDidEndInteractiveMode:", v4);

}

void __91__PXPeopleDragAndDropCollectionView_beginInteractiveMovementAtLocation_forItemAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  CGAffineTransform v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __91__PXPeopleDragAndDropCollectionView_beginInteractiveMovementAtLocation_forItemAtIndexPath___block_invoke_2;
  v5[3] = &unk_1E5149198;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "animateWithDuration:animations:", v5, 0.1);
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.8);
  v3 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 1.15, 1.15);
  objc_msgSend(v3, "setTransform:", &v4);

}

uint64_t __91__PXPeopleDragAndDropCollectionView_beginInteractiveMovementAtLocation_forItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTextAlpha:", 0.0);
}

void __47__PXPeopleDragAndDropCollectionView_reloadData__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadData");

}

uint64_t __69__PXPeopleDragAndDropCollectionView_sortedIndexPathsForSelectedItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __66__PXPeopleDragAndDropCollectionView_resetTransformForSourceIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  _OWORD v5[3];
  _QWORD v6[4];
  id v7;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PXPeopleDragAndDropCollectionView_resetTransformForSourceIndex___block_invoke_2;
  v6[3] = &unk_1E5149198;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v2, "animateWithDuration:animations:", v6, 0.1);
  v3 = *(void **)(a1 + 32);
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);

}

uint64_t __66__PXPeopleDragAndDropCollectionView_resetTransformForSourceIndex___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTextAlpha:", 1.0);
}

@end
