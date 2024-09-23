@implementation _UICollectionViewDragSourceController

- (BOOL)isActive
{
  _QWORD *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  -[_UICollectionViewDragSourceController sessionState](a1);
  v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = v1[1] != 0;
  else
    v2 = 0;

  return v2;
}

- (_QWORD)sessionState
{
  _QWORD *v1;
  void *v2;
  _UICollectionViewDragSourceControllerSessionState *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[4];
    if (!v2)
    {
      v3 = objc_alloc_init(_UICollectionViewDragSourceControllerSessionState);
      v4 = (void *)v1[4];
      v1[4] = v3;

      v2 = (void *)v1[4];
    }
    a1 = v2;
  }
  return a1;
}

- (_UICollectionViewDragSourceController)initWithCollectionView:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  _UICollectionViewDragSourceController *v8;
  _UICollectionViewDragSourceController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UICollectionViewDragSourceController;
  v8 = -[_UICollectionViewDragSourceController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_collectionView, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    -[_UICollectionViewDragSourceController _configureInteraction](v9, "_configureInteraction");
  }

  return v9;
}

- (void)_configureInteraction
{
  id WeakRetained;
  UIDragInteraction *obj;

  obj = -[UIDragInteraction initWithDelegate:]([UIDragInteraction alloc], "initWithDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  objc_msgSend(WeakRetained, "addInteraction:", obj);

  if (self)
    objc_storeWeak((id *)&self->_dragInteraction, obj);

}

- (void)setDragInteractionEnabled:(uint64_t)a1
{
  id WeakRetained;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    objc_msgSend(WeakRetained, "setEnabled:", a2);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[_UICollectionViewDragSourceController deactivate]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)_UICollectionViewDragSourceController;
  -[_UICollectionViewDragSourceController dealloc](&v3, sel_dealloc);
}

- (void)deactivate
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;

  if (a1)
  {
    v2 = (id *)(a1 + 16);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));

    if (WeakRetained)
    {
      v4 = objc_loadWeakRetained((id *)(a1 + 8));
      v5 = objc_loadWeakRetained(v2);
      objc_msgSend(v4, "removeInteraction:", v5);

      objc_storeWeak(v2, 0);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragState, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dragInteraction);
  objc_destroyWeak((id *)&self->_collectionView);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    WeakRetained = 0;
  -[_UICollectionViewDragSourceController sessionState](self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewDragSourceController dragState](self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; cv = %p; sessionState = %@; dragState = %@>"),
    v5,
    self,
    WeakRetained,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (_QWORD)dragState
{
  _QWORD *v1;
  void *v2;
  _UICollectionViewDragSourceControllerDragState *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[5];
    if (!v2)
    {
      v3 = objc_alloc_init(_UICollectionViewDragSourceControllerDragState);
      v4 = (void *)v1[5];
      v1[5] = v3;

      v2 = (void *)v1[5];
    }
    a1 = v2;
  }
  return a1;
}

- (id)dragSession
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    -[_UICollectionViewDragSourceController sessionState](a1);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)v1;
    if (v1)
      v3 = *(void **)(v1 + 8);
    else
      v3 = 0;
    v4 = v3;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (uint64_t)currentSessionItemCount
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  void *v6;

  if (!a1)
    return 0;
  -[_UICollectionViewDragSourceController sessionState](a1);
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v5 = 0;
    v3 = 0;
LABEL_7:

    return v3;
  }
  v3 = v2[1];

  if (v3)
  {
    -[_UICollectionViewDragSourceController sessionState](a1);
    v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v4 = (_QWORD *)v4[1];
    objc_msgSend(v4, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "count");

    goto LABEL_7;
  }
  return v3;
}

