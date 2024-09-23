@implementation NCClickInteractionPresentedControl

- (NCClickInteractionPresentedControl)initWithTitle:(id)a3 materialRecipe:(int64_t)a4
{
  id v6;
  NCClickInteractionPresentedControl *v7;
  NCClickInteractionPresentedControl *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NCClickInteractionPresentedControl;
  v7 = -[NCClickInteractionPresentedControl init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    -[NCClickInteractionPresentedControl layer](v7, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHitTestsAsOpaque:", 1);

    v8->_materialRecipe = a4;
    -[NCClickInteractionPresentedControl setAutoresizesSubviews:](v8, "setAutoresizesSubviews:", 1);
    -[NCClickInteractionPresentedControl setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", CFSTR("clear-all-button"));
    -[NCClickInteractionPresentedControl _configureContentViewIfNecessaryWithTitle:](v8, "_configureContentViewIfNecessaryWithTitle:", v6);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceIdiom");

    if (v11 == 1)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v8);
      -[NCClickInteractionPresentedControl addInteraction:](v8, "addInteraction:", v12);

    }
  }

  return v8;
}

- (void)_setCornerRadius:(double)a3
{
  -[NCClickInteractionPresentedControl _configureMaterialViewsIfNecessary](self, "_configureMaterialViewsIfNecessary");
  -[MTMaterialView _setCornerRadius:](self->_backgroundMaterialView, "_setCornerRadius:", a3);
}

- (void)_setContinuousCornerRadius:(double)a3
{
  -[NCClickInteractionPresentedControl _configureMaterialViewsIfNecessary](self, "_configureMaterialViewsIfNecessary");
  -[MTMaterialView _setContinuousCornerRadius:](self->_backgroundMaterialView, "_setContinuousCornerRadius:", a3);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  NCClickInteractionPresentedView *presentedView;

  presentedView = self->_presentedView;
  if (presentedView)
    -[NCClickInteractionPresentedView sizeThatFits:](presentedView, "sizeThatFits:", result.width, result.height);
  return result;
}

- (void)_setTitle:(id)a3
{
  -[NCClickInteractionPresentedView setTitle:](self->_presentedView, "setTitle:", a3);
}

- (NSString)_title
{
  return -[NCClickInteractionPresentedView title](self->_presentedView, "title");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  unsigned int v6;
  char v7;
  MTMaterialView *backgroundMaterialView;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  char v13;
  id location;
  objc_super v15;
  objc_super v16;
  objc_super v17;

  v3 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NCClickInteractionPresentedControl;
  v5 = -[NCClickInteractionPresentedControl isHighlighted](&v17, sel_isHighlighted);
  v16.receiver = self;
  v16.super_class = (Class)NCClickInteractionPresentedControl;
  -[NCClickInteractionPresentedControl setHighlighted:](&v16, sel_setHighlighted_, v3);
  v15.receiver = self;
  v15.super_class = (Class)NCClickInteractionPresentedControl;
  v6 = -[NCClickInteractionPresentedControl isHighlighted](&v15, sel_isHighlighted);
  if (v5 != v6)
  {
    v7 = v6;
    -[NCClickInteractionPresentedControl _configureMaterialViewsIfNecessary](self, "_configureMaterialViewsIfNecessary");
    backgroundMaterialView = self->_backgroundMaterialView;
    v9 = objc_initWeak(&location, backgroundMaterialView);
    v10 = (void *)objc_msgSend((id)objc_opt_class(), "newDefaultHighlightAnimator");

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__NCClickInteractionPresentedControl_setHighlighted___block_invoke;
    v11[3] = &unk_1E8D1F068;
    objc_copyWeak(&v12, &location);
    v13 = v7;
    objc_msgSend(v10, "addAnimations:", v11);
    objc_msgSend(v10, "startAnimation");
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
}

void __53__NCClickInteractionPresentedControl_setHighlighted___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setHighlighted:", *(unsigned __int8 *)(a1 + 40));

}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    -[NCClickInteractionPresentedControl adjustForContentSizeCategoryChange](self, "adjustForContentSizeCategoryChange");
  }
}

