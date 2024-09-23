@implementation PRWidgetGridViewController

- (PRWidgetGridViewController)initWithModel:(id)a3
{
  return -[PRWidgetGridViewController initWithModel:iconViewProvider:](self, "initWithModel:iconViewProvider:", a3, 0);
}

- (PRWidgetGridViewController)initWithModel:(id)a3 iconViewProvider:(id)a4
{
  return -[PRWidgetGridViewController initWithModel:iconViewProvider:contentType:presentationMode:](self, "initWithModel:iconViewProvider:contentType:presentationMode:", a3, a4, 0, 2);
}

- (PRWidgetGridViewController)initWithModel:(id)a3 iconViewProvider:(id)a4 contentType:(unint64_t)a5 presentationMode:(unint64_t)a6
{
  id v11;
  id v12;
  PRWidgetGridViewController *v13;
  PRWidgetGridViewController *v14;
  PRIconDragManager *v15;
  SBIconDragManager *dragManager;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PRWidgetGridViewController;
  v13 = -[PRWidgetGridViewController initWithNibName:bundle:](&v18, sel_initWithNibName_bundle_, 0, 0);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_model, a3);
    objc_storeWeak((id *)&v14->_iconViewProvider, v12);
    v14->_contentType = a5;
    v14->_presentationMode = a6;
    v15 = objc_alloc_init(PRIconDragManager);
    dragManager = v14->_dragManager;
    v14->_dragManager = &v15->super;

    -[SBIconDragManager setDelegate:](v14->_dragManager, "setDelegate:", v14);
  }

  return v14;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[PRWidgetGridViewController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("listModel"), &PRWidgetGridViewControllerKVOContext);

  -[PRWidgetGridViewController model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("layoutInsetsMode"), &PRWidgetGridViewControllerKVOContext);

  -[PRWidgetGridViewController model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("intentsByDescriptorIdentifier"), &PRWidgetGridViewControllerKVOContext);

  v6.receiver = self;
  v6.super_class = (Class)PRWidgetGridViewController;
  -[PRWidgetGridViewController dealloc](&v6, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  PRSubviewHitTestingView *v3;

  v3 = objc_alloc_init(PRSubviewHitTestingView);
  -[PRWidgetGridViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  PRIconListLayoutProvider *v6;
  void *v7;
  PRIconListLayoutProvider *v8;
  uint64_t v9;
  PRWidgetGridViewController *WeakRetained;
  PRWidgetGridViewController *v11;
  PRWidgetGridViewController *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PRWidgetGridViewController;
  -[PRWidgetGridViewController viewDidLoad](&v25, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0DAA600]);
  -[PRWidgetGridViewController model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [PRIconListLayoutProvider alloc];
  -[PRWidgetGridViewController model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PRIconListLayoutProvider initWithGridSize:](v6, "initWithGridSize:", objc_msgSend(v7, "gridSize"));
  v9 = *MEMORY[0x1E0DAA9A0];
  WeakRetained = (PRWidgetGridViewController *)objc_loadWeakRetained((id *)&self->_iconViewProvider);
  v11 = WeakRetained;
  if (WeakRetained)
    v12 = WeakRetained;
  else
    v12 = self;
  v13 = (void *)objc_msgSend(v3, "initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:", v5, v8, v9, 1, v12);

  objc_msgSend(v13, "setAllowsGaps:", 1);
  -[PRWidgetGridViewController dragManager](self, "dragManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDragDelegate:", v14);

  objc_msgSend(v13, "setIconDragTypeIdentifier:", CFSTR("com.apple.PosterBoard.WidgetGrid"));
  objc_msgSend(v13, "addLayoutObserver:", self);
  objc_msgSend(MEMORY[0x1E0D1BC88], "interComplicationSpacingExcludingInnerInset");
  objc_msgSend(v13, "setIconSpacing:", v15, v15);
  -[PRWidgetGridViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v13);

  -[PRWidgetGridViewController setListView:](self, "setListView:", v13);
  -[PRWidgetGridViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHitTestsAsOpaque:", 1);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__tapGestureRecognized_);
  -[PRWidgetGridViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addGestureRecognizer:", v19);

  -[PRWidgetGridViewController model](self, "model");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObserver:forKeyPath:options:context:", self, CFSTR("listModel"), 5, &PRWidgetGridViewControllerKVOContext);

  -[PRWidgetGridViewController model](self, "model");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObserver:forKeyPath:options:context:", self, CFSTR("layoutInsetsMode"), 5, &PRWidgetGridViewControllerKVOContext);

  -[PRWidgetGridViewController model](self, "model");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObserver:forKeyPath:options:context:", self, CFSTR("intentsByDescriptorIdentifier"), 5, &PRWidgetGridViewControllerKVOContext);

  -[PRWidgetGridViewController model](self, "model");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPresenter:", self);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double x;
  double y;
  double width;
  double height;
  void *v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)PRWidgetGridViewController;
  -[PRWidgetGridViewController viewDidLayoutSubviews](&v9, sel_viewDidLayoutSubviews);
  -[PRWidgetGridViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v11 = CGRectInset(v10, -20.0, -20.0);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;

  -[PRWidgetGridViewController listView](self, "listView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", x, y, width, height);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  objc_super v12;

  v10 = a3;
  v11 = v10;
  if (a6 == &PRWidgetGridViewControllerKVOContext)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("listModel")))
    {
      -[PRWidgetGridViewController _listModelUpdated](self, "_listModelUpdated");
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("layoutInsetsMode")))
    {
      -[PRWidgetGridViewController _layoutInsetsModeUpdated](self, "_layoutInsetsModeUpdated");
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("intentsByDescriptorIdentifier")))
    {
      -[PRWidgetGridViewController _intentsUpdated](self, "_intentsUpdated");
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PRWidgetGridViewController;
    -[PRWidgetGridViewController observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);
  }

}

