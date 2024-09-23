@implementation SBIconDragContext

- (SBIconDragContext)init
{
  SBIconDragContext *v2;
  SBIconDragContext *v3;
  NSArray *grabbedIconViews;
  NSArray *v5;
  NSArray *itemIdentifiers;
  NSArray *sourceIcons;
  NSArray *externallyDraggedIcons;
  os_activity_t v9;
  OS_os_activity *activity;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBIconDragContext;
  v2 = -[SBIconDragContext init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    grabbedIconViews = v2->_grabbedIconViews;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_grabbedIconViews = (NSArray *)MEMORY[0x1E0C9AA60];

    itemIdentifiers = v3->_itemIdentifiers;
    v3->_itemIdentifiers = v5;

    sourceIcons = v3->_sourceIcons;
    v3->_sourceIcons = v5;

    externallyDraggedIcons = v3->_externallyDraggedIcons;
    v3->_externallyDraggedIcons = v5;

    v9 = _os_activity_create(&dword_1CFEF3000, "Icon Drag", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    activity = v3->_activity;
    v3->_activity = (OS_os_activity *)v9;

    os_activity_scope_enter((os_activity_t)v3->_activity, &v3->_activityState);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  os_activity_scope_leave(&self->_activityState);
  v3.receiver = self;
  v3.super_class = (Class)SBIconDragContext;
  -[SBIconDragContext dealloc](&v3, sel_dealloc);
}

- (BOOL)isUserActive
{
  unint64_t v3;
  BOOL result;

  v3 = -[SBIconDragContext state](self, "state");
  result = 0;
  if (v3 <= 4 && ((1 << v3) & 0x1A) != 0)
    return !-[SBIconDragContext dragItemWasConsumedExternally](self, "dragItemWasConsumedExternally");
  return result;
}

- (BOOL)hasUserDragged
{
  return (unint64_t)(-[SBIconDragContext state](self, "state") - 3) < 4;
}

- (void)addItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SBIconDragContext itemIdentifiers](self, "itemIdentifiers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIconDragContext setItemIdentifiers:](self, "setItemIdentifiers:", v5);
}

- (BOOL)hasItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBIconDragContext itemIdentifiers](self, "itemIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)addGrabbedIconView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableSet *grabbedIcons;
  NSMutableSet *v9;
  NSMutableSet *v10;
  uint64_t v11;

  v4 = a3;
  -[SBIconDragContext grabbedIconViews](self, "grabbedIconViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragContext setGrabbedIconViews:](self, "setGrabbedIconViews:", v6);

  objc_msgSend(v4, "icon");
  v11 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)v11;
  if (v11)
  {
    grabbedIcons = self->_grabbedIcons;
    if (!grabbedIcons)
    {
      v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v10 = self->_grabbedIcons;
      self->_grabbedIcons = v9;

      grabbedIcons = self->_grabbedIcons;
    }
    -[NSMutableSet addObject:](grabbedIcons, "addObject:", v11);
    v7 = (void *)v11;
  }

}

- (BOOL)hasGrabbedIcon:(id)a3
{
  return -[NSMutableSet containsObject:](self->_grabbedIcons, "containsObject:", a3);
}

- (void)addSourceIcon:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SBIconDragContext sourceIcons](self, "sourceIcons");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIconDragContext setSourceIcons:](self, "setSourceIcons:", v5);
}

- (void)addSourceIcons:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SBIconDragContext sourceIcons](self, "sourceIcons");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIconDragContext setSourceIcons:](self, "setSourceIcons:", v5);
}

- (NSArray)droppedIcons
{
  if (self->_droppedIcons)
    return (NSArray *)self->_droppedIcons;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)addDroppedIcon:(id)a3
{
  id v4;
  NSMutableArray *droppedIcons;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  droppedIcons = self->_droppedIcons;
  v8 = v4;
  if (!droppedIcons)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_droppedIcons;
    self->_droppedIcons = v6;

    v4 = v8;
    droppedIcons = self->_droppedIcons;
  }
  -[NSMutableArray addObject:](droppedIcons, "addObject:", v4);

}

- (void)addDroppedIcons:(id)a3
{
  id v4;
  NSMutableArray *droppedIcons;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  droppedIcons = self->_droppedIcons;
  v8 = v4;
  if (!droppedIcons)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_droppedIcons;
    self->_droppedIcons = v6;

    v4 = v8;
    droppedIcons = self->_droppedIcons;
  }
  -[NSMutableArray addObjectsFromArray:](droppedIcons, "addObjectsFromArray:", v4);

}

- (void)setAdditionalMatchingIcon:(id)a3 forDroppedIconIdentifier:(id)a4
{
  id v6;
  NSMutableDictionary *additionalMatchingDroppedIcons;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  additionalMatchingDroppedIcons = self->_additionalMatchingDroppedIcons;
  if (!additionalMatchingDroppedIcons)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_additionalMatchingDroppedIcons;
    self->_additionalMatchingDroppedIcons = v8;

    additionalMatchingDroppedIcons = self->_additionalMatchingDroppedIcons;
  }
  -[NSMutableDictionary setObject:forKey:](additionalMatchingDroppedIcons, "setObject:forKey:", v10, v6);

}

- (id)additionalMatchingIconForDroppedIconIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_additionalMatchingDroppedIcons, "objectForKey:", a3);
}

