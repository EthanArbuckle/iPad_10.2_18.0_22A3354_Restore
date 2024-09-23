@implementation PREditorSeparatedRootViewController

- (void)loadView
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
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
  id v27;
  void *v28;
  id v29;
  objc_super v30;
  _QWORD v31[6];

  v31[4] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)PREditorSeparatedRootViewController;
  -[PREditorRootViewController loadView](&v30, sel_loadView);
  -[PREditorSeparatedRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController scrollView](self, "scrollView");
  v4 = objc_claimAutoreleasedReturnValue();
  v29 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[PREditorSeparatedRootViewController setBackgroundForegroundContainerViewsZStackView:](self, "setBackgroundForegroundContainerViewsZStackView:", v29);
  v27 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[PREditorSeparatedRootViewController setFloatingContainerViewsZStackView:](self, "setFloatingContainerViewsZStackView:", v27);
  v5 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  v24 = v5;
  -[PREditorSeparatedRootViewController setLooksDividerView:](self, "setLooksDividerView:", v5);
  v7 = objc_alloc_init(MEMORY[0x1E0D01950]);
  objc_msgSend(v7, "setPagingEnabled:", 1);
  objc_msgSend(v7, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v7, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v7, "setScrollsToTop:", 0);
  objc_msgSend(v7, "setBounces:", 0);
  objc_msgSend(v7, "_setAutoScrollEnabled:", 0);
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHitTestsAsOpaque:", 1);

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PREditorSeparatedRootViewController setTimeContainerScrollView:](self, "setTimeContainerScrollView:", v7);
  -[PREditorRootViewController timeContainerView](self, "timeContainerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v28);
  -[PREditorRootViewController reticleVibrancyView](self, "reticleVibrancyView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewController sidebarReticleVibrancyView](self, "sidebarReticleVibrancyView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)v4;
  objc_msgSend(v3, "insertSubview:belowSubview:", v29, v4);
  objc_msgSend(v3, "insertSubview:belowSubview:", v27, v4);
  objc_msgSend(v3, "insertSubview:belowSubview:", v25, v4);
  objc_msgSend(v3, "insertSubview:belowSubview:", v7, v4);
  objc_msgSend(v3, "insertSubview:belowSubview:", v23, v4);
  objc_msgSend(v3, "insertSubview:aboveSubview:", v5, v4);
  v17 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v7, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v20;
  objc_msgSend(v7, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v16;
  objc_msgSend(v7, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v11;
  objc_msgSend(v7, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v15);

  -[PREditorSeparatedRootViewController _updateCounterRotationLayout](self, "_updateCounterRotationLayout");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PREditorSeparatedRootViewController;
  -[PREditorSeparatedRootViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PREditorSeparatedRootViewController _updateContainerViewFrames](self, "_updateContainerViewFrames");
  -[PREditorSeparatedRootViewController _updateCounterRotationLayout](self, "_updateCounterRotationLayout");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PREditorSeparatedRootViewController;
  -[PREditorRootViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PREditorRootViewController updateReticleViewFrames](self, "updateReticleViewFrames");
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PREditorSeparatedRootViewController;
  -[PREditorSeparatedRootViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[PREditorSeparatedRootViewController _updateCounterRotationLayout](self, "_updateCounterRotationLayout");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  objc_super v9;
  _QWORD v10[7];
  _QWORD v11[5];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[PREditorSeparatedRootViewController _updateContainerViewClipping:](self, "_updateContainerViewClipping:", 0);
  -[PREditorSeparatedRootViewController _updateLooksDividerViewForTransitionToSize:startingTransition:](self, "_updateLooksDividerViewForTransitionToSize:startingTransition:", 1, width, height);
  -[PREditorSeparatedRootViewController timeContainerScrollView](self, "timeContainerScrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClipsToBounds:", 0);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__PREditorSeparatedRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v11[3] = &unk_1E2184798;
  v11[4] = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__PREditorSeparatedRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v10[3] = &unk_1E21848D0;
  v10[4] = self;
  *(double *)&v10[5] = width;
  *(double *)&v10[6] = height;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v11, v10);
  v9.receiver = self;
  v9.super_class = (Class)PREditorSeparatedRootViewController;
  -[PREditorRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

uint64_t __90__PREditorSeparatedRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateContainerViewFrames");
  objc_msgSend(*(id *)(a1 + 32), "updateReticleViewFrames");
  return objc_msgSend(*(id *)(a1 + 32), "_updateCounterRotationLayout");
}

void __90__PREditorSeparatedRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_updateContainerViewClipping:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_updateLooksDividerViewForTransitionToSize:startingTransition:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "timeContainerScrollView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClipsToBounds:", 1);

}

- (void)_updateContainerViewClipping:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__PREditorSeparatedRootViewController__updateContainerViewClipping___block_invoke;
  v3[3] = &__block_descriptor_33_e16_v16__0__UIView_8l;
  v4 = a3;
  -[PREditorSeparatedRootViewController _enumerateContainerViewsWithBlock:](self, "_enumerateContainerViewsWithBlock:", v3);
}

