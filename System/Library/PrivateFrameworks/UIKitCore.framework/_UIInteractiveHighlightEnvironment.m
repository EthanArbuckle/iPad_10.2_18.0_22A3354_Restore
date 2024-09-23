@implementation _UIInteractiveHighlightEnvironment

- (_UIInteractiveHighlightEnvironment)initWithContainerView:(id)a3
{
  id v5;
  _UIInteractiveHighlightEnvironment *v6;
  _UIInteractiveHighlightEnvironment *v7;
  _UIInteractiveHighlightEnvironment *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIInteractiveHighlightEnvironment;
  v6 = -[_UIInteractiveHighlightEnvironment init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_containerView, a3);
    objc_setAssociatedObject(v7->_containerView, &_UIInteractiveHighlightingEnvironmentProperty, v7, 0);
    -[_UIInteractiveHighlightEnvironment setUserInteractionOnContainerEnabled:](v7, "setUserInteractionOnContainerEnabled:", 0);
    v8 = v7;
  }

  return v7;
}

- (_UIInteractiveHighlightEnvironment)initWithContainerScreen:(id)a3
{
  id v4;
  _UIInteractiveHighlightEnvironment *v5;
  _UIInteractiveHighlightEnvironment *v6;
  _UIInteractiveHighlightEnvironment *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIInteractiveHighlightEnvironment;
  v5 = -[_UIInteractiveHighlightEnvironment init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_containerScreen, v4);
    -[_UIInteractiveHighlightEnvironment initContainerWindowIfNeeded](v6, "initContainerWindowIfNeeded");
    -[_UIInteractiveHighlightEnvironment setUserInteractionOnContainerEnabled:](v6, "setUserInteractionOnContainerEnabled:", 0);
    v7 = v6;
  }

  return v6;
}

- (_UIInteractiveHighlightEnvironment)initWithParentEnvironment:(id)a3
{
  id *v5;
  id WeakRetained;
  void *v7;
  _UIInteractiveHighlightEnvironment *v8;
  _UIInteractiveHighlightEnvironment *v9;
  void *v11;
  void *v12;

  v5 = (id *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIInteractiveHighlightEnvironment.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentEnvironment"));

  }
  WeakRetained = objc_loadWeakRetained(v5 + 12);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIInteractiveHighlightEnvironment.m"), 137, CFSTR("Cannot override a child environment."));

  }
  objc_msgSend(v5, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_UIInteractiveHighlightEnvironment initWithContainerView:](self, "initWithContainerView:", v7);
  if (v8)
  {
    objc_storeWeak(v5 + 12, v8);
    v9 = v8;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  objc_setAssociatedObject(self->_containerView, &_UIInteractiveHighlightingEnvironmentProperty, 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)_UIInteractiveHighlightEnvironment;
  -[_UIInteractiveHighlightEnvironment dealloc](&v3, sel_dealloc);
}

- (UIView)contentView
{
  -[_UIInteractiveHighlightEnvironment initContainerWindowIfNeeded](self, "initContainerWindowIfNeeded");
  -[_UIInteractiveHighlightEnvironment initContentViewIfNeeded](self, "initContentViewIfNeeded");
  return self->_contentView;
}

- (UIView)contentClipView
{
  return self->_contentClipView;
}

