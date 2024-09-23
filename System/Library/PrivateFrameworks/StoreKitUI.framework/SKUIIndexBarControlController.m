@implementation SKUIIndexBarControlController

- (SKUIIndexBarControlController)init
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SKUIIndexBarControlController *v11;
  uint64_t v12;
  NSMapTable *entryDescriptorToCachedEntry;
  void *v14;
  objc_super v16;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIIndexBarControlController init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIIndexBarControlController;
  v11 = -[SKUIIndexBarControlController init](&v16, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 1);
    entryDescriptorToCachedEntry = v11->_entryDescriptorToCachedEntry;
    v11->_entryDescriptorToCachedEntry = (NSMapTable *)v12;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v11, sel__artworkRequestDidLoadImageNotification_, CFSTR("SKUIArtworkRequestDidLoadImageNotification"), 0);

  }
  return v11;
}

- (SKUIIndexBarControlController)initWithIndexBarControl:(id)a3
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKUIIndexBarControlController *v14;
  SKUIIndexBarControlController *v15;
  SKUIIndexBarControl *indexBarControl;
  void *v17;

  v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIIndexBarControlController initWithIndexBarControl:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v14 = -[SKUIIndexBarControlController init](self, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_indexBarControl, a3);
    -[SKUIIndexBarControl setDataSource:](v15->_indexBarControl, "setDataSource:", v15);
    -[SKUIIndexBarControl setDelegate:](v15->_indexBarControl, "setDelegate:", v15);
    indexBarControl = v15->_indexBarControl;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIIndexBarControl setBackgroundColor:](indexBarControl, "setBackgroundColor:", v17);

  }
  return v15;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SKUIArtworkRequestDidLoadImageNotification"), 0);
  -[SKUIIndexBarControl setDataSource:](self->_indexBarControl, "setDataSource:", 0);
  -[SKUIIndexBarControl setDelegate:](self->_indexBarControl, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)SKUIIndexBarControlController;
  -[SKUIIndexBarControlController dealloc](&v4, sel_dealloc);
}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  char v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_dataSource, obj);
    *(_BYTE *)&self->_dataSourceDelegateFlags = *(_BYTE *)&self->_dataSourceDelegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;

    v6 = objc_loadWeakRetained((id *)&self->_dataSource);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 2;
    else
      v7 = 0;
    *(_BYTE *)&self->_dataSourceDelegateFlags = *(_BYTE *)&self->_dataSourceDelegateFlags & 0xFD | v7;

    -[SKUIIndexBarControlController reloadData](self, "reloadData");
  }

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  char v6;
  id v7;
  char v8;
  id v9;
  char v10;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_delegate, obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *(_BYTE *)&self->_dataSourceDelegateFlags = *(_BYTE *)&self->_dataSourceDelegateFlags & 0xFB | v6;

    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 8;
    else
      v8 = 0;
    *(_BYTE *)&self->_dataSourceDelegateFlags = *(_BYTE *)&self->_dataSourceDelegateFlags & 0xF7 | v8;

    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 16;
    else
      v10 = 0;
    *(_BYTE *)&self->_dataSourceDelegateFlags = *(_BYTE *)&self->_dataSourceDelegateFlags & 0xEF | v10;

  }
}

- (void)reloadCombinedEntryDescriptor
{
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_combinedEntryDescriptor)
  {
    v4[0] = self->_combinedEntryDescriptor;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIIndexBarControlController _cancelLoadForEntryDescriptors:](self, "_cancelLoadForEntryDescriptors:", v3);

  }
  self->_hasValidCombinedEntryDescriptor = 0;
  -[SKUIIndexBarControl reloadCombinedEntry](self->_indexBarControl, "reloadCombinedEntry");
}

