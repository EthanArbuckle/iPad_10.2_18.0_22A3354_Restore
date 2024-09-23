@implementation _UIDragSessionImpl

+ (id)activeSessions
{
  return (id)objc_msgSend((id)__activeDragSessionsTable, "copy");
}

- (_UIDragSessionImpl)initWithInteraction:(id)a3
{
  id v5;
  _UIDragSessionImpl *v6;
  uint64_t v7;
  NSMutableArray *allItems;
  uint64_t v9;
  NSMapTable *dragSourceInteractionByItem;
  uint64_t v11;
  NSHashTable *allInteractions;
  void *v14;
  objc_super v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDragSession.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interaction"));

  }
  v15.receiver = self;
  v15.super_class = (Class)_UIDragSessionImpl;
  v6 = -[_UIDragSessionImpl init](&v15, sel_init);
  if (v6)
  {
    if (initWithInteraction__onceToken != -1)
      dispatch_once(&initWithInteraction__onceToken, &__block_literal_global_167);
    v7 = objc_opt_new();
    allItems = v6->_allItems;
    v6->_allItems = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    dragSourceInteractionByItem = v6->_dragSourceInteractionByItem;
    v6->_dragSourceInteractionByItem = (NSMapTable *)v9;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    allInteractions = v6->_allInteractions;
    v6->_allInteractions = (NSHashTable *)v11;

    -[NSHashTable addObject:](v6->_allInteractions, "addObject:", v5);
    objc_storeWeak((id *)&v6->_primaryInteraction, v5);
    _UIInitializeDraggingSystem();
  }

  return v6;
}

- (BOOL)_canAddItems
{
  return -[_UIInternalDraggingSessionSource canAddItems](self->_internalDragSession, "canAddItems");
}

- (BOOL)_isActive
{
  return -[_UIInternalDraggingSessionSource isActive](self->_internalDragSession, "isActive");
}

- (NSSet)trackedInteractions
{
  return -[NSHashTable setRepresentation](self->_allInteractions, "setRepresentation");
}

- (void)addItems:(id)a3 forDragSourceInteraction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSHashTable addObject:](self->_allInteractions, "addObject:", v7);
  objc_msgSend(v6, "reverseObjectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:](self->_allItems, "replaceObjectsInRange:withObjectsFromArray:", 0, 0, v9);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        -[NSMapTable setObject:forKey:](self->_dragSourceInteractionByItem, "setObject:forKey:", v7, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v12);
  }

  -[_UIDragSessionImpl _internalDragSession](self, "_internalDragSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v16 = v10;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
          objc_msgSend(v21, "_setDragDropSession:", self, (_QWORD)v22);
          objc_msgSend(v21, "_setSourceVisualTarget:", self);
          objc_msgSend(v21, "_loadOriginalImageComponentProvider");
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v18);
    }

    if (objc_msgSend(v16, "count"))
      objc_msgSend(v15, "addPublicItems:", v16);
  }

}

- (id)dragSourceInteractionForDragItem:(id)a3
{
  return -[NSMapTable objectForKey:](self->_dragSourceInteractionByItem, "objectForKey:", a3);
}

- (id)_internalSession
{
  return self->_internalDragSession;
}

- (void)_setInternalDragSession:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_internalDragSession, a3);
  if (self->_internalDragSession)
  {
    objc_msgSend((id)__activeDragSessionsTable, "addObject:", self);
    -[_UIInternalDraggingSessionSource setDelegate:](self->_internalDragSession, "setDelegate:", self);
  }

}

