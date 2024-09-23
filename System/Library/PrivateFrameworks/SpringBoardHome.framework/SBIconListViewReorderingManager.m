@implementation SBIconListViewReorderingManager

- (SBIconListViewReorderingManager)initWithIconListView:(id)a3
{
  id v4;
  SBIconListViewReorderingManager *v5;
  SBIconListViewReorderingManager *v6;
  SBIconDragManager *v7;
  SBIconDragManager *iconDragManager;
  SBIconListViewReorderingManager *v9;
  id v10;
  uint64_t v11;
  NSString *uniqueDragTypeIdentifier;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  SBIconListViewReorderingManager *v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBIconListViewReorderingManager;
  v5 = -[SBIconListViewReorderingManager init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_iconListView, v4);
    objc_msgSend(v4, "addLayoutObserver:", v6);
    v7 = objc_alloc_init(SBIconDragManager);
    iconDragManager = v6->_iconDragManager;
    v6->_iconDragManager = v7;

    -[SBIconDragManager setDelegate:](v6->_iconDragManager, "setDelegate:", v6);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __56__SBIconListViewReorderingManager_initWithIconListView___block_invoke;
    v17 = &unk_1E8D85CC0;
    v9 = v6;
    v18 = v9;
    objc_msgSend(v4, "enumerateDisplayedIconViewsUsingBlock:", &v14);
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    v11 = objc_msgSend(v10, "initWithFormat:", CFSTR("SBIconListView-Reordering-%p"), v4, v14, v15, v16, v17);
    uniqueDragTypeIdentifier = v9->_uniqueDragTypeIdentifier;
    v9->_uniqueDragTypeIdentifier = (NSString *)v11;

  }
  return v6;
}

uint64_t __56__SBIconListViewReorderingManager_initWithIconListView___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOverrideDraggingDelegate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

- (id)reorderingDelegate
{
  void *v2;
  void *v3;

  -[SBIconListViewReorderingManager iconListView](self, "iconListView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reorderingDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)iconListView:(id)a3 didAddIconView:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBIconListViewReorderingManager iconDragManager](self, "iconDragManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOverrideDraggingDelegate:", v6);

}

- (void)iconListView:(id)a3 didRemoveIconView:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  -[SBIconListViewReorderingManager iconDragManager](self, "iconDragManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overrideDraggingDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    objc_msgSend(v7, "setOverrideDraggingDelegate:", 0);

}

- (void)invalidate
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  -[SBIconListViewReorderingManager iconListView](self, "iconListView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconListViewReorderingManager iconDragManager](self, "iconDragManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__SBIconListViewReorderingManager_invalidate__block_invoke;
  v6[3] = &unk_1E8D85CC0;
  v7 = v3;
  v4 = v3;
  objc_msgSend(v5, "enumerateDisplayedIconViewsUsingBlock:", v6);

}

void __45__SBIconListViewReorderingManager_invalidate__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "overrideDraggingDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
    objc_msgSend(v5, "setOverrideDraggingDelegate:", 0);

}

- (BOOL)isEditingForIconListView:(id)a3
{
  return 1;
}

- (id)iconDragManager:(id)a3 dragItemsForIconView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SBIconListViewReorderingManager uniqueDragTypeIdentifier](self, "uniqueDragTypeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBHIconDragItemWithIconAndIconView(v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)iconDragManager:(id)a3 canBeginIconDragForIconView:(id)a4
{
  void *v5;
  void *v6;
  char v7;

  -[SBIconListViewReorderingManager iconListView](self, "iconListView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListViewReorderingManager reorderingDelegate](self, "reorderingDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "iconListViewCanBeginReordering:", v5);
  else
    v7 = 1;

  return v7;
}

- (SBIconListView)iconListView
{
  return (SBIconListView *)objc_loadWeakRetained((id *)&self->_iconListView);
}

- (NSString)uniqueDragTypeIdentifier
{
  return self->_uniqueDragTypeIdentifier;
}

- (SBIconDragManager)iconDragManager
{
  return self->_iconDragManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDragManager, 0);
  objc_storeStrong((id *)&self->_uniqueDragTypeIdentifier, 0);
  objc_destroyWeak((id *)&self->_iconListView);
}

@end
