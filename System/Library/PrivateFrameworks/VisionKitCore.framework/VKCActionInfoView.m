@implementation VKCActionInfoView

- (VKCActionInfoView)initWithLiveTextButton:(id)a3 cornerView:(id)a4
{
  id v7;
  id v8;
  VKCActionInfoView *v9;
  VKCActionInfoView *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  VKCActionInfoMoreButton *moreButton;
  void *v16;
  id v17;
  VKCActionInfoViewLayoutContext *v23;
  VKCActionInfoViewLayoutContext *layoutContext;
  id v25;
  objc_super v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)VKCActionInfoView;
  v9 = -[VKCActionInfoView init](&v27, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_liveTextButton, a3);
    objc_storeStrong((id *)&v10->_visualSearchCornerView, a4);
    VKBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("VK_QUICK_ACTION_TITLE_MORE"), CFSTR("VK_QUICK_ACTION_TITLE_MORE"), CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA638], "vk_symbolImageWithName:", CFSTR("ellipsis.circle.fill"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKCActionInfoButton buttonWithImage:text:](VKCActionInfoMoreButton, "buttonWithImage:text:", v13, v12);
    v14 = objc_claimAutoreleasedReturnValue();
    moreButton = v10->_moreButton;
    v10->_moreButton = (VKCActionInfoMoreButton *)v14;

    -[VKCActionInfoMoreButton setAccessibilityIdentifier:](v10->_moreButton, "setAccessibilityIdentifier:", CFSTR("QuickActionMore"));
    -[VKCActionInfoButton setIsMoreButton:](v10->_moreButton, "setIsMoreButton:", 1);
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v28[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)-[VKCActionInfoView registerForTraitChanges:withAction:](v10, "registerForTraitChanges:withAction:", v16, sel_vk_setNeedsLayout);

    -[VKCActionInfoMoreButton addTarget:action:forControlEvents:](v10->_moreButton, "addTarget:action:forControlEvents:", v10->_moreButton, sel__moreButtonAction_, 64);
    __asm { FMOV            V0.2D, #12.0 }
    *(_OWORD *)&v10->_edgeInsets.top = _Q0;
    *(_OWORD *)&v10->_edgeInsets.bottom = _Q0;
    v23 = objc_alloc_init(VKCActionInfoViewLayoutContext);
    layoutContext = v10->_layoutContext;
    v10->_layoutContext = v23;

    v25 = -[VKCActionInfoView containerView](v10, "containerView");
  }

  return v10;
}

- (CGRect)visibleImageRect
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGRect v31;
  CGRect v33;

  -[VKCActionInfoView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VKCActionInfoView contentsRect](self, "contentsRect");
  VKMRectFromNormalizedSubrect(v4, v6, v8, v10, v11, v12, v13, v14);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[VKCActionInfoView normalizedVisibleRect](self, "normalizedVisibleRect");
  VKMRectFromNormalizedSubrect(v16, v18, v20, v22, v23, v24, v25, v26);
  v33.origin.x = v27;
  v33.origin.y = v28;
  v33.size.width = v29;
  v33.size.height = v30;
  v31.origin.x = v16;
  v31.origin.y = v18;
  v31.size.width = v20;
  v31.size.height = v22;
  return CGRectIntersection(v31, v33);
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
  -[VKCActionInfoView setShouldAnimateQuickActionVisibilityChanges:](self, "setShouldAnimateQuickActionVisibilityChanges:", 1);
  -[VKCActionInfoView layoutContainerView](self, "layoutContainerView");
}

- (void)setHidden:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKCActionInfoView;
  -[VKCActionInfoView setHidden:](&v4, sel_setHidden_, a3);
  -[UIView vk_setNeedsLayout](self, "vk_setNeedsLayout");
}

- (void)updateLayoutIfNecessary
{
  if (-[VKCActionInfoView layoutUpdatesSuspended](self, "layoutUpdatesSuspended"))
  {
    -[VKCActionInfoView setLayoutUpdatesSuspended:](self, "setLayoutUpdatesSuspended:", 0);
    -[UIView vk_setNeedsLayout](self, "vk_setNeedsLayout");
    -[UIView vk_layoutIfNeeded](self, "vk_layoutIfNeeded");
    -[VKCActionInfoView setLayoutUpdatesSuspended:](self, "setLayoutUpdatesSuspended:", 1);
  }
  else
  {
    -[UIView vk_setNeedsLayout](self, "vk_setNeedsLayout");
  }
}

