@implementation SBHWidgetWrapperViewController

- (SBHWidgetWrapperViewController)initWithGalleryItem:(id)a3 titleAndSubtitleVisible:(BOOL)a4 listLayoutProvider:(id)a5 iconViewProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  SBHWidgetWrapperViewController *v14;
  SBHWidgetWrapperViewController *v15;
  id v16;
  int8x8_t v17;
  NSArray *v18;
  uint64_t *v19;
  uint8x8_t v20;
  int v21;
  unint64_t v22;
  NSArray *supportedSizeClasses;
  NSArray *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, unsigned int);
  void *v32;
  NSArray *v33;
  objc_super v34;
  char v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v34.receiver = self;
  v34.super_class = (Class)SBHWidgetWrapperViewController;
  v14 = -[SBHWidgetWrapperViewController initWithNibName:bundle:](&v34, sel_initWithNibName_bundle_, 0, 0);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_galleryItem, a3);
    v15->_titleAndSubtitleVisible = a4;
    objc_storeStrong((id *)&v15->_listLayoutProvider, a5);
    objc_storeWeak((id *)&v15->_iconViewProvider, v13);
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = (int8x8_t)objc_msgSend(v11, "sbh_supportedSizeClasses");
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __114__SBHWidgetWrapperViewController_initWithGalleryItem_titleAndSubtitleVisible_listLayoutProvider_iconViewProvider___block_invoke;
    v32 = &unk_1E8D85CE8;
    v18 = (NSArray *)v16;
    v33 = v18;
    v19 = &v29;
    if (v17)
    {
      v35 = 0;
      v20 = (uint8x8_t)vcnt_s8(v17);
      v20.i16[0] = vaddlv_u8(v20);
      v21 = v20.i32[0];
      if (v20.i32[0])
      {
        v22 = 0;
        do
        {
          if (((1 << v22) & *(_QWORD *)&v17) != 0)
          {
            ((void (*)(uint64_t *))v31)(v19);
            if (v35)
              break;
            --v21;
          }
          if (v22 > 0x3E)
            break;
          ++v22;
        }
        while (v21 > 0);
      }
    }

    supportedSizeClasses = v15->_supportedSizeClasses;
    v15->_supportedSizeClasses = v18;
    v24 = v18;

    v15->_indexOfSelectedSizeClass = 0;
    v15->_usesAmbientScaleFactorForRemovableBackgroundItems = 0;
    objc_opt_self();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1, v29, v30);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (id)-[SBHWidgetWrapperViewController registerForTraitChanges:withAction:](v15, "registerForTraitChanges:withAction:", v26, sel__userInterfaceStyleDidChange);

  }
  return v15;
}

void __114__SBHWidgetWrapperViewController_initWithGalleryItem_titleAndSubtitleVisible_listLayoutProvider_iconViewProvider___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3)
{
  void *v3;
  id v4;

  if (a3 <= 0xB && ((1 << a3) & 0xC5E) != 0)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (void)loadView
{
  void *v3;
  void *v4;
  SBHWidgetWrapperView *v5;

  v5 = -[SBHWidgetWrapperView initWithTitleAndSubtitleVisible:]([SBHWidgetWrapperView alloc], "initWithTitleAndSubtitleVisible:", self->_titleAndSubtitleVisible);
  -[SBHAddWidgetSheetGalleryItem sbh_appName](self->_galleryItem, "sbh_appName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetWrapperView setTitle:](v5, "setTitle:", v3);

  -[SBHAddWidgetSheetGalleryItem sbh_widgetName](self->_galleryItem, "sbh_widgetName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetWrapperView setSubtitle:](v5, "setSubtitle:", v4);

  -[SBHWidgetWrapperView setBackgroundType:](v5, "setBackgroundType:", -[SBHWidgetWrapperViewController wrapperViewBackgroundType](self, "wrapperViewBackgroundType"));
  -[SBHWidgetWrapperViewController setView:](self, "setView:", v5);
  -[SBHWidgetWrapperViewController _updateAvocadoHostViewController](self, "_updateAvocadoHostViewController");

}

- (void)dealloc
{
  objc_super v3;

  -[SBHWidgetWrapperViewController _removeIconViewKeepObserving:](self, "_removeIconViewKeepObserving:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBHWidgetWrapperViewController;
  -[SBHWidgetWrapperViewController dealloc](&v3, sel_dealloc);
}

- (int64_t)selectedSizeClass
{
  void *v2;
  int64_t v3;

  -[NSArray objectAtIndex:](self->_supportedSizeClasses, "objectAtIndex:", self->_indexOfSelectedSizeClass);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setSelectedSizeClass:(int64_t)a3
{
  NSArray *supportedSizeClasses;
  void *v6;
  uint64_t v7;
  NSObject *v8;

  if (-[SBHWidgetWrapperViewController selectedSizeClass](self, "selectedSizeClass") != a3)
  {
    supportedSizeClasses = self->_supportedSizeClasses;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSArray indexOfObject:](supportedSizeClasses, "indexOfObject:", v6);

    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      SBLogWidgets();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SBHWidgetWrapperViewController setSelectedSizeClass:].cold.1(a3, (uint64_t)self, v8);

      v7 = 0;
    }
    -[SBHWidgetWrapperViewController setIndexOfSelectedSizeClass:](self, "setIndexOfSelectedSizeClass:", v7);
  }
}

- (void)setIndexOfSelectedSizeClass:(unint64_t)a3
{
  id v4;

  if (self->_indexOfSelectedSizeClass != a3)
  {
    self->_indexOfSelectedSizeClass = a3;
    -[SBHWidgetWrapperViewController _updateAvocadoHostViewController](self, "_updateAvocadoHostViewController");
    -[SBHWidgetWrapperViewController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "wrapperViewControllerSelectedSizeClassChanged:", self);

  }
}

- (void)setGalleryItem:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[SBHAddWidgetSheetGalleryItem isEqual:](self->_galleryItem, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_galleryItem, a3);
    -[SBHWidgetWrapperViewController _updateAvocadoHostViewController](self, "_updateAvocadoHostViewController");
  }

}

