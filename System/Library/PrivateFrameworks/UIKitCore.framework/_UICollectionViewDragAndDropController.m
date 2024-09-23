@implementation _UICollectionViewDragAndDropController

- (id)reorderedItems
{
  if (a1)
    a1 = (id *)objc_msgSend(a1[21], "copy");
  return a1;
}

- (BOOL)updateWillCauseInternalInconsistency:(uint64_t)a1
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;

  v3 = a2;
  v4 = v3;
  if (a1 && objc_msgSend(v3, "updateAction") == 1)
  {
    -[_UICollectionViewDragAndDropController indexPathForOriginalReorderedItem](a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[UICollectionViewUpdateItem _indexPath](v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 1;
      if ((objc_msgSend(v6, "isEqual:", v5) & 1) == 0)
      {
        if (!v4
          || v4[6] != 0x7FFFFFFFFFFFFFFFLL
          || (v7 = objc_msgSend(v6, "section"), v7 != objc_msgSend(v5, "section")))
        {
          v8 = 0;
        }
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)indexPathForOriginalReorderedItem
{
  void *v1;
  void *v2;
  void *v3;

  if (a1 && *(_QWORD *)(a1 + 64) != 3)
  {
    objc_msgSend(*(id *)(a1 + 168), "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "originalIndexPath");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v1 = 0;
    }

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (BOOL)hasShadowUpdates
{
  void *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  objc_msgSend(a1, "_shadowUpdates");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

- (void)updateAppearanceForCell:(void *)a3 atIndexPath:
{
  id v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (a1 && v14 && v5)
  {
    -[_UICollectionViewSubviewCollection cellAtIndexPath:](*(id **)(a1 + 104), (uint64_t)v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = v6 == v14;
    else
      v7 = 1;
    if (!v7)
    {
      objc_msgSend(v6, "_setDragAppearance:", 0);
      v8 = *(_QWORD *)(a1 + 104);
      if (v8)
        objc_msgSend(*(id *)(v8 + 8), "removeObjectForKey:", v5);
    }
    objc_msgSend(*(id *)(a1 + 112), "objectForKeyedSubscript:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      v11 = *(_DWORD *)(v9 + 12);
      if (v11 == 6)
      {
        v13 = 2 * *(unsigned __int8 *)(v9 + 10);
        v12 = (uint64_t)v14;
      }
      else
      {
        v12 = (uint64_t)v14;
        if (v11 == 3)
        {
          if (*(_BYTE *)(v9 + 10))
            v13 = 2;
          else
            v13 = 3;
        }
        else
        {
          v13 = v11 == 1;
        }
      }
      -[_UICollectionViewSubviewCollection setCell:atIndexPath:](*(_QWORD *)(a1 + 104), v12, (uint64_t)v5);
      objc_msgSend(v14, "_setDragAppearance:", v13);
    }

  }
}

- (uint64_t)isCellPerformingLegacyReorderingAtIndexPath:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    if (*(_QWORD *)(a1 + 64) == 1)
    {
      -[_UICollectionViewDragAndDropController indexPathForDragAndDropInsertion](a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v4;
      v8 = v6;
      v9 = v8;
      if (v8 == v7)
      {
        v5 = 1;
        v11 = v7;
      }
      else
      {
        if (v8)
        {
          v10 = objc_msgSend(v7, "isEqual:", v8);

          if ((v10 & 1) != 0)
          {
            v5 = 1;
LABEL_18:

            goto LABEL_19;
          }
        }
        else
        {

        }
        -[_UICollectionViewDragAndDropController indexPathForOriginalReorderedItem](a1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v7;
        v13 = v12;
        v11 = v13;
        if (v13 == v7)
        {
          v5 = 1;
        }
        else if (v13)
        {
          v5 = objc_msgSend(v7, "isEqual:", v13);
        }
        else
        {
          v5 = 0;
        }

      }
      goto LABEL_18;
    }
    v5 = 0;
  }
LABEL_19:

  return v5;
}

- (void)commitReorderedItems
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v1 = *(id *)(a1 + 168);
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v7;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v7 != v4)
            objc_enumerationMutation(v1);
          objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "commitTargetIndexPath", (_QWORD)v6);
        }
        while (v3 != v5);
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      }
      while (v3);
    }

  }
}

- (_UICollectionViewDragAndDropController)initWithCollectionView:(id)a3
{
  _UICollectionViewDragAndDropController *v3;
  NSMutableArray *v4;
  NSMutableArray *reorderedItems;
  _UICollectionViewSubviewCollection *v6;
  _UICollectionViewSubviewCollection *viewsWithAppearanceUpdates;
  NSMutableDictionary *v8;
  NSMutableDictionary *cellAppearanceStatesByIndexPaths;
  NSMutableSet *v10;
  NSMutableSet *placeholderContexts;
  NSMutableArray *v12;
  NSMutableArray *dropCoordinatorItems;
  NSMutableSet *v14;
  NSMutableSet *cellsDeferredForReuse;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_UICollectionViewDragAndDropController;
  v3 = -[_UICollectionViewShadowUpdatesController initWithCollectionView:](&v17, sel_initWithCollectionView_, a3);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    reorderedItems = v3->__reorderedItems;
    v3->__reorderedItems = v4;

    v6 = objc_alloc_init(_UICollectionViewSubviewCollection);
    viewsWithAppearanceUpdates = v3->_viewsWithAppearanceUpdates;
    v3->_viewsWithAppearanceUpdates = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cellAppearanceStatesByIndexPaths = v3->_cellAppearanceStatesByIndexPaths;
    v3->_cellAppearanceStatesByIndexPaths = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    placeholderContexts = v3->_placeholderContexts;
    v3->_placeholderContexts = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    dropCoordinatorItems = v3->_dropCoordinatorItems;
    v3->_dropCoordinatorItems = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    cellsDeferredForReuse = v3->_cellsDeferredForReuse;
    v3->_cellsDeferredForReuse = v14;

    v3->_dragInteractionEnabled = 1;
    v3->_flockSelectedItemsOnDrag = 1;
    -[_UICollectionViewDragAndDropController reset](v3, "reset");
  }
  return v3;
}

- (void)reset
{
  NSMutableSet *placeholderContexts;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UICollectionViewDragAndDropController;
  -[_UICollectionViewShadowUpdatesController reset](&v4, sel_reset);
  -[_UICollectionViewDragAndDropController _resetReorderedItems](self, "_resetReorderedItems");
  if (self)
    placeholderContexts = self->_placeholderContexts;
  else
    placeholderContexts = 0;
  -[NSMutableSet removeAllObjects](placeholderContexts, "removeAllObjects");
  -[_UICollectionViewDragAndDropController setPlaceholderContextsByIndexPath:]((uint64_t)self);
  -[_UICollectionViewDragAndDropController setCurrentDropInsertionShadowUpdateIdentifier:]((uint64_t)self);
}

- (void)setPlaceholderContextsByIndexPath:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 88), 0);
}

- (void)setCurrentDropInsertionShadowUpdateIdentifier:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 160), 0);
}

- (void)_resetReorderedItems
{
  NSMutableArray *reorderedItems;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  if (self)
    reorderedItems = self->__reorderedItems;
  else
    reorderedItems = 0;
  v4 = reorderedItems;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "cell", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_setReordering:", 0);

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  if (self)
  {
    -[NSMutableArray removeAllObjects](self->__reorderedItems, "removeAllObjects");
    self->_hasReorderedItemInSession = 0;
  }
  else
  {
    objc_msgSend(0, "removeAllObjects");
  }
}

- (id)_dropCoordinatorItemForIndexPath:(id)a3
{
  id v4;
  NSMapTable *dropCoordinatorItemsMap;
  NSMapTable *v6;
  NSMapTable *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSMapTable *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a3;
    if (self)
    {
      dropCoordinatorItemsMap = self->_dropCoordinatorItemsMap;
      if (!dropCoordinatorItemsMap)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
        v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
        v7 = self->_dropCoordinatorItemsMap;
        self->_dropCoordinatorItemsMap = v6;

        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v8 = self->_dropCoordinatorItems;
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v19 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
              objc_msgSend(v13, "destinationIndexPath", (_QWORD)v18);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (v14)
                -[NSMapTable setObject:forKey:](self->_dropCoordinatorItemsMap, "setObject:forKey:", v13, v14);

            }
            v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          }
          while (v10);
        }

        dropCoordinatorItemsMap = self->_dropCoordinatorItemsMap;
      }
      v15 = dropCoordinatorItemsMap;
    }
    else
    {
      v15 = 0;
    }
    -[NSMapTable objectForKey:](v15, "objectForKey:", v4, (_QWORD)v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__reorderedItems, 0);
  objc_storeStrong((id *)&self->_currentDropInsertionShadowUpdateIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultAnimationHandlers, 0);
  objc_storeStrong((id *)&self->_cellsDeferredForReuse, 0);
  objc_storeStrong((id *)&self->_dropCoordinatorItemsMap, 0);
  objc_storeStrong((id *)&self->_dropCoordinatorItems, 0);
  objc_storeStrong((id *)&self->_cellAppearanceStatesByIndexPaths, 0);
  objc_storeStrong((id *)&self->_viewsWithAppearanceUpdates, 0);
  objc_storeStrong((id *)&self->_placeholderContexts, 0);
  objc_storeStrong((id *)&self->_placeholderContextsByIndexPath, 0);
  objc_storeStrong((id *)&self->_currentlyInsertingPlaceholderContext, 0);
  objc_storeStrong((id *)&self->_sourceController, 0);
  objc_storeStrong((id *)&self->_destinationController, 0);
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSMutableArray *reorderedItems;
  void *v8;
  _UICollectionViewDragDestinationController *destinationController;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p -"), v5, self);

  if (self)
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("sessionKind = %ld;"), self->_sessionKind);
    reorderedItems = self->__reorderedItems;
  }
  else
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("sessionKind = %ld;"), 0);
    reorderedItems = 0;
  }
  objc_msgSend(v6, "appendFormat:", CFSTR(" reorderedItems = %@;"), reorderedItems);
  -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" shadowUpdates=%@;"), v8);

  if (self)
  {
    objc_msgSend(v6, "appendFormat:", CFSTR(" cellAppearanceStatesByIndexPaths=%@; "),
      self->_cellAppearanceStatesByIndexPaths);
    objc_msgSend(v6, "appendFormat:", CFSTR(" placeholderContexts = %@;"), self->_placeholderContexts);
    objc_msgSend(v6, "appendFormat:", CFSTR(" source=%@;"), self->_sourceController);
    destinationController = self->_destinationController;
  }
  else
  {
    objc_msgSend(v6, "appendFormat:", CFSTR(" cellAppearanceStatesByIndexPaths=%@; "), 0);
    objc_msgSend(v6, "appendFormat:", CFSTR(" placeholderContexts = %@;"), 0);
    objc_msgSend(v6, "appendFormat:", CFSTR(" source=%@;"), 0);
    destinationController = 0;
  }
  objc_msgSend(v6, "appendFormat:", CFSTR(" destination=%@"), destinationController);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (uint64_t)canBeginReorderingSession
{
  void *v1;
  unint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (void *)result;
    if (*(_QWORD *)(result + 64))
      return 0;
    if (!objc_msgSend(*(id *)(result + 96), "count"))
      return 1;
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        goto LABEL_12;
      objc_msgSend(v1, "collectionView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_fault_impl(&dword_185066000, v4, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: unable to begin reordering session due to the presence of placeholder contexts. Collection view: %@", (uint8_t *)&v6, 0xCu);
LABEL_11:

LABEL_12:
      return 0;
    }
    v2 = canBeginReorderingSession___s_category;
    if (!canBeginReorderingSession___s_category)
    {
      v2 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&canBeginReorderingSession___s_category);
    }
    v3 = *(NSObject **)(v2 + 8);
    result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      v4 = v3;
      objc_msgSend(v1, "collectionView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: unable to begin reordering session due to the presence of placeholder contexts. Collection view: %@", (uint8_t *)&v6, 0xCu);
      goto LABEL_11;
    }
  }
  return result;
}

