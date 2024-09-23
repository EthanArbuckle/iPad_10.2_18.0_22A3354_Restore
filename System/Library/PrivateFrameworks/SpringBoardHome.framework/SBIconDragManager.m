@implementation SBIconDragManager

- (void)configureIconView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__SBIconDragManager_configureIconView___block_invoke;
  v8[3] = &unk_1E8D86268;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v8);

}

- (BOOL)isTrackingMultipleItemIconDrags
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__SBIconDragManager_isTrackingMultipleItemIconDrags__block_invoke;
  v4[3] = &unk_1E8D85DD8;
  v4[4] = &v5;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)enumerateIconDragContextsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, unsigned __int8 *);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a3;
  v5 = (void *)-[NSMapTable copy](self->_iconDrags, "copy");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
      objc_msgSend(v6, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v4[2](v4, v12, v11, &v13);
      LODWORD(v11) = v13;

      if ((_DWORD)v11)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)noteFolderControllerWillOpen
{
  unint64_t v3;
  _QWORD v4[5];

  v3 = -[SBIconDragManager iconLayoutHidingOptions](self, "iconLayoutHidingOptions");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__SBIconDragManager_noteFolderControllerWillOpen__block_invoke;
  v4[3] = &__block_descriptor_40_e34_v32__0__SBIconDragContext_8_16_B24l;
  v4[4] = v3;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v4);
}

- (unint64_t)iconLayoutHidingOptions
{
  void *v3;
  unint64_t v4;

  -[SBIconDragManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v3, "isAnimatingFolderIconTransitionForIconDragManager:", self) & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v3, "isFolderOpenForIconDragManager:", self))
  {
    v4 = 37;
  }
  else
  {
    v4 = 45;
  }

  return v4;
}

- (SBIconDragManagerDelegate)delegate
{
  return (SBIconDragManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isIconDragging
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__SBIconDragManager_isIconDragging__block_invoke;
  v4[3] = &unk_1E8D85DD8;
  v4[4] = &v5;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isTrackingDropIntoDestinationIconView:(id)a3
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
  v7[2] = __59__SBIconDragManager_isTrackingDropIntoDestinationIconView___block_invoke;
  v7[3] = &unk_1E8D85E28;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (BOOL)isTrackingDragOriginatingFromIconView:(id)a3
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
  v7[2] = __59__SBIconDragManager_isTrackingDragOriginatingFromIconView___block_invoke;
  v7[3] = &unk_1E8D85E28;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (BOOL)isTrackingDragMatchingPredicate:(id)a3
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
  v7[2] = __53__SBIconDragManager_isTrackingDragMatchingPredicate___block_invoke;
  v7[3] = &unk_1E8D85F10;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (BOOL)isTrackingDroppingIconDrags
{
  return -[SBIconDragManager isTrackingDragMatchingPredicate:](self, "isTrackingDragMatchingPredicate:", &__block_literal_global_57);
}

- (BOOL)isTrackingUserActiveIconDrags
{
  return -[SBIconDragManager isTrackingDragMatchingPredicate:](self, "isTrackingDragMatchingPredicate:", &__block_literal_global_9);
}

- (void)noteIconTapped
{
  NSObject *v2;
  uint8_t v3[16];

  SBLogIconDragging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1CFEF3000, v2, OS_LOG_TYPE_INFO, "noting icon tapped", v3, 2u);
  }

}

- (void)noteFolderBeganScrolling
{
  NSObject *v2;
  uint8_t v3[16];

  SBLogIconDragging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1CFEF3000, v2, OS_LOG_TYPE_INFO, "noting folder began scrolling", v3, 2u);
  }

}

- (SBIconDragManager)init
{
  SBIconDragManager *v2;
  SBIconDragManager *v3;
  id v4;
  id v5;
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBIconDragManager;
  v2 = -[SBIconDragManager init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_createsStacksFromWidgets = 1;
    objc_initWeak(&location, v2);
    v4 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v7, &location);
    v5 = (id)BSLogAddStateCaptureBlockWithTitle();

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v3;
}

__CFString *__25__SBIconDragManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v2, "length"))
  {

    v2 = CFSTR("(null description)");
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SBIconDragManager _teardownWaitRunloopObserverIfNeeded](self, "_teardownWaitRunloopObserverIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)SBIconDragManager;
  -[SBIconDragManager dealloc](&v3, sel_dealloc);
}

- (BOOL)isUndoEnabled
{
  return 1;
}

- (BOOL)isSnapToGridAllowed
{
  void *v3;
  char v4;

  -[SBIconDragManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "allowsSnappingIconsToGridForIconDragManager:", self);
  else
    v4 = 0;

  return v4;
}

- (BOOL)canSnapToGridInIconLocation:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBIconDragManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "iconDragManager:canSnapIconsToGridInLocation:", self, v4);
  else
    v6 = 1;

  return v6;
}

- (BOOL)canSnapToGridBasedOnContentOfListModel:(id)a3 withDragIdentifier:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "hasFixedIconLocations") & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "draggedIcons");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          if ((objc_msgSend(v6, "directlyContainsIcon:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17) & 1) != 0)
          {

            v8 = 1;
            goto LABEL_13;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v12)
          continue;
        break;
      }
    }

    objc_msgSend(v9, "currentEnteredIconListViewDragDistance");
    v8 = v15 > 30.0;
LABEL_13:

  }
  return v8;
}

- (BOOL)isSnapToGridEnabledForDragWithIdentifier:(id)a3 iconLocation:(id)a4 listModel:(id)a5 placeholderGridSizeClass:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  BOOL v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isSnapToGridAllowed");
  v16 = -[SBIconDragManager canSnapToGridInIconLocation:](self, "canSnapToGridInIconLocation:", v12);

  LOBYTE(v12) = objc_msgSend(v11, "isInsertionFixedForIconGridSizeClass:options:", v10, 128);
  LOBYTE(self) = -[SBIconDragManager canSnapToGridBasedOnContentOfListModel:withDragIdentifier:](self, "canSnapToGridBasedOnContentOfListModel:withDragIdentifier:", v11, v13);

  return v15 & v16 & v12 & self;
}

- (id)model
{
  void *v2;
  void *v3;

  -[SBIconDragManager delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "iconModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)rootFolder
{
  void *v3;
  void *v4;

  -[SBIconDragManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "rootFolderForIconDragManager:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)rootListModel
{
  void *v3;
  void *v4;
  void *v5;

  -[SBIconDragManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "rootListModelForIconDragManager:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBIconDragManager rootListView](self, "rootListView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "model");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)modifyRootFolderUsingBlock:(id)a3 orRootListModelUsingBlock:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a3;
  v6 = (void (**)(id, void *))a4;
  -[SBIconDragManager rootFolder](self, "rootFolder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9[2](v9, v7);
  }
  else
  {
    -[SBIconDragManager rootListModel](self, "rootListModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v6[2](v6, v8);

  }
}

- (id)leafIconForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[SBIconDragManager model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "leafIconForIdentifier:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBIconDragManager rootFolder](self, "rootFolder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "iconWithIdentifier:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isLeafIcon"))
        v11 = v10;
      else
        v11 = 0;
      v7 = v11;
    }
    else
    {
      -[SBIconDragManager rootListModel](self, "rootListModel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v12;
      if (v12)
      {
        objc_msgSend(v12, "directlyContainedIconWithIdentifier:", v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isLeafIcon"))
          v14 = v13;
        else
          v14 = 0;
        v7 = v14;

      }
      else
      {
        v7 = 0;
      }
    }

  }
  return v7;
}

- (id)gridSizeClassDomain
{
  void *v2;
  void *v3;

  -[SBIconDragManager model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gridSizeClassDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)defaultIconLayoutAnimationDuration
{
  void *v3;
  double v4;
  double v5;

  -[SBIconDragManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "defaultIconLayoutAnimationDurationForIconDragManager:", self);
    v5 = v4;
  }
  else
  {
    v5 = 0.225;
  }

  return v5;
}

- (BOOL)isEditing
{
  void *v2;
  char v3;

  -[SBIconDragManager delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "isEditing");
  else
    v3 = 0;

  return v3;
}

- (BOOL)isEditingForListView:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if (-[SBIconDragManager isEditing](self, "isEditing"))
  {
    v5 = 1;
  }
  else
  {
    -[SBIconDragManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = objc_msgSend(v6, "isEditingForIconListView:", v4);
    else
      v5 = 0;

  }
  return v5;
}

- (BOOL)isEditingAllowedForListView:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBIconDragManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "isEditingAllowedForIconListView:", v4);
  else
    v6 = 1;

  return v6;
}

- (BOOL)isRootFolderContentVisible
{
  void *v2;
  char v3;

  -[SBIconDragManager delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "isRootFolderContentVisible");
  else
    v3 = 0;

  return v3;
}

- (BOOL)isIconContentPossiblyVisibleOverApplication
{
  void *v2;
  char v3;

  -[SBIconDragManager delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "isIconContentPossiblyVisibleOverApplication");
  else
    v3 = 0;

  return v3;
}

- (id)rootView
{
  void *v3;
  void *v4;

  -[SBIconDragManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewForIconDragManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)rootListView
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[SBIconDragManager rootView](self, "rootView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)iconListViewForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBIconDragManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "iconListViewForIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)iconListViewContainingIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SBIconDragManager rootFolder](self, "rootFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForIcon:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[SBIconDragManager iconListViewForIndexPath:](self, "iconListViewForIndexPath:", v6);
  else
    -[SBIconDragManager rootListView](self, "rootListView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)layoutIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[SBIconDragManager delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "layoutIconListsWithAnimationType:forceRelayout:", a3, v4);

}

- (void)scrollToIconListContainingIcon:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[SBIconDragManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "iconDragManager:wantsScrollToIconListContainingIcon:animated:", self, v7, v4);

}

- (unint64_t)listGridCellInfoOptions
{
  void *v3;
  unint64_t v4;

  -[SBIconDragManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "listGridCellInfoOptionsForIconDragManager:", self);
  else
    v4 = 0;

  return v4;
}

- (id)iconLayoutHider
{
  void *v3;
  void *v4;

  -[SBIconDragManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "iconLayoutHiderForIconDragManager:", self);
  else
    -[SBIconDragManager rootListView](self, "rootListView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_cleanUpAllDraggingState
{
  NSMapTable *iconDrags;
  NSMapTable *uniqueIdentifiersPerDropSession;
  NSMapTable *uniqueIdentifiersPerDragSession;
  NSMutableArray *v6;
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
  iconDrags = self->_iconDrags;
  self->_iconDrags = 0;

  uniqueIdentifiersPerDropSession = self->_uniqueIdentifiersPerDropSession;
  self->_uniqueIdentifiersPerDropSession = 0;

  uniqueIdentifiersPerDragSession = self->_uniqueIdentifiersPerDragSession;
  self->_uniqueIdentifiersPerDragSession = 0;

  if (-[NSMutableArray count](self->_singleUseDragWindows, "count"))
    NSLog(CFSTR("single-use drag windows still around after all drags complete"));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_singleUseDragWindows;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setHidden:", 1, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

uint64_t __35__SBIconDragManager_isIconDragging__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "state");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result != 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a4 = 1;
  return result;
}

- (BOOL)isTrackingMultipleIconDrags
{
  BOOL v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__SBIconDragManager_isTrackingMultipleIconDrags__block_invoke;
  v4[3] = &unk_1E8D85DD8;
  v4[4] = &v5;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v4);
  v2 = (unint64_t)v6[3] > 1;
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __48__SBIconDragManager_isTrackingMultipleIconDrags__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "state");
  if (result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __52__SBIconDragManager_isTrackingMultipleItemIconDrags__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "state");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result == 4;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a4 = 1;
  return result;
}

- (BOOL)isTrackingDragOfIcon:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  objc_msgSend(v4, "nodeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__SBIconDragManager_isTrackingDragOfIcon___block_invoke;
  v8[3] = &unk_1E8D85E00;
  v10 = &v11;
  v6 = v5;
  v9 = v6;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v8);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __42__SBIconDragManager_isTrackingDragOfIcon___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;

  objc_msgSend(a2, "itemIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32));

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;
}

- (BOOL)isTrackingActiveDragOfIcon:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  objc_msgSend(v4, "nodeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__SBIconDragManager_isTrackingActiveDragOfIcon___block_invoke;
  v8[3] = &unk_1E8D85E00;
  v10 = &v11;
  v6 = v5;
  v9 = v6;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v8);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __48__SBIconDragManager_isTrackingActiveDragOfIcon___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "itemIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32));
  if (v7)
    LOBYTE(v7) = objc_msgSend(v8, "isUserActive");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;

}

uint64_t __59__SBIconDragManager_isTrackingDragOriginatingFromIconView___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "hasSourceIconView:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (BOOL)isTrackingUserActiveDragOriginatingFromIconView:(id)a3
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
  v7[2] = __69__SBIconDragManager_isTrackingUserActiveDragOriginatingFromIconView___block_invoke;
  v7[3] = &unk_1E8D85E28;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __69__SBIconDragManager_isTrackingUserActiveDragOriginatingFromIconView___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "hasSourceIconView:", *(_QWORD *)(a1 + 32))
    && objc_msgSend(v3, "isUserActive"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (BOOL)isTrackingDragInUserActiveLiftPreviewOriginatingFromIconView:(id)a3
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
  v7[2] = __82__SBIconDragManager_isTrackingDragInUserActiveLiftPreviewOriginatingFromIconView___block_invoke;
  v7[3] = &unk_1E8D85E28;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __82__SBIconDragManager_isTrackingDragInUserActiveLiftPreviewOriginatingFromIconView___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "hasSourceIconView:", *(_QWORD *)(a1 + 32)))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "state") == 1;

}

void __59__SBIconDragManager_isTrackingDropIntoDestinationIconView___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__SBIconDragManager_isTrackingDropIntoDestinationIconView___block_invoke_2;
  v6[3] = &unk_1E8D85B48;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(a2, "enumerateDestinationIconViewsUsingBlock:", v6);

}

uint64_t __59__SBIconDragManager_isTrackingDropIntoDestinationIconView___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(result + 32) == a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __50__SBIconDragManager_isTrackingUserActiveIconDrags__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isUserActive");
}

BOOL __48__SBIconDragManager_isTrackingDroppingIconDrags__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "state") == 5;
}

- (BOOL)isTrackingActiveOrDroppingIconDrags
{
  return -[SBIconDragManager isTrackingDragMatchingPredicate:](self, "isTrackingDragMatchingPredicate:", &__block_literal_global_58);
}

BOOL __56__SBIconDragManager_isTrackingActiveOrDroppingIconDrags__block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)(objc_msgSend(a2, "state") - 3) < 3;
}

- (BOOL)isTrackingWidgetIconDrags
{
  return -[SBIconDragManager isTrackingDragMatchingPredicate:](self, "isTrackingDragMatchingPredicate:", &__block_literal_global_59);
}

uint64_t __46__SBIconDragManager_isTrackingWidgetIconDrags__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "draggedIcons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bs_containsObjectPassingTest:", &__block_literal_global_61);

  return v3;
}

uint64_t __46__SBIconDragManager_isTrackingWidgetIconDrags__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  __CFString *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "gridSizeClass");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v3 == CFSTR("SBHIconGridSizeClassDefault"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v2, "gridSizeClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) ^ 1;

  }
  return v5;
}

- (BOOL)isTrackingWidgetStackIconDrags
{
  return -[SBIconDragManager isTrackingDragMatchingPredicate:](self, "isTrackingDragMatchingPredicate:", &__block_literal_global_62);
}

uint64_t __51__SBIconDragManager_isTrackingWidgetStackIconDrags__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "draggedIcons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bs_containsObjectPassingTest:", &__block_literal_global_63);

  return v3;
}

uint64_t __51__SBIconDragManager_isTrackingWidgetStackIconDrags__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  __CFString *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "gridSizeClass");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v3 == CFSTR("SBHIconGridSizeClassDefault"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v2, "gridSizeClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) != 0)
      v5 = 0;
    else
      v5 = objc_msgSend(v2, "isWidgetStackIcon");

  }
  return v5;
}

uint64_t __53__SBIconDragManager_isTrackingDragMatchingPredicate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)countOfTrackedDragsOriginatingFromOrDroppingIntoIconView:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__SBIconDragManager_countOfTrackedDragsOriginatingFromOrDroppingIntoIconView___block_invoke;
  v8[3] = &unk_1E8D85E28;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __78__SBIconDragManager_countOfTrackedDragsOriginatingFromOrDroppingIntoIconView___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "hasSourceIconView:", *(_QWORD *)(a1 + 32)) & 1) != 0
    || objc_msgSend(v3, "hasDestinationIconView:", *(_QWORD *)(a1 + 32)))
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

- (BOOL)isTrackingDragOriginatingFromOrDroppingIntoIconView:(id)a3 otherThanDragWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __101__SBIconDragManager_isTrackingDragOriginatingFromOrDroppingIntoIconView_otherThanDragWithIdentifier___block_invoke;
  v11[3] = &unk_1E8D85F38;
  v8 = v7;
  v12 = v8;
  v9 = v6;
  v13 = v9;
  v14 = &v15;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v11);
  LOBYTE(self) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __101__SBIconDragManager_isTrackingDragOriginatingFromOrDroppingIntoIconView_otherThanDragWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", a3) & 1) == 0
    && ((objc_msgSend(v7, "hasSourceIconView:", *(_QWORD *)(a1 + 40)) & 1) != 0
     || objc_msgSend(v7, "hasDestinationIconView:", *(_QWORD *)(a1 + 40))))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (BOOL)isTrackingDragWithGhostTreatmentForIcon:(id)a3
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
  v7[2] = __61__SBIconDragManager_isTrackingDragWithGhostTreatmentForIcon___block_invoke;
  v7[3] = &unk_1E8D85E28;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __61__SBIconDragManager_isTrackingDragWithGhostTreatmentForIcon___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "hasGrabbedIcon:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)enumerateIconDragIdentifiersUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, char *))a3;
  v5 = (void *)-[NSMapTable copy](self->_iconDrags, "copy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
      v12 = 0;
      v4[2](v4, v11, &v12);
      if (v12)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)allDragIdentifiers
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__SBIconDragManager_allDragIdentifiers__block_invoke;
  v6[3] = &unk_1E8D85F60;
  v4 = v3;
  v7 = v4;
  -[SBIconDragManager enumerateIconDragIdentifiersUsingBlock:](self, "enumerateIconDragIdentifiersUsingBlock:", v6);

  return v4;
}

uint64_t __39__SBIconDragManager_allDragIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)uniqueIdentifierForIconDropSession:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSMapTable *uniqueIdentifiersPerDropSession;
  NSMapTable *v9;
  NSMapTable *v10;

  v4 = a3;
  objc_msgSend(v4, "localDragSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (-[SBIconDragManager uniqueIdentifierForIconDragSession:](self, "uniqueIdentifierForIconDragSession:", v5),
        (v6 = (id)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[NSMapTable objectForKey:](self->_uniqueIdentifiersPerDropSession, "objectForKey:", v4),
        (v6 = (id)objc_claimAutoreleasedReturnValue()) != 0)
    || (v6 = objc_alloc_init(MEMORY[0x1E0CB3A28])) != 0)
  {
    -[NSMapTable objectForKey:](self->_uniqueIdentifiersPerDropSession, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      uniqueIdentifiersPerDropSession = self->_uniqueIdentifiersPerDropSession;
      if (!uniqueIdentifiersPerDropSession)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
        v9 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
        v10 = self->_uniqueIdentifiersPerDropSession;
        self->_uniqueIdentifiersPerDropSession = v9;

        uniqueIdentifiersPerDropSession = self->_uniqueIdentifiersPerDropSession;
      }
      -[NSMapTable setObject:forKey:](uniqueIdentifiersPerDropSession, "setObject:forKey:", v6, v4);
    }
  }

  return v6;
}

- (id)uniqueIdentifierForIconDragSession:(id)a3
{
  id v4;
  id v5;
  NSMapTable *uniqueIdentifiersPerDragSession;
  NSMapTable *v7;
  NSMapTable *v8;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_uniqueIdentifiersPerDragSession, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    uniqueIdentifiersPerDragSession = self->_uniqueIdentifiersPerDragSession;
    if (!uniqueIdentifiersPerDragSession)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v8 = self->_uniqueIdentifiersPerDragSession;
      self->_uniqueIdentifiersPerDragSession = v7;

      uniqueIdentifiersPerDragSession = self->_uniqueIdentifiersPerDragSession;
    }
    -[NSMapTable setObject:forKey:](uniqueIdentifiersPerDragSession, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (id)iconDragContextForDropSession:(id)a3
{
  void *v4;
  void *v5;

  -[SBIconDragManager uniqueIdentifierForIconDropSession:](self, "uniqueIdentifierForIconDropSession:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)iconDragContextForDragSession:(id)a3
{
  void *v4;
  void *v5;

  -[SBIconDragManager uniqueIdentifierForIconDragSession:](self, "uniqueIdentifierForIconDragSession:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)iconDragContextForDragDropSession:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EFCFF6A8))
  {
    -[SBIconDragManager iconDragContextForDropSession:](self, "iconDragContextForDropSession:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "conformsToProtocol:", &unk_1EFCFF790))
    {
      v6 = 0;
      goto LABEL_7;
    }
    -[SBIconDragManager iconDragContextForDragSession:](self, "iconDragContextForDragSession:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

- (id)iconDragContextForDragWithIdentifier:(id)a3
{
  return -[NSMapTable objectForKey:](self->_iconDrags, "objectForKey:", a3);
}

- (id)iconDragContextForDragItem:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__SBIconDragManager_iconDragContextForDragItem___block_invoke;
  v8[3] = &unk_1E8D85E28;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __48__SBIconDragManager_iconDragContextForDragItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "hasDragItem:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (BOOL)_isTrackingDrag:(id)a3
{
  void *v3;
  BOOL v4;

  -[SBIconDragManager iconDragContextForDropSession:](self, "iconDragContextForDropSession:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)_isTrackingDragWithIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)_startTrackingDragWithIdentifier:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSMapTable *iconDrags;
  NSMapTable *v10;
  NSMapTable *v11;
  void *v12;
  SBIconDragContext *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogIconDragging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v15 = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1CFEF3000, v8, OS_LOG_TYPE_INFO, "start tracking drag with identifier %{public}@", (uint8_t *)&v15, 0xCu);
  }

  iconDrags = self->_iconDrags;
  if (!iconDrags)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v10 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v11 = self->_iconDrags;
    self->_iconDrags = v10;

    iconDrags = self->_iconDrags;
  }
  -[NSMapTable objectForKey:](iconDrags, "objectForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = objc_alloc_init(SBIconDragContext);
    -[SBIconDragContext setSnapToGridAllowed:](v13, "setSnapToGridAllowed:", -[SBIconDragManager isSnapToGridAllowed](self, "isSnapToGridAllowed"));
    -[NSMapTable setObject:forKey:](self->_iconDrags, "setObject:forKey:", v13, v6);
    if (v7)
    {
      -[SBIconDragManager delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0
        && objc_msgSend(v14, "iconDragManager:shouldDuplicateIconsInDragSession:", self, v7))
      {
        -[SBIconDragContext setDuplicatesSourceIcons:](v13, "setDuplicatesSourceIcons:", 1);
      }

    }
    -[SBIconDragManager resetWatchdogTimerForDragWithIdentifier:timeout:](self, "resetWatchdogTimerForDragWithIdentifier:timeout:", v6, 60.0);

  }
}

- (void)_stopTrackingDragWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  _BOOL4 v26;
  uint8_t buf[4];
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogIconDragging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[NSMapTable objectForKey:](self->_iconDrags, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = *(double *)&v4;
    v29 = 2112;
    v30 = *(double *)&v6;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "stop tracking drag with identifier %{public}@. Context: %@", buf, 0x16u);

  }
  -[SBIconDragManager stopTrackingDragLocationForEditingForDragWithIdentifier:](self, "stopTrackingDragLocationForEditingForDragWithIdentifier:", v4);
  -[SBIconDragManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBIconDragManager isIconDragging](self, "isIconDragging");
  if (v4)
  {
    -[NSMapTable objectForKey:](self->_iconDrags, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "primaryIconView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastUserInteractionDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "hasUserDragged");
    SBLogIconDragging();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "lastTouchDownDate");
      v26 = v8;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceNow");
      v16 = fabs(v15);
      objc_msgSend(v11, "timeIntervalSinceNow");
      v18 = fabs(v17);
      objc_msgSend(v10, "lastTouchDownDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", v19);
      *(_DWORD *)buf = 134218752;
      v28 = v16;
      v29 = 2048;
      v30 = v18;
      v31 = 2048;
      v32 = v20;
      v33 = 1024;
      v34 = v12;
      _os_log_impl(&dword_1CFEF3000, v13, OS_LOG_TYPE_INFO, "drag ended %fs after icon view touch began. last interaction %fs ago. time between interaction start and end: %fs. user did begin drag: %{BOOL}u", buf, 0x26u);

      v8 = v26;
    }

    objc_msgSend(v10, "removeObserver:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "iconDragManager:didEndDragOriginatingFromIconView:userDidBeginDrag:lastUserInteractionDate:", self, v10, v12, v11);
    objc_msgSend(v9, "enumerateSourceIconViewsUsingBlock:", &__block_literal_global_154);
    objc_msgSend(v9, "enumerateDiscardedSourceIconViewsUsingBlock:", &__block_literal_global_156);
    objc_msgSend(v9, "grabbedIconViews");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (v22)
      objc_msgSend(v9, "enumerateEnteredIconListViewsUsingBlock:", &__block_literal_global_158);
    objc_msgSend(v9, "enumerateEnteredIconListViewsUsingBlock:", &__block_literal_global_160);
    objc_msgSend(v9, "enumerateDestinationIconViewsUsingBlock:", &__block_literal_global_161);
    objc_msgSend(v9, "enumerateDragPreviewsUsingBlock:", &__block_literal_global_163);
    objc_msgSend(v9, "resetDraggedIconsHiddenAssertion");
    objc_msgSend(v9, "resetDragPlaceholder");
    objc_msgSend(v9, "invalidateIconViewBorrowAssertions");
    objc_msgSend(v9, "watchdogTimer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "invalidate");

    objc_msgSend(v9, "setWatchdogTimer:", 0);
    -[NSMapTable removeObjectForKey:](self->_iconDrags, "removeObjectForKey:", v4);

  }
  if (v8 && !-[SBIconDragManager isIconDragging](self, "isIconDragging"))
  {
    SBLogIconDragging();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CFEF3000, v24, OS_LOG_TYPE_INFO, "all drags have ended, cleaning up", buf, 2u);
    }

    -[SBIconDragManager model](self, "model");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "checkModelConsistencyWithListGridCellInfoOptions:", -[SBIconDragManager listGridCellInfoOptions](self, "listGridCellInfoOptions"));
    -[SBIconDragManager removeEmptyFolders](self, "removeEmptyFolders");
    -[SBIconDragManager _cleanUpAllDraggingState](self, "_cleanUpAllDraggingState");
    -[SBIconDragManager compactAndLayoutRootIconLists](self, "compactAndLayoutRootIconLists");
    -[SBIconDragManager _invalidateAutoScrollAssistant](self, "_invalidateAutoScrollAssistant");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "iconDragManagerIconDraggingDidChange:", self);

  }
}

void __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = a2;
  if (objc_msgSend(v2, "isHighlighted"))
  {
    SBLogIconDragging();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_cold_2((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

    objc_msgSend(v2, "setHighlighted:", 0);
  }
  if (objc_msgSend(v2, "isGrabbed"))
  {
    SBLogIconDragging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_cold_1((uint64_t)v2, v10, v11, v12, v13, v14, v15, v16);

    objc_msgSend(v2, "setGrabbed:", 0);
  }

}

uint64_t __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_155(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

uint64_t __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enumerateDisplayedIconViewsUsingBlock:", &__block_literal_global_159);
}

uint64_t __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGrabbed:", 0);
}

uint64_t __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clearDraggedIconViews");
}

uint64_t __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOverrideCustomIconImageViewController:", 0);
}

void __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "cleanUp");

}

- (void)_stopTrackingDragIfPossibleWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isWaitingForMessage"))
  {
    SBLogIconDragging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "expectedMessages");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v4;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_INFO, "drag with identifier %{public}@ is still waiting for messages: %@", (uint8_t *)&v8, 0x16u);

    }
  }
  else
  {
    -[SBIconDragManager _stopTrackingDragWithIdentifier:](self, "_stopTrackingDragWithIdentifier:", v4);
  }

}

- (void)changeStateOfDragWithIdentifier:(id)a3 toState:(int64_t)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  BOOL v14;
  BOOL v15;
  _QWORD block[5];
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "state") == a4)
    goto LABEL_22;
  v8 = -[SBIconDragManager isIconDragging](self, "isIconDragging");
  v9 = -[SBIconDragManager isTrackingUserActiveIconDrags](self, "isTrackingUserActiveIconDrags");
  SBLogIconDragging();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    SBStringForIconDragContextState(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v6;
    v19 = 2114;
    v20 = v11;
    v21 = 1024;
    v22 = v8;
    _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_INFO, "change state of drag with identifier %{public}@ to state '%{public}@' (was dragging before: %{BOOL}u)", buf, 0x1Cu);

  }
  v12 = objc_msgSend(v7, "isUserActive");
  objc_msgSend(v7, "setState:", a4);
  -[SBIconDragManager delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SBIconDragManager isIconDragging](self, "isIconDragging");
  if (v8)
  {
    if (v14)
      goto LABEL_10;
  }
  else if (!v14)
  {
    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "iconDragManagerIconDraggingDidChange:", self);
LABEL_10:
  v15 = -[SBIconDragManager isTrackingUserActiveIconDrags](self, "isTrackingUserActiveIconDrags");
  if (!v9)
  {
    if (!v15)
      goto LABEL_16;
LABEL_14:
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v13, "iconDragManagerUserActiveIconDraggingDidChange:", self);
    goto LABEL_16;
  }
  if (!v15)
    goto LABEL_14;
LABEL_16:
  if (v12)
  {
    if ((objc_msgSend(v7, "isUserActive") & 1) == 0)
    {
      objc_msgSend(v7, "resetLastUserInteractionDate");
      if (!-[SBIconDragManager isEditing](self, "isEditing"))
      {
        if (objc_msgSend(v7, "hasUserDragged"))
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __61__SBIconDragManager_changeStateOfDragWithIdentifier_toState___block_invoke;
          block[3] = &unk_1E8D84C50;
          block[4] = self;
          dispatch_async(MEMORY[0x1E0C80D38], block);
        }
      }
    }
  }
  -[SBIconDragManager resetWatchdogTimerForDragWithIdentifier:timeout:](self, "resetWatchdogTimerForDragWithIdentifier:timeout:", v6, 60.0);

LABEL_22:
}

void __61__SBIconDragManager_changeStateOfDragWithIdentifier_toState___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "rootFolder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "compactLists");
  objc_msgSend(*(id *)(a1 + 32), "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveIconStateIfNeeded");
  objc_msgSend(v2, "clearDesiredIconState");

}

- (void)resetWatchdogTimerForDragWithIdentifier:(id)a3 timeout:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "watchdogTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_watchdogTimerDidFire_, v6, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTolerance:", 10.0);
  objc_msgSend(v9, "setWatchdogTimer:", v8);

}

- (void)watchdogTimerDidFire:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  objc_msgSend(a3, "userInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastUserInteractionDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "timeIntervalSinceNow");
    v8 = fabs(v7);
    if (v8 >= 60.0)
      -[SBIconDragManager watchdogDragWithIdentifier:](self, "watchdogDragWithIdentifier:", v9);
    else
      -[SBIconDragManager resetWatchdogTimerForDragWithIdentifier:timeout:](self, "resetWatchdogTimerForDragWithIdentifier:timeout:", v9, 60.0 - v8);
  }

}

- (void)addAppLocalContextsFromDragItems:(id)a3 session:(id)a4 toDragWithIdentifier:(id)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v14, "sbh_appDragLocalContext", (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v8, "setAppDragLocalContext:forDragItem:", v15, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (void)createIconsFromDragItemsIfNecessary:(id)a3 withDragIdentifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  SBWidgetIcon *v18;
  void *v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  SBHWidget *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  SBHWidget *v32;
  SBHWidget *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id obj;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  SBWidgetIcon *v47;
  uint64_t v48;
  SBWidgetIcon *v49;
  SBHWidget *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  SBWidgetIcon *v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v35 = a4;
  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
  if (!v8)
  {
    v49 = 0;
    goto LABEL_32;
  }
  v9 = v8;
  v49 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v11 = *(_QWORD *)v58;
  v36 = *(_QWORD *)v58;
  v37 = v7;
  do
  {
    v12 = 0;
    v38 = v9;
    do
    {
      if (*(_QWORD *)v58 != v11)
        objc_enumerationMutation(obj);
      objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * v12), "sbh_appDragLocalContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "customIconDataSourceConfigurations");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v13;
      objc_msgSend(v13, "uniqueIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sourceIcons");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v10;
      v55[1] = 3221225472;
      v55[2] = __76__SBIconDragManager_createIconsFromDragItemsIfNecessary_withDragIdentifier___block_invoke;
      v55[3] = &unk_1E8D860C8;
      v41 = v15;
      v56 = v41;
      v17 = objc_msgSend(v16, "bs_containsObjectPassingTest:", v55);

      v42 = v14;
      if (objc_msgSend(v14, "count") && (v17 & 1) == 0)
      {
        v40 = v12;
        v18 = -[SBWidgetIcon initWithLeafIdentifier:applicationBundleID:]([SBWidgetIcon alloc], "initWithLeafIdentifier:applicationBundleID:", v41, 0);

        objc_msgSend(v43, "gridSizeClass");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v18;
        -[SBIcon setGridSizeClass:](v18, "setGridSizeClass:", v19);

        objc_msgSend(v43, "activeCustomIconDataSourceUniqueIdentifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v44 = v42;
        v48 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
        if (!v48)
        {
          v50 = 0;
          goto LABEL_27;
        }
        v50 = 0;
        v45 = *(_QWORD *)v52;
        while (1)
        {
          for (i = 0; i != v48; ++i)
          {
            if (*(_QWORD *)v52 != v45)
              objc_enumerationMutation(v44);
            v21 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            objc_msgSend(v21, "objectForKey:", CFSTR("kind"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              objc_msgSend(v21, "objectForKey:", CFSTR("kind"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKey:", CFSTR("uniqueIdentifier"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKey:", CFSTR("extensionBundleIdentifier"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKey:", CFSTR("containerBundleIdentifier"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKey:", CFSTR("supportedGridSizeClasses"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = -[SBHWidget initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:supportedGridSizeClasses:]([SBHWidget alloc], "initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:supportedGridSizeClasses:", v24, v23, v25, v26, v27);
              SBLogWidgets();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                -[SBHWidget extensionBundleIdentifier](v28, "extensionBundleIdentifier");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                -[SBHWidget uniqueIdentifier](v28, "uniqueIdentifier");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v63 = v30;
                v64 = 2114;
                v65 = v31;
                _os_log_impl(&dword_1CFEF3000, v29, OS_LOG_TYPE_DEFAULT, "Widget %{public}@ %{public}@ created for drag.", buf, 0x16u);

              }
              v32 = v28;
              if (objc_msgSend(v24, "isEqualToString:", v46))
              {
                v33 = v32;

              }
              else
              {
                v33 = v50;
              }

            }
            else
            {
              objc_msgSend(v21, "objectForKey:", CFSTR("uniqueIdentifier"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKey:", CFSTR("elementIdentifier"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = (SBHWidget *)objc_msgSend(objc_alloc(+[SBHCustomIconElement elementClassWithIdentifier:](SBHCustomIconElement, "elementClassWithIdentifier:", v24)), "initWithUniqueIdentifier:", v23);
              if (!objc_msgSend(v23, "isEqualToString:", v46))
                goto LABEL_23;
              v32 = v32;
              v33 = v32;
              v25 = v50;
            }

            v50 = v33;
LABEL_23:

            -[SBLeafIcon addIconDataSource:](v47, "addIconDataSource:", v32);
          }
          v48 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
          if (!v48)
          {
LABEL_27:

            -[SBLeafIcon setActiveDataSource:](v47, "setActiveDataSource:", v50);
            v49 = v47;
            v7 = v37;
            v9 = v38;
            v10 = MEMORY[0x1E0C809B0];
            v11 = v36;
            v12 = v40;
            break;
          }
        }
      }

      ++v12;
    }
    while (v12 != v9);
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
  }
  while (v9);
LABEL_32:

  if (-[SBLeafIcon iconDataSourceCount](v49, "iconDataSourceCount"))
  {
    v61 = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCreatedWidgetIcons:", v34);

  }
}

uint64_t __76__SBIconDragManager_createIconsFromDragItemsIfNecessary_withDragIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)addApplicationIconsFromDragItems:(id)a3 session:(id)a4 toDragWithIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "externallyDraggedIcons");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (!v15)
    {
      v17 = v14;
      goto LABEL_21;
    }
    v16 = v15;
    v24 = v10;
    v25 = v9;
    v26 = v8;
    v17 = 0;
    v18 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "sbh_appDragLocalContext");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          objc_msgSend(v20, "uniqueIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            -[SBIconDragManager leafIconForIdentifier:](self, "leafIconForIdentifier:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23 && (objc_msgSend(v11, "hasDraggedIcon:", v23) & 1) == 0)
            {
              if (!v17)
                v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v17, "addObject:", v23);
            }

          }
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v16);

    v9 = v25;
    v8 = v26;
    v10 = v24;
    if (v17)
    {
      objc_msgSend(v11, "setExternallyDraggedIcons:", v17);
LABEL_21:

    }
  }

}

- (id)appDragLocalContextForDragItem:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  objc_msgSend(v4, "sbh_appDragLocalContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__2;
    v14 = __Block_byref_object_dispose__2;
    v15 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__SBIconDragManager_appDragLocalContextForDragItem___block_invoke;
    v7[3] = &unk_1E8D85E00;
    v9 = &v10;
    v8 = v4;
    -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v7);
    v5 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }

  return v5;
}

void __52__SBIconDragManager_appDragLocalContextForDragItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "appDragLocalContextForDragItem:", *(_QWORD *)(a1 + 32));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;
}

- (id)_iconIdentifierForDragItem:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconDragManager appDragLocalContextForDragItem:](self, "appDragLocalContextForDragItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_applicationBundleIdentifierForDragItem:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconDragManager appDragLocalContextForDragItem:](self, "appDragLocalContextForDragItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)draggedIconForIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, _BYTE *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  -[SBIconDragManager leafIconForIdentifier:](self, "leafIconForIdentifier:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__2;
    v23 = __Block_byref_object_dispose__2;
    v24 = 0;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __46__SBIconDragManager_draggedIconForIdentifier___block_invoke;
    v16 = &unk_1E8D85E28;
    v6 = v4;
    v17 = v6;
    v18 = &v19;
    -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", &v13);
    v7 = (void *)v20[5];
    if (v7)
    {
      v5 = v7;

      _Block_object_dispose(&v19, 8);
    }
    else
    {

      _Block_object_dispose(&v19, 8);
      -[SBIconDragManager rootFolder](self, "rootFolder", v13, v14, v15, v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "indexPathForIconWithIdentifier:", v6);
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(v8, "iconAtIndexPath:", v9);
        v5 = (id)objc_claimAutoreleasedReturnValue();

        if (v5)
          goto LABEL_12;
      }
      else
      {

      }
      -[SBIconDragManager delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v11, "iconDragManager:draggedIconForIdentifier:", self, v6);
        v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }

    }
  }
LABEL_12:

  return v5;
}

void __46__SBIconDragManager_draggedIconForIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
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
  objc_msgSend(a2, "draggedIcons", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "nodeIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", *(_QWORD *)(a1 + 32));

        if (v13)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v11);
          *a4 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)draggedIconsForIdentifiers:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[SBIconDragManager draggedIconForIdentifier:](self, "draggedIconForIdentifier:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)dragPlaceholderPathForDragWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dragPlaceholderListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager rootFolder](self, "rootFolder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForList:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dragPlaceholder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "effectiveGridCellIndex");
  objc_msgSend(v5, "gridCellInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "iconIndexForGridCellIndex:", v10);

  if (v8)
  {
    objc_msgSend(v8, "indexPathByAddingIndex:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)dragPlaceholderGridPathForDragWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  SBHIconGridPath *v12;
  void *v13;
  void *v14;
  SBHIconGridPath *v15;

  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dragPlaceholderListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "folder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dragPlaceholder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "effectiveGridCellIndex");
    v11 = -[SBIconDragManager listGridCellInfoOptions](self, "listGridCellInfoOptions");
    v12 = [SBHIconGridPath alloc];
    objc_msgSend(v8, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SBHIconGridPath initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:](v12, "initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:", v13, v14, v10, v11);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)removeDragPlaceholdersForDragWithIdentifier:(id)a3
{
  return -[SBIconDragManager removeDragPlaceholdersForDragWithIdentifier:placeholderPath:](self, "removeDragPlaceholdersForDragWithIdentifier:placeholderPath:", a3, 0);
}

- (BOOL)removeDragPlaceholdersForDragWithIdentifier:(id)a3 placeholderPath:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dragPlaceholder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager dragPlaceholderPathForDragWithIdentifier:](self, "dragPlaceholderPathForDragWithIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIconDragging();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = 138543618;
    v13 = v6;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_INFO, "remove drag placeholder for drag with identifier %{public}@. Placeholder path: %@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(v8, "invalidate");
  objc_msgSend(v7, "setDragPlaceholder:", 0);
  objc_msgSend(v7, "setDragPlaceholderListView:", 0);
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v9 != 0;
}

- (void)_removeDraggedIconsFromLayout:(id)a3 iconLocation:(id)a4 dragIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void *v23;
  SBIconDragManager *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __79__SBIconDragManager__removeDraggedIconsFromLayout_iconLocation_dragIdentifier___block_invoke;
  v23 = &unk_1E8D860F0;
  v24 = self;
  v11 = v8;
  v25 = v11;
  objc_msgSend(v9, "bs_filter:", &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogIconDragging();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v12;
    v28 = 2114;
    v29 = v11;
    _os_log_impl(&dword_1CFEF3000, v13, OS_LOG_TYPE_INFO, "hide dragged icons '%@' (icon location: %{public}@)", buf, 0x16u);
  }

  if (objc_msgSend(v12, "count", v20, v21, v22, v23, v24))
  {
    objc_msgSend(v10, "draggedIconsHiddenAssertion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[SBIconDragManager iconLayoutHider](self, "iconLayoutHider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        -[SBIconDragManager rootListView](self, "rootListView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "beginHidingIconsFromLayout:reason:options:", v12, CFSTR("drag"), -[SBIconDragManager iconLayoutHidingOptions](self, "iconLayoutHidingOptions"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDraggedIconsHiddenAssertion:", v16);
      SBLogIconDragging();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v16;
        _os_log_impl(&dword_1CFEF3000, v17, OS_LOG_TYPE_INFO, "made icon hiding assertion %@", buf, 0xCu);
      }

      objc_msgSend(v12, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "gridSizeClass");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDragPlaceholderGridSizeClass:", v19);

    }
  }

}

uint64_t __79__SBIconDragManager__removeDraggedIconsFromLayout_iconLocation_dragIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "doesIconRepresentRealIconPosition:inLocation:", a2, *(_QWORD *)(a1 + 40));
}

- (void)removeNearestLeafIconsMatchingIcons:(id)a3 inList:(id)a4 dragContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  NSObject *v17;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v18 = a5;
  v19 = v8;
  -[SBIconDragManager leafIconsInList:matchingApplicationBundleIdentifierOfIcons:](self, "leafIconsInList:matchingApplicationBundleIdentifierOfIcons:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        SBLogIconDragging();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v16;
          _os_log_impl(&dword_1CFEF3000, v17, OS_LOG_TYPE_INFO, "removing leaf icon %@ because the incoming drag is effectively picking it up", buf, 0xCu);
        }

        objc_msgSend(v9, "removeIcon:", v16);
        if (!v13)
          v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(v13, "addObject:", v16);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v18, "setRemovedMatchingLeafIcons:", v13);

}

- (id)leafIconsInList:(id)a3 matchingApplicationBundleIdentifierOfIcons:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "applicationBundleID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastDirectlyContainedLeafIconWithApplicationBundleIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          if (!v9)
            v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v9, "addObject:", v13);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)removeEmptyFolders
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__SBIconDragManager_removeEmptyFolders__block_invoke;
  v3[3] = &unk_1E8D86118;
  v3[4] = self;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __39__SBIconDragManager_removeEmptyFolders__block_invoke_2;
  v2[3] = &unk_1E8D86140;
  -[SBIconDragManager modifyRootFolderUsingBlock:orRootListModelUsingBlock:](self, "modifyRootFolderUsingBlock:orRootListModelUsingBlock:", v3, v2);
}

uint64_t __39__SBIconDragManager_removeEmptyFolders__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeEmptyFoldersInFolder:", a2);
}

uint64_t __39__SBIconDragManager_removeEmptyFolders__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeEmptyFoldersInListModel:", a2);
}

- (void)removeEmptyFoldersInFolder:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogIconDragging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "remove empty folders in folder: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "folderIcons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v13, "folder", (_QWORD)v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isEmpty"))
            objc_msgSend(v7, "iconDragManager:wantsAnimatedRemovalOfIcon:", self, v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
}

- (void)removeEmptyFoldersInListModel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  SBIconDragManager *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogIconDragging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "remove empty folders in list model: %@", buf, 0xCu);
  }

  -[SBIconDragManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__SBIconDragManager_removeEmptyFoldersInListModel___block_invoke;
    v7[3] = &unk_1E8D86168;
    v8 = v6;
    v9 = self;
    objc_msgSend(v4, "enumerateFolderIconsUsingBlock:", v7);

  }
}

void __51__SBIconDragManager_removeEmptyFoldersInListModel___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "folder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEmpty"))
    objc_msgSend(*(id *)(a1 + 32), "iconDragManager:wantsAnimatedRemovalOfIcon:", *(_QWORD *)(a1 + 40), v4);

}

- (void)pushExpandedIcon:(id)a3 location:(id)a4 context:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  void (**v14)(id, _QWORD);
  void *v15;
  id v16;

  v8 = a6;
  v16 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD))a7;
  -[SBIconDragManager delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "pushExpandedIcon:location:context:animated:completionHandler:", v16, v12, v13, v8, v14);
  }
  else if (v14)
  {
    v14[2](v14, 0);
  }

}

- (void)pushExpandedIconView:(id)a3 context:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v12, "icon");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "location");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIconDragManager pushExpandedIcon:location:context:animated:completionHandler:](self, "pushExpandedIcon:location:context:animated:completionHandler:", v14, v13, v11, v6, v10);
}

- (void)addIcons:(id)a3 intoFolderIcon:(id)a4 openFolderOnFinish:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  void *v27;
  SBIconDragManager *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v30 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "folder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager iconListViewContainingIcon:](self, "iconListViewContainingIcon:", v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v8;
  objc_msgSend(v31, "iconViewForIcon:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bringSubviewToFront:", v10);

  v29 = v10;
  objc_msgSend(v10, "setAllowsEditingAnimation:", 0);
  v28 = self;
  v12 = -[SBIconDragManager listGridCellInfoOptions](self, "listGridCellInfoOptions");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v7;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (v15)
        {
          objc_msgSend(v9, "insertIcon:afterIcon:options:listGridCellInfoOptions:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i), v15, 0, v12);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "containsObject:", v18);

          if (!v20)
            goto LABEL_12;
        }
        if (objc_msgSend(v9, "containsIcon:", v18))
        {
          objc_msgSend(v18, "gridSizeClass");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "gridPathForFirstFreeSlotOfRangeOfSizeClass:avoidingFirstList:listGridCellInfoOptions:", v21, 0, v12);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v9, "insertIcon:atGridPath:options:", v18, v22, 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "containsObject:", v18);

            if (!v24)
              goto LABEL_12;
          }
        }
        objc_msgSend(v9, "addIcon:", v18);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
LABEL_12:
          v26 = v18;

          v15 = v26;
        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  objc_msgSend(v29, "setAllowsEditingAnimation:", 1);
  if (v30)
  {
    objc_msgSend(v29, "location");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconDragManager pushExpandedIcon:location:context:animated:completionHandler:](v28, "pushExpandedIcon:location:context:animated:completionHandler:", v32, v27, 0, 1, 0);

  }
}

- (id)localizedFolderNameForCombiningIcon:(id)a3 withIcon:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[SBIconDragManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "iconDragManager:localizedFolderNameForCombiningIcon:withIcon:", self, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBIconDragManager model](self, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedDefaultFolderName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)createNewFolderFromRecipientIcon:(id)a3 grabbedIcon:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  SBFolderIcon *v10;
  unint64_t v11;
  uint64_t v12;
  SBFolderIcon *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  SBFolderIcon *v18;
  unint64_t v19;
  _QWORD v20[4];
  id v21;
  SBFolderIcon *v22;

  v6 = a3;
  -[SBIconDragManager localizedFolderNameForCombiningIcon:withIcon:](self, "localizedFolderNameForCombiningIcon:withIcon:", a4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "makeFolderWithDisplayName:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCancelable:", 1);
  v10 = -[SBFolderIcon initWithFolder:]([SBFolderIcon alloc], "initWithFolder:", v9);
  v11 = -[SBIconDragManager listGridCellInfoOptions](self, "listGridCellInfoOptions");
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66__SBIconDragManager_createNewFolderFromRecipientIcon_grabbedIcon___block_invoke;
  v20[3] = &unk_1E8D86190;
  v21 = v6;
  v22 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __66__SBIconDragManager_createNewFolderFromRecipientIcon_grabbedIcon___block_invoke_2;
  v16[3] = &unk_1E8D861B8;
  v17 = v21;
  v18 = v22;
  v19 = v11;
  v13 = v22;
  v14 = v21;
  -[SBIconDragManager modifyRootFolderUsingBlock:orRootListModelUsingBlock:](self, "modifyRootFolderUsingBlock:orRootListModelUsingBlock:", v20, v16);
  objc_msgSend(v8, "addIcon:", v13);

  return v9;
}

uint64_t __66__SBIconDragManager_createNewFolderFromRecipientIcon_grabbedIcon___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "replaceIcon:withIcon:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

id __66__SBIconDragManager_createNewFolderFromRecipientIcon_grabbedIcon___block_invoke_2(_QWORD *a1, void *a2)
{
  return (id)objc_msgSend(a2, "replaceIcon:withIcon:gridCellInfoOptions:mutationOptions:", a1[4], a1[5], a1[6], 0);
}

- (void)startTrackingDragLocationForEditingFromDropSession:(id)a3 orDragSession:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  SBIconDraggingEditContext *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  if (-[SBIconDragManager isEditing](self, "isEditing"))
    goto LABEL_19;
  -[SBIconDragManager draggingEditContext](self, "draggingEditContext");
  v8 = (SBIconDraggingEditContext *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v6)
    {
LABEL_4:
      -[SBIconDragManager uniqueIdentifierForIconDropSession:](self, "uniqueIdentifierForIconDropSession:", v6);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  else
  {
    v8 = objc_alloc_init(SBIconDraggingEditContext);
    -[SBIconDragManager setDraggingEditContext:](self, "setDraggingEditContext:", v8);
    if (v6)
      goto LABEL_4;
  }
  if (!v7)
  {
    v10 = 0;
    goto LABEL_9;
  }
  -[SBIconDragManager uniqueIdentifierForIconDragSession:](self, "uniqueIdentifierForIconDragSession:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v10 = (void *)v9;
LABEL_9:
  -[SBIconDraggingEditContext setDraggingUniqueIdentifier:](v8, "setDraggingUniqueIdentifier:", v10);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "coordinateSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!(v6 | v7))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Need either UIDropSession or UIDragSession to track a drag"), 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }
  -[SBIconDragManager rootView](self, "rootView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (v6)
      v14 = (void *)v6;
    else
      v14 = (void *)v7;
    objc_msgSend(v14, "locationInView:", v13);
    objc_msgSend(v13, "convertPoint:toCoordinateSpace:", v12);
    v15 = v17;
    v16 = v18;
    -[SBIconDraggingEditContext setEnteredScreenLocation:](v8, "setEnteredScreenLocation:");
  }
  else
  {
    -[SBIconDraggingEditContext setEnteredScreenLocationNeedsUpdate:](v8, "setEnteredScreenLocationNeedsUpdate:", 1);
    v15 = 0x7FF8000000000000;
    v16 = 0x7FF8000000000000;
  }
  SBLogIconDragging();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v21 = 138543874;
    v22 = v10;
    v23 = 2048;
    v24 = v15;
    v25 = 2048;
    v26 = v16;
    _os_log_impl(&dword_1CFEF3000, v19, OS_LOG_TYPE_INFO, "start tracking drag location for editing from drag identifier '%{public}@', location: (%f,%f))", (uint8_t *)&v21, 0x20u);
  }

LABEL_19:
}

- (void)stopTrackingDragLocationForEditingForDragWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogIconDragging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "stop tracking drag location for editing from drag identifier '%{public}@'", (uint8_t *)&v8, 0xCu);
  }

  -[SBIconDragManager draggingEditContext](self, "draggingEditContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "draggingUniqueIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
    -[SBIconDragManager setDraggingEditContext:](self, "setDraggingEditContext:", 0);

}

- (BOOL)swapTrackedIconWithIdentifier:(id)a3 withIcon:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__SBIconDragManager_swapTrackedIconWithIdentifier_withIcon___block_invoke;
  v11[3] = &unk_1E8D85F38;
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  v14 = &v15;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v11);
  LOBYTE(self) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __60__SBIconDragManager_swapTrackedIconWithIdentifier_withIcon___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  if (objc_msgSend(v3, "hasItemIdentifier:", v4))
  {
    SBLogIconDragging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "nodeIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "swapping dragging icon '%@' for icon '%@'", (uint8_t *)&v7, 0x16u);

    }
    objc_msgSend(v3, "swapSourceIconWithIdentifier:withIcon:", v4, *(_QWORD *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (void)compactAndLayoutRootIconListsWithDuration:(double)a3
{
  -[SBIconDragManager layoutIconListsWithAnimationType:forceRelayout:](self, "layoutIconListsWithAnimationType:forceRelayout:", 0, 0, a3);
}

- (void)compactAndLayoutRootIconLists
{
  -[SBIconDragManager defaultIconLayoutAnimationDuration](self, "defaultIconLayoutAnimationDuration");
  -[SBIconDragManager compactAndLayoutRootIconListsWithDuration:](self, "compactAndLayoutRootIconListsWithDuration:");
}

- (void)setIndexPath:(id)a3 whenRevertingIconsWithPathPrefix:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableDictionary *revertingReplacementIndexPaths;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = v13;
  v8 = v6;
  revertingReplacementIndexPaths = self->_revertingReplacementIndexPaths;
  if (v13)
  {
    if (!revertingReplacementIndexPaths)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = self->_revertingReplacementIndexPaths;
      self->_revertingReplacementIndexPaths = v10;

      v7 = v13;
      revertingReplacementIndexPaths = self->_revertingReplacementIndexPaths;
    }
    -[NSMutableDictionary setObject:forKey:](revertingReplacementIndexPaths, "setObject:forKey:", v7, v8);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](revertingReplacementIndexPaths, "removeObjectForKey:", v8);
    if (!-[NSMutableDictionary count](self->_revertingReplacementIndexPaths, "count"))
    {
      v12 = self->_revertingReplacementIndexPaths;
      self->_revertingReplacementIndexPaths = 0;

    }
  }

}

void __49__SBIconDragManager_noteFolderControllerWillOpen__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "draggedIconsHiddenAssertion");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOptions:", *(_QWORD *)(a1 + 32));

}

- (void)noteFolderControllerDidClose:(id)a3
{
  unint64_t v4;
  _QWORD v5[5];

  v4 = -[SBIconDragManager iconLayoutHidingOptions](self, "iconLayoutHidingOptions", a3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SBIconDragManager_noteFolderControllerDidClose___block_invoke;
  v5[3] = &__block_descriptor_40_e34_v32__0__SBIconDragContext_8_16_B24l;
  v5[4] = v4;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v5);
  -[SBIconDragManager layoutIconListsWithAnimationType:forceRelayout:](self, "layoutIconListsWithAnimationType:forceRelayout:", 0, 0);
}