- (id)dragFromIndexPaths
{
  void *v1;
  void *v2;

  if (a1)
  {
    -[_UICollectionViewDragSourceController dragState](a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewDragSourceControllerDragState draggingDataSourceIndexPaths](v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)dragFromIndexPath
{
  void *v1;
  void *v2;

  if (a1)
  {
    -[_UICollectionViewDragSourceController dragState](a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewDragSourceControllerDragState dragFromDataSourceIndexPath](v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)dragItemsCreatedForReordering
{
  _BYTE *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  -[_UICollectionViewDragSourceController dragState](a1);
  v1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = v1[8] != 0;
  else
    v2 = 0;

  return v2;
}

- (id)indexPathForDragItem:(id *)a1
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    -[_UICollectionViewDragSourceController dragState](v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained(v2 + 1);
    -[_UICollectionViewDragSourceControllerDragState dataSourceIndexPathForDragItem:forCollectionView:](v4, v3, WeakRetained);
    v2 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void)attemptToBeginDragImmediatelyWithTouch:(uint64_t)a1
{
  id *v2;
  id v3;
  id WeakRetained;

  if (a1)
  {
    v2 = (id *)(a1 + 16);
    v3 = a2;
    WeakRetained = objc_loadWeakRetained(v2);
    objc_msgSend(WeakRetained, "_immediatelyBeginDragWithTouch:completion:", v3, 0);

  }
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  _BYTE *v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  id v24;
  UIDragItem *v25;
  void *v26;
  _BYTE *v27;
  id **v28;
  void *v29;
  void *v30;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  UIDragItem *v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v6 = a4;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    WeakRetained = 0;
  v35 = WeakRetained;
  if (objc_msgSend(WeakRetained, "_canBeginReorderingItem", v32))
  {
    -[_UICollectionViewDragSourceController setSessionState:]((uint64_t)self);
    -[_UICollectionViewDragSourceController setDragState:]((uint64_t)self);
    objc_msgSend(v6, "locationInView:", WeakRetained);
    objc_msgSend(WeakRetained, "indexPathForItemAtPoint:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)MEMORY[0x1E0C9AA60];
    if (v34)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v50 = 0;
      v51 = &v50;
      v52 = 0x3032000000;
      v53 = __Block_byref_object_copy__44;
      v54 = __Block_byref_object_dispose__44;
      v55 = v8;
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __82___UICollectionViewDragSourceController_dragInteraction_itemsForBeginningSession___block_invoke;
      v47[3] = &unk_1E16BACE0;
      v49 = &v50;
      v48 = WeakRetained;
      v37 = v48;
      objc_msgSend(v48, "performUsingPresentationValues:", v47);
      if (objc_msgSend((id)v51[5], "containsObject:", v34)
        && (v10 = objc_loadWeakRetained((id *)&self->_delegate)) != 0
        && (v11 = v10[41] == 0, v10, !v11))
      {
        -[_UICollectionViewDragSourceController _filterCandidateIndexPaths:forUserSelectedIndexPath:session:](self, "_filterCandidateIndexPaths:forUserSelectedIndexPath:session:", v51[5], v34, v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v12);

      }
      else
      {
        objc_msgSend(v9, "addObject:", v34);
      }
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      obj = v9;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v44;
        v15 = *MEMORY[0x1E0C9D538];
        v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v44 != v14)
              objc_enumerationMutation(obj);
            v18 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
            -[_UICollectionViewDragSourceController _queryForItemsFromClientForSession:dataSourceIndexPath:location:isInitialQuery:](self, "_queryForItemsFromClientForSession:dataSourceIndexPath:location:isInitialQuery:", v6, v18, 1, v15, v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UICollectionViewDragSourceController _addDragItemsToExistingSession:forDataSourceIndexPath:](self, "_addDragItemsToExistingSession:forDataSourceIndexPath:", v19, v18);
            objc_msgSend(v8, "addObjectsFromArray:", v19);

          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
        }
        while (v13);
      }

      if (!objc_msgSend(v8, "count"))
      {
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v36 = obj;
        v20 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v39, v57, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v40;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v40 != v21)
                objc_enumerationMutation(v36);
              v23 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
              if (objc_msgSend(v37, "_canReorderItemAtIndexPath:", v23))
              {
                v24 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
                v25 = -[UIDragItem initWithItemProvider:]([UIDragItem alloc], "initWithItemProvider:", v24);
                v56 = v25;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                -[_UICollectionViewDragSourceController _addDragItemsToExistingSession:forDataSourceIndexPath:](self, "_addDragItemsToExistingSession:forDataSourceIndexPath:", v26, v23);

                objc_msgSend(v8, "addObject:", v25);
              }
            }
            v20 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v39, v57, 16);
          }
          while (v20);
        }

        if (objc_msgSend(v8, "count"))
        {
          -[_UICollectionViewDragSourceController dragState](self);
          v27 = (_BYTE *)objc_claimAutoreleasedReturnValue();
          if (v27)
            v27[8] = 1;

        }
      }
      if (self)
        v28 = (id **)objc_loadWeakRetained((id *)&self->_delegate);
      else
        v28 = 0;
      -[_UICollectionViewDragSourceController dragState](self);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICollectionViewDragSourceControllerDragState draggingDataSourceIndexPaths](v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICollectionViewDragAndDropController dragSourceController:didUpdateItemsAtIndexPaths:](v28, (uint64_t)self, v30);

      _Block_object_dispose(&v50, 8);
    }

  }
  else
  {
    v8 = (id)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (void)setSessionState:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), 0);
}

