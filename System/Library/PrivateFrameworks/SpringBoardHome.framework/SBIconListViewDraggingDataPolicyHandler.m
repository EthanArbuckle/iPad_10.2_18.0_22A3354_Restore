@implementation SBIconListViewDraggingDataPolicyHandler

- (SBIconListViewDraggingDataPolicyHandler)init
{
  SBIconListViewDraggingDataPolicyHandler *v2;
  uint64_t v3;
  NSMapTable *sourceURLsByOperationMapTable;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBIconListViewDraggingDataPolicyHandler;
  v2 = -[SBIconListViewDraggingDataPolicyHandler init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    sourceURLsByOperationMapTable = v2->_sourceURLsByOperationMapTable;
    v2->_sourceURLsByOperationMapTable = (NSMapTable *)v3;

  }
  return v2;
}

- (unint64_t)dragHitRegionForDropSession:(id)a3 iconListView:(id)a4 point:(CGPoint)a5 icon:(id)a6
{
  return objc_msgSend(a4, "dragHitRegionForPoint:icon:", a6, a5.x, a5.y);
}

- (BOOL)allowsSpringLoadForSession:(id)a3 onIconView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[SBIconListViewDraggingDataPolicyHandler draggingDestinationDelegate](self, "draggingDestinationDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconListView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "contentVisibility"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v8, "dragDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "iconListView:shouldAllowSpringLoadedInteractionForIconDropSession:onIconView:", v9, v6, v7);

  }
  return v10;
}

- (void)handleSpringLoadOnIconView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  SBHIconLaunchContext *v6;

  v3 = a3;
  v6 = objc_alloc_init(SBHIconLaunchContext);
  -[SBHIconLaunchContext setIconView:](v6, "setIconView:", v3);
  objc_msgSend(v3, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "launchFromLocation:context:", v5, v6);
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  return 0;
}

- (void)_removeAnySourceURLForOperation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMapTable objectForKey:](self->_sourceURLsByOperationMapTable, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeItemAtURL:error:", v4, 0);

    -[NSMapTable removeObjectForKey:](self->_sourceURLsByOperationMapTable, "removeObjectForKey:", v6);
  }

}

- (id)_currentDraggingIconViewInView:(id)a3 forLocation:(CGPoint)a4
{
  double y;
  double x;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  y = a4.y;
  x = a4.x;
  v6 = a3;
  objc_opt_class();
  SBFSafeCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "iconAtPoint:index:", 0, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "iconViewForIcon:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_bestSupportedUTIForDragItem:(id)a3 supportedTypes:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  id v26;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "itemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registeredTypeIdentifiersWithFileOptions:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v9 = v7;
  v29 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v29)
  {
    v10 = *(_QWORD *)v41;
    v30 = v9;
    v31 = v8;
    v28 = *(_QWORD *)v41;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(v9);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v11);
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v12, v28);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v14 = v8;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v37;
          while (2)
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v37 != v17)
                objc_enumerationMutation(v14);
              objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v13, "conformsToType:", v19)
                && (objc_msgSend(v6, "hasRepresentationConformingToTypeIdentifier:fileOptions:", v12, 0) & 1) != 0)
              {
                v26 = v12;

                v9 = v30;
                v8 = v31;
                v20 = v30;
                goto LABEL_28;
              }

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
            if (v16)
              continue;
            break;
          }
        }

        ++v11;
        v9 = v30;
        v8 = v31;
        v10 = v28;
      }
      while (v11 != v29);
      v29 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v29);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v20 = v8;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v33;
    while (2)
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        if ((objc_msgSend(v6, "hasRepresentationConformingToTypeIdentifier:fileOptions:", v25, 0) & 1) != 0)
        {
          v26 = v25;
          goto LABEL_28;
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
      if (v22)
        continue;
      break;
    }
  }
  v26 = 0;
LABEL_28:

  return v26;
}

- (SBIconListViewDraggingDestinationDelegate)draggingDestinationDelegate
{
  return (SBIconListViewDraggingDestinationDelegate *)objc_loadWeakRetained((id *)&self->_draggingDestinationDelegate);
}

- (void)setDraggingDestinationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_draggingDestinationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_draggingDestinationDelegate);
  objc_storeStrong((id *)&self->_sourceURLsByOperationMapTable, 0);
}

@end