void __50__SBIconDragManager_noteFolderControllerDidClose___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "draggedIconsHiddenAssertion");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOptions:", *(_QWORD *)(a1 + 32));

}

- (void)cancelEditingAndAllDrags
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  SBLogIconDragging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "cancel editing and all drags", v5, 2u);
  }

  -[SBIconDragManager delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setEditing:", 0);
  -[SBIconDragManager cancelAllDrags](self, "cancelAllDrags");

}

- (void)cancelAllDrags
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[SBIconDragManager allDragIdentifiers](self, "allDragIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIconDragging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v3;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_INFO, "cancel all drags. active drags: %{public}@", buf, 0xCu);
  }

  v5 = -[SBIconDragManager isIconDragging](self, "isIconDragging");
  v6 = -[SBIconDragManager isTrackingUserActiveIconDrags](self, "isTrackingUserActiveIconDrags");
  if (v5 && !v6)
  {
    SBLogIconDragging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_INFO, "will not cancel all drags because a drag exists that is animating into final place", buf, 2u);
    }
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend((id)objc_opt_class(), "cancelAllDrags");
  if (-[SBIconDragManager isIconDragging](self, "isIconDragging"))
  {
    -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", &__block_literal_global_216);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v3;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
          -[SBIconDragManager _stopTrackingDragWithIdentifier:](self, "_stopTrackingDragWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }
    goto LABEL_15;
  }
LABEL_16:

}

void __35__SBIconDragManager_cancelAllDrags__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "primaryIconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelDrag");
  objc_msgSend(v3, "cancelDragLift");
  objc_msgSend(v2, "removeAllMessageExpectations");
  objc_msgSend(v2, "setRecipientIconView:", 0);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v2, "appLocalContexts", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "portaledPreview");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        if (objc_msgSend(v11, "dragState") == 3)
          objc_msgSend(v11, "setDragState:", 4);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)noteDragItemWasConsumedExternallyForDropSession:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    -[SBIconDragManager iconDragContextForDragDropSession:](self, "iconDragContextForDragDropSession:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
      objc_msgSend(v3, "setDragItemWasConsumedExternally:", 1);
      v3 = v4;
    }

  }
}

- (void)watchdogDragWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  SBLogIconDragging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[SBIconDragManager watchdogDragWithIdentifier:].cold.1((uint64_t)v4, v5);

  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryIconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelDrag");
  objc_msgSend(v6, "removeAllMessageExpectations");
  objc_msgSend(v6, "setRecipientIconView:", 0);
  -[SBIconDragManager _stopTrackingDragWithIdentifier:](self, "_stopTrackingDragWithIdentifier:", v4);

}

- (BOOL)shouldUseGhostIconForIconView:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  char v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_msgSend(v4, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SBIconLocationAddWidgetSheet")) & 1) != 0)
  {
    LOBYTE(v6) = 0;
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(v4, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("SBIconLocationStackConfiguration"));

  if ((v8 & 1) == 0)
  {
    -[SBIconDragManager delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v5, "isEditingAllowedForIconView:", v4))
      goto LABEL_10;
    objc_msgSend(v4, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupDock"), v9)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = objc_msgSend(v5, "isIconContentPossiblyVisibleOverApplication");

      if ((v10 & 1) != 0)
      {
LABEL_10:
        LOBYTE(v6) = 1;
        goto LABEL_13;
      }
    }
    else
    {

    }
    v6 = !-[SBIconDragManager doesIconViewRepresentRealIconPosition:](self, "doesIconViewRepresentRealIconPosition:", v4);
    goto LABEL_13;
  }
  LOBYTE(v6) = 0;
LABEL_14:

  return v6;
}

- (id)startingIconLocationForIcon:(id)a3 dragIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t started;
  void *v11;

  v6 = a3;
  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appDragLocalContextWithIconIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  started = SBHAppDragLocalContextStartLocationFromSBSLocation(objc_msgSend(v9, "startLocation"));
  SBHIconLocationForSBHAppDragLocalContextStartLocation(started);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)doesIconViewRepresentRealIconPosition:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[SBIconDragManager doesIconRepresentRealIconPosition:inLocation:](self, "doesIconRepresentRealIconPosition:inLocation:", v5, v6);
  return (char)self;
}

- (BOOL)doesIconRepresentRealIconPosition:(id)a3 dragIdentifier:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[SBIconDragManager startingIconLocationForIcon:dragIdentifier:](self, "startingIconLocationForIcon:dragIdentifier:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SBIconDragManager doesIconRepresentRealIconPosition:inLocation:](self, "doesIconRepresentRealIconPosition:inLocation:", v6, v7);

  return (char)self;
}

- (BOOL)doesIconRepresentRealIconPosition:(id)a3 inLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  -[SBIconDragManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = objc_msgSend(v8, "iconDragManager:doesIconRepresentRealIconPosition:inLocation:", self, v6, v7);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = objc_msgSend(v8, "iconDragManager:doesIconViewRepresentRealIconPosition:", self, 0);
  }
  else
  {
    v9 = -[SBIconDragManager doesIconLocationRepresentRealIconPosition:](self, "doesIconLocationRepresentRealIconPosition:", v7);
  }
  v10 = v9;

  return v10;
}

- (BOOL)doesIconLocationRepresentRealIconPosition:(id)a3
{
  return SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupIconHierarchy"), a3);
}

- (BOOL)shouldBeginEditingWhenDragBegins
{
  return -[SBIconDragManager isRootFolderContentVisible](self, "isRootFolderContentVisible")
      || -[SBIconDragManager isIconContentPossiblyVisibleOverApplication](self, "isIconContentPossiblyVisibleOverApplication");
}

- (BOOL)shouldCancelDragsWhenEditingEnds
{
  BOOL v2;
  void *v3;

  if (__sb__runningInSpringBoard())
  {
    return !SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "userInterfaceIdiom") == 0;

  }
  return v2;
}

- (double)delayAfterAfterLiftPreviewToBeginEditing
{
  _BOOL4 v3;
  double result;
  _BOOL4 v5;

  v3 = -[SBIconDragManager isRootFolderContentVisible](self, "isRootFolderContentVisible");
  result = 0.0;
  if (v3)
  {
    v5 = -[SBIconDragManager shouldBeginEditingWhenLiftPreviewBegins](self, "shouldBeginEditingWhenLiftPreviewBegins", 0.0);
    result = 1.6;
    if (v5)
      return 0.0;
  }
  return result;
}

- (BOOL)shouldDisallowBumpingIconsFromCurrentList
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SBIconDragManager rootFolder](self, "rootFolder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "maxListCount") == 1;
  else
    v4 = 1;

  return v4;
}

- (BOOL)canMakeIconViewRecipient:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  v5 = -[SBIconDragManager isEditing](self, "isEditing");
  -[SBIconDragManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v6, "iconDragManager:canMakeIconViewDragRecipient:", self, v4);

  return v5;
}

+ (void)cancelAllDrags
{
  objc_msgSend(MEMORY[0x1E0DC3750], "_cancelAllDrags");
}

- (void)_handleScaleAdjustmentForDropSession:(id)a3 currentListView:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (v5)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(a3, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10), "sbh_appDragLocalContext");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "portaledPreview");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v13 = v12;
          else
            v13 = 0;
          v14 = v13;

          if (v14)
          {
            v15 = (void *)MEMORY[0x1E0DC3F10];
            v16[0] = MEMORY[0x1E0C809B0];
            v16[1] = 3221225472;
            v16[2] = __74__SBIconDragManager__handleScaleAdjustmentForDropSession_currentListView___block_invoke;
            v16[3] = &unk_1E8D84EF0;
            v17 = v14;
            v18 = v5;
            objc_msgSend(v15, "_animateUsingSpringInteractive:animations:completion:", 0, v16, 0);

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

  }
}

uint64_t __74__SBIconDragManager__handleScaleAdjustmentForDropSession_currentListView___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "iconContentScale");
  return objc_msgSend(v1, "setIconContentScale:");
}

- (void)addPlatterViewToMedusaDragOffscreenWindow:(id)a3 forWindowScene:(id)a4
{
  -[SBIconDragManager addPlatterViewToMedusaDragOffscreenWindow:forWindowScene:interfaceOrientation:](self, "addPlatterViewToMedusaDragOffscreenWindow:forWindowScene:interfaceOrientation:", a3, a4, 0);
}

- (void)addPlatterViewToMedusaDragOffscreenWindow:(id)a3 forWindowScene:(id)a4 interfaceOrientation:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double Width;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat Height;
  NSMutableArray *singleUseDragWindows;
  NSMutableArray *v26;
  NSMutableArray *v27;
  id v28;
  CGRect v29;
  CGRect v30;

  v28 = a3;
  v8 = a4;
  -[SBIconDragManager _windowForDragPreviewsForPlatterView:forWindowScene:](self, "_windowForDragPreviewsForPlatterView:forWindowScene:", v28, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a5)
  {
    objc_msgSend(v9, "_setWindowInterfaceOrientation:", a5);
    if (v8)
    {
      objc_msgSend(v8, "_referenceBounds");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      Width = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_referenceBounds");
      v12 = v20;
      v14 = v21;
      v16 = v22;
      Width = v23;

    }
    if ((unint64_t)(a5 - 3) <= 1)
    {
      v29.origin.x = v12;
      v29.origin.y = v14;
      v29.size.width = v16;
      v29.size.height = Width;
      Height = CGRectGetHeight(v29);
      v30.origin.x = v12;
      v30.origin.y = v14;
      v30.size.width = v16;
      v30.size.height = Width;
      Width = CGRectGetWidth(v30);
      v16 = Height;
    }
    objc_msgSend(v10, "setFrame:", v12, v14, v16, Width);
  }
  objc_msgSend(v10, "beginTrackingPlatterView:", v28);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    singleUseDragWindows = self->_singleUseDragWindows;
    if (!singleUseDragWindows)
    {
      v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v27 = self->_singleUseDragWindows;
      self->_singleUseDragWindows = v26;

      singleUseDragWindows = self->_singleUseDragWindows;
    }
    -[NSMutableArray addObject:](singleUseDragWindows, "addObject:", v10);
  }

}

- (void)removePlatterViewFromMedusaDragOffscreenWindow:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "window");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopTrackingPlatterView:", v4);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSMutableArray removeObject:](self->_singleUseDragWindows, "removeObject:", v5);
    objc_msgSend(v5, "setHidden:", 1);
  }

}

- (void)windowSceneDidDisconnect:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
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
  v5 = self->_singleUseDragWindows;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v11, "windowScene", (_QWORD)v13);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4)
        {
          if (!v8)
            v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v8, "addObject:", v11);
          objc_msgSend(v11, "setHidden:", 1);
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  -[NSMutableArray removeObjectsInArray:](self->_singleUseDragWindows, "removeObjectsInArray:", v8);
}

- (id)_windowForDragPreviewsForPlatterView:(id)a3 forWindowScene:(id)a4
{
  id v5;
  void *v6;
  SBDefaultIconDragPreviewWindow *v7;
  SBDefaultIconDragPreviewViewController *v8;

  v5 = a4;
  -[SBIconDragManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v6, "windowForIconDragPreviewsForIconDragManager:forWindowScene:", self, v5),
        (v7 = (SBDefaultIconDragPreviewWindow *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = -[SBDefaultIconDragPreviewWindow initWithWindowScene:]([SBDefaultIconDragPreviewWindow alloc], "initWithWindowScene:", v5);
    v8 = objc_alloc_init(SBDefaultIconDragPreviewViewController);
    -[SBDefaultIconDragPreviewWindow setRootViewController:](v7, "setRootViewController:", v8);

    -[SBDefaultIconDragPreviewWindow setWindowLevel:](v7, "setWindowLevel:", *MEMORY[0x1E0DC5630] + -4.0);
    -[SBDefaultIconDragPreviewWindow setHidden:](v7, "setHidden:", 0);
    -[SBDefaultIconDragPreviewWindow setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
  }

  return v7;
}

- (void)_updateDragPreviewIconViewForDropSession:(id)a3 inIconListView:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[SBIconDragManager canAcceptDropInSession:inIconListView:](self, "canAcceptDropInSession:inIconListView:", v6, v7))
  {
    v8 = objc_msgSend(v7, "iconViewConfigurationOptions");
    objc_msgSend(v7, "iconLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v7;
    objc_msgSend(v7, "layoutProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v19 = v6;
    objc_msgSend(v6, "items");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v13), "sbh_appDragLocalContext");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "portaledPreview");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v16 = v15;
          else
            v16 = 0;
          v17 = v16;

          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v17, "setIconViewListLayoutProvider:", v20);
          objc_msgSend(v17, "updateDestinationIconLocation:allowsLabelArea:animated:", v9, (v8 & 2) == 0, 1);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    v7 = v18;
    v6 = v19;
  }

}

- (void)_updateDragDistanceForDropSession:(id)a3 currentIconListLocation:(CGPoint)a4
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  y = a4.y;
  x = a4.x;
  -[SBIconDragManager iconDragContextForDropSession:](self, "iconDragContextForDropSession:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[SBIconDragManager isDelegateScrolling](self, "isDelegateScrolling"))
  {
    objc_msgSend(v11, "currentEnteredIconListViewLastLocation");
    v9 = hypot(x - v7, y - v8);
    objc_msgSend(v11, "currentEnteredIconListViewDragDistance");
    objc_msgSend(v11, "setCurrentEnteredIconListViewDragDistance:", v9 + v10);
  }
  objc_msgSend(v11, "setCurrentEnteredIconListViewLastLocation:", x, y);

}

- (id)_iconForDragItem:(id)a3 inIconListView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  objc_msgSend(a3, "sbh_appDragLocalContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "folder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "indexPathForIconWithIdentifier:includingPlaceholders:", v8, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v10, "iconAtIndexPath:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_iconViewForDragItem:(id)a3 inIconListView:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[SBIconDragManager _iconForDragItem:inIconListView:](self, "_iconForDragItem:inIconListView:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "displayedIconViewForIcon:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)maximumAllowedIconDroppingAnimationsForListView:(id)a3
{
  return objc_msgSend(a3, "iconsInRowForSpacingCalculation");
}

+ (void)enumerateAppDragContextsInDragItems:(id)a3 usingBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *, _BYTE *);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *, _BYTE *))a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "sbh_appDragLocalContext");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = 0;
          v6[2](v6, v12, &v13);
          if (v13)
          {

            goto LABEL_12;
          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_12:

}

+ (void)enumerateMedusaPlatterDragPreviewsInDragItems:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__SBIconDragManager_enumerateMedusaPlatterDragPreviewsInDragItems_usingBlock___block_invoke;
  v8[3] = &unk_1E8D86240;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "enumerateAppDragContextsInDragItems:usingBlock:", a3, v8);

}

void __78__SBIconDragManager_enumerateMedusaPlatterDragPreviewsInDragItems_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(a2, "portaledPreview");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = v5;
  else
    v3 = 0;
  v4 = v3;
  if (v4)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)draggedIconIdentifiersForDragDropSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "items", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[SBIconDragManager _iconIdentifierForDragItem:](self, "_iconIdentifierForDragItem:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)draggedIconsForDragDropSession:(id)a3
{
  void *v4;
  void *v5;

  -[SBIconDragManager draggedIconIdentifiersForDragDropSession:](self, "draggedIconIdentifiersForDragDropSession:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager draggedIconsForIdentifiers:](self, "draggedIconsForIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)firstHiddenIconIdentifierInDrag:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[SBIconDragManager draggedIconIdentifiersForDragDropSession:](self, "draggedIconIdentifiersForDragDropSession:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          objc_msgSend(v5, "leafIconForIdentifier:", v10, (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11 && !objc_msgSend(v5, "isIconVisible:", v11))
          {
            v7 = v10;

            goto LABEL_14;
          }

        }
        v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)beginModifyingRootFolder
{
  -[SBIconDragManager setModifyingRootFolder:](self, "setModifyingRootFolder:", 1);
}

- (void)endModifyingRootFolder
{
  -[SBIconDragManager setModifyingRootFolder:](self, "setModifyingRootFolder:", 0);
}

- (void)performBeforeRunLoopWaitsUsingBlock:(id)a3
{
  id v4;
  const __CFAllocator *v5;
  __CFRunLoop *Main;
  NSMutableArray *runLoopWaitBlocks;
  NSMutableArray *v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v4 = a3;
  if (!self->_waitRunLoopObserver)
  {
    objc_initWeak(&location, self);
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __57__SBIconDragManager_performBeforeRunLoopWaitsUsingBlock___block_invoke;
    v15 = &unk_1E8D856A8;
    objc_copyWeak(&v16, &location);
    self->_waitRunLoopObserver = CFRunLoopObserverCreateWithHandler(v5, 0xA0uLL, 0, 0, &v12);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_waitRunLoopObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  runLoopWaitBlocks = self->_runLoopWaitBlocks;
  if (!runLoopWaitBlocks)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = self->_runLoopWaitBlocks;
    self->_runLoopWaitBlocks = v8;

    runLoopWaitBlocks = self->_runLoopWaitBlocks;
  }
  v10 = (void *)objc_msgSend(v4, "copy", v12, v13, v14, v15);
  v11 = _Block_copy(v10);
  -[NSMutableArray addObject:](runLoopWaitBlocks, "addObject:", v11);

}

void __57__SBIconDragManager_performBeforeRunLoopWaitsUsingBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performBlocksBeforeRunLoopWait");

}

- (void)_teardownWaitRunloopObserverIfNeeded
{
  __CFRunLoopObserver *waitRunLoopObserver;

  waitRunLoopObserver = self->_waitRunLoopObserver;
  if (waitRunLoopObserver)
  {
    CFRunLoopObserverInvalidate(waitRunLoopObserver);
    CFRelease(self->_waitRunLoopObserver);
    self->_waitRunLoopObserver = 0;
  }
}

- (void)performBlocksBeforeRunLoopWait
{
  NSMutableArray *v3;
  NSMutableArray *runLoopWaitBlocks;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[SBIconDragManager _teardownWaitRunloopObserverIfNeeded](self, "_teardownWaitRunloopObserverIfNeeded");
  v3 = self->_runLoopWaitBlocks;
  runLoopWaitBlocks = self->_runLoopWaitBlocks;
  self->_runLoopWaitBlocks = 0;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v3;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)allowsNestedFolders
{
  void *v3;
  char v4;

  -[SBIconDragManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "allowsNestedFoldersForIconDragManager:", self);
  else
    v4 = 0;

  return v4;
}

void __39__SBIconDragManager_configureIconView___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "hasGrabbedIcon:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 40), "setGrabbed:", 1);
    objc_msgSend(v6, "addGrabbedIconView:", *(_QWORD *)(a1 + 40));
    *a4 = 1;
  }

}

- (CGPoint)adjustedLocationForDropSession:(id)a3 inView:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  v6 = a3;
  objc_msgSend(v6, "locationInView:", a4);
  v8 = v7;
  v10 = v9;
  -[SBIconDragManager iconDragContextForDropSession:](self, "iconDragContextForDropSession:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "initialTouchOffsetFromIconImageCenter");
  v13 = v8 - v12;
  v15 = v10 - v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (unint64_t)folderMutationOptionsForInsertingIcon:(id)a3 intoList:(id)a4 isSnapToGridEnabled:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  unint64_t v17;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "gridSizeClass");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 == CFSTR("SBHIconGridSizeClassDefault"))
  {

    v14 = 0;
  }
  else
  {
    objc_msgSend(v9, "gridSizeClass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

    v14 = 2;
    if (v13)
      v14 = 0;
  }
  if (v5)
    v15 = v14 | 0xE00;
  else
    v15 = v14;
  v16 = objc_msgSend(v8, "directlyContainsIcon:", v9);

  if (v16)
    v17 = v15 | 4;
  else
    v17 = v15;
  if (-[SBIconDragManager prioritizesDirectIconPlacement](self, "prioritizesDirectIconPlacement"))
    return v17 | 0x100;
  else
    return v17;
}

- (void)closeFolderControllerContainingListView:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  uint64_t v9;
  id v10;

  v10 = a3;
  -[SBIconDragManager delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = v10;
    v6 = v5;
    do
    {
      objc_opt_self();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        break;
      objc_msgSend(v6, "nextResponder");
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
    }
    while (v9);
    objc_msgSend(v4, "iconDragManager:folderController:draggedIconShouldDropFromListView:", self, v6, v5);

  }
}

- (BOOL)isDelegateScrolling
{
  void *v2;
  char v3;

  -[SBIconDragManager delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "isScrolling");
  else
    v3 = 0;

  return v3;
}

- (id)undoProvider
{
  void *v3;
  void *v4;

  -[SBIconDragManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "undoProviderForIconDragManager:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)registerUndoWithUndoManager:(id)a3 preparation:(id)a4 draggedIcons:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSHashTable *registeredUndoManagers;
  NSHashTable *v14;
  NSHashTable *v15;
  uint8_t v16[16];

  v8 = a3;
  v9 = a5;
  v10 = a4;
  SBLogIconDragging();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_INFO, "Registering for undo", v16, 2u);
  }

  +[SBHIconManager undoActionNameForDraggedIcons:](SBHIconManager, "undoActionNameForDraggedIcons:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "registerWithUndoManager:actionName:observer:", v8, v12, self);
  registeredUndoManagers = self->_registeredUndoManagers;
  if (!registeredUndoManagers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v14 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v15 = self->_registeredUndoManagers;
    self->_registeredUndoManagers = v14;

    registeredUndoManagers = self->_registeredUndoManagers;
  }
  -[NSHashTable addObject:](registeredUndoManagers, "addObject:", v8);

}

- (void)clearAllUndoRegistrations
{
  void *v3;
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
  -[SBIconDragManager undoProvider](self, "undoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_registeredUndoManagers;
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
        objc_msgSend(v3, "removeAllUndoRegistrationsInUndoManager:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[NSHashTable removeAllObjects](self->_registeredUndoManagers, "removeAllObjects");
}

- (NSString)description
{
  return (NSString *)-[SBIconDragManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (BOOL)iconViewCanBeginDrags:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  uint8_t v9[16];

  v4 = a3;
  if (-[SBIconDragManager isTrackingUserActiveIconDrags](self, "isTrackingUserActiveIconDrags"))
  {
    SBLogIconDragging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "disallowing icon drag because there is already a drag in progress", v9, 2u);
    }

    -[SBIconDragManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
  }
  else
  {
    -[SBIconDragManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = objc_msgSend(v6, "iconDragManager:canBeginIconDragForIconView:", self, v4);
    else
      v7 = 1;
  }

  return v7;
}

- (id)dragItemsForIconView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBIconDragManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "iconDragManager:dragItemsForIconView:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "icon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SBHIconDragItemWithIconAndIconView(v7, v4, (void *)*MEMORY[0x1E0DAB500]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (int64_t)iconView:(id)a3 draggingStartLocationWithProposedStartLocation:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[SBIconDragManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    a4 = objc_msgSend(v7, "iconDragManager:draggingStartLocationForIconView:proposedStartLocation:", self, v6, a4);

  return a4;
}

- (double)additionalDragLiftScaleForIconView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[SBIconDragManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "iconDragManager:additionalDragLiftScaleForIconView:", self, v4);
    v7 = v6;
  }
  else
  {
    v7 = 1.1;
  }

  return v7;
}

- (void)iconView:(id)a3 willAnimateDragLiftWithAnimator:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  char v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  BOOL v50;
  void *v51;
  void *v52;
  _QWORD v53[5];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  BOOL v60;
  _QWORD v61[4];
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  uint8_t buf[4];
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  SBLogIconDragging();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v67 = v8;
    _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_INFO, "icon view will animate drag lift: %@", buf, 0xCu);
  }

  objc_msgSend(v8, "icon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager uniqueIdentifierForIconDragSession:](self, "uniqueIdentifierForIconDragSession:", v10);
  v13 = objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager _startTrackingDragWithIdentifier:session:](self, "_startTrackingDragWithIdentifier:session:", v13, v10);
  -[SBIconDragManager iconDragContextForDragSession:](self, "iconDragContextForDragSession:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resetLastUserInteractionDate");
  objc_msgSend(v14, "addMessageExpectationNamed:", CFSTR("iconViewLiftAnimationComplete"));
  objc_msgSend(v14, "setPrimaryIconView:", v8);
  objc_msgSend(v14, "addSourceIcon:", v12);
  objc_msgSend(v14, "addSourceIconView:", v8);
  objc_msgSend(v12, "nodeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addItemIdentifier:", v15);

  objc_msgSend(v10, "items");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)v13;
  -[SBIconDragManager addAppLocalContextsFromDragItems:session:toDragWithIdentifier:](self, "addAppLocalContextsFromDragItems:session:toDragWithIdentifier:", v16, 0, v13);

  objc_msgSend(v8, "addObserver:", self);
  v17 = -[SBIconDragManager shouldUseGhostIconForIconView:](self, "shouldUseGhostIconForIconView:", v8);
  v18 = MEMORY[0x1E0C809B0];
  v50 = v17;
  if (v17)
  {
    SBLogIconDragging();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v8;
      _os_log_impl(&dword_1CFEF3000, v19, OS_LOG_TYPE_INFO, "will use ghost icon for icon view: %@", buf, 0xCu);
    }

    objc_msgSend(v14, "addGrabbedIconView:", v8);
    v64[0] = v18;
    v64[1] = 3221225472;
    v64[2] = __70__SBIconDragManager_iconView_willAnimateDragLiftWithAnimator_session___block_invoke;
    v64[3] = &unk_1E8D84C50;
    v65 = v8;
    objc_msgSend(v9, "addAnimations:", v64);

  }
  v52 = v9;
  objc_msgSend(v8, "icon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "gridSizeClass");
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21 == CFSTR("SBHIconGridSizeClassDefault"))
  {

  }
  else
  {
    objc_msgSend(v8, "icon");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "gridSizeClass");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

    if ((v25 & 1) == 0)
    {
      objc_msgSend(v10, "locationInView:", v8);
      v27 = v26;
      v29 = v28;
      objc_msgSend(v8, "iconImageCenter");
      objc_msgSend(v14, "setInitialTouchOffsetFromIconImageCenter:", v27 - v30, v29 - v31);
    }
  }
  -[SBIconDragManager iconListViewContainingIcon:](self, "iconListViewContainingIcon:", v12);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "items");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "firstObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sbh_appDragLocalContext");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = v35;
  objc_msgSend(v35, "portaledPreview");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v37 = v36;
  else
    v37 = 0;
  v38 = v37;

  v39 = MEMORY[0x1E0C809B0];
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __70__SBIconDragManager_iconView_willAnimateDragLiftWithAnimator_session___block_invoke_2;
  v61[3] = &unk_1E8D84EF0;
  v40 = v38;
  v62 = v40;
  v41 = v8;
  v63 = v41;
  objc_msgSend(v52, "addAnimations:", v61);
  v53[0] = v39;
  v53[1] = 3221225472;
  v53[2] = __70__SBIconDragManager_iconView_willAnimateDragLiftWithAnimator_session___block_invoke_3;
  v53[3] = &unk_1E8D862B8;
  v53[4] = self;
  v42 = v41;
  v54 = v42;
  v43 = v40;
  v55 = v43;
  v60 = v50;
  v44 = v12;
  v56 = v44;
  v45 = v51;
  v57 = v45;
  v46 = v14;
  v58 = v46;
  v47 = v32;
  v59 = v47;
  objc_msgSend(v52, "addCompletion:", v53);
  -[SBIconDragManager changeStateOfDragWithIdentifier:toState:](self, "changeStateOfDragWithIdentifier:toState:", v45, 1);
  -[SBIconDragManager delegate](self, "delegate");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v48, "iconDragManager:iconView:willAnimateDragLiftWithAnimator:session:", self, v42, v52, v10);

}

uint64_t __70__SBIconDragManager_iconView_willAnimateDragLiftWithAnimator_session___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setGrabbed:", 1);
}

uint64_t __70__SBIconDragManager_iconView_willAnimateDragLiftWithAnimator_session___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "iconContentScale");
  objc_msgSend(v2, "setIconContentScale:");
  result = objc_msgSend(*(id *)(a1 + 32), "dragState");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "setDragState:", 1);
  return result;
}

