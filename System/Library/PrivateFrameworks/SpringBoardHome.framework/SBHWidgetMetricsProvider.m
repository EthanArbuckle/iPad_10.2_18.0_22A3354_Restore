@implementation SBHWidgetMetricsProvider

- (id)systemDefaultMetricsSpecification
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;

  -[SBHWidgetMetricsProvider delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listLayoutProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = SBHScreenTypeForCurrentDevice();
  SBHWidgetMetricsSpecificationWithLayoutProviderAndScreenType(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)systemMetricsForFamily:(int64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;

  -[SBHWidgetMetricsProvider delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listLayoutProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = SBHScreenTypeForCurrentDevice();
  SBHWidgetMetricsForFamilyWithLayoutProviderAndScreenType(a3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)systemMetricsForWidget:(id)a3
{
  return -[SBHWidgetMetricsProvider systemMetricsForFamily:](self, "systemMetricsForFamily:", objc_msgSend(a3, "family"));
}

- (id)previewMetricsSpecificationForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;

  -[SBHWidgetMetricsProvider delegate](self, "delegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listLayoutProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = SBHScreenTypeForCurrentDevice();
  SBHWidgetMetricsSpecificationWithLayoutProviderAndScreenType(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)previewMetricsSpecificationForDeviceContext:(id)a3 displayContext:(id)a4 bundleIdentifier:(id)a5
{
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = SBHScreenTypeForDeviceAndDisplayContexts(a3, a4);
  -[SBHWidgetMetricsProvider delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v7, "widgetMetricsProvider:listLayoutProviderForScreenType:", self, v6),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v7, "listLayoutProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  SBHWidgetMetricsSpecificationWithLayoutProviderAndScreenType(v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (SBHWidgetMetricsProviderDelegate)delegate
{
  return (SBHWidgetMetricsProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