- (void)reloadEntryDescriptorAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMapTable objectForKey:](self->_indexPathToEntryDescriptor, "objectForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIIndexBarControlController _cancelLoadForEntryDescriptors:](self, "_cancelLoadForEntryDescriptors:", v7);

    -[NSMapTable removeObjectForKey:](self->_indexPathToEntryDescriptor, "removeObjectForKey:", v4);
    -[NSMapTable objectEnumerator](self->_indexPathToEntryDescriptor, "objectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v6);

    if ((v10 & 1) == 0)
      -[NSMapTable removeObjectForKey:](self->_entryDescriptorToCachedEntry, "removeObjectForKey:", v6);
  }

}

- (void)reloadSections:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __48__SKUIIndexBarControlController_reloadSections___block_invoke;
  v21[3] = &unk_1E73A25B8;
  v21[4] = self;
  v6 = v5;
  v22 = v6;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v21);
  if (objc_msgSend(v6, "count"))
  {
    v16 = v4;
    -[SKUIIndexBarControlController _cancelLoadForEntryDescriptors:](self, "_cancelLoadForEntryDescriptors:", v6);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
          -[NSMapTable objectEnumerator](self->_indexPathToEntryDescriptor, "objectEnumerator");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "allObjects");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "containsObject:", v12);

          if ((v15 & 1) == 0)
            -[NSMapTable removeObjectForKey:](self->_entryDescriptorToCachedEntry, "removeObjectForKey:", v12);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v9);
    }

    v4 = v16;
  }
  -[SKUIIndexBarControl reloadSections:](self->_indexBarControl, "reloadSections:", v4);

}

void __48__SKUIIndexBarControlController_reloadSections___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "section") == a2)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)reloadData
{
  void *v3;
  void *v4;
  NSMapTable *indexPathToEntryDescriptor;

  self->_hasValidCombinedEntryDescriptor = 0;
  -[NSMapTable objectEnumerator](self->_indexPathToEntryDescriptor, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIIndexBarControlController _cancelLoadForEntryDescriptors:](self, "_cancelLoadForEntryDescriptors:", v4);

  indexPathToEntryDescriptor = self->_indexPathToEntryDescriptor;
  self->_indexPathToEntryDescriptor = 0;

  -[SKUIIndexBarControl reloadData](self->_indexBarControl, "reloadData");
}