- (void)beginReorderingForItemAtIndexPath:(void *)a3 cell:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UICollectionViewReorderedItem *v9;
  void *v10;
  void *v11;
  UICollectionViewReorderedItem *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  UICollectionViewReorderedItem *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  UICollectionViewReorderedItem *v26;
  id v27;

  v24 = a2;
  v5 = a3;
  if (a1)
  {
    if (v24)
    {
      if (v5)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel_beginReorderingForItemAtIndexPath_cell_, a1, CFSTR("_UICollectionViewDragAndDropController.m"), 199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath != nil"));

      if (v5)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel_beginReorderingForItemAtIndexPath_cell_, a1, CFSTR("_UICollectionViewDragAndDropController.m"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cell != nil"));

LABEL_4:
    objc_msgSend((id)a1, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 64);
    if (v8 == 3)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __81___UICollectionViewDragAndDropController_beginReorderingForItemAtIndexPath_cell___block_invoke;
      v25[3] = &unk_1E16B1B50;
      v12 = v6;
      v26 = v12;
      v13 = v24;
      v27 = v13;
      -[UICollectionViewReorderedItem _performShadowUpdates:](v12, "_performShadowUpdates:", v25);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v15)
      {
        v17 = *(void **)(v15 + 88);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", sel_beginReorderingForItemAtIndexPath_cell_, a1, CFSTR("_UICollectionViewDragAndDropController.m"), 216, CFSTR("UICollectionView internal consistency: shadow insert for placeholder cell is nil. Collection view: %@"), v12);

        v17 = 0;
      }
      objc_storeStrong((id *)(a1 + 160), v17);
      -[UICollectionViewReorderedItem _cellForItemAtIndexPath:](v12, "_cellForItemAtIndexPath:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel_beginReorderingForItemAtIndexPath_cell_, a1, CFSTR("_UICollectionViewDragAndDropController.m"), 220, CFSTR("UICollectionView internal consistency: unable to retrieve placeholder cell for reordering. Collection view: %@"), v12);

      }
      v19 = -[UICollectionViewReorderedItem initWithCell:indexPath:]([UICollectionViewReorderedItem alloc], "initWithCell:indexPath:", v18, v13);
      objc_msgSend(*(id *)(a1 + 168), "addObject:", v19);

      v9 = v26;
      goto LABEL_17;
    }
    if (v8 != 1)
    {
      if (v8)
      {
LABEL_9:
        v9 = -[UICollectionViewReorderedItem initWithCell:indexPath:]([UICollectionViewReorderedItem alloc], "initWithCell:indexPath:", v5, v24);
        objc_msgSend(*(id *)(a1 + 168), "addObject:", v9);
        objc_msgSend(v7, "_diffableDataSourceImpl");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
          objc_msgSend(v10, "_willBeginReorderingForItemAtIndexPath:", v24);

LABEL_17:
        goto LABEL_18;
      }
      *(_QWORD *)(a1 + 64) = 1;
    }
    objc_msgSend(v5, "_setReordering:", 1);
    goto LABEL_9;
  }
LABEL_18:

}

- (id)updateReorderingForTargetPosition:(double)a3
{
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  char v25;
  int v26;
  NSObject *v27;
  unint64_t v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  int v34;
  __int128 v36;
  int v37;
  id v38;
  id v39;
  BOOL v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v39 = 0;
    return v39;
  }
  v6 = *(id *)(a1 + 168);
  v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
  if (!*(_QWORD *)(a1 + 64) || -[_UICollectionViewDragAndDropController effectiveDragDestinationVisualStyle](a1) == 2)
    goto LABEL_40;
  v37 = *(unsigned __int8 *)(a1 + 43);
  v40 = v37 != 0;
  objc_msgSend((id)a1, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v38 = v6;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (!v8)
    goto LABEL_37;
  v10 = v8;
  v11 = *(_QWORD *)v43;
  *(_QWORD *)&v9 = 138412546;
  v36 = v9;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v43 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v12);
      objc_msgSend(v13, "originalIndexPath", v36);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "targetIndexPath");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (os_variant_has_internal_diagnostics())
      {
        if (!v15)
        {
          __UIFaultDebugAssertLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          {
            __UICVIndexPathDescription(v14);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v36;
            v47 = v7;
            v48 = 2112;
            v49 = v32;
            _os_log_fault_impl(&dword_185066000, v27, OS_LOG_TYPE_FAULT, "UIKit internal inconsistency: expected reordered item to have a previous index path. Please file a bug against UICollectionView with reproduction steps. Collection view: %@; Original index path: %@",
              buf,
              0x16u);

          }
        }
      }
      else if (!v15)
      {
        v28 = updateReorderingForTargetPosition____s_category;
        if (!updateReorderingForTargetPosition____s_category)
        {
          v28 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v28, (unint64_t *)&updateReorderingForTargetPosition____s_category);
        }
        v29 = *(NSObject **)(v28 + 8);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = v29;
          __UICVIndexPathDescription(v14);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v36;
          v47 = v7;
          v48 = 2112;
          v49 = v31;
          _os_log_impl(&dword_185066000, v30, OS_LOG_TYPE_ERROR, "UIKit internal inconsistency: expected reordered item to have a previous index path. Please file a bug against UICollectionView with reproduction steps. Collection view: %@; Original index path: %@",
            buf,
            0x16u);

        }
      }
      if (*(_QWORD *)(a1 + 64) != 2)
      {
        objc_msgSend(v7, "collectionViewLayout");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_targetPositionForInteractiveMovementOfItemAtIndexPath:withProposedTargetPosition:", v14, a2, a3);
        v19 = v18;
        v21 = v20;

        objc_msgSend(v7, "collectionViewLayout");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_reorderingTargetItemIndexPathForPosition:withPreviousIndexPath:", v15, v19, v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
        {
LABEL_22:
          v16 = 0;
          goto LABEL_23;
        }
        objc_msgSend(v7, "_targetIndexPathForMoveOfItemFromOriginalIndexPath:atCurrentIndexPath:toProposedIndexPath:", v14, v15, v23);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          goto LABEL_23;
LABEL_17:
        if (v16)
        {
          v24 = v16;
          if (v15 == v24)
          {

            v16 = v15;
          }
          else
          {
            v16 = v24;
            v25 = objc_msgSend(v15, "isEqual:", v24);

            if ((v25 & 1) == 0)
            {
              objc_msgSend(v39, "setObject:forKeyedSubscript:", v16, v15);
              objc_msgSend(v13, "setTargetIndexPath:", v16);
              if (v40)
                LOBYTE(v26) = 1;
              else
                v26 = objc_msgSend(v13, "isNOOP") ^ 1;
              v40 = v26;
            }
          }
        }
        goto LABEL_23;
      }
      if (!-[_UICollectionViewDragDestinationController shouldPerformMovementForCurrentProposal](*(_QWORD **)(a1 + 48)))
        goto LABEL_22;
      objc_msgSend((id)a1, "destinationIndexPath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        goto LABEL_17;
LABEL_23:

      ++v12;
    }
    while (v10 != v12);
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    v10 = v33;
  }
  while (v33);
LABEL_37:

  v34 = v40;
  if ((v37 != 0) != v34)
  {
    *(_BYTE *)(a1 + 43) = v34;
    objc_msgSend((id)a1, "_updatePreferredDraggedCellAppearanceForSessionUpdate");
  }

  v6 = v38;
LABEL_40:

  return v39;
}