- (void)_listModelUpdated
{
  void *v3;
  void *v4;
  id v5;

  -[PRWidgetGridViewController listView](self, "listView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PRWidgetGridViewController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setModel:", v4);

}

- (void)_layoutInsetsModeUpdated
{
  void *v3;
  _BOOL4 v4;
  id v5;

  -[PRWidgetGridViewController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutInsetsMode") == 1;

  -[PRWidgetGridViewController listView](self, "listView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutInsetsMode:", 2 * v4);

}

- (void)_intentsUpdated
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
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
  char v19;
  void *v20;
  void *v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[PRWidgetGridViewController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v23 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v23)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[PRWidgetGridViewController _widgetIconViewControllerForIcon:](self, "_widgetIconViewControllerForIcon:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "leafIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "widgetHostViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "widget");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[PRWidgetGridViewController model](self, "model");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "intentsByDescriptorIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "intentReference");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "intent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = BSEqualObjects();

        if ((v19 & 1) == 0)
        {
          objc_msgSend(v13, "widgetByReplacingIntent:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "widgetHostViewController");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setWidget:", v20);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

}

- (void)ensureContentWithTimeout:(double)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  _QWORD v22[4];
  id v23;
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v19 = a4;
  -[PRWidgetGridViewController listView](self, "listView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIconsIfNeeded");

  -[PRWidgetGridViewController listView](self, "listView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "icons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __66__PRWidgetGridViewController_ensureContentWithTimeout_completion___block_invoke;
  v29[3] = &unk_1E2184DC0;
  v29[4] = self;
  objc_msgSend(v7, "bs_compactMap:", v29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v15), "widgetHostViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          dispatch_group_enter(v10);
          v22[0] = v8;
          v22[1] = 3221225472;
          v22[2] = __66__PRWidgetGridViewController_ensureContentWithTimeout_completion___block_invoke_2;
          v22[3] = &unk_1E2184DE8;
          v17 = v16;
          v23 = v17;
          v24 = v10;
          objc_msgSend(v17, "ensureContentWithTimeout:completion:", v22, 5.0);

        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v13);
  }

  dispatch_group_leave(v10);
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __66__PRWidgetGridViewController_ensureContentWithTimeout_completion___block_invoke_24;
  block[3] = &unk_1E2184E10;
  v21 = v19;
  v18 = v19;
  dispatch_group_notify(v10, MEMORY[0x1E0C80D38], block);

}