- (void)setDragging:(BOOL)a3
{
  if (self->_dragging != a3)
  {
    self->_dragging = a3;
    -[SBHWidgetWrapperViewController _updateAvocadoHostViewController](self, "_updateAvocadoHostViewController");
  }
}

- (void)setForcesEdgeAntialiasing:(BOOL)a3
{
  void *v4;
  char v5;
  id v6;

  if (self->_forcesEdgeAntialiasing != a3)
  {
    self->_forcesEdgeAntialiasing = a3;
    -[SBIconView customIconImageViewController](self->_iconView, "customIconImageViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[SBIconView customIconImageViewController](self->_iconView, "customIconImageViewController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setForcesEdgeAntialiasing:", self->_forcesEdgeAntialiasing);

    }
  }
}

- (void)setBackgroundType:(int64_t)a3
{
  id v4;

  if (self->_backgroundType != a3)
  {
    self->_backgroundType = a3;
    if (-[SBHWidgetWrapperViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SBHWidgetWrapperViewController wrapperView](self, "wrapperView");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBackgroundType:", -[SBHWidgetWrapperViewController wrapperViewBackgroundType](self, "wrapperViewBackgroundType"));

    }
  }
}

- (void)_removeIconViewKeepObserving:(BOOL)a3
{
  void *v5;
  SBIconView *iconView;
  SBIconView *v7;
  id defaultBackgroundViewProvider;
  id defaultBackgroundViewConfigurator;
  void *v10;

  -[SBHWidgetWrapperViewController wrapperView](self, "wrapperView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  iconView = self->_iconView;
  if (iconView)
  {
    v10 = v5;
    if (!a3)
    {
      -[SBIconView removeObserver:](iconView, "removeObserver:", self);
      v5 = v10;
    }
    objc_msgSend(v5, "setContentView:", 0);
    v7 = self->_iconView;
    self->_iconView = 0;

    defaultBackgroundViewProvider = self->_defaultBackgroundViewProvider;
    self->_defaultBackgroundViewProvider = 0;

    defaultBackgroundViewConfigurator = self->_defaultBackgroundViewConfigurator;
    self->_defaultBackgroundViewConfigurator = 0;

    v5 = v10;
  }

}

- (id)effectiveIconImageAppearance
{
  void *v2;
  void *v3;

  -[SBHWidgetWrapperViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_iconImageAppearanceFromTraitCollection:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)effectiveIconImageStyleConfiguration
{
  void *v2;
  void *v3;

  -[SBHWidgetWrapperViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_iconImageStyleConfigurationFromTraitCollection:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateAvocadoHostViewController
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "No SBIcon for descriptor: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)_configureIconView:(id)a3 forIcon:(id)a4
{
  id v6;
  SBHMappedIconListLayoutProvider *v7;
  void *v8;
  SBHMappedIconListLayoutProvider *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  id defaultBackgroundViewProvider;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id defaultBackgroundViewConfigurator;
  void *v24;
  id v25;

  v25 = a3;
  v6 = a4;
  v7 = [SBHMappedIconListLayoutProvider alloc];
  -[SBHWidgetWrapperViewController listLayoutProvider](self, "listLayoutProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBHMappedIconListLayoutProvider initWithTargetListLayoutProvider:](v7, "initWithTargetListLayoutProvider:", v8);

  -[SBHMappedIconListLayoutProvider mapIconLocation:toIconLocation:](v9, "mapIconLocation:toIconLocation:", CFSTR("SBIconLocationAddWidgetSheet"), CFSTR("SBIconLocationRoot"));
  objc_msgSend(v25, "setLocation:", CFSTR("SBIconLocationAddWidgetSheet"));
  objc_msgSend(v25, "setListLayoutProvider:", v9);
  objc_msgSend(v6, "gridSizeClass");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 != CFSTR("SBHIconGridSizeClassDefault") && (-[__CFString isEqualToString:](v10, "isEqualToString:") & 1) == 0)
  {
    -[SBHWidgetWrapperViewController listLayoutProvider](self, "listLayoutProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutForIconLocation:", CFSTR("SBIconLocationRoot"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "setIconImageInfo:", SBHIconListLayoutIconImageInfoForGridSizeClass(v13, v11));
  }
  objc_msgSend(v25, "addObserver:", self);
  -[SBHWidgetWrapperViewController iconViewProvider](self, "iconViewProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configureIconView:forIcon:", v25, v6);

  objc_msgSend(v25, "setOverrideActionDelegate:", self);
  objc_msgSend(v25, "setCustomIconImageViewHitTestingDisabled:", 1);
  objc_msgSend(v25, "setStartsDragMoreQuickly:", 1);
  objc_msgSend(v25, "setIcon:", v6);
  objc_msgSend(v25, "iconViewSize");
  BSRectWithSize();
  objc_msgSend(v25, "setBounds:");
  defaultBackgroundViewProvider = self->_defaultBackgroundViewProvider;
  self->_defaultBackgroundViewProvider = 0;

  objc_msgSend(v25, "customIconImageViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v16, "backgroundViewProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    v19 = self->_defaultBackgroundViewProvider;
    self->_defaultBackgroundViewProvider = v18;

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBHWidgetWrapperViewController _widgetBackgroundViewProvider](self, "_widgetBackgroundViewProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundViewProvider:", v20);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v16, "backgroundViewConfigurator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    defaultBackgroundViewConfigurator = self->_defaultBackgroundViewConfigurator;
    self->_defaultBackgroundViewConfigurator = v22;

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBHWidgetWrapperViewController _widgetBackgroundViewConfigurator](self, "_widgetBackgroundViewConfigurator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundViewConfigurator:", v24);

  }
}

- (id)_widgetBackgroundViewConfigurator
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[4];
  id v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = _Block_copy(self->_defaultBackgroundViewConfigurator);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__SBHWidgetWrapperViewController__widgetBackgroundViewConfigurator__block_invoke;
  aBlock[3] = &unk_1E8D85D10;
  objc_copyWeak(&v10, &location);
  v9 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);
  v6 = _Block_copy(v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

void __67__SBHWidgetWrapperViewController__widgetBackgroundViewConfigurator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = objc_opt_class();
  v16 = v5;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v16;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  objc_msgSend(v9, "underlyingBackgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configureBackgroundView:matchingMaterialBeneathWrapperViewController:", v10, WeakRetained);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v9, "widgetBackgroundView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      v14 = v13;
    else
      v14 = v16;
    v15 = v14;

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (id)_widgetBackgroundViewProvider
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;
  id v9;
  id location;

  v3 = _Block_copy(self->_defaultBackgroundViewProvider);
  if (v3)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__SBHWidgetWrapperViewController__widgetBackgroundViewProvider__block_invoke;
    aBlock[3] = &unk_1E8D85D38;
    v8 = v3;
    objc_copyWeak(&v9, &location);
    v4 = _Block_copy(aBlock);
    objc_destroyWeak(&v9);

    objc_destroyWeak(&location);
  }
  else
  {
    v4 = 0;
  }
  v5 = _Block_copy(v4);

  return v5;
}

SBHWidgetWrapperBackgroundView *__63__SBHWidgetWrapperViewController__widgetBackgroundViewProvider__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  SBHWidgetWrapperBackgroundView *v10;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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

  if (v6)
  {
    objc_msgSend(v6, "setBlurEnabled:", 0);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backgroundViewMatchingMaterialBeneathWrapperViewController:", WeakRetained);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[SBHWidgetWrapperBackgroundView initWithUnderlyingBackgroundView:widgetBackgroundView:]([SBHWidgetWrapperBackgroundView alloc], "initWithUnderlyingBackgroundView:widgetBackgroundView:", v9, v6);
  }
  else
  {
    v10 = (SBHWidgetWrapperBackgroundView *)v4;
  }

  return v10;
}

