@implementation SBHWidgetStyleManager

- (SBHWidgetStyleManager)initWithWidgetViewController:(id)a3 widgetDataSource:(id)a4 gridSizeClass:(id)a5 iconImageInfo:(SBIconImageInfo *)a6 imageStyleConfiguration:(id)a7 delegate:(id)a8
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  id v22;
  id v23;
  id v24;
  SBIconImageInfo *v25;
  id v26;
  SBHWidgetStyleManager *v27;
  SBHWidgetStyleManager *v28;
  uint64_t v29;
  NSString *gridSizeClass;
  uint64_t v31;
  SBHIconImageStyleConfiguration *imageStyleConfiguration;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  objc_super v39;
  _QWORD v40[3];

  v14 = v11;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  v40[2] = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v23 = a4;
  v24 = a5;
  v25 = a6;
  v26 = a7;
  v39.receiver = self;
  v39.super_class = (Class)SBHWidgetStyleManager;
  v27 = -[SBHWidgetStyleManager init](&v39, sel_init);
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_widgetViewController, a3);
    objc_storeStrong((id *)&v28->_widgetDataSource, a4);
    v29 = objc_msgSend(v24, "copy");
    gridSizeClass = v28->_gridSizeClass;
    v28->_gridSizeClass = (NSString *)v29;

    v28->_iconImageInfo.size.width = v17;
    v28->_iconImageInfo.size.height = v16;
    v28->_iconImageInfo.scale = v15;
    v28->_iconImageInfo.continuousCornerRadius = v14;
    v31 = -[SBIconImageInfo copy](v25, "copy");
    imageStyleConfiguration = v28->_imageStyleConfiguration;
    v28->_imageStyleConfiguration = (SBHIconImageStyleConfiguration *)v31;

    objc_storeWeak((id *)&v28->_delegate, v26);
    -[SBHWidgetStyleManager updateConfiguration](v28, "updateConfiguration");
    -[SBHWidgetStyleManager widgetHostViewController](v28, "widgetHostViewController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "sbh_addObserver:", v28);
    objc_opt_self();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v34;
    objc_opt_self();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (id)objc_msgSend(v22, "registerForTraitChanges:withTarget:action:", v36, v28, sel_updateConfiguration);

  }
  return v28;
}

- (void)setImageStyleConfiguration:(id)a3
{
  SBHIconImageStyleConfiguration *v4;
  SBHIconImageStyleConfiguration *imageStyleConfiguration;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (SBHIconImageStyleConfiguration *)objc_msgSend(v6, "copy");
    imageStyleConfiguration = self->_imageStyleConfiguration;
    self->_imageStyleConfiguration = v4;

    -[SBHWidgetStyleManager updateConfiguration](self, "updateConfiguration");
  }

}