- (void)setDragState:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), 0);
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  UITargetedDragPreview *v14;
  uint64_t v15;
  void *v16;

  v6 = a4;
  -[_UICollectionViewDragSourceController dragState](self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    WeakRetained = 0;
  -[_UICollectionViewDragSourceControllerDragState dataSourceIndexPathForDragItem:forCollectionView:](v7, v6, WeakRetained);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (self)
      v10 = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      v10 = 0;
    objc_msgSend(v10, "cellForItemAtIndexPath:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && (objc_msgSend(v11, "window"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
    {
      -[_UICollectionViewDragSourceController _previewParametersForItemAtIndexPath:](self, "_previewParametersForItemAtIndexPath:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = [UITargetedDragPreview alloc];
      if (v13)
        v15 = -[UITargetedPreview initWithView:parameters:](v14, "initWithView:parameters:", v11, v13);
      else
        v15 = -[UITargetedDragPreview initWithView:](v14, "initWithView:", v11);
      v16 = (void *)v15;

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_UICollectionViewDragSourceController dragState](self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewDragSourceControllerDragState draggingDataSourceIndexPaths](v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __93___UICollectionViewDragSourceController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v19[3] = &unk_1E16B1500;
  objc_copyWeak(&v21, &location);
  v14 = v12;
  v20 = v14;
  objc_msgSend(v9, "addAnimations:", v19);
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __93___UICollectionViewDragSourceController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2;
  v16[3] = &unk_1E16BE4C8;
  objc_copyWeak(&v18, &location);
  v15 = v14;
  v17 = v15;
  objc_msgSend(v9, "addCompletion:", v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  -[_UICollectionViewDragSourceController _sessionWillBegin:forDragInteraction:](self, "_sessionWillBegin:forDragInteraction:", a4, a3);
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  id WeakRetained;
  char v10;

  v5 = a4;
  -[_UICollectionViewDragSourceController _dragDelegateActual](self, "_dragDelegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[_UICollectionViewDragSourceController _dragDelegateProxy](self, "_dragDelegateProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      WeakRetained = 0;
    v10 = objc_msgSend(v8, "_collectionView:prefersFullSizePreviewsForDragSession:", WeakRetained, v5);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  _UICollectionViewDragSourceController *v6;
  void *v7;
  id WeakRetained;
  id v9;

  v6 = self;
  -[_UICollectionViewDragSourceController dragState](self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewDragSourceControllerDragState draggingDataSourceIndexPaths](v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v6->_delegate);
    v6 = (_UICollectionViewDragSourceController *)WeakRetained;
    if (a5 <= 1)
    {
      if (WeakRetained)
        -[_UICollectionViewDragDestinationController dropWasCancelled](*((_QWORD *)WeakRetained + 6));
    }
  }

}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  void *v6;
  char v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id *v15;
  id v16;

  v16 = a4;
  -[_UICollectionViewDragSourceController _dragDelegateActual](self, "_dragDelegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "_dragDelegateProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v10 = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      v10 = 0;
    objc_msgSend(v9, "collectionView:dragSessionDidEnd:", v10, v16);
  }
  else
  {
    -[_UICollectionViewDragSourceController _dragSourceDelegateActual](self, "_dragSourceDelegateActual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0)
      goto LABEL_14;
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "_dragSourceDelegateProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v10 = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      v10 = 0;
    objc_msgSend(v9, "_collectionView:dragSessionDidEnd:", v10, v16);
  }

LABEL_14:
  -[_UICollectionViewDragSourceController dragState](self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewDragSourceControllerDragState draggingDataSourceIndexPaths](v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UICollectionViewDragSourceController setSessionState:]((uint64_t)self);
  -[_UICollectionViewDragSourceController setDragState:]((uint64_t)self);
  if (self)
    v15 = (id *)objc_loadWeakRetained((id *)&self->_delegate);
  else
    v15 = 0;
  -[_UICollectionViewDragAndDropController dragSourceController:didEndForItemsAtIndexPaths:](v15);

}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v24;

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "indexPathForItemAtPoint:", x, y);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_11;
  -[_UICollectionViewDragSourceController dragState](self);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    v15 = v12;
    objc_msgSend(v14, "dataSourceIndexPathsOfDraggingItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v15);

    if ((v17 & 1) != 0)
      goto LABEL_11;
  }
  if (_UIShouldEnforceOpenInRulesInAccountBasedApp()
    && (v18 = objc_msgSend(v10, "_dataOwner"),
        v18 != -[_UICollectionViewDragSourceController _dataOwnerForDragSession:atIndexPath:](self, "_dataOwnerForDragSession:atIndexPath:", v10, v12)))
  {
LABEL_11:
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[_UICollectionViewDragSourceController _queryForItemsFromClientForSession:dataSourceIndexPath:location:isInitialQuery:](self, "_queryForItemsFromClientForSession:dataSourceIndexPath:location:isInitialQuery:", v10, v12, 0, x, y);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewDragSourceController _addDragItemsToExistingSession:forDataSourceIndexPath:](self, "_addDragItemsToExistingSession:forDataSourceIndexPath:", v19, v12);
    -[_UICollectionViewDragSourceController sessionState](self);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20 && (v22 = *(id *)(v20 + 8)) != 0)
    {

    }
    else
    {
      v24 = objc_msgSend(v19, "count");

      if (v24)
        -[_UICollectionViewDragSourceController _sessionWillBegin:forDragInteraction:](self, "_sessionWillBegin:forDragInteraction:", v10, v9);
    }
  }

  return v19;
}