+ (id)_localDragSessionForSessionDestination:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "inAppSessionSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    +[_UIDragSessionImpl activeSessions](_UIDragSessionImpl, "activeSessions", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v8, "_internalDragSession");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9 == v3)
          {
            v5 = v8;
            goto LABEL_12;
          }
        }
        v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_itemsNeedUpdate:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  int v12;
  NSMutableSet *addedDragItemsPendingUpdate;
  NSMutableSet *v14;
  NSMutableSet *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableSet count](self->_addedDraggingItemsWaitingForHandOffOfDragImage, "count"))
  {
    v5 = (NSMutableSet *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          v12 = -[NSMutableSet containsObject:](self->_addedDraggingItemsWaitingForHandOffOfDragImage, "containsObject:", v11, (_QWORD)v16);
          addedDragItemsPendingUpdate = v5;
          if (v12)
          {
            addedDragItemsPendingUpdate = self->_addedDragItemsPendingUpdate;
            if (!addedDragItemsPendingUpdate)
            {
              v14 = (NSMutableSet *)objc_opt_new();
              v15 = self->_addedDragItemsPendingUpdate;
              self->_addedDragItemsPendingUpdate = v14;

              addedDragItemsPendingUpdate = self->_addedDragItemsPendingUpdate;
            }
          }
          -[NSMutableSet addObject:](addedDragItemsPendingUpdate, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    _markItemsForUpdate(v5, self);
  }
  else
  {
    _markItemsForUpdate(v4, self);
  }

}

- (BOOL)_allowsItemsToUpdate
{
  void *v2;
  BOOL v3;

  if (!self->_didHandOffDragImage)
    return 0;
  -[_UIDragSessionImpl _internalDragSession](self, "_internalDragSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)_dataOwner
{
  return -[_UIInternalDraggingSessionSource dataOwner](self->_internalDragSession, "dataOwner");
}

- (void)_cancelDrag
{
  -[_UIInternalDraggingSessionSource cancelDrag](self->_internalDragSession, "cancelDrag");
}

- (NSArray)items
{
  return (NSArray *)self->_allItems;
}

- (CGPoint)locationInView:(id)a3
{
  id v4;
  _UIInternalDraggingSessionSource *internalDragSession;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("View must be non-null"));
  internalDragSession = self->_internalDragSession;
  if (internalDragSession)
  {
    -[_UIInternalDraggingSessionSource draggingLocationInCoordinateSpace:](internalDragSession, "draggingLocationInCoordinateSpace:", v4);
    v7 = v6;
    v9 = v8;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_primaryInteraction);
    objc_msgSend(WeakRetained, "_locationInView:", v4);
    v7 = v11;
    v9 = v12;

  }
  v13 = v7;
  v14 = v9;
  result.y = v14;
  result.x = v13;
  return result;
}

- (BOOL)allowsMoveOperation
{
  _UIInternalDraggingSessionSource *internalDragSession;
  unint64_t v4;
  id WeakRetained;

  internalDragSession = self->_internalDragSession;
  if (internalDragSession)
  {
    v4 = -[_UIInternalDraggingSessionSource withinAppSourceOperationMask](internalDragSession, "withinAppSourceOperationMask");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_primaryInteraction);
    v4 = objc_msgSend(WeakRetained, "_session:sourceOperationMaskForDraggingWithinApp:", self, 1);

  }
  return (v4 >> 4) & 1;
}

- (BOOL)isRestrictedToDraggingApplication
{
  _UIInternalDraggingSessionSource *internalDragSession;
  char v4;
  id WeakRetained;

  internalDragSession = self->_internalDragSession;
  if (internalDragSession)
  {
    v4 = -[_UIInternalDraggingSessionSource outsideAppSourceOperationMask](internalDragSession, "outsideAppSourceOperationMask");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_primaryInteraction);
    v4 = objc_msgSend(WeakRetained, "_session:sourceOperationMaskForDraggingWithinApp:", self, 0);

  }
  return (v4 & 1) == 0;
}

- (BOOL)hasItemsConformingToTypeIdentifiers:(id)a3
{
  id v4;
  void *v5;
  char hasItemsConformingToTypeIdentifiers;

  v4 = a3;
  -[_UIDragSessionImpl items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  hasItemsConformingToTypeIdentifiers = _hasItemsConformingToTypeIdentifiers(v5, v4);

  return hasItemsConformingToTypeIdentifiers;
}

- (BOOL)canLoadObjectsOfClass:(Class)a3
{
  void *v4;

  -[_UIDragSessionImpl items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = _canLoadObjectsOfClass(v4, (uint64_t)a3);

  return (char)a3;
}

- (unint64_t)draggingSession:(id)a3 sourceOperationMaskForDraggingWithinApp:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  unint64_t v7;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_primaryInteraction);
  v7 = objc_msgSend(WeakRetained, "_session:sourceOperationMaskForDraggingWithinApp:", self, v4);

  return v7;
}

- (BOOL)draggingSessionPrefersFullSizePreviews:(id)a3
{
  _UIDragSessionImpl *v3;
  id WeakRetained;

  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_primaryInteraction);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "_sessionPrefersFullSizePreviews:", v3);

  return (char)v3;
}

- (BOOL)draggingSessionDynamicallyUpdatesPrefersFullSizePreviews:(id)a3
{
  _UIDragSessionImpl *v3;
  id WeakRetained;

  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_primaryInteraction);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "_sessionDynamicallyUpdatesPrefersFullSizePreviews:", v3);

  return (char)v3;
}

- (void)draggingSessionWillBegin:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_primaryInteraction);
  objc_msgSend(WeakRetained, "_sessionWillBegin:", self);

}

- (void)_draggingSessionHandedOffDragImage:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_primaryInteraction);
  objc_msgSend(WeakRetained, "_sessionHandedOffDragImage:", self);
  self->_didHandOffDragImage = 1;
  if ((_MergedGlobals_1020 & 1) == 0)
  {
    _MergedGlobals_1020 = 1;
    objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", &__block_literal_global_253_0);
  }

}