uint64_t __66__PRWidgetGridViewController_ensureContentWithTimeout_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_widgetIconViewControllerForIcon:", a2);
}

void __66__PRWidgetGridViewController_ensureContentWithTimeout_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    PRLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __66__PRWidgetGridViewController_ensureContentWithTimeout_completion___block_invoke_2_cold_1((uint64_t)v3, a1, v4);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __66__PRWidgetGridViewController_ensureContentWithTimeout_completion___block_invoke_24(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)interpretsViewAsContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[PRWidgetGridViewController listView](self, "listView", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "icons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          -[PRWidgetGridViewController _widgetIconViewControllerForIcon:](self, "_widgetIconViewControllerForIcon:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "view");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "containsView:", v4);

          if ((v13 & 1) != 0)
          {
            v14 = 1;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_12:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)widgetHostViewControllerForComplicationDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[PRWidgetGridViewController model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "listModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "indexForIconWithIdentifier:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "iconAtIndex:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRWidgetGridViewController _widgetIconViewControllerForIcon:](self, "_widgetIconViewControllerForIcon:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "widgetHostViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)setFocused:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_focused != a3)
  {
    v3 = a3;
    self->_focused = a3;
    -[PRWidgetGridViewController listView](self, "listView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEditing:", v3);

    -[PRWidgetGridViewController listView](self, "listView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateEditingStateAnimated:", 1);

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[PRWidgetGridViewController listView](self, "listView", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "icons");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      v12 = v3 ^ 1;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          -[PRWidgetGridViewController _widgetIconViewControllerForIcon:](self, "_widgetIconViewControllerForIcon:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setBackgroundHidden:", v12);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
}

- (void)setFocused:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  id v7;

  v4 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.3);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = (id)v6;
  -[PRWidgetGridViewController setFocused:animationSettings:](self, "setFocused:animationSettings:", v4, v6);

}

- (void)setFocused:(BOOL)a3 animationSettings:(id)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__PRWidgetGridViewController_setFocused_animationSettings___block_invoke;
  v4[3] = &unk_1E2184468;
  v4[4] = self;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D01908], "animateWithSettings:actions:", a4, v4);
}

uint64_t __59__PRWidgetGridViewController_setFocused_animationSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFocused:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setVibrancyConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_vibrancyConfiguration, a3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PRWidgetGridViewController listView](self, "listView", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "icons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        -[PRWidgetGridViewController _widgetIconViewControllerForIcon:](self, "_widgetIconViewControllerForIcon:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setVibrancyConfiguration:", v5);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)setIconContentScale:(double)a3
{
  double v5;
  double v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D1BC88], "interComplicationSpacingExcludingInnerInset");
  v6 = v5 * a3;
  -[PRWidgetGridViewController listView](self, "listView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIconSpacing:", v6, v6);

  -[PRWidgetGridViewController listView](self, "listView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIconContentScale:", a3);

}

- (double)iconContentScale
{
  void *v2;
  double v3;
  double v4;

  -[PRWidgetGridViewController listView](self, "listView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconContentScale");
  v4 = v3;

  return v4;
}