- (uint64_t)effectiveDragDestinationVisualStyle
{
  uint64_t v1;
  void *v2;
  unint64_t v3;
  void *v4;

  if (result)
  {
    v1 = result;
    objc_msgSend((id)result, "collectionView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "traitCollection");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      _UIRecordTraitUsage(v3, 0x13uLL);

    if (*(_QWORD *)(v1 + 72) == 2)
      return 2;
    else
      return 1;
  }
  return result;
}

- (id)cancelReorderingForced:(uint64_t *)a1
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD aBlock[5];

  if (!a1)
    return 0;
  v3 = a1[8];
  if (v3 == 1)
  {
    objc_msgSend(a1, "reset");
    a1[8] = 0;
    goto LABEL_10;
  }
  if (v3 == 3)
  {
    if (a2)
    {
      objc_msgSend(a1, "collectionView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "reset");
      -[_UICollectionViewDragDestinationController suspendDrops](a1[6]);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __65___UICollectionViewDragAndDropController_cancelReorderingForced___block_invoke_3;
      v8[3] = &unk_1E16B1B28;
      v8[4] = a1;
      v4 = _Block_copy(v8);

      goto LABEL_11;
    }
    objc_msgSend(a1, "_rollbackCurrentDropInsertion");
LABEL_10:
    v4 = &__block_literal_global_115;
    goto LABEL_11;
  }
  if (v3 != 2)
    goto LABEL_10;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65___UICollectionViewDragAndDropController_cancelReorderingForced___block_invoke_2;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = a1;
  v4 = _Block_copy(aBlock);
LABEL_11:
  v6 = _Block_copy(v4);

  return v6;
}

- (id)endReordering
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD aBlock[5];

  if (!a1)
    return 0;
  v2 = a1[8];
  if (v2 == 1)
  {
    objc_msgSend(a1, "reset");
    a1[8] = 0;
LABEL_8:
    v3 = &__block_literal_global_41;
    goto LABEL_9;
  }
  if (v2 != 3)
  {
    if (v2 == 2)
      objc_msgSend(a1, "reset");
    goto LABEL_8;
  }
  objc_msgSend(a1, "_rollbackCurrentDropInsertion");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55___UICollectionViewDragAndDropController_endReordering__block_invoke_2;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = a1;
  v3 = _Block_copy(aBlock);
LABEL_9:
  v4 = _Block_copy(v3);

  return v4;
}

- (BOOL)isCellInvolvedInDragOrDropAnimation:(uint64_t)a3 atIndexPath:
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  if (a1)
  {
    objc_msgSend((id)a1, "_dropCoordinatorItemForIndexPath:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "shouldRemainInHierarchy"))
    {
      objc_msgSend((id)a1, "_cellForDropCoordinatorItem:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      a1 = v8 == v5;

    }
    else
    {
      a1 = 0;
    }

  }
  return a1;
}

- (void)didUpdateDragDelegate
{
  void *v2;
  _QWORD *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "collectionView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = a1[7];
    v4 = v3;
    if (v3)
    {
      if (-[_UICollectionViewDragSourceController isActive](v3))
      {
        v5 = didUpdateDragDelegate___s_category;
        if (!didUpdateDragDelegate___s_category)
        {
          v5 = __UILogCategoryGetNode("UICollectionView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v5, (unint64_t *)&didUpdateDragDelegate___s_category);
        }
        v6 = *(NSObject **)(v5 + 8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v11 = 138412290;
          v12 = v2;
          _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Warning: Changing the dragDelegate while a drag session is active will lead to undefined behavior. %@", (uint8_t *)&v11, 0xCu);
        }
      }
      -[_UICollectionViewDragSourceController deactivate]((uint64_t)v4);
      v7 = a1[7];
      a1[7] = 0;

    }
    objc_msgSend(v2, "dragDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 || (objc_msgSend(v2, "dragSourceDelegate"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else if ((objc_msgSend(v2, "_dragAndDropNeededForReordering") & 1) == 0)
    {
      goto LABEL_13;
    }
    +[_UICollectionViewDragDestinationController controllerForCollectionView:delegate:]((uint64_t)_UICollectionViewDragSourceController, v2, a1);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = a1[7];
    a1[7] = (id)v9;

    -[_UICollectionViewDragSourceController setDragInteractionEnabled:]((uint64_t)a1[7], objc_msgSend(v2, "dragInteractionEnabled"));
LABEL_13:

  }
}

- (void)didUpdateDropDelegate
{
  void *v2;
  _QWORD *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "collectionView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = a1[6];
    v4 = v3;
    if (v3)
    {
      if (-[_UICollectionViewDragDestinationController isActive](v3))
      {
        v5 = didUpdateDropDelegate___s_category;
        if (!didUpdateDropDelegate___s_category)
        {
          v5 = __UILogCategoryGetNode("UICollectionView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v5, (unint64_t *)&didUpdateDropDelegate___s_category);
        }
        v6 = *(NSObject **)(v5 + 8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v11 = 138412290;
          v12 = v2;
          _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Warning: Changing the dropDelegate while a drag session is active will lead to undefined behavior. %@", (uint8_t *)&v11, 0xCu);
        }
      }
      -[_UICollectionViewDragDestinationController deactivate]((uint64_t)v4);
      v7 = a1[6];
      a1[6] = 0;

    }
    objc_msgSend(v2, "dropDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 || (objc_msgSend(v2, "dragDestinationDelegate"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else if ((objc_msgSend(v2, "_dragAndDropNeededForReordering") & 1) == 0)
    {
      goto LABEL_13;
    }
    +[_UICollectionViewDragDestinationController controllerForCollectionView:delegate:]((uint64_t)_UICollectionViewDragDestinationController, v2, a1);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = a1[6];
    a1[6] = (id)v9;

LABEL_13:
  }
}

- (void)didUpdateDataSource
{
  if (a1)
  {
    if (!*(_QWORD *)(a1 + 56))
      -[_UICollectionViewDragAndDropController didUpdateDragDelegate]((id *)a1);
    if (!*(_QWORD *)(a1 + 48))
      -[_UICollectionViewDragAndDropController didUpdateDropDelegate]((id *)a1);
  }
}

- (void)setDragInteractionEnabled:(uint64_t)a1
{
  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 40) != (_DWORD)a2)
    {
      *(_BYTE *)(a1 + 40) = a2;
      -[_UICollectionViewDragSourceController setDragInteractionEnabled:](*(_QWORD *)(a1 + 56), a2);
    }
  }
}

- (BOOL)isDragDestinationInteractivelyReordering
{
  return -[_UICollectionViewDragDestinationController supportsLocalSessionReordering]((id *)&self->_destinationController->super.isa);
}

- (id)indexPathForDragAndDropInsertion
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 168), "firstObject");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    if (v1)
    {
      objc_msgSend(v1, "targetIndexPath");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)_shouldPerformTranslationForDelegateBasedFlowLayoutSizing
{
  return !self || self->_sessionKind != 1;
}

- (id)_dropCoordinatorItemForDragItem:(id)a3
{
  id v4;
  NSMutableArray *dropCoordinatorItems;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  if (self)
    dropCoordinatorItems = self->_dropCoordinatorItems;
  else
    dropCoordinatorItems = 0;
  v6 = dropCoordinatorItems;
  v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "dragItem", (_QWORD)v13);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          v7 = v10;
          goto LABEL_13;
        }
      }
      v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  return v7;
}

- (id)_cellForDropCoordinatorItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "destinationIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "destinationIndexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_cellForItemAtIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_incrementSessionRefCount
{
  if (self)
    ++self->_sessionRefCount;
}

- (void)_decrementSessionRefCount
{
  int64_t sessionRefCount;

  if (!self)
    goto LABEL_5;
  sessionRefCount = self->_sessionRefCount;
  if (sessionRefCount >= 1)
    self->_sessionRefCount = --sessionRefCount;
  if (!sessionRefCount)
LABEL_5:
    -[_UICollectionViewDragAndDropController _cleanupAfterOutstandingSessionCompletion](self, "_cleanupAfterOutstandingSessionCompletion");
}

- (void)_cleanupAfterOutstandingSessionCompletion
{
  _BOOL4 v3;
  _UICollectionViewSubviewCollection *viewsWithAppearanceUpdates;

  if (dyld_program_sdk_at_least())
  {
    v3 = -[_UICollectionViewDragAndDropController hasShadowUpdates](self);
    if (self)
    {
      if (self->_sessionKind == 3 && v3)
        -[_UICollectionViewDragDestinationController dropWasCancelled]((uint64_t)self->_destinationController);
    }
  }
  -[_UICollectionViewSubviewCollection enumerateCellsWithEnumerator:]((uint64_t)self->_viewsWithAppearanceUpdates, (uint64_t)&__block_literal_global_49_0);
  viewsWithAppearanceUpdates = self->_viewsWithAppearanceUpdates;
  if (viewsWithAppearanceUpdates)
  {
    -[NSMutableDictionary removeAllObjects](viewsWithAppearanceUpdates->_cells, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](viewsWithAppearanceUpdates->_supplementaries, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](viewsWithAppearanceUpdates->_decorations, "removeAllObjects");
  }
  -[NSMutableDictionary removeAllObjects](self->_cellAppearanceStatesByIndexPaths, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_dropCoordinatorItems, "removeAllObjects");
  -[_UICollectionViewDragAndDropController setDropCoordinatorItemsMap:]((uint64_t)self);
  objc_storeStrong((id *)&self->_defaultAnimationHandlers, 0);
  -[_UICollectionViewDragAndDropController _removeAnyDeferredReuseCells](self, "_removeAnyDeferredReuseCells");
  self->_sessionKind = 0;
}

- (void)setDropCoordinatorItemsMap:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 128), 0);
}

- (void)_removeAnyDeferredReuseCells
{
  NSMutableSet *cellsDeferredForReuse;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSMutableSet *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  if (self)
    cellsDeferredForReuse = self->_cellsDeferredForReuse;
  else
    cellsDeferredForReuse = 0;
  v4 = cellsDeferredForReuse;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "visibleCells");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", v9);

        if ((v12 & 1) == 0)
        {
          -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_reuseCell:notifyDidEndDisplaying:", v9, 0);

        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  if (self)
    v14 = self->_cellsDeferredForReuse;
  else
    v14 = 0;
  -[NSMutableSet removeAllObjects](v14, "removeAllObjects", (_QWORD)v15);
}

- (void)rebaseCellAppearanceStatesForUpdates:(uint64_t)a1
{
  void (**v3)(id, _QWORD);
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _UICollectionViewSubviewCollection *v15;
  _QWORD *v16;
  _UICollectionViewSubviewCollection *v17;
  void *v18;
  _UICollectionViewSubviewCollection *v19;
  _QWORD v20[4];
  _UICollectionViewSubviewCollection *v21;
  void (**v22)(id, _QWORD);
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(*(id *)(a1 + 112), "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 112), "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v3[2](v3, v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v7);
    }

    v13 = *(void **)(a1 + 112);
    *(_QWORD *)(a1 + 112) = v4;
    v14 = v4;

    v15 = objc_alloc_init(_UICollectionViewSubviewCollection);
    v16 = *(_QWORD **)(a1 + 104);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __79___UICollectionViewDragAndDropController_rebaseCellAppearanceStatesForUpdates___block_invoke;
    v20[3] = &unk_1E16BE370;
    v22 = v3;
    v17 = v15;
    v21 = v17;
    -[_UICollectionViewSubviewCollection enumerateAllViewsWithEnumerator:](v16, (uint64_t)v20);
    v18 = *(void **)(a1 + 104);
    *(_QWORD *)(a1 + 104) = v17;
    v19 = v17;

  }
}