- (void)swapSourceIconWithIdentifier:(id)a3 withIcon:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSMutableSet *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  id v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBIconDragContext sourceIcons](self, "sourceIcons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v10 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __59__SBIconDragContext_swapSourceIconWithIdentifier_withIcon___block_invoke;
  v39[3] = &unk_1E8D87A40;
  v11 = v6;
  v40 = v11;
  v12 = objc_msgSend(v9, "indexOfObjectPassingTest:", v39);
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v9, "addObject:", v7);
  else
    objc_msgSend(v9, "replaceObjectAtIndex:withObject:", v12, v7);
  v28 = v9;
  -[SBIconDragContext setSourceIcons:](self, "setSourceIcons:", v9);
  -[SBIconDragContext itemIdentifiers](self, "itemIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v7, "nodeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObject:", v11);
  objc_msgSend(v14, "addObject:", v15);
  -[SBIconDragContext setItemIdentifiers:](self, "setItemIdentifiers:", v14);
  v36[0] = v10;
  v36[1] = 3221225472;
  v36[2] = __59__SBIconDragContext_swapSourceIconWithIdentifier_withIcon___block_invoke_2;
  v36[3] = &unk_1E8D864F8;
  v16 = v8;
  v37 = v16;
  v17 = v7;
  v38 = v17;
  -[SBIconDragContext enumerateSourceIconViewsUsingBlock:](self, "enumerateSourceIconViewsUsingBlock:", v36);
  v33[0] = v10;
  v33[1] = 3221225472;
  v33[2] = __59__SBIconDragContext_swapSourceIconWithIdentifier_withIcon___block_invoke_3;
  v33[3] = &unk_1E8D8BB70;
  v27 = v16;
  v34 = v27;
  v26 = v17;
  v35 = v26;
  -[SBIconDragContext enumerateDragPreviewsUsingBlock:](self, "enumerateDragPreviewsUsingBlock:", v33);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v18 = self->_appLocalContexts;
  v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v23, "uniqueIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToString:", v11);

        if (v25)
          objc_msgSend(v23, "setUniqueIdentifier:", v15);
      }
      v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v20);
  }

}

uint64_t __59__SBIconDragContext_swapSourceIconWithIdentifier_withIcon___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "nodeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __59__SBIconDragContext_swapSourceIconWithIdentifier_withIcon___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(v3, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
    objc_msgSend(v6, "setIcon:", *(_QWORD *)(a1 + 40));

}

void __59__SBIconDragContext_swapSourceIconWithIdentifier_withIcon___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(v3, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
    objc_msgSend(v6, "setIcon:", *(_QWORD *)(a1 + 40));

}

- (BOOL)hasNonDefaultSizedSourceIcons
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  int v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SBIconDragContext sourceIcons](self, "sourceIcons", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v7, "gridSizeClass");
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v8 == CFSTR("SBHIconGridSizeClassDefault"))
        {

        }
        else
        {
          v9 = v8;
          objc_msgSend(v7, "gridSizeClass");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

          if (!v11)
          {
            v12 = 1;
            goto LABEL_13;
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (NSString)sourceIconGridSizeClass
{
  void *v2;
  void *v3;
  void *v4;

  -[SBIconDragContext sourceIcons](self, "sourceIcons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "gridSizeClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)hasFolderSourceIcons
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[SBIconDragContext itemIdentifiers](self, "itemIdentifiers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (+[SBFolder isFolderNodeIdentifier:](SBFolder, "isFolderNodeIdentifier:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * i)))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSArray)draggedIcons
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  BOOL v11;
  id v12;
  void *v14;
  void *v15;
  NSMutableDictionary *additionalMatchingDroppedIcons;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;

  -[SBIconDragContext sourceIcons](self, "sourceIcons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragContext createdIcons](self, "createdIcons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragContext externallyDraggedIcons](self, "externallyDraggedIcons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "count");
  v7 = objc_msgSend(v4, "count");
  v8 = objc_msgSend(v5, "count");
  v9 = v8;
  if (v6 && !v7 && !v8)
  {
    v10 = v3;
LABEL_13:
    v12 = v10;
    goto LABEL_14;
  }
  if (v7)
    v11 = v6 != 0;
  else
    v11 = 1;
  if (!v11 && v8 == 0)
  {
    v10 = v4;
    goto LABEL_13;
  }
  if (v6 == 0 && v7 == 0 && v8)
  {
    v10 = v5;
    goto LABEL_13;
  }
  v14 = (void *)objc_msgSend(v3, "mutableCopy");
  v15 = v14;
  if (v7)
    objc_msgSend(v14, "addObjectsFromArray:", v4);
  if (v9)
    objc_msgSend(v15, "addObjectsFromArray:", v5);
  additionalMatchingDroppedIcons = self->_additionalMatchingDroppedIcons;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __33__SBIconDragContext_draggedIcons__block_invoke;
  v19[3] = &unk_1E8D8BB98;
  v20 = 0;
  v17 = v15;
  v21 = v17;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](additionalMatchingDroppedIcons, "enumerateKeysAndObjectsUsingBlock:", v19);
  v18 = v21;
  v12 = v17;

LABEL_14:
  return (NSArray *)v12;
}

void __33__SBIconDragContext_draggedIcons__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__SBIconDragContext_draggedIcons__block_invoke_2;
  v7[3] = &unk_1E8D87A40;
  v6 = v3;
  v8 = v6;
  v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", v7);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", v5);

}