- (UIView)containerView
{
  UIView *containerView;
  VKPlatformView *v4;
  UIView *v5;
  void *v6;
  void *v7;
  void *v8;
  UIView *v9;
  void *v10;
  UIView *v11;
  void *v12;
  UIView *v13;
  void *v14;

  containerView = self->_containerView;
  if (!containerView)
  {
    v4 = objc_alloc_init(VKPlatformView);
    v5 = self->_containerView;
    self->_containerView = &v4->super;

    -[VKCActionInfoView createContainerForView:](self, "createContainerForView:", self->_liveTextButton);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCActionInfoView setTextButtonContainer:](self, "setTextButtonContainer:", v6);

    -[VKCActionInfoView createContainerForView:](self, "createContainerForView:", self->_visualSearchCornerView);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCActionInfoView setVisualSearchContainer:](self, "setVisualSearchContainer:", v7);

    -[VKCActionInfoView createContainerForView:](self, "createContainerForView:", self->_moreButton);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCActionInfoView setMoreButtonContainer:](self, "setMoreButtonContainer:", v8);

    v9 = self->_containerView;
    -[VKCActionInfoView textButtonContainer](self, "textButtonContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v9, "addSubview:", v10);

    v11 = self->_containerView;
    -[VKCActionInfoView visualSearchContainer](self, "visualSearchContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v11, "addSubview:", v12);

    v13 = self->_containerView;
    -[VKCActionInfoView moreButtonContainer](self, "moreButtonContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v13, "addSubview:", v14);

    -[VKCActionInfoView bounds](self, "bounds");
    -[UIView setFrame:](self->_containerView, "setFrame:");
    -[UIView setAutoresizingMask:](self->_containerView, "setAutoresizingMask:", 18);
    -[VKCActionInfoView addSubview:](self, "addSubview:", self->_containerView);
    containerView = self->_containerView;
  }
  return containerView;
}

+ (id)buildMoreButtonMenuFromQuickActions:(id)a3 moreButton:(id)a4 isStandAloneMoreButton:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t, void *, uint64_t);
  void *v17;
  id v18;
  BOOL v19;

  v7 = a4;
  objc_msgSend(a3, "reverseObjectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __91__VKCActionInfoView_buildMoreButtonMenuFromQuickActions_moreButton_isStandAloneMoreButton___block_invoke;
  v17 = &unk_1E9463C78;
  v18 = v7;
  v19 = a5;
  v10 = v7;
  objc_msgSend(v9, "vk_compactMap:", &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithChildren:", v11, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __91__VKCActionInfoView_buildMoreButtonMenuFromQuickActions_moreButton_isStandAloneMoreButton___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;
  id from;
  id location;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "defaultAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dd_action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFallBackView:", v6);

  if (a3 > 10)
  {
    v10 = 0;
  }
  else
  {
    objc_initWeak(&location, v5);
    objc_initWeak(&from, *(id *)(a1 + 32));
    v9 = (void *)MEMORY[0x1E0CEA4F0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __91__VKCActionInfoView_buildMoreButtonMenuFromQuickActions_moreButton_isStandAloneMoreButton___block_invoke_2;
    v12[3] = &unk_1E9463C50;
    v15 = *(_BYTE *)(a1 + 40);
    objc_copyWeak(&v13, &location);
    objc_copyWeak(&v14, &from);
    objc_msgSend(v9, "elementWithUncachedProvider:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __91__VKCActionInfoView_buildMoreButtonMenuFromQuickActions_moreButton_isStandAloneMoreButton___block_invoke_2(uint64_t a1, void *a2)
{
  void (**v3)(id, _QWORD);
  int v4;
  id *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  int v18;
  id v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  void *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(unsigned __int8 *)(a1 + 48);
  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (!v4)
  {
    objc_msgSend(WeakRetained, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isHidden");

    if ((v9 & 1) != 0)
      goto LABEL_5;
LABEL_8:
    v3[2](v3, MEMORY[0x1E0C9AA60]);
    goto LABEL_15;
  }
  if (!objc_msgSend(WeakRetained, "isHidden"))
  {
    v14 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v14, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_5;
    goto LABEL_8;
  }

LABEL_5:
  v10 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v10, "menuImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    v16 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v16, "image");
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  v17 = objc_loadWeakRetained((id *)(a1 + 40));
  v18 = objc_msgSend(v17, "isShowingSingleTapMenu");

  if (v18
    && (v19 = objc_loadWeakRetained(v5), v20 = objc_msgSend(v19, "showsMenuAsPrimaryAction"), v19, !v20))
  {
    v29 = (void *)MEMORY[0x1E0CEA2A8];
    v30 = objc_loadWeakRetained(v5);
    objc_msgSend(v30, "text");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = __91__VKCActionInfoView_buildMoreButtonMenuFromQuickActions_moreButton_isStandAloneMoreButton___block_invoke_3;
    v37 = &unk_1E9462518;
    objc_copyWeak(&v38, v5);
    objc_msgSend(v29, "actionWithTitle:image:identifier:handler:", v31, v13, 0, &v34);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1, v34, v35, v36, v37);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v3)[2](v3, v33);

    objc_destroyWeak(&v38);
  }
  else
  {
    v21 = objc_loadWeakRetained(v5);
    objc_msgSend(v21, "menu");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "children");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CEA740];
    v25 = objc_loadWeakRetained(v5);
    objc_msgSend(v25, "text");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "menuWithTitle:image:identifier:options:children:", v26, v13, 0, 0, v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v40[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v3)[2](v3, v28);

  }
LABEL_15:

}

void __91__VKCActionInfoView_buildMoreButtonMenuFromQuickActions_moreButton_isStandAloneMoreButton___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performDefaultElementAction");

}

- (void)setQuickActionConfigurationUpdateHandler:(id)a3
{
  id v4;
  id quickActionConfigurationUpdateHandler;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  quickActionConfigurationUpdateHandler = self->_quickActionConfigurationUpdateHandler;
  v9 = v4;
  v6 = (void *)MEMORY[0x1D8249E20]();
  LOBYTE(quickActionConfigurationUpdateHandler) = objc_msgSend(quickActionConfigurationUpdateHandler, "isEqual:", v6);

  if ((quickActionConfigurationUpdateHandler & 1) == 0)
  {
    v7 = (void *)objc_msgSend(v9, "copy");
    v8 = self->_quickActionConfigurationUpdateHandler;
    self->_quickActionConfigurationUpdateHandler = v7;

    -[VKCActionInfoView _applyConfigurationUpdateHandlerToQuickActions](self, "_applyConfigurationUpdateHandlerToQuickActions");
    -[VKCActionInfoView updateLayoutIfNecessary](self, "updateLayoutIfNecessary");
  }

}

- (void)_applyConfigurationUpdateHandlerToQuickActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;
  _QWORD v13[4];
  id v14;
  id location;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[VKCActionInfoView liveTextButton](self, "liveTextButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[VKCActionInfoView quickActions](self, "quickActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCActionInfoView moreButton](self, "moreButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vk_arrayByAddingNonNilObject:", v6);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_initWeak(&location, self);
        objc_msgSend(v11, "setTintColor:", v4);
        v13[0] = v9;
        v13[1] = 3221225472;
        v13[2] = __67__VKCActionInfoView__applyConfigurationUpdateHandlerToQuickActions__block_invoke;
        v13[3] = &unk_1E9463A78;
        objc_copyWeak(&v14, &location);
        objc_msgSend(v11, "setConfigurationUpdateHandler:", v13);
        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