- (void)_updatePreferredDraggedCellAppearanceForSessionUpdate
{
  BOOL v3;
  uint64_t v4;
  _UICollectionViewDragDestinationController *destinationController;
  BOOL v6;
  uint64_t v7;
  char v8;
  char v9;
  void *v10;
  int *v11;
  NSMutableDictionary *cellAppearanceStatesByIndexPaths;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v3 = !self->_hasReorderedItemInSession;
    v4 = -[_UICollectionViewDragSourceController currentSessionItemCount](&self->_sourceController->super.isa);
    destinationController = self->_destinationController;
  }
  else
  {
    v4 = -[_UICollectionViewDragSourceController currentSessionItemCount](0);
    destinationController = 0;
    v3 = 1;
  }
  v6 = -[_UICollectionViewDragDestinationController supportsLocalSessionReordering]((id *)&destinationController->super.isa);
  v7 = -[_UICollectionViewDragAndDropController effectiveDragDestinationVisualStyle]((uint64_t)self);
  v8 = !v6;
  if (v7 == 2)
    v8 = 1;
  if (v4 > 1)
    v8 = 1;
  if (v3)
    v9 = 1;
  else
    v9 = v8;
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = &OBJC_IVAR____UIKeyboardStateManager_m_deferredDidSetDelegateAction;
  if (self)
    cellAppearanceStatesByIndexPaths = self->_cellAppearanceStatesByIndexPaths;
  else
    cellAppearanceStatesByIndexPaths = 0;
  -[NSMutableDictionary keyEnumerator](cellAppearanceStatesByIndexPaths, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v16);
        v18 = v11;
        if (self)
          v19 = *(Class *)((char *)&self->super.super.isa + v11[470]);
        else
          v19 = 0;
        objc_msgSend(v19, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v16));
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        if (v20)
          *(_BYTE *)(v20 + 10) = v9;
        objc_msgSend(v10, "cellForItemAtIndexPath:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UICollectionViewDragAndDropController updateAppearanceForCell:atIndexPath:]((uint64_t)self, v22, v17);

        ++v16;
        v11 = v18;
      }
      while (v14 != v16);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v14 = v23;
    }
    while (v23);
  }

}

- (void)_rollbackCurrentDropInsertion
{
  void *v3;
  NSUUID *currentDropInsertionShadowUpdateIdentifier;
  NSUUID *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    currentDropInsertionShadowUpdateIdentifier = self->_currentDropInsertionShadowUpdateIdentifier;
    if (currentDropInsertionShadowUpdateIdentifier)
    {
      v16 = v3;
      v5 = currentDropInsertionShadowUpdateIdentifier;
      -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICollectionViewShadowUpdatesController _findShadowUpdateForIdentifier:inShadowUpdates:](self, "_findShadowUpdateForIdentifier:inShadowUpdates:", v5, v6);
      v7 = objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 64;
        if (!*(_QWORD *)(v7 + 80))
          v9 = 72;
        v10 = *(id *)(v7 + v9);
        v11 = *(id *)(v7 + 88);
        objc_msgSend(v8, "finalIndexPathForIndexPath:startingAtUpdateWithIdentifier:", v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[_UICollectionViewDragAndDropController _resetReorderedItems](self, "_resetReorderedItems");
        -[_UICollectionViewDragDestinationController dropInsertionRolledBack]((uint64_t)self->_destinationController);
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __71___UICollectionViewDragAndDropController__rollbackCurrentDropInsertion__block_invoke;
        v17[3] = &unk_1E16B1B50;
        v18 = v16;
        v19 = v12;
        v13 = v12;
        v14 = (id)objc_msgSend(v18, "_performShadowUpdates:", v17);
        -[_UICollectionViewDragAndDropController setCurrentDropInsertionShadowUpdateIdentifier:]((uint64_t)self);
        -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeAllObjects");

        -[_UICollectionViewShadowUpdatesController _regenerateUpdateMap](self, "_regenerateUpdateMap");
      }

      v3 = v16;
    }
  }

}

- (BOOL)rebaseForUpdates:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void (**v8)(void *, void *);
  NSMutableArray *reorderedItems;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSMutableArray *dropCoordinatorItems;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSMutableArray *obj;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD aBlock[4];
  id v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[_UICollectionViewShadowUpdatesController _rebasedUpdateMapForUpdates:](self, "_rebasedUpdateMapForUpdates:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && -[_UICollectionViewShadowUpdatesController _rebaseForUpdateMap:](self, "_rebaseForUpdateMap:", v5))
    {
      if (self && self->_rebaseShadowUpdatesOnly)
      {
        v6 = 1;
      }
      else
      {
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __59___UICollectionViewDragAndDropController_rebaseForUpdates___block_invoke;
        aBlock[3] = &unk_1E16BDC20;
        v31 = v5;
        v43 = v31;
        v8 = (void (**)(void *, void *))_Block_copy(aBlock);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v30 = v5;
        if (self)
          reorderedItems = self->__reorderedItems;
        else
          reorderedItems = 0;
        obj = reorderedItems;
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
        if (v10)
        {
          v11 = v10;
          v33 = *(_QWORD *)v39;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v39 != v33)
                objc_enumerationMutation(obj);
              v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
              objc_msgSend(v13, "originalIndexPath", v30);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v8[2](v8, v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v15)
                goto LABEL_39;
              objc_msgSend(v13, "targetIndexPath");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v8[2](v8, v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v13, "setOriginalIndexPath:", v15);
              if (!v17)
              {
                objc_msgSend(v31, "finalSnapshot");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "targetIndexPath");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v18, "indexPathIsSectionAppendingInsert:", v19);

                if (!v20
                  || (objc_msgSend(v13, "targetIndexPath"), (v17 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
                {

LABEL_39:
                  v6 = 0;
                  goto LABEL_40;
                }
              }
              objc_msgSend(v13, "setTargetIndexPath:", v17);

            }
            v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
            if (v11)
              continue;
            break;
          }
        }

        -[_UICollectionViewDragAndDropController rebaseCellAppearanceStatesForUpdates:]((uint64_t)self, v8);
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        if (self)
          dropCoordinatorItems = self->_dropCoordinatorItems;
        else
          dropCoordinatorItems = 0;
        v22 = dropCoordinatorItems;
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v35;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v35 != v25)
                objc_enumerationMutation(v22);
              v27 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
              objc_msgSend(v27, "destinationIndexPath", v30);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (v28)
              {
                v8[2](v8, v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                if (v29)
                  objc_msgSend(v27, "setDestinationIndexPath:", v29);

              }
            }
            v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
          }
          while (v24);
        }

        -[_UICollectionViewDragAndDropController setPlaceholderContextsByIndexPath:]((uint64_t)self);
        -[_UICollectionViewDragSourceController rebaseForUpdates:](&self->_sourceController->super.isa, v8);
        -[_UICollectionViewDragDestinationController rebaseForUpdates:](&self->_destinationController->super.isa, v8);
        v6 = 1;
LABEL_40:

        v5 = v30;
      }
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (_QWORD)placeholderContextsByIndexPath
{
  _QWORD *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[11];
    if (!v2)
    {
      v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v4 = (void *)v1[11];
      v1[11] = v3;

      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      obj = (id)v1[12];
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v23;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v23 != v7)
              objc_enumerationMutation(obj);
            v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v8);
            if (v9)
              v10 = *(void **)(v9 + 8);
            else
              v10 = 0;
            v11 = v10;
            objc_msgSend(v1, "_shadowUpdates");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1, "_findShadowUpdateForIdentifier:inShadowUpdates:", v11, v12);
            v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              v14 = v13[10] ? 64 : 72;
              v15 = *(id *)((char *)v13 + v14);

              if (v15)
              {
                v16 = (void *)v1[11];
                if (v13[10])
                  v17 = 8;
                else
                  v17 = 9;
                v18 = (id)v13[v17];
                objc_msgSend(v16, "setObject:forKeyedSubscript:", v9, v18);

              }
            }

            ++v8;
          }
          while (v6 != v8);
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          v6 = v19;
        }
        while (v19);
      }

      v2 = (void *)v1[11];
    }
    a1 = v2;
  }
  return a1;
}

- (_QWORD)defaultAnimationHandlers
{
  _QWORD *v1;
  void *v2;
  _UIDropAnimationHandlers *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[19];
    if (!v2)
    {
      v3 = objc_alloc_init(_UIDropAnimationHandlers);
      v4 = (void *)v1[19];
      v1[19] = v3;

      v2 = (void *)v1[19];
    }
    a1 = v2;
  }
  return a1;
}

- (void)_updateCellAppearancesForItemsAtIndexPaths:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cellForItemAtIndexPath:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          -[_UICollectionViewDragAndDropController updateAppearanceForCell:atIndexPath:]((uint64_t)self, v11, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (BOOL)_removeMoveShadowUpdateMatchingReorderedItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  BOOL v18;
  _UICollectionViewDragAndDropController *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v20 = self;
    v8 = 0;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      v21 = v8;
      v22 = v7 + v8;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        if (objc_msgSend(v11, "updateAction") == 3)
        {
          objc_msgSend(v11, "indexPathBeforeUpdate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "originalIndexPath");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v12, "isEqual:", v13) & 1) != 0)
          {
            objc_msgSend(v11, "indexPathAfterUpdate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "targetIndexPath");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "isEqual:", v15);

            if (v16)
            {
              -[_UICollectionViewShadowUpdatesController _shadowUpdates](v20, "_shadowUpdates");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "removeObjectAtIndex:", v21 + v10);

              v18 = 1;
              goto LABEL_14;
            }
          }
          else
          {

          }
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v8 = v22;
    }
    while (v7);
  }
  v18 = 0;
LABEL_14:

  return v18;
}