uint64_t __33__SBIconDragContext_draggedIcons__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)enumerateDraggedIconUsingBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  -[SBIconDragContext sourceIcons](self, "sourceIcons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __52__SBIconDragContext_enumerateDraggedIconUsingBlock___block_invoke;
  v17[3] = &unk_1E8D8A6E8;
  v7 = v4;
  v18 = v7;
  v19 = &v20;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v17);
  if (!*((_BYTE *)v21 + 24))
  {
    -[SBIconDragContext createdIcons](self, "createdIcons");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __52__SBIconDragContext_enumerateDraggedIconUsingBlock___block_invoke_2;
    v14[3] = &unk_1E8D8A6E8;
    v9 = v7;
    v15 = v9;
    v16 = &v20;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);
    if (!*((_BYTE *)v21 + 24))
    {
      -[SBIconDragContext externallyDraggedIcons](self, "externallyDraggedIcons");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __52__SBIconDragContext_enumerateDraggedIconUsingBlock___block_invoke_3;
      v11[3] = &unk_1E8D8A6E8;
      v12 = v9;
      v13 = &v20;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

    }
  }

  _Block_object_dispose(&v20, 8);
}

uint64_t __52__SBIconDragContext_enumerateDraggedIconUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  char v7;

  v7 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v7)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __52__SBIconDragContext_enumerateDraggedIconUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  char v7;

  v7 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v7)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __52__SBIconDragContext_enumerateDraggedIconUsingBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  char v7;

  v7 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v7)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)hasDraggedIcon:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__SBIconDragContext_hasDraggedIcon___block_invoke;
  v7[3] = &unk_1E8D8BBC0;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[SBIconDragContext enumerateDraggedIconUsingBlock:](self, "enumerateDraggedIconUsingBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __36__SBIconDragContext_hasDraggedIcon___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if (*(_QWORD *)(result + 32) == a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)hasNonDefaultSizedDraggedIcons
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  int v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SBIconDragContext draggedIcons](self, "draggedIcons", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v7, "gridSizeClass");
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v8 == CFSTR("SBHIconGridSizeClassDefault"))
        {

        }
        else
        {
          v9 = v8;
          objc_msgSend(v7, "gridSizeClass");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

          if (!v11)
          {
            v12 = 1;
            goto LABEL_13;
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (NSString)draggedIconGridSizeClass
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;

  -[SBIconDragContext draggedIcons](self, "draggedIcons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "gridSizeClass");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("SBHIconGridSizeClassDefault");
  }
  v5 = v4;

  return (NSString *)v5;
}

- (BOOL)hasFolderDraggedIcons
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[SBIconDragContext draggedIcons](self, "draggedIcons", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isFolderIcon") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSArray)createdIcons
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[SBIconDragContext createdApplicationIcons](self, "createdApplicationIcons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragContext createdWidgetIcons](self, "createdWidgetIcons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 && !v4)
  {
    v6 = v3;
LABEL_10:
    v7 = v6;
    goto LABEL_11;
  }
  if (!v3 && v4)
  {
    v6 = v4;
    goto LABEL_10;
  }
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v3 && v4)
  {
    objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_11:

  return (NSArray *)v7;
}

- (BOOL)hasSourceIconView:(id)a3
{
  return -[NSMutableSet containsObject:](self->_sourceIconViews, "containsObject:", a3);
}

- (void)addSourceIconView:(id)a3
{
  id v4;
  NSMutableSet *sourceIconViews;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  sourceIconViews = self->_sourceIconViews;
  v8 = v4;
  if (!sourceIconViews)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_sourceIconViews;
    self->_sourceIconViews = v6;

    v4 = v8;
    sourceIconViews = self->_sourceIconViews;
  }
  -[NSMutableSet addObject:](sourceIconViews, "addObject:", v4);

}

- (void)enumerateSourceIconViewsUsingBlock:(id)a3
{
  -[NSMutableSet enumerateObjectsUsingBlock:](self->_sourceIconViews, "enumerateObjectsUsingBlock:", a3);
}

- (void)addDiscardedSourceIconView:(id)a3
{
  id v4;
  NSMutableSet *discardedSourceIconViews;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  discardedSourceIconViews = self->_discardedSourceIconViews;
  v8 = v4;
  if (!discardedSourceIconViews)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_discardedSourceIconViews;
    self->_discardedSourceIconViews = v6;

    v4 = v8;
    discardedSourceIconViews = self->_discardedSourceIconViews;
  }
  -[NSMutableSet addObject:](discardedSourceIconViews, "addObject:", v4);

}

- (void)enumerateDiscardedSourceIconViewsUsingBlock:(id)a3
{
  -[NSMutableSet enumerateObjectsUsingBlock:](self->_discardedSourceIconViews, "enumerateObjectsUsingBlock:", a3);
}

- (BOOL)hasDragItem:(id)a3
{
  void *v4;
  char v5;

  objc_msgSend(a3, "sbh_appDragLocalContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[NSMutableSet containsObject:](self->_appLocalContexts, "containsObject:", v4);
  else
    v5 = 0;

  return v5;
}

- (void)addMessageExpectationNamed:(id)a3
{
  id v4;
  NSCountedSet *messageExpectations;
  NSCountedSet *v6;
  NSCountedSet *v7;
  id v8;

  v4 = a3;
  messageExpectations = self->_messageExpectations;
  v8 = v4;
  if (!messageExpectations)
  {
    v6 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    v7 = self->_messageExpectations;
    self->_messageExpectations = v6;

    v4 = v8;
    messageExpectations = self->_messageExpectations;
  }
  -[NSCountedSet addObject:](messageExpectations, "addObject:", v4);

}

- (void)removeMessageExpectationNamed:(id)a3
{
  -[NSCountedSet removeObject:](self->_messageExpectations, "removeObject:", a3);
}

- (BOOL)hasMessageExpectationNamed:(id)a3
{
  return -[NSCountedSet containsObject:](self->_messageExpectations, "containsObject:", a3);
}

- (void)removeAllMessageExpectations
{
  -[NSCountedSet removeAllObjects](self->_messageExpectations, "removeAllObjects");
}

- (NSSet)expectedMessages
{
  NSCountedSet *messageExpectations;
  id v4;

  messageExpectations = self->_messageExpectations;
  if (messageExpectations)
    return (NSSet *)(id)-[NSCountedSet copy](messageExpectations, "copy");
  v4 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  return (NSSet *)v4;
}

- (BOOL)isWaitingForMessage
{
  return -[NSCountedSet count](self->_messageExpectations, "count") != 0;
}

- (void)addDestinationIconView:(id)a3
{
  id v4;
  NSMutableSet *destinationIconViews;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  destinationIconViews = self->_destinationIconViews;
  v8 = v4;
  if (!destinationIconViews)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_destinationIconViews;
    self->_destinationIconViews = v6;

    v4 = v8;
    destinationIconViews = self->_destinationIconViews;
  }
  -[NSMutableSet addObject:](destinationIconViews, "addObject:", v4);

}

