@implementation PRInlineComplicationSnapshotViewController

- (PRInlineComplicationSnapshotViewController)initWithComplicationDescriptor:(id)a3
{
  id v5;
  PRInlineComplicationSnapshotViewController *v6;
  PRInlineComplicationSnapshotViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRInlineComplicationSnapshotViewController;
  v6 = -[PRInlineComplicationSnapshotViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_complicationDescriptor, a3);

  return v7;
}

- (PRInlineComplicationSnapshotViewController)initWithScene:(id)a3 complicationLayoutProvider:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  PRComplicationDescriptor *v16;
  void *v17;
  void *v18;
  PRComplicationDescriptor *v19;
  void *v20;
  PRComplicationDescriptor *v21;
  PRInlineComplicationSnapshotViewController *v22;
  void *v23;
  void *v24;
  id v26;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_scene, a3);
  objc_msgSend(v7, "settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pui_posterContents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "type") == 3)
  {
    v12 = -[PRPosterConfiguration _initWithPath:]([PRPosterConfiguration alloc], "_initWithPath:", v10);
    v26 = 0;
    objc_msgSend(v12, "loadComplicationLayoutWithError:", &v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v26;
    if (v14)
    {
      PRLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[PRInlineComplicationSnapshotViewController initWithScene:complicationLayoutProvider:].cold.1((uint64_t)v12, (uint64_t)v14, v15);
      v16 = 0;
    }
    else
    {
      v21 = [PRComplicationDescriptor alloc];
      objc_msgSend(v13, "inlineComplication");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = -[PRComplicationDescriptor initWithPRSWidget:](v21, "initWithPRSWidget:", v15);
    }

  }
  else
  {
    objc_msgSend(v7, "settings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pui_previewIdentifier");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "complicationLayoutForPreviewIdentifier:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = [PRComplicationDescriptor alloc];
    objc_msgSend(v18, "inlineComplication");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PRComplicationDescriptor initWithPRSWidget:](v19, "initWithPRSWidget:", v20);

  }
  if (!-[PRComplicationDescriptor hasMatchingDescriptor](v16, "hasMatchingDescriptor"))
  {

    v16 = 0;
  }
  v22 = -[PRInlineComplicationSnapshotViewController initWithComplicationDescriptor:](self, "initWithComplicationDescriptor:", v16);
  if (v22)
  {
    objc_msgSend(v7, "clientSettings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pr_vibrancyConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[PRInlineComplicationSnapshotViewController setVibrancyConfiguration:](v22, "setVibrancyConfiguration:", v24);
  }

  return v22;
}

- (void)invalidate
{
  -[CHUISWidgetHostViewController invalidate](self->_hostViewController, "invalidate");
}

- (void)viewDidLoad
{
  CHUISWidgetHostViewController *v3;
  CHUISWidgetHostViewController *v4;
  CFAbsoluteTime Current;
  CHUISWidgetHostViewController *hostViewController;
  void *v7;
  FBSScene *scene;
  void *v9;
  _QWORD v10[4];
  id v11[2];
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PRInlineComplicationSnapshotViewController;
  -[PRInlineComplicationSnapshotViewController viewDidLoad](&v13, sel_viewDidLoad);
  if (self->_complicationDescriptor
    && (-[PRInlineComplicationSnapshotViewController _hostViewControllerForComplicationDescriptor:](self, "_hostViewControllerForComplicationDescriptor:"), v3 = (CHUISWidgetHostViewController *)objc_claimAutoreleasedReturnValue(), v4 = self->_hostViewController, self->_hostViewController = v3, v4, self->_hostViewController))
  {
    -[PRInlineComplicationSnapshotViewController bs_addChildViewController:](self, "bs_addChildViewController:");
    Current = CFAbsoluteTimeGetCurrent();
    objc_initWeak(&location, self);
    hostViewController = self->_hostViewController;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__PRInlineComplicationSnapshotViewController_viewDidLoad__block_invoke;
    v10[3] = &unk_1E2185728;
    objc_copyWeak(v11, &location);
    v11[1] = *(id *)&Current;
    -[CHUISWidgetHostViewController ensureContentWithTimeout:completion:](hostViewController, "ensureContentWithTimeout:completion:", v10, 5.0);
    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FCC0]), "initWithInfo:responder:", 0, 0);
    scene = self->_scene;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSScene sendActions:](scene, "sendActions:", v9);

  }
}

void __57__PRInlineComplicationSnapshotViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  double Current;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  double v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    Current = CFAbsoluteTimeGetCurrent();
    PRLogSnapshotter();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v3)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v8 = WeakRetained[124];
        v9 = Current - *(double *)(a1 + 40);
        v15 = 138543874;
        v16 = v8;
        v17 = 2048;
        v18 = v9;
        v19 = 2114;
        v20 = v3;
        _os_log_error_impl(&dword_18B634000, v7, OS_LOG_TYPE_ERROR, "Error loading content for snapshot %{public}@ (%f seconds elapsed): %{public}@", (uint8_t *)&v15, 0x20u);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = WeakRetained[124];
      v11 = Current - *(double *)(a1 + 40);
      v15 = 138543618;
      v16 = v10;
      v17 = 2048;
      v18 = v11;
      _os_log_impl(&dword_18B634000, v7, OS_LOG_TYPE_DEFAULT, "Successfully loaded content for snapshot %{public}@ (%f seconds elapsed)", (uint8_t *)&v15, 0x16u);
    }

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FCC0]), "initWithInfo:responder:", 0, 0);
    v13 = (void *)WeakRetained[121];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendActions:", v14);

  }
}