- (id)dragInteraction:(id)a3 sessionForAddingItems:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  -[_UICollectionViewDragSourceController sessionState](self);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = *(_QWORD *)(v7 + 8);
  else
    v9 = 0;
  v10 = objc_msgSend(v6, "containsObject:", v9);

  if (v10)
  {
    -[_UICollectionViewDragSourceController sessionState](self);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = *(void **)(v11 + 8);
    else
      v13 = 0;
    v14 = v13;

  }
  else if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "firstObject");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6
{
  void *v7;
  uint64_t v8;
  id **WeakRetained;

  if (self)
    WeakRetained = (id **)objc_loadWeakRetained((id *)&self->_delegate);
  else
    WeakRetained = 0;
  -[_UICollectionViewDragSourceController dragFromIndexPaths](self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (WeakRetained)
  {
    -[_UICollectionViewDragDestinationController dragSourceSelectedItemCountDidChangeWithCount:](WeakRetained[6], v8);
    objc_msgSend(WeakRetained, "_updatePreferredDraggedCellAppearanceForSessionUpdate");
  }

}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  UITargetedDragPreview *v14;
  uint64_t v15;
  id v16;

  v6 = a4;
  -[_UICollectionViewDragSourceController dragState](self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    WeakRetained = 0;
  -[_UICollectionViewDragSourceControllerDragState dataSourceIndexPathForDragItem:forCollectionView:](v7, v6, WeakRetained);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (self)
      v10 = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      v10 = 0;
    objc_msgSend(v10, "cellForItemAtIndexPath:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[_UICollectionViewDragSourceController _previewParametersForItemAtIndexPath:](self, "_previewParametersForItemAtIndexPath:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = [UITargetedDragPreview alloc];
        if (v13)
          v15 = -[UITargetedPreview initWithView:parameters:](v14, "initWithView:parameters:", v11, v13);
        else
          v15 = -[UITargetedDragPreview initWithView:](v14, "initWithView:", v11);
        v12 = (void *)v15;

      }
    }
    else
    {
      v12 = 0;
    }
    if (self)
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
    else
      v16 = 0;
    -[_UICollectionViewDragAndDropController dragSourceController:didSupplyCancellationPreviewForItemAtIndexPath:](v16);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  -[_UICollectionViewDragSourceController dragState](self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    WeakRetained = 0;
  -[_UICollectionViewDragSourceControllerDragState dataSourceIndexPathForDragItem:forCollectionView:](v9, v7, WeakRetained);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (self)
    {
      v12 = (id *)objc_loadWeakRetained((id *)&self->_delegate);
      v18[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICollectionViewDragAndDropController dragSourceController:willBeginAnimatingCancelForItemsAtIndexPaths:withAnimator:](v12, (uint64_t)self, v13, v8);

      v14 = objc_loadWeakRetained((id *)&self->_delegate);
    }
    else
    {
      v18[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICollectionViewDragAndDropController dragSourceController:willBeginAnimatingCancelForItemsAtIndexPaths:withAnimator:](0, 0, v15, v8);

      v14 = 0;
    }
    -[_UICollectionViewDragAndDropController _performCancelDropToIndexPath:forDragItem:](v14, v11, v7);

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __92___UICollectionViewDragSourceController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
    v16[3] = &unk_1E16BE3C0;
    v16[4] = self;
    v17 = v11;
    objc_msgSend(v8, "addCompletion:", v16);

  }
}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  id WeakRetained;
  char v10;

  v5 = a4;
  -[_UICollectionViewDragSourceController _dragDelegateActual](self, "_dragDelegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[_UICollectionViewDragSourceController _dragDelegateProxy](self, "_dragDelegateProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      WeakRetained = 0;
    v10 = objc_msgSend(v8, "collectionView:dragSessionAllowsMoveOperation:", WeakRetained, v5);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  id WeakRetained;
  char v10;

  v5 = a4;
  -[_UICollectionViewDragSourceController _dragDelegateActual](self, "_dragDelegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[_UICollectionViewDragSourceController _dragDelegateProxy](self, "_dragDelegateProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      WeakRetained = 0;
    v10 = objc_msgSend(v8, "collectionView:dragSessionIsRestrictedToDraggingApplication:", WeakRetained, v5);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  int64_t v15;

  v6 = a3;
  v7 = a4;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    WeakRetained = 0;
  objc_msgSend(v7, "locationInView:", WeakRetained);
  v10 = v9;
  v12 = v11;

  if (self)
    v13 = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    v13 = 0;
  objc_msgSend(v13, "indexPathForItemAtPoint:", v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[_UICollectionViewDragSourceController _dataOwnerForDragSession:atIndexPath:](self, "_dataOwnerForDragSession:atIndexPath:", v7, v14);
  return v15;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  id WeakRetained;
  void *v10;
  int64_t v11;

  y = a5.y;
  x = a5.x;
  v8 = a4;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "indexPathForItemAtPoint:", x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[_UICollectionViewDragSourceController _dataOwnerForDragSession:atIndexPath:](self, "_dataOwnerForDragSession:atIndexPath:", v8, v10);
  return v11;
}

- (id)_dragInteraction:(id)a3 sessionPropertiesForSession:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  char v12;
  void *v13;

  v5 = a4;
  -[_UICollectionViewDragSourceController _dragDelegateActual](self, "_dragDelegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0
    || ((-[_UICollectionViewDragSourceController _dragDelegateProxy](self, "_dragDelegateProxy"),
         v8 = (void *)objc_claimAutoreleasedReturnValue(),
         !self)
      ? (WeakRetained = 0)
      : (WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView)),
        objc_msgSend(v8, "_collectionView:dragSessionPropertiesForSession:", WeakRetained, v5),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        WeakRetained,
        v8,
        !v10))
  {
    -[_UICollectionViewDragSourceController _dragDelegateActual](self, "_dragDelegateActual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v10 = (void *)objc_opt_new();
      -[_UICollectionViewDragSourceController _dragDelegateProxy](self, "_dragDelegateProxy");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
        self = (_UICollectionViewDragSourceController *)objc_loadWeakRetained((id *)&self->_collectionView);
      objc_msgSend(v10, "set_supportsSystemDrag:", objc_msgSend(v13, "_collectionView:dragSessionSupportsSystemDrag:", self, v5));

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (int64_t)_dataOwnerForDragSession:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  id WeakRetained;
  int64_t v12;

  v6 = a3;
  v7 = a4;
  if (v7
    && (-[_UICollectionViewDragSourceController _dragDelegateActual](self, "_dragDelegateActual"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_opt_respondsToSelector(),
        v8,
        (v9 & 1) != 0))
  {
    -[_UICollectionViewDragSourceController _dragDelegateProxy](self, "_dragDelegateProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      WeakRetained = 0;
    v12 = objc_msgSend(v10, "_collectionView:dataOwnerForDragSession:atIndexPath:", WeakRetained, v6, v7);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_dragDelegateActual
{
  id WeakRetained;
  void *v3;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "_dragDelegateActual");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_dragDelegateProxy
{
  id WeakRetained;
  void *v3;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "_dragDelegateProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_dragSourceDelegateActual
{
  id WeakRetained;
  void *v3;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "_dragSourceDelegateActual");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_dragSourceDelegateProxy
{
  id WeakRetained;
  void *v3;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "_dragSourceDelegateProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_delegateImplementsDragSourceItemsAtIndexPath
{
  return -[_UICollectionViewDragSourceController _delegateImplementsSelector:](self, "_delegateImplementsSelector:", sel__collectionView_dragSourceItemsForItemAtIndexPath_);
}

- (BOOL)_delegateImplementsDragItemsForItemAtIndexPath
{
  return -[_UICollectionViewDragSourceController _delegateImplementsSelector:](self, "_delegateImplementsSelector:", sel__collectionView_dragItemsForItemAtIndexPath_);
}

- (BOOL)_delegateImplementsDragItemsForItemAtIndexPathWithDefaultPreview
{
  return -[_UICollectionViewDragSourceController _delegateImplementsSelector:](self, "_delegateImplementsSelector:", sel__collectionView_dragItemsForItemAtIndexPath_defaultPreview_);
}

- (BOOL)_delegateImplementsDragSourceDidAddItem
{
  return -[_UICollectionViewDragSourceController _delegateImplementsSelector:](self, "_delegateImplementsSelector:", sel__collectionView_dragSourceDidAddDraggingItem_forItemAtIndexPath_);
}

- (BOOL)_delegateImplementsSelector:(SEL)a3
{
  UICollectionView **p_collectionView;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  char v8;

  p_collectionView = &self->_collectionView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  objc_msgSend(WeakRetained, "_dragSourceDelegateActual");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_loadWeakRetained((id *)p_collectionView);
    objc_msgSend(v6, "_dragSourceDelegateActual");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

  }
  else
  {
    v8 = 0;
  }

  return v8 & 1;
}

- (void)_addDragItemsToExistingSession:(id)a3 forDataSourceIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(v10, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __95___UICollectionViewDragSourceController__addDragItemsToExistingSession_forDataSourceIndexPath___block_invoke;
    v11[3] = &unk_1E16BE4F0;
    v11[4] = self;
    v7 = v6;
    v12 = v7;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);
    -[_UICollectionViewDragSourceController dragState](self);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7 && v8)
      objc_msgSend(*(id *)(v8 + 16), "addObject:", v7);

  }
}

- (id)_queryForItemsFromClientForSession:(id)a3 dataSourceIndexPath:(id)a4 location:(CGPoint)a5 isInitialQuery:(BOOL)a6
{
  _BOOL4 v6;
  double y;
  double x;
  id v11;
  id v12;
  id WeakRetained;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;

  v6 = a6;
  y = a5.y;
  x = a5.x;
  v11 = a3;
  v12 = a4;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "indexPathAfterShadowUpdates:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_22;
  -[_UICollectionViewDragSourceController _dragDelegateActual](self, "_dragDelegateActual");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      -[_UICollectionViewDragSourceController _dragDelegateProxy](self, "_dragDelegateProxy");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
        self = (_UICollectionViewDragSourceController *)objc_loadWeakRetained((id *)&self->_collectionView);
      objc_msgSend(v17, "collectionView:itemsForAddingToDragSession:atIndexPath:point:", self, v11, v14, x, y);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    -[_UICollectionViewDragSourceController _dragSourceDelegateActual](self, "_dragSourceDelegateActual");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      -[_UICollectionViewDragSourceController _dragSourceDelegateProxy](self, "_dragSourceDelegateProxy");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
        self = (_UICollectionViewDragSourceController *)objc_loadWeakRetained((id *)&self->_collectionView);
      objc_msgSend(v17, "_collectionView:itemsForAddingToDragSession:atIndexPath:point:", self, v11, v14, x, y);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) == 0)
  {
    -[_UICollectionViewDragSourceController _dragSourceDelegateActual](self, "_dragSourceDelegateActual");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      -[_UICollectionViewDragSourceController _dragSourceDelegateProxy](self, "_dragSourceDelegateProxy");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
        self = (_UICollectionViewDragSourceController *)objc_loadWeakRetained((id *)&self->_collectionView);
      objc_msgSend(v17, "_collectionView:itemsForBeginningDragSession:atIndexPath:", self, v11, v14);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_22:
    v24 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_23;
  }
  -[_UICollectionViewDragSourceController _dragDelegateProxy](self, "_dragDelegateProxy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (_UICollectionViewDragSourceController *)objc_loadWeakRetained((id *)&self->_collectionView);
  objc_msgSend(v17, "collectionView:itemsForBeginningDragSession:atIndexPath:", self, v11, v14);
  v18 = objc_claimAutoreleasedReturnValue();
LABEL_21:
  v24 = (void *)v18;

LABEL_23:
  return v24;
}

- (id)_previewParametersForItemAtIndexPath:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  char v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  char v14;
  UIDragPreviewParameters *v15;
  id v16;
  void *v17;
  void *v18;

  v4 = a3;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "_dragDelegateActual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    if (self)
      v8 = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      v8 = 0;
    objc_msgSend(v8, "_dragDelegateProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v10 = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      v10 = 0;
    objc_msgSend(v9, "collectionView:dragPreviewParametersForItemAtIndexPath:", v10, v4);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (self)
    v12 = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    v12 = 0;
  objc_msgSend(v12, "_dragSourceDelegateActual");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    if (self)
      v8 = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      v8 = 0;
    objc_msgSend(v8, "_dragSourceDelegateProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v10 = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      v10 = 0;
    objc_msgSend(v9, "_collectionView:liftingPreviewParametersForItemAtIndexPath:", v10, v4);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v15 = (UIDragPreviewParameters *)v11;

    if (v15)
      goto LABEL_24;
  }
  if (self)
    v16 = objc_loadWeakRetained((id *)&self->_collectionView);
  else
    v16 = 0;
  objc_msgSend(v16, "_cellForItemAtIndexPath:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "_visiblePathForBackgroundConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v15 = objc_alloc_init(UIDragPreviewParameters);
    -[UIPreviewParameters setVisiblePath:](v15, "setVisiblePath:", v18);
  }
  else
  {
    v15 = 0;
  }

LABEL_24:
  return v15;
}

- (void)_sessionWillBegin:(id)a3 forDragInteraction:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  char v14;
  _UICollectionViewDragSourceController *v15;
  id v16;

  v16 = a3;
  -[_UICollectionViewDragSourceController sessionState](self);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    objc_storeStrong((id *)(v6 + 8), a3);

  -[_UICollectionViewDragSourceController _dragDelegateActual](self, "_dragDelegateActual");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "_dragDelegateProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v12 = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      v12 = 0;
    objc_msgSend(v11, "collectionView:dragSessionWillBegin:", v12, v16);
LABEL_15:

    goto LABEL_16;
  }
  -[_UICollectionViewDragSourceController _dragSourceDelegateActual](self, "_dragSourceDelegateActual");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "_dragSourceDelegateProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v12 = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      v12 = 0;
    objc_msgSend(v11, "_collectionView:dragSessionWillBegin:", v12, v16);
    goto LABEL_15;
  }
LABEL_16:
  if (self)
  {
    v15 = (_UICollectionViewDragSourceController *)objc_loadWeakRetained((id *)&self->_delegate);
    self = v15;
    if (v15)
      -[_UICollectionViewDragSourceController _incrementSessionRefCount](v15, "_incrementSessionRefCount");
  }

}