- (BOOL)hasDestinationIconView:(id)a3
{
  return -[NSMutableSet containsObject:](self->_destinationIconViews, "containsObject:", a3);
}

- (void)enumerateDestinationIconViewsUsingBlock:(id)a3
{
  -[NSMutableSet enumerateObjectsUsingBlock:](self->_destinationIconViews, "enumerateObjectsUsingBlock:", a3);
}

- (void)addIconViewDroppingAssertion:(id)a3 forIconView:(id)a4
{
  id v6;
  NSMapTable *iconViewDroppingAssertions;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  iconViewDroppingAssertions = self->_iconViewDroppingAssertions;
  if (!iconViewDroppingAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_iconViewDroppingAssertions;
    self->_iconViewDroppingAssertions = v8;

    iconViewDroppingAssertions = self->_iconViewDroppingAssertions;
  }
  -[NSMapTable objectForKey:](iconViewDroppingAssertions, "objectForKey:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSMapTable setObject:forKey:](self->_iconViewDroppingAssertions, "setObject:forKey:", v10, v6);
  }
  objc_msgSend(v10, "addObject:", v11);

}

- (BOOL)hasEnteredIconListView:(id)a3
{
  return -[NSMutableSet containsObject:](self->_enteredIconListViews, "containsObject:", a3);
}

- (void)addEnteredIconListView:(id)a3
{
  id v4;
  NSMutableSet *enteredIconListViews;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  enteredIconListViews = self->_enteredIconListViews;
  v8 = v4;
  if (!enteredIconListViews)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_enteredIconListViews;
    self->_enteredIconListViews = v6;

    v4 = v8;
    enteredIconListViews = self->_enteredIconListViews;
  }
  -[NSMutableSet addObject:](enteredIconListViews, "addObject:", v4);

}

- (void)enumerateEnteredIconListViewsUsingBlock:(id)a3
{
  -[NSMutableSet enumerateObjectsUsingBlock:](self->_enteredIconListViews, "enumerateObjectsUsingBlock:", a3);
}

- (void)setTargetIconView:(id)a3 forCancellingIconView:(id)a4
{
  id v6;
  NSMapTable *targetsForCancellingIconViews;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  targetsForCancellingIconViews = self->_targetsForCancellingIconViews;
  if (!targetsForCancellingIconViews)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_targetsForCancellingIconViews;
    self->_targetsForCancellingIconViews = v8;

    targetsForCancellingIconViews = self->_targetsForCancellingIconViews;
  }
  -[NSMapTable setObject:forKey:](targetsForCancellingIconViews, "setObject:forKey:", v10, v6);

}

- (id)targetIconViewForCancellingIconView:(id)a3
{
  return -[NSMapTable objectForKey:](self->_targetsForCancellingIconViews, "objectForKey:", a3);
}

- (void)setRecipientIconView:(id)a3
{
  SBIconView *v5;
  SBIconView *recipientIconView;
  objc_class *v7;
  SBIconView *v8;
  id v9;
  void *v10;
  SBIconView *v11;

  v5 = (SBIconView *)a3;
  recipientIconView = self->_recipientIconView;
  if (recipientIconView != v5)
  {
    v7 = (objc_class *)MEMORY[0x1E0DC3F38];
    v11 = v5;
    v8 = recipientIconView;
    v9 = [v7 alloc];
    +[SBHIconManager defaultIconLayoutAnimationDuration](SBHIconManager, "defaultIconLayoutAnimationDuration");
    v10 = (void *)objc_msgSend(v9, "initWithDuration:curve:animations:", 0, 0);
    -[SBIconView setShowsDropGlow:animator:](v8, "setShowsDropGlow:animator:", 0, v10);
    -[SBIconView setShowsDropGlow:animator:](v11, "setShowsDropGlow:animator:", 1, v10);
    objc_storeStrong((id *)&self->_recipientIconView, a3);

    objc_msgSend(v10, "startAnimation");
    if (!v11)
      -[SBIconDragContext setRecipientIconEntryRegion:](self, "setRecipientIconEntryRegion:", 0);

    v5 = v11;
  }

}

- (id)dragPreviewForIconView:(id)a3
{
  id v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  SBIconDragContext *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_dragPreviewForIconViews;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v19 = self;
    v8 = *(_QWORD *)v21;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
      objc_msgSend(v10, "icon");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "icon");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (v13)
        break;
      if (objc_msgSend(v11, "isPlaceholder"))
      {
        v14 = v11;
        objc_msgSend(v4, "icon");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "referencesIcon:", v15);

        if (v16)
        {
          -[NSMapTable objectForKey:](v19->_dragPreviewForIconViews, "objectForKey:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_15;
        }

      }
      if (v7 == ++v9)
      {
        v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    -[NSMapTable objectForKey:](v19->_dragPreviewForIconViews, "objectForKey:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_16;
  }
LABEL_12:
  v17 = 0;
LABEL_16:

  return v17;
}