- (void)setVibrancyConfiguration:(id)a3
{
  BSUIVibrancyConfiguration *v5;

  v5 = (BSUIVibrancyConfiguration *)a3;
  if (self->_vibrancyConfiguration != v5)
  {
    objc_storeStrong((id *)&self->_vibrancyConfiguration, a3);
    -[CHUISWidgetHostViewController setVibrancyConfiguration:](self->_hostViewController, "setVibrancyConfiguration:", v5);
  }

}

- (BOOL)isComplicationUserInteractionEnabled
{
  return self->_touchBlockingView == 0;
}

- (void)setComplicationUserInteractionEnabled:(BOOL)a3
{
  UIView *touchBlockingView;
  UIView *v5;
  id v6;
  UIView *v7;
  void *v8;
  UIView *v9;
  id v10;

  touchBlockingView = self->_touchBlockingView;
  if ((((touchBlockingView != 0) ^ a3) & 1) == 0)
  {
    if (a3)
    {
      -[UIView removeFromSuperview](touchBlockingView, "removeFromSuperview");
      v5 = self->_touchBlockingView;
      self->_touchBlockingView = 0;

    }
    else
    {
      -[PRInlineComplicationSnapshotViewController view](self, "view");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v10, "bounds");
      v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
      -[UIView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
      -[UIView layer](v7, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHitTestsAsOpaque:", 1);

      objc_msgSend(v10, "addSubview:", v7);
      v9 = self->_touchBlockingView;
      self->_touchBlockingView = v7;

    }
  }
}

- (void)complicationsWillDisplay
{
  -[CHUISWidgetHostViewController setPresentationMode:](self->_hostViewController, "setPresentationMode:", 2);
}

- (void)complicationsDidEndDisplaying
{
  -[CHUISWidgetHostViewController setPresentationMode:](self->_hostViewController, "setPresentationMode:", 3);
}

- (id)_hostViewControllerForComplicationDescriptor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D10310]);
  objc_msgSend(v5, "pr_initWithComplicationDescriptor:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDrawSystemBackgroundMaterialIfNecessary:", 0);
  objc_msgSend(v6, "setVisibility:", 2);
  objc_msgSend(v6, "setContentType:", 0);
  objc_msgSend(v6, "setColorScheme:", 2);
  v7 = objc_alloc_init(MEMORY[0x1E0D10058]);
  objc_msgSend(v7, "setShowsDateAlongsideText:", 1);
  objc_msgSend(v7, "setSymbolScale:", 1);
  v8 = objc_alloc_init(MEMORY[0x1E0D10040]);
  objc_msgSend(v8, "setSize:", &unk_1E21DD328);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1438]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWeight:", v9);

  objc_msgSend(v7, "setFontSpecification:", v8);
  objc_msgSend(v6, "setInlineTextParameters:", v7);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10258]), "initWithPrimaryTintColor:secondaryTintColor:filterStyle:fallbackFilterStyle:fraction:", 0, 0, 2, 2, 1.0);
  objc_msgSend(v6, "setTintParameters:", v10);
  -[PRInlineComplicationSnapshotViewController vibrancyConfiguration](self, "vibrancyConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVibrancyConfiguration:", v11);

  objc_msgSend(v6, "setPresentationMode:", 2);
  objc_msgSend(v4, "widget");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PRSharedWidgetDescriptorProvider();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "descriptorForPersonality:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "intentType");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15
    && (v16 = (void *)v15,
        objc_msgSend(v12, "intent"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        !v17))
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __91__PRInlineComplicationSnapshotViewController__hostViewControllerForComplicationDescriptor___block_invoke;
    v19[3] = &unk_1E2185750;
    v20 = v6;
    v21 = v12;
    v22 = v4;
    objc_msgSend(v14, "loadDefaultIntent:", v19);

  }
  else
  {
    objc_msgSend(v6, "setPresentationMode:", 2);
  }

  return v6;
}

void __91__PRInlineComplicationSnapshotViewController__hostViewControllerForComplicationDescriptor___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(a1[4], "widget");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = a1[5];

    if (v4 == v5)
    {
      objc_msgSend(a1[5], "widgetByReplacingIntent:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "setWidget:", v6);
      objc_msgSend(a1[4], "setWidget:", v6);

    }
    objc_msgSend(a1[4], "setPresentationMode:", 2);
  }
  else
  {
    PRLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __91__PRInlineComplicationSnapshotViewController__hostViewControllerForComplicationDescriptor___block_invoke_cold_1((uint64_t)a1, v7);

  }
}

- (PRComplicationDescriptor)complicationDescriptor
{
  return self->_complicationDescriptor;
}

- (void)setComplicationDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_complicationDescriptor, a3);
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_complicationDescriptor, 0);
  objc_storeStrong((id *)&self->_touchBlockingView, 0);
  objc_storeStrong((id *)&self->_hostViewController, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

- (void)initWithScene:(NSObject *)a3 complicationLayoutProvider:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_0_3(&dword_18B634000, a3, (uint64_t)a3, "Error loading complication layout from poster configuration %@: %@", (uint8_t *)&v3);
}

void __91__PRInlineComplicationSnapshotViewController__hostViewControllerForComplicationDescriptor___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_0_3(&dword_18B634000, a2, v6, "Default intent asked for but not provided: %@ - %@", (uint8_t *)&v7);

}

@end
