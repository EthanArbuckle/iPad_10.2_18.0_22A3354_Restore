@implementation PRWidgetGridSnapshotViewController

- (PRWidgetGridSnapshotViewController)initWithScene:(id)a3 complicationLayoutProvider:(id)a4 gridType:(unint64_t)a5
{
  id v9;
  id v10;
  PRWidgetGridSnapshotViewController *v11;
  PRWidgetGridSnapshotViewController *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PRWidgetGridModel *v25;
  void *v26;
  PRWidgetGridModel *v27;
  PRWidgetGridViewController *v28;
  PRWidgetGridViewController *widgetGridViewController;
  PRWidgetGridViewController *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  objc_super v39;

  v9 = a3;
  v10 = a4;
  v39.receiver = self;
  v39.super_class = (Class)PRWidgetGridSnapshotViewController;
  v11 = -[PRWidgetGridSnapshotViewController init](&v39, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_scene, a3);
    objc_msgSend(v9, "settings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pui_posterContents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "identity");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "type") == 3)
    {
      v15 = -[PRPosterConfiguration _initWithPath:]([PRPosterConfiguration alloc], "_initWithPath:", v14, v34, v14);
      v38 = 0;
      objc_msgSend(v15, "loadComplicationLayoutWithError:", &v38);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v38;
      if (v17)
      {
        PRLogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[PRWidgetGridSnapshotViewController initWithScene:complicationLayoutProvider:gridType:].cold.1((uint64_t)v15, (uint64_t)v17, v18);

      }
    }
    else
    {
      objc_msgSend(v9, "settings", v34, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "pui_previewIdentifier");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "complicationLayoutForPreviewIdentifier:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v37 = v10;
    if (a5 == 1)
    {
      objc_msgSend(v16, "sidebarComplications");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "complicationIconLayout");
    }
    else
    {
      objc_msgSend(v16, "complications");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sidebarComplicationIconLayout");
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0C9AA60];
    if (v16)
    {
      objc_msgSend(v20, "bs_map:", &__block_literal_global_16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bs_filter:", &__block_literal_global_3_1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = (void *)MEMORY[0x1E0C9AA60];
    }
    v25 = [PRWidgetGridModel alloc];
    if (v24)
      v26 = v24;
    else
      v26 = v22;
    v27 = -[PRWidgetGridModel initWithComplicationDescriptors:iconLayout:type:](v25, "initWithComplicationDescriptors:iconLayout:type:", v26, v21, a5);
    v28 = -[PRWidgetGridViewController initWithModel:iconViewProvider:]([PRWidgetGridViewController alloc], "initWithModel:iconViewProvider:", v27, 0);
    widgetGridViewController = v12->_widgetGridViewController;
    v12->_widgetGridViewController = v28;

    v30 = v12->_widgetGridViewController;
    objc_msgSend(v9, "clientSettings");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "pr_vibrancyConfiguration");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRWidgetGridViewController setVibrancyConfiguration:](v30, "setVibrancyConfiguration:", v32);

    v10 = v37;
  }

  return v12;
}

PRComplicationDescriptor *__88__PRWidgetGridSnapshotViewController_initWithScene_complicationLayoutProvider_gridType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PRComplicationDescriptor *v3;

  v2 = a2;
  v3 = -[PRComplicationDescriptor initWithPRSWidget:]([PRComplicationDescriptor alloc], "initWithPRSWidget:", v2);

  return v3;
}

uint64_t __88__PRWidgetGridSnapshotViewController_initWithScene_complicationLayoutProvider_gridType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasMatchingDescriptor");
}

- (void)viewDidLoad
{
  PRWidgetGridViewController *widgetGridViewController;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRWidgetGridSnapshotViewController;
  -[PRWidgetGridSnapshotViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[PRWidgetGridSnapshotViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_widgetGridViewController);
  widgetGridViewController = self->_widgetGridViewController;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__PRWidgetGridSnapshotViewController_viewDidLoad__block_invoke;
  v4[3] = &unk_1E2184010;
  v4[4] = self;
  -[PRWidgetGridViewController ensureContentWithTimeout:completion:](widgetGridViewController, "ensureContentWithTimeout:completion:", v4, 5.0);
}

void __49__PRWidgetGridSnapshotViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FCC0]), "initWithInfo:responder:", 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendActions:", v3);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRWidgetGridSnapshotViewController;
  -[PRWidgetGridSnapshotViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[PRWidgetGridViewController view](self->_widgetGridViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRWidgetGridSnapshotViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (void)invalidate
{
  -[PRWidgetGridViewController invalidate](self->_widgetGridViewController, "invalidate");
}

- (FBSScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  objc_storeStrong((id *)&self->_scene, a3);
}

- (PRWidgetGridViewController)widgetGridViewController
{
  return self->_widgetGridViewController;
}

- (void)setWidgetGridViewController:(id)a3
{
  objc_storeStrong((id *)&self->_widgetGridViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetGridViewController, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

- (void)initWithScene:(uint64_t)a1 complicationLayoutProvider:(uint64_t)a2 gridType:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_18B634000, log, OS_LOG_TYPE_ERROR, "Error loading complication layout from poster configuration %@: %@", (uint8_t *)&v3, 0x16u);
}

@end