- (void)setDragPreview:(id)a3 forIconView:(id)a4
{
  id v6;
  NSMapTable *dragPreviewForIconViews;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  dragPreviewForIconViews = self->_dragPreviewForIconViews;
  if (!dragPreviewForIconViews)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_dragPreviewForIconViews;
    self->_dragPreviewForIconViews = v8;

    dragPreviewForIconViews = self->_dragPreviewForIconViews;
  }
  -[NSMapTable setObject:forKey:](dragPreviewForIconViews, "setObject:forKey:", v10, v6);

}

- (void)enumerateDragPreviewsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, unsigned __int8 *);
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_dragPreviewForIconViews;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
      -[NSMapTable objectForKey:](self->_dragPreviewForIconViews, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      v4[2](v4, v11, v10, &v12);
      LODWORD(v10) = v12;

      if ((_DWORD)v10)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)addAppLocalContext:(id)a3
{
  id v4;
  NSMutableSet *appLocalContexts;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  appLocalContexts = self->_appLocalContexts;
  v8 = v4;
  if (!appLocalContexts)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_appLocalContexts;
    self->_appLocalContexts = v6;

    v4 = v8;
    appLocalContexts = self->_appLocalContexts;
  }
  -[NSMutableSet addObject:](appLocalContexts, "addObject:", v4);

}

- (NSSet)appLocalContexts
{
  NSMutableSet *appLocalContexts;

  appLocalContexts = self->_appLocalContexts;
  if (appLocalContexts)
    return (NSSet *)appLocalContexts;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)appDragLocalContextWithIconIdentifier:(id)a3
{
  id v4;
  NSMutableSet *appLocalContexts;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  appLocalContexts = self->_appLocalContexts;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__SBIconDragContext_appDragLocalContextWithIconIdentifier___block_invoke;
  v10[3] = &unk_1E8D8BBE8;
  v11 = v4;
  v6 = v4;
  -[NSMutableSet objectsPassingTest:](appLocalContexts, "objectsPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __59__SBIconDragContext_appDragLocalContextWithIconIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)resetLastUserInteractionDate
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  -[SBIconDragContext setLastUserInteractionDate:](self, "setLastUserInteractionDate:", v3);

}

- (void)setDestinationFolderIconView:(id)a3 forIconWithIdentifier:(id)a4
{
  id v6;
  NSMutableDictionary *destinationFolderIconViews;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  destinationFolderIconViews = self->_destinationFolderIconViews;
  if (!destinationFolderIconViews)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_destinationFolderIconViews;
    self->_destinationFolderIconViews = v8;

    destinationFolderIconViews = self->_destinationFolderIconViews;
  }
  -[NSMutableDictionary setObject:forKey:](destinationFolderIconViews, "setObject:forKey:", v10, v6);
  -[SBIconDragContext _addPrepareForDropAssertionForIconView:](self, "_addPrepareForDropAssertionForIconView:", v10);

}

- (id)destinationFolderIconViewForIconWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_destinationFolderIconViews, "objectForKey:", a3);
}

- (void)setDestinationStackIconView:(id)a3 forIconWithIdentifier:(id)a4
{
  id v6;
  NSMutableDictionary *destinationStackIconViews;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  destinationStackIconViews = self->_destinationStackIconViews;
  if (!destinationStackIconViews)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_destinationStackIconViews;
    self->_destinationStackIconViews = v8;

    destinationStackIconViews = self->_destinationStackIconViews;
  }
  -[NSMutableDictionary setObject:forKey:](destinationStackIconViews, "setObject:forKey:", v10, v6);
  -[SBIconDragContext _addPrepareForDropAssertionForIconView:](self, "_addPrepareForDropAssertionForIconView:", v10);

}

- (id)destinationStackIconViewForIconWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_destinationStackIconViews, "objectForKey:", a3);
}

- (void)_addPrepareForDropAssertionForIconView:(id)a3
{
  id v4;
  NSMapTable *iconViewPrepareForDropAssertions;
  NSMapTable *v6;
  NSMapTable *v7;
  void *v8;
  id v9;

  v4 = a3;
  iconViewPrepareForDropAssertions = self->_iconViewPrepareForDropAssertions;
  v9 = v4;
  if (!iconViewPrepareForDropAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_iconViewPrepareForDropAssertions;
    self->_iconViewPrepareForDropAssertions = v6;

    v4 = v9;
    iconViewPrepareForDropAssertions = self->_iconViewPrepareForDropAssertions;
  }
  objc_msgSend(v4, "prepareForIconDrop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](iconViewPrepareForDropAssertions, "setObject:forKey:", v8, v9);

}

- (void)clearDropAssertionsForIconView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  v4 = a3;
  -[NSMapTable objectForKey:](self->_iconViewPrepareForDropAssertions, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");
  -[NSMapTable removeObjectForKey:](self->_iconViewPrepareForDropAssertions, "removeObjectForKey:", v4);
  -[NSMapTable objectForKey:](self->_iconViewDroppingAssertions, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "invalidate");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
  -[NSMapTable removeObjectForKey:](self->_iconViewDroppingAssertions, "removeObjectForKey:", v4);

}

- (void)clearAllDropAssertions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
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
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[NSMapTable keyEnumerator](self->_iconViewPrepareForDropAssertions, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        -[SBIconDragContext clearDropAssertionsForIconView:](self, "clearDropAssertionsForIconView:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMapTable keyEnumerator](self->_iconViewDroppingAssertions, "keyEnumerator", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

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
        -[SBIconDragContext clearDropAssertionsForIconView:](self, "clearDropAssertionsForIconView:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (void)addDropAnimatingDragItem:(id)a3
{
  id v4;
  NSMutableSet *dropAnimatingDragItems;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  dropAnimatingDragItems = self->_dropAnimatingDragItems;
  v8 = v4;
  if (!dropAnimatingDragItems)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_dropAnimatingDragItems;
    self->_dropAnimatingDragItems = v6;

    v4 = v8;
    dropAnimatingDragItems = self->_dropAnimatingDragItems;
  }
  -[NSMutableSet addObject:](dropAnimatingDragItems, "addObject:", v4);

}

- (BOOL)isAnimatingDropForDragItem:(id)a3
{
  return -[NSMutableSet containsObject:](self->_dropAnimatingDragItems, "containsObject:", a3);
}

- (id)initialIndexPathForIcon:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "nodeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragContext initialIndexPathForIconWithIdentifier:](self, "initialIndexPathForIconWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)initialIndexPathForIconWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_initialIconPaths, "objectForKey:", a3);
}