void __70__SBIconDragManager_iconView_willAnimateDragLiftWithAnimator_session___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __70__SBIconDragManager_iconView_willAnimateDragLiftWithAnimator_session___block_invoke_4;
  v17 = &unk_1E8D86290;
  v4 = *(void **)(a1 + 32);
  v18 = *(id *)(a1 + 40);
  objc_msgSend(v4, "enumerateIconDragContextsUsingBlock:", &v14);
  SBLogIconDragging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v21 = a2;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "icon view lift animation did complete at position: %lu", buf, 0xCu);
  }

  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "setHighlighted:", 0, v14, v15, v16, v17);
    if (*(_BYTE *)(a1 + 88))
      goto LABEL_12;
    objc_msgSend(*(id *)(a1 + 40), "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_removeDraggedIconsFromLayout:iconLocation:dragIdentifier:", v8, v6, *(_QWORD *)(a1 + 64));

    objc_msgSend(*(id *)(a1 + 72), "dragPlaceholder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(*(id *)(a1 + 80), "model");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "directlyContainsIcon:", *(_QWORD *)(a1 + 56));

      if (!v11)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(*(id *)(a1 + 80), "addPlaceholderRepresentingIcon:reason:options:", *(_QWORD *)(a1 + 56), CFSTR("drag"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "setDragPlaceholder:", v9);
      v12 = *(void **)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 56), "gridSizeClass");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDragPlaceholderGridSizeClass:", v13);

    }
    goto LABEL_11;
  }
  if (a2 == 1)
    objc_msgSend(*(id *)(a1 + 48), "draggingSourceCancelAnimationCompleted", v14, v15, v16, v17);
LABEL_12:
  objc_msgSend(*(id *)(a1 + 72), "removeMessageExpectationNamed:", CFSTR("iconViewLiftAnimationComplete"), v14, v15, v16, v17);
  objc_msgSend(*(id *)(a1 + 32), "_stopTrackingDragIfPossibleWithIdentifier:", *(_QWORD *)(a1 + 64));

}

void __70__SBIconDragManager_iconView_willAnimateDragLiftWithAnimator_session___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "state") == 5)
  {
    objc_msgSend(v4, "dragPreviewForIconView:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dropDestinationAnimationCompleted");

  }
}

- (void)iconView:(id)a3 dragLiftAnimationDidChangeDirection:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  SBIconDragManager *v17;
  BOOL v18;
  _QWORD v19[4];
  id v20;
  BOOL v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  SBLogIconDragging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v6;
    v24 = 2048;
    v25 = a4;
    _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_INFO, "icon view drag lift animation did change direction: %@, new position: %li", buf, 0x16u);
  }

  v8 = (void *)MEMORY[0x1E0DC3F10];
  -[SBIconDragManager defaultIconLayoutAnimationDuration](self, "defaultIconLayoutAnimationDuration");
  v10 = v9;
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__SBIconDragManager_iconView_dragLiftAnimationDidChangeDirection___block_invoke;
  v19[3] = &unk_1E8D85BB8;
  v12 = v6;
  v20 = v12;
  v21 = a4 == 1;
  objc_msgSend(v8, "animateWithDuration:animations:", v19, v10);
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __66__SBIconDragManager_iconView_dragLiftAnimationDidChangeDirection___block_invoke_2;
  v15[3] = &unk_1E8D862E0;
  v13 = v12;
  v16 = v13;
  v17 = self;
  v18 = a4 == 1;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v15);
  -[SBIconDragManager delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "iconDragManager:iconView:dragLiftAnimationDidChangeDirection:", self, v13, a4);

}

uint64_t __66__SBIconDragManager_iconView_dragLiftAnimationDidChangeDirection___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", *(_BYTE *)(a1 + 40) == 0);
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "setGrabbed:", 0);
  return result;
}

void __66__SBIconDragManager_iconView_dragLiftAnimationDidChangeDirection___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v7, "hasSourceIconView:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v7, "resetLastUserInteractionDate");
    if (*(_BYTE *)(a1 + 48))
      v6 = 2;
    else
      v6 = 1;
    objc_msgSend(*(id *)(a1 + 40), "changeStateOfDragWithIdentifier:toState:", v5, v6);
  }

}

- (void)iconViewWillBeginDrag:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  SBIconDragManager *v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogIconDragging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v6;
    _os_log_impl(&dword_1CFEF3000, v8, OS_LOG_TYPE_INFO, "icon view will begin drag: %@", buf, 0xCu);
  }

  -[SBIconDragManager delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SBIconDragManager isEditing](self, "isEditing")
    && -[SBIconDragManager shouldBeginEditingWhenDragBegins](self, "shouldBeginEditingWhenDragBegins"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "setEditing:fromIconView:", 1, v6);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "setEditing:", 1);
    }
  }
  -[SBIconDragManager iconDragContextForDragSession:](self, "iconDragContextForDragSession:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addMessageExpectationNamed:", CFSTR("iconViewEndSession"));
  -[SBIconDragManager uniqueIdentifierForIconDragSession:](self, "uniqueIdentifierForIconDragSession:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconDragManager:willBeginIconDragWithUniqueIdentifier:numberOfDraggedItems:", self, v11, objc_msgSend(v12, "count"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "iconDragManager:iconView:willBeginDragSession:", self, v6, v7);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "windowScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissLibraryForIconDragManager:windowScene:", self, v14);

  }
  -[SBIconDragManager changeStateOfDragWithIdentifier:toState:](self, "changeStateOfDragWithIdentifier:toState:", v11, 3);
  -[SBIconDragManager startTrackingDragLocationForEditingFromDropSession:orDragSession:](self, "startTrackingDragLocationForEditingFromDropSession:orDragSession:", 0, v7);
  objc_msgSend(v7, "items");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager addAppLocalContextsFromDragItems:session:toDragWithIdentifier:](self, "addAppLocalContextsFromDragItems:session:toDragWithIdentifier:", v15, 0, v11);

  v16 = (void *)MEMORY[0x1E0DC3F10];
  -[SBIconDragManager defaultIconLayoutAnimationDuration](self, "defaultIconLayoutAnimationDuration");
  v18 = v17;
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __51__SBIconDragManager_iconViewWillBeginDrag_session___block_invoke;
  v25 = &unk_1E8D86330;
  v26 = self;
  v27 = v7;
  v28 = v6;
  v29 = v10;
  v19 = v10;
  v20 = v6;
  v21 = v7;
  objc_msgSend(v16, "animateWithDuration:animations:", &v22, v18);
  -[SBIconDragManager _updateDragPreviewsForEditingState:animated:](self, "_updateDragPreviewsForEditingState:animated:", -[SBIconDragManager isEditing](self, "isEditing", v22, v23, v24, v25, v26), 0);

}

void __51__SBIconDragManager_iconViewWillBeginDrag_session___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  v2 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SBIconDragManager_iconViewWillBeginDrag_session___block_invoke_2;
  v6[3] = &unk_1E8D86308;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v2, "enumerateMedusaPlatterDragPreviewsInDragItems:usingBlock:", v3, v6);

}

void __51__SBIconDragManager_iconViewWillBeginDrag_session___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "customIconImageViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__2;
    v18 = __Block_byref_object_dispose__2;
    v19 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__SBIconDragManager_iconViewWillBeginDrag_session___block_invoke_3;
    v10[3] = &unk_1E8D85F38;
    v7 = *(void **)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    v12 = *(id *)(a1 + 32);
    v13 = &v14;
    objc_msgSend(v7, "enumerateIconDragContextsUsingBlock:", v10);
    v8 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
    v4 = v8;
  }
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "borrowIconImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setIconViewBorrowAssertion:forIconView:", v9, *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 48), "setBorrowedViewController:forIconView:", v4, *(_QWORD *)(a1 + 32));
    objc_msgSend(v4, "removeFromParentViewController");
    objc_msgSend(v3, "setIconViewCustomIconImageViewController:", v4);

  }
  objc_msgSend(v3, "setDragState:", 2);

}

void __51__SBIconDragManager_iconViewWillBeginDrag_session___block_invoke_3(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  if ((void *)a1[4] != a2)
  {
    objc_msgSend(a2, "borrowedViewControllerForIconView:", a1[5]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v6);
      v6 = v7;
      *a4 = 1;
    }

  }
}

- (BOOL)iconView:(id)a3 canAddDragItemsToSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  int v26;
  void *v27;
  char v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v7, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "sbh_appDragLocalContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {

          goto LABEL_24;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      if (v11)
        continue;
      break;
    }
  }

  v39 = *MEMORY[0x1E0DAB500];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v7, "hasItemsConformingToTypeIdentifiers:", v15);

  if ((v16 & 1) == 0)
  {
LABEL_24:
    -[SBIconDragManager iconDragContextForDragSession:](self, "iconDragContextForDragSession:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:
    -[SBIconDragManager delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  v17 = objc_msgSend(v8, "canBeAddedToMultiItemDrag");
  -[SBIconDragManager iconDragContextForDragSession:](self, "iconDragContextForDragSession:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v17)
    goto LABEL_25;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v18, "draggedIcons", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v31;
    while (2)
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v20);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "canBeAddedToMultiItemDrag") & 1) == 0)
        {

          goto LABEL_25;
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v22)
        continue;
      break;
    }
  }

  objc_msgSend(v8, "nodeIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v19, "hasItemIdentifier:", v25);

  if (v26)
    goto LABEL_25;
  -[SBIconDragManager delegate](self, "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SBIconDragManager isEditing](self, "isEditing"))
  {
LABEL_26:
    v28 = 0;
    goto LABEL_27;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v28 = objc_msgSend(v27, "iconDragManager:canAddDragItemsToSession:fromIconView:", self, v7, v6);
  else
    v28 = 1;
LABEL_27:

  return v28;
}

- (void)iconView:(id)a3 willAddDragItems:(id)a4 toSession:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  SBLogIconDragging();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v8;
    _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_INFO, "icon view will add drag items: %@", buf, 0xCu);
  }

  objc_msgSend(v8, "icon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager iconListViewContainingIcon:](self, "iconListViewContainingIcon:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager iconDragContextForDragSession:](self, "iconDragContextForDragSession:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBIconDragManager doesIconViewRepresentRealIconPosition:](self, "doesIconViewRepresentRealIconPosition:", v8))
  {
    objc_msgSend(v15, "draggedIconsHiddenAssertion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogIconDragging();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v12;
      v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_1CFEF3000, v17, OS_LOG_TYPE_INFO, "adding icon %@ to icon hiding assertion %@", buf, 0x16u);
    }

    objc_msgSend(v16, "addIcon:", v12);
  }
  objc_msgSend(v15, "addSourceIcon:", v12);
  objc_msgSend(v15, "addSourceIconView:", v8);
  objc_msgSend(v12, "nodeIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addItemIdentifier:", v18);

  -[SBIconDragManager uniqueIdentifierForIconDragSession:](self, "uniqueIdentifierForIconDragSession:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "items");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "iconDragManager:didAddItemsToIconDragWithUniqueIdentifier:numberOfDraggedItems:", self, v19, objc_msgSend(v20, "count"));

  }
  v26 = v8;
  v21 = objc_msgSend(v15, "state");
  -[SBIconDragManager changeStateOfDragWithIdentifier:toState:](self, "changeStateOfDragWithIdentifier:toState:", v19, 4);
  v25 = v14;
  objc_msgSend(v14, "layoutIconsIfNeededWithAnimationType:options:", 0, 1);
  -[SBIconDragManager layoutIconListsWithAnimationType:forceRelayout:](self, "layoutIconListsWithAnimationType:forceRelayout:", 0, 0);
  if (-[SBIconDragManager shouldBeginEditingWhenAddingDragItems](self, "shouldBeginEditingWhenAddingDragItems")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "setEditing:", 1);
  }
  v22 = v9;
  -[SBIconDragManager addAppLocalContextsFromDragItems:session:toDragWithIdentifier:](self, "addAppLocalContextsFromDragItems:session:toDragWithIdentifier:", v9, 0, v19);
  v23 = (void *)objc_opt_class();
  objc_msgSend(v10, "items");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "enumerateMedusaPlatterDragPreviewsInDragItems:usingBlock:", v24, &__block_literal_global_285);

  objc_msgSend(v15, "resetLastUserInteractionDate");
  if (v21 != 4 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "iconDragManagerMultiItemIconDraggingDidChange:", self);

}

uint64_t __57__SBIconDragManager_iconView_willAddDragItems_toSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFlocked:", 1);
}

- (void)handleIconView:(id)a3 dragSession:(id)a4 willEndWithOperation:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  SBLogIconDragging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v7;
    v11 = 2048;
    v12 = a5;
    _os_log_impl(&dword_1CFEF3000, v8, OS_LOG_TYPE_INFO, "icon view drag session will end: %@, operation: %lu", (uint8_t *)&v9, 0x16u);
  }

  if (!-[SBIconDragManager isTrackingUserActiveIconDrags](self, "isTrackingUserActiveIconDrags"))
    -[SBIconDragManager _invalidateAutoScrollAssistant](self, "_invalidateAutoScrollAssistant");

}

- (void)handleIconView:(id)a3 dragSession:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  id v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  SBLogIconDragging();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v8;
    v20 = 2048;
    v21 = a5;
    _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_INFO, "icon view drag session did end: %@, operation: %lu", buf, 0x16u);
  }

  -[SBIconDragManager iconDragContextForDragSession:](self, "iconDragContextForDragSession:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "hasMessageExpectationNamed:", CFSTR("iconViewEndSession")) & 1) != 0)
  {
    objc_msgSend(v8, "setHighlighted:", 0);
    v12 = (void *)objc_opt_class();
    objc_msgSend(v9, "items");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __68__SBIconDragManager_handleIconView_dragSession_didEndWithOperation___block_invoke;
    v17[3] = &__block_descriptor_40_e33_v24__0___SBIconDragPreview__8_B16l;
    v17[4] = a5;
    objc_msgSend(v12, "enumerateMedusaPlatterDragPreviewsInDragItems:usingBlock:", v13, v17);

    -[SBIconDragManager uniqueIdentifierForIconDragSession:](self, "uniqueIdentifierForIconDragSession:", v9);
    v14 = objc_claimAutoreleasedReturnValue();
    -[SBIconDragManager delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "items");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "iconDragManager:didEndIconDragWithUniqueIdentifier:numberOfDraggedItems:", self, v14, objc_msgSend(v16, "count"));

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v15, "iconDragManager:iconView:didEndDragSession:withOperation:", self, v8, v9, a5);
    objc_msgSend(v11, "removeMessageExpectationNamed:", CFSTR("iconViewEndSession"));
    if ((objc_msgSend(v11, "performedIconDrop") & 1) == 0 && (objc_msgSend(v11, "isCancelled") & 1) == 0)
      objc_msgSend(v8, "setGrabbed:", 0);
    -[SBIconDragManager _stopTrackingDragIfPossibleWithIdentifier:](self, "_stopTrackingDragIfPossibleWithIdentifier:", v14);

  }
  else
  {
    SBLogIconDragging();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CFEF3000, v14, OS_LOG_TYPE_INFO, "already received iconView:dragSession:didEndWithOperation: so exiting early", buf, 2u);
    }
  }

}

uint64_t __68__SBIconDragManager_handleIconView_dragSession_didEndWithOperation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "draggingSourceDroppedWithOperation:", *(_QWORD *)(a1 + 32));
}

- (id)iconViewWillCancelDrag:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogIconDragging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v4;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "icon view will cancel drag: %@", buf, 0xCu);
  }

  v6 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __44__SBIconDragManager_iconViewWillCancelDrag___block_invoke;
  v29[3] = &unk_1E8D86290;
  v7 = v4;
  v30 = v7;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v29);
  -[SBIconDragManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "iconViewQueryableForIconDragManager:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v7, "icon");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconViewForIcon:location:", v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (id)v12;
    goto LABEL_8;
  }
  v15 = objc_opt_class();
  v10 = v10;
  if (v15)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v10;
    else
      v16 = 0;
  }
  else
  {
    v16 = 0;
  }
  v17 = v16;

  if (v17)
  {
    objc_msgSend(v17, "referencedIcon");
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "iconViewForIcon:location:", v18, v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v10 = (id)v18;
    if (v13)
      goto LABEL_8;
  }
  -[SBIconDragManager iconListViewContainingIcon:](self, "iconListViewContainingIcon:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "restoreDraggedIconView:", v7))
    goto LABEL_20;
  v13 = v7;

  if (v13)
  {
LABEL_8:
    v14 = v13;
    if ((SBIconViewQueryingDisplayingIcon(v9, v10, 17) & 1) != 0)
      goto LABEL_21;
LABEL_20:

    v13 = 0;
  }
LABEL_21:
  if (!-[SBIconDragManager isIconDragging](self, "isIconDragging"))
  {

    v13 = 0;
  }
  objc_msgSend(v13, "markAsDropping");
  v25[0] = v6;
  v25[1] = 3221225472;
  v25[2] = __44__SBIconDragManager_iconViewWillCancelDrag___block_invoke_2;
  v25[3] = &unk_1E8D863B8;
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v27 = v7;
  v19 = v13;
  v28 = v19;
  v20 = v7;
  v21 = v26;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v25);
  v22 = v28;
  v23 = v19;

  return v23;
}

void __44__SBIconDragManager_iconViewWillCancelDrag___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "hasSourceIconView:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(v3, "setCancelled:", 1);

}

void __44__SBIconDragManager_iconViewWillCancelDrag___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (a1[4] && a1[5] && objc_msgSend(v6, "hasSourceIconView:"))
    objc_msgSend(v6, "addIconViewDroppingAssertion:forIconView:", a1[4], a1[6]);

}

- (void)iconView:(id)a3 willUsePreviewForCancelling:(id)a4 targetIconView:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  SBLogIconDragging();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1CFEF3000, v9, OS_LOG_TYPE_INFO, "icon view will cancel drag using target icon view: %@ %@", buf, 0x16u);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__SBIconDragManager_iconView_willUsePreviewForCancelling_targetIconView___block_invoke;
  v12[3] = &unk_1E8D86268;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v12);

}

void __73__SBIconDragManager_iconView_willUsePreviewForCancelling_targetIconView___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "hasSourceIconView:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(v3, "setTargetIconView:forCancellingIconView:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)iconView:(id)a3 item:(id)a4 willAnimateDragCancelWithAnimator:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  SBIconDragManager *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  SBIconDragManager *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  SBLogIconDragging();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v8;
    _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_INFO, "icon view will animate drag cancel: %@", buf, 0xCu);
  }

  objc_msgSend(v9, "sbh_appDragLocalContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "portaledPreview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  v16 = MEMORY[0x1E0C809B0];
  if (v15)
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke;
    v36[3] = &unk_1E8D84F18;
    v37 = v12;
    v38 = v15;
    v39 = v8;
    objc_msgSend(v10, "addAnimations:", v36);

  }
  v34[0] = v16;
  v34[1] = 3221225472;
  v34[2] = __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke_2;
  v34[3] = &unk_1E8D863E0;
  v17 = v15;
  v35 = v17;
  objc_msgSend(v10, "addCompletion:", v34);
  v30[0] = v16;
  v30[1] = 3221225472;
  v30[2] = __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke_3;
  v30[3] = &unk_1E8D863B8;
  v18 = v8;
  v31 = v18;
  v19 = v10;
  v32 = v19;
  v33 = self;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v30);
  -[SBIconDragManager layoutIconListsWithAnimationType:forceRelayout:](self, "layoutIconListsWithAnimationType:forceRelayout:", 0, 0);
  v23 = v16;
  v24 = 3221225472;
  v25 = __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke_6;
  v26 = &unk_1E8D86408;
  v27 = self;
  v20 = v18;
  v28 = v20;
  v21 = v9;
  v29 = v21;
  objc_msgSend(v19, "addCompletion:", &v23);
  -[SBIconDragManager delegate](self, "delegate", v23, v24, v25, v26, v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v22, "iconDragManager:iconView:item:willAnimateDragCancelWithAnimator:", self, v20, v21, v19);

}

uint64_t __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke(id *a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(a1[4], "cancelsViaScaleAndFade"))
    v2 = 4;
  else
    v2 = 3;
  v3 = a1[5];
  objc_msgSend(a1[6], "iconContentScale");
  objc_msgSend(v3, "setIconContentScale:");
  objc_msgSend(a1[5], "setIconAllowsLabelArea:", objc_msgSend(a1[6], "allowsLabelArea"));
  return objc_msgSend(a1[5], "setDragState:", v2);
}

uint64_t __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "draggingSourceCancelAnimationCompleted");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "setIcon:", 0);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "setIconViewCustomIconImageViewController:", 0);
  return result;
}

void __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "hasSourceIconView:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v5, "targetIconViewForCancellingIconView:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = MEMORY[0x1E0C809B0];
    if (v7)
    {
      objc_msgSend(v7, "markAsDropping");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 40);
      v20[0] = v9;
      v20[1] = 3221225472;
      v20[2] = __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke_4;
      v20[3] = &unk_1E8D863E0;
      v21 = v10;
      v12 = v10;
      objc_msgSend(v11, "addCompletion:", v20);

    }
    objc_msgSend(v5, "resetDraggedIconsHiddenAssertion");
    objc_msgSend(v5, "resetDragPlaceholder");
    objc_msgSend(v5, "resetLastUserInteractionDate");
    objc_msgSend(*(id *)(a1 + 48), "changeStateOfDragWithIdentifier:toState:", v6, 5);
    v13 = *(void **)(a1 + 40);
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke_5;
    v16[3] = &unk_1E8D86408;
    v14 = v5;
    v15 = *(_QWORD *)(a1 + 48);
    v17 = v14;
    v18 = v15;
    v19 = v6;
    objc_msgSend(v13, "addCompletion:", v16);

  }
}

uint64_t __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidateIconViewBorrowAssertions");
  return objc_msgSend(*(id *)(a1 + 40), "changeStateOfDragWithIdentifier:toState:", *(_QWORD *)(a1 + 48), 6);
}

void __69__SBIconDragManager_iconView_item_willAnimateDragCancelWithAnimator___block_invoke_6(uint64_t a1)
{
  id v2;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "countOfTrackedDragsOriginatingFromOrDroppingIntoIconView:", *(_QWORD *)(a1 + 40)) <= 1)objc_msgSend(*(id *)(a1 + 40), "cleanUpAfterDropAnimation");
  objc_msgSend(*(id *)(a1 + 32), "iconDragContextForDragItem:", *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearAllDropAssertions");

}

- (id)iconView:(id)a3 dragPreviewForItem:(id)a4 session:(id)a5 previewParameters:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  SBIconDragManager *v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  SBLogIconDragging();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v31 = v10;
    v32 = 2112;
    v33 = v11;
    _os_log_impl(&dword_1CFEF3000, v14, OS_LOG_TYPE_INFO, "icon view '%@' drag preview for item '%@'", buf, 0x16u);
  }

  -[SBIconDragManager delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v15, "iconDragManager:dragPreviewForIconView:", self, v10),
        (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v17 = (void *)MEMORY[0x1E0DC3F10];
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __75__SBIconDragManager_iconView_dragPreviewForItem_session_previewParameters___block_invoke;
    v25 = &unk_1E8D86330;
    v18 = v16;
    v26 = v18;
    v27 = v10;
    v28 = self;
    v29 = v12;
    objc_msgSend(v17, "performWithoutAnimation:", &v22);
    objc_msgSend(v11, "sbh_appDragLocalContext", v22, v23, v24, v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPortaledPreview:", v18);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D88]), "initWithView:parameters:", v18, v13);
    objc_msgSend(v20, "set_springboardPlatterStyle:", 1);

    if (!v20)
      goto LABEL_11;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v18 = 0;
LABEL_11:
      objc_msgSend(v10, "defaultDragPreviewWithParameters:", v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    objc_msgSend(v15, "iconDragManager:targetedDragPreviewForIconView:item:session:previewParameters:", self, v10, v11, v12, v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    if (!v20)
      goto LABEL_11;
  }
LABEL_12:

  return v20;
}

void __75__SBIconDragManager_iconView_dragPreviewForItem_session_previewParameters___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];

  objc_msgSend(*(id *)(a1 + 32), "setUserInteractionEnabled:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIconAllowsLabelArea:", objc_msgSend(*(id *)(a1 + 40), "allowsLabelArea"));
  objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifierForIconDragSession:", *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "_isTrackingDragWithIdentifier:", v2))
    v3 = 2;
  else
    v3 = 1;
  objc_msgSend(*(id *)(a1 + 32), "setDragState:", v3);
  objc_msgSend(*(id *)(a1 + 40), "iconImageCenter");
  v5 = v4;
  v7 = v6;
  v8 = *(void **)(a1 + 40);
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:toView:", v9, v5, v7);
  v11 = v10;
  v13 = v12;

  objc_msgSend(*(id *)(a1 + 32), "setCenter:", v11, v13);
  objc_msgSend(*(id *)(a1 + 40), "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "_windowInterfaceOrientation");
  v16 = *(void **)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "windowScene");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addPlatterViewToMedusaDragOffscreenWindow:forWindowScene:interfaceOrientation:", v17, v19, v15);

  v20 = *(void **)(a1 + 32);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __75__SBIconDragManager_iconView_dragPreviewForItem_session_previewParameters___block_invoke_2;
  v22[3] = &unk_1E8D86430;
  v22[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v20, "setCleanUpHandler:", v22);
  objc_msgSend(*(id *)(a1 + 48), "_startTrackingDragWithIdentifier:session:", v2, *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 48), "iconDragContextForDragWithIdentifier:", v2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "resetLastUserInteractionDate");
  objc_msgSend(v21, "setDragPreview:forIconView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __75__SBIconDragManager_iconView_dragPreviewForItem_session_previewParameters___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = objc_opt_class();
  v7 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v7;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "removePlatterViewFromMedusaDragOffscreenWindow:", v6);
}

- (void)_updateDragPreviewsForEditingState:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v4[4];
  BOOL v5;
  BOOL v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__SBIconDragManager__updateDragPreviewsForEditingState_animated___block_invoke;
  v4[3] = &__block_descriptor_34_e34_v32__0__SBIconDragContext_8_16_B24l;
  v5 = a3;
  v6 = a4;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v4);
}

uint64_t __65__SBIconDragManager__updateDragPreviewsForEditingState_animated___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int16 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__SBIconDragManager__updateDragPreviewsForEditingState_animated___block_invoke_2;
  v3[3] = &__block_descriptor_34_e54_v32__0__UIView_SBIconDragPreview__8__SBIconView_16_B24l;
  v4 = *(_WORD *)(a1 + 32);
  return objc_msgSend(a2, "enumerateDragPreviewsUsingBlock:", v3);
}

void __65__SBIconDragManager__updateDragPreviewsForEditingState_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "dragState") != 1)
    objc_msgSend(v3, "setIconIsEditing:animated:", *(unsigned __int8 *)(a1 + 32), *(unsigned __int8 *)(a1 + 33));

}

- (BOOL)dragsSupportSystemDragsForIconView:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBIconDragManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "iconDragManager:dragsSupportSystemDragsForIconView:", self, v4);
  else
    v6 = 1;

  return v6;
}

- (id)launchActionsForIconView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBIconDragManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "iconDragManager:launchActionsForIconView:", self, v4);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)launchURLForIconView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBIconDragManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "iconDragManager:launchURLForIconView:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)canHandleIconDropSession:(id)a3 inIconListView:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "iconDragTypeIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v8)
    goto LABEL_12;
  v20[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "hasItemsConformingToTypeIdentifiers:", v10);

  if (!v11)
    goto LABEL_12;
  if (!-[SBIconDragManager isEditingForListView:](self, "isEditingForListView:", v7))
  {
    objc_msgSend(v6, "localDragSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && -[SBIconDragManager _isTrackingDrag:](self, "_isTrackingDrag:", v6))
    {
      v13 = -[SBIconDragManager isIconContentPossiblyVisibleOverApplication](self, "isIconContentPossiblyVisibleOverApplication");

      if (!v13)
      {
LABEL_12:
        v18 = 0;
        goto LABEL_13;
      }
    }
    else
    {

    }
  }
  if ((objc_msgSend(v7, "isDragSpringloadingEnabled") & 1) == 0)
  {
    -[SBIconDragManager iconDragContextForDropSession:](self, "iconDragContextForDropSession:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "draggedIcons");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "model");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isAllowedToContainIcons:", v15);

    if (!v17)
      goto LABEL_12;
  }
  v18 = 1;
LABEL_13:

  return v18;
}