- (id)combinedEntryForIndexBarControl:(id)a3
{
  void *v3;
  void *v5;

  if ((*(_BYTE *)&self->_dataSourceDelegateFlags & 1) != 0)
  {
    -[SKUIIndexBarControlController _combinedEntryDescriptor](self, "_combinedEntryDescriptor", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[SKUIIndexBarControlController _entryForEntryDescriptor:loadingIfNeeded:](self, "_entryForEntryDescriptor:loadingIfNeeded:", v5, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    +[SKUIIndexBarEntry systemCombinedEntry](SKUIIndexBarEntry, "systemCombinedEntry", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)indexBarControl:(id)a3 entryAtIndexPath:(id)a4
{
  void *v5;
  void *v6;

  -[SKUIIndexBarControlController _entryDescriptorAtIndexPath:](self, "_entryDescriptorAtIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIIndexBarControlController _entryForEntryDescriptor:loadingIfNeeded:](self, "_entryForEntryDescriptor:loadingIfNeeded:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)numberOfSectionsInIndexBarControl:(id)a3
{
  SKUIIndexBarControl *v4;
  int64_t v5;
  id WeakRetained;

  v4 = (SKUIIndexBarControl *)a3;
  if (self->_indexBarControl == v4)
  {
    if ((*(_BYTE *)&self->_dataSourceDelegateFlags & 2) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      v5 = objc_msgSend(WeakRetained, "numberOfSectionsInIndexBarControlController:", self);

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

  return v5;
}

- (int64_t)indexBarControl:(id)a3 numberOfEntriesInSection:(int64_t)a4
{
  id WeakRetained;
  int64_t v8;

  if (self->_indexBarControl != a3)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v8 = objc_msgSend(WeakRetained, "indexBarControlController:numberOfEntryDescriptorsInSection:", self, a4);

  return v8;
}

- (void)indexBarControl:(id)a3 didSelectEntryAtIndexPath:(id)a4
{
  SKUIIndexBarControlControllerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  if ((*(_BYTE *)&self->_dataSourceDelegateFlags & 4) != 0)
  {
    p_delegate = &self->_delegate;
    v6 = a4;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "indexBarControlController:didSelectEntryDescriptorAtIndexPath:", self, v6);

  }
}

- (void)indexBarControlDidSelectBeyondBottom:(id)a3
{
  id WeakRetained;

  if ((*(_BYTE *)&self->_dataSourceDelegateFlags & 8) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "indexBarControlControllerDidSelectBeyondBottom:", self);

  }
}

- (void)indexBarControlDidSelectBeyondTop:(id)a3
{
  id WeakRetained;

  if ((*(_BYTE *)&self->_dataSourceDelegateFlags & 0x10) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "indexBarControlControllerDidSelectBeyondTop:", self);

  }
}

- (void)_artworkRequestDidLoadImageNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", objc_msgSend(v8, "requestIdentifier"));
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("SKUIArtworkRequestImageKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIIndexBarControlController _finishLoadForRequestID:withResultingImage:](self, "_finishLoadForRequestID:withResultingImage:", v5, v7);
}

- (void)_cancelLoadForEntryDescriptors:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSMapTable *requestIDToDescriptors;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[SKUIIndexBarControlController _URLForEntryDescriptor:](self, "_URLForEntryDescriptor:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[SKUIResourceLoader requestIdentifierForCacheKey:](self->_resourceLoader, "requestIdentifierForCacheKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            -[NSMapTable objectForKey:](self->_requestIDToDescriptors, "objectForKey:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "count"))
            {
              objc_msgSend(v12, "removeObject:", v9);
              if (!objc_msgSend(v12, "count"))
              {
                -[NSMapTable removeObjectForKey:](self->_requestIDToDescriptors, "removeObjectForKey:", v11);
                if (!-[NSMapTable count](self->_requestIDToDescriptors, "count"))
                {
                  requestIDToDescriptors = self->_requestIDToDescriptors;
                  self->_requestIDToDescriptors = 0;

                }
                -[SKUIResourceLoader trySetReason:forRequestWithIdentifier:](self->_resourceLoader, "trySetReason:forRequestWithIdentifier:", 0, objc_msgSend(v11, "unsignedIntegerValue"));
              }
            }

          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (id)_cachedEntryForEntryDescriptor:(id)a3
{
  id v4;
  NSMapTable *entryDescriptorToCachedEntry;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  entryDescriptorToCachedEntry = self->_entryDescriptorToCachedEntry;
  if (!entryDescriptorToCachedEntry
    || (v6 = NSMapGet(entryDescriptorToCachedEntry, v4)) == 0)
  {
    v7 = objc_msgSend(v4, "entryDescriptorType");
    switch(v7)
    {
      case 0:
        objc_msgSend(v4, "size");
        +[SKUIIndexBarEntry placeholderEntryWithSize:](SKUIIndexBarEntry, "placeholderEntryWithSize:");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v6)
          goto LABEL_13;
LABEL_11:
        -[SKUIIndexBarControlController _configureEntry:withEntryDescriptor:](self, "_configureEntry:withEntryDescriptor:", v6, v4);
        -[NSMapTable setObject:forKey:](self->_entryDescriptorToCachedEntry, "setObject:forKey:", v6, v4);
        goto LABEL_13;
      case 3:
        objc_msgSend(v4, "image");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[SKUIIndexBarEntry entryWithImage:](SKUIIndexBarEntry, "entryWithImage:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      case 1:
        objc_msgSend(v4, "attributedString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[SKUIIndexBarEntry entryWithAttributedString:](SKUIIndexBarEntry, "entryWithAttributedString:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        v6 = 0;
        goto LABEL_13;
    }
    v6 = (void *)v9;

    if (v6)
      goto LABEL_11;
  }
LABEL_13:

  return v6;
}

- (id)_combinedEntryDescriptor
{
  id WeakRetained;
  SKUIIndexBarEntryDescriptor *v4;
  SKUIIndexBarEntryDescriptor *combinedEntryDescriptor;

  if (!self->_hasValidCombinedEntryDescriptor)
  {
    if ((*(_BYTE *)&self->_dataSourceDelegateFlags & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      objc_msgSend(WeakRetained, "combinedEntryDescriptorForIndexBarControlController:", self);
      v4 = (SKUIIndexBarEntryDescriptor *)objc_claimAutoreleasedReturnValue();
      combinedEntryDescriptor = self->_combinedEntryDescriptor;
      self->_combinedEntryDescriptor = v4;

    }
    self->_hasValidCombinedEntryDescriptor = 1;
  }
  return self->_combinedEntryDescriptor;
}

- (void)_configureEntry:(id)a3 withEntryDescriptor:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a4;
  v7 = a3;
  objc_msgSend(v5, "contentEdgeInsets");
  objc_msgSend(v7, "setContentEdgeInsets:");
  v6 = objc_msgSend(v5, "visibilityPriority");

  objc_msgSend(v7, "setVisibilityPriority:", v6);
}

- (id)_entryDescriptorAtIndexPath:(id)a3
{
  id v4;
  NSMapTable *indexPathToEntryDescriptor;
  void *v6;
  id WeakRetained;
  NSMapTable *v8;
  NSMapTable *v9;
  NSMapTable *v10;

  v4 = a3;
  indexPathToEntryDescriptor = self->_indexPathToEntryDescriptor;
  if (!indexPathToEntryDescriptor
    || (v6 = NSMapGet(indexPathToEntryDescriptor, v4)) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "indexBarControlController:entryDescriptorAtIndexPath:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = self->_indexPathToEntryDescriptor;
    if (!v8)
    {
      v9 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 1);
      v10 = self->_indexPathToEntryDescriptor;
      self->_indexPathToEntryDescriptor = v9;

      v8 = self->_indexPathToEntryDescriptor;
    }
    -[NSMapTable setObject:forKey:](v8, "setObject:forKey:", v6, v4);
  }

  return v6;
}

- (id)_entryForEntryDescriptor:(id)a3 loadingIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  -[SKUIIndexBarControlController _cachedEntryForEntryDescriptor:](self, "_cachedEntryForEntryDescriptor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[SKUIIndexBarControlController _placeholderEntryForEntryDescriptor:](self, "_placeholderEntryForEntryDescriptor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      -[SKUIIndexBarControlController _loadEntryForEntryDescriptor:](self, "_loadEntryForEntryDescriptor:", v6);
  }

  return v7;
}

- (void)_finishLoadForRequestID:(id)a3 withResultingImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMapTable *requestIDToDescriptors;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[NSMapTable objectForKey:](self->_requestIDToDescriptors, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[NSMapTable removeObjectForKey:](self->_requestIDToDescriptors, "removeObjectForKey:", v6);
      if (!-[NSMapTable count](self->_requestIDToDescriptors, "count"))
      {
        requestIDToDescriptors = self->_requestIDToDescriptors;
        self->_requestIDToDescriptors = 0;

      }
      if (v7)
      {
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v17 = v8;
        v10 = v8;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
              +[SKUIIndexBarEntry entryWithImage:](SKUIIndexBarEntry, "entryWithImage:", v7);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[SKUIIndexBarControlController _configureEntry:withEntryDescriptor:](self, "_configureEntry:withEntryDescriptor:", v16, v15);
              -[SKUIIndexBarControlController _updateCachedEntry:forEntryDescriptor:](self, "_updateCachedEntry:forEntryDescriptor:", v16, v15);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          }
          while (v12);
        }

        v8 = v17;
      }
    }

  }
}

- (void)_loadEntryForEntryDescriptor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMapTable *v8;
  NSMapTable *requestIDToDescriptors;
  SKUIArtworkRequest *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  -[SKUIIndexBarControlController _URLForEntryDescriptor:](self, "_URLForEntryDescriptor:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SKUIResourceLoader requestIdentifierForCacheKey:](self->_resourceLoader, "requestIdentifierForCacheKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && (-[NSMapTable objectForKey:](self->_requestIDToDescriptors, "objectForKey:", v5),
          (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = v6;
      objc_msgSend(v6, "addObject:", v13);
    }
    else
    {
      if (!self->_requestIDToDescriptors)
      {
        v8 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 1);
        requestIDToDescriptors = self->_requestIDToDescriptors;
        self->_requestIDToDescriptors = v8;

      }
      v10 = objc_alloc_init(SKUIArtworkRequest);
      -[SKUIResourceRequest setCacheKey:](v10, "setCacheKey:", v4);
      +[SSVURLDataConsumer consumer](SKUIImageDataConsumer, "consumer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIArtworkRequest setDataConsumer:](v10, "setDataConsumer:", v11);

      -[SKUIArtworkRequest setURL:](v10, "setURL:", v4);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SKUIResourceRequest requestIdentifier](v10, "requestIdentifier"));
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      -[NSMapTable setObject:forKey:](self->_requestIDToDescriptors, "setObject:forKey:", v7, v12);
      objc_msgSend(v7, "addObject:", v13);
      if (v10)
      {
        -[SKUIResourceLoader loadResourceWithRequest:reason:](self->_resourceLoader, "loadResourceWithRequest:reason:", v10, 1);

      }
      v5 = (void *)v12;
    }

  }
}