- (void)setInitialIndexPath:(id)a3 forIcon:(id)a4
{
  id v6;
  NSMutableDictionary *initialIconPaths;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  initialIconPaths = self->_initialIconPaths;
  if (!initialIconPaths)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_initialIconPaths;
    self->_initialIconPaths = v8;

    initialIconPaths = self->_initialIconPaths;
  }
  objc_msgSend(v6, "nodeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](initialIconPaths, "setObject:forKey:", v11, v10);

}

- (void)setAppDragLocalContext:(id)a3 forDragItem:(id)a4
{
  id v6;
  NSMapTable *appDragLocalContexts;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[SBIconDragContext addAppLocalContext:](self, "addAppLocalContext:", v10);
  appDragLocalContexts = self->_appDragLocalContexts;
  if (!appDragLocalContexts)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_appDragLocalContexts;
    self->_appDragLocalContexts = v8;

    appDragLocalContexts = self->_appDragLocalContexts;
  }
  -[NSMapTable setObject:forKey:](appDragLocalContexts, "setObject:forKey:", v10, v6);

}

- (id)appDragLocalContextForDragItem:(id)a3
{
  return -[NSMapTable objectForKey:](self->_appDragLocalContexts, "objectForKey:", a3);
}

- (void)resetDraggedIconsHiddenAssertion
{
  id v3;

  -[SBIconDragContext draggedIconsHiddenAssertion](self, "draggedIconsHiddenAssertion");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");
  -[SBIconDragContext setDraggedIconsHiddenAssertion:](self, "setDraggedIconsHiddenAssertion:", 0);

}

- (void)resetDragPlaceholder
{
  id v3;

  -[SBIconDragContext dragPlaceholder](self, "dragPlaceholder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");
  -[SBIconDragContext setDragPlaceholder:](self, "setDragPlaceholder:", 0);
  -[SBIconDragContext setDragPlaceholderListView:](self, "setDragPlaceholderListView:", 0);
  -[SBIconDragContext setDragPlaceholderGridSizeClass:](self, "setDragPlaceholderGridSizeClass:", 0);

}

- (NSString)dragPlaceholderGridSizeClass
{
  NSString *v3;
  void *v4;
  void *v5;

  v3 = self->_dragPlaceholderGridSizeClass;
  if (!v3)
  {
    -[SBIconDragContext draggedIcons](self, "draggedIcons");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gridSizeClass");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setIconViewBorrowAssertion:(id)a3 forIconView:(id)a4
{
  id v6;
  NSMapTable *iconViewBorrowAssertions;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  iconViewBorrowAssertions = self->_iconViewBorrowAssertions;
  if (!iconViewBorrowAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_iconViewBorrowAssertions;
    self->_iconViewBorrowAssertions = v8;

    iconViewBorrowAssertions = self->_iconViewBorrowAssertions;
  }
  -[NSMapTable setObject:forKey:](iconViewBorrowAssertions, "setObject:forKey:", v10, v6);

}

- (id)iconViewBorrowAssertionForIconView:(id)a3
{
  return -[NSMapTable objectForKey:](self->_iconViewBorrowAssertions, "objectForKey:", a3);
}

- (BOOL)hasIconViewBorrowAssertions
{
  return -[NSMapTable count](self->_iconViewBorrowAssertions, "count") != 0;
}

- (void)invalidateIconViewBorrowAssertions
{
  NSMapTable *v3;
  NSMapTable *iconViewBorrowAssertions;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = self->_iconViewBorrowAssertions;
  iconViewBorrowAssertions = self->_iconViewBorrowAssertions;
  self->_iconViewBorrowAssertions = 0;

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v3;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[NSMapTable objectForKey:](v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "invalidate");

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)setBorrowedViewController:(id)a3 forIconView:(id)a4
{
  id v6;
  NSMapTable *borrowedViewControllers;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  borrowedViewControllers = self->_borrowedViewControllers;
  if (!borrowedViewControllers)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_borrowedViewControllers;
    self->_borrowedViewControllers = v8;

    borrowedViewControllers = self->_borrowedViewControllers;
  }
  -[NSMapTable setObject:forKey:](borrowedViewControllers, "setObject:forKey:", v10, v6);

}

- (id)borrowedViewControllerForIconView:(id)a3
{
  return -[NSMapTable objectForKey:](self->_borrowedViewControllers, "objectForKey:", a3);
}

- (NSString)description
{
  return (NSString *)-[SBIconDragContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconDragContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  unint64_t v5;
  __CFString *v6;
  id v7;
  id v8;
  SBIconListViewPlaceholderPositioning *dragPlaceholder;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBIconDragContext state](self, "state");
  if (v5 > 6)
    v6 = 0;
  else
    v6 = off_1E8D8BC08[v5];
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("state"));
  v8 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_draggedIconsHiddenAssertion, CFSTR("draggedIconsHiddenAssertion"), 1);
  dragPlaceholder = self->_dragPlaceholder;
  if (dragPlaceholder)
  {
    v10 = (id)objc_msgSend(v4, "appendObject:withName:", dragPlaceholder, CFSTR("dragPlaceholder"));
    v11 = (id)objc_msgSend(v4, "appendObject:withName:", self->_dragPlaceholderListView, CFSTR("dragPlaceholderListView"));
    SBHStringForIconGridSizeClass(self->_dragPlaceholderGridSizeClass);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v12, CFSTR("dragPlaceholderGridSizeClass"));

  }
  v13 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_grabbedIconViews, CFSTR("grabbedIconViews"), 1);
  v14 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_itemIdentifiers, CFSTR("itemIdentifiers"), 1);
  v15 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_sourceIcons, CFSTR("sourceIcons"), 1);
  v16 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_sourceIconViews, CFSTR("sourceIconViews"), 1);
  v17 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_primaryIconView, CFSTR("primaryIconView"), 1);
  v18 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_destinationIconViews, CFSTR("destinationIconViews"), 1);
  v19 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBIconDragContext performedIconDrop](self, "performedIconDrop"), CFSTR("performedIconDrop"), 1);
  v20 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBIconDragContext isCancelled](self, "isCancelled"), CFSTR("cancelled"), 1);
  v21 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_messageExpectations, CFSTR("messageExpectations"), 1);
  v22 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_enteredIconListViews, CFSTR("enteredIconListViews"), 1);
  v23 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_targetsForCancellingIconViews, CFSTR("targetsForCancellingIconViews"), 1);
  v24 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_recipientIconView, CFSTR("recipientIconView"), 1);
  v25 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_dragPreviewForIconViews, CFSTR("dragPreviewForIconViews"), 1);
  v26 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_appLocalContexts, CFSTR("appLocalContexts"), 1);
  v27 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_lastUserInteractionDate, CFSTR("lastUserInteractionDate"), 1);
  v28 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_destinationFolderIconViews, CFSTR("destinationFolderIconViews"), 1);
  v29 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_dropAnimatingDragItems, CFSTR("dropAnimatingDragItems"), 1);
  v30 = (id)objc_msgSend(v4, "appendBool:withName:", self->_notifiedDelegateForDropSession, CFSTR("notifiedDelegateForDropSession"));
  v31 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_droppedIcons, CFSTR("droppedIcons"), 1);
  v32 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_dragItemWasConsumedExternally, CFSTR("dragItemWasConsumedExternally"), 1);
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconDragContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (BOOL)isExternalDrag
{
  return self->_externalDrag;
}