void __67__VKCActionInfoView__applyConfigurationUpdateHandlerToQuickActions__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = v9;
    if (objc_msgSend(WeakRetained, "wantsTranslucentActionInfoButtons")
      && objc_msgSend(WeakRetained, "tintAdjustmentMode") != 2)
    {
      if (objc_msgSend(v4, "isSelected"))
        objc_msgSend(v4, "translucentSelectedButtonConfiguration");
      else
        objc_msgSend(v4, "translucentButtonConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "filledButtonConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isSelected") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setBaseBackgroundColor:", v6);

      }
    }
    objc_msgSend(v4, "setConfiguration:", v5);
    objc_msgSend(WeakRetained, "quickActionConfigurationUpdateHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(WeakRetained, "quickActionConfigurationUpdateHandler");
      v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v8)[2](v8, v4);

    }
  }

}

- (void)setQuickActionsDisabled:(BOOL)a3
{
  self->_quickActionsDisabled = a3;
  if (!-[VKCActionInfoView layoutUpdatesSuspended](self, "layoutUpdatesSuspended"))
    -[UIView vk_setNeedsLayout](self, "vk_setNeedsLayout");
}

- (void)setLiveTextButtonDisabled:(BOOL)a3
{
  _BOOL8 liveTextButtonDisabled;
  void *v5;
  id v6;

  if (self->_liveTextButtonDisabled != a3)
  {
    self->_liveTextButtonDisabled = a3;
    if (-[VKCActionInfoView layoutUpdatesSuspended](self, "layoutUpdatesSuspended"))
    {
      liveTextButtonDisabled = self->_liveTextButtonDisabled;
      -[VKCActionInfoView liveTextButton](self, "liveTextButton");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHidden:", liveTextButtonDisabled);

    }
    else
    {
      -[UIView vk_setNeedsLayout](self, "vk_setNeedsLayout");
    }
  }
}

- (void)setVisualSearchCornerViewDisabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_visualSearchCornerViewDisabled != a3)
  {
    v3 = a3;
    self->_visualSearchCornerViewDisabled = a3;
    if (-[VKCActionInfoView layoutUpdatesSuspended](self, "layoutUpdatesSuspended"))
    {
      -[VKCActionInfoView visualSearchCornerView](self, "visualSearchCornerView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHidden:", v3);

    }
    else
    {
      -[UIView vk_setNeedsLayout](self, "vk_setNeedsLayout");
    }
  }
}

- (void)set_quickActionsHidden:(BOOL)a3
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
  if (self->__quickActionsHidden != a3)
  {
    self->__quickActionsHidden = a3;
    if (a3)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      -[VKCActionInfoView quickActions](self, "quickActions", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
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
            objc_msgSend(v9, "setSelected:", 0);
            objc_msgSend(v9, "contextMenuInteraction");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "dismissMenu");

          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v6);
      }

    }
    -[UIView vk_setNeedsLayout](self, "vk_setNeedsLayout");
  }
}

- (void)setLayoutUpdatesSuspended:(BOOL)a3
{
  self->_layoutUpdatesSuspended = a3;
  if (!a3)
    -[UIView vk_setNeedsLayout](self, "vk_setNeedsLayout");
}

- (void)setPreferredQuickActionButtonHeight:(double)a3
{
  if (self->_preferredQuickActionButtonHeight != a3)
  {
    self->_preferredQuickActionButtonHeight = a3;
    -[UIView vk_setNeedsLayout](self, "vk_setNeedsLayout");
  }
}

