@implementation PXLocalDragSession

- (PXLocalDragSession)init
{
  PXLocalDragSession *result;
  signed int v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXLocalDragSession;
  result = -[PXLocalDragSession init](&v4, sel_init);
  if (result)
  {
    do
      v3 = __ldaxr((unsigned int *)&init_lastIdentifier);
    while (__stlxr(v3 + 1, (unsigned int *)&init_lastIdentifier));
    result->_identifier = v3;
  }
  return result;
}

- (id)horizontalVelocity
{
  PXVelocityNumberFilter *horizontalVelocity;
  PXVelocityNumberFilter *v4;
  PXVelocityNumberFilter *v5;

  horizontalVelocity = self->_horizontalVelocity;
  if (!horizontalVelocity)
  {
    +[PXVelocityNumberFilter gestureVelocityFilter](PXVelocityNumberFilter, "gestureVelocityFilter");
    v4 = (PXVelocityNumberFilter *)objc_claimAutoreleasedReturnValue();
    v5 = self->_horizontalVelocity;
    self->_horizontalVelocity = v4;

    horizontalVelocity = self->_horizontalVelocity;
  }
  return horizontalVelocity;
}

- (id)verticalVelocity
{
  PXVelocityNumberFilter *verticalVelocity;
  PXVelocityNumberFilter *v4;
  PXVelocityNumberFilter *v5;

  verticalVelocity = self->_verticalVelocity;
  if (!verticalVelocity)
  {
    +[PXVelocityNumberFilter gestureVelocityFilter](PXVelocityNumberFilter, "gestureVelocityFilter");
    v4 = (PXVelocityNumberFilter *)objc_claimAutoreleasedReturnValue();
    v5 = self->_verticalVelocity;
    self->_verticalVelocity = v4;

    verticalVelocity = self->_verticalVelocity;
  }
  return verticalVelocity;
}

- (void)setScrollViewLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[7];
  _QWORD v12[7];

  y = a3.y;
  x = a3.x;
  self->_scrollViewLocation = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v7 = v6;
  -[PXLocalDragSession horizontalVelocity](self, "horizontalVelocity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__PXLocalDragSession_setScrollViewLocation___block_invoke;
  v12[3] = &__block_descriptor_56_e33_v16__0___PXMutableNumberFilter__8l;
  *(CGFloat *)&v12[4] = x;
  *(CGFloat *)&v12[5] = y;
  v12[6] = v7;
  objc_msgSend(v8, "performChanges:", v12);

  -[PXLocalDragSession verticalVelocity](self, "verticalVelocity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __44__PXLocalDragSession_setScrollViewLocation___block_invoke_2;
  v11[3] = &__block_descriptor_56_e33_v16__0___PXMutableNumberFilter__8l;
  *(CGFloat *)&v11[4] = x;
  *(CGFloat *)&v11[5] = y;
  v11[6] = v7;
  objc_msgSend(v10, "performChanges:", v11);

}

- (CGPoint)velocity
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[PXLocalDragSession horizontalVelocity](self, "horizontalVelocity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "output");
  v5 = v4;
  -[PXLocalDragSession verticalVelocity](self, "verticalVelocity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "output");
  v8 = v7;

  v9 = v5;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (void)updateWithDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXLocalDragSession dropTargetAssetReference](self, "dropTargetAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PXLocalDragSession dropTargetAssetReference](self, "dropTargetAssetReference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetReferenceForAssetReference:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PXLocalDragSession hitAssetReference](self, "hitAssetReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PXLocalDragSession hitAssetReference](self, "hitAssetReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetReferenceForAssetReference:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PXLocalDragSession draggedAssetReferences](self, "draggedAssetReferences");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v21 = v5;
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[PXLocalDragSession draggedAssetReferences](self, "draggedAssetReferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v4, "assetReferenceForAssetReference:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (v16)
            v18 = (void *)v16;
          else
            v18 = v15;
          v19 = v18;

          objc_msgSend(v9, "addObject:", v19);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

    v5 = v21;
  }
  -[PXLocalDragSession setHitAssetReference:](self, "setHitAssetReference:", v7);
  -[PXLocalDragSession setDropTargetAssetReference:](self, "setDropTargetAssetReference:", v5);
  v20 = (void *)objc_msgSend(v9, "copy");
  -[PXLocalDragSession setDraggedAssetReferences:](self, "setDraggedAssetReferences:", v20);

}

- (void)_noteChanged:(SEL)a3
{
  id v5;

  -[PXLocalDragSession delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localDragSession:didChangeProperty:", self, a3);

}

- (void)setDragSession:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dragSession);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dragSession, obj);
    -[PXLocalDragSession _noteChanged:](self, "_noteChanged:", sel_dragSession);
    v5 = obj;
  }

}

- (void)setDropSession:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dropSession);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dropSession, obj);
    -[PXLocalDragSession _noteChanged:](self, "_noteChanged:", sel_dropSession);
    v5 = obj;
  }

}