- (void)setExternalDrag:(BOOL)a3
{
  self->_externalDrag = a3;
}

- (BOOL)isSnapToGridAllowed
{
  return self->_snapToGridAllowed;
}

- (void)setSnapToGridAllowed:(BOOL)a3
{
  self->_snapToGridAllowed = a3;
}

- (SBHIconLayoutHidingUpdating)draggedIconsHiddenAssertion
{
  return self->_draggedIconsHiddenAssertion;
}

- (void)setDraggedIconsHiddenAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_draggedIconsHiddenAssertion, a3);
}

- (SBIconListViewPlaceholderPositioning)dragPlaceholder
{
  return self->_dragPlaceholder;
}

- (void)setDragPlaceholder:(id)a3
{
  objc_storeStrong((id *)&self->_dragPlaceholder, a3);
}

- (SBIconListView)dragPlaceholderListView
{
  return self->_dragPlaceholderListView;
}

- (void)setDragPlaceholderListView:(id)a3
{
  objc_storeStrong((id *)&self->_dragPlaceholderListView, a3);
}

- (void)setDragPlaceholderGridSizeClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSArray)grabbedIconViews
{
  return self->_grabbedIconViews;
}

- (void)setGrabbedIconViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSArray)createdApplicationIcons
{
  return self->_createdApplicationIcons;
}

- (void)setCreatedApplicationIcons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSArray)createdWidgetIcons
{
  return self->_createdWidgetIcons;
}

- (void)setCreatedWidgetIcons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSArray)externallyDraggedIcons
{
  return self->_externallyDraggedIcons;
}

- (void)setExternallyDraggedIcons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (void)setItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSArray)sourceIcons
{
  return self->_sourceIcons;
}

- (void)setSourceIcons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSSet)removedMatchingLeafIcons
{
  return self->_removedMatchingLeafIcons;
}

- (void)setRemovedMatchingLeafIcons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void)setDroppedIcons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (SBIconView)primaryIconView
{
  return self->_primaryIconView;
}

- (void)setPrimaryIconView:(id)a3
{
  objc_storeStrong((id *)&self->_primaryIconView, a3);
}

- (BOOL)duplicatesSourceIcons
{
  return self->_duplicatesSourceIcons;
}

- (void)setDuplicatesSourceIcons:(BOOL)a3
{
  self->_duplicatesSourceIcons = a3;
}

- (BOOL)performedIconDrop
{
  return self->_performedIconDrop;
}

- (void)setPerformedIconDrop:(BOOL)a3
{
  self->_performedIconDrop = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)dragItemWasConsumedExternally
{
  return self->_dragItemWasConsumedExternally;
}

- (void)setDragItemWasConsumedExternally:(BOOL)a3
{
  self->_dragItemWasConsumedExternally = a3;
}

- (SBIconListView)currentEnteredIconListView
{
  return (SBIconListView *)objc_loadWeakRetained((id *)&self->_currentEnteredIconListView);
}