- (BOOL)canAcceptDropInSession:(id)a3 inIconListView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  const char *v30;
  BOOL v31;
  void *v33;
  void *v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBIconDragManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBIconDragManager isEditingAllowedForListView:](self, "isEditingAllowedForListView:", v7))
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(v8, "iconDragManager:canAcceptDropInSession:inIconListView:", self, v6, v7) & 1) != 0)
    {
      -[SBIconDragManager iconDragContextForDropSession:](self, "iconDragContextForDropSession:", v6);
      v9 = objc_claimAutoreleasedReturnValue();
      -[SBIconDragManager adjustedLocationForDropSession:inView:](self, "adjustedLocationForDropSession:inView:", v6, v7);
      v11 = v10;
      v13 = v12;
      -[NSObject draggedIcons](v9, "draggedIcons");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconDragManager duplicateIconsIfNecessary:forDropSession:](self, "duplicateIconsIfNecessary:forDropSession:", v14, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "iconAtPoint:index:", 0, v11, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v7, "dragHitRegionForPoint:icon:", v16, v11, v13);
      v34 = v16;
      v18 = objc_msgSend(v16, "isPlaceholder");
      if ((v17 & 1) != 0)
        v19 = v18;
      else
        v19 = 1;
      -[SBIconDragManager draggedIconIdentifiersForDragDropSession:](self, "draggedIconIdentifiersForDragDropSession:", v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "model");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "folder");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        v23 = v21;
      else
        v23 = 0;
      v24 = v23;
      v33 = v24;
      if (v22 && (objc_msgSend(v22, "canAddIcons:startingAtList:", v15, v24) & 1) == 0)
      {
        SBLogIconDragging();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v36 = objc_msgSend(v20, "count");
          _os_log_impl(&dword_1CFEF3000, v25, OS_LOG_TYPE_INFO, "rejecting drop session because folder can't accommodate all items in drag (%lu)", buf, 0xCu);
        }
        goto LABEL_40;
      }
      -[SBIconDragManager firstHiddenIconIdentifierInDrag:](self, "firstHiddenIconIdentifierInDrag:", v6);
      v25 = objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        SBLogIconDragging();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v36 = (uint64_t)v25;
          v27 = "rejecting drop session entirely because it contains an icon which is not visible (%@)";
          v28 = v26;
          v29 = 12;
LABEL_38:
          _os_log_impl(&dword_1CFEF3000, v28, OS_LOG_TYPE_INFO, v27, buf, v29);
        }
LABEL_39:

LABEL_40:
        v31 = 0;
        goto LABEL_41;
      }
      if (-[SBIconDragManager isEditingForListView:](self, "isEditingForListView:", v7))
      {
        if (v22 && (objc_msgSend(v22, "isAllowedToContainIcons:", v15) & 1) == 0)
        {
          SBLogIconDragging();
          v26 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            goto LABEL_39;
          *(_WORD *)buf = 0;
          v27 = "rejecting drop session because folder isn't allowed to contain some or all of the items in drag";
        }
        else if ((objc_msgSend(v21, "isAllowedToContainIcons:", v15) & 1) != 0)
        {
          if ((objc_msgSend(v22, "isRootFolder") & 1) != 0
            || !-[NSObject hasFolderDraggedIcons](v9, "hasFolderDraggedIcons")
            || -[SBIconDragManager allowsNestedFolders](self, "allowsNestedFolders"))
          {
            v31 = 1;
LABEL_41:

            goto LABEL_42;
          }
          SBLogIconDragging();
          v26 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            goto LABEL_39;
          *(_WORD *)buf = 0;
          v27 = "rejecting drop session because the drag has a folder and we aren't allowed to nest folders";
        }
        else
        {
          SBLogIconDragging();
          v26 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            goto LABEL_39;
          *(_WORD *)buf = 0;
          v27 = "rejecting drop session because destination list isn't allowed to contain some or all of the items in drag";
        }
      }
      else
      {
        SBLogIconDragging();
        v26 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          goto LABEL_39;
        *(_WORD *)buf = 0;
        v27 = "rejecting drop session entirely because editing mode is not active";
      }
      v28 = v26;
      v29 = 2;
      goto LABEL_38;
    }
    SBLogIconDragging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v30 = "rejecting drop session because icon manager delegate doesn't allow it";
      goto LABEL_19;
    }
  }
  else
  {
    SBLogIconDragging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v30 = "rejecting drop session because editing is not allowed";
LABEL_19:
      _os_log_impl(&dword_1CFEF3000, v9, OS_LOG_TYPE_INFO, v30, buf, 2u);
    }
  }
  v31 = 0;
LABEL_42:

  return v31;
}

- (void)iconDropSessionDidEnter:(id)a3 inIconListView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  SBIconDragManager *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBIconDragManager draggedIconIdentifiersForDragDropSession:](self, "draggedIconIdentifiersForDragDropSession:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager uniqueIdentifierForIconDropSession:](self, "uniqueIdentifierForIconDropSession:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIconDragging();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v40 = v9;
    v41 = 2112;
    v42 = v8;
    v43 = 2048;
    v44 = v7;
    _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_INFO, "drop session did enter with identifier: %{public}@, dragged identifiers: %@, icon list view: %p", buf, 0x20u);
  }

  v11 = -[SBIconDragManager _isTrackingDrag:](self, "_isTrackingDrag:", v6);
  -[SBIconDragManager _startTrackingDragWithIdentifier:session:](self, "_startTrackingDragWithIdentifier:session:", v9, v6);
  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setItemIdentifiers:", v8);
  objc_msgSend(v12, "setDragItemWasConsumedExternally:", 0);
  if (!v11)
    objc_msgSend(v12, "setExternalDrag:", 1);
  -[SBIconDragManager delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SBIconDragManager isEditing](self, "isEditing") && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "setEditing:fromIconListView:", 1, v7);
  if (v6)
    objc_msgSend(v7, "addDragObserver:forDropSession:", self, v6);
  if ((objc_msgSend(v12, "hasEnteredIconListView:", v7) & 1) == 0)
  {
    objc_msgSend(v12, "addMessageExpectationNamed:", CFSTR("dropSessionDidEnd"));
    objc_msgSend(v12, "addEnteredIconListView:", v7);
    objc_msgSend(v6, "items");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconDragManager addAppLocalContextsFromDragItems:session:toDragWithIdentifier:](self, "addAppLocalContextsFromDragItems:session:toDragWithIdentifier:", v14, v6, v9);

    objc_msgSend(v6, "items");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconDragManager createIconsFromDragItemsIfNecessary:withDragIdentifier:](self, "createIconsFromDragItemsIfNecessary:withDragIdentifier:", v15, v9);

    objc_msgSend(v6, "items");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconDragManager addApplicationIconsFromDragItems:session:toDragWithIdentifier:](self, "addApplicationIconsFromDragItems:session:toDragWithIdentifier:", v16, v6, v9);

    objc_msgSend(v6, "items");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v17, "count") <= 1)
      v18 = 3;
    else
      v18 = 4;
    -[SBIconDragManager changeStateOfDragWithIdentifier:toState:](self, "changeStateOfDragWithIdentifier:toState:", v9, v18);

  }
  objc_msgSend(v12, "setCurrentEnteredIconListView:", v7);
  -[SBIconDragManager adjustedLocationForDropSession:inView:](self, "adjustedLocationForDropSession:inView:", v6, v7);
  objc_msgSend(v12, "setCurrentEnteredIconListViewLastLocation:");
  objc_msgSend(v12, "setCurrentEnteredIconListViewDragDistance:", 0.0);
  if (!v11 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v30 = v9;
    v32 = v7;
    v29 = v13;
    v31 = self;
    objc_msgSend(v13, "iconViewDelegateForExternalDragForIconDragManager:", self);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v33 = v6;
    objc_msgSend(v6, "items");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v35 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "sbh_appDragLocalContext");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "portaledPreview");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v27 = v26;
          else
            v27 = 0;
          v28 = v27;

          if (v28)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v28, "setIconViewDelegate2:", v19);
            else
              objc_msgSend(v28, "setIconViewDelegate:", v19);
          }

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v22);
    }

    v7 = v32;
    v6 = v33;
    self = v31;
    v9 = v30;
    v13 = v29;
  }
  -[SBIconDragManager _updateDragPreviewIconViewForDropSession:inIconListView:](self, "_updateDragPreviewIconViewForDropSession:inIconListView:", v6, v7);
  -[SBIconDragManager _updateAutoScrollAssistantForDropSession:](self, "_updateAutoScrollAssistantForDropSession:", v6);
  if ((objc_msgSend(v12, "notifiedDelegateForDropSession") & 1) == 0)
  {
    if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v13, "iconDragManager:iconDropSessionDidEnter:", self, v6);
    objc_msgSend(v12, "setNotifiedDelegateForDropSession:", 1);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "iconDragManager:iconDropSession:didEnterIconListView:", self, v6, v7);
  objc_msgSend(v12, "resetLastUserInteractionDate");

}

- (void)informQuickActionPlatterDidFinishPresentation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *, _BYTE *);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__2;
    v17 = __Block_byref_object_dispose__2;
    v18 = 0;
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __67__SBIconDragManager_informQuickActionPlatterDidFinishPresentation___block_invoke;
    v10 = &unk_1E8D85E28;
    v11 = v4;
    v12 = &v13;
    -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", &v7);
    v6 = v14[5];
    if (v6)
      -[SBIconDragManager changeStateOfDragWithIdentifier:toState:](self, "changeStateOfDragWithIdentifier:toState:", v6, 0, v7, v8, v9, v10);

    _Block_object_dispose(&v13, 8);
  }

}

void __67__SBIconDragManager_informQuickActionPlatterDidFinishPresentation___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  objc_msgSend(a2, "primaryIconView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (id)iconDropSessionDidUpdate:(id)a3 inIconListView:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  NSObject *v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  BOOL v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v48;
  void *v49;
  uint8_t buf[4];
  double v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  __int16 v56;
  double v57;
  uint64_t v58;
  CGPoint v59;
  CGRect v60;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBIconDragManager adjustedLocationForDropSession:inView:](self, "adjustedLocationForDropSession:inView:", v6, v7);
  v9 = v8;
  v11 = v10;
  -[SBIconDragManager uniqueIdentifierForIconDropSession:](self, "uniqueIdentifierForIconDropSession:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIconDragging();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544130;
    v51 = *(double *)&v12;
    v52 = 2048;
    v53 = *(double *)&v7;
    v54 = 2048;
    v55 = v9;
    v56 = 2048;
    v57 = v11;
    _os_log_impl(&dword_1CFEF3000, v13, OS_LOG_TYPE_INFO, "drop session did update: identifier %{public}@, icon list view: %p, location in list view: (%f,%f)", buf, 0x2Au);
  }

  -[SBIconDragManager _handleScaleAdjustmentForDropSession:currentListView:](self, "_handleScaleAdjustmentForDropSession:currentListView:", v6, v7);
  -[SBIconDragManager _updateDragPreviewIconViewForDropSession:inIconListView:](self, "_updateDragPreviewIconViewForDropSession:inIconListView:", v6, v7);
  -[SBIconDragManager iconDragContextForDropSession:](self, "iconDragContextForDropSession:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resetLastUserInteractionDate");
  -[SBIconDragManager _updateDragDistanceForDropSession:currentIconListLocation:](self, "_updateDragDistanceForDropSession:currentIconListLocation:", v6, v9, v11);
  objc_msgSend(v7, "bounds");
  v59.x = v9;
  v59.y = v11;
  objc_msgSend(v14, "setWasLastUpdateContainedInDestinationIconListView:", CGRectContainsPoint(v60, v59));
  objc_msgSend(v7, "iconAtPoint:index:", 0, v9, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v7, "dragHitRegionForPoint:icon:", v15, v9, v11);
  objc_msgSend(v14, "recipientIconView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "icon");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  v49 = v12;
  if (v7 && v17)
  {
    objc_msgSend(v15, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uniqueIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v16 & 1) == 0 && (v21 & 1) == 0)
    {
      SBLogIconDragging();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v23 = "clearing recipient icon because we got a None drag hit region";
LABEL_23:
        _os_log_impl(&dword_1CFEF3000, v22, OS_LOG_TYPE_INFO, v23, buf, 2u);
        goto LABEL_24;
      }
      goto LABEL_24;
    }
    if ((v21 & 1) == 0)
    {
      SBLogIconDragging();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v23 = "clearing recipient icon because we the icons don't match";
        goto LABEL_23;
      }
LABEL_24:
      v12 = v49;
LABEL_25:

      objc_msgSend(v14, "setRecipientIconView:", 0);
      goto LABEL_26;
    }
    v12 = v49;
    if ((v16 & 3) == 1)
    {
      if ((v24 = objc_msgSend(v14, "recipientIconEntryRegion"), v25 = v24, (v24 & 0x10) != 0) && (v16 & 0x20) != 0
        || (v24 & 0x20) != 0 && (v16 & 0x10) != 0
        || (v24 & 4) != 0 && (v16 & 8) != 0
        || (v24 & 8) != 0 && (v16 & 4) != 0)
      {
        SBLogIconDragging();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          v51 = *(double *)&v16;
          v52 = 2048;
          v53 = *(double *)&v25;
          _os_log_impl(&dword_1CFEF3000, v22, OS_LOG_TYPE_INFO, "clearing recipient icon because the current hit region (%li) is on the opposite side of the entry region (%li)", buf, 0x16u);
        }
        goto LABEL_25;
      }
    }
  }
LABEL_26:
  objc_msgSend(v14, "recipientIconView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && !v26)
  {
    objc_msgSend(v14, "setCandidateRecipientIcon:", v15);
    objc_msgSend(v14, "setRecipientIconEntryRegion:", v16);
  }
  if (!-[SBIconDragManager isEditing](self, "isEditing"))
  {
    -[SBIconDragManager draggingEditContext](self, "draggingEditContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "draggingUniqueIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28 == v12)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "coordinateSpace");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "convertPoint:toCoordinateSpace:", v30, v9, v11);
      v32 = v31;
      v34 = v33;

      v12 = v49;
      if (objc_msgSend(v27, "enteredScreenLocationNeedsUpdate"))
      {
        SBLogIconDragging();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          v51 = v32;
          v52 = 2048;
          v53 = v34;
          _os_log_impl(&dword_1CFEF3000, v35, OS_LOG_TYPE_INFO, "updating screen location for edit tracking to (%f,%f)", buf, 0x16u);
        }

        objc_msgSend(v27, "setEnteredScreenLocation:", v32, v34);
        objc_msgSend(v27, "setEnteredScreenLocationNeedsUpdate:", 0);
      }
    }

  }
  -[SBIconDragManager updatePlaceholderPositionForDropSession:inIconListView:](self, "updatePlaceholderPositionForDropSession:inIconListView:", v6, v7);
  v36 = -[SBIconDragManager canAcceptDropInSession:inIconListView:](self, "canAcceptDropInSession:inIconListView:", v6, v7);
  v37 = 0;
  if (v36)
    v38 = 2;
  else
    v38 = 0;
  if (v36)
  {
    if (objc_msgSend(v14, "duplicatesSourceIcons"))
    {
      objc_msgSend(v14, "removedMatchingLeafIcons");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = v39 == 0;
      v12 = v49;
      if (v40)
        v37 = 3;
      else
        v37 = 2;
    }
    else
    {
      v37 = 2;
    }
  }
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", v38);
  objc_msgSend(v41, "setPrefersFullSizePreview:", 1);
  objc_msgSend(v41, "_setPreferredBadgeStyle:", v37);
  -[SBIconDragManager delegate](self, "delegate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v14, "draggedIcons");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "iconDragManager:iconDropSessionDidUpdate:inIconListView:draggedIcons:proposedDropProposal:", self, v6, v7, v44, v41);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45 != v41)
    {
      SBLogIconDragging();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v51 = *(double *)&v41;
        v52 = 2112;
        v53 = *(double *)&v45;
        _os_log_impl(&dword_1CFEF3000, v46, OS_LOG_TYPE_INFO, "the delegate told us to adjust the drop proposal from %@ to %@", buf, 0x16u);
      }

    }
    v12 = v49;
  }
  else
  {
    v45 = v41;
  }

  return v45;
}

- (void)updatePlaceholderPositionForDropSession:(id)a3 inIconListView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  unsigned int v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  int64_t v45;
  void *v46;
  void *v47;
  char v48;
  unint64_t v49;
  uint64_t v50;
  NSObject *v51;
  id v52;
  NSObject *v53;
  id v54;
  NSObject *v55;
  int64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  uint8_t buf[4];
  unint64_t v77;
  __int16 v78;
  double v79;
  __int16 v80;
  double v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  id v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBIconDragManager draggedIconIdentifiersForDragDropSession:](self, "draggedIconIdentifiersForDragDropSession:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager uniqueIdentifierForIconDropSession:](self, "uniqueIdentifierForIconDropSession:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBIconDragManager canAcceptDropInSession:inIconListView:](self, "canAcceptDropInSession:inIconListView:", v6, v7))
  {
    if (-[SBIconDragManager isIconDragging](self, "isIconDragging"))
    {
      objc_msgSend(v6, "locationInView:", v7);
      v11 = v10;
      v13 = v12;
      SBLogIconDragging();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413314;
        v77 = (unint64_t)v9;
        v78 = 2048;
        v79 = v11;
        v80 = 2048;
        v81 = v13;
        v82 = 2112;
        v83 = v8;
        v84 = 2048;
        v85 = v7;
        _os_log_impl(&dword_1CFEF3000, v14, OS_LOG_TYPE_INFO, "drag session '%@' did pause at location (%f,%f), dragged identifiers: %@, icon list view: %p", buf, 0x34u);
      }

      -[SBIconDragManager delegate](self, "delegate");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!-[SBIconDragManager isEditingAllowedForListView:](self, "isEditingAllowedForListView:", v7))
      {
        SBLogIconDragging();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v77 = (unint64_t)v9;
          v17 = "ignoring pause of drag session '%@' because editing is not allowed";
          goto LABEL_16;
        }
LABEL_70:

        goto LABEL_71;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && -[NSObject isTrackingScroll](v15, "isTrackingScroll"))
      {
        SBLogIconDragging();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v77 = (unint64_t)v9;
          v17 = "ignoring pause of drag session '%@' because scroll view is tracking";
LABEL_16:
          _os_log_impl(&dword_1CFEF3000, v16, OS_LOG_TYPE_INFO, v17, buf, 0xCu);
          goto LABEL_70;
        }
        goto LABEL_70;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && -[NSObject isAnimatingFolderIconTransitionForIconDragManager:](v15, "isAnimatingFolderIconTransitionForIconDragManager:", self))
      {
        SBLogIconDragging();
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          goto LABEL_70;
        *(_DWORD *)buf = 138412290;
        v77 = (unint64_t)v9;
        v17 = "ignoring pause of drag session '%@' because there is an animated transition inflight";
        goto LABEL_16;
      }
      -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", v9);
      v18 = objc_claimAutoreleasedReturnValue();
      -[NSObject initialTouchOffsetFromIconImageCenter](v18, "initialTouchOffsetFromIconImageCenter");
      v20 = v11 - v19;
      v22 = v13 - v21;
      objc_msgSend(v7, "bounds");
      v24 = fmin(fmax(v20, 1.0), v23 + -1.0);
      v26 = fmin(fmax(v22, 1.0), v25 + -1.0);
      objc_msgSend(v7, "gridCellInfo");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject dragPlaceholderGridSizeClass](v18, "dragPlaceholderGridSizeClass");
      v28 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "displayedModel");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = (void *)v28;
      if (-[SBIconDragManager prioritizesDirectIconPlacement](self, "prioritizesDirectIconPlacement"))
      {
        if (v28)
          v29 = objc_msgSend(v73, "gridSizeForGridSizeClass:", v28);
        else
          v29 = 65537;
        v30 = SBIconCoordinateMakeWithGridCellIndex(objc_msgSend(v7, "closestGridRangeForIconOfSize:centeredAtPoint:", v29, v24, v26), objc_msgSend(v27, "gridSize"));
      }
      else
      {
        v30 = objc_msgSend(v7, "coordinateAtPoint:", v24, v26);
      }
      v32 = v31;
      v69 = v30;
      v71 = v27;
      v67 = objc_msgSend(v27, "gridCellIndexForCoordinate:", v30, v31);
      -[SBIconDragManager draggedIconsForIdentifiers:](self, "draggedIconsForIdentifiers:", v8);
      v74 = v18;
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject draggedIconsHiddenAssertion](v18, "draggedIconsHiddenAssertion");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v65 = v33;
      if (!v33)
      {
        objc_msgSend(v75, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIconDragManager startingIconLocationForIcon:dragIdentifier:](self, "startingIconLocationForIcon:dragIdentifier:", v34, v9);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIconDragManager _removeDraggedIconsFromLayout:iconLocation:dragIdentifier:](self, "_removeDraggedIconsFromLayout:iconLocation:dragIdentifier:", v75, v35, v9);

      }
      objc_msgSend(v7, "iconAtPoint:index:", 0, v24, v26);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogIconDragging();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        SBHStringForIconCoordinate(v69, v32);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v77 = (unint64_t)v36;
        v78 = 2112;
        v79 = *(double *)&v38;
        _os_log_impl(&dword_1CFEF3000, v37, OS_LOG_TYPE_INFO, "paused over icon = %@, coordinate = %@", buf, 0x16u);

      }
      objc_msgSend(v7, "iconViewForIcon:", v36);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "isGrabbed"))
      {
        SBLogIconDragging();
        v40 = objc_claimAutoreleasedReturnValue();
        v16 = v74;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CFEF3000, v40, OS_LOG_TYPE_INFO, "icon under paused drag is already grabbed -- bailing", buf, 2u);
        }
        v41 = v72;
        goto LABEL_69;
      }
      v66 = v39;
      v16 = v74;
      -[NSObject dragPlaceholder](v74, "dragPlaceholder");
      v64 = objc_claimAutoreleasedReturnValue();
      v70 = v36;
      v42 = objc_msgSend(v7, "dragHitRegionForPoint:icon:", v36, v24, v26);
      SBLogIconDragging();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        SBStringForIconListDragHitRegion(v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v77 = (unint64_t)v44;
        v78 = 2048;
        v79 = *(double *)&v42;
        _os_log_impl(&dword_1CFEF3000, v43, OS_LOG_TYPE_INFO, "drag hit region: %@ (%lx)", buf, 0x16u);

      }
      v62 = v42;
      v45 = -[SBIconDragManager placeholderMovementForDragHitRegion:onGridCellIndex:inListView:forDragWithIdentifier:draggedIconIdentifiers:](self, "placeholderMovementForDragHitRegion:onGridCellIndex:inListView:forDragWithIdentifier:draggedIconIdentifiers:", v42, v67, v7, v9, v8);
      -[NSObject recipientIconView](v74, "recipientIconView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "icon");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v70)
        v48 = objc_msgSend(v47, "isEqual:");
      else
        v48 = 0;
      v63 = v47;
      if (v45 == 2 || (v48 & 1) != 0)
      {
        if (v45 == 2)
        {
          v52 = v70;
          v68 = v66;
          -[NSObject recipientIconView](v74, "recipientIconView");
          v61 = (id)objc_claimAutoreleasedReturnValue();
          SBLogIconDragging();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v77 = (unint64_t)v52;
            _os_log_impl(&dword_1CFEF3000, v53, OS_LOG_TYPE_INFO, "Updating recipient icon to %@", buf, 0xCu);
          }

          v16 = v74;
          -[NSObject setRecipientIconView:](v74, "setRecipientIconView:", v68);
          if (v68 != v61)
          {
            -[NSObject candidateRecipientIcon](v74, "candidateRecipientIcon");
            v54 = (id)objc_claimAutoreleasedReturnValue();
            v60 = v52;
            if (v54 != v52 || !-[NSObject recipientIconEntryRegion](v74, "recipientIconEntryRegion"))
              -[NSObject setRecipientIconEntryRegion:](v74, "setRecipientIconEntryRegion:", v62, v52);

            v16 = v74;
            v52 = v60;
          }
          -[NSObject setCandidateRecipientIcon:](v16, "setCandidateRecipientIcon:", 0, v60);

        }
        v41 = v72;
        v39 = v66;
        if (v65)
          goto LABEL_68;
      }
      else
      {
        v49 = -[SBIconDragManager placeholderGridCellIndexForDragPlacement:onGridCellIndex:icon:inListView:forDragWithIdentifier:](self, "placeholderGridCellIndexForDragPlacement:onGridCellIndex:icon:inListView:forDragWithIdentifier:", v45, v67, v70, v7, v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v50 = -[NSObject iconDragManager:willMoveDragPlaceholderToGridCellIndex:inIconListView:draggedIcons:](v15, "iconDragManager:willMoveDragPlaceholderToGridCellIndex:inIconListView:draggedIcons:", self, v49, v7, v75);
          if (v50 != v49)
          {
            SBLogIconDragging();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218240;
              v77 = v49;
              v78 = 2048;
              v79 = *(double *)&v50;
              _os_log_impl(&dword_1CFEF3000, v51, OS_LOG_TYPE_INFO, "the delegate told us to adjust the spot of the placeholder from %lu to %lu", buf, 0x16u);
            }

            v16 = v74;
          }
          if (v50 == 0x7FFFFFFFFFFFFFFFLL)
          {
            -[NSObject resetDragPlaceholder](v16, "resetDragPlaceholder");

            v64 = 0;
            v49 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else
          {
            v49 = v50;
          }
        }
        v41 = v72;
        v39 = v66;
        if (!-[SBIconDragManager movePlaceholderForDraggedIcons:toGridCellIndex:inListView:forDragWithIdentifier:](self, "movePlaceholderForDraggedIcons:toGridCellIndex:inListView:forDragWithIdentifier:", v75, v49, v7, v9))goto LABEL_68;
      }
      SBLogIconDragging();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CFEF3000, v55, OS_LOG_TYPE_INFO, "Laying out list view after moving placeholders", buf, 2u);
      }

      v56 = -[SBIconDragManager _animationTypeForGridSizeClass:](self, "_animationTypeForGridSizeClass:", v41);
      objc_msgSend(v7, "iconLocation");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if ((SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupTodayView"), v57) & 1) != 0)
      {
        v58 = 1;
      }
      else
      {
        objc_msgSend(v7, "iconLocation");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v59, "isEqualToString:", CFSTR("SBIconLocationStackConfiguration"));

      }
      objc_msgSend(v7, "layoutIconsIfNeededWithAnimationType:options:", v56, v58);
      v16 = v74;
      v41 = v72;
      v39 = v66;
LABEL_68:
      -[SBIconDragManager resetWatchdogTimerForDragWithIdentifier:timeout:](self, "resetWatchdogTimerForDragWithIdentifier:timeout:", v9, 60.0);

      v36 = v70;
      v40 = v64;
LABEL_69:

      goto LABEL_70;
    }
    SBLogIconDragging();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SBIconDragManager updatePlaceholderPositionForDropSession:inIconListView:].cold.1((uint64_t)self, (uint64_t)v9, v15);
  }
  else
  {
    SBLogIconDragging();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v77 = (unint64_t)v9;
      _os_log_impl(&dword_1CFEF3000, v15, OS_LOG_TYPE_INFO, "ignoring pause of drag session '%@' because we cannot accept the drop", buf, 0xCu);
    }
  }
LABEL_71:

}

- (int64_t)placeholderMovementForDragHitRegion:(unint64_t)a3 onGridCellIndex:(unint64_t)a4 inListView:(id)a5 forDragWithIdentifier:(id)a6 draggedIconIdentifiers:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  int v21;
  unint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  unint64_t v27;
  int v28;
  BOOL v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  BOOL v35;
  BOOL v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  char v55;
  uint64_t v56;
  unsigned __int16 v57;
  unsigned __int16 v58;
  unint64_t v59;
  BOOL v60;
  int64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  unsigned __int16 v72;
  unint64_t v73;
  void *v74;
  int v75;
  uint64_t v76;
  void *v77;
  id v78;
  void *v79;
  SBIconDragManager *v80;
  void *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t buf[16];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v80 = self;
  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", v13);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "gridCellInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayedModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "gridSize");
  v76 = objc_msgSend(v12, "userInterfaceLayoutDirection");
  v73 = a4;
  v72 = v17;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v79 = 0;
    v18 = 0;
  }
  else
  {
    v19 = SBIconCoordinateMakeWithGridCellIndex(a4, v17);
    objc_msgSend(v12, "iconAtCoordinate:", v19, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v12, "displayedIconViewForIcon:", v18);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = 1;
      goto LABEL_7;
    }
    v79 = 0;
  }
  v75 = 0;