- (void)setIsDragSessionActive:(BOOL)a3
{
  if (self->_isDragSessionActive != a3)
  {
    self->_isDragSessionActive = a3;
    -[PXLocalDragSession _noteChanged:](self, "_noteChanged:", sel_isDragSessionActive);
  }
}

- (void)setIsDropActiveInsideView:(BOOL)a3
{
  if (self->_isDropActiveInsideView != a3)
  {
    self->_isDropActiveInsideView = a3;
    -[PXLocalDragSession _noteChanged:](self, "_noteChanged:", sel_isDropActiveInsideView);
  }
}

- (void)setDraggedAssetReferences:(id)a3
{
  NSSet *v5;
  NSSet *v6;
  char v7;
  NSSet *v8;

  v8 = (NSSet *)a3;
  v5 = self->_draggedAssetReferences;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSSet isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_draggedAssetReferences, a3);
      -[PXLocalDragSession _noteChanged:](self, "_noteChanged:", sel_draggedAssetReferences);
    }
  }

}

- (void)setDropTargetAssetReference:(id)a3
{
  PXAssetReference *v5;
  PXAssetReference *v6;
  char v7;
  PXAssetReference *v8;

  v8 = (PXAssetReference *)a3;
  v5 = self->_dropTargetAssetReference;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXAssetReference isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_dropTargetAssetReference, a3);
      -[PXLocalDragSession _noteChanged:](self, "_noteChanged:", sel_dropTargetAssetReference);
    }
  }

}

- (void)setHitAssetReference:(id)a3
{
  PXAssetReference *v5;
  PXAssetReference *v6;
  char v7;
  PXAssetReference *v8;

  v8 = (PXAssetReference *)a3;
  v5 = self->_hitAssetReference;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXAssetReference isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_hitAssetReference, a3);
      -[PXLocalDragSession _noteChanged:](self, "_noteChanged:", sel_hitAssetReference);
    }
  }

}

- (void)setDropOperation:(unint64_t)a3
{
  if (self->_dropOperation != a3)
  {
    self->_dropOperation = a3;
    -[PXLocalDragSession _noteChanged:](self, "_noteChanged:", sel_dropOperation);
  }
}

- (void)setDropActionPerformer:(id)a3
{
  PXAssetCollectionActionPerformer *v5;
  PXAssetCollectionActionPerformer *v6;

  v5 = (PXAssetCollectionActionPerformer *)a3;
  if (self->_dropActionPerformer != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_dropActionPerformer, a3);
    -[PXLocalDragSession _noteChanged:](self, "_noteChanged:", sel_dropActionPerformer);
    v5 = v6;
  }

}

- (int64_t)identifier
{
  return self->_identifier;
}

- (CGPoint)scrollViewLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_scrollViewLocation.x;
  y = self->_scrollViewLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (PXLocalDragSessionDelegate)delegate
{
  return (PXLocalDragSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIDragSession)dragSession
{
  return (UIDragSession *)objc_loadWeakRetained((id *)&self->_dragSession);
}

- (BOOL)isDragSessionActive
{
  return self->_isDragSessionActive;
}

- (NSSet)draggedAssetReferences
{
  return self->_draggedAssetReferences;
}

- (UIDropSession)dropSession
{
  return (UIDropSession *)objc_loadWeakRetained((id *)&self->_dropSession);
}

- (BOOL)isDropActiveInsideView
{
  return self->_isDropActiveInsideView;
}

- (PXAssetReference)dropTargetAssetReference
{
  return self->_dropTargetAssetReference;
}

- (PXAssetReference)hitAssetReference
{
  return self->_hitAssetReference;
}

- (PXAssetCollectionActionPerformer)dropActionPerformer
{
  return self->_dropActionPerformer;
}

- (unint64_t)dropOperation
{
  return self->_dropOperation;
}

- (NSSet)excludedAssets
{
  return self->_excludedAssets;
}

- (void)setExcludedAssets:(id)a3
{
  objc_storeStrong((id *)&self->_excludedAssets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedAssets, 0);
  objc_storeStrong((id *)&self->_dropActionPerformer, 0);
  objc_storeStrong((id *)&self->_hitAssetReference, 0);
  objc_storeStrong((id *)&self->_dropTargetAssetReference, 0);
  objc_destroyWeak((id *)&self->_dropSession);
  objc_storeStrong((id *)&self->_draggedAssetReferences, 0);
  objc_destroyWeak((id *)&self->_dragSession);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_verticalVelocity, 0);
  objc_storeStrong((id *)&self->_horizontalVelocity, 0);
}

void __44__PXLocalDragSession_setScrollViewLocation___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setInput:", v3);
  objc_msgSend(v4, "setTime:", *(double *)(a1 + 48));

}

void __44__PXLocalDragSession_setScrollViewLocation___block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setInput:", v3);
  objc_msgSend(v4, "setTime:", *(double *)(a1 + 48));

}

@end