- (id)_widgetDragHandler
{
  void *v2;
  void *v3;

  -[SBHWidgetWrapperViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widgetDragHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_configureCustomImageViewController:(id)a3 iconView:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  double v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  double v19;
  void *v20;
  int v21;
  double v22;
  id v23;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setForcesEdgeAntialiasing:", self->_forcesEdgeAntialiasing);
  v8 = objc_opt_class();
  v23 = v6;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v23;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  objc_msgSend(v10, "setHighlightsAtAnySize:", 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "setAlwaysShowsAsStack:", 1);
    -[SBHWidgetWrapperViewController wrapperView](self, "wrapperView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setExtraSpacingBetweenWidgetAndTitle:", 5.0);

  }
  if (self->_usesAmbientScaleFactorForRemovableBackgroundItems)
  {
    objc_msgSend(v7, "setIconContentScalingEnabled:", 1);
    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    v14 = 1.0;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v23, "contentViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_opt_isKindOfClass();

      if ((v17 & 1) != 0)
      {
        objc_msgSend(v15, "metrics");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "scaleFactor");
        v14 = v19;

      }
    }
    -[SBHWidgetWrapperViewController galleryItem](self, "galleryItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "sbh_supportsRemovableBackgroundOrAccessoryFamilies");

    v22 = 1.05;
    if (!v21)
      v22 = 1.0;
    objc_msgSend(v7, "setIconContentScale:", 1.0 / (v14 * v22));
  }
  -[SBHWidgetWrapperViewController setUpWidgetStyleManagerForIconView:](self, "setUpWidgetStyleManagerForIconView:", v7);

}