- (NSArray)allViews
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  -[VKCActionInfoView quickActions](self, "quickActions");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  -[VKCActionInfoView liveTextButton](self, "liveTextButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCActionInfoView visualSearchCornerView](self, "visualSearchCornerView", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  -[VKCActionInfoView moreButton](self, "moreButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v11;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKCActionInfoView;
  -[VKCActionInfoView layoutSubviews](&v3, sel_layoutSubviews);
  if (!-[VKCActionInfoView layoutUpdatesSuspended](self, "layoutUpdatesSuspended"))
    -[VKCActionInfoView layoutContainerView](self, "layoutContainerView");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  VKCActionInfoView *v5;
  VKCActionInfoView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VKCActionInfoView;
  -[VKCActionInfoView hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (VKCActionInfoView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self
    || (-[VKCActionInfoView containerView](self, "containerView"),
        v6 = (VKCActionInfoView *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5 == v6))
  {

    v5 = 0;
  }
  return v5;
}

- (void)layoutContainerView
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  double v8;
  double x;
  double v10;
  double y;
  double v12;
  double width;
  double v14;
  double height;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  _BOOL8 v55;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  _BOOL8 v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  id v69;
  _QWORD v70[5];
  id v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  -[VKCActionInfoView superview](self, "superview");
  v69 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[VKCActionInfoView automaticVisualRectLayoutDisabled](self, "automaticVisualRectLayoutDisabled");
  if (v69
    && (-[VKCActionInfoView window](self, "window"), (v4 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v5 = (void *)v4, v6 = -[VKCActionInfoView isHidden](self, "isHidden"), v5, (v6 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);
    if (v3)
    {
      -[VKCActionInfoView visibleImageRect](self, "visibleImageRect");
      -[VKCActionInfoView bounds](self, "bounds");
      x = v8;
      y = v10;
      width = v12;
      height = v14;
      v16 = 1.0;
      v17 = 12.0;
    }
    else
    {
      -[UIView vk_viewPointRatioFromWindow](self, "vk_viewPointRatioFromWindow");
      v16 = v18;
      v17 = v18 * 12.0;
      -[VKCActionInfoView visibleImageRect](self, "visibleImageRect");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      -[VKCActionInfoView bounds](self, "bounds");
      v75.origin.x = v20;
      v75.origin.y = v22;
      v75.size.width = v24;
      v75.size.height = v26;
      v73 = CGRectIntersection(v72, v75);
      x = v73.origin.x;
      y = v73.origin.y;
      width = v73.size.width;
      height = v73.size.height;
    }
    if (VKMRectHasArea(x, y, width, height))
    {
      v68 = v17;
      -[VKCActionInfoView edgeInsets](self, "edgeInsets");
      v28 = v16 * v27;
      v66 = v30;
      v67 = v16 * v27 + v16 * v29;
      -[VKCActionInfoView edgeInsets](self, "edgeInsets");
      v32 = v31;
      -[VKCActionInfoView edgeInsets](self, "edgeInsets");
      v34 = v32 + v33;
      -[VKCActionInfoView preferredQuickActionButtonHeight](self, "preferredQuickActionButtonHeight");
      v36 = v35;
      if (-[VKCActionInfoView automaticVisualRectLayoutDisabled](self, "automaticVisualRectLayoutDisabled"))
      {
        v37 = fmax(v36 + v34, 44.0);
      }
      else
      {
        -[VKCActionInfoView liveTextButton](self, "liveTextButton");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "backgroundDiameter");
        v37 = v34 + v39;

      }
      v40 = width - v67;
      v41 = x + v28;
      v42 = v16 * v37;
      if (-[VKCActionInfoView alignQuickActionsWithVerticalCenter](self, "alignQuickActionsWithVerticalCenter"))
      {
        v43 = y + (v42 - height) * -0.5;
      }
      else
      {
        v74.origin.x = x;
        v74.origin.y = y;
        v74.size.width = width;
        v74.size.height = height;
        v43 = CGRectGetMaxY(v74) - v16 * v66 - v42;
      }
      -[UIView vk_convertFrameToViewScale:shouldRound:](self, "vk_convertFrameToViewScale:shouldRound:", 1, v41, v43, v40, v42);
      v45 = v44;
      v47 = v46;
      v49 = v48;
      v51 = v50;
      -[VKCActionInfoView containerView](self, "containerView");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setFrame:", v45, v47, v49, v51);

      -[VKCActionInfoView layoutContext](self, "layoutContext");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "reset");
      -[VKCActionInfoView containerView](self, "containerView");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "bounds");
      objc_msgSend(v53, "setContainerBounds:");

      objc_msgSend(v53, "setCurrentMaxX:", v40);
      objc_msgSend(v53, "setCurrentMinX:", 0.0);
      objc_msgSend(v53, "setScale:", v16);
      objc_msgSend(v53, "setPadding:", v68);
      objc_msgSend(v53, "setAnimateItemVisibilityChanges:", -[VKCActionInfoView shouldAnimateQuickActionVisibilityChanges](self, "shouldAnimateQuickActionVisibilityChanges"));
      objc_msgSend(v53, "setShowingMoreButton:", 0);
      v55 = 0;
      if (!-[VKCActionInfoView liveTextButtonDisabled](self, "liveTextButtonDisabled"))
      {
        -[VKCActionInfoView liveTextButton](self, "liveTextButton");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "vk_alpha");
        v55 = v57 > 0.0;

      }
      -[VKCActionInfoView liveTextButton](self, "liveTextButton");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCActionInfoView processView:hasContent:isLeading:layoutContext:](self, "processView:hasContent:isLeading:layoutContext:", v58, v55, 0, v53);

      -[VKCActionInfoView visualSearchCornerView](self, "visualSearchCornerView");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 0;
      if (!-[VKCActionInfoView visualSearchCornerViewDisabled](self, "visualSearchCornerViewDisabled"))
      {
        if ((objc_msgSend(v59, "isHidden") & 1) != 0)
        {
          v60 = 0;
        }
        else
        {
          objc_msgSend(v59, "cornerButtons");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v61, "count") != 0;

        }
      }
      -[VKCActionInfoView visualSearchCornerView](self, "visualSearchCornerView");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCActionInfoView processView:hasContent:isLeading:layoutContext:](self, "processView:hasContent:isLeading:layoutContext:", v62, v60, 0, v53);

      -[VKCActionInfoView quickActions](self, "quickActions");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __40__VKCActionInfoView_layoutContainerView__block_invoke;
      v70[3] = &unk_1E9463CA0;
      v70[4] = self;
      v64 = v53;
      v71 = v64;
      objc_msgSend(v63, "enumerateObjectsUsingBlock:", v70);

      -[VKCActionInfoView adjustContextToFitWidth:](self, "adjustContextToFitWidth:", v64);
      -[VKCActionInfoView updateFramesForContext:](self, "updateFramesForContext:", v64);
      -[VKCActionInfoView updateButtonClippingForContext:](self, "updateButtonClippingForContext:", v64);
      if (objc_msgSend(v64, "showingMoreButton"))
      {
        -[VKCActionInfoView updateMoreButtonMenuForContext:](self, "updateMoreButtonMenuForContext:", v64);
      }
      else
      {
        -[VKCActionInfoView moreButtonContainer](self, "moreButtonContainer");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setHidden:", 1);

      }
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  else
  {
    -[VKCActionInfoView allViews](self, "allViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_12);

  }
}

void __40__VKCActionInfoView_layoutContainerView__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = *(void **)(a1 + 32);
  if ((objc_msgSend(v3, "_quickActionsHidden") & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(a1 + 32), "quickActionsDisabled") ^ 1;
  objc_msgSend(v3, "processView:hasContent:isLeading:layoutContext:", v5, v4, 1, *(_QWORD *)(a1 + 40));

}

void __40__VKCActionInfoView_layoutContainerView__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "superview");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

}