uint64_t __68__PREditorSeparatedRootViewController__updateContainerViewClipping___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setClipsToBounds:", *(unsigned __int8 *)(a1 + 32));
}

- (void)_updateContainerViewFrames
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[8];

  -[PREditorSeparatedRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__PREditorSeparatedRootViewController__updateContainerViewFrames__block_invoke;
  v12[3] = &__block_descriptor_64_e16_v16__0__UIView_8l;
  v12[4] = v5;
  v12[5] = v7;
  v12[6] = v9;
  v12[7] = v11;
  -[PREditorSeparatedRootViewController _enumerateContainerViewsWithBlock:](self, "_enumerateContainerViewsWithBlock:", v12);
}

uint64_t __65__PREditorSeparatedRootViewController__updateContainerViewFrames__block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)_updateCounterRotationLayout
{
  int64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  _QWORD v19[9];

  if (PUIDynamicRotationIsActive())
    v3 = -[PREditorSeparatedRootViewController _windowInterfaceOrientation](self, "_windowInterfaceOrientation");
  else
    v3 = 1;
  -[PREditorSeparatedRootViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  if (PUIDynamicRotationIsActive())
  {
    v13 = v10;
    v14 = v12;
    if ((unint64_t)(v3 - 3) <= 1)
    {
      BSSizeSwap();
      v13 = v15;
      v14 = v16;
    }
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __67__PREditorSeparatedRootViewController__updateCounterRotationLayout__block_invoke;
  v19[3] = &__block_descriptor_72_e16_v16__0__UIView_8l;
  *(double *)&v19[4] = v6;
  *(double *)&v19[5] = v8;
  *(double *)&v19[6] = v10;
  *(double *)&v19[7] = v12;
  v19[8] = v3;
  -[PREditorSeparatedRootViewController _enumerateContainerViewsWithBlock:](self, "_enumerateContainerViewsWithBlock:", v19);
  -[PREditorSeparatedRootViewController backgroundForegroundContainerViewsZStackView](self, "backgroundForegroundContainerViewsZStackView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorSeparatedRootViewController floatingContainerViewsZStackView](self, "floatingContainerViewsZStackView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v6, v8, v13, v14);
  objc_msgSend(v18, "setFrame:", v6, v8, v13, v14);

}

void __67__PREditorSeparatedRootViewController__updateCounterRotationLayout__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "setFrame:", *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(v8, "setContentOrientation:", 1);
  objc_msgSend(v8, "setContainerOrientation:", *(_QWORD *)(a1 + 64));

}

- (void)_updateLooksDividerViewForTransitionToSize:(CGSize)a3 startingTransition:(BOOL)a4
{
  _BOOL4 v4;
  double width;
  void *v7;
  id v8;

  v4 = a4;
  width = a3.width;
  -[PREditorSeparatedRootViewController looksDividerView](self, "looksDividerView", a3.width, a3.height);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PREditorRootViewController scrollView](self, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isDragging") & 1) == 0)
    {
      objc_msgSend(v8, "setHidden:", 1);
      objc_msgSend(v8, "frame");
      objc_msgSend(v8, "setFrame:", width);
    }

  }
  else
  {
    objc_msgSend(v8, "setHidden:", 0);
  }

}

- (int64_t)_windowInterfaceOrientation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  int64_t v7;

  -[PREditorSeparatedRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)-[PREditorSeparatedRootViewController performSelector:](self, "performSelector:", sel__window);
  v6 = v4;

  v7 = objc_msgSend(v6, "_windowInterfaceOrientation");
  return v7;
}

- (void)_enumerateContainerViewsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  -[PREditorSeparatedRootViewController backgroundForegroundContainerViewsZStackView](self, "backgroundForegroundContainerViewsZStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PREditorSeparatedRootViewController floatingContainerViewsZStackView](self, "floatingContainerViewsZStackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v11);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = v8;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18++));
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

}

- (void)looksWillChange
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)PREditorSeparatedRootViewController;
  -[PREditorRootViewController looksWillChange](&v13, sel_looksWillChange);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_viewsForLook;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->_viewsForLook, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "enumerateViewsUsingBlock:", &__block_literal_global_1319);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_viewsForLook, "removeAllObjects");
  -[PREditorSeparatedRootViewController _enumerateContainerViewsWithBlock:](self, "_enumerateContainerViewsWithBlock:", &__block_literal_global_1320);
}

uint64_t __54__PREditorSeparatedRootViewController_looksWillChange__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