- (void)setWidgetInteractionDisabled:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_widgetInteractionDisabled != a3)
  {
    self->_widgetInteractionDisabled = a3;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[PRWidgetGridViewController listView](self, "listView", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "icons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          -[PRWidgetGridViewController _widgetIconViewControllerForIcon:](self, "_widgetIconViewControllerForIcon:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setWidgetInteractionDisabled:", -[PRWidgetGridViewController _shouldDisableWidgetInteraction](self, "_shouldDisableWidgetInteraction"));

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (id)_widgetIconViewControllerForIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v4 = a3;
  -[PRWidgetGridViewController listView](self, "listView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedIconViewForIcon:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "customIconImageViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v9 = v7;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  return v11;
}

- (void)_tapGestureRecognized:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[PRWidgetGridViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[PRWidgetGridViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widgetGridViewControllerDidTapBackground:", self);

  }
}

- (BOOL)_shouldDisableWidgetInteraction
{
  return -[PRWidgetGridViewController isWidgetInteractionDisabled](self, "isWidgetInteractionDisabled")
      || -[PRWidgetGridViewController requiresFocusForLaunchRequests](self, "requiresFocusForLaunchRequests");
}

- (void)invalidate
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PRWidgetGridViewController listView](self, "listView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "icons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[PRWidgetGridViewController _widgetIconViewControllerForIcon:](self, "_widgetIconViewControllerForIcon:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "invalidate");

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[PRWidgetGridViewController model](self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");

}

- (void)widgetHostViewController:(id)a3 requestsLaunchWithAction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  -[PRWidgetGridViewController model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "complicationDescriptors");
  v9 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__PRWidgetGridViewController_widgetHostViewController_requestsLaunchWithAction___block_invoke;
  v14[3] = &unk_1E2184E38;
  v13 = v6;
  v15 = v13;
  objc_msgSend((id)v9, "bs_firstObjectPassingTest:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRWidgetGridViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[PRWidgetGridViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "widgetGridViewController:didRequestLaunchForComplicationDescriptor:withAction:", self, v10, v7);

  }
}

uint64_t __80__PRWidgetGridViewController_widgetHostViewController_requestsLaunchWithAction___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "widgetConfigurationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = BSEqualObjects();
  return v6;
}

- (void)handleLaunchRequestForIcon:(id)a3
{
  void *v3;
  id v4;

  -[PRWidgetGridViewController _widgetIconViewControllerForIcon:](self, "_widgetIconViewControllerForIcon:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetHostViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestLaunch");

}

- (void)performAnimatedInsertionForIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PRWidgetGridViewController listView](self, "listView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutAndCreateIcon:", v4);

  -[PRWidgetGridViewController listView](self, "listView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markIcon:asNeedingAnimation:", v4, 1);

  -[PRWidgetGridViewController listView](self, "listView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIconsIfNeededWithAnimationType:options:", 0, 0);

}

- (void)performAnimatedRemovalForIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PRWidgetGridViewController listView](self, "listView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedIconViewForIcon:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAllowsEditingAnimation:", 0);
  -[PRWidgetGridViewController listView](self, "listView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markIcon:asNeedingAnimation:", v4, 0);

  -[PRWidgetGridViewController listView](self, "listView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIconsIfNeededWithAnimationType:options:", 0, 0);

}

- (void)widgetIconViewControllerDidReceiveTap:(id)a3
{
  _BOOL4 v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  v4 = -[PRWidgetGridViewController isFocused](self, "isFocused");
  -[PRWidgetGridViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[PRWidgetGridViewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "complicationDescriptor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "widgetGridViewController:didRequestConfigurationForComplicationDescriptor:", self, v8);

LABEL_6:
    }
  }
  else
  {
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[PRWidgetGridViewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "widgetGridViewControllerDidTapBackground:", self);
      goto LABEL_6;
    }
  }

}

- (id)iconViewMap
{
  SBHReusableViewMap *iconViewMap;
  SBHReusableViewMap *v4;
  SBHReusableViewMap *v5;

  iconViewMap = self->_iconViewMap;
  if (!iconViewMap)
  {
    v4 = (SBHReusableViewMap *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA508]), "initWithDelegate:", self);
    v5 = self->_iconViewMap;
    self->_iconViewMap = v4;

    iconViewMap = self->_iconViewMap;
  }
  return iconViewMap;
}

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  void *v4;
  void *v5;

  -[PRWidgetGridViewController iconViewMap](self, "iconViewMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableViewOfClass:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)recycleIconView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PRWidgetGridViewController iconViewMap](self, "iconViewMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recycleView:", v4);

}