- (void)adjustContextToFitWidth:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double MinX;
  VKCQuickActionLayoutInfo *v24;
  void *v25;
  double x;
  double MaxX;
  void *v28;
  double v29;
  unint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  _BOOL8 v48;
  void *v49;
  double v50;
  void *v51;
  unint64_t i;
  void *v53;
  unint64_t v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double y;
  double v60;
  double rect;
  id v62;
  _QWORD v63[4];
  id v64;
  double v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v4 = a3;
  objc_msgSend(v4, "leadingLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "frame");
    v9 = v8;
  }
  else
  {
    objc_msgSend(v4, "containerBounds");
    v9 = v10;
  }
  objc_msgSend(v4, "padding");
  v12 = v11;
  objc_msgSend(v4, "leadingLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __45__VKCActionInfoView_adjustContextToFitWidth___block_invoke;
  v63[3] = &unk_1E9463CE8;
  v62 = v4;
  v64 = v62;
  v65 = v9;
  v14 = objc_msgSend(v13, "indexOfObjectPassingTest:", v63);

  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v62, "scale");
    v18 = v17 * 64.0;
    -[VKCActionInfoView moreButton](self, "moreButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "scale");
    -[VKCActionInfoView sizeForView:scale:](self, "sizeForView:scale:", v19);
    v21 = v20;
    rect = v22;

    if (v18 < v21)
      v18 = v21;
    objc_msgSend(v15, "frame");
    MinX = CGRectGetMinX(v66);
    if (v15 == v16)
    {
      MinX = v9 - MinX;
      if (MinX - v12 > v18)
      {
        objc_msgSend(v15, "frame");
        objc_msgSend(v15, "setFrame:");
        objc_msgSend(v62, "setShowingMoreButton:", 0);
        goto LABEL_33;
      }
    }
    objc_msgSend(v15, "setHidden:", 1, MinX);
    v24 = objc_alloc_init(VKCQuickActionLayoutInfo);
    -[VKCActionInfoView moreButton](self, "moreButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCQuickActionLayoutInfo setView:](v24, "setView:", v25);

    objc_msgSend(v15, "frame");
    x = v67.origin.x;
    y = v67.origin.y;
    v67.size.width = v21;
    v67.size.height = rect;
    MaxX = CGRectGetMaxX(v67);
    objc_msgSend(v62, "leadingLayout");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "insertObject:atIndex:", v24, v14);

    if (v14)
    {
      v60 = v18;
      v29 = x - (v12 + MaxX - v9);
      if (v14 < 1)
      {
        v48 = 0;
LABEL_32:
        -[VKCQuickActionLayoutInfo setFrame:](v24, "setFrame:", v29, y, v21, rect);
        -[VKCQuickActionLayoutInfo setHidden:](v24, "setHidden:", v48);
        objc_msgSend(v62, "setShowingMoreButton:", v48 ^ 1);

LABEL_33:
        v51 = v62;
        for (i = v14 + 1; ; ++i)
        {
          objc_msgSend(v51, "leadingLayout");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "count");

          if (i >= v54)
            break;
          objc_msgSend(v5, "objectAtIndexedSubscript:", i);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setHidden:", 1);

          v51 = v62;
        }

        goto LABEL_37;
      }
      v56 = v9;
      v57 = v12;
      v30 = v14 + 1;
      while (1)
      {
        objc_msgSend(v62, "leadingLayout");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "vk_safeObjectAtIndex:", v30 - 2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
          goto LABEL_30;
        v68.origin.x = v29;
        v68.origin.y = y;
        v68.size.width = v21;
        v68.size.height = rect;
        v33 = CGRectGetMaxX(v68);
        objc_msgSend(v32, "frame");
        v35 = v34;
        v37 = v36;
        v39 = v38;
        v41 = v40;
        v58 = v29;
        v69.origin.x = v29;
        v69.origin.y = y;
        v42 = v21;
        v69.size.width = v21;
        v69.size.height = rect;
        v43 = v41;
        v44 = CGRectGetMinX(v69);
        v70.origin.x = v35;
        v70.origin.y = v37;
        v70.size.width = v39;
        v70.size.height = v43;
        v45 = CGRectGetMaxX(v70);
        if (v39 >= v60)
        {
          v46 = v44 - v45;
          if (v46 >= v57)
          {
            if (v46 > v57)
            {
              v71.origin.x = v35;
              v71.origin.y = v37;
              v71.size.width = v39;
              v71.size.height = v43;
              v48 = 0;
              v29 = v57 + CGRectGetMaxX(v71);
              v21 = v42;
              goto LABEL_31;
            }
            if (v46 == v57)
            {
LABEL_27:
              v48 = 0;
              v21 = v42;
              v29 = v58;
              goto LABEL_31;
            }
            v21 = v42;
            if (vabdd_f64(v46, v57) >= fabs(v57 * 0.000000999999997))
              objc_msgSend(v32, "setFrame:", v35, v37, v39 - (v57 + v33 - v56), v43);
            goto LABEL_30;
          }
          v47 = v39 + v46 - v57;
          objc_msgSend(v32, "setFrame:", v35, v37, v47, v43);
          v45 = v60;
          if (v47 >= v60)
            goto LABEL_27;
        }
        objc_msgSend(v32, "setHidden:", 1, v45);

        --v30;
        v29 = v35;
        v21 = v42;
        if (v30 <= 1)
        {
          v48 = 0;
          v29 = v35;
          goto LABEL_32;
        }
      }
    }
    objc_msgSend(v62, "trailingLayout");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v32, "frame");
      v29 = 0.0;
      if (v50 >= v12 + v21)
      {
LABEL_30:
        v48 = 0;
        goto LABEL_31;
      }
      v48 = 1;
    }
    else
    {
      v29 = 0.0;
      v48 = v21 > v9;
    }
LABEL_31:

    goto LABEL_32;
  }
LABEL_37:

}

BOOL __45__VKCActionInfoView_adjustContextToFitWidth___block_invoke(uint64_t a1, void *a2)
{
  double MaxX;
  double v4;
  CGRect v6;

  objc_msgSend(a2, "frame");
  MaxX = CGRectGetMaxX(v6);
  objc_msgSend(*(id *)(a1 + 32), "padding");
  return MaxX + v4 > *(double *)(a1 + 40);
}

- (void)updateButtonClippingForContext:(id)a3
{
  id v3;

  objc_msgSend(a3, "leadingLayout");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_180);

}

void __52__VKCActionInfoView_updateButtonClippingForContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v2 = a2;
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  objc_msgSend(v2, "desiredFrame");
  v7 = fabs(v5 / v6 + -1.0);
  v8 = objc_opt_class();
  objc_msgSend(v2, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  VKDynamicCast(v8, (uint64_t)v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 >= 0.01)
    v10 = 4;
  else
    v10 = 2;
  objc_msgSend(v12, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "titleLineBreakMode") != v10)
  {
    objc_msgSend(v11, "setTitleLineBreakMode:", v10);
    objc_msgSend(v12, "setConfiguration:", v11);
  }

}

