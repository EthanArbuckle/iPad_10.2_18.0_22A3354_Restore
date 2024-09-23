@implementation SBIconDragUndoLayoutDelegatePreModificationInfo

- (SBIconDragUndoLayoutDelegatePreModificationInfo)initWithRootFolderController:(id)a3
{
  id v5;
  SBIconDragUndoLayoutDelegatePreModificationInfo *v6;
  SBIconDragUndoLayoutDelegatePreModificationInfo *v7;
  void *v8;
  NSMapTable *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *visibleListViews;
  NSMapTable *originalIconsPerListView;
  NSMapTable *v27;
  NSMapTable *originalScreenLocationsPerIcon;
  id v30;
  SBIconDragUndoLayoutDelegatePreModificationInfo *v31;
  id v32;
  id obj;
  uint64_t v34;
  NSMapTable *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[2];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v47.receiver = self;
  v47.super_class = (Class)SBIconDragUndoLayoutDelegatePreModificationInfo;
  v6 = -[SBIconDragUndoLayoutDelegatePreModificationInfo init](&v47, sel_init);
  v7 = v6;
  if (v6)
  {
    v30 = a3;
    v31 = v6;
    v32 = v5;
    objc_msgSend(v5, "visibleIconListViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v35 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v9 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v8;
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v36)
    {
      v34 = *(_QWORD *)v44;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v44 != v34)
            objc_enumerationMutation(obj);
          v37 = v10;
          v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v10);
          objc_msgSend(v11, "icons");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable setObject:forKey:](v35, "setObject:forKey:", v12, v11);
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v13 = v12;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v40 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
                objc_msgSend(v11, "displayedIconViewForIcon:", v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = v19;
                if (v19)
                {
                  objc_msgSend(v19, "center");
                  objc_msgSend(v11, "convertPoint:toView:", 0);
                  v38[0] = v21;
                  v38[1] = v22;
                  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v38, "{CGPoint=dd}");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMapTable setObject:forKey:](v9, "setObject:forKey:", v23, v18);

                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
            }
            while (v15);
          }

          v10 = v37 + 1;
        }
        while (v37 + 1 != v36);
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v36);
    }

    v7 = v31;
    objc_storeStrong((id *)&v31->_rootFolderController, v30);
    v24 = objc_msgSend(obj, "copy");
    visibleListViews = v31->_visibleListViews;
    v31->_visibleListViews = (NSArray *)v24;

    originalIconsPerListView = v31->_originalIconsPerListView;
    v31->_originalIconsPerListView = v35;
    v27 = v35;

    originalScreenLocationsPerIcon = v31->_originalScreenLocationsPerIcon;
    v31->_originalScreenLocationsPerIcon = v9;

    v5 = v32;
  }

  return v7;
}

- (SBRootFolderController)rootFolderController
{
  return self->_rootFolderController;
}

- (NSArray)visibleListViews
{
  return self->_visibleListViews;
}

- (NSMapTable)originalIconsPerListView
{
  return self->_originalIconsPerListView;
}

- (NSMapTable)originalScreenLocationsPerIcon
{
  return self->_originalScreenLocationsPerIcon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalScreenLocationsPerIcon, 0);
  objc_storeStrong((id *)&self->_originalIconsPerListView, 0);
  objc_storeStrong((id *)&self->_visibleListViews, 0);
  objc_storeStrong((id *)&self->_rootFolderController, 0);
}

@end