- (void)setCurrentEnteredIconListView:(id)a3
{
  objc_storeWeak((id *)&self->_currentEnteredIconListView, a3);
}

- (CGPoint)currentEnteredIconListViewLastLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentEnteredIconListViewLastLocation.x;
  y = self->_currentEnteredIconListViewLastLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCurrentEnteredIconListViewLastLocation:(CGPoint)a3
{
  self->_currentEnteredIconListViewLastLocation = a3;
}

- (double)currentEnteredIconListViewDragDistance
{
  return self->_currentEnteredIconListViewDragDistance;
}

- (void)setCurrentEnteredIconListViewDragDistance:(double)a3
{
  self->_currentEnteredIconListViewDragDistance = a3;
}

- (SBIconView)recipientIconView
{
  return self->_recipientIconView;
}

- (SBIcon)candidateRecipientIcon
{
  return self->_candidateRecipientIcon;
}

- (void)setCandidateRecipientIcon:(id)a3
{
  objc_storeStrong((id *)&self->_candidateRecipientIcon, a3);
}

- (unint64_t)recipientIconEntryRegion
{
  return self->_recipientIconEntryRegion;
}

- (void)setRecipientIconEntryRegion:(unint64_t)a3
{
  self->_recipientIconEntryRegion = a3;
}

- (NSDate)lastUserInteractionDate
{
  return self->_lastUserInteractionDate;
}

- (void)setLastUserInteractionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSTimer)watchdogTimer
{
  return self->_watchdogTimer;
}

- (void)setWatchdogTimer:(id)a3
{
  objc_storeStrong((id *)&self->_watchdogTimer, a3);
}

- (CGPoint)initialTouchOffsetFromIconImageCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialTouchOffsetFromIconImageCenter.x;
  y = self->_initialTouchOffsetFromIconImageCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialTouchOffsetFromIconImageCenter:(CGPoint)a3
{
  self->_initialTouchOffsetFromIconImageCenter = a3;
}

- (BOOL)notifiedDelegateForDropSession
{
  return self->_notifiedDelegateForDropSession;
}

- (void)setNotifiedDelegateForDropSession:(BOOL)a3
{
  self->_notifiedDelegateForDropSession = a3;
}

- (BSInvalidatable)destinationStackIconViewPauseLayoutAssertion
{
  return self->_destinationStackIconViewPauseLayoutAssertion;
}

- (void)setDestinationStackIconViewPauseLayoutAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_destinationStackIconViewPauseLayoutAssertion, a3);
}

- (BOOL)wasLastUpdateContainedInDestinationIconListView
{
  return self->_wasLastUpdateContainedInDestinationIconListView;
}

- (void)setWasLastUpdateContainedInDestinationIconListView:(BOOL)a3
{
  self->_wasLastUpdateContainedInDestinationIconListView = a3;
}

- (BOOL)isWaitingToSetPlaceholderViewController
{
  return self->_waitingToSetPlaceholderViewController;
}

- (void)setWaitingToSetPlaceholderViewController:(BOOL)a3
{
  self->_waitingToSetPlaceholderViewController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationStackIconViewPauseLayoutAssertion, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_lastUserInteractionDate, 0);
  objc_storeStrong((id *)&self->_candidateRecipientIcon, 0);
  objc_storeStrong((id *)&self->_recipientIconView, 0);
  objc_destroyWeak((id *)&self->_currentEnteredIconListView);
  objc_storeStrong((id *)&self->_primaryIconView, 0);
  objc_storeStrong((id *)&self->_removedMatchingLeafIcons, 0);
  objc_storeStrong((id *)&self->_sourceIcons, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_externallyDraggedIcons, 0);
  objc_storeStrong((id *)&self->_createdWidgetIcons, 0);
  objc_storeStrong((id *)&self->_createdApplicationIcons, 0);
  objc_storeStrong((id *)&self->_grabbedIconViews, 0);
  objc_storeStrong((id *)&self->_dragPlaceholderGridSizeClass, 0);
  objc_storeStrong((id *)&self->_dragPlaceholderListView, 0);
  objc_storeStrong((id *)&self->_dragPlaceholder, 0);
  objc_storeStrong((id *)&self->_draggedIconsHiddenAssertion, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_discardedSourceIconViews, 0);
  objc_storeStrong((id *)&self->_borrowedViewControllers, 0);
  objc_storeStrong((id *)&self->_iconViewBorrowAssertions, 0);
  objc_storeStrong((id *)&self->_droppedIcons, 0);
  objc_storeStrong((id *)&self->_grabbedIcons, 0);
  objc_storeStrong((id *)&self->_additionalMatchingDroppedIcons, 0);
  objc_storeStrong((id *)&self->_iconViewDroppingAssertions, 0);
  objc_storeStrong((id *)&self->_iconViewPrepareForDropAssertions, 0);
  objc_storeStrong((id *)&self->_appDragLocalContexts, 0);
  objc_storeStrong((id *)&self->_initialIconPaths, 0);
  objc_storeStrong((id *)&self->_dropAnimatingDragItems, 0);
  objc_storeStrong((id *)&self->_destinationStackIconViews, 0);
  objc_storeStrong((id *)&self->_destinationFolderIconViews, 0);
  objc_storeStrong((id *)&self->_appLocalContexts, 0);
  objc_storeStrong((id *)&self->_dragPreviewForIconViews, 0);
  objc_storeStrong((id *)&self->_targetsForCancellingIconViews, 0);
  objc_storeStrong((id *)&self->_enteredIconListViews, 0);
  objc_storeStrong((id *)&self->_messageExpectations, 0);
  objc_storeStrong((id *)&self->_destinationIconViews, 0);
  objc_storeStrong((id *)&self->_sourceIconViews, 0);
}

@end