- (void)updateFramesForContext:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);
  objc_msgSend(v3, "leadingLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __44__VKCActionInfoView_updateFramesForContext___block_invoke;
  v19[3] = &unk_1E9463D50;
  v6 = v3;
  v20 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v19);

  objc_msgSend(v6, "trailingLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __44__VKCActionInfoView_updateFramesForContext___block_invoke_2;
  v17[3] = &unk_1E9463D50;
  v8 = v6;
  v18 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v17);

  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);
  objc_msgSend(v8, "leadingLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __44__VKCActionInfoView_updateFramesForContext___block_invoke_3;
  v15[3] = &unk_1E9463D50;
  v10 = v8;
  v16 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v15);

  objc_msgSend(v10, "trailingLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __44__VKCActionInfoView_updateFramesForContext___block_invoke_4;
  v13[3] = &unk_1E9463D50;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

void __44__VKCActionInfoView_updateFramesForContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
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
  double v28;
  double v29;
  void *v30;
  CATransform3D v31;
  CATransform3D v32;
  CATransform3D v33;

  memset(&v33, 0, sizeof(v33));
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "scale");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "scale");
  CATransform3DMakeScale(&v33, v6, v7, 1.0);
  v32 = v33;
  objc_msgSend(v4, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v32;
  objc_msgSend(v9, "setTransform:", &v31);

  objc_msgSend(v4, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v4, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);

  objc_msgSend(v4, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "superview");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  objc_msgSend(v4, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);
}

void __44__VKCActionInfoView_updateFramesForContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
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
  double v28;
  double v29;
  void *v30;
  CATransform3D v31;
  CATransform3D v32;
  CATransform3D v33;

  memset(&v33, 0, sizeof(v33));
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "scale");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "scale");
  CATransform3DMakeScale(&v33, v6, v7, 1.0);
  v32 = v33;
  objc_msgSend(v4, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v32;
  objc_msgSend(v9, "setTransform:", &v31);

  objc_msgSend(v4, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v4, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);

  objc_msgSend(v4, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "superview");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  objc_msgSend(v4, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);
}

void __44__VKCActionInfoView_updateFramesForContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hidden");

  objc_msgSend(v4, "vk_setHidden:animated:", v5, objc_msgSend(*(id *)(a1 + 32), "animateItemVisibilityChanges"));
}

void __44__VKCActionInfoView_updateFramesForContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hidden");

  objc_msgSend(v4, "vk_setHidden:animated:", v5, objc_msgSend(*(id *)(a1 + 32), "animateItemVisibilityChanges"));
}

- (void)processView:(id)a3 hasContent:(BOOL)a4 isLeading:(BOOL)a5 layoutContext:(id)a6
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  id v20;

  v7 = a5;
  v8 = a4;
  v20 = a3;
  v10 = a6;
  objc_msgSend(v20, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v12 = -[VKCActionInfoView configureView:isLeading:container:layoutContext:](self, "configureView:isLeading:container:layoutContext:", v20, v7, v11, v10);
    if (v7)
    {
      if (objc_msgSend(v10, "didAddLeadingItem"))
      {
        objc_msgSend(v10, "padding");
        v14 = v13;
        objc_msgSend(v10, "currentMinX");
        objc_msgSend(v10, "setCurrentMinX:", v14 + v15);
      }
    }
    else if (objc_msgSend(v10, "didAddTrailingItem"))
    {
      objc_msgSend(v10, "padding");
      v18 = v17;
      objc_msgSend(v10, "currentMaxX");
      objc_msgSend(v10, "setCurrentMaxX:", v19 - v18);
    }
  }
  else
  {
    objc_msgSend(v20, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", 1);

  }
}

- (id)configureView:(id)a3 isLeading:(BOOL)a4 container:(id)a5 layoutContext:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
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
  _BOOL4 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  VKCQuickActionLayoutInfo *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  CGRect v40;

  v7 = a4;
  v9 = a3;
  v10 = a6;
  objc_msgSend(v10, "scale");
  -[VKCActionInfoView sizeForView:scale:](self, "sizeForView:scale:", v9);
  v12 = v11;
  v14 = v13;
  v15 = VKMRectWithSize();
  v17 = v16;
  v19 = v18;
  if (v7)
  {
    objc_msgSend(v10, "currentMinX", v15);
    v21 = v20;
  }
  else
  {
    objc_msgSend(v10, "currentMaxX", v15);
    v21 = v22 - v12;
  }
  v23 = -[VKCActionInfoView alignQuickActionsWithVerticalCenter](self, "alignQuickActionsWithVerticalCenter");
  objc_msgSend(v10, "containerBounds");
  if (v23)
  {
    v26 = v24;
    objc_msgSend(v10, "containerBounds");
    v28 = v26 + (v27 - v14) * 0.5;
  }
  else
  {
    v28 = v25 - v14;
  }
  v29 = objc_alloc_init(VKCQuickActionLayoutInfo);
  -[UIView vk_convertFrameToViewScale:shouldRound:](self, "vk_convertFrameToViewScale:shouldRound:", 0, v21, v28, v17, v19);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  -[VKCQuickActionLayoutInfo setView:](v29, "setView:", v9);
  -[VKCQuickActionLayoutInfo setFrame:](v29, "setFrame:", v31, v33, v35, v37);
  -[VKCQuickActionLayoutInfo setDesiredFrame:](v29, "setDesiredFrame:", v31, v33, v35, v37);
  if (v7)
  {
    v40.origin.x = v21;
    v40.origin.y = v28;
    v40.size.width = v17;
    v40.size.height = v19;
    objc_msgSend(v10, "setCurrentMinX:", CGRectGetMaxX(v40));
    objc_msgSend(v10, "setDidAddLeadingItem:", 1);
    objc_msgSend(v10, "leadingLayout");
  }
  else
  {
    objc_msgSend(v10, "setCurrentMaxX:", v21);
    objc_msgSend(v10, "setDidAddTrailingItem:", 1);
    objc_msgSend(v10, "trailingLayout");
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addObject:", v29);

  return v29;
}

