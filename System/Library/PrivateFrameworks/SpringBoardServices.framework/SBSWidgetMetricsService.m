@implementation SBSWidgetMetricsService

- (SBSWidgetMetricsService)init
{
  void *v3;
  SBSWidgetMetricsService *v4;

  +[SBSWidgetMetricsServer checkOutServerInstance](SBSWidgetMetricsServer, "checkOutServerInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBSWidgetMetricsService initWithMetricsProvider:](self, "initWithMetricsProvider:", v3);

  return v4;
}

- (SBSWidgetMetricsService)initWithMetricsProvider:(id)a3
{
  id v4;
  SBSWidgetMetricsService *v5;
  SBSWidgetMetricsService *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBSWidgetMetricsService;
  v5 = -[SBSWidgetMetricsService init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_metricsProvider, v4);

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBSWidgetMetricsService metricsProvider](self, "metricsProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    +[SBSWidgetMetricsServer returnServerInstance:](SBSWidgetMetricsServer, "returnServerInstance:", v3);

  v4.receiver = self;
  v4.super_class = (Class)SBSWidgetMetricsService;
  -[SBSWidgetMetricsService dealloc](&v4, sel_dealloc);
}

- (id)systemMetricsForWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBSWidgetMetricsService metricsProvider](self, "metricsProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemMetricsForWidget:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)previewMetricsSpecificationForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBSWidgetMetricsService metricsProvider](self, "metricsProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewMetricsSpecificationForBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)previewMetricsSpecificationForDeviceContext:(id)a3 displayContext:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SBSWidgetMetricsService metricsProvider](self, "metricsProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "previewMetricsSpecificationForDeviceContext:displayContext:bundleIdentifier:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)systemMetricsForWidget:(id)a3 inHostingEnvironment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[SBSWidgetMetricsService metricsProvider](self, "metricsProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemMetricsForWidget:inHostingEnvironment:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)previewMetricsSpecificationsForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBSWidgetMetricsService metricsProvider](self, "metricsProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewMetricsSpecificationsForBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)previewMetricsSpecificationsForDeviceContext:(id)a3 displayContext:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SBSWidgetMetricsService metricsProvider](self, "metricsProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "previewMetricsSpecificationsForDeviceContext:displayContext:bundleIdentifier:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (SBSWidgetHostingEnvironmentMetricsProviding)metricsProvider
{
  return (SBSWidgetHostingEnvironmentMetricsProviding *)objc_loadWeakRetained((id *)&self->_metricsProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_metricsProvider);
}

@end