- (BOOL)isIconViewRecycled:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PRWidgetGridViewController iconViewMap](self, "iconViewMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isViewRecycled:", v4);

  return v6;
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setAllowsEditingAnimation:", 0);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "addObserver:", self);

}

- (unint64_t)viewMap:(id)a3 maxRecycledViewsOfClass:(Class)a4
{
  return 16;
}

- (UIView)recycledViewsContainer
{
  UIView *recycledViewsContainerView;
  UIView *v4;
  UIView *v5;
  void *v6;

  recycledViewsContainerView = self->_recycledViewsContainerView;
  if (!recycledViewsContainerView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v5 = self->_recycledViewsContainerView;
    self->_recycledViewsContainerView = v4;

    -[UIView setHidden:](self->_recycledViewsContainerView, "setHidden:", 1);
    -[UIView setAlpha:](self->_recycledViewsContainerView, "setAlpha:", 0.0);
    -[UIView setUserInteractionEnabled:](self->_recycledViewsContainerView, "setUserInteractionEnabled:", 0);
    -[PRWidgetGridViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_recycledViewsContainerView);

    recycledViewsContainerView = self->_recycledViewsContainerView;
  }
  return recycledViewsContainerView;
}

- (id)customImageViewControllerForIconView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  PRWidgetIconViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;

  objc_msgSend(a3, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leafIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRWidgetGridViewController model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "complicationDescriptorForIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (-[PRWidgetGridViewController presentationMode](self, "presentationMode") == 3)
      v8 = 2;
    else
      v8 = -[PRWidgetGridViewController presentationMode](self, "presentationMode");
    v9 = -[PRWidgetIconViewController initWithComplicationDescriptor:contentType:presentationMode:]([PRWidgetIconViewController alloc], "initWithComplicationDescriptor:contentType:presentationMode:", v7, -[PRWidgetGridViewController contentType](self, "contentType"), v8);
    -[PRWidgetIconViewController setBackgroundHidden:](v9, "setBackgroundHidden:", -[PRWidgetGridViewController isFocused](self, "isFocused") ^ 1);
    -[PRWidgetIconViewController setWidgetInteractionDisabled:](v9, "setWidgetInteractionDisabled:", -[PRWidgetGridViewController _shouldDisableWidgetInteraction](self, "_shouldDisableWidgetInteraction"));
    -[PRWidgetGridViewController vibrancyConfiguration](self, "vibrancyConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRWidgetIconViewController setVibrancyConfiguration:](v9, "setVibrancyConfiguration:", v10);

    -[PRWidgetIconViewController setDelegate:](v9, "setDelegate:", self);
    -[PRWidgetIconViewController widgetHostViewController](v9, "widgetHostViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", self);

    objc_msgSend(v7, "widget");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PRSharedWidgetDescriptorProvider();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "descriptorForPersonality:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "intentType");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      objc_msgSend(v12, "intentReference");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "intent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        objc_msgSend(v14, "defaultIntentReference");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "intent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          -[PRWidgetIconViewController widgetHostViewController](v9, "widgetHostViewController");
          v21 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "widgetByReplacingIntent:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setWidget:", v22);
          -[NSObject setWidget:](v21, "setWidget:", v22);

        }
        else
        {
          PRLogCommon();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[PRWidgetGridViewController customImageViewControllerForIconView:].cold.1(v12, v21);
        }

      }
    }
    if (-[PRWidgetGridViewController presentationMode](self, "presentationMode") == 3
      && (objc_msgSend(v12, "pr_isWorldClockWidget") & 1) == 0)
    {
      -[PRWidgetIconViewController widgetHostViewController](v9, "widgetHostViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __67__PRWidgetGridViewController_customImageViewControllerForIconView___block_invoke;
      v26[3] = &unk_1E2184DE8;
      v27 = v12;
      v28 = v23;
      v24 = v23;
      objc_msgSend(v24, "ensureContentWithTimeout:completion:", v26, 10.0);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __67__PRWidgetGridViewController_customImageViewControllerForIconView___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  if (v3)
  {
    PRLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __67__PRWidgetGridViewController_customImageViewControllerForIconView___block_invoke_cold_1(a1, (uint64_t)v3, v4);

  }
  v5 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PRWidgetGridViewController_customImageViewControllerForIconView___block_invoke_38;
  block[3] = &unk_1E2184010;
  v7 = *(id *)(a1 + 40);
  dispatch_after(v5, MEMORY[0x1E0C80D38], block);

}

uint64_t __67__PRWidgetGridViewController_customImageViewControllerForIconView___block_invoke_38(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPresentationMode:", 3);
}

- (int64_t)closeBoxTypeForIconView:(id)a3
{
  return 1;
}

- (id)iconDragManager:(id)a3 dragItemsForIconView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (-[PRWidgetGridViewController isFocused](self, "isFocused"))
  {
    objc_msgSend(v5, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SBHIconDragItemWithIconAndIconView();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)iconDragManager:(id)a3 canAddDragItemsToSession:(id)a4 fromIconView:(id)a5
{
  return 0;
}

- (id)iconDragManager:(id)a3 targetedDragPreviewForIconView:(id)a4 item:(id)a5 session:(id)a6 previewParameters:(id)a7
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  PRComplicationDragPreviewView *v20;
  void *v21;
  PRComplicationDragPreviewView *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  __int128 v33;
  void *v34;
  _OWORD v36[3];

  v8 = a4;
  -[PRWidgetGridViewController model](self, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "icon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leafIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "complicationDescriptorForIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v8, "customIconImageViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    v15 = v13;
    if (v14)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
    }
    else
    {
      v16 = 0;
    }
    v18 = v16;

    objc_msgSend(v18, "widgetHostViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = [PRComplicationDragPreviewView alloc];
    objc_msgSend(v19, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[PRComplicationDragPreviewView initWithWidgetHostView:](v20, "initWithWidgetHostView:", v21);

    v23 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBackgroundColor:", v24);

    v25 = objc_alloc_init(MEMORY[0x1E0DC3508]);
    objc_msgSend(v23, "setShadowPath:", v25);

    objc_msgSend(v8, "customIconImageViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "frame");
    BSRectGetCenter();
    v29 = v28;
    v31 = v30;

    v32 = objc_alloc(MEMORY[0x1E0DC3B88]);
    v33 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v36[0] = *MEMORY[0x1E0C9BAA8];
    v36[1] = v33;
    v36[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v34 = (void *)objc_msgSend(v32, "initWithContainer:center:transform:", v8, v36, v29, v31);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D88]), "initWithView:parameters:target:", v22, v23, v34);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)iconCloseBoxTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(a3, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leafIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PRWidgetGridViewController model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "complicationDescriptorForIdentifier:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRWidgetGridViewController model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "removeComplicationDescriptor:", v6);

}

- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a4;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v8;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "invalidate");
}