uint64_t __54__PREditorSeparatedRootViewController_looksWillChange__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

- (void)looksDidChange
{
  NSMutableDictionary *v3;
  NSMutableDictionary *viewsForLook;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PREditorLookViews *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)PREditorSeparatedRootViewController;
  -[PREditorRootViewController looksDidChange](&v42, sel_looksDidChange);
  if (!self->_viewsForLook)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    viewsForLook = self->_viewsForLook;
    self->_viewsForLook = v3;

  }
  -[PREditorSeparatedRootViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorSeparatedRootViewController backgroundForegroundContainerViewsZStackView](self, "backgroundForegroundContainerViewsZStackView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorSeparatedRootViewController floatingContainerViewsZStackView](self, "floatingContainerViewsZStackView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v27 = v5;
  v31 = objc_msgSend(v5, "effectiveUserInterfaceLayoutDirection");
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[PREditorRootViewController looks](self, "looks");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v34)
  {
    v14 = 0;
    v30 = *(_QWORD *)v39;
    do
    {
      v15 = 0;
      v28 = v14;
      v16 = -v14;
      do
      {
        if (*(_QWORD *)v39 != v30)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v15);
        __53__PREditorSeparatedRootViewController_looksDidChange__block_invoke(v7, v9, v11, v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        __53__PREditorSeparatedRootViewController_looksDidChange__block_invoke(v7, v9, v11, v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "subviews");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "subviews");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "firstObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = objc_alloc_init(PREditorLookViews);
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __53__PREditorSeparatedRootViewController_looksDidChange__block_invoke_2;
        v35[3] = &unk_1E21849D8;
        v36 = v23;
        v37 = v21;
        v25 = v21;
        v26 = v23;
        -[PREditorLookViews enumerateViewsUsingBlock:](v24, "enumerateViewsUsingBlock:", v35);
        if (v16 != v15)
        {
          objc_msgSend(v18, "setHidden:", 1);
          objc_msgSend(v19, "setHidden:", 1);
        }
        if (v31)
        {
          objc_msgSend(v33, "addSubview:", v18);
          objc_msgSend(v32, "addSubview:", v19);
        }
        else
        {
          objc_msgSend(v33, "insertSubview:atIndex:", v18, 0);
          objc_msgSend(v32, "insertSubview:atIndex:", v19, 0);
        }
        -[NSMutableDictionary setObject:forKey:](self->_viewsForLook, "setObject:forKey:", v24, v17);

        ++v15;
      }
      while (v34 != v15);
      v14 = v28 + v34;
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v34);
  }

}

id __53__PREditorSeparatedRootViewController_looksDidChange__block_invoke(double a1, double a2, double a3, double a4)
{
  void *v8;
  void *v9;

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", a1, a2, a3, a4);
  objc_msgSend(v8, "setClipsToBounds:", 1);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01940]), "initWithFrame:", a1, a2, a3, a4);
  objc_msgSend(v9, "setCounterTransformView:", 1);
  objc_msgSend(v8, "addSubview:", v9);

  return v8;
}

uint64_t __53__PREditorSeparatedRootViewController_looksDidChange__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = 40;
  if (a3 == 2)
    v3 = 32;
  return objc_msgSend(*(id *)(a1 + v3), "addContentView:", a2);
}

- (id)viewsForLook:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_viewsForLook, "objectForKey:", a3);
}

- (id)currentLookViews
{
  void *v3;
  void *v4;

  -[PREditorRootViewController currentLook](self, "currentLook");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorSeparatedRootViewController viewsForLook:](self, "viewsForLook:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIView)looksDividerView
{
  return self->_looksDividerView;
}

- (void)setLooksDividerView:(id)a3
{
  objc_storeStrong((id *)&self->_looksDividerView, a3);
}

- (UIView)backgroundForegroundContainerViewsZStackView
{
  return self->_backgroundForegroundContainerViewsZStackView;
}

- (void)setBackgroundForegroundContainerViewsZStackView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundForegroundContainerViewsZStackView, a3);
}

- (UIView)floatingContainerViewsZStackView
{
  return self->_floatingContainerViewsZStackView;
}

- (void)setFloatingContainerViewsZStackView:(id)a3
{
  objc_storeStrong((id *)&self->_floatingContainerViewsZStackView, a3);
}

- (UIScrollView)timeContainerScrollView
{
  return self->_timeContainerScrollView;
}

- (void)setTimeContainerScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_timeContainerScrollView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeContainerScrollView, 0);
  objc_storeStrong((id *)&self->_floatingContainerViewsZStackView, 0);
  objc_storeStrong((id *)&self->_backgroundForegroundContainerViewsZStackView, 0);
  objc_storeStrong((id *)&self->_looksDividerView, 0);
  objc_storeStrong((id *)&self->_viewsForLook, 0);
}

@end
