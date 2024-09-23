@implementation SBHWidgetIconResizeViewHelper

- (SBHWidgetIconResizeViewHelper)initWithDelegate:(id)a3 listLayout:(id)a4 widgetMetricsProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBHWidgetIconResizeViewHelper *v11;
  SBHWidgetIconResizeViewHelper *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBHWidgetIconResizeViewHelper;
  v11 = -[SBHWidgetIconResizeViewHelper init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v12->_listLayout, a4);
    objc_storeStrong((id *)&v12->_widgetMetricsProvider, a5);
  }

  return v12;
}

- (id)viewControllerForIconDataSource:(id)a3 icon:(id)a4 gridSizeClass:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  SBHWidgetContainerViewController *v18;
  SBWidgetIconResizeGestureWidgetWrapperViewController *v19;

  v8 = a3;
  v9 = a5;
  -[SBHWidgetIconResizeViewHelper delegateViewControllerForIconDataSource:icon:gridSizeClass:](self, "delegateViewControllerForIconDataSource:icon:gridSizeClass:", v8, a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[SBHWidgetIconResizeViewHelper widgetViewControllerForWidget:gridSizeClass:](self, "widgetViewControllerForWidget:gridSizeClass:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  -[SBHWidgetIconResizeViewHelper listLayout](self, "listLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = SBHIconListLayoutIconImageInfoForGridSizeClass(v13, v9);
  v18 = -[SBHWidgetContainerViewController initWithWidgetViewController:widgetDataSource:gridSizeClass:iconImageInfo:applicationName:]([SBHWidgetContainerViewController alloc], "initWithWidgetViewController:widgetDataSource:gridSizeClass:iconImageInfo:applicationName:", v10, v8, v9, &stru_1E8D8E958, v14, v15, v16, v17);
  v19 = -[SBWidgetIconResizeGestureWidgetWrapperViewController initWithWidgetViewController:]([SBWidgetIconResizeGestureWidgetWrapperViewController alloc], "initWithWidgetViewController:", v18);

  return v19;
}

- (id)widgetViewControllerForWidget:(id)a3 gridSizeClass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  -[SBHWidgetIconResizeViewHelper intentForWidget:](self, "intentForWidget:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chsWidgetWithGridSizeClass:intent:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHWidgetIconResizeViewHelper widgetMetricsProvider](self, "widgetMetricsProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "systemMetricsForWidget:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10310]), "initWithWidget:metrics:widgetConfigurationIdentifier:", v9, v11, v12);
  -[SBHWidgetIconResizeViewHelper configureWidgetViewController:](self, "configureWidgetViewController:", v13);

  return v13;
}

- (id)intentForWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBHWidgetIconResizeViewHelper delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconResizeViewHelper:intentForWidget:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)delegateViewControllerForIconDataSource:(id)a3 icon:(id)a4 gridSizeClass:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SBHWidgetIconResizeViewHelper delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconResizeViewHelper:viewControllerForIconDataSource:icon:gridSizeClass:", self, v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0)
    -[SBHWidgetIconResizeViewHelper configureWidgetViewController:](self, "configureWidgetViewController:", v12);

  return v12;
}

- (void)configureWidgetViewController:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setPresentationMode:", 2);
  objc_msgSend(v3, "setVisibility:", 2);
  objc_msgSend(v3, "setClipBehavior:", 2);

}

- (SBHWidgetIconResizeViewHelperDelegate)delegate
{
  return (SBHWidgetIconResizeViewHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SBIconListLayout)listLayout
{
  return self->_listLayout;
}

- (SBHWidgetMetricsProvider)widgetMetricsProvider
{
  return self->_widgetMetricsProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetMetricsProvider, 0);
  objc_storeStrong((id *)&self->_listLayout, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