- (id)_shadowUpdateReuseIdentifierForItemItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  _UICollectionViewPlaceholderContext *v7;
  _UICollectionViewPlaceholderContext *v8;
  _UICollectionViewPlaceholderContext *v9;
  _UICollectionViewPlaceholderContext *v10;
  _UICollectionViewPlaceholderContext *currentlyInsertingPlaceholderContext;
  NSIndexPath *v12;
  _UICollectionViewPlaceholderContext *v13;
  int v14;
  _UICollectionViewPlaceholderContext *v15;
  objc_super v17;

  v4 = a3;
  -[_UICollectionViewDragAndDropController placeholderContextsByIndexPath](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (_UICollectionViewPlaceholderContext *)v6[2];
  }
  else
  {
    if (!self)
      goto LABEL_11;
    v9 = self->_currentlyInsertingPlaceholderContext;
    if (!v9)
      goto LABEL_11;
    v10 = v9;
    currentlyInsertingPlaceholderContext = self->_currentlyInsertingPlaceholderContext;
    v12 = currentlyInsertingPlaceholderContext ? currentlyInsertingPlaceholderContext->_originalInsertionIndexPath : 0;
    v13 = currentlyInsertingPlaceholderContext;
    v14 = -[NSIndexPath isEqual:](v12, "isEqual:", v4);

    if (!v14)
    {
LABEL_11:
      v17.receiver = self;
      v17.super_class = (Class)_UICollectionViewDragAndDropController;
      -[_UICollectionViewShadowUpdatesController _shadowUpdateReuseIdentifierForItemItemAtIndexPath:](&v17, sel__shadowUpdateReuseIdentifierForItemItemAtIndexPath_, v4);
      v8 = (_UICollectionViewPlaceholderContext *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v7 = self->_currentlyInsertingPlaceholderContext;
    if (v7)
      v7 = (_UICollectionViewPlaceholderContext *)v7->_reuseIdentifier;
  }
  v8 = v7;
LABEL_12:
  v15 = v8;

  return v15;
}

- (void)_updateCellIfNeeded:(id)a3 atIndexPath:(id)a4
{
  id v6;
  _UICollectionViewPlaceholderContext *currentlyInsertingPlaceholderContext;
  id *v8;
  int v9;
  _UICollectionViewPlaceholderContext *v10;
  void *v11;
  void (**cellUpdateHandler)(id, id);
  id v13;

  v13 = a3;
  v6 = a4;
  if (v13 && v6)
  {
    if (self)
    {
      currentlyInsertingPlaceholderContext = self->_currentlyInsertingPlaceholderContext;
      if (currentlyInsertingPlaceholderContext)
      {
        v8 = currentlyInsertingPlaceholderContext;
        v9 = objc_msgSend(v8[3], "isEqual:", v6);

        if (v9)
        {
          v10 = self->_currentlyInsertingPlaceholderContext;
          if (v10)
            goto LABEL_8;
        }
      }
    }
    -[_UICollectionViewDragAndDropController placeholderContextsByIndexPath](self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v6);
    v10 = (_UICollectionViewPlaceholderContext *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
LABEL_8:
      cellUpdateHandler = (void (**)(id, id))v10->_cellUpdateHandler;
      if (cellUpdateHandler)
        cellUpdateHandler[2](cellUpdateHandler, v13);
    }

  }
}

- (BOOL)_deleteShadowUpdateWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;

  v4 = a3;
  -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController _findShadowUpdateForIdentifier:inShadowUpdates:](self, "_findShadowUpdateForIdentifier:inShadowUpdates:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (-[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v6),
        v7,
        v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectAtIndex:", v8);

    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_cellAppearanceStateForIndexPath:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *cellAppearanceStatesByIndexPaths;
  _UICollectionViewCellAppearanceState *v7;
  NSMutableDictionary *v8;

  v4 = a3;
  -[_UICollectionViewShadowUpdatesController indexPathBeforeShadowUpdates:](self, "indexPathBeforeShadowUpdates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (self)
      cellAppearanceStatesByIndexPaths = self->_cellAppearanceStatesByIndexPaths;
    else
      cellAppearanceStatesByIndexPaths = 0;
    -[NSMutableDictionary objectForKeyedSubscript:](cellAppearanceStatesByIndexPaths, "objectForKeyedSubscript:", v4);
    v7 = (_UICollectionViewCellAppearanceState *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(_UICollectionViewCellAppearanceState);
      if (self)
        v8 = self->_cellAppearanceStatesByIndexPaths;
      else
        v8 = 0;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v4);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_addDropCoordinatorItem:(id)a3
{
  _UICollectionViewDragAndDropController *v3;

  v3 = self;
  if (self)
    self = (_UICollectionViewDragAndDropController *)self->_dropCoordinatorItems;
  -[_UICollectionViewDragAndDropController addObject:](self, "addObject:", a3);
  -[_UICollectionViewDragAndDropController setDropCoordinatorItemsMap:]((uint64_t)v3);
}

- (id)_presentationIndexPathForIndexPath:(id)a3 allowingAppendingInserts:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  v4 = a4;
  v6 = a3;
  if (!v6)
    goto LABEL_6;
  -[_UICollectionViewShadowUpdatesController indexPathAfterShadowUpdates:](self, "indexPathAfterShadowUpdates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 && v4)
  {
    -[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "initialSnapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "indexPathIsSectionAppendingInsert:", v6);

    if (v10)
    {
      -[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "finalSnapshot");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "indexPathForAppendingInsertInSection:", objc_msgSend(v6, "section"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
LABEL_6:
    v7 = 0;
  }
LABEL_7:

  return v7;
}

- (void)_addAnimationHandlers:(id)a3 toAnimator:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v5, "alongsideAnimationHandlers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addAnimations:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "completionHandlers", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v6, "addCompletion:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (void)_invokeAllCompletionHandlers
{
  NSMutableArray *dropCoordinatorItems;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableSet *placeholderContexts;
  NSMutableSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  if (self)
    dropCoordinatorItems = self->_dropCoordinatorItems;
  else
    dropCoordinatorItems = 0;
  v4 = dropCoordinatorItems;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "animationHandlers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "invokeAllCompletionHandlers");

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  if (self)
    placeholderContexts = self->_placeholderContexts;
  else
    placeholderContexts = 0;
  v11 = placeholderContexts;
  v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15);
        if (v16)
          v17 = *(void **)(v16 + 40);
        else
          v17 = 0;
        objc_msgSend(v17, "invokeAllCompletionHandlers", (_QWORD)v20);
        ++v15;
      }
      while (v13 != v15);
      v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      v13 = v18;
    }
    while (v18);
  }

  -[_UICollectionViewDragAndDropController defaultAnimationHandlers](self);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "invokeAllCompletionHandlers");

}

- (void)_resetAllAnimationHandlers
{
  NSMutableArray *dropCoordinatorItems;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableSet *placeholderContexts;
  NSMutableSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  if (self)
    dropCoordinatorItems = self->_dropCoordinatorItems;
  else
    dropCoordinatorItems = 0;
  v4 = dropCoordinatorItems;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "animationHandlers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "resetAllAnimationHandlers");

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  if (self)
    placeholderContexts = self->_placeholderContexts;
  else
    placeholderContexts = 0;
  v11 = placeholderContexts;
  v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15);
        if (v16)
          v17 = *(void **)(v16 + 40);
        else
          v17 = 0;
        objc_msgSend(v17, "resetAllAnimationHandlers", (_QWORD)v20);
        ++v15;
      }
      while (v13 != v15);
      v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      v13 = v18;
    }
    while (v18);
  }

  -[_UICollectionViewDragAndDropController defaultAnimationHandlers](self);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "resetAllAnimationHandlers");

}

- (void)dragSourceController:(void *)a3 willBeginLiftForItemsAtIndexPaths:
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  _BYTE *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (a1)
  {
    objc_msgSend(a1, "_incrementSessionRefCount");
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(a1, "_cellAppearanceStateForIndexPath:", v11, (_QWORD)v14);
          v12 = (_BYTE *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12 && !v12[8])
          {
            objc_msgSend(v12, "setDragState:", 1);
            objc_msgSend(v5, "addObject:", v11);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    objc_msgSend(a1, "_updateCellAppearancesForItemsAtIndexPaths:", v5);
  }

}

- (void)dragSourceController:(void *)a3 didCompleteLiftForItemsAtIndexPaths:
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  _BYTE *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (a1)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(a1, "_cellAppearanceStateForIndexPath:", v11, (_QWORD)v14);
          v12 = (_BYTE *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12 && !v12[8])
          {
            objc_msgSend(v12, "setDragState:", 3);
            objc_msgSend(v13, "setHasLifted:", 1);
            objc_msgSend(v5, "addObject:", v11);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    objc_msgSend(a1, "_updateCellAppearancesForItemsAtIndexPaths:", v5);
    objc_msgSend(a1, "_decrementSessionRefCount");

  }
}

- (void)dragSourceController:(void *)a3 didCancelLiftForItemsAtIndexPaths:
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (a1)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(a1, "_cellAppearanceStateForIndexPath:", v11, (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "setDragState:", 8);
            objc_msgSend(v5, "addObject:", v11);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    objc_msgSend(a1, "_updateCellAppearancesForItemsAtIndexPaths:", v5);
    objc_msgSend(a1, "_decrementSessionRefCount");

  }
}

- (void)dragSourceController:(void *)a3 didUpdateItemsAtIndexPaths:
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  if (a1)
  {
    v6 = v4;
    if (objc_msgSend(a1, "isDragDestinationInteractivelyReordering"))
    {
      v5 = objc_msgSend(v6, "count");
      if (v5 >= 2)
        -[_UICollectionViewDragDestinationController dragSourceSelectedItemCountDidChangeWithCount:](a1[6], v5);
    }
    objc_msgSend(a1, "_updateCellAppearancesForItemsAtIndexPaths:", v6);
    v4 = v6;
  }

}

- (void)dragSourceController:(id *)a1 didEndForItemsAtIndexPaths:
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1[14], "keyEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v4)
    goto LABEL_17;
  v5 = v4;
  v6 = *(_QWORD *)v12;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(v3);
      v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
      objc_msgSend(a1[14], "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (!v9)
        goto LABEL_14;
      if (objc_msgSend(v9, "dragState") != 4
        && objc_msgSend(v10, "dragState") != 5
        && objc_msgSend(v10, "dragState") != 7
        && objc_msgSend(v10, "dragState") != 6
        && objc_msgSend(v10, "dragState") != 8)
      {
        objc_msgSend(v10, "setDragState:", 8);
LABEL_14:
        objc_msgSend(v2, "addObject:", v8);
      }

    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  }
  while (v5);
