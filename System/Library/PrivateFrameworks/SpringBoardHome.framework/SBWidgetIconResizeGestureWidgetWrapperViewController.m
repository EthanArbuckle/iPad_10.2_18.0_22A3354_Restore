@implementation SBWidgetIconResizeGestureWidgetWrapperViewController

- (SBWidgetIconResizeGestureWidgetWrapperViewController)initWithWidgetViewController:(id)a3
{
  id v5;
  SBWidgetIconResizeGestureWidgetWrapperViewController *v6;
  SBWidgetIconResizeGestureWidgetWrapperViewController *v7;

  v5 = a3;
  v6 = -[SBWidgetIconResizeGestureWidgetWrapperViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_widgetViewController, a3);
    objc_msgSend(v5, "addObserver:", v7);
  }

  return v7;
}

- (void)loadView
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  _QWORD v40[4];
  _QWORD v41[6];

  v41[4] = *MEMORY[0x1E0C80C00];
  -[SBWidgetIconResizeGestureWidgetWrapperViewController widgetViewController](self, "widgetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconImageInfo");
  v4 = v3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, v5, v6);
  v39 = v2;
  if (objc_msgSend(v2, "wantsSystemMaterialBackground"))
  {
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "_setContinuousCornerRadius:", v4);
    objc_msgSend(v7, "addSubview:", v8);
    objc_msgSend(v7, "sendSubviewToBack:", v8);
    v26 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v7, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v34);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v32;
    objc_msgSend(v7, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v25;
    objc_msgSend(v7, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = v11;
    objc_msgSend(v7, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v41[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v15);

  }
  objc_msgSend(v39, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "addSubview:", v16);
  v27 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v7, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v35);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v33;
  objc_msgSend(v7, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v29);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v17;
  objc_msgSend(v7, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v20;
  objc_msgSend(v7, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v24);

  -[SBWidgetIconResizeGestureWidgetWrapperViewController setView:](self, "setView:", v7);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBWidgetIconResizeGestureWidgetWrapperViewController;
  -[SBWidgetIconResizeGestureWidgetWrapperViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[SBWidgetIconResizeGestureWidgetWrapperViewController widgetViewController](self, "widgetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetIconResizeGestureWidgetWrapperViewController bs_addChildViewController:](self, "bs_addChildViewController:", v3);

}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (BOOL)isContentReady
{
  void *v2;
  char v3;

  -[SBWidgetIconResizeGestureWidgetWrapperViewController widgetViewController](self, "widgetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isContentReady");

  return v3;
}

- (void)invalidate
{
  void *v2;
  char isKindOfClass;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[SBWidgetIconResizeGestureWidgetWrapperViewController widgetViewController](self, "widgetViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  v4 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "widgetViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_isKindOfClass();

    if ((v7 & 1) != 0)
      objc_msgSend(v5, "invalidate");

    v4 = v8;
  }

}

- (void)widgetContainerViewControllerInitialWidgetContentReadinessChanged:(id)a3 widgetContentIsReady:(BOOL)a4
{
  void *v5;
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
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", a3, a4, 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "widgetIconResizeViewControllerDidChangeContentReadiness:", self);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (SBHWidgetContainerViewController)widgetViewController
{
  return self->_widgetViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetViewController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