- (id)_placeholderEntryForEntryDescriptor:(id)a3
{
  objc_msgSend(a3, "size");
  return +[SKUIIndexBarEntry placeholderEntryWithSize:](SKUIIndexBarEntry, "placeholderEntryWithSize:");
}

- (void)_updateCachedEntry:(id)a3 forEntryDescriptor:(id)a4
{
  id v6;
  id v7;
  NSMapTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_indexPathToEntryDescriptor;
  v9 = -[NSMapTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_indexPathToEntryDescriptor, "objectForKey:", v13, (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqual:", v7))
        {
          -[NSMapTable setObject:forKey:](self->_entryDescriptorToCachedEntry, "setObject:forKey:", v6, v7);
          -[SKUIIndexBarControl reloadEntryAtIndexPath:](self->_indexBarControl, "reloadEntryAtIndexPath:", v13);
        }

      }
      v10 = -[NSMapTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  if (-[SKUIIndexBarEntryDescriptor isEqual:](self->_combinedEntryDescriptor, "isEqual:", v7))
  {
    -[NSMapTable setObject:forKey:](self->_entryDescriptorToCachedEntry, "setObject:forKey:", v6, v7);
    -[SKUIIndexBarControl reloadCombinedEntry](self->_indexBarControl, "reloadCombinedEntry");
  }

}

- (id)_URLForEntryDescriptor:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "artwork");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SKUIIndexBarControlControllerDataSource)dataSource
{
  return (SKUIIndexBarControlControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (SKUIIndexBarControlControllerDelegate)delegate
{
  return (SKUIIndexBarControlControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SKUIIndexBarControl)indexBarControl
{
  return self->_indexBarControl;
}

- (SKUIResourceLoader)resourceLoader
{
  return self->_resourceLoader;
}

- (void)setResourceLoader:(id)a3
{
  objc_storeStrong((id *)&self->_resourceLoader, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_indexBarControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_requestIDToDescriptors, 0);
  objc_storeStrong((id *)&self->_indexPathToEntryDescriptor, 0);
  objc_storeStrong((id *)&self->_entryDescriptorToCachedEntry, 0);
  objc_storeStrong((id *)&self->_combinedEntryDescriptor, 0);
}

- (void)init
{
}

- (void)initWithIndexBarControl:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