- (void)setUpWidgetStyleManagerForIconView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  SBHWidgetStyleManager *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "customIconImageViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v16, "icon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isWidgetIcon"))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
    objc_msgSend(v7, "activeDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gridSizeClass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBHWidgetWrapperViewController effectiveIconImageStyleConfiguration](self, "effectiveIconImageStyleConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "iconImageInfo");
    v15 = -[SBHWidgetStyleManager initWithWidgetViewController:widgetDataSource:gridSizeClass:iconImageInfo:imageStyleConfiguration:delegate:]([SBHWidgetStyleManager alloc], "initWithWidgetViewController:widgetDataSource:gridSizeClass:iconImageInfo:imageStyleConfiguration:delegate:", v4, v8, v9, v10, self, v11, v12, v13, v14);
    -[SBHWidgetWrapperViewController setWidgetStyleManager:](self, "setWidgetStyleManager:", v15);

  }
}

- (int64_t)wrapperViewBackgroundType
{
  int64_t v3;

  v3 = -[SBHWidgetWrapperViewController backgroundType](self, "backgroundType");
  if (v3 == 2)
    return -[SBHAddWidgetSheetGalleryItem sbh_supportsRemovableBackgroundOrAccessoryFamilies](self->_galleryItem, "sbh_supportsRemovableBackgroundOrAccessoryFamilies");
  else
    return v3 == 1;
}

- (void)_userInterfaceStyleDidChange
{
  id v2;

  -[SBIconView customIconImageViewController](self->_iconView, "customIconImageViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "evaluateBackground");

}

- (void)iconTapped:(id)a3
{
  id v4;

  -[SBHWidgetWrapperViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "iconTapped:", self);

}

- (void)iconViewWillBeginDrag:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SBHWidgetWrapperViewController setDragging:](self, "setDragging:", 1);
  -[SBHWidgetWrapperViewController _widgetDragHandler](self, "_widgetDragHandler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "didBeginDraggingWidgetIcon:", v5);
}