- (id)interactiveHighlightEffectForView:(id)a3 options:(unint64_t)a4
{
  id v7;
  void *v8;
  _UIInteractiveHighlightEffect *v9;
  int64_t v10;
  id v11;
  NSArray *v12;
  NSArray *viewRecords;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  v7 = a3;
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIInteractiveHighlightEnvironment.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view.window"));

  }
  if (!self->_viewRecords)
    self->_viewRecords = (NSArray *)MEMORY[0x1E0C9AA60];
  v9 = objc_alloc_init(_UIInteractiveHighlightEffect);
  v10 = -[_UIInteractiveHighlightEnvironment indexOfViewRecordForView:](self, "indexOfViewRecordForView:", v7);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = -[_UIInteractiveHighlightEnvironment newViewRecordForView:options:](self, "newViewRecordForView:options:", v7, a4);
    -[NSArray arrayByAddingObject:](self->_viewRecords, "arrayByAddingObject:", v11);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    viewRecords = self->_viewRecords;
    self->_viewRecords = v12;

  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_viewRecords, "objectAtIndexedSubscript:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[_UIInteractiveHighlightEffect setView:](v9, "setView:", v7);
  objc_msgSend(v11, "effectView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIInteractiveHighlightEffect setEffectView:](v9, "setEffectView:", v14);

  objc_msgSend(v11, "portalView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIInteractiveHighlightEffect setPortalView:](v9, "setPortalView:", v15);

  objc_msgSend(v11, "superview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIInteractiveHighlightEffect setSuperview:](v9, "setSuperview:", v16);

  -[_UIInteractiveHighlightEffect setEnvironment:](v9, "setEnvironment:", self);
  objc_msgSend(v11, "interactiveHighlightEffects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v9);

  return v9;
}

- (void)applyBackgroundEffectWithMagnitude:(double)a3 interactive:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  UIView *v9;
  UIView *v10;
  UIView *containerView;
  UIView *v12;
  UIViewPropertyAnimator *v13;
  UIViewPropertyAnimator *backgroundEffectAnimator;
  UIViewFloatAnimatableProperty *backgroundEffectProgress;
  UIViewFloatAnimatableProperty *v16;
  UIViewFloatAnimatableProperty *v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  NSUUID *v23;
  NSUUID *backgroundAnimationIdentifier;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  BOOL v30;
  _QWORD v31[4];
  id v32[2];
  _QWORD v33[5];
  id v34;
  id location;
  _QWORD v36[2];

  v5 = a4;
  v36[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[_UIInteractiveHighlightEnvironment initContainerWindowIfNeeded](self, "initContainerWindowIfNeeded");
  -[_UIInteractiveHighlightEnvironment initBackgroundEffectViewIfNeeded](self, "initBackgroundEffectViewIfNeeded");
  v9 = self->_customBackgroundEffectView;
  -[UIView superview](v9, "superview");
  v10 = (UIView *)objc_claimAutoreleasedReturnValue();
  containerView = self->_containerView;

  if (v10 != containerView)
  {
    -[UIView bounds](self->_containerView, "bounds");
    -[UIView setFrame:](v9, "setFrame:");
    -[UIView setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
    v12 = self->_containerView;
    if (self->_contentView)
      -[UIView insertSubview:belowSubview:](v12, "insertSubview:belowSubview:", v9);
    else
      -[UIView addSubview:](v12, "addSubview:", v9);
  }
  if (!((unint64_t)self->_backgroundEffectAnimator | (unint64_t)v9))
  {
    v13 = -[_UIInteractiveHighlightEnvironment newBackgroundEffectAnimator](self, "newBackgroundEffectAnimator");
    backgroundEffectAnimator = self->_backgroundEffectAnimator;
    self->_backgroundEffectAnimator = v13;

  }
  backgroundEffectProgress = self->_backgroundEffectProgress;
  if (!backgroundEffectProgress)
  {
    v16 = objc_alloc_init(UIViewFloatAnimatableProperty);
    v17 = self->_backgroundEffectProgress;
    self->_backgroundEffectProgress = v16;

    backgroundEffectProgress = self->_backgroundEffectProgress;
  }
  objc_initWeak(&location, backgroundEffectProgress);
  v36[0] = self->_backgroundEffectProgress;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __96___UIInteractiveHighlightEnvironment_applyBackgroundEffectWithMagnitude_interactive_completion___block_invoke;
  v33[3] = &unk_1E16B1500;
  objc_copyWeak(&v34, &location);
  v33[4] = self;
  +[UIView _createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:](UIView, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v18, v33);

  if (v5)
    v20 = 600.0;
  else
    v20 = 500.0;
  if (v5)
    v21 = a3 * 60.0 + (1.0 - a3) * 50.0;
  else
    v21 = a3 * 60.0 + (1.0 - a3) * 50.0 + 10.0;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (NSUUID *)objc_msgSend(v22, "copy");
  backgroundAnimationIdentifier = self->_backgroundAnimationIdentifier;
  self->_backgroundAnimationIdentifier = v23;

  v31[0] = v19;
  v31[1] = 3221225472;
  v31[2] = __96___UIInteractiveHighlightEnvironment_applyBackgroundEffectWithMagnitude_interactive_completion___block_invoke_2;
  v31[3] = &unk_1E16C0530;
  objc_copyWeak(v32, &location);
  v32[1] = *(id *)&a3;
  v27[0] = v19;
  v27[1] = 3221225472;
  v27[2] = __96___UIInteractiveHighlightEnvironment_applyBackgroundEffectWithMagnitude_interactive_completion___block_invoke_3;
  v27[3] = &unk_1E16DA940;
  v30 = v5;
  v27[4] = self;
  v25 = v22;
  v28 = v25;
  v26 = v8;
  v29 = v26;
  +[UIView _animateUsingSpringWithTension:friction:interactive:animations:completion:](UIView, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v31, v27, v20, v21);
  -[UIWindow setHidden:](self->_containerWindow, "setHidden:", 0);
  -[_UIInteractiveHighlightEnvironment setUserInteractionOnContainerEnabled:](self, "setUserInteractionOnContainerEnabled:", v5);

  objc_destroyWeak(v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

}

- (void)removeInteractiveHighlightEffect:(id)a3
{
  id v4;
  NSArray *v5;
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
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_viewRecords;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "interactiveHighlightEffects", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObject:", v4);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[_UIInteractiveHighlightEnvironment removeViewRecordsIfNeeded](self, "removeViewRecordsIfNeeded");
}

- (void)setUserInteractionOnContainerEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _UIInteractiveHighlightEffectWindow *containerWindow;
  id v6;

  v3 = a3;
  containerWindow = self->_containerWindow;
  if (containerWindow)
  {
    -[UIView setUserInteractionEnabled:](containerWindow, "setUserInteractionEnabled:", a3);
    -[UIView layer](self->_containerWindow, "layer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsHitTesting:", v3);

  }
  else
  {
    -[UIView setUserInteractionEnabled:](self->_contentView, "setUserInteractionEnabled:", a3);
  }
}

- (void)disableClippingForView:(id)a3 ancestorView:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(v8, "setClipsToBounds:", 0);
  if (v8 != v6)
  {
    objc_msgSend(v8, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIInteractiveHighlightEnvironment disableClippingForView:ancestorView:](self, "disableClippingForView:ancestorView:", v7, v6);

  }
}

- (BOOL)isHidden
{
  _UIInteractiveHighlightEffectWindow *containerWindow;

  containerWindow = self->_containerWindow;
  return !containerWindow || -[UIView isHidden](containerWindow, "isHidden");
}

- (void)setHidden:(BOOL)a3
{
  -[_UIInteractiveHighlightEnvironment setHidden:animated:completion:](self, "setHidden:animated:completion:", a3, 0, 0);
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  _UIInteractiveHighlightEffectWindow *containerWindow;
  _QWORD v10[5];
  id v11;
  BOOL v12;
  _QWORD v13[5];
  BOOL v14;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  containerWindow = self->_containerWindow;
  if (v5)
  {
    if (-[UIView isHidden](containerWindow, "isHidden") && !v6)
    {
      -[UIView setAlpha:](self->_containerWindow, "setAlpha:", 0.0);
      -[UIWindow setHidden:](self->_containerWindow, "setHidden:", 0);
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68___UIInteractiveHighlightEnvironment_setHidden_animated_completion___block_invoke;
    v13[3] = &unk_1E16B1B78;
    v13[4] = self;
    v14 = v6;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68___UIInteractiveHighlightEnvironment_setHidden_animated_completion___block_invoke_2;
    v10[3] = &unk_1E16DA968;
    v10[4] = self;
    v12 = v6;
    v11 = v8;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v13, v10, 0.3, 0.0);

  }
  else
  {
    -[UIWindow setHidden:](containerWindow, "setHidden:", v6);
    -[UIView setAlpha:](self->_containerWindow, "setAlpha:", 1.0);
    if (v8)
      (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, 1, 0);
  }

}

- (void)reset
{
  -[_UIInteractiveHighlightEnvironment finalizeBackgroundEffect](self, "finalizeBackgroundEffect");
  -[_UIInteractiveHighlightEnvironment removeAllViewRecords](self, "removeAllViewRecords");
  -[_UIInteractiveHighlightEnvironment setUserInteractionOnContainerEnabled:](self, "setUserInteractionOnContainerEnabled:", 0);
  -[_UIInteractiveHighlightEnvironment setHidden:](self, "setHidden:", 0);
}

- (void)applyContentInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[UIView superview](self->_contentClipView, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[UIView setFrame:](self->_contentClipView, "setFrame:", left + v10, top + v12, v14 - (left + right), v16 - (top + bottom));
}

- (id)newViewRecordForView:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v6;
  _UIPortalView *v7;
  UIView *v8;
  UIView *v9;
  void *v10;
  UIVisualEffectView *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  _UIInteractiveHighlightViewRecord *v24;
  void *v25;

  v4 = a4;
  v6 = a3;
  -[_UIInteractiveHighlightEnvironment initContainerWindowIfNeeded](self, "initContainerWindowIfNeeded");
  -[_UIInteractiveHighlightEnvironment initContentViewIfNeeded](self, "initContentViewIfNeeded");
  if ((v4 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v7 = objc_alloc_init(_UIPortalView);
    -[_UIPortalView setHidesSourceView:](v7, "setHidesSourceView:", 1);
    -[_UIPortalView setMatchesPosition:](v7, "setMatchesPosition:", 1);
    -[_UIPortalView setMatchesTransform:](v7, "setMatchesTransform:", 0);
    -[_UIPortalView setMatchesAlpha:](v7, "setMatchesAlpha:", 1);
    -[_UIPortalView setAllowsBackdropGroups:](v7, "setAllowsBackdropGroups:", 1);
    -[_UIPortalView setSourceView:](v7, "setSourceView:", v6);
  }
  v8 = self->_contentClipView;
  if ((v4 & 2) != 0)
  {
    v9 = self->_contentOverlayView;

    v8 = v9;
  }
  objc_msgSend(v6, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", 0);
  objc_msgSend(v6, "bounds");
  objc_msgSend(v6, "convertRect:toView:", v8);
  -[UIView setFrame:](v11, "setFrame:");
  if (v7)
  {
    -[UIVisualEffectView contentView](v11, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v7);

    -[UIVisualEffectView contentView](v11, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    -[_UIPortalView setFrame:](v7, "setFrame:");

    -[UIView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
  }
  else if ((v4 & 1) != 0)
  {
    objc_msgSend(v6, "frame");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[UIVisualEffectView contentView](v11, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v6);

    -[UIVisualEffectView contentView](v11, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "convertRect:fromCoordinateSpace:", v10, v15, v17, v19, v21);
    objc_msgSend(v6, "setFrame:");

  }
  -[UIView addSubview:](v8, "addSubview:", v11);
  v24 = objc_alloc_init(_UIInteractiveHighlightViewRecord);
  -[_UIInteractiveHighlightViewRecord setView:](v24, "setView:", v6);
  -[_UIInteractiveHighlightViewRecord setEffectView:](v24, "setEffectView:", v11);
  -[_UIInteractiveHighlightViewRecord setPortalView:](v24, "setPortalView:", v7);
  if ((v4 & 1) != 0)
  {
    -[_UIInteractiveHighlightViewRecord setSuperview:](v24, "setSuperview:", v10);
  }
  else
  {
    -[UIView setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", 0);
    -[_UIInteractiveHighlightEnvironment disableClippingForView:ancestorView:](self, "disableClippingForView:ancestorView:", v7, v11);
  }
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIInteractiveHighlightViewRecord setInteractiveHighlightEffects:](v24, "setInteractiveHighlightEffects:", v25);

  return v24;
}

- (int64_t)indexOfViewRecordForView:(id)a3
{
  id v4;
  NSArray *viewRecords;
  id v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  viewRecords = self->_viewRecords;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63___UIInteractiveHighlightEnvironment_indexOfViewRecordForView___block_invoke;
  v9[3] = &unk_1E16DA990;
  v10 = v4;
  v6 = v4;
  v7 = -[NSArray indexOfObjectPassingTest:](viewRecords, "indexOfObjectPassingTest:", v9);

  return v7;
}

- (void)removeViewRecordsIfNeeded
{
  NSArray *viewRecords;
  NSArray *v4;
  NSArray *v5;
  id v6;
  _QWORD v7[5];

  -[NSArray indexesOfObjectsPassingTest:](self->_viewRecords, "indexesOfObjectsPassingTest:", &__block_literal_global_413);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  viewRecords = self->_viewRecords;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63___UIInteractiveHighlightEnvironment_removeViewRecordsIfNeeded__block_invoke_2;
  v7[3] = &unk_1E16DA9D8;
  v7[4] = self;
  -[NSArray enumerateObjectsAtIndexes:options:usingBlock:](viewRecords, "enumerateObjectsAtIndexes:options:usingBlock:", v6, 0, v7);
  v4 = (NSArray *)-[NSArray mutableCopy](self->_viewRecords, "mutableCopy");
  -[NSArray removeObjectsAtIndexes:](v4, "removeObjectsAtIndexes:", v6);
  v5 = self->_viewRecords;
  self->_viewRecords = v4;

  -[_UIInteractiveHighlightEnvironment finalizeContentViewIfNeeded](self, "finalizeContentViewIfNeeded");
  -[_UIInteractiveHighlightEnvironment finalizeContainerWindowIfNeeded](self, "finalizeContainerWindowIfNeeded");

}

- (void)removeAllViewRecords
{
  NSArray *viewRecords;
  NSArray *v4;
  NSArray *v5;
  _QWORD v6[5];

  viewRecords = self->_viewRecords;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58___UIInteractiveHighlightEnvironment_removeAllViewRecords__block_invoke;
  v6[3] = &unk_1E16DA9D8;
  v6[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](viewRecords, "enumerateObjectsUsingBlock:", v6);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v5 = self->_viewRecords;
  self->_viewRecords = v4;

  -[_UIInteractiveHighlightEnvironment finalizeContentViewIfNeeded](self, "finalizeContentViewIfNeeded");
  -[_UIInteractiveHighlightEnvironment finalizeContainerWindowIfNeeded](self, "finalizeContainerWindowIfNeeded");
}

- (void)finalizeViewRecord:(id)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  objc_msgSend(v28, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v28, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIInteractiveHighlightEnvironment.m"), 437, CFSTR("Cannot transfer ownership of an already deallocated view."));

    }
    objc_msgSend(v6, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v6, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "convertRect:fromCoordinateSpace:", v15, v8, v10, v12, v14);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    objc_msgSend(v5, "addSubview:", v6);
    objc_msgSend(v6, "setFrame:", v17, v19, v21, v23);
  }
  else
  {
    objc_msgSend(v28, "portalView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHidesSourceView:", 0);

    objc_msgSend(v28, "portalView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sourceView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setNeedsLayout");

  }
  objc_msgSend(v28, "effectView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "removeFromSuperview");

}

- (void)initContainerWindowIfNeeded
{
  id WeakRetained;
  _UIInteractiveHighlightEffectWindow *v4;
  UIViewController *v5;
  void *v6;
  void *v7;
  UIView *v8;
  UIView *containerView;
  _UIInteractiveHighlightEffectWindow *containerWindow;

  if (!self->_containerWindow)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerScreen);

    if (WeakRetained)
    {
      v4 = objc_alloc_init(_UIInteractiveHighlightEffectWindow);
      -[UIWindow _setWindowControlsStatusBarOrientation:](v4, "_setWindowControlsStatusBarOrientation:", 0);
      v5 = objc_alloc_init(UIViewController);
      -[UIWindow setRootViewController:](v4, "setRootViewController:", v5);

      +[UIColor clearColor](UIColor, "clearColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v6);

      -[UIView setOpaque:](v4, "setOpaque:", 0);
      -[UIWindow setWindowLevel:](v4, "setWindowLevel:", 10000001.0);
      -[UIWindow rootViewController](v4, "rootViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "view");
      v8 = (UIView *)objc_claimAutoreleasedReturnValue();
      containerView = self->_containerView;
      self->_containerView = v8;

      objc_setAssociatedObject(self->_containerView, &_UIInteractiveHighlightingEnvironmentProperty, self, 0);
      containerWindow = self->_containerWindow;
      self->_containerWindow = v4;

    }
  }
}

- (void)initBackgroundEffectViewIfNeeded
{
  _UIInteractiveHighlightBackgroundEffectView *v3;
  UIView *containerView;
  UIVisualEffectView *backgroundEffectView;

  if (!self->_customBackgroundEffectView && !self->_backgroundEffectView)
  {
    v3 = -[UIVisualEffectView initWithEffect:]([_UIInteractiveHighlightBackgroundEffectView alloc], "initWithEffect:", 0);
    -[UIView bounds](self->_containerView, "bounds");
    -[UIView setFrame:](v3, "setFrame:");
    -[UIView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    containerView = self->_containerView;
    if (self->_contentView)
      -[UIView insertSubview:belowSubview:](containerView, "insertSubview:belowSubview:", v3);
    else
      -[UIView addSubview:](containerView, "addSubview:", v3);
    backgroundEffectView = self->_backgroundEffectView;
    self->_backgroundEffectView = &v3->super;

  }
}

- (void)initContentViewIfNeeded
{
  _UIInteractiveHighlightContentView *v3;
  UIView *contentView;
  UIView *v5;
  UIView *contentClipView;
  UIView *v7;
  UIView *contentOverlayView;

  if (!self->_contentView)
  {
    v3 = objc_alloc_init(_UIInteractiveHighlightContentView);
    -[UIView bounds](self->_containerView, "bounds");
    -[UIView setFrame:](v3, "setFrame:");
    -[UIView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[UIView addSubview:](self->_containerView, "addSubview:", v3);
    contentView = self->_contentView;
    self->_contentView = &v3->super;

    v5 = objc_alloc_init(UIView);
    -[UIView bounds](self->_contentView, "bounds");
    -[UIView setFrame:](v5, "setFrame:");
    -[UIView setClipsToBounds:](v5, "setClipsToBounds:", 1);
    -[UIView addSubview:](self->_contentView, "addSubview:", v5);
    contentClipView = self->_contentClipView;
    self->_contentClipView = v5;

    v7 = objc_alloc_init(UIView);
    -[UIView bounds](self->_contentView, "bounds");
    -[UIView setFrame:](v7, "setFrame:");
    -[UIView setClipsToBounds:](v7, "setClipsToBounds:", 0);
    -[UIView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
    -[UIView addSubview:](self->_contentView, "addSubview:", v7);
    contentOverlayView = self->_contentOverlayView;
    self->_contentOverlayView = v7;

  }
}

- (id)newBackgroundEffectAnimator
{
  UIViewPropertyAnimator *v3;
  UICubicTimingParameters *v4;
  UIViewPropertyAnimator *v5;
  void *v8;
  _QWORD v9[5];

  if (!self->_backgroundEffectView)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIInteractiveHighlightEnvironment.m"), 532, CFSTR("Cannot create background animator, effect view is missing."));

  }
  v3 = [UIViewPropertyAnimator alloc];
  v4 = -[UICubicTimingParameters initWithAnimationCurve:]([UICubicTimingParameters alloc], "initWithAnimationCurve:", 3);
  v5 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v3, "initWithDuration:timingParameters:", v4, 1.0);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65___UIInteractiveHighlightEnvironment_newBackgroundEffectAnimator__block_invoke;
  v9[3] = &unk_1E16B1B28;
  v9[4] = self;
  -[UIViewPropertyAnimator addAnimations:](v5, "addAnimations:", v9);
  return v5;
}

- (id)backgroundVisualEffectForProgress:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (a3 <= 0.0)
  {
    v6 = 0;
  }
  else
  {
    if (_AXSEnhanceBackgroundContrastEnabled())
    {
      +[UIColor blackColor](UIColor, "blackColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIVisualEffect effectCompositingColor:withMode:alpha:](UIVisualEffect, "effectCompositingColor:withMode:alpha:", v4, 1, a3 * 0.3 + (1.0 - a3) * 0.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (1.0 - a3) * 0.0;
      +[_UIZoomEffect _underlayZoomEffectWithMagnitude:](_UIZoomEffect, "_underlayZoomEffectWithMagnitude:", a3 * 0.015 + v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v4;
      +[UIColor blackColor](UIColor, "blackColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIVisualEffect effectCompositingColor:withMode:alpha:](UIVisualEffect, "effectCompositingColor:withMode:alpha:", v5, 1, a3 * 0.055 + v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[1] = v8;
      +[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", a3 * 7.0 + v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v6;
}

- (void)finalizeBackgroundEffect
{
  UIViewPropertyAnimator *backgroundEffectAnimator;
  UIViewFloatAnimatableProperty *backgroundEffectProgress;
  id WeakRetained;
  UIVisualEffectView *backgroundEffectView;
  UIView *customBackgroundEffectView;

  -[UIViewPropertyAnimator stopAnimation:](self->_backgroundEffectAnimator, "stopAnimation:", 1);
  if (-[UIViewPropertyAnimator state](self->_backgroundEffectAnimator, "state") == 2)
    -[UIViewPropertyAnimator finishAnimationAtPosition:](self->_backgroundEffectAnimator, "finishAnimationAtPosition:", 1);
  backgroundEffectAnimator = self->_backgroundEffectAnimator;
  self->_backgroundEffectAnimator = 0;

  backgroundEffectProgress = self->_backgroundEffectProgress;
  self->_backgroundEffectProgress = 0;

  -[UIVisualEffectView setBackgroundEffects:](self->_backgroundEffectView, "setBackgroundEffects:", MEMORY[0x1E0C9AA60]);
  if (!self->_containerWindow)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentEnvironment);

    if (!WeakRetained)
    {
      -[UIView removeFromSuperview](self->_backgroundEffectView, "removeFromSuperview");
      backgroundEffectView = self->_backgroundEffectView;
      self->_backgroundEffectView = 0;

      -[UIView removeFromSuperview](self->_customBackgroundEffectView, "removeFromSuperview");
      customBackgroundEffectView = self->_customBackgroundEffectView;
      self->_customBackgroundEffectView = 0;

    }
  }
  -[_UIInteractiveHighlightEnvironment finalizeContainerWindowIfNeeded](self, "finalizeContainerWindowIfNeeded");
}

- (void)finalizeContentViewIfNeeded
{
  UIView *contentView;
  UIView *contentClipView;
  UIView *contentOverlayView;

  if (self->_contentView)
  {
    if (!-[NSArray count](self->_viewRecords, "count"))
    {
      -[UIView removeFromSuperview](self->_contentView, "removeFromSuperview");
      contentView = self->_contentView;
      self->_contentView = 0;

      -[UIView removeFromSuperview](self->_contentClipView, "removeFromSuperview");
      contentClipView = self->_contentClipView;
      self->_contentClipView = 0;

      -[UIView removeFromSuperview](self->_contentOverlayView, "removeFromSuperview");
      contentOverlayView = self->_contentOverlayView;
      self->_contentOverlayView = 0;

      -[_UIInteractiveHighlightEnvironment applyContentInsets:](self, "applyContentInsets:", 0.0, 0.0, 0.0, 0.0);
    }
  }
}

- (void)finalizeContainerWindowIfNeeded
{
  UIView *containerView;
  UIVisualEffectView *backgroundEffectView;
  UIView *customBackgroundEffectView;
  _UIInteractiveHighlightEffectWindow *containerWindow;

  if (self->_containerWindow && !-[NSArray count](self->_viewRecords, "count") && !self->_backgroundEffectProgress)
  {
    -[_UIInteractiveHighlightEnvironment finalizeContentViewIfNeeded](self, "finalizeContentViewIfNeeded");
    containerView = self->_containerView;
    self->_containerView = 0;

    -[UIView removeFromSuperview](self->_backgroundEffectView, "removeFromSuperview");
    backgroundEffectView = self->_backgroundEffectView;
    self->_backgroundEffectView = 0;

    -[UIView removeFromSuperview](self->_customBackgroundEffectView, "removeFromSuperview");
    customBackgroundEffectView = self->_customBackgroundEffectView;
    self->_customBackgroundEffectView = 0;

    -[UIWindow setHidden:](self->_containerWindow, "setHidden:", 1);
    containerWindow = self->_containerWindow;
    self->_containerWindow = 0;

  }
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UIView)customBackgroundEffectView
{
  return self->_customBackgroundEffectView;
}

- (void)setCustomBackgroundEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_customBackgroundEffectView, a3);
}

- (id)backgroundEffectApplyBlock
{
  return self->_backgroundEffectApplyBlock;
}

- (void)setBackgroundEffectApplyBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backgroundEffectApplyBlock, 0);
  objc_storeStrong((id *)&self->_customBackgroundEffectView, 0);
  objc_storeStrong((id *)&self->_backgroundAnimationIdentifier, 0);
  objc_destroyWeak((id *)&self->_childEnvironment);
  objc_destroyWeak((id *)&self->_parentEnvironment);
  objc_storeStrong((id *)&self->_viewRecords, 0);
  objc_storeStrong((id *)&self->_backgroundEffectProgress, 0);
  objc_storeStrong((id *)&self->_backgroundEffectAnimator, 0);
  objc_storeStrong((id *)&self->_contentOverlayView, 0);
  objc_storeStrong((id *)&self->_contentClipView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_containerWindow, 0);
  objc_destroyWeak((id *)&self->_containerScreen);
}

+ (id)requestInteractiveHighlightEnvironmentForView:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  _UIInteractiveHighlightEnvironment *WeakRetained;
  _UIInteractiveHighlightEnvironment *v7;
  id v8;
  _UIInteractiveHighlightEnvironment *v9;
  _UIInteractiveHighlightEnvironment *v10;

  v3 = a3;
  _UIInteractiveHighlightingEnvironmentFromView(v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "_isHostedInAnotherProcess"))
    {
      v8 = v5;
      _UIInteractiveHighlightingEnvironmentFromView(v8);
      v9 = (_UIInteractiveHighlightEnvironment *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        v9 = -[_UIInteractiveHighlightEnvironment initWithContainerView:]([_UIInteractiveHighlightEnvironment alloc], "initWithContainerView:", v8);
      v7 = v9;

    }
    else
    {
      objc_msgSend(v5, "screen");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_interactiveHighlightEnvironment");
      v7 = (_UIInteractiveHighlightEnvironment *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_10;
  }
  v5 = (void *)v4;
  WeakRetained = (_UIInteractiveHighlightEnvironment *)objc_loadWeakRetained((id *)(v4 + 96));
  if (!WeakRetained)
  {
    v7 = -[_UIInteractiveHighlightEnvironment initWithParentEnvironment:]([_UIInteractiveHighlightEnvironment alloc], "initWithParentEnvironment:", v5);
LABEL_10:

    WeakRetained = v7;
    v5 = WeakRetained;
  }
  v10 = WeakRetained;

  return v10;
}

+ (id)interactiveHighlightEnvironmentForContainerView:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIInteractiveHighlightEnvironment.m"), 637, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containerView"));

  }
  objc_getAssociatedObject(v5, &_UIInteractiveHighlightingEnvironmentProperty);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContainerView:", v5);

  return v6;
}

@end