- (id)rootFolderForIconDragManager:(id)a3
{
  void *v3;
  void *v4;

  -[PRWidgetGridViewController model](self, "model", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootFolder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEditing
{
  return 1;
}

- (BOOL)allowsSnappingIconsToGridForIconDragManager:(id)a3
{
  return 1;
}

- (BOOL)iconDragManager:(id)a3 canSnapIconsToGridInLocation:(id)a4
{
  void *v4;
  BOOL v5;

  -[PRWidgetGridViewController model](self, "model", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type") == 1;

  return v5;
}

- (BOOL)shouldNonDefaultGridSizeClassesUseClusterAnimationForIconDragManager:(id)a3
{
  return 0;
}

- (BOOL)iconDragManager:(id)a3 canMakeIconViewDragRecipient:(id)a4
{
  return 0;
}

- (void)iconDragManager:(id)a3 iconDropSessionDidEnter:(id)a4
{
  self->_alertPresented = 0;
}

- (void)iconDragManager:(id)a3 iconDropSession:(id)a4 didExitIconListView:(id)a5
{
  self->_alertPresented = 1;
}

- (void)iconDragManager:(id)a3 iconDropSession:(id)a4 didEnterIconListView:(id)a5
{
  objc_storeStrong((id *)&self->_destinationListView, a5);
}

- (void)iconDragManager:(id)a3 didPerformIconDrop:(id)a4 withIcons:(id)a5 inIconListView:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  SBIconListView *destinationListView;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a6;
  if (!self->_alertPresented)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if ((objc_msgSend(v9, "containsIcon:", v14) & 1) == 0)
          {
            v15 = objc_opt_class();
            v16 = v14;
            if (v15)
            {
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v17 = v16;
              else
                v17 = 0;
            }
            else
            {
              v17 = 0;
            }
            v18 = v17;

            -[PRWidgetGridViewController _descriptorFromWidgetIcon:](self, "_descriptorFromWidgetIcon:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            -[PRWidgetGridViewController delegate](self, "delegate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "widgetGridViewController:isAttemptingDragToAddComplication:", self, v19);

          }
        }
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }
    self->_alertPresented = 1;
    destinationListView = self->_destinationListView;
    self->_destinationListView = 0;

  }
}