- (id)imageAppearance
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[SBHWidgetStyleManager effectiveWidgetViewController](self, "effectiveWidgetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_highestLevelTraitCollectionForViewController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");
  -[SBHWidgetStyleManager imageStyleConfiguration](self, "imageStyleConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "widgetAppearanceWithUserInterfaceStyle:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)needsGradientBackground
{
  void *v2;
  BOOL v3;

  -[SBHWidgetStyleManager widgetIconStyleConfiguration](self, "widgetIconStyleConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "backgroundType") == 2;

  return v3;
}

- (id)effectiveWidgetViewController
{
  void *v2;
  uint64_t v3;
  void *v4;
  char isKindOfClass;
  uint64_t v6;

  -[SBHWidgetStyleManager widgetViewController](self, "widgetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "sbh_isMultiplexingViewController"))
  {
    objc_msgSend(v2, "multiplexedViewController");
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v2, "contentViewController");
    v6 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v6;
  }
  return v2;
}

- (id)widgetHostViewController
{
  void *v2;
  void *v3;
  char isKindOfClass;
  id v5;

  -[SBHWidgetStyleManager effectiveWidgetViewController](self, "effectiveWidgetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v5 = v2;
  else
    v5 = 0;

  return v5;
}

- (void)updateConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SBHWidgetIconStyleConfiguration *v12;
  void *v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  -[SBHWidgetStyleManager effectiveWidgetViewController](self, "effectiveWidgetViewController");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetStyleManager widgetHostViewController](self, "widgetHostViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sbh_customDisplayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetStyleManager imageAppearance](self, "imageAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v5, "appearanceType");
  if (v31 == 2)
  {
    objc_msgSend(v5, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_userInterfaceStyleForIconImageAppearance:", v5);
  if (v4)
  {
    v8 = objc_msgSend(v4, "colorScheme");
    v9 = 1;
  }
  else
  {
    v9 = v7;
    if (v7 == 2)
      v8 = 2;
    else
      v8 = 1;
  }
  -[SBHWidgetStyleManager widgetDataSource](self, "widgetDataSource");
  v10 = objc_claimAutoreleasedReturnValue();
  -[SBHWidgetStyleManager gridSizeClass](self, "gridSizeClass");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sbh_widgetExtensionProvider");
  v35 = (void *)v11;
  v36 = (void *)v10;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SBHWidgetIconStyleConfiguration initWithWidgetDataSource:gridSizeClass:widgetViewController:widgetExtensionProvider:imageAppearance:customDisplayConfiguration:]([SBHWidgetIconStyleConfiguration alloc], "initWithWidgetDataSource:gridSizeClass:widgetViewController:widgetExtensionProvider:imageAppearance:customDisplayConfiguration:", v10, v11, v37, v34, v5, v4);
  -[SBHWidgetStyleManager widgetIconStyleConfiguration](self, "widgetIconStyleConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SBHWidgetIconStyleConfiguration isEqualToWidgetIconStyleConfiguration:](v12, "isEqualToWidgetIconStyleConfiguration:", v13))
  {
    v33 = v6;
    if (v3)
    {
      objc_msgSend(v3, "setColorScheme:", v8);
    }
    else
    {
      v14 = v4;
      objc_opt_self();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        objc_msgSend(v37, "tintWithHomeScreenTintColor:", objc_msgSend(objc_retainAutorelease(v33), "CGColor"));
      else
        objc_msgSend(v37, "setOverrideUserInterfaceStyle:", v9);
      v4 = v14;
    }
    objc_msgSend(v13, "imageAppearance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v29, "appearanceType");
    -[SBHWidgetStyleManager delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SBHWidgetIconStyleConfiguration backgroundType](v12, "backgroundType");
    if (v19 != objc_msgSend(v13, "backgroundType") || v31 != v17)
    {
      -[SBHWidgetStyleManager backgroundView](self, "backgroundView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v18, "widgetStyleManager:needsToRemoveBackgroundView:", self, v20);
      objc_msgSend(v30, "bounds");
      -[SBHWidgetStyleManager makeBackgroundViewForType:frame:](self, "makeBackgroundViewForType:frame:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21 && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v18, "widgetStyleManager:needsToAddBackgroundView:", self, v21);
      -[SBHWidgetStyleManager setBackgroundView:](self, "setBackgroundView:", v21);

    }
    -[SBHWidgetIconStyleConfiguration appropriateColorFilter](v12, "appropriateColorFilter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appropriateColorFilter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v33;
    if ((BSEqualObjects() & 1) == 0)
    {
      if (v23 && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v18, "widgetStyleManager:needsToRemoveFilter:", self, v23);
      if (v22 && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v18, "widgetStyleManager:needsToAddFilter:", self, v22);
    }
    if (v3)
    {
      v32 = v4;
      -[SBHWidgetIconStyleConfiguration appropriateWidgetRenderScheme](v12, "appropriateWidgetRenderScheme");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
        v26 = v24;
      else
        v26 = (id)objc_opt_new();
      v27 = v26;

      -[SBHWidgetIconStyleConfiguration appropriateWidgetTintParameters](v12, "appropriateWidgetTintParameters");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setRenderScheme:", v27);
      objc_msgSend(v3, "setTintParameters:fencingAnimations:", v28, 1);

      v4 = v32;
      v6 = v33;
    }
    -[SBHWidgetStyleManager setWidgetIconStyleConfiguration:](self, "setWidgetIconStyleConfiguration:", v12);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v18, "widgetStyleManagerDidUpdateConfiguration:", self);

  }
}

- (id)makeBackgroundViewForType:(int64_t)a3 frame:(CGRect)a4
{
  double continuousCornerRadius;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  continuousCornerRadius = self->_iconImageInfo.continuousCornerRadius;
  if (a3 == 1)
  {
    -[SBHWidgetStyleManager imageAppearance](self, "imageAppearance", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_userInterfaceStyleForIconImageAppearance:", v6);
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__21;
    v21 = __Block_byref_object_dispose__21;
    v22 = 0;
    v9 = (void *)MEMORY[0x1E0DC3F10];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__SBHWidgetStyleManager_makeBackgroundViewForType_frame___block_invoke;
    v12[3] = &unk_1E8D8DB98;
    v14 = &v17;
    v10 = v8;
    v13 = v10;
    v15 = continuousCornerRadius;
    v16 = v7;
    objc_msgSend(v9, "performWithoutAnimation:", v12);
    v5 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }
  else if (a3 == 2)
  {
    +[SBHWidgetContainerViewController buildGradientBackgroundViewWithFrame:continuousCornerRadius:](SBHWidgetContainerViewController, "buildGradientBackgroundViewWithFrame:continuousCornerRadius:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, continuousCornerRadius);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void __57__SBHWidgetStyleManager_makeBackgroundViewForType_frame___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:compatibleWithTraitCollection:", 3, *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_setContinuousCornerRadius:", *(double *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setGroupNameBase:", CFSTR("SBIconWidget"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "traitOverrides");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInterfaceStyle:", *(_QWORD *)(a1 + 56));

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (id)succinctDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "succinctStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBHWidgetStyleManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SBHWidgetStyleManager_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E8D84EF0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", self, v6);

}

void __51__SBHWidgetStyleManager_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "widgetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("widgetViewController"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "widgetDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("widgetDataSource"));

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "gridSizeClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "appendObject:withName:", v9, CFSTR("gridSizeClass"));

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "iconImageInfo");
  SBHStringForIconImageInfo(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v11, "appendObject:withName:", v16, CFSTR("iconImageInfo"));

  v18 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "imageAppearance");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v18, "appendObject:withName:", v20, CFSTR("imageAppearance"));

}

- (UIViewController)widgetViewController
{
  return self->_widgetViewController;
}

- (SBLeafIconDataSource)widgetDataSource
{
  return self->_widgetDataSource;
}

- (NSString)gridSizeClass
{
  return self->_gridSizeClass;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (SBHIconImageStyleConfiguration)imageStyleConfiguration
{
  return self->_imageStyleConfiguration;
}

- (SBHWidgetStyleManagerDelegate)delegate
{
  return (SBHWidgetStyleManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBHWidgetIconStyleConfiguration)widgetIconStyleConfiguration
{
  return self->_widgetIconStyleConfiguration;
}

- (void)setWidgetIconStyleConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_widgetIconStyleConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_gridSizeClass, 0);
  objc_storeStrong((id *)&self->_widgetDataSource, 0);
  objc_storeStrong((id *)&self->_widgetViewController, 0);
}

@end