LABEL_7:
  v21 = objc_msgSend(v18, "isPlaceholder");
  objc_msgSend(v81, "dragPlaceholder");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v71, "effectiveGridCellIndex");
  objc_msgSend(v81, "dragPlaceholderGridSizeClass");
  v23 = objc_claimAutoreleasedReturnValue();
  v67 = v16;
  v68 = v13;
  v77 = v18;
  v70 = (void *)v23;
  if (v23)
    v24 = objc_msgSend(v16, "gridSizeForGridSizeClass:", v23);
  else
    v24 = 65537;
  objc_msgSend(v81, "dragPlaceholderListView");
  v78 = (id)objc_claimAutoreleasedReturnValue();

  v25 = 0x7FFFFFFFFFFFFFFFLL;
  v74 = v15;
  if (v73 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v26 = 0;
    v27 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v27 = objc_msgSend(v15, "gridRangeForGridCellIndex:", v73);
    v26 = v28;
    SBHIconGridRangeAnchoredEdges(v27, v28, 0, v17, v17);
  }
  v29 = v78 != v12 || v22 == 0x7FFFFFFFFFFFFFFFLL;
  v30 = v75;
  if (v29)
    v30 = 0;
  v31 = 0x7FFFFFFFFFFFFFFFLL;
  if (v30 == 1)
  {
    v31 = SBHIconGridDistanceBetweenGridRanges(v27, v26, v22, v24, v17);
    v25 = v32;
  }
  if ((a3 >> 1) & 1 | v21 & 1)
  {
    v33 = a3 & 2;
  }
  else
  {
    if ((a3 & 4) == 0)
    {
      if ((a3 & 8) != 0)
      {
        v33 = 6;
        goto LABEL_28;
      }
      if ((a3 & 0x30) == 0)
      {
        v33 = ((uint64_t)(a3 << 63) >> 63) & 7;
        goto LABEL_28;
      }
    }
    v33 = 7;
  }
LABEL_28:
  v34 = a3 & 0x3C;
  v35 = v76 == 1;
  v36 = v34 != 16 || v76 == 1;
  if (!v36 && !v25 && v31 == -1)
    goto LABEL_53;
  if (v34 != 32)
    v35 = 1;
  if (!v35 && !v25 && v31 == 1
    || v34 == 16 && v76 == 1 && !v25 && v31 == 1
    || v34 == 32 && v76 == 1 && !v25 && v31 == -1
    || v34 == 4 && v25 == -1 && !v31
    || v34 == 8 && v25 == 1 && !v31)
  {
LABEL_53:
    SBLogIconDragging();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CFEF3000, v37, OS_LOG_TYPE_INFO, "moving drag placeholder movement to 'overlapping' due to proximity to placeholder", buf, 2u);
    }

    v33 = 2;
  }
  objc_msgSend(v81, "recipientIconView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  v69 = v14;
  if (v33 == 2)
  {
    objc_msgSend(v38, "icon");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "uniqueIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "uniqueIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "isEqual:", v42);

    if ((v43 & 1) != 0)
    {
LABEL_58:
      v33 = 2;
LABEL_84:
      v46 = v67;
      v45 = v68;
      v47 = v77;

      goto LABEL_85;
    }
    v48 = v75 ^ 1;
    if (!v79)
      v48 = 1;
    if ((v48 & 1) == 0 && -[SBIconDragManager canMakeIconViewRecipient:](v80, "canMakeIconViewRecipient:"))
    {
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v49 = v14;
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
      if (!v50)
      {
LABEL_76:

        goto LABEL_58;
      }
      v51 = v50;
      v52 = *(_QWORD *)v83;
LABEL_69:
      v53 = 0;
      while (1)
      {
        if (*(_QWORD *)v83 != v52)
          objc_enumerationMutation(v49);
        -[SBIconDragManager draggedIconForIdentifier:](v80, "draggedIconForIdentifier:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * v53));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54)
        {
          if (!objc_msgSend(v79, "canReceiveGrabbedIcon:", v54))
            break;
        }

        if (v51 == ++v53)
        {
          v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
          if (v51)
            goto LABEL_69;
          goto LABEL_76;
        }
      }

      if (v25)
        v55 = v21;
      else
        v55 = 1;
      if ((v55 & 1) != 0
        || (v56 = objc_msgSend(v74, "gridRangeForGridCellIndex:", v73),
            v58 = v57,
            v59 = SBHIconGridRangeRelativeCellIndexForCellIndex(v56, v57, v73, v72),
            !SBHIconGridRangeRelativeColumnForRelativeCellIndex(v56, v58, v59)))
      {
        if (v21)
          v33 = 0;
        else
          v33 = 7;
        goto LABEL_84;
      }
    }
    v33 = 7;
    goto LABEL_84;
  }
  if (v38)
  {
    SBLogIconDragging();
    v44 = objc_claimAutoreleasedReturnValue();
    v46 = v67;
    v45 = v68;
    v47 = v77;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CFEF3000, v44, OS_LOG_TYPE_INFO, "Clearing recipient icon", buf, 2u);
    }

    objc_msgSend(v81, "setRecipientIconView:", 0);
  }
  else
  {
    v46 = v67;
    v45 = v68;
    v47 = v77;
  }
LABEL_85:
  if (v33)
    v60 = 1;
  else
    v60 = v78 == v12;
  if (v60)
    v61 = v33;
  else
    v61 = 7;
  if (v61 == 2)
  {
    v62 = v74;
    v63 = v70;
  }
  else
  {
    objc_msgSend(v12, "iconLocation");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "model");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v70;
    if (-[SBIconDragManager isSnapToGridEnabledForDragWithIdentifier:iconLocation:listModel:placeholderGridSizeClass:](v80, "isSnapToGridEnabledForDragWithIdentifier:iconLocation:listModel:placeholderGridSizeClass:", v45, v64, v65, v70))
    {
      v61 = 7;
    }

    v62 = v74;
  }

  return v61;
}

- (unint64_t)placeholderGridCellIndexForDragPlacement:(int64_t)a3 onGridCellIndex:(unint64_t)a4 icon:(id)a5 inListView:(id)a6 forDragWithIdentifier:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  NSObject *v19;
  SBIcon *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  int v36;
  id v37;
  uint64_t v38;
  void *v39;
  _BYTE buf[22];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dragPlaceholder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "effectiveGridCellIndex");
  v17 = v16;
  objc_msgSend(v14, "dragPlaceholderGridSizeClass");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v37 = v12;
    objc_msgSend(v13, "model");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "gridCellInfo");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v13, "gridSizeForCurrentOrientation");
    v38 = objc_msgSend(v13, "gridCellInfoOptions");
    if (v18)
    {
      v20 = objc_alloc_init(SBIcon);
    }
    else
    {
      v35 = v15;
      objc_msgSend(v14, "draggedIcons");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "gridSizeClass");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_alloc_init(SBIcon);
      if (!v18)
      {
        v15 = v35;
LABEL_9:
        if (-[NSObject isValidGridCellIndex:options:](v19, "isValidGridCellIndex:options:", a4, v38))
          v17 = -[NSObject bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:](v19, "bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:", v20, a4, v39);
        if (v17 == 0x7FFFFFFFFFFFFFFFLL)
          v23 = v16;
        else
          v23 = v17;
        if (a3 == 6)
        {
          SBLogIconDragging();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v37;
            _os_log_impl(&dword_1CFEF3000, v27, OS_LOG_TYPE_INFO, "moving placeholder below %@", buf, 0xCu);
          }

          *(_QWORD *)buf = v23;
          *(_QWORD *)&buf[8] = 65537;
          v25 = v36;
          v26 = 0;
        }
        else
        {
          if (a3 != 3)
          {
LABEL_23:
            v17 = 0x7FFFFFFFFFFFFFFFLL;
            if (v23 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v28 = objc_msgSend(v13, "iconGridSizeForClass:", v18);
              if ((-[NSObject isValidGridRange:options:](v19, "isValidGridRange:options:", v23, v28, v38) & 1) != 0)
              {
                v17 = v23;
              }
              else
              {
                v29 = SBHIconGridRangeFitInsideIconGridRange(0, v36, v23, v28, v36);
                if (v29 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  SBLogIconDragging();
                  v30 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                  {
                    SBHStringForIconGridRange(v23, v28);
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    SBHStringForIconGridSize(-[NSObject gridSize](v19, "gridSize"));
                    v32 = v15;
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    *(_QWORD *)&buf[4] = v31;
                    *(_WORD *)&buf[12] = 2114;
                    *(_QWORD *)&buf[14] = v33;
                    _os_log_impl(&dword_1CFEF3000, v30, OS_LOG_TYPE_INFO, "not moving placeholder to grid range %{public}@ because it doesn't fit in %{public}@", buf, 0x16u);

                    v15 = v32;
                  }

                  v17 = 0x7FFFFFFFFFFFFFFFLL;
                }
                else
                {
                  v17 = -[NSObject bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:](v19, "bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:", v20, v29, v39);
                }
              }
            }

            v12 = v37;
            goto LABEL_33;
          }
          SBLogIconDragging();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v37;
            _os_log_impl(&dword_1CFEF3000, v24, OS_LOG_TYPE_INFO, "moving placeholder after %@", buf, 0xCu);
          }

          *(_QWORD *)buf = v23;
          *(_QWORD *)&buf[8] = 65537;
          v25 = v36;
          v26 = 3;
        }
        SBHIconGridRangeOffset(buf, v26, 1, v25);
        v23 = *(_QWORD *)buf;
        goto LABEL_23;
      }
      v15 = v35;
    }
    -[SBIcon setGridSizeClass:](v20, "setGridSizeClass:", v18);
    goto LABEL_9;
  }
  SBLogIconDragging();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CFEF3000, v19, OS_LOG_TYPE_INFO, "not moving placeholder because placeholder movement is unchanged", buf, 2u);
  }
LABEL_33:

  return v17;
}

- (BOOL)movePlaceholderForDraggedIcons:(id)a3 toGridCellIndex:(unint64_t)a4 inListView:(id)a5 forDragWithIdentifier:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  unint64_t v36;
  __CFString *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  NSObject *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  uint8_t buf[4];
  unint64_t v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v10 = a5;
  v11 = a6;
  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dragPlaceholder");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dragPlaceholderGridSizeClass");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v12;
  objc_msgSend(v12, "dragPlaceholderListView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "model");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iconLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupRoot"), v17);
  if (-[SBIconDragManager shouldDisallowBumpingIconsFromCurrentList](self, "shouldDisallowBumpingIconsFromCurrentList"))
    v18 |= 8uLL;
  v51 = v17;
  v52 = v11;
  v53 = (void *)v16;
  v19 = v16;
  v20 = (void *)v13;
  if (-[SBIconDragManager isSnapToGridEnabledForDragWithIdentifier:iconLocation:listModel:placeholderGridSizeClass:](self, "isSnapToGridEnabledForDragWithIdentifier:iconLocation:listModel:placeholderGridSizeClass:", v11, v17, v19, v13))
  {
    v18 |= 0x14uLL;
  }
  if (-[SBIconDragManager prioritizesDirectIconPlacement](self, "prioritizesDirectIconPlacement"))
    v21 = v18 | 2;
  else
    v21 = v18;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    SBLogIconDragging();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CFEF3000, v22, OS_LOG_TYPE_INFO, "not moving placeholder because no new grid cell index could be found", buf, 2u);
    }

    v23 = 0;
    v24 = v54;
    v25 = v11;
    v26 = v10;
    v27 = v14;
    v28 = v49;
    goto LABEL_37;
  }
  v29 = a4;
  v48 = v15;
  v30 = v15 == v10;
  v26 = v10;
  v27 = v14;
  if (v30)
  {
    objc_msgSend(v14, "dragPlaceholder");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      v28 = v49;
      objc_msgSend(v49, "setGridCellIndex:", a4);
      v23 = 1;
      v24 = v54;
      v25 = v52;
      goto LABEL_37;
    }
  }
  objc_msgSend(v14, "resetDragPlaceholder");

  v25 = v52;
  if (objc_msgSend(v26, "allowsAddingIconCount:", 1))
  {
    v24 = v54;
    objc_msgSend(v54, "bs_compactMap:", &__block_literal_global_336);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "componentsJoinedByString:", CFSTR(","));
    v31 = objc_claimAutoreleasedReturnValue();
    if (v31)
      v32 = (const __CFString *)v31;
    else
      v32 = CFSTR("drag");
    if (objc_msgSend(v54, "count") == 1)
    {
      objc_msgSend(v54, "firstObject");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        v34 = (void *)v33;
        if (-[SBIconDragManager doesIconRepresentRealIconPosition:dragIdentifier:](self, "doesIconRepresentRealIconPosition:dragIdentifier:", v33, v52))
        {
          v50 = v34;
          if (objc_msgSend(v53, "directlyContainsIcon:", v34))
          {
            SBLogIconDragging();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v56 = (unint64_t)v50;
              _os_log_impl(&dword_1CFEF3000, v35, OS_LOG_TYPE_INFO, "creating new drag placeholder representing icon %@", buf, 0xCu);
            }

            v36 = v29;
            v37 = (__CFString *)v32;
            objc_msgSend(v26, "addPlaceholderAtGridCellIndex:representingIcon:reason:options:", v36, v50, v32, v21);
            v38 = objc_claimAutoreleasedReturnValue();
LABEL_34:
            v28 = (void *)v38;
            SBLogIconDragging();
            v45 = objc_claimAutoreleasedReturnValue();
            v15 = v48;
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v56 = (unint64_t)v28;
              _os_log_impl(&dword_1CFEF3000, v45, OS_LOG_TYPE_INFO, "created new drag placeholder %@", buf, 0xCu);
            }

            objc_msgSend(v27, "setDragPlaceholder:", v28);
            objc_msgSend(v27, "setDragPlaceholderListView:", v26);
            objc_msgSend(v27, "setDragPlaceholderGridSizeClass:", v20);

            v23 = 1;
            goto LABEL_37;
          }
LABEL_31:
          SBLogIconDragging();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            -[SBIconDragManager gridSizeClassDomain](self, "gridSizeClassDomain");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "descriptionForGridSizeClass:", v20);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v56 = v29;
            v57 = 2114;
            v58 = v43;
            _os_log_impl(&dword_1CFEF3000, v41, OS_LOG_TYPE_INFO, "creating new drag placeholder at grid cell index %lu size class '%{public}@'", buf, 0x16u);

            v24 = v54;
          }

          v44 = v29;
          v37 = (__CFString *)v32;
          objc_msgSend(v26, "addPlaceholderAtGridCellIndex:gridSizeClass:reason:options:", v44, v20, v32, v21);
          v38 = objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        }

      }
    }
    v50 = 0;
    goto LABEL_31;
  }
  SBLogIconDragging();
  v39 = objc_claimAutoreleasedReturnValue();
  v24 = v54;
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CFEF3000, v39, OS_LOG_TYPE_INFO, "not creating placeholder because list view cannot add another icon", buf, 2u);
  }

  v23 = 0;
  v28 = 0;
LABEL_37:
  objc_msgSend(v28, "setOptions:", v21);

  return v23;
}

uint64_t __101__SBIconDragManager_movePlaceholderForDraggedIcons_toGridCellIndex_inListView_forDragWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

- (void)iconDropSessionDidExit:(id)a3 fromIconListView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBIconDragManager uniqueIdentifierForIconDropSession:](self, "uniqueIdentifierForIconDropSession:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIconDragging();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v28 = v8;
    v29 = 2048;
    v30 = v7;
    _os_log_impl(&dword_1CFEF3000, v9, OS_LOG_TYPE_INFO, "drop session did exit: %{public}@, icon list view: %p", buf, 0x16u);
  }

  -[SBIconDragManager stopTrackingDragLocationForEditingForDragWithIdentifier:](self, "stopTrackingDragLocationForEditingForDragWithIdentifier:", v8);
  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dragPlaceholderGridSizeClass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SBIconDragManager _animationTypeForGridSizeClass:](self, "_animationTypeForGridSizeClass:", v11);
  objc_msgSend(v10, "currentEnteredIconListView");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v7)
  {
    -[SBIconDragManager _updateDragPreviewIconViewForDropSession:inIconListView:](self, "_updateDragPreviewIconViewForDropSession:inIconListView:", v6, v7);
    objc_msgSend(v10, "setCurrentEnteredIconListView:", 0);
    objc_msgSend(v10, "setCurrentEnteredIconListViewLastLocation:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    objc_msgSend(v10, "setCurrentEnteredIconListViewDragDistance:", 0.0);
  }
  objc_msgSend(v10, "dragPlaceholderListView");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 == v7)
    objc_msgSend(v10, "resetDragPlaceholder");
  if (!-[SBIconDragManager isEditing](self, "isEditing"))
    objc_msgSend(v10, "resetDraggedIconsHiddenAssertion");
  objc_msgSend(v10, "resetLastUserInteractionDate");
  objc_msgSend(v10, "setRecipientIconView:", 0);
  objc_msgSend(v10, "grabbedIconViews");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0DC3F10];
    -[SBIconDragManager defaultIconLayoutAnimationDuration](self, "defaultIconLayoutAnimationDuration");
    v19 = v18;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __61__SBIconDragManager_iconDropSessionDidExit_fromIconListView___block_invoke;
    v25[3] = &unk_1E8D84C50;
    v26 = v7;
    objc_msgSend(v17, "animateWithDuration:animations:", v25, v19);

  }
  objc_msgSend(v10, "primaryIconView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "draggingStartLocation");

  if (v21 == 10)
    -[SBIconDragManager _invalidateAutoScrollAssistant](self, "_invalidateAutoScrollAssistant");
  -[SBIconDragManager delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v22, "iconDragManager:iconDropSession:didExitIconListView:", self, v6, v7);
  objc_msgSend(v7, "iconLocation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupTodayView"), v23);

  objc_msgSend(v7, "layoutIconsIfNeededWithAnimationType:options:", v12, v24);
}

uint64_t __61__SBIconDragManager_iconDropSessionDidExit_fromIconListView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateIconViewsUsingBlock:", &__block_literal_global_340);
}

uint64_t __61__SBIconDragManager_iconDropSessionDidExit_fromIconListView___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGrabbed:", 0);
}

- (void)performIconDrop:(id)a3 inIconListView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  int64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  NSObject *v45;
  uint8_t v46[128];
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBIconDragManager uniqueIdentifierForIconDropSession:](self, "uniqueIdentifierForIconDropSession:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIconDragging();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v48 = (uint64_t)v8;
    v49 = 2048;
    v50 = v7;
    _os_log_impl(&dword_1CFEF3000, v9, OS_LOG_TYPE_INFO, "perform icon drop with identifier: %{public}@, icon list view: %p", buf, 0x16u);
  }

  if (-[SBIconDragManager isEditingAllowedForListView:](self, "isEditingAllowedForListView:", v7))
  {
    -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    -[SBIconDragManager draggedIconsForDragDropSession:](self, "draggedIconsForDragDropSession:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconDragManager rootFolder](self, "rootFolder");
    v12 = objc_claimAutoreleasedReturnValue();
    -[SBIconDragManager rootListModel](self, "rootListModel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v12 | v13)
    {
      v35 = v12;
      -[SBIconDragManager delegate](self, "delegate");
      v15 = objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[NSObject iconDragManager:willPerformIconDrop:withIcons:inIconListView:](v15, "iconDragManager:willPerformIconDrop:withIcons:inIconListView:", self, v6, v11, v7);
      -[NSObject dragPlaceholderGridSizeClass](v10, "dragPlaceholderGridSizeClass");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconDragManager dragPlaceholderGridPathForDragWithIdentifier:](self, "dragPlaceholderGridPathForDragWithIdentifier:", v8);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject resetDragPlaceholder](v10, "resetDragPlaceholder");
      -[NSObject resetDraggedIconsHiddenAssertion](v10, "resetDraggedIconsHiddenAssertion");
      -[SBIconDragManager startForbiddingAccessoryUpdatesInFoldersInIconListView:](self, "startForbiddingAccessoryUpdatesInFoldersInIconListView:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconDragManager duplicateIconsIfNecessary:forDropSession:](self, "duplicateIconsIfNecessary:forDropSession:", v11, v6);
      v39 = objc_claimAutoreleasedReturnValue();

      SBLogIconDragging();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v48 = v39;
        v49 = 2114;
        v50 = v36;
        _os_log_impl(&dword_1CFEF3000, v17, OS_LOG_TYPE_INFO, "dropped icons: %@, placeholder path: %{public}@", buf, 0x16u);
      }

      if (-[SBIconDragManager isUndoEnabled](self, "isUndoEnabled"))
      {
        objc_msgSend(v7, "undoManager");
        v18 = objc_claimAutoreleasedReturnValue();
        -[SBIconDragManager undoProvider](self, "undoProvider");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "prepareForUndo");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = 0;
        v37 = 0;
      }
      -[SBIconDragManager beginModifyingRootFolder](self, "beginModifyingRootFolder");
      v20 = -[SBIconDragManager performIconDropOnRecipientIconIfPossibleWithDraggedIcons:inIconListView:dropSession:](self, "performIconDropOnRecipientIconIfPossibleWithDraggedIcons:inIconListView:dropSession:", v39, v7, v6)|| -[SBIconDragManager performIconDropInParentFolderIfPossibleWithDraggedIcons:inIconListView:dropSession:](self, "performIconDropInParentFolderIfPossibleWithDraggedIcons:inIconListView:dropSession:", v39, v7, v6)|| -[SBIconDragManager performIconDropInDestinationListIfPossibleWithDraggedIcons:inIconListView:placeholderGridPath:placeholderGridSizeClass:dropSession:](self, "performIconDropInDestinationListIfPossibleWithDraggedIcons:inIconListView:placeholderGridPath:placeholderGridSizeClass:dropSession:", v39, v7, v36, v38,
              v6);
      v33 = v15;
      v34 = v13;
      -[SBIconDragManager endModifyingRootFolder](self, "endModifyingRootFolder");
      if (v20 && v18 && v37)
        -[SBIconDragManager registerUndoWithUndoManager:preparation:draggedIcons:](self, "registerUndoWithUndoManager:preparation:draggedIcons:", v18, v37, v39);
      v32 = (void *)v18;
      -[NSObject droppedIcons](v10, "droppedIcons");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v31, "count");
      v21 = -[SBIconDragManager _animationTypeForGridSizeClass:inIconListView:draggedIconCount:](self, "_animationTypeForGridSizeClass:inIconListView:draggedIconCount:", v38, v7);
      if (v21 != 3)
      {
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __52__SBIconDragManager_performIconDrop_inIconListView___block_invoke;
        v44[3] = &unk_1E8D85CC0;
        v45 = v10;
        -[NSObject enumerateDestinationIconViewsUsingBlock:](v45, "enumerateDestinationIconViewsUsingBlock:", v44);

      }
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v22 = v16;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v41 != v25)
              objc_enumerationMutation(v22);
            objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "invalidate");
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
        }
        while (v24);
      }

      SBLogIconDragging();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CFEF3000, v27, OS_LOG_TYPE_INFO, "laying out icon lists now", buf, 2u);
      }

      -[SBIconDragManager layoutIconListsWithAnimationType:forceRelayout:](self, "layoutIconListsWithAnimationType:forceRelayout:", v21, 0);
      v13 = v34;
      if (v30)
      {
        objc_msgSend(v31, "firstObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIconDragManager scrollToIconListContainingIcon:animated:](self, "scrollToIconListContainingIcon:animated:", v28, 1);

      }
      -[NSObject setPerformedIconDrop:](v10, "setPerformedIconDrop:", 1);
      -[NSObject addMessageExpectationNamed:](v10, "addMessageExpectationNamed:", CFSTR("concludeDrop"));
      -[NSObject resetLastUserInteractionDate](v10, "resetLastUserInteractionDate");
      -[SBIconDragManager changeStateOfDragWithIdentifier:toState:](self, "changeStateOfDragWithIdentifier:toState:", v8, 5);
      SBLogIconDragging();
      v29 = objc_claimAutoreleasedReturnValue();
      v14 = v33;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CFEF3000, v29, OS_LOG_TYPE_INFO, "will wait for conclude drag", buf, 2u);
      }

      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[NSObject iconDragManager:didPerformIconDrop:withIcons:inIconListView:](v33, "iconDragManager:didPerformIconDrop:withIcons:inIconListView:", self, v6, v31, v7);

      v12 = v35;
      v11 = (void *)v39;
    }
    else
    {
      SBLogIconDragging();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SBIconDragManager performIconDrop:inIconListView:].cold.1(v14);
    }

  }
  else
  {
    SBLogIconDragging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_INFO, "bailing on icon drop because editing is not allowed", buf, 2u);
    }
  }

}

void __52__SBIconDragManager_performIconDrop_inIconListView___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "markAsDropping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && v3)
    objc_msgSend(*(id *)(a1 + 32), "addIconViewDroppingAssertion:forIconView:", v3, v4);

}

- (id)startForbiddingAccessoryUpdatesInFoldersInIconListView:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__SBIconDragManager_startForbiddingAccessoryUpdatesInFoldersInIconListView___block_invoke;
  v11[3] = &unk_1E8D86168;
  v12 = v3;
  v6 = v4;
  v13 = v6;
  v7 = v3;
  objc_msgSend(v5, "enumerateFolderIconsUsingBlock:", v11);

  v8 = v13;
  v9 = v6;

  return v9;
}

void __76__SBIconDragManager_startForbiddingAccessoryUpdatesInFoldersInIconListView___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "displayedIconViewForIcon:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startForbiddingAccessoryUpdatesWithReason:animated:", CFSTR("drop"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (id)duplicateIconsIfNecessary:(id)a3 forDropSession:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SBIconDragManager iconDragContextForDropSession:](self, "iconDragContextForDropSession:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "duplicatesSourceIcons") & 1) == 0)
  {
    v9 = v6;
    goto LABEL_5;
  }
  objc_msgSend(v7, "createdApplicationIcons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "draggedIcons");
    v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v30 = v9;
    goto LABEL_6;
  }
  v28 = v7;
  -[SBIconDragManager model](self, "model");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager rootFolder](self, "rootFolder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v26 = v6;
  obj = v6;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v11, "indexPathForIcon:includingPlaceholders:", v16, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isApplicationIcon"))
          v18 = v17 == 0;
        else
          v18 = 1;
        if (!v18)
        {
          objc_msgSend(v16, "applicationBundleID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addAdditionalIconMatchingIcon:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          SBLogIconDragging();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
          if (v20)
          {
            if (v22)
            {
              *(_DWORD *)buf = 138543362;
              v37 = v19;
              _os_log_impl(&dword_1CFEF3000, v21, OS_LOG_TYPE_DEFAULT, "adding additional matching icon for '%{public}@'", buf, 0xCu);
            }

            objc_msgSend(v30, "addObject:", v20);
            objc_msgSend(v16, "uniqueIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setAdditionalMatchingIcon:forDroppedIconIdentifier:", v20, v23);
            objc_msgSend(v27, "addObject:", v20);
            objc_msgSend(v20, "uniqueIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "appDragLocalContextWithIconIdentifier:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setDroppedIconIdentifier:", v24);

          }
          else
          {
            if (v22)
            {
              *(_DWORD *)buf = 138543362;
              v37 = v19;
              _os_log_impl(&dword_1CFEF3000, v21, OS_LOG_TYPE_DEFAULT, "could not add additional matching icon for '%{public}@'", buf, 0xCu);
            }

            objc_msgSend(v30, "addObject:", v16);
          }

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v13);
  }

  v7 = v28;
  objc_msgSend(v28, "setCreatedApplicationIcons:", v27);

  v6 = v26;
LABEL_6:

  return v30;
}

- (BOOL)performIconDropOnRecipientIconIfPossibleWithDraggedIcons:(id)a3 inIconListView:(id)a4 dropSession:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  NSObject *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  id v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  id v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  void *v69;
  uint8_t v70[128];
  uint8_t buf[4];
  id v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[SBIconDragManager iconDragContextForDropSession:](self, "iconDragContextForDropSession:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recipientIconView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "icon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    goto LABEL_5;
  if (!objc_msgSend(v12, "isFolderIcon")
    || (objc_msgSend(v13, "folder"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "isFull"),
        v14,
        !v15))
  {
    -[SBIconDragManager model](self, "model");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v11;
    if (objc_msgSend(v13, "isFolderIcon"))
    {
      v18 = v13;
      v19 = v8;
    }
    else
    {
      if (!objc_msgSend(v13, "isLeafIcon"))
      {
        v36 = 0;
        v18 = 0;
        v21 = 0;
        v16 = 0;
LABEL_53:

        v11 = v55;
        goto LABEL_54;
      }
      if (objc_msgSend(v13, "isWidgetIcon")
        && -[SBIconDragManager createsStacksFromWidgets](self, "createsStacksFromWidgets"))
      {
        v50 = v8;
        v51 = v9;
        v20 = v8;
        v21 = v13;
        objc_msgSend(v21, "addDataSourcesFromWidgetIcons:", v20);
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v22 = v20;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v65;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v65 != v25)
                objc_enumerationMutation(v22);
              objc_msgSend(v17, "removeIcon:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i), v50);
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
          }
          while (v24);
        }

        SBLogIconDragging();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v72 = v21;
          _os_log_impl(&dword_1CFEF3000, v27, OS_LOG_TYPE_INFO, "created new stack for drop: %@", buf, 0xCu);
        }

        if (!v22)
        {
          v36 = 0;
          v18 = 0;
          v16 = 0;
          v8 = v50;
          v9 = v51;
          goto LABEL_53;
        }
        objc_msgSend(v51, "iconViewForIcon:", v21);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v28)
        {
          v18 = 0;
          v8 = v50;
          v9 = v51;
          goto LABEL_51;
        }
        objc_msgSend(v51, "pauseLayoutForIconView:forReason:", v28, CFSTR("PauseLayoutForDropAnimation"));
        v53 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setDestinationStackIconViewPauseLayoutAssertion:");
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v29 = v22;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v61;
          do
          {
            for (j = 0; j != v31; ++j)
            {
              if (*(_QWORD *)v61 != v32)
                objc_enumerationMutation(v29);
              objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "uniqueIdentifier", v50);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setDestinationStackIconView:forIconWithIdentifier:", v28, v34);

            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
          }
          while (v31);
        }

        v18 = 0;
        v8 = v50;
        v9 = v51;
        v35 = v53;