- (void)iconDragManager:(id)a3 didEndDragOriginatingFromIconView:(id)a4 userDidBeginDrag:(BOOL)a5 lastUserInteractionDate:(id)a6
{
  id v9;
  id v10;
  SBIconListView *destinationListView;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  SBIconListView *v21;
  id v22;

  v22 = a3;
  v9 = a4;
  v10 = a6;
  if (!self->_alertPresented)
  {
    destinationListView = self->_destinationListView;
    if (destinationListView)
    {
      objc_msgSend(v9, "icon");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SBIconListView containsIcon:](destinationListView, "containsIcon:", v12);

      if ((v13 & 1) == 0)
      {
        objc_msgSend(v9, "icon");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_opt_class();
        v16 = v14;
        if (v15)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v17 = v16;
          else
            v17 = 0;
        }
        else
        {
          v17 = 0;
        }
        v18 = v17;

        -[PRWidgetGridViewController _descriptorFromWidgetIcon:](self, "_descriptorFromWidgetIcon:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        -[PRWidgetGridViewController delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "widgetGridViewController:isAttemptingDragToAddComplication:", self, v19);

      }
      self->_alertPresented = 1;
      v21 = self->_destinationListView;
      self->_destinationListView = 0;

    }
  }

}

- (unint64_t)iconDragManager:(id)a3 willMoveDragPlaceholderToGridCellIndex:(unint64_t)a4 inIconListView:(id)a5 draggedIcons:(id)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  unsigned __int16 v30;

  v9 = a5;
  v10 = a6;
  -[PRWidgetGridViewController model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "type");

  if (!v12)
  {
    objc_msgSend(v10, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_class();
    v16 = v14;
    if (v15)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
    }
    else
    {
      v17 = 0;
    }
    v18 = v17;

    objc_msgSend(v18, "gridSizeClass");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = PRWidgetFamilyForIconGridSizeClass(v19);

    objc_msgSend(v9, "icons");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "containsObject:", v18);

    objc_msgSend(v9, "icons");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bs_filter:", &__block_literal_global_20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v20 == 11)
    {
      if (v25 == v22)
        a4 = 0;
    }
    else
    {
      objc_msgSend(v9, "icons");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bs_filter:", &__block_literal_global_48);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count");

      objc_msgSend(v9, "model");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "gridSize");

      if (v25)
      {
        if (v28 == v22)
        {
          a4 = v30 - 1;
        }
        else if (!a4)
        {
          a4 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
    }
  }

  return a4;
}

BOOL __113__PRWidgetGridViewController_iconDragManager_willMoveDragPlaceholderToGridCellIndex_inIconListView_draggedIcons___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "gridSizeClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = PRWidgetFamilyForIconGridSizeClass(v7);
  return v8 == 11;
}