- (void)_draggingSession:(id)a3 handedOffDragImageForItem:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[NSMutableSet removeObject:](self->_addedDraggingItemsWaitingForHandOffOfDragImage, "removeObject:", v5);
  if (v5 && -[NSMutableSet containsObject:](self->_addedDragItemsPendingUpdate, "containsObject:", v5))
  {
    -[NSMutableSet removeObject:](self->_addedDragItemsPendingUpdate, "removeObject:", v5);
    v7[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDragSessionImpl _itemsNeedUpdate:](self, "_itemsNeedUpdate:", v6);

  }
}

- (void)draggingSessionDidMove:(id)a3
{
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_allInteractions;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "_sessionDidMove:", self, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)draggingSession:(id)a3 willAddItems:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSMutableSet *addedDraggingItemsWaitingForHandOffOfDragImage;
  NSMutableSet *v9;
  NSMutableSet *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  NSMutableSet *addedDragItemsPendingUpdate;
  NSMutableSet *v21;
  NSMutableSet *v22;
  NSHashTable *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDragSessionImpl dragSourceInteractionForDragItem:](self, "dragSourceInteractionForDragItem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  addedDraggingItemsWaitingForHandOffOfDragImage = self->_addedDraggingItemsWaitingForHandOffOfDragImage;
  if (!addedDraggingItemsWaitingForHandOffOfDragImage)
  {
    v9 = (NSMutableSet *)objc_opt_new();
    v10 = self->_addedDraggingItemsWaitingForHandOffOfDragImage;
    self->_addedDraggingItemsWaitingForHandOffOfDragImage = v9;

    addedDraggingItemsWaitingForHandOffOfDragImage = self->_addedDraggingItemsWaitingForHandOffOfDragImage;
  }
  -[NSMutableSet addObjectsFromArray:](addedDraggingItemsWaitingForHandOffOfDragImage, "addObjectsFromArray:", v5);
  v11 = v5;
  objc_msgSend((id)qword_1ECD7D7D0, "objectForKey:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)objc_opt_new();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (objc_msgSend(v12, "containsObject:", v19))
          {
            objc_msgSend(v12, "removeObject:", v19);
            objc_msgSend(v13, "addObject:", v19);
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v16);
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  addedDragItemsPendingUpdate = self->_addedDragItemsPendingUpdate;
  if (!addedDragItemsPendingUpdate)
  {
    v21 = (NSMutableSet *)objc_opt_new();
    v22 = self->_addedDragItemsPendingUpdate;
    self->_addedDragItemsPendingUpdate = v21;

    addedDragItemsPendingUpdate = self->_addedDragItemsPendingUpdate;
  }
  -[NSMutableSet addObjectsFromArray:](addedDragItemsPendingUpdate, "addObjectsFromArray:", v13);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v23 = self->_allInteractions;
  v24 = -[NSHashTable countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v31 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        v29 = (void *)objc_msgSend(v11, "copy", (_QWORD)v30);
        objc_msgSend(v28, "_session:willAddItems:forInteraction:", self, v29, v7);

      }
      v25 = -[NSHashTable countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v25);
  }

}

