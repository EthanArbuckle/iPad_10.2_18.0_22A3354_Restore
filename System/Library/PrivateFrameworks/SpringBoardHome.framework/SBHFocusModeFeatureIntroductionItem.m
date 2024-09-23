@implementation SBHFocusModeFeatureIntroductionItem

- (SBHFocusModeFeatureIntroductionItem)initWithIconManager:(id)a3
{
  id v4;
  SBHFocusModeFeatureIntroductionItem *v5;
  SBHFocusModeFeatureIntroductionItem *v6;
  NSMutableSet *v7;
  NSMutableSet *focusModePopoverViews;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBHFocusModeFeatureIntroductionItem;
  v5 = -[SBHFocusModeFeatureIntroductionItem init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_iconManager, v4);
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    focusModePopoverViews = v6->_focusModePopoverViews;
    v6->_focusModePopoverViews = v7;

  }
  return v6;
}

- (void)tearDown
{
  NSObject *v3;
  objc_class *v4;
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
  uint8_t v15[128];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  SBLogFocusModes();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_DEFAULT, "[%@] Tear down", buf, 0xCu);

  }
  -[SBHFocusModeFeatureIntroductionItem focusModePopoverViews](self, "focusModePopoverViews");
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "removeFromSuperview");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_tearDownFocusModePopoverView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBHFocusModeFeatureIntroductionItem focusModePopoverViews](self, "focusModePopoverViews");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);
  objc_msgSend(v4, "removeFromSuperview");

}

- (void)_removeActiveFocusModeRequiringIntroduction
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[SBHFocusModeFeatureIntroductionItem iconManager](self, "iconManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusModeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeFocusMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFocusModeRequiringIntroduction:", v4);

}

- (id)featureIntroductionIdentifier
{
  return CFSTR("SBHFocusModeFeatureIntroductionItem");
}

- (BOOL)shouldDisplayFeatureIntroductionAtLocations:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;

  -[SBHFocusModeFeatureIntroductionItem focusModePopoverViews](self, "focusModePopoverViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    -[SBHFocusModeFeatureIntroductionItem iconManager](self, "iconManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isDockPinnedForRotation");
    v10 = objc_msgSend(v8, "interfaceOrientation");
    if (!v9 || v10 == 1)
      v7 = (a3 >> 2) & 1;
    else
      LOBYTE(v7) = 0;

  }
  return v7;
}

- (void)displayFeatureIntroductionAtLocations:(unint64_t)a3 presentCompletion:(id)a4 dismissCompletion:(id)a5
{
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  SBLogFocusModes();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v8;
    _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_DEFAULT, "[%@] Determining if any popovers should be shown for lists revealed by active Focus mode...", buf, 0xCu);

  }
  -[SBHFocusModeFeatureIntroductionItem iconManager](self, "iconManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rootFolderController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  v13 = v11;
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __113__SBHFocusModeFeatureIntroductionItem_displayFeatureIntroductionAtLocations_presentCompletion_dismissCompletion___block_invoke;
  v18[3] = &unk_1E8D8B208;
  v18[4] = self;
  objc_msgSend(v15, "enumerateIconListViewsWithOptions:usingBlock:", 2, v18);

  objc_msgSend(v9, "focusModeManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activeFocusMode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isSleepFocus") & 1) == 0)
    -[SBHFocusModeFeatureIntroductionItem _removeActiveFocusModeRequiringIntroduction](self, "_removeActiveFocusModeRequiringIntroduction");

}

void __113__SBHFocusModeFeatureIntroductionItem_displayFeatureIntroductionAtLocations_presentCompletion_dismissCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  SBHFocusModePopoverView *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isHidden") & 1) == 0 && objc_msgSend(v4, "isHiddenByUser"))
  {
    v5 = -[SBHFocusModePopoverView initWithDelegate:iconListView:]([SBHFocusModePopoverView alloc], "initWithDelegate:iconListView:", *(_QWORD *)(a1 + 32), v3);
    objc_msgSend(*(id *)(a1 + 32), "focusModePopoverViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v5);

    SBLogFocusModes();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_DEFAULT, "[%@] Displaying popover", (uint8_t *)&v10, 0xCu);

    }
  }

}

- (void)focusModePopoverView:(id)a3 closeButtonTappedForIconListView:(id)a4
{
  id v5;

  v5 = a3;
  -[SBHFocusModeFeatureIntroductionItem _removeActiveFocusModeRequiringIntroduction](self, "_removeActiveFocusModeRequiringIntroduction");
  -[SBHFocusModeFeatureIntroductionItem _tearDownFocusModePopoverView:](self, "_tearDownFocusModePopoverView:", v5);

}

- (void)focusModePopoverView:(id)a3 editPageButtonTappedForIconListView:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SBHFocusModeFeatureIntroductionItem _removeActiveFocusModeRequiringIntroduction](self, "_removeActiveFocusModeRequiringIntroduction");
  -[SBHFocusModeFeatureIntroductionItem iconManager](self, "iconManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEditing:fromIconListView:", 1, v6);

  -[SBHFocusModeFeatureIntroductionItem _tearDownFocusModePopoverView:](self, "_tearDownFocusModePopoverView:", v7);
}

- (id)focusModePopoverViewActiveFocusMode:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SBHFocusModeFeatureIntroductionItem iconManager](self, "iconManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusModeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeFocusMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)focusModePopoverViewFolderScrollAccessoryFrame:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  -[SBHFocusModeFeatureIntroductionItem iconManager](self, "iconManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootFolderController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  objc_msgSend(v9, "scrollAccessoryView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (SBHIconManager)iconManager
{
  return (SBHIconManager *)objc_loadWeakRetained((id *)&self->_iconManager);
}

- (void)setIconManager:(id)a3
{
  objc_storeWeak((id *)&self->_iconManager, a3);
}

- (NSMutableSet)focusModePopoverViews
{
  return self->_focusModePopoverViews;
}

- (void)setFocusModePopoverViews:(id)a3
{
  objc_storeStrong((id *)&self->_focusModePopoverViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusModePopoverViews, 0);
  objc_destroyWeak((id *)&self->_iconManager);
}

@end