- (CGSize)sizeForView:(id)a3 scale:(double)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  v6 = a3;
  objc_msgSend(v6, "intrinsicContentSize");
  v8 = v7;
  v10 = v9;
  -[VKCActionInfoView liveTextButton](self, "liveTextButton");
  v11 = objc_claimAutoreleasedReturnValue();
  if ((id)v11 == v6)
  {

  }
  else
  {
    v12 = (void *)v11;
    -[VKCActionInfoView visualSearchCornerView](self, "visualSearchCornerView");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 != v6)
    {
      if (-[VKCActionInfoView automaticVisualRectLayoutDisabled](self, "automaticVisualRectLayoutDisabled"))
      {
        -[VKCActionInfoView preferredQuickActionButtonHeight](self, "preferredQuickActionButtonHeight");
        v15 = v14;
      }
      else
      {
        -[VKCActionInfoView liveTextButton](self, "liveTextButton");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "backgroundDiameter");
        v15 = v17;

      }
      if (v15 >= v10)
        v10 = v15;
      if (v8 < v10)
        v8 = v10;
    }
  }
  v18 = VKMMultiplyPointScalar(v8, v10, a4);
  v20 = v19;

  v21 = v18;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)setVisualSearchCornerView:(id)a3
{
  VKCVisualSearchCornerView **p_visualSearchCornerView;
  id v6;

  p_visualSearchCornerView = &self->_visualSearchCornerView;
  objc_storeStrong((id *)&self->_visualSearchCornerView, a3);
  v6 = a3;
  -[VKCActionInfoView normalizedVisibleRect](self, "normalizedVisibleRect");
  -[VKCVisualSearchCornerView setNormalizedVisibleRect:](*p_visualSearchCornerView, "setNormalizedVisibleRect:");

}

- (void)setContentsRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_contentsRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentsRect = &self->_contentsRect;
  if (!CGRectEqualToRect(self->_contentsRect, a3))
  {
    p_contentsRect->origin.x = x;
    p_contentsRect->origin.y = y;
    p_contentsRect->size.width = width;
    p_contentsRect->size.height = height;
    -[UIView vk_setNeedsLayout](self, "vk_setNeedsLayout");
  }
}

- (void)setNormalizedVisibleRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_normalizedVisibleRect;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_normalizedVisibleRect = &self->_normalizedVisibleRect;
  if (-[VKCActionInfoView automaticVisualRectLayoutDisabled](self, "automaticVisualRectLayoutDisabled"))
  {
    p_normalizedVisibleRect->origin = (CGPoint)VKMRectUnit;
    self->_normalizedVisibleRect.size = *(CGSize *)&qword_1D2ED1098;
    v9 = p_normalizedVisibleRect->origin.x;
    v10 = self->_normalizedVisibleRect.origin.y;
    v11 = self->_normalizedVisibleRect.size.width;
    v12 = self->_normalizedVisibleRect.size.height;
    -[VKCActionInfoView visualSearchCornerView](self, "visualSearchCornerView");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNormalizedVisibleRect:", v9, v10, v11, v12);

  }
  else
  {
    v15.origin.x = p_normalizedVisibleRect->origin.x;
    v15.origin.y = self->_normalizedVisibleRect.origin.y;
    v15.size.width = self->_normalizedVisibleRect.size.width;
    v15.size.height = self->_normalizedVisibleRect.size.height;
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    if (!CGRectEqualToRect(v15, v16))
    {
      p_normalizedVisibleRect->origin.x = x;
      self->_normalizedVisibleRect.origin.y = y;
      self->_normalizedVisibleRect.size.width = width;
      self->_normalizedVisibleRect.size.height = height;
      -[VKCActionInfoView visualSearchCornerView](self, "visualSearchCornerView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setNormalizedVisibleRect:", x, y, width, height);

      -[UIView vk_setNeedsLayout](self, "vk_setNeedsLayout");
    }
  }
}

- (id)createContainerForView:(id)a3
{
  id v3;
  VKPlatformView *v4;

  v3 = a3;
  v4 = objc_alloc_init(VKPlatformView);
  -[VKPlatformView addSubview:](v4, "addSubview:", v3);

  return v4;
}

- (void)setQuickActions:(id)a3
{
  id v4;
  NSArray *quickActions;
  id v6;
  NSArray *v7;
  NSArray *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  quickActions = self->_quickActions;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __37__VKCActionInfoView_setQuickActions___block_invoke;
  v25[3] = &unk_1E9463D78;
  v25[4] = self;
  v6 = v4;
  v26 = v6;
  -[NSArray enumerateObjectsUsingBlock:](quickActions, "enumerateObjectsUsingBlock:", v25);
  v7 = (NSArray *)objc_msgSend(v6, "copy");
  v8 = self->_quickActions;
  self->_quickActions = v7;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        -[VKCActionInfoView createContainerForView:](self, "createContainerForView:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13), (_QWORD)v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VKCActionInfoView containerView](self, "containerView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addSubview:", v14);

        objc_msgSend(v14, "setHidden:", 1);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v11);
  }

  -[VKCActionInfoView _applyConfigurationUpdateHandlerToQuickActions](self, "_applyConfigurationUpdateHandlerToQuickActions");
  v16 = (void *)objc_opt_class();
  v17 = self->_quickActions;
  -[VKCActionInfoView moreButton](self, "moreButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "buildMoreButtonMenuFromQuickActions:moreButton:isStandAloneMoreButton:", v17, v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCActionInfoView moreButton](self, "moreButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCustomMenu:", v19);

  -[VKCActionInfoView layoutContainerView](self, "layoutContainerView");
}

void __37__VKCActionInfoView_setQuickActions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5 && (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v7) & 1) == 0)
  {
    objc_msgSend(v7, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

  }
}