LABEL_17:

  if (objc_msgSend(v2, "count"))
    objc_msgSend(a1, "_updateCellAppearancesForItemsAtIndexPaths:", v2);
  objc_msgSend(a1, "_decrementSessionRefCount");

}

- (void)dragSourceController:(void *)a1 didSupplyCancellationPreviewForItemAtIndexPath:
{
  void *v1;
  id v2;

  if (a1)
  {
    objc_msgSend(a1, "_cellAppearanceStateForIndexPath:");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1)
    {
      v2 = v1;
      objc_msgSend(v1, "setHasBeganCancelling:", 1);
      v1 = v2;
    }

  }
}

- (void)dragSourceController:(void *)a3 willBeginAnimatingCancelForItemsAtIndexPaths:(void *)a4 withAnimator:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  _BYTE *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id *v29;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v6 = a4;
  if (!a1)
    goto LABEL_25;
  objc_msgSend(a1, "_incrementSessionRefCount");
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(a1[14], "keyEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (!v9)
    goto LABEL_13;
  v10 = v9;
  v11 = *(_QWORD *)v39;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v39 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
      objc_msgSend(a1[14], "objectForKeyedSubscript:", v13);
      v14 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        if (v14[9])
          goto LABEL_11;
        objc_msgSend(v14, "setDragState:", 7);
      }
      objc_msgSend(v7, "addObject:", v13);
LABEL_11:

    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  }
  while (v10);
LABEL_13:

  v16 = objc_msgSend(v7, "count");
  v17 = MEMORY[0x1E0C809B0];
  if (v16)
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __121___UICollectionViewDragAndDropController_dragSourceController_willBeginAnimatingCancelForItemsAtIndexPaths_withAnimator___block_invoke;
    v36[3] = &unk_1E16B1B50;
    v36[4] = a1;
    v37 = v7;
    objc_msgSend(v6, "addAnimations:", v36);

  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v18 = v26;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(a1, "_cellAppearanceStateForIndexPath:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
          objc_msgSend(v23, "setDragState:", 6);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v20);
  }

  v30[0] = v17;
  v30[1] = 3221225472;
  v30[2] = __121___UICollectionViewDragAndDropController_dragSourceController_willBeginAnimatingCancelForItemsAtIndexPaths_withAnimator___block_invoke_2;
  v30[3] = &unk_1E16B1B50;
  v30[4] = a1;
  v25 = v18;
  v31 = v25;
  objc_msgSend(v6, "addAnimations:", v30);
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __121___UICollectionViewDragAndDropController_dragSourceController_willBeginAnimatingCancelForItemsAtIndexPaths_withAnimator___block_invoke_3;
  v27[3] = &unk_1E16BE3C0;
  v28 = v25;
  v29 = a1;
  objc_msgSend(v6, "addCompletion:", v27);

LABEL_25:
}

- (void)dragDestinationController:(void *)a3 willBeginDropAnimationForDragItem:(void *)a4 animator:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id *v21;
  uint64_t v22;
  id *i;
  void *v24;
  id v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (a1)
  {
    objc_msgSend(a1, "_incrementSessionRefCount");
    objc_msgSend(a1, "_dropCoordinatorItemForDragItem:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
LABEL_27:

      goto LABEL_28;
    }
    objc_msgSend(v8, "destinationIndexPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
LABEL_13:
      objc_msgSend(v9, "animationHandlers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_addAnimationHandlers:toAnimator:", v17, v7);

      objc_msgSend(v9, "animationHandlers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "resetAllAnimationHandlers");

      v19 = v6;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v20 = a1[12];
      v21 = (id *)objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v21)
      {
        v26 = v10;
        v27 = v7;
        v22 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v21; i = (id *)((char *)i + 1))
          {
            if (*(_QWORD *)v29 != v22)
              objc_enumerationMutation(v20);
            v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v24, "dragItem", v26, v27, (_QWORD)v28);
            v25 = (id)objc_claimAutoreleasedReturnValue();

            if (v25 == v19)
            {
              v21 = v24;
              goto LABEL_23;
            }
          }
          v21 = (id *)objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
          if (v21)
            continue;
          break;
        }
LABEL_23:
        v10 = v26;
        v7 = v27;
      }

      if (v21)
      {
        objc_msgSend(a1, "_addAnimationHandlers:toAnimator:", v21[5], v7);
        objc_msgSend(v21[5], "resetAllAnimationHandlers");
      }

      goto LABEL_27;
    }
    objc_msgSend(a1, "indexPathBeforeShadowUpdates:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(a1, "_cellAppearanceStateForIndexPath:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (!v12 || objc_msgSend(v12, "dragState") == 5)
        goto LABEL_12;
      objc_msgSend(v13, "setDragState:", 4);
      v32 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_updateCellAppearancesForItemsAtIndexPaths:", v14);
    }
    else
    {
      objc_msgSend(a1, "collectionView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_cellForItemAtIndexPath:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_cellAppearanceStateForIndexPath:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v16;
      if (v16)
        objc_msgSend(v16, "setDragState:", 4);
      -[_UICollectionViewDragAndDropController updateAppearanceForCell:atIndexPath:]((uint64_t)a1, v13, v10);
    }

LABEL_12:
    goto LABEL_13;
  }
LABEL_28:

}

- (void)dragDestinationController:(void *)a1 didCompleteDropAnimationForDragItem:
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "_dropCoordinatorItemForDragItem:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "destinationIndexPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_msgSend(a1, "indexPathBeforeShadowUpdates:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          objc_msgSend(a1, "_cellAppearanceStateForIndexPath:", v4);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v6;
          if (v6)
            objc_msgSend(v6, "setDragState:", 7);

          v12[0] = v4;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_updateCellAppearancesForItemsAtIndexPaths:", v8);
        }
        else
        {
          objc_msgSend(a1, "collectionView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_cellForItemAtIndexPath:", v4);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(a1, "_cellAppearanceStateForIndexPath:", v4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
            objc_msgSend(v10, "setDragState:", 7);
          -[_UICollectionViewDragAndDropController updateAppearanceForCell:atIndexPath:]((uint64_t)a1, v8, v4);

        }
      }

    }
    objc_msgSend(a1, "_decrementSessionRefCount");

  }
}

- (void)dragDestinationControllerSessionDidEnter:(int)a3 isNewSession:(int)a4 isResuming:
{
  int *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id *v12;

  v12 = a2;
  if (a1)
  {
    if ((a3 & 1) != 0 || a4)
    {
      v7 = &OBJC_IVAR____UIKeyboardStateManager_m_deferredDidSetDelegateAction;
      if ((a4 & 1) == 0 && a1[8])
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_dragDestinationControllerSessionDidEnter_isNewSession_isResuming_, a1, CFSTR("_UICollectionViewDragAndDropController.m"), 1254, CFSTR("UICollectionView internal inconsistency: attempted to enter new reordering session whilst an existing session was active. Collection view: %@"), v11);

        v7 = &OBJC_IVAR____UIKeyboardStateManager_m_deferredDidSetDelegateAction;
      }
      v8 = -[_UICollectionViewDragDestinationController supportsLocalSessionReordering](v12);
      v9 = 2;
      if (!v8)
        v9 = 3;
      *(_QWORD *)((char *)a1 + v7[477]) = v9;
      if (a3)
        objc_msgSend(a1, "_incrementSessionRefCount");
    }
    objc_msgSend(a1, "_updatePreferredDraggedCellAppearanceForSessionUpdate");
  }

}

- (NSIndexPath)destinationIndexPath
{
  _QWORD *p_isa;

  p_isa = &self->_destinationController->super.isa;
  if (p_isa)
  {
    -[_UICollectionViewDragDestinationController currentIndexPath](p_isa);
    p_isa = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return (NSIndexPath *)p_isa;
}

- (id)sourceIndexPaths
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (a1)
  {
    v1 = *(_QWORD **)(a1 + 56);
    v2 = (void *)MEMORY[0x1E0C9AA60];
    if (v1)
    {
      -[_UICollectionViewDragSourceController dragFromIndexPaths](v1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v3, "copy");

    }
    else
    {
      v4 = (void *)MEMORY[0x1E0C9AA60];
    }
    if (v4)
      v5 = v4;
    else
      v5 = v2;
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (int64_t)numberOfSections
{
  void *v2;
  void *v3;
  int64_t v4;

  -[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finalSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  return v4;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfItemsInSection:", a3);

  return v6;
}

- (id)insertPlaceholderForItemAtIndexPath:(id)a3 forDragItem:(id)a4 reuseIdentifier:(id)a5 cellUpdateHandler:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  _UICollectionViewPlaceholderContext *v16;
  id v17;
  id v18;
  id v19;
  _UICollectionViewDragAndDropController *v20;
  id v21;
  _UICollectionViewDragAndDropController *v22;
  uint64_t v23;
  NSMutableArray *shadowUpdates;
  _UIDropAnimationHandlers *v25;
  void *v26;
  NSMutableSet *placeholderContexts;
  void *v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  objc_super v42;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewDragAndDropController.m"), 1313, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath != nil"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewDragAndDropController.m"), 1314, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reuseIdentifier != nil"));

LABEL_3:
  v16 = [_UICollectionViewPlaceholderContext alloc];
  v17 = v12;
  v18 = v13;
  v19 = v14;
  v20 = self;
  v21 = v15;
  if (v16)
  {
    v42.receiver = v16;
    v42.super_class = (Class)_UICollectionViewPlaceholderContext;
    v22 = -[_UICollectionViewDragAndDropController init](&v42, sel_init);
    if (v22)
    {
      v23 = objc_msgSend(v21, "copy");
      shadowUpdates = v22->super.__shadowUpdates;
      v22->super.__shadowUpdates = (NSMutableArray *)v23;

      objc_storeStrong((id *)&v22->super._updateMap, a3);
      objc_storeStrong((id *)&v22->_sourceController, a4);
      objc_storeStrong((id *)&v22->super._initialSnapshot, a5);
      objc_storeWeak((id *)&v22->_destinationController, v20);
      v25 = objc_alloc_init(_UIDropAnimationHandlers);
      v26 = *(void **)&v22->_dragInteractionEnabled;
      *(_QWORD *)&v22->_dragInteractionEnabled = v25;

    }
  }
  else
  {
    v22 = 0;
  }

  if (v20)
    placeholderContexts = v20->_placeholderContexts;
  else
    placeholderContexts = 0;
  -[NSMutableSet addObject:](placeholderContexts, "addObject:", v22);
  -[_UICollectionViewShadowUpdatesController collectionView](v20, "collectionView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewDragAndDropController setCurrentlyInsertingPlaceholderContext:]((uint64_t)v20, v22);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __124___UICollectionViewDragAndDropController_insertPlaceholderForItemAtIndexPath_forDragItem_reuseIdentifier_cellUpdateHandler___block_invoke;
  v39[3] = &unk_1E16B1B50;
  v40 = v28;
  v41 = v17;
  v29 = v17;
  v30 = v28;
  objc_msgSend(v30, "_performShadowUpdates:", v39);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewDragAndDropController setCurrentlyInsertingPlaceholderContext:]((uint64_t)v20, 0);
  -[_UICollectionViewDragAndDropController setPlaceholderContextsByIndexPath:]((uint64_t)v20);
  objc_msgSend(v31, "firstObject");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  if (v32)
    v34 = *(void **)(v32 + 88);
  else
    v34 = 0;
  v35 = v34;
  if (v22)
    objc_storeStrong((id *)&v22->super._collectionView, v34);

  return v22;
}