LABEL_50:

LABEL_51:
        v16 = 1;
LABEL_52:
        v36 = v8;
        goto LABEL_53;
      }
      objc_msgSend(v8, "firstObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconDragManager createNewFolderFromRecipientIcon:grabbedIcon:](self, "createNewFolderFromRecipientIcon:grabbedIcon:", v13, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "icon");
      v39 = objc_claimAutoreleasedReturnValue();
      SBLogIconDragging();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v72 = v38;
        _os_log_impl(&dword_1CFEF3000, v40, OS_LOG_TYPE_INFO, "created new folder for drop: %@", buf, 0xCu);
      }

      v18 = (id)v39;
    }
    v16 = 0;
    v21 = 0;
    if (!v8 || !v18)
      goto LABEL_52;
    v54 = v18;
    objc_msgSend(v9, "iconViewForIcon:", v18);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isLeafIcon"))
    {
      v69 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconDragManager addIcons:intoFolderIcon:openFolderOnFinish:](self, "addIcons:intoFolderIcon:openFolderOnFinish:", v41, v54, 0);

      objc_msgSend(v28, "layoutIfNeeded");
    }
    if (v28)
    {
      v49 = v8;
      v52 = v9;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v42 = v8;
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v57;
        do
        {
          for (k = 0; k != v44; ++k)
          {
            if (*(_QWORD *)v57 != v45)
              objc_enumerationMutation(v42);
            objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * k), "uniqueIdentifier", v49);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setDestinationFolderIconView:forIconWithIdentifier:", v28, v47);

          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
        }
        while (v44);
      }

      v8 = v49;
      v9 = v52;
    }
    v18 = v54;
    -[SBIconDragManager addIcons:intoFolderIcon:openFolderOnFinish:](self, "addIcons:intoFolderIcon:openFolderOnFinish:", v8, v54, 0, v49);
    SBLogIconDragging();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v72 = v54;
      _os_log_impl(&dword_1CFEF3000, v35, OS_LOG_TYPE_INFO, "adding dropped icons into folder icon %@", buf, 0xCu);
    }
    v21 = 0;
    goto LABEL_50;
  }
  objc_msgSend(v10, "setRecipientIconView:", 0);
LABEL_5:
  v16 = 0;
LABEL_54:

  return v16;
}

- (BOOL)performIconDropInParentFolderIfPossibleWithDraggedIcons:(id)a3 inIconListView:(id)a4 dropSession:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  unint64_t v22;
  id v23;
  id v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id obj;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[SBIconDragManager uniqueIdentifierForIconDropSession:](self, "uniqueIdentifierForIconDropSession:", a5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("SBIconLocationFolder"))
    && (objc_msgSend(v10, "wasLastUpdateContainedInDestinationIconListView") & 1) == 0)
  {
    objc_msgSend(v9, "model");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "folder");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "parentFolder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "icon");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "indexOfListContainingIcon:");
    v30 = v10;
    v31 = v9;
    v29 = v11;
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v13, "listAtIndex:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v32 = v8;
    obj = v8;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v36 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v20, "gridSizeClass");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[SBIconDragManager folderMutationOptionsForInsertingIcon:intoList:isSnapToGridEnabled:](self, "folderMutationOptionsForInsertingIcon:intoList:isSnapToGridEnabled:", v20, v15, -[SBIconDragManager isSnapToGridEnabledForDragWithIdentifier:iconLocation:listModel:placeholderGridSizeClass:](self, "isSnapToGridEnabledForDragWithIdentifier:iconLocation:listModel:placeholderGridSizeClass:", v34, CFSTR("SBIconLocationRoot"), v15, v21));
          if (v14 == 0x7FFFFFFFFFFFFFFFLL)
            v23 = (id)objc_msgSend(v13, "addIcon:options:", v20, v22);
          else
            v24 = (id)objc_msgSend(v13, "addIcon:toListAtIndex:options:", v20, v14, v22);

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v17);
    }

    v9 = v31;
    -[SBIconDragManager closeFolderControllerContainingListView:](self, "closeFolderControllerContainingListView:", v31);

    v12 = 1;
    v8 = v32;
    v11 = v29;
    v10 = v30;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)performIconDropInDestinationListIfPossibleWithDraggedIcons:(id)a3 inIconListView:(id)a4 placeholderGridPath:(id)a5 placeholderGridSizeClass:(id)a6 dropSession:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  int v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  SBIconDragManager *v42;
  void *v43;
  NSObject *v44;
  id v45;
  int v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  SBHIconGridPath *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  SBIconDragManager *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  void *v71;
  void *v72;
  id v73;
  id v74;
  uint64_t v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  BOOL v81;
  SBHIconGridPath *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  unsigned int v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  id obj;
  _QWORD v98[4];
  id v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  _BYTE v114[128];
  uint8_t v115[128];
  uint8_t buf[4];
  id v117;
  __int16 v118;
  void *v119;
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[SBIconDragManager uniqueIdentifierForIconDropSession:](self, "uniqueIdentifierForIconDropSession:", a7);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "model");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "folder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager rootFolder](self, "rootFolder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager rootListModel](self, "rootListModel");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = -[SBIconDragManager listGridCellInfoOptions](self, "listGridCellInfoOptions");
  v88 = objc_msgSend(v18, "isCancelable");
  v93 = v18;
  objc_msgSend(v18, "setCancelable:", 0);
  v20 = v17;
  v90 = v15;
  v91 = v13;
  if (v14)
  {
    v21 = objc_msgSend(v13, "iconGridSizeForClass:", v15);
    if (v19)
    {
      objc_msgSend(v19, "listAtGridPath:", v14);
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = v92;
    }
    v25 = v22;
    v26 = objc_msgSend(v14, "gridCellIndex");
    v27 = objc_msgSend(v14, "gridCellInfoOptions");
    SBLogIconDragging();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v117 = v14;
      v118 = 2112;
      v119 = v25;
      _os_log_impl(&dword_1CFEF3000, v28, OS_LOG_TYPE_INFO, "list model for placeholder at path %{public}@: %@", buf, 0x16u);
    }

    if ((objc_msgSend(v25, "isValidGridRange:options:", v26, v21, v27) & 1) == 0)
    {
      SBLogIconDragging();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        SBHStringForIconGridRange(v26, v21);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        SBHStringForIconGridSize(objc_msgSend(v25, "gridSize"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v117 = v30;
        v118 = 2114;
        v119 = v31;
        _os_log_impl(&dword_1CFEF3000, v29, OS_LOG_TYPE_INFO, "discarding placeholder path because the targeted grid range is not valid. %{public}@ vs. %{public}@", buf, 0x16u);

      }
      v14 = 0;
    }
    if (v25 == v20)
      v23 = objc_msgSend(v20, "directlyContainsIcons:", v12);
    else
      v23 = 0;
    v24 = v14;

  }
  else
  {
    v23 = objc_msgSend(v17, "directlyContainsIcons:", v12);
    v24 = 0;
  }
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v32 = v12;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v109, v115, 16);
  obj = v32;
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v110;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v110 != v35)
          objc_enumerationMutation(obj);
        v37 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * i);
        objc_msgSend(v19, "indexPathForIcon:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
          objc_msgSend(v16, "setInitialIndexPath:forIcon:", v38, v37);

      }
      v32 = obj;
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v115, 16);
    }
    while (v34);
  }

  v39 = v20;
  if ((objc_msgSend(v93, "canAddIcons:startingAtList:", v32, v20) & 1) != 0)
  {
    v40 = v90;
    v41 = v24;
    v42 = self;
    v43 = v92;
  }
  else
  {
    v40 = v90;
    v41 = v24;
    v43 = v92;
    if (((v23 | objc_msgSend(v19, "canAddIcons:", v32) ^ 1) & 1) != 0)
    {
      v42 = self;
    }
    else
    {
      SBLogIconDragging();
      v44 = objc_claimAutoreleasedReturnValue();
      v42 = self;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v117 = v93;
        _os_log_impl(&dword_1CFEF3000, v44, OS_LOG_TYPE_INFO, "discarding drop destination folder '%@' because it can't accommodate all the dragged icons", buf, 0xCu);
      }

      v45 = v19;
      v39 = 0;
      v41 = 0;
      v93 = v45;
    }
  }
  v46 = objc_msgSend(v93, "canAddIcons:startingAtList:", obj, v39);
  v47 = v91;
  if ((v23 | v46 | objc_msgSend(v43, "isAllowedToContainIcons:", obj)) == 1)
  {
    objc_msgSend(v91, "iconLocation");
    v48 = objc_claimAutoreleasedReturnValue();
    v84 = (void *)v48;
    if (objc_msgSend(v16, "isSnapToGridAllowed"))
      -[SBIconDragManager canSnapToGridInIconLocation:](v42, "canSnapToGridInIconLocation:", v48);
    objc_msgSend(obj, "firstObject");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = -[SBIconDragManager folderMutationOptionsForInsertingIcon:intoList:isSnapToGridEnabled:](v42, "folderMutationOptionsForInsertingIcon:intoList:isSnapToGridEnabled:");
    v50 = +[SBFolder listModelMutationOptionsForFolderMutationOptions:](SBFolder, "listModelMutationOptionsForFolderMutationOptions:", v49);
    v51 = v41;
    v87 = v39;
    if (v51)
      goto LABEL_43;
    objc_msgSend(v86, "gridSizeClass");
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = v39;
    v54 = (void *)v52;
    v55 = objc_msgSend(v53, "firstFreeGridCellIndexOfRangeOfSizeClass:gridCellInfoOptions:", v52, v94);
    if (v55 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v56 = v55;
      if (v19)
      {
        objc_msgSend(v19, "indexPathForList:", v87);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "gridPathWithListAtIndexPath:gridCellIndex:listGridCellInfoOptions:", v57, v56, v94);
        v51 = (SBHIconGridPath *)objc_claimAutoreleasedReturnValue();

        if (!v51)
          goto LABEL_41;
LABEL_42:

        goto LABEL_43;
      }
      v51 = -[SBHIconGridPath initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:]([SBHIconGridPath alloc], "initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:", 0, &stru_1E8D8E958, v55, v94);
      if (v51)
        goto LABEL_42;
    }
LABEL_41:
    objc_msgSend(v93, "gridPathForFirstFreeSlotOfRangeOfSizeClass:startingAtList:listGridCellInfoOptions:", v54, v87, v94);
    v51 = (SBHIconGridPath *)objc_claimAutoreleasedReturnValue();
    if (v51)
      goto LABEL_42;
    objc_msgSend(v19, "gridPathForFirstFreeSlotOfRangeOfSizeClass:startingAtList:listGridCellInfoOptions:", v54, v87, v94);
    v51 = (SBHIconGridPath *)objc_claimAutoreleasedReturnValue();

    if (!v51)
      goto LABEL_48;
LABEL_43:
    if (v19)
    {
      objc_msgSend(v19, "insertIcons:atGridPath:options:", obj, v51, v49);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v43)
      {
LABEL_48:
        v83 = v51;
        v85 = v41;
        v107 = 0u;
        v108 = 0u;
        v105 = 0u;
        v106 = 0u;
        v59 = obj;
        v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v105, v114, 16);
        if (!v60)
          goto LABEL_61;
        v61 = v60;
        v62 = *(_QWORD *)v106;
        while (1)
        {
          v63 = 0;
          do
          {
            if (*(_QWORD *)v106 != v62)
              objc_enumerationMutation(v59);
            v64 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * v63);
            if (v19)
            {
              if ((objc_msgSend(v19, "containsIcon:", *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * v63)) & 1) == 0)
                goto LABEL_56;
LABEL_55:
              objc_msgSend(v16, "addDroppedIcon:", v64);
              goto LABEL_56;
            }
            if (objc_msgSend(v43, "directlyContainsIcon:", *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * v63)))
              goto LABEL_55;
LABEL_56:
            ++v63;
          }
          while (v61 != v63);
          v65 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v105, v114, 16);
          v61 = v65;
          if (!v65)
          {
LABEL_61:

            objc_msgSend(v87, "setOverflowSlotCount:", 0);
            objc_msgSend(v16, "droppedIcons");
            v101 = 0u;
            v102 = 0u;
            v103 = 0u;
            v104 = 0u;
            v95 = (id)objc_claimAutoreleasedReturnValue();
            v66 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v101, v113, 16);
            v67 = self;
            if (v66)
            {
              v68 = v66;
              v69 = *(_QWORD *)v102;
              do
              {
                for (j = 0; j != v68; ++j)
                {
                  if (*(_QWORD *)v102 != v69)
                    objc_enumerationMutation(v95);
                  v71 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * j);
                  -[SBIconDragManager iconListViewContainingIcon:](v67, "iconListViewContainingIcon:", v71);
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  v98[0] = MEMORY[0x1E0C809B0];
                  v98[1] = 3221225472;
                  v98[2] = __152__SBIconDragManager_performIconDropInDestinationListIfPossibleWithDraggedIcons_inIconListView_placeholderGridPath_placeholderGridSizeClass_dropSession___block_invoke;
                  v98[3] = &unk_1E8D864F8;
                  v73 = v72;
                  v99 = v73;
                  v74 = v16;
                  v100 = v74;
                  objc_msgSend(v74, "enumerateSourceIconViewsUsingBlock:", v98);
                  objc_msgSend(v73, "clearDraggedIconViews");
                  v75 = objc_msgSend(v74, "hasIconViewBorrowAssertions");
                  if ((_DWORD)v75)
                  {
                    objc_msgSend(v73, "addOverridingLayoutDelegate:reason:", v67, CFSTR("drop animation"));
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v76 = 0;
                  }
                  objc_msgSend(v74, "setWaitingToSetPlaceholderViewController:", v75);
                  objc_msgSend(v73, "iconViewForIcon:", v71);
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v76, "invalidate");
                  objc_msgSend(v74, "setWaitingToSetPlaceholderViewController:", 0);
                  if (v77)
                  {
                    objc_msgSend(v74, "addDestinationIconView:", v77);
                    objc_msgSend(v77, "setDisallowCursorInteraction:", 1);
                  }
                  else
                  {
                    SBLogIconDragging();
                    v78 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
                    {
                      objc_msgSend(v71, "nodeIdentifier");
                      v79 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v117 = v79;
                      _os_log_impl(&dword_1CFEF3000, v78, OS_LOG_TYPE_INFO, "did not find a destination icon view for icon '%@'", buf, 0xCu);

                    }
                  }

                  v67 = self;
                }
                v68 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v101, v113, 16);
              }
              while (v68);
            }

            v40 = v90;
            v47 = v91;
            v41 = v85;
            v39 = v87;
            v43 = v92;
            goto LABEL_77;
          }
        }
      }
      objc_msgSend(v43, "insertIcons:atGridCellIndex:gridCellInfoOptions:mutationOptions:", obj, -[SBHIconGridPath gridCellIndex](v51, "gridCellIndex"), v94, v50);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_48;
  }
LABEL_77:
  objc_msgSend(v93, "setCancelable:", v88);
  objc_msgSend(v16, "droppedIcons");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v80, "count") != 0;

  return v81;
}

void __152__SBIconDragManager_performIconDropInDestinationListIfPossibleWithDraggedIcons_inIconListView_placeholderGridPath_placeholderGridSizeClass_dropSession___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isDisplayingIconView:"))
  {
    objc_msgSend(*(id *)(a1 + 32), "forgetIconView:", v3);
    objc_msgSend(v3, "setHidden:", 1);
    objc_msgSend(*(id *)(a1 + 40), "addDiscardedSourceIconView:", v3);
    objc_msgSend(v3, "setDelegate:", 0);
  }

}

- (void)concludeIconDrop:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  id v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBIconDragManager uniqueIdentifierForIconDropSession:](self, "uniqueIdentifierForIconDropSession:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIconDragging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v5;
    _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_INFO, "conclude icon drop: %{public}@", buf, 0xCu);
  }

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __38__SBIconDragManager_concludeIconDrop___block_invoke;
  v20[3] = &unk_1E8D864F8;
  v20[4] = self;
  v8 = v5;
  v21 = v8;
  objc_msgSend(v6, "enumerateDestinationIconViewsUsingBlock:", v20);
  objc_msgSend(v6, "enumerateSourceIconViewsUsingBlock:", &__block_literal_global_354);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v6, "itemIdentifiers", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v6, "destinationStackIconViewForIconWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "cleanUpAfterDropAnimation");
        objc_msgSend(v14, "setShowsImageAndLabelDuringDrop:", 0);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v11);
  }

  objc_msgSend(v6, "enumerateDestinationIconViewsUsingBlock:", &__block_literal_global_355);
  objc_msgSend(v6, "clearAllDropAssertions");
  objc_msgSend(v6, "removeMessageExpectationNamed:", CFSTR("concludeDrop"));
  -[SBIconDragManager delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v15, "iconDragManager:iconDropSessionDidConclude:", self, v4);
  -[SBIconDragManager _stopTrackingDragIfPossibleWithIdentifier:](self, "_stopTrackingDragIfPossibleWithIdentifier:", v8);

}

void __38__SBIconDragManager_concludeIconDrop___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isTrackingDragOriginatingFromOrDroppingIntoIconView:otherThanDragWithIdentifier:") & 1) == 0)objc_msgSend(v3, "cleanUpAfterDropAnimation");

}

uint64_t __38__SBIconDragManager_concludeIconDrop___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGrabbed:", 0);
}

uint64_t __38__SBIconDragManager_concludeIconDrop___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOverrideCustomIconImageViewController:", 0);
}

- (void)iconDropSessionDidEnd:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBIconDragManager draggedIconIdentifiersForDragDropSession:](self, "draggedIconIdentifiersForDragDropSession:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager uniqueIdentifierForIconDropSession:](self, "uniqueIdentifierForIconDropSession:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogIconDragging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138543618;
    v10 = v6;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_INFO, "icon drop session did end: %{public}@, dragged identifiers: %@", (uint8_t *)&v9, 0x16u);
  }

  -[SBIconDragManager iconDragContextForDragWithIdentifier:](self, "iconDragContextForDragWithIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (-[SBIconDragManager removeDragPlaceholdersForDragWithIdentifier:](self, "removeDragPlaceholdersForDragWithIdentifier:", v6))
    {
      -[SBIconDragManager compactAndLayoutRootIconLists](self, "compactAndLayoutRootIconLists");
    }
    objc_msgSend(v8, "setRecipientIconView:", 0);
    objc_msgSend(v8, "removeMessageExpectationNamed:", CFSTR("dropSessionDidEnd"));
    -[SBIconDragManager _stopTrackingDragIfPossibleWithIdentifier:](self, "_stopTrackingDragIfPossibleWithIdentifier:", v6);
  }

}

- (id)iconListView:(id)a3 iconViewForDroppingIconDragItem:(id)a4 proposedIconView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[SBIconDragManager _iconIdentifierForDragItem:](self, "_iconIdentifierForDragItem:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager iconDragContextForDragItem:](self, "iconDragContextForDragItem:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "additionalMatchingIconForDroppedIconIdentifier:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9;
  if (v13)
  {
    objc_msgSend(v8, "iconViewForIcon:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (void)iconListView:(id)a3 willUseIconView:(id)a4 forDroppingIconDragItem:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  objc_msgSend(v10, "markAsDropping");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && v8)
  {
    -[SBIconDragManager iconDragContextForDragItem:](self, "iconDragContextForDragItem:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addIconViewDroppingAssertion:forIconView:", v8, v10);

  }
}

- (id)iconListView:(id)a3 previewForDroppingIconDragItem:(id)a4 proposedPreview:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, void *);
  void *v41;
  id v42;
  SBIconDragManager *v43;
  id v44;
  id v45;
  id v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SBIconDragManager _iconIdentifierForDragItem:](self, "_iconIdentifierForDragItem:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__2;
  v52 = __Block_byref_object_dispose__2;
  v12 = v10;
  v53 = v12;
  v38 = MEMORY[0x1E0C809B0];
  v39 = 3221225472;
  v40 = __81__SBIconDragManager_iconListView_previewForDroppingIconDragItem_proposedPreview___block_invoke;
  v41 = &unk_1E8D86560;
  v13 = v11;
  v42 = v13;
  v43 = self;
  v14 = v8;
  v44 = v14;
  v47 = &v48;
  v15 = v9;
  v45 = v15;
  v16 = v12;
  v46 = v16;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", &v38);
  if ((id)v49[5] == v16)
  {
    objc_msgSend(v15, "sbh_appDragLocalContext", v38, v39, v40, v41, v42, v43, v44, v45);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17 && (objc_msgSend(v17, "isSourceLocal") & 1) == 0)
    {
      objc_msgSend(v14, "model");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastDirectlyContainedLeafIconWithApplicationBundleIdentifier:", v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(v14, "makeIconView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "configureIconView:forIcon:", v21, v20);
        objc_msgSend(v21, "setEditing:", 0);
        objc_msgSend(v21, "iconImageInfo");
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v28 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
        objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v23, v25, v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setVisiblePath:", v29);

        v30 = objc_alloc(MEMORY[0x1E0DC3B88]);
        objc_msgSend(v14, "centerForIcon:", v20);
        v31 = (void *)objc_msgSend(v30, "initWithContainer:center:", v14);
        v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D88]), "initWithView:parameters:target:", v21, v28, v31);
        v33 = (void *)v49[5];
        v49[5] = v32;

      }
    }

  }
  SBLogIconDragging();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = v49[5];
    *(_DWORD *)buf = 134218754;
    v55 = v14;
    v56 = 2112;
    v57 = v35;
    v58 = 2112;
    v59 = v15;
    v60 = 2112;
    v61 = v13;
    _os_log_impl(&dword_1CFEF3000, v34, OS_LOG_TYPE_INFO, "icon list view: %p, will use preview %@ for drop of item %@ (%@)", buf, 0x2Au);
  }

  v36 = (id)v49[5];
  _Block_object_dispose(&v48, 8);

  return v36;
}

void __81__SBIconDragManager_iconListView_previewForDroppingIconDragItem_proposedPreview___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  CGAffineTransform v24;
  CGAffineTransform v25;

  v3 = a2;
  if (objc_msgSend(v3, "hasItemIdentifier:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "destinationFolderIconViewForIconWithIdentifier:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4
      || (objc_msgSend(v3, "itemIdentifiers"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "count"),
          v7 = objc_msgSend(*(id *)(a1 + 40), "maximumAllowedIconDroppingAnimationsForListView:", *(_QWORD *)(a1 + 48)),
          v5,
          v6 <= v7))
    {
      objc_msgSend(v3, "addDropAnimatingDragItem:", *(_QWORD *)(a1 + 56));
    }
    else
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = 0;

    }
    objc_msgSend(v3, "destinationStackIconViewForIconWithIdentifier:", *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "center");
      v13 = v12;
      v15 = v14;
      objc_msgSend(*(id *)(a1 + 48), "iconContentScale");
      memset(&v25, 0, sizeof(v25));
      CGAffineTransformMakeScale(&v25, v16, v16);
      objc_msgSend(v11, "markAsDropping");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setShowsImageAndLabelDuringDrop:", 1);
      objc_msgSend(v11, "dropContainerView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_alloc(MEMORY[0x1E0DC3770]);
      objc_msgSend(v18, "convertPoint:fromView:", *(_QWORD *)(a1 + 48), v13, v15);
      v24 = v25;
      v20 = (void *)objc_msgSend(v19, "initWithContainer:center:transform:", v18, &v24);
      objc_msgSend(*(id *)(a1 + 64), "retargetedPreviewWithTarget:", v20);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v21;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "set_springboardPlatterStyle:", 1);
      if (v17)
        objc_msgSend(v3, "addIconViewDroppingAssertion:forIconView:", v17, v11);

    }
  }

}

- (void)iconListView:(id)a3 iconDragItem:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  SBIconDragManager *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SBIconDragManager _iconIdentifierForDragItem:](self, "_iconIdentifierForDragItem:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIconDragging();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    v47 = v8;
    v48 = 2112;
    v49 = v9;
    v50 = 2112;
    v51 = v11;
    _os_log_impl(&dword_1CFEF3000, v12, OS_LOG_TYPE_INFO, "icon list view: %p, will animate drop of item %@ (%@)", buf, 0x20u);
  }

  objc_msgSend(v9, "sbh_appDragLocalContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "portaledPreview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  v17 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke;
  v39[3] = &unk_1E8D865B0;
  v18 = v10;
  v40 = v18;
  v41 = self;
  v19 = v9;
  v42 = v19;
  v20 = v11;
  v43 = v20;
  v21 = v16;
  v44 = v21;
  v22 = v8;
  v45 = v22;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v39);
  -[SBIconDragManager _iconViewForDragItem:inIconListView:](self, "_iconViewForDragItem:inIconListView:", v19, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v36[0] = v17;
    v36[1] = 3221225472;
    v36[2] = __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_8;
    v36[3] = &unk_1E8D84EF0;
    v24 = v21;
    v37 = v24;
    v38 = v22;
    objc_msgSend(v18, "addAnimations:", v36);
    v34[0] = v17;
    v34[1] = 3221225472;
    v34[2] = __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_9;
    v34[3] = &unk_1E8D863E0;
    v35 = v24;
    objc_msgSend(v18, "addCompletion:", v34);

  }
  if (v23)
  {
    objc_msgSend(v23, "superview");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bringSubviewToFront:", v23);

    if (-[SBIconDragManager _shouldPerformRippleAnimationForInsertingDragItem:toIconListView:](self, "_shouldPerformRippleAnimationForInsertingDragItem:toIconListView:", v19, v22))
    {
      -[SBIconDragManager delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v23, "icon");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "widgetInsertionRippleIconAnimatorForIcon:iconListView:withReferenceIconView:", v27, v22, 0);
        v30 = v13;
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = MEMORY[0x1E0C809B0];
        objc_msgSend(v28, "animateWithCompletion:", 0);

        v13 = v30;
      }

    }
    v31[0] = v17;
    v31[1] = 3221225472;
    v31[2] = __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_10;
    v31[3] = &unk_1E8D86408;
    v31[4] = self;
    v32 = v23;
    v33 = v19;
    objc_msgSend(v18, "addCompletion:", v31);

  }
  -[SBIconDragManager delegate](self, "delegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v29, "iconDragManager:iconListView:item:willAnimateDropWithAnimator:", self, v22, v19, v18);

}