- (NSString)preferredContentSizeCategory
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NCClickInteractionPresentedView preferredContentSizeCategory](self->_presentedView, "preferredContentSizeCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)*MEMORY[0x1E0DC4938];
  v4 = v2;

  return v4;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  _BOOL4 v3;

  v3 = -[NCClickInteractionPresentedView adjustForContentSizeCategoryChange](self->_presentedView, "adjustForContentSizeCategoryChange");
  if (v3)
    -[NCClickInteractionPresentedControl setNeedsLayout](self, "setNeedsLayout");
  return v3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
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
  void *v19;
  void *v20;

  v5 = (objc_class *)MEMORY[0x1E0DC3B78];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  v8 = (void *)MEMORY[0x1E0DC3508];
  objc_msgSend(v6, "rect");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(v8, "bezierPathWithRoundedRect:cornerRadius:", v10, v12, v14, v16, 13.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVisiblePath:", v17);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", self, v7);
  objc_msgSend(MEMORY[0x1E0DC3B00], "effectWithPreview:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_newMaterialViewWithRecipe:(int64_t)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCClickInteractionPresentedControl bounds](self, "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  return v4;
}

- (void)_configureMaterialViewsIfNecessary
{
  MTMaterialView *v3;
  MTMaterialView *backgroundMaterialView;

  if (!self->_backgroundMaterialView)
  {
    v3 = -[NCClickInteractionPresentedControl _newMaterialViewWithRecipe:](self, "_newMaterialViewWithRecipe:", self->_materialRecipe);
    backgroundMaterialView = self->_backgroundMaterialView;
    self->_backgroundMaterialView = v3;

    -[MTMaterialView setBlurEnabled:](self->_backgroundMaterialView, "setBlurEnabled:", 0);
    -[NCClickInteractionPresentedControl insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundMaterialView, 0);
  }
}

- (void)_configureContentViewIfNecessaryWithTitle:(id)a3
{
  id v4;
  NCClickInteractionPresentedView *v5;
  NCClickInteractionPresentedView *presentedView;
  NCClickInteractionPresentedView *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NCClickInteractionPresentedView *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_presentedView)
  {
    v16 = v4;
    v5 = -[NCClickInteractionPresentedView initWithTitle:]([NCClickInteractionPresentedView alloc], "initWithTitle:", v4);
    presentedView = self->_presentedView;
    self->_presentedView = v5;

    -[NCClickInteractionPresentedView setAdjustsFontForContentSizeCategory:](self->_presentedView, "setAdjustsFontForContentSizeCategory:", -[NCClickInteractionPresentedControl adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"));
    v7 = self->_presentedView;
    -[NCClickInteractionPresentedControl bounds](self, "bounds");
    -[NCClickInteractionPresentedView setFrame:](v7, "setFrame:");
    -[NCClickInteractionPresentedView setAutoresizingMask:](self->_presentedView, "setAutoresizingMask:", 18);
    -[NCClickInteractionPresentedControl _configureMaterialViewsIfNecessary](self, "_configureMaterialViewsIfNecessary");
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[NCClickInteractionPresentedView requiredVisualStyleCategories](self->_presentedView, "requiredVisualStyleCategories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "integerValue");
          v14 = self->_presentedView;
          -[MTMaterialView visualStylingProviderForCategory:](self->_backgroundMaterialView, "visualStylingProviderForCategory:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NCClickInteractionPresentedView setVisualStylingProvider:forCategory:](v14, "setVisualStylingProvider:forCategory:", v15, v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    -[NCClickInteractionPresentedControl addSubview:](self, "addSubview:", self->_presentedView);
    v4 = v16;
  }

}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (NCClickInteractionPresentedView)_presentedView
{
  return self->_presentedView;
}

- (int64_t)_materialRecipe
{
  return self->_materialRecipe;
}

- (MTMaterialView)_backgroundMaterialView
{
  return self->_backgroundMaterialView;
}

- (UITraitCollection)overrideTraitCollection
{
  return self->_overrideTraitCollection;
}

- (void)setOverrideTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_overrideTraitCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideTraitCollection, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_storeStrong((id *)&self->_presentedView, 0);
}

@end