BOOL __113__PRWidgetGridViewController_iconDragManager_willMoveDragPlaceholderToGridCellIndex_inIconListView_draggedIcons___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "gridSizeClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = PRWidgetFamilyForIconGridSizeClass(v7);
  return v8 == 10;
}

- (id)_descriptorFromWidgetIcon:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PRComplicationDescriptor *v12;
  void *v13;
  void *v14;
  PRComplicationDescriptor *v15;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "activeWidget");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "gridSizeClass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = PRWidgetFamilyForIconGridSizeClass(v5);
    v7 = objc_alloc(MEMORY[0x1E0D10148]);
    objc_msgSend(v4, "extensionBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "containerBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "kind");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:family:intent:", v8, v9, v10, v6, 0);

    v12 = [PRComplicationDescriptor alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PRComplicationDescriptor initWithUniqueIdentifier:widget:](v12, "initWithUniqueIdentifier:widget:", v14, v11);

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (BOOL)containsIconsInRow:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int16 v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;

  -[PRWidgetGridViewController listView](self, "listView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "gridCellInfoWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "gridSize");
  v8 = v7;
  if (v7)
  {
    v9 = v7 * a3;
    if (objc_msgSend(v6, "iconIndexForGridCellIndex:", v9) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = 1;
      do
      {
        v11 = v10;
        if (v8 == v10)
          break;
        v12 = objc_msgSend(v6, "iconIndexForGridCellIndex:", v9 + v10);
        v10 = v11 + 1;
      }
      while (v12 == 0x7FFFFFFFFFFFFFFFLL);
      v13 = v11 < v8;
    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (PRWidgetGridModel)model
{
  return self->_model;
}

- (BOOL)isFocused
{
  return self->_focused;
}

- (SBIconDragManager)dragManager
{
  return self->_dragManager;
}

- (void)setDragManager:(id)a3
{
  objc_storeStrong((id *)&self->_dragManager, a3);
}

- (BOOL)requiresFocusForLaunchRequests
{
  return self->_requiresFocusForLaunchRequests;
}

- (void)setRequiresFocusForLaunchRequests:(BOOL)a3
{
  self->_requiresFocusForLaunchRequests = a3;
}

- (BOOL)isWidgetInteractionDisabled
{
  return self->_widgetInteractionDisabled;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (PRWidgetGridViewControllerDelegate)delegate
{
  return (PRWidgetGridViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBIconListView)listView
{
  return self->_listView;
}

- (void)setListView:(id)a3
{
  objc_storeStrong((id *)&self->_listView, a3);
}

- (SBIconViewProviding)iconViewProvider
{
  return (SBIconViewProviding *)objc_loadWeakRetained((id *)&self->_iconViewProvider);
}

- (void)setIconViewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_iconViewProvider, a3);
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (SBHIconGridSize)gridSize
{
  return self->_gridSize;
}

- (void)setGridSize:(SBHIconGridSize)a3
{
  self->_gridSize = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_listView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_dragManager, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_destinationListView, 0);
  objc_storeStrong((id *)&self->_recycledViewsContainerView, 0);
  objc_storeStrong((id *)&self->_iconViewMap, 0);
}

void __66__PRWidgetGridViewController_ensureContentWithTimeout_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_0_3(&dword_18B634000, a3, (uint64_t)a3, "Error loading content for host view controller %@ - %@", (uint8_t *)&v4);
}

- (void)customImageViewControllerForIconView:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "extensionIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_0_3(&dword_18B634000, a2, v7, "Default intent asked for but not provided: %@ - %@", (uint8_t *)&v8);

}

void __67__PRWidgetGridViewController_customImageViewControllerForIconView___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "extensionIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v7;
  v11 = 2112;
  v12 = v8;
  v13 = 2112;
  v14 = a2;
  _os_log_error_impl(&dword_18B634000, a3, OS_LOG_TYPE_ERROR, "Error loading %@ - %@: %@", (uint8_t *)&v9, 0x20u);

}

@end