- (BOOL)containsInteractableItemAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  BOOL v7;
  void *v8;
  BOOL v9;
  char v10;
  void *v11;
  _QWORD v13[7];

  y = a3.y;
  x = a3.x;
  -[VKCActionInfoView liveTextButton](self, "liveTextButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VKCActionInfoView isInteractableView:atPoint:](self, "isInteractableView:atPoint:", v6, x, y);

  if (v7)
    return 1;
  -[VKCActionInfoView visualSearchCornerView](self, "visualSearchCornerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VKCActionInfoView isInteractableView:atPoint:](self, "isInteractableView:atPoint:", v8, x, y);

  if (v9)
    return 1;
  -[VKCActionInfoView allViews](self, "allViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__VKCActionInfoView_containsInteractableItemAtPoint___block_invoke;
  v13[3] = &unk_1E9463DA0;
  v13[4] = self;
  *(double *)&v13[5] = x;
  *(double *)&v13[6] = y;
  v10 = objc_msgSend(v11, "vk_containsObjectPassingTest:", v13);

  return v10;
}

uint64_t __53__VKCActionInfoView_containsInteractableItemAtPoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(v3, "isHidden") & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(a1 + 32), "isInteractableView:atPoint:", v3, *(double *)(a1 + 40), *(double *)(a1 + 48));

  return v4;
}

- (BOOL)isInteractableView:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  BOOL v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGPoint v14;
  CGRect v15;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  if ((objc_msgSend(v7, "isHidden") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[VKCActionInfoView convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
    v10 = v9;
    v12 = v11;
    objc_msgSend(v7, "bounds");
    v14.x = v10;
    v14.y = v12;
    v8 = CGRectContainsPoint(v15, v14);
  }

  return v8;
}

- (CGRect)contentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentsRect.origin.x;
  y = self->_contentsRect.origin.y;
  width = self->_contentsRect.size.width;
  height = self->_contentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)normalizedVisibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedVisibleRect.origin.x;
  y = self->_normalizedVisibleRect.origin.y;
  width = self->_normalizedVisibleRect.size.width;
  height = self->_normalizedVisibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (VKImageAnalysisButton)liveTextButton
{
  return self->_liveTextButton;
}

- (void)setLiveTextButton:(id)a3
{
  objc_storeStrong((id *)&self->_liveTextButton, a3);
}

- (VKCVisualSearchCornerView)visualSearchCornerView
{
  return self->_visualSearchCornerView;
}

- (NSArray)quickActions
{
  return self->_quickActions;
}

- (BOOL)quickActionsDisabled
{
  return self->_quickActionsDisabled;
}

- (BOOL)liveTextButtonDisabled
{
  return self->_liveTextButtonDisabled;
}

- (BOOL)visualSearchCornerViewDisabled
{
  return self->_visualSearchCornerViewDisabled;
}

- (BOOL)layoutUpdatesSuspended
{
  return self->_layoutUpdatesSuspended;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)shouldAnimateQuickActionVisibilityChanges
{
  return self->_shouldAnimateQuickActionVisibilityChanges;
}

- (void)setShouldAnimateQuickActionVisibilityChanges:(BOOL)a3
{
  self->_shouldAnimateQuickActionVisibilityChanges = a3;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIView)textButtonContainer
{
  return self->_textButtonContainer;
}

- (void)setTextButtonContainer:(id)a3
{
  objc_storeStrong((id *)&self->_textButtonContainer, a3);
}

- (UIView)visualSearchContainer
{
  return self->_visualSearchContainer;
}

- (void)setVisualSearchContainer:(id)a3
{
  objc_storeStrong((id *)&self->_visualSearchContainer, a3);
}

- (UIView)moreButtonContainer
{
  return self->_moreButtonContainer;
}

- (void)setMoreButtonContainer:(id)a3
{
  objc_storeStrong((id *)&self->_moreButtonContainer, a3);
}

- (VKCActionInfoMoreButton)moreButton
{
  return self->_moreButton;
}

- (void)setMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_moreButton, a3);
}

- (VKCActionInfoViewLayoutContext)layoutContext
{
  return self->_layoutContext;
}

- (void)setLayoutContext:(id)a3
{
  objc_storeStrong((id *)&self->_layoutContext, a3);
}

- (BOOL)_quickActionsHidden
{
  return self->__quickActionsHidden;
}

- (BOOL)automaticVisualRectLayoutDisabled
{
  return self->_automaticVisualRectLayoutDisabled;
}

- (void)setAutomaticVisualRectLayoutDisabled:(BOOL)a3
{
  self->_automaticVisualRectLayoutDisabled = a3;
}

- (BOOL)alignQuickActionsWithVerticalCenter
{
  return self->_alignQuickActionsWithVerticalCenter;
}

- (void)setAlignQuickActionsWithVerticalCenter:(BOOL)a3
{
  self->_alignQuickActionsWithVerticalCenter = a3;
}

- (double)preferredQuickActionButtonHeight
{
  return self->_preferredQuickActionButtonHeight;
}

- (BOOL)wantsTranslucentActionInfoButtons
{
  return self->_wantsTranslucentActionInfoButtons;
}

- (void)setWantsTranslucentActionInfoButtons:(BOOL)a3
{
  self->_wantsTranslucentActionInfoButtons = a3;
}

- (id)quickActionConfigurationUpdateHandler
{
  return self->_quickActionConfigurationUpdateHandler;
}

- (BOOL)isShowingSingleTapMoreButtonMenu
{
  return self->_isShowingSingleTapMoreButtonMenu;
}

- (void)setIsShowingSingleTapMoreButtonMenu:(BOOL)a3
{
  self->_isShowingSingleTapMoreButtonMenu = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_quickActionConfigurationUpdateHandler, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_moreButtonContainer, 0);
  objc_storeStrong((id *)&self->_visualSearchContainer, 0);
  objc_storeStrong((id *)&self->_textButtonContainer, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_quickActions, 0);
  objc_storeStrong((id *)&self->_visualSearchCornerView, 0);
  objc_storeStrong((id *)&self->_liveTextButton, 0);
}

@end