void __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[5];
  id v37;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_2;
  v36[3] = &unk_1E8D86588;
  v8 = *(void **)(a1 + 32);
  v36[4] = *(_QWORD *)(a1 + 40);
  v9 = v6;
  v37 = v9;
  objc_msgSend(v8, "addCompletion:", v36);
  if (objc_msgSend(v5, "isAnimatingDropForDragItem:", *(_QWORD *)(a1 + 48)))
  {
    objc_msgSend(v5, "destinationFolderIconViewForIconWithIdentifier:", *(_QWORD *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = *(void **)(a1 + 32);
      v34[0] = v7;
      v34[1] = 3221225472;
      v34[2] = __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_3;
      v34[3] = &unk_1E8D84C50;
      v35 = *(id *)(a1 + 64);
      objc_msgSend(v11, "addAnimations:", v34);
      v12 = *(void **)(a1 + 32);
      v31[0] = v7;
      v31[1] = 3221225472;
      v31[2] = __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_4;
      v31[3] = &unk_1E8D86588;
      v32 = v5;
      v33 = v10;
      objc_msgSend(v12, "addCompletion:", v31);

    }
    objc_msgSend(v5, "destinationStackIconViewForIconWithIdentifier:", *(_QWORD *)(a1 + 56));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v5, "destinationStackIconViewPauseLayoutAssertion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "invalidate");

      objc_msgSend(v5, "setDestinationStackIconViewPauseLayoutAssertion:", 0);
      objc_msgSend(*(id *)(a1 + 72), "iconLocation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupTodayView"), v15);

      objc_msgSend(*(id *)(a1 + 72), "layoutIconsIfNeededWithAnimationType:options:", 0, v16);
      v17 = *(void **)(a1 + 32);
      v29[0] = v7;
      v29[1] = 3221225472;
      v29[2] = __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_5;
      v29[3] = &unk_1E8D84C50;
      v30 = *(id *)(a1 + 64);
      objc_msgSend(v17, "addAnimations:", v29);
      v18 = *(void **)(a1 + 32);
      v26[0] = v7;
      v26[1] = 3221225472;
      v26[2] = __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_6;
      v26[3] = &unk_1E8D86588;
      v27 = v13;
      v28 = v5;
      objc_msgSend(v18, "addCompletion:", v26);

    }
    objc_msgSend(*(id *)(a1 + 64), "delayCleanUpForReason:", CFSTR("DropAnimation"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(void **)(a1 + 32);
    v22[0] = v7;
    v22[1] = 3221225472;
    v22[2] = __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_7;
    v22[3] = &unk_1E8D86408;
    v23 = v19;
    v24 = *(id *)(a1 + 64);
    v25 = v5;
    v21 = v19;
    objc_msgSend(v20, "addCompletion:", v22);

  }
}

uint64_t __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "changeStateOfDragWithIdentifier:toState:", *(_QWORD *)(a1 + 40), 6);
}

uint64_t __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setIconAllowsLabelArea:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIconAllowsAccessory:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIconCanShowCloseBox:", 0);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "setIconCanShowResizeHandle:", 0);
  return result;
}

uint64_t __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "clearDropAssertionsForIconView:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "scrollToFirstGapAnimated:", 1);
}

uint64_t __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIconAllowsLabelArea:", 0);
}

uint64_t __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cleanUpAfterDropAnimation");
  objc_msgSend(*(id *)(a1 + 32), "setShowsImageAndLabelDuringDrop:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "clearDropAssertionsForIconView:", *(_QWORD *)(a1 + 32));
}

uint64_t __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_7(id *a1)
{
  char v2;
  id v3;

  objc_msgSend(a1[4], "invalidate");
  v2 = objc_opt_respondsToSelector();
  v3 = a1[5];
  if ((v2 & 1) != 0)
    objc_msgSend(v3, "setIconViewDelegate2:", 0);
  else
    objc_msgSend(v3, "setIconViewDelegate:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a1[5], "setIconViewCustomIconImageViewController:", 0);
  return objc_msgSend(a1[6], "invalidateIconViewBorrowAssertions");
}

uint64_t __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_8(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "iconContentScale");
  objc_msgSend(v2, "setIconContentScale:");
  return objc_msgSend(*(id *)(a1 + 32), "setDragState:", 3);
}

uint64_t __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_9(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "dropDestinationAnimationCompleted");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "setIcon:", 0);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "setIconViewCustomIconImageViewController:", 0);
  return result;
}

void __75__SBIconDragManager_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_10(uint64_t a1)
{
  id v2;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "countOfTrackedDragsOriginatingFromOrDroppingIntoIconView:", *(_QWORD *)(a1 + 40)) <= 1)objc_msgSend(*(id *)(a1 + 40), "cleanUpAfterDropAnimation");
  objc_msgSend(*(id *)(a1 + 32), "iconDragContextForDragItem:", *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearAllDropAssertions");

}

- (int64_t)_animationTypeForGridSizeClass:(id)a3
{
  __CFString *v4;
  void *v5;
  int64_t v6;

  v4 = (__CFString *)a3;
  -[SBIconDragManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = ((objc_opt_respondsToSelector() & 1) == 0
     || objc_msgSend(v5, "shouldNonDefaultGridSizeClassesUseClusterAnimationForIconDragManager:", self))
    && CFSTR("SBHIconGridSizeClassDefault") != v4
    && !-[__CFString isEqualToString:](v4, "isEqualToString:");

  return v6;
}

- (int64_t)_animationTypeForGridSizeClass:(id)a3 inIconListView:(id)a4 draggedIconCount:(unint64_t)a5
{
  id v8;
  int64_t v9;
  unint64_t v10;

  v8 = a4;
  v9 = -[SBIconDragManager _animationTypeForGridSizeClass:](self, "_animationTypeForGridSizeClass:", a3);
  v10 = -[SBIconDragManager maximumAllowedIconDroppingAnimationsForListView:](self, "maximumAllowedIconDroppingAnimationsForListView:", v8);

  if (v10 >= a5)
    return v9;
  else
    return 3;
}

- (BOOL)shouldAllowSpringLoadedInteractionForIconDropSession:(id)a3 onIconView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  int v17;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  int v32;
  int v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v34[0] = *MEMORY[0x1E0DAB500];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "hasItemsConformingToTypeIdentifiers:", v8);

  if (v9 && !-[SBIconDragManager isEditing](self, "isEditing"))
  {
    LOBYTE(v17) = 0;
    goto LABEL_14;
  }
  objc_msgSend(v7, "icon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager iconDragContextForDropSession:](self, "iconDragContextForDropSession:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "gridSizeClass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isWidgetStackIcon")
    && -[SBIconDragManager isTrackingWidgetIconDrags](self, "isTrackingWidgetIconDrags")
    && !-[SBIconDragManager isTrackingWidgetStackIconDrags](self, "isTrackingWidgetStackIconDrags")
    && -[SBIconDragManager createsStacksFromWidgets](self, "createsStacksFromWidgets"))
  {
    objc_msgSend(v11, "draggedIconGridSizeClass");
    v13 = objc_claimAutoreleasedReturnValue();
    if ((void *)v13 == v12)
    {
      LOBYTE(v17) = 1;
      v22 = v12;
      goto LABEL_49;
    }
    v14 = (void *)v13;
    objc_msgSend(v11, "draggedIconGridSizeClass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", v12);

    if ((v16 & 1) != 0)
      goto LABEL_30;
  }
  if ((objc_msgSend(v10, "isPlaceholder") & 1) != 0 || (objc_msgSend(v7, "isGrabbed") & 1) != 0)
    goto LABEL_11;
  if ((v9 & 1) == 0)
  {
    if (objc_msgSend(v10, "isWidgetIcon"))
    {
      objc_msgSend(v10, "activeDataSource");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      SBHContainerBundleIdentifierForDataSource(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        -[SBIconDragManager model](self, "model");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "applicationIconForBundleIdentifier:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
          LOBYTE(v17) = objc_msgSend(v24, "isIconVisible:", v25);
        else
          LOBYTE(v17) = 0;

      }
      else
      {
        LOBYTE(v17) = 0;
      }

      goto LABEL_49;
    }
    if ((objc_msgSend(v10, "isApplicationIcon") & 1) != 0)
    {
LABEL_30:
      LOBYTE(v17) = 1;
      goto LABEL_12;
    }
  }
  objc_msgSend(v7, "location");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupDock"), v19)
    || (objc_msgSend(v10, "isFolderIcon") & 1) != 0
    || -[SBIconDragManager isEditing](self, "isEditing"))
  {

    goto LABEL_20;
  }

  if ((v9 & 1) == 0)
  {
LABEL_20:
    if (objc_msgSend(v10, "isFolderIcon"))
    {
      objc_msgSend(v10, "folder");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isFull");

      if ((v21 & 1) != 0)
        goto LABEL_11;
    }
    if (!-[SBIconDragManager allowsNestedFolders](self, "allowsNestedFolders"))
    {
      if ((objc_msgSend(v11, "hasFolderDraggedIcons") & 1) != 0)
        goto LABEL_11;
      -[SBIconDragManager rootFolder](self, "rootFolder");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "indexPathForIcon:", v10);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        objc_msgSend(v26, "folderContainingIndexPath:relativeIndexPath:", v27, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = 0;
      }
      v33 = objc_msgSend(v28, "isEqual:", v26);

      if (!v33)
        goto LABEL_11;
    }
    -[SBIconDragManager firstHiddenIconIdentifierInDrag:](self, "firstHiddenIconIdentifierInDrag:", v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      goto LABEL_24;
    objc_msgSend(v10, "gridSizeClass");
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29 == CFSTR("SBHIconGridSizeClassDefault"))
    {

    }
    else
    {
      objc_msgSend(v10, "gridSizeClass");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

      if (!v32)
      {
LABEL_24:
        LOBYTE(v17) = 0;
LABEL_49:

        goto LABEL_12;
      }
    }
    v17 = objc_msgSend(v11, "hasNonDefaultSizedDraggedIcons") ^ 1;
    goto LABEL_49;
  }
LABEL_11:
  LOBYTE(v17) = 0;
LABEL_12:

LABEL_14:
  return v17;
}

- (void)performSpringLoadedInteractionForIconDragOnIconView:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSMapTable *iconDrags;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogIconDragging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "performing springload on icon view: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isFolderIcon"))
  {
    -[SBIconDragManager pushExpandedIconView:context:animated:completionHandler:](self, "pushExpandedIconView:context:animated:completionHandler:", v4, 0, 1, 0);
  }
  else if (objc_msgSend(v6, "isWidgetStackIcon")
         && -[SBIconDragManager createsStacksFromWidgets](self, "createsStacksFromWidgets"))
  {
    objc_msgSend(v4, "presentStackConfigurationCard");
  }
  else if (objc_msgSend(v6, "isLeafIcon"))
  {
    iconDrags = self->_iconDrags;
    v8 = v6;
    -[NSMapTable objectEnumerator](iconDrags, "objectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nextObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "itemIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconDragManager draggedIconForIdentifier:](self, "draggedIconForIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBIconDragManager createNewFolderFromRecipientIcon:grabbedIcon:](self, "createNewFolderFromRecipientIcon:grabbedIcon:", v8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "icon");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconDragManager addIcons:intoFolderIcon:openFolderOnFinish:](self, "addIcons:intoFolderIcon:openFolderOnFinish:", v15, v16, 1);

  }
}

- (id)iconListView:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  if (-[SBIconDragManager _shouldPerformRippleAnimationForInsertingDragItem:toIconListView:](self, "_shouldPerformRippleAnimationForInsertingDragItem:toIconListView:", a4, a3))
  {
    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widgetSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "dropInsertionAnimationSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)_shouldPerformRippleAnimationForInsertingDragItem:(id)a3 toIconListView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t started;
  int v10;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t, _BYTE *);
  void *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v7 = a4;
  if (UIAccessibilityIsReduceMotionEnabled()
    || (-[SBIconDragManager appDragLocalContextForDragItem:](self, "appDragLocalContextForDragItem:", v6),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        started = SBHAppDragLocalContextStartLocationFromSBSLocation(objc_msgSend(v8, "startLocation")),
        v8,
        started == 2))
  {
    LOBYTE(v10) = 0;
    goto LABEL_6;
  }
  if (started != 3)
  {
    -[SBIconDragManager _iconForDragItem:inIconListView:](self, "_iconForDragItem:inIconListView:", v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && !objc_msgSend(v12, "isWidgetIcon"))
    {
      LOBYTE(v10) = 0;
LABEL_16:

      goto LABEL_6;
    }
    -[SBIconDragManager _iconIdentifierForDragItem:](self, "_iconIdentifierForDragItem:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__2;
    v30 = __Block_byref_object_dispose__2;
    v31 = 0;
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __86__SBIconDragManager__shouldPerformRippleAnimationForInsertingDragItem_toIconListView___block_invoke;
    v23 = &unk_1E8D85E28;
    v15 = v14;
    v24 = v15;
    v25 = &v26;
    -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", &v20);
    -[SBIconDragManager rootFolder](self, "rootFolder", v20, v21, v22, v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isIconAtIndexPathInTodayList:", v27[5]))
    {

    }
    else
    {
      -[SBIconDragManager rootFolder](self, "rootFolder");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isIconAtIndexPathInFavoriteTodayList:", v27[5]);

      if (!v18)
      {
        LOBYTE(v10) = 0;
        goto LABEL_15;
      }
    }
    objc_msgSend(v7, "iconLocation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupTodayView"), v19) ^ 1;

LABEL_15:
    _Block_object_dispose(&v26, 8);

    goto LABEL_16;
  }
  LOBYTE(v10) = 1;
LABEL_6:

  return v10;
}

void __86__SBIconDragManager__shouldPerformRippleAnimationForInsertingDragItem_toIconListView___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "hasItemIdentifier:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v9, "initialIndexPathForIconWithIdentifier:", *(_QWORD *)(a1 + 32));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *a4 = 1;
  }

}

- (void)_updateAutoScrollAssistantForDropSession:(id)a3
{
  id v4;
  SBHIconDragAutoScrollAssistant *autoScrollAssistant;
  void *v6;
  SBHIconDragAutoScrollAssistant *v7;
  SBHIconDragAutoScrollAssistant *v8;
  id v9;

  v4 = a3;
  autoScrollAssistant = self->_autoScrollAssistant;
  v9 = v4;
  if (!autoScrollAssistant)
  {
    -[SBIconDragManager rootView](self, "rootView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBHIconDragAutoScrollAssistant initWithDelegate:referenceView:]([SBHIconDragAutoScrollAssistant alloc], "initWithDelegate:referenceView:", self, v6);
    v8 = self->_autoScrollAssistant;
    self->_autoScrollAssistant = v7;

    v4 = v9;
    autoScrollAssistant = self->_autoScrollAssistant;
  }
  -[SBHIconDragAutoScrollAssistant setActiveDropSession:](autoScrollAssistant, "setActiveDropSession:", v4);

}

- (void)_invalidateAutoScrollAssistant
{
  SBHIconDragAutoScrollAssistant *autoScrollAssistant;
  SBHIconDragAutoScrollAssistant *v4;

  autoScrollAssistant = self->_autoScrollAssistant;
  if (autoScrollAssistant)
  {
    -[SBHIconDragAutoScrollAssistant invalidate](autoScrollAssistant, "invalidate");
    v4 = self->_autoScrollAssistant;
    self->_autoScrollAssistant = 0;

    autoScrollAssistant = self->_autoScrollAssistant;
  }
  self->_autoScrollAssistant = 0;

}

- (void)autoScrollAssistant:(id)a3 triggeredAutoScrollInDirection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  -[SBIconDragManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "rootFolderControllerForIconDragManager:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v8, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (objc_msgSend(v8, "isScrolling") & 1) == 0
    && -[SBIconDragManager isRootFolderContentVisible](self, "isRootFolderContentVisible"))
  {
    if (a4 == 2)
    {
      if (objc_msgSend(v7, "isOverlayTodayViewVisible"))
      {
        v22 = 0;
        v23 = &v22;
        v24 = 0x2020000000;
        v25 = 1;
        if (-[SBIconDragManager isTrackingWidgetIconDrags](self, "isTrackingWidgetIconDrags"))
        {
          objc_msgSend(v8, "currentIconListModel");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __72__SBIconDragManager_autoScrollAssistant_triggeredAutoScrollInDirection___block_invoke;
          v19[3] = &unk_1E8D85E28;
          v16 = v15;
          v20 = v16;
          v21 = &v22;
          -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v19);

        }
        if (*((_BYTE *)v23 + 24) && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "dismissTodayOverlayForIconDragManager:", self);
        _Block_object_dispose(&v22, 8);
      }
      else
      {
        v18 = objc_msgSend(v8, "currentPageIndex");
        if (v18 == objc_msgSend(v8, "lastIconPageIndex")
          && !-[SBIconDragManager isTrackingWidgetIconDrags](self, "isTrackingWidgetIconDrags")
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v7, "presentLibraryForIconDragManager:windowScene:", self, v11);
        }
      }
    }
    else if (a4 == 1)
    {
      if (objc_msgSend(v7, "isMainDisplayLibraryViewVisible"))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "contentView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "window");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "windowScene");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "dismissLibraryForIconDragManager:windowScene:", self, v14);

        }
      }
      else
      {
        v17 = objc_msgSend(v8, "currentPageIndex");
        if (v17 == objc_msgSend(v8, "firstIconPageIndex")
          && -[SBIconDragManager isTrackingWidgetIconDrags](self, "isTrackingWidgetIconDrags")
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v7, "presentTodayOverlayForIconDragManager:", self);
        }
      }
    }
  }

}

void __72__SBIconDragManager_autoScrollAssistant_triggeredAutoScrollInDirection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__SBIconDragManager_autoScrollAssistant_triggeredAutoScrollInDirection___block_invoke_2;
  v9[3] = &unk_1E8D85B48;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10 = v7;
  v11 = v8;
  objc_msgSend(a2, "enumerateSourceIconViewsUsingBlock:", v9);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;

}

void __72__SBIconDragManager_autoScrollAssistant_triggeredAutoScrollInDirection___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "isAllowedToContainIcon:", v6);

  if ((v5 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
}

- (void)noteIconManagerEditingDidChange
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = -[SBIconDragManager isEditing](self, "isEditing");
  SBLogIconDragging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_INFO, "icon controller is now editing: %{BOOL}u", (uint8_t *)v6, 8u);
  }

  -[SBIconDragManager _updateDragPreviewsForEditingState:animated:](self, "_updateDragPreviewsForEditingState:animated:", v3, 1);
  if (!v3)
  {
    -[SBIconDragManager draggingEditContext](self, "draggingEditContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnteredScreenLocationNeedsUpdate:", 1);

    if (-[SBIconDragManager shouldCancelDragsWhenEditingEnds](self, "shouldCancelDragsWhenEditingEnds"))
      -[SBIconDragManager cancelAllDrags](self, "cancelAllDrags");
  }
}

- (void)noteRootFolderDidMutate
{
  NSObject *v3;
  uint8_t v4[16];

  if (!-[SBIconDragManager isModifyingRootFolder](self, "isModifyingRootFolder"))
  {
    SBLogIconDragging();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "clearing all undo registrations because the root folder was mutated by someone else", v4, 2u);
    }

    -[SBIconDragManager clearAllUndoRegistrations](self, "clearAllUndoRegistrations");
  }
}

- (void)iconListView:(id)a3 concludeIconDrop:(id)a4
{
  -[SBIconDragManager concludeIconDrop:](self, "concludeIconDrop:", a4);
}

- (void)iconListView:(id)a3 iconDropSessionDidEnd:(id)a4
{
  -[SBIconDragManager iconDropSessionDidEnd:](self, "iconDropSessionDidEnd:", a4);
}

- (BOOL)iconListView:(id)a3 canHandleIconDropSession:(id)a4
{
  return -[SBIconDragManager canHandleIconDropSession:inIconListView:](self, "canHandleIconDropSession:inIconListView:", a4, a3);
}

- (void)iconListView:(id)a3 iconDropSessionDidEnter:(id)a4
{
  -[SBIconDragManager iconDropSessionDidEnter:inIconListView:](self, "iconDropSessionDidEnter:inIconListView:", a4, a3);
}

- (id)iconListView:(id)a3 iconDropSessionDidUpdate:(id)a4
{
  return -[SBIconDragManager iconDropSessionDidUpdate:inIconListView:](self, "iconDropSessionDidUpdate:inIconListView:", a4, a3);
}

- (void)iconListView:(id)a3 iconDropSessionDidExit:(id)a4
{
  -[SBIconDragManager iconDropSessionDidExit:fromIconListView:](self, "iconDropSessionDidExit:fromIconListView:", a4, a3);
}

- (void)iconListView:(id)a3 performIconDrop:(id)a4
{
  -[SBIconDragManager performIconDrop:inIconListView:](self, "performIconDrop:inIconListView:", a4, a3);
}

- (BOOL)iconListView:(id)a3 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a4 onIconView:(id)a5
{
  return -[SBIconDragManager shouldAllowSpringLoadedInteractionForIconDropSession:onIconView:](self, "shouldAllowSpringLoadedInteractionForIconDropSession:onIconView:", a4, a5);
}

- (void)iconListView:(id)a3 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a4
{
  -[SBIconDragManager performSpringLoadedInteractionForIconDragOnIconView:](self, "performSpringLoadedInteractionForIconDragOnIconView:", a4);
}

- (void)folderController:(id)a3 draggedIconShouldDropFromListView:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[SBIconDragManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "iconDragManager:folderController:draggedIconShouldDropFromListView:", self, v8, v6);

}

- (BOOL)folderController:(id)a3 iconListView:(id)a4 canHandleIconDropSession:(id)a5
{
  return -[SBIconDragManager canHandleIconDropSession:inIconListView:](self, "canHandleIconDropSession:inIconListView:", a5, a4);
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidEnter:(id)a5
{
  -[SBIconDragManager iconDropSessionDidEnter:inIconListView:](self, "iconDropSessionDidEnter:inIconListView:", a5, a4);
}

- (id)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidUpdate:(id)a5
{
  return -[SBIconDragManager iconDropSessionDidUpdate:inIconListView:](self, "iconDropSessionDidUpdate:inIconListView:", a5, a4);
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidExit:(id)a5
{
  -[SBIconDragManager iconDropSessionDidExit:fromIconListView:](self, "iconDropSessionDidExit:fromIconListView:", a5, a4);
}

- (void)folderController:(id)a3 iconListView:(id)a4 performIconDrop:(id)a5
{
  -[SBIconDragManager performIconDrop:inIconListView:](self, "performIconDrop:inIconListView:", a5, a4);
}

- (id)folderController:(id)a3 iconListView:(id)a4 iconViewForDroppingIconDragItem:(id)a5 proposedIconView:(id)a6
{
  return -[SBIconDragManager iconListView:iconViewForDroppingIconDragItem:proposedIconView:](self, "iconListView:iconViewForDroppingIconDragItem:proposedIconView:", a4, a5, a6);
}

- (void)folderController:(id)a3 iconListView:(id)a4 willUseIconView:(id)a5 forDroppingIconDragItem:(id)a6
{
  -[SBIconDragManager iconListView:willUseIconView:forDroppingIconDragItem:](self, "iconListView:willUseIconView:forDroppingIconDragItem:", a4, a5, a6);
}

- (id)folderController:(id)a3 iconListView:(id)a4 previewForDroppingIconDragItem:(id)a5 proposedPreview:(id)a6
{
  return -[SBIconDragManager iconListView:previewForDroppingIconDragItem:proposedPreview:](self, "iconListView:previewForDroppingIconDragItem:proposedPreview:", a4, a5, a6);
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDragItem:(id)a5 willAnimateDropWithAnimator:(id)a6
{
  -[SBIconDragManager iconListView:iconDragItem:willAnimateDropWithAnimator:](self, "iconListView:iconDragItem:willAnimateDropWithAnimator:", a4, a5, a6);
}

- (BOOL)folderController:(id)a3 iconListView:(id)a4 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a5 onIconView:(id)a6
{
  return -[SBIconDragManager shouldAllowSpringLoadedInteractionForIconDropSession:onIconView:](self, "shouldAllowSpringLoadedInteractionForIconDropSession:onIconView:", a5, a6);
}

- (void)folderController:(id)a3 iconListView:(id)a4 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a5
{
  void *v6;
  id v7;

  v7 = a5;
  -[SBIconDragManager performSpringLoadedInteractionForIconDragOnIconView:](self, "performSpringLoadedInteractionForIconDragOnIconView:");
  -[SBIconDragManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "iconDragManager:didSpringLoadIconView:", self, v7);

}

- (id)folderController:(id)a3 iconListView:(id)a4 customSpringAnimationBehaviorForDroppingItem:(id)a5
{
  return -[SBIconDragManager iconListView:customSpringAnimationBehaviorForDroppingItem:](self, "iconListView:customSpringAnimationBehaviorForDroppingItem:", a4, a5);
}

- (void)iconListView:(id)a3 willConfigureIconView:(id)a4 forIcon:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__SBIconDragManager_iconListView_willConfigureIconView_forIcon___block_invoke;
  v8[3] = &unk_1E8D86290;
  v9 = v6;
  v7 = v6;
  -[SBIconDragManager enumerateIconDragContextsUsingBlock:](self, "enumerateIconDragContextsUsingBlock:", v8);

}

void __64__SBIconDragManager_iconListView_willConfigureIconView_forIcon___block_invoke(uint64_t a1, void *a2)
{
  SBIconDragPlaceholderIconViewController *v3;

  if (objc_msgSend(a2, "isWaitingToSetPlaceholderViewController"))
  {
    v3 = objc_alloc_init(SBIconDragPlaceholderIconViewController);
    objc_msgSend(*(id *)(a1 + 32), "setOverrideCustomIconImageViewController:", v3);

  }
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconDragManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_iconDrags, CFSTR("iconDrags"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_revertingReplacementIndexPaths, CFSTR("revertingReplacementIndexPaths"), 1);
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconDragManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)createsStacksFromWidgets
{
  return self->_createsStacksFromWidgets;
}

- (void)setCreatesStacksFromWidgets:(BOOL)a3
{
  self->_createsStacksFromWidgets = a3;
}

- (BOOL)prioritizesDirectIconPlacement
{
  return self->_prioritizesDirectIconPlacement;
}

- (void)setPrioritizesDirectIconPlacement:(BOOL)a3
{
  self->_prioritizesDirectIconPlacement = a3;
}

- (SBIconDraggingEditContext)draggingEditContext
{
  return self->_draggingEditContext;
}

- (void)setDraggingEditContext:(id)a3
{
  objc_storeStrong((id *)&self->_draggingEditContext, a3);
}

- (BOOL)isModifyingRootFolder
{
  return self->_modifyingRootFolder;
}

- (void)setModifyingRootFolder:(BOOL)a3
{
  self->_modifyingRootFolder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draggingEditContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_runLoopWaitBlocks, 0);
  objc_storeStrong((id *)&self->_registeredUndoManagers, 0);
  objc_storeStrong((id *)&self->_autoScrollAssistant, 0);
  objc_storeStrong((id *)&self->_singleUseDragWindows, 0);
  objc_storeStrong((id *)&self->_revertingReplacementIndexPaths, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifiersPerDragSession, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifiersPerDropSession, 0);
  objc_storeStrong((id *)&self->_iconDrags, 0);
}

void __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, a2, a3, "icon view '%@' is marked as grabbed when cleaning up the drag", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __53__SBIconDragManager__stopTrackingDragWithIdentifier___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, a2, a3, "icon view '%@' is marked as highlighted when cleaning up the drag", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)watchdogDragWithIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_FAULT, "Error: watchdog for user icon drag fired. Will abort and try to clean up. %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)updatePlaceholderPositionForDropSession:(os_log_t)log inIconListView:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 8);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1CFEF3000, log, OS_LOG_TYPE_ERROR, "ERROR: We have no grabbed icon! Tracked drags: %@, this drag: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)performIconDrop:(os_log_t)log inIconListView:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CFEF3000, log, OS_LOG_TYPE_ERROR, "bailing on icon drop because we don't have a root folder or a root list model", v1, 2u);
}

@end