- (void)setCurrentlyInsertingPlaceholderContext:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 80), a2);
}

- (id)placeholderContextDidDismiss:(id)a3
{
  _QWORD *v4;
  NSMutableSet *placeholderContexts;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  char v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;

  v4 = a3;
  if (self)
  {
    if (!-[NSMutableSet containsObject:](self->_placeholderContexts, "containsObject:", v4))
    {
      v16 = 0;
      goto LABEL_15;
    }
    placeholderContexts = self->_placeholderContexts;
  }
  else
  {
    v25 = objc_msgSend(0, "containsObject:", v4);
    placeholderContexts = 0;
    v16 = 0;
    if ((v25 & 1) == 0)
      goto LABEL_15;
  }
  -[NSMutableSet removeObject:](placeholderContexts, "removeObject:", v4);
  -[_UICollectionViewDragAndDropController setPlaceholderContextsByIndexPath:]((uint64_t)self);
  if (v4)
    v6 = (void *)v4[1];
  else
    v6 = 0;
  v7 = v6;
  -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController _findShadowUpdateForIdentifier:inShadowUpdates:](self, "_findShadowUpdateForIdentifier:inShadowUpdates:", v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 64;
    if (!*(_QWORD *)(v9 + 80))
      v12 = 72;
    v13 = *(id *)(v9 + v12);
    v14 = *(id *)(v9 + 88);
    objc_msgSend(v11, "finalIndexPathForIndexPath:startingAtUpdateWithIdentifier:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __71___UICollectionViewDragAndDropController_placeholderContextDidDismiss___block_invoke;
    v29 = &unk_1E16B1B50;
    v30 = v10;
    v16 = v15;
    v31 = v16;
    v17 = v10;
    objc_msgSend(v17, "_performShadowUpdates:", &v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject", v26, v27, v28, v29);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = *(void **)(v19 + 88);
    else
      v21 = 0;
    v22 = v21;
    -[_UICollectionViewDragAndDropController _deleteShadowUpdateWithIdentifier:](self, "_deleteShadowUpdateWithIdentifier:", v22);

    -[_UICollectionViewShadowUpdatesController _regenerateUpdateMap](self, "_regenerateUpdateMap");
    v23 = *(id *)(v9 + 88);
    -[_UICollectionViewShadowUpdatesController _pruneAndRebaseShadowUpdatesForShadowInsertWithIdentifier:](self, "_pruneAndRebaseShadowUpdatesForShadowInsertWithIdentifier:", v23);

    -[_UICollectionViewShadowUpdatesController _regenerateUpdateMap](self, "_regenerateUpdateMap");
  }
  else
  {
    v16 = 0;
  }

LABEL_15:
  return v16;
}

- (void)placeholderContextNeedsCellUpdate:(id)a3
{
  _QWORD *v5;
  NSMutableSet *placeholderContexts;
  void *v7;
  id v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self)
    placeholderContexts = self->_placeholderContexts;
  else
    placeholderContexts = 0;
  if (-[NSMutableSet containsObject:](placeholderContexts, "containsObject:", v5))
  {
    if (v5)
      v7 = (void *)v5[1];
    else
      v7 = 0;
    v8 = v7;
    -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewShadowUpdatesController _findShadowUpdateForIdentifier:inShadowUpdates:](self, "_findShadowUpdateForIdentifier:inShadowUpdates:", v8, v9);
    v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_25;
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 8;
    if (!v10[10])
      v12 = 9;
    v13 = (id)v10[v12];
    objc_msgSend(v11, "_cellForItemAtIndexPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = dyld_program_sdk_at_least();
      objc_msgSend(v14, "reuseIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v15)
      {
        if (v5)
          v18 = v5[2];
        else
          v18 = 0;
        v19 = objc_msgSend(v16, "isEqualToString:", v18);

        if ((v19 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "reuseIdentifier");
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)v21;
          if (v5)
            v23 = v5[2];
          else
            v23 = 0;
          objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewDragAndDropController.m"), 1384, CFSTR("Error: cell reuseIdentifier (%@) does not match expected placeholder context reuseIdentifier (%@). Please file a bug against UICollectionView."), v21, v23);

          if (!v5)
            goto LABEL_24;
          goto LABEL_22;
        }
      }
      else
      {
        if (v5)
          v24 = v5[2];
        else
          v24 = 0;
        v25 = objc_msgSend(v16, "isEqualToString:", v24);

        if ((v25 & 1) == 0)
        {
          v27 = placeholderContextNeedsCellUpdate____s_category;
          if (!placeholderContextNeedsCellUpdate____s_category)
          {
            v27 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v27, (unint64_t *)&placeholderContextNeedsCellUpdate____s_category);
          }
          v28 = *(id *)(v27 + 8);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v14, "reuseIdentifier");
            v29 = objc_claimAutoreleasedReturnValue();
            v30 = (void *)v29;
            if (v5)
              v31 = v5[2];
            else
              v31 = 0;
            *(_DWORD *)buf = 138412546;
            v33 = v29;
            v34 = 2112;
            v35 = v31;
            _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_ERROR, "Error: cell reuseIdentifier (%@) does not match expected placeholder context reuseIdentifier (%@). Please file a bug against UICollectionView.", buf, 0x16u);

          }
          if (!v5)
            goto LABEL_24;
          goto LABEL_22;
        }
      }
      if (v5)
      {
LABEL_22:
        v26 = v5[4];
        if (v26)
          (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v14);
      }
    }
LABEL_24:

LABEL_25:
  }

}