- (void)iconViewDidEndDrag:(id)a3
{
  void *v4;
  void *v5;
  SBIconView *v6;

  v6 = (SBIconView *)a3;
  -[SBHWidgetWrapperViewController setDragging:](self, "setDragging:", 0);
  if (self->_iconView != v6)
    -[SBIconView removeObserver:](v6, "removeObserver:", self);
  -[SBHWidgetWrapperViewController _widgetDragHandler](self, "_widgetDragHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView icon](v6, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didEndDraggingWidgetIcon:", v5);

}

- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(v8, "customIconImageViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[SBHWidgetWrapperViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", v6);
  if (v7)
  {
    -[SBHWidgetWrapperViewController bs_addChildViewController:](self, "bs_addChildViewController:", v7);
    -[SBHWidgetWrapperViewController _configureCustomImageViewController:iconView:](self, "_configureCustomImageViewController:iconView:", v7, v8);
  }

}

- (void)widgetStyleManager:(id)a3 needsToAddBackgroundView:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBHWidgetWrapperViewController wrapperView](self, "wrapperView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundView:", v5);

}

- (void)widgetStyleManager:(id)a3 needsToRemoveBackgroundView:(id)a4
{
  id v4;

  -[SBHWidgetWrapperViewController wrapperView](self, "wrapperView", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundView:", 0);

}

- (void)widgetStyleManager:(id)a3 needsToAddFilter:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[SBHWidgetWrapperViewController iconView](self, "iconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sbh_addFilter:", v5);
}

- (void)widgetStyleManager:(id)a3 needsToRemoveFilter:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[SBHWidgetWrapperViewController iconView](self, "iconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sbh_removeFilterWithName:", v7);
}

- (CGAffineTransform)contentTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[22].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[22].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[23].b;
  return self;
}

- (void)setContentTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_contentTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_contentTransform.c = v4;
  *(_OWORD *)&self->_contentTransform.tx = v3;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (CGAffineTransform)shadowTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[23].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[23].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[24].b;
  return self;
}

- (void)setShadowTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_shadowTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_shadowTransform.c = v4;
  *(_OWORD *)&self->_shadowTransform.tx = v3;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (SBIconViewProviding)iconViewProvider
{
  return (SBIconViewProviding *)objc_loadWeakRetained((id *)&self->_iconViewProvider);
}

- (SBHAddWidgetSheetGalleryItem)galleryItem
{
  return self->_galleryItem;
}

- (NSArray)supportedSizeClasses
{
  return self->_supportedSizeClasses;
}

- (unint64_t)indexOfSelectedSizeClass
{
  return self->_indexOfSelectedSizeClass;
}

- (BOOL)forcesEdgeAntialiasing
{
  return self->_forcesEdgeAntialiasing;
}

- (BOOL)usesAmbientScaleFactorForRemovableBackgroundItems
{
  return self->_usesAmbientScaleFactorForRemovableBackgroundItems;
}

- (void)setUsesAmbientScaleFactorForRemovableBackgroundItems:(BOOL)a3
{
  self->_usesAmbientScaleFactorForRemovableBackgroundItems = a3;
}

- (SBHWidgetWrapperViewControllerDelegate)delegate
{
  return (SBHWidgetWrapperViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)backgroundType
{
  return self->_backgroundType;
}

- (BOOL)titleAndSubtitleVisible
{
  return self->_titleAndSubtitleVisible;
}

- (void)setTitleAndSubtitleVisible:(BOOL)a3
{
  self->_titleAndSubtitleVisible = a3;
}

- (SBIconView)iconView
{
  return self->_iconView;
}

- (BOOL)isDragging
{
  return self->_dragging;
}

- (id)defaultBackgroundViewProvider
{
  return self->_defaultBackgroundViewProvider;
}

- (void)setDefaultBackgroundViewProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (id)defaultBackgroundViewConfigurator
{
  return self->_defaultBackgroundViewConfigurator;
}

- (void)setDefaultBackgroundViewConfigurator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (SBHWidgetStyleManager)widgetStyleManager
{
  return self->_widgetStyleManager;
}

- (void)setWidgetStyleManager:(id)a3
{
  objc_storeStrong((id *)&self->_widgetStyleManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetStyleManager, 0);
  objc_storeStrong(&self->_defaultBackgroundViewConfigurator, 0);
  objc_storeStrong(&self->_defaultBackgroundViewProvider, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_supportedSizeClasses, 0);
  objc_storeStrong((id *)&self->_galleryItem, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
}

- (void)setSelectedSizeClass:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  NSStringFromWidgetFamily();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a2 + 992);
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1CFEF3000, a3, OS_LOG_TYPE_ERROR, "size class %{public}@ is not in the supported size classes for descriptor %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