- (id)_filterCandidateIndexPaths:(id)a3 forUserSelectedIndexPath:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  id WeakRetained;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  id v27;
  id v28;
  id obj;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v30 = a5;
  if ((_UIShouldEnforceOpenInRulesInAccountBasedApp() & 1) != 0
    && v9
    && (!self ? (v10 = 0) : (v10 = objc_loadWeakRetained((id *)&self->_collectionView)),
        objc_msgSend(v10, "_dragDelegateActual"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_opt_respondsToSelector(),
        v11,
        v10,
        (v12 & 1) != 0))
  {
    -[_UICollectionViewDragSourceController _dragDelegateProxy](self, "_dragDelegateProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    else
      WeakRetained = 0;
    v26 = v9;
    v15 = objc_msgSend(v13, "_collectionView:dataOwnerForDragSession:atIndexPath:", WeakRetained, v30, v9);

    v27 = v8;
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v8;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v32;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v32 != v18)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v19);
          -[_UICollectionViewDragSourceController _dragDelegateProxy](self, "_dragDelegateProxy");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (self)
            v22 = objc_loadWeakRetained((id *)&self->_collectionView);
          else
            v22 = 0;
          v23 = objc_msgSend(v21, "_collectionView:dataOwnerForDragSession:atIndexPath:", v22, v30, v20);

          if (v23 == v15)
            objc_msgSend(v28, "addObject:", v20);
          ++v19;
        }
        while (v17 != v19);
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        v17 = v24;
      }
      while (v24);
    }

    v9 = v26;
    v8 = v27;
  }
  else
  {
    v28 = v8;
  }

  return v28;
}

- (void)rebaseForUpdates:(_QWORD *)a1
{
  id v3;
  id v4;

  if (a1)
  {
    v3 = a2;
    -[_UICollectionViewDragSourceController dragState](a1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewDragSourceControllerDragState rebaseForUpdates:](v4, v3);

  }
}

@end