- (void)draggingSessionWillEnd:(id)a3 withOperation:(unint64_t)a4
{
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_allInteractions;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "_sessionWillEnd:withOperation:", self, a4, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)draggingSessionDidEnd:(id)a3 withOperation:(unint64_t)a4
{
  id v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
    objc_msgSend((id)__activeDragSessionsTable, "removeObject:", self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_allInteractions;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "_sessionDidEnd:withOperation:", self, a4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)draggingSessionDidTransferItems:(id)a3
{
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_allInteractions;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "_sessionDidTransferItems:", self, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  objc_msgSend((id)__activeDragSessionsTable, "removeObject:", self);
}

- (id)_windowForSetDownOfDragItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[_UIDragSessionImpl dragSourceInteractionForDragItem:](self, "dragSourceInteractionForDragItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_setDownAnimation:(id)a3 prepareForSetDownOfDragItem:(id)a4 visibleDroppedItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t v18;
  NSObject *v19;
  unint64_t v20;
  NSObject *v21;
  int v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_UIDragSessionImpl dragSourceInteractionForDragItem:](self, "dragSourceInteractionForDragItem:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_diagnostics())
  {
    if (!v9)
    {
      __UIFaultDebugAssertLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v23) = 0;
        _os_log_fault_impl(&dword_185066000, v16, OS_LOG_TYPE_FAULT, "Cannot find item for dragging item", (uint8_t *)&v23, 2u);
      }

    }
  }
  else if (!v9)
  {
    v18 = qword_1ECD7D7C0;
    if (!qword_1ECD7D7C0)
    {
      v18 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v18, (unint64_t *)&qword_1ECD7D7C0);
    }
    v19 = *(NSObject **)(v18 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "Cannot find item for dragging item", (uint8_t *)&v23, 2u);
    }
  }
  if (os_variant_has_internal_diagnostics())
  {
    if (!v10)
    {
      __UIFaultDebugAssertLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        v23 = 138412290;
        v24 = v9;
        _os_log_fault_impl(&dword_185066000, v17, OS_LOG_TYPE_FAULT, "droppedItem for dragging item (%@) in nil", (uint8_t *)&v23, 0xCu);
      }

      goto LABEL_23;
    }
  }
  else if (!v10)
  {
    v20 = qword_1ECD7D7C8;
    if (!qword_1ECD7D7C8)
    {
      v20 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v20, (unint64_t *)&qword_1ECD7D7C8);
    }
    v21 = *(NSObject **)(v20 + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23 = 138412290;
      v24 = v9;
      _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "droppedItem for dragging item (%@) in nil", (uint8_t *)&v23, 0xCu);
    }
    goto LABEL_23;
  }
  if (!v9)
  {
LABEL_23:
    v15 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v10, "createSnapshotView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "center");
  objc_msgSend(v12, "setCenter:");
  objc_msgSend(v10, "preview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_session:targetedPreviewForCancellingItem:duiPreview:snapshotView:container:", self, v9, v13, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
  return v15;
}

- (void)_setDownAnimation:(id)a3 willAnimateSetDownOfDragItem:(id)a4 withAnimator:(id)a5 preview:(id)a6
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v8 = a5;
  v9 = a4;
  if (os_variant_has_internal_diagnostics())
  {
    if (!v9)
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Item cannot be nil", buf, 2u);
      }

    }
  }
  else if (!v9)
  {
    v12 = _setDownAnimation_willAnimateSetDownOfDragItem_withAnimator_preview____s_category;
    if (!_setDownAnimation_willAnimateSetDownOfDragItem_withAnimator_preview____s_category)
    {
      v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&_setDownAnimation_willAnimateSetDownOfDragItem_withAnimator_preview____s_category);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Item cannot be nil", v14, 2u);
    }
  }
  -[_UIDragSessionImpl dragSourceInteractionForDragItem:](self, "dragSourceInteractionForDragItem:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_session:item:willCancelWithAnimator:", self, v9, v8);

}

- (BOOL)_setDownAnimation:(id)a3 shouldDelaySetDownOfDragItem:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  NSObject *v12;
  unint64_t v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v7 = a5;
  v8 = a4;
  if (os_variant_has_internal_diagnostics())
  {
    if (!v8)
    {
      __UIFaultDebugAssertLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "Item cannot be nil", buf, 2u);
      }

    }
  }
  else if (!v8)
  {
    v13 = _setDownAnimation_shouldDelaySetDownOfDragItem_completion____s_category;
    if (!_setDownAnimation_shouldDelaySetDownOfDragItem_completion____s_category)
    {
      v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&_setDownAnimation_shouldDelaySetDownOfDragItem_completion____s_category);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Item cannot be nil", v15, 2u);
    }
  }
  -[_UIDragSessionImpl dragSourceInteractionForDragItem:](self, "dragSourceInteractionForDragItem:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_session:item:shouldDelaySetDownAnimationWithCompletion:", self, v8, v7);

  return v10;
}

- (id)_setDownAnimation:(id)a3 customSpringAnimationBehaviorForSetDownOfDragItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[_UIDragSessionImpl dragSourceInteractionForDragItem:](self, "dragSourceInteractionForDragItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_session:customSpringAnimationBehaviorForCancellingItem:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unsigned)_sessionIdentifier
{
  return -[_UIInternalDraggingSessionSource sessionIdentifier](self->_internalDragSession, "sessionIdentifier");
}

- (id)localContext
{
  return self->_localContext;
}

- (void)setLocalContext:(id)a3
{
  objc_storeStrong(&self->_localContext, a3);
}

- (_UIInternalDraggingSessionSource)_internalDragSession
{
  return self->_internalDragSession;
}

- (UIDragInteraction)primaryInteraction
{
  return (UIDragInteraction *)objc_loadWeakRetained((id *)&self->_primaryInteraction);
}

- (BOOL)_sentSessionDidBegin
{
  return self->_sentSessionDidBegin;
}

- (void)_setSentSessionDidBegin:(BOOL)a3
{
  self->_sentSessionDidBegin = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_primaryInteraction);
  objc_storeStrong((id *)&self->_internalDragSession, 0);
  objc_storeStrong(&self->_localContext, 0);
  objc_storeStrong((id *)&self->_addedDragItemsPendingUpdate, 0);
  objc_storeStrong((id *)&self->_addedDraggingItemsWaitingForHandOffOfDragImage, 0);
  objc_storeStrong((id *)&self->_allInteractions, 0);
  objc_storeStrong((id *)&self->_dragSourceInteractionByItem, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
}

@end