- (BOOL)placeholderContext:(id)a3 didCommitInsertionWithDataSourceUpdates:(id)a4
{
  _QWORD *v7;
  id v8;
  NSMutableSet *placeholderContexts;
  int v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  UICollectionViewUpdateItem *v21;
  void *v22;
  void *v23;
  BOOL rebaseShadowUpdatesOnly;
  UICollectionViewUpdateItem *v25;
  id v26;
  id v27;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  UICollectionViewUpdateItem *v34;
  id v35;

  v7 = a3;
  v8 = a4;
  if (self)
    placeholderContexts = self->_placeholderContexts;
  else
    placeholderContexts = 0;
  v10 = -[NSMutableSet containsObject:](placeholderContexts, "containsObject:", v7);
  if (v10)
  {
    -[_UICollectionViewDragAndDropController placeholderContextNeedsCellUpdate:](self, "placeholderContextNeedsCellUpdate:", v7);
    if (v7)
      v11 = (void *)v7[1];
    else
      v11 = 0;
    v12 = v11;
    -[_UICollectionViewShadowUpdatesController _shadowUpdates](self, "_shadowUpdates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewShadowUpdatesController _findShadowUpdateForIdentifier:inShadowUpdates:](self, "_findShadowUpdateForIdentifier:inShadowUpdates:", v12, v13);
    v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    -[_UICollectionViewShadowUpdatesController updateMap](self, "updateMap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewUpdateItem _indexPath](v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v17 = (void *)v14[11];
    else
      v17 = 0;
    v18 = v17;
    objc_msgSend(v15, "initialIndexPathForIndexPath:beforeUpdateWithIdentifier:", v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewDragAndDropController.m"), 1401, CFSTR("UICollectionView internal inconsistency exception: could not locate placeholder insertion location; this should never be nil."));

    }
    v30 = v8;
    -[_UICollectionViewDragAndDropController placeholderContextDidDismiss:](self, "placeholderContextDidDismiss:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[UICollectionViewUpdateItem initWithAction:forIndexPath:]([UICollectionViewUpdateItem alloc], "initWithAction:forIndexPath:", 0, v20);
    -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (self)
    {
      rebaseShadowUpdatesOnly = self->_rebaseShadowUpdatesOnly;
      self->_rebaseShadowUpdatesOnly = 1;
    }
    else
    {
      rebaseShadowUpdatesOnly = 0;
    }
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __101___UICollectionViewDragAndDropController_placeholderContext_didCommitInsertionWithDataSourceUpdates___block_invoke;
    v31[3] = &unk_1E16BE398;
    v32 = v22;
    v33 = v19;
    v34 = v21;
    v35 = v30;
    v25 = v21;
    v26 = v19;
    v27 = v23;
    objc_msgSend(v27, "_performInternalBatchUpdates:", v31);
    if (self)
      self->_rebaseShadowUpdatesOnly = rebaseShadowUpdatesOnly;

    v8 = v30;
  }

  return v10;
}

- (void)_performCancelDropToIndexPath:(void *)a3 forDragItem:
{
  id v5;
  id v6;
  _UICollectionViewDropCoordinatorItem *v7;

  if (a1)
  {
    v5 = a3;
    v6 = a2;
    v7 = -[_UICollectionViewDropCoordinatorItem initWithDestinationIndexPath:dragItem:]([_UICollectionViewDropCoordinatorItem alloc], "initWithDestinationIndexPath:dragItem:", v6, v5);

    -[_UICollectionViewDropCoordinatorItem setShouldRemainInHierarchy:](v7, "setShouldRemainInHierarchy:", 1);
    objc_msgSend(a1, "_addDropCoordinatorItem:", v7);

  }
}

- (NSArray)items
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  _UICollectionViewDropItem *v12;
  _UICollectionViewDropItem *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[_UICollectionViewDragDestinationController currentDropSession](&self->_destinationController->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[_UICollectionViewDragSourceController indexPathForDragItem:]((id *)&self->_sourceController->super.isa, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = [_UICollectionViewDropItem alloc];
        objc_msgSend(v10, "_visibleDropItemSize");
        v13 = -[_UICollectionViewDropItem initWithDragItem:previewSize:sourceIndexPath:](v12, "initWithDragItem:previewSize:sourceIndexPath:", v10, v11);
        objc_msgSend(v3, "addObject:", v13);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (id)dropItem:(id)a3 toPlaceholderInsertedAtIndexPath:(id)a4 withReuseIdentifier:(id)a5 cellUpdateHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  UICollectionViewDropPlaceholder *v15;
  void *v16;
  void *v18;

  v11 = a3;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewDragAndDropController.m"), 1457, CFSTR("Please pass an object of type UIDragItem."));

  }
  v15 = -[UICollectionViewPlaceholder initWithInsertionIndexPath:reuseIdentifier:]([UICollectionViewDropPlaceholder alloc], "initWithInsertionIndexPath:reuseIdentifier:", v14, v13);

  -[UICollectionViewPlaceholder setCellUpdateHandler:](v15, "setCellUpdateHandler:", v12);
  -[_UICollectionViewDragAndDropController dropItem:toPlaceholder:](self, "dropItem:toPlaceholder:", v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)dropItem:(id)a3 toPlaceholder:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _UICollectionViewDropCoordinatorItem *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewDragAndDropController.m"), 1465, CFSTR("Please pass an object of type UIDragItem."));

  }
  objc_msgSend(v8, "insertionIndexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewDragAndDropController _presentationIndexPathForIndexPath:allowingAppendingInserts:](self, "_presentationIndexPathForIndexPath:allowingAppendingInserts:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[_UICollectionViewDropCoordinatorItem initWithDestinationIndexPath:dragItem:placeholderConfiguration:]([_UICollectionViewDropCoordinatorItem alloc], "initWithDestinationIndexPath:dragItem:placeholderConfiguration:", v10, v7, v8);
  -[_UICollectionViewDragAndDropController _addDropCoordinatorItem:](self, "_addDropCoordinatorItem:", v11);
  objc_msgSend(v8, "cellReuseIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellUpdateHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UICollectionViewDragAndDropController insertPlaceholderForItemAtIndexPath:forDragItem:reuseIdentifier:cellUpdateHandler:](self, "insertPlaceholderForItemAtIndexPath:forDragItem:reuseIdentifier:cellUpdateHandler:", v10, v7, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)dropItem:(id)a3 toItemAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _UICollectionViewDropCoordinatorItem *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewDragAndDropController.m"), 1477, CFSTR("Please pass an object of type UIDragItem."));

  }
  -[_UICollectionViewDragAndDropController _presentationIndexPathForIndexPath:allowingAppendingInserts:](self, "_presentationIndexPathForIndexPath:allowingAppendingInserts:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_UICollectionViewDropCoordinatorItem initWithDestinationIndexPath:dragItem:]([_UICollectionViewDropCoordinatorItem alloc], "initWithDestinationIndexPath:dragItem:", v9, v7);
  -[_UICollectionViewDragAndDropController _addDropCoordinatorItem:](self, "_addDropCoordinatorItem:", v10);

  return v10;
}

- (id)dropItem:(id)a3 intoItemAtIndexPath:(id)a4 rect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  UIDragPreviewTarget *v30;
  UIDragPreviewTarget *v31;
  _UICollectionViewDropCoordinatorItem *v32;
  void *v33;
  void *v34;
  void *v36;
  CGAffineTransform v37;
  CGAffineTransform v38;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a3;
  v13 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewDragAndDropController.m"), 1486, CFSTR("Please pass an object of type UIDragItem."));

  }
  -[_UICollectionViewDragAndDropController _presentationIndexPathForIndexPath:allowingAppendingInserts:](self, "_presentationIndexPathForIndexPath:allowingAppendingInserts:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewDragAndDropController defaultAnimationHandlers](self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewShadowUpdatesController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_cellForItemAtIndexPath:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v12, "_visibleDropItemSize");
    v19 = v18;
    v21 = v20;
    if (!UIRectIsDiscrete(x, y, width, height))
    {
      objc_msgSend(v17, "bounds");
      x = v22;
      y = v23;
      width = v24;
      height = v25;
    }
    v26 = x + width * 0.5;
    v27 = y + height * 0.5;
    v28 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v38.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v38.c = v28;
    *(_OWORD *)&v38.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    if (v19 == *MEMORY[0x1E0C9D820] && v21 == *(double *)(MEMORY[0x1E0C9D820] + 8))
      CGAffineTransformMakeScale(&v38, 0.01, 0.01);
    else
      _UIScaleTransformForAspectFitOrFillOfSizeInTargetSize((CGAffineTransform *)1, (uint64_t)&v38, v19, v21, width, height);
    v30 = [UIDragPreviewTarget alloc];
    v37 = v38;
    v31 = -[UIPreviewTarget initWithContainer:center:transform:](v30, "initWithContainer:center:transform:", v17, &v37, v26, v27);
    v32 = -[_UICollectionViewDropCoordinatorItem initWithDragItem:target:]([_UICollectionViewDropCoordinatorItem alloc], "initWithDragItem:target:", v12, v31);
    -[_UICollectionViewDropCoordinatorItem setDestinationIndexPath:](v32, "setDestinationIndexPath:", v14);
    -[_UICollectionViewDropCoordinatorItem setShouldRemainInHierarchy:](v32, "setShouldRemainInHierarchy:", 1);
    -[_UICollectionViewDragAndDropController _addDropCoordinatorItem:](self, "_addDropCoordinatorItem:", v32);

    -[_UICollectionViewDragAndDropController _cellAppearanceStateForIndexPath:](self, "_cellAppearanceStateForIndexPath:", v14);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
      objc_msgSend(v33, "setDragState:", 5);

    v15 = v32;
  }

  return v15;
}

- (id)dropItem:(id)a3 toTarget:(id)a4
{
  id v7;
  id v8;
  _UICollectionViewDropCoordinatorItem *v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewDragAndDropController.m"), 1519, CFSTR("Please pass an object of type UIDragItem."));

  }
  v9 = -[_UICollectionViewDropCoordinatorItem initWithDragItem:target:]([_UICollectionViewDropCoordinatorItem alloc], "initWithDragItem:target:", v7, v8);

  -[_UICollectionViewDragAndDropController _addDropCoordinatorItem:](self, "_addDropCoordinatorItem:", v9);
  return v9;
}

- (void)dropToItemAtIndexPath:(id)a3 forDragItem:(id)a4
{
  id v4;

  v4 = -[_UICollectionViewDragAndDropController dropItem:toItemAtIndexPath:](self, "dropItem:toItemAtIndexPath:", a4, a3);
}

- (id)dropToPlaceholderCellAtIndexPath:(id)a3 reuseIdentifier:(id)a4 forDragItem:(id)a5 cellUpdateHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewDragAndDropController.m"), 1532, CFSTR("Please pass an object of type UIDragItem."));

  }
  -[_UICollectionViewDragAndDropController dropItem:toPlaceholderInsertedAtIndexPath:withReuseIdentifier:cellUpdateHandler:](self, "dropItem:toPlaceholderInsertedAtIndexPath:withReuseIdentifier:cellUpdateHandler:", v13, v11, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)dropToPlaceholderInsertedAtIndexPath:(id)a3 reuseIdentifier:(id)a4 forDragItem:(id)a5 cellUpdateHandler:(id)a6
{
  return -[_UICollectionViewDragAndDropController dropItem:toPlaceholderInsertedAtIndexPath:withReuseIdentifier:cellUpdateHandler:](self, "dropItem:toPlaceholderInsertedAtIndexPath:withReuseIdentifier:cellUpdateHandler:", a5, a3, a4, a6);
}

- (void)dropToLocation:(CGPoint)a3 inContainerView:(id)a4 withTransform:(CGAffineTransform *)a5 forDragItem:(id)a6
{
  double y;
  double x;
  id v12;
  id v13;
  UIDragPreviewTarget *v14;
  __int128 v15;
  UIDragPreviewTarget *v16;
  id v17;
  void *v18;
  _OWORD v19[3];

  y = a3.y;
  x = a3.x;
  v12 = a6;
  v13 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewDragAndDropController.m"), 1545, CFSTR("Please pass an object of type UIDragItem."));

  }
  v14 = [UIDragPreviewTarget alloc];
  v15 = *(_OWORD *)&a5->c;
  v19[0] = *(_OWORD *)&a5->a;
  v19[1] = v15;
  v19[2] = *(_OWORD *)&a5->tx;
  v16 = -[UIPreviewTarget initWithContainer:center:transform:](v14, "initWithContainer:center:transform:", v13, v19, x, y);

  v17 = -[_UICollectionViewDragAndDropController dropItem:toTarget:](self, "dropItem:toTarget:", v12, v16);
}

- (void)dropToTarget:(id)a3 forDragItem:(id)a4
{
  id v4;

  v4 = -[_UICollectionViewDragAndDropController dropItem:toTarget:](self, "dropItem:toTarget:", a4, a3);
}

- (UICollectionViewDropProposal)proposal
{
  return (UICollectionViewDropProposal *)-[_UICollectionViewDragDestinationController currentDropProposal](&self->_destinationController->super.isa);
}

- (UIDropSession)session
{
  return (UIDropSession *)-[_UICollectionViewDragDestinationController currentDropSession](&self->_destinationController->super.isa);
}

@end
