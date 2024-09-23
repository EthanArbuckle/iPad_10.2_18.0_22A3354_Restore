@implementation TPSAnalyticsDataProvider

- (id)deliveryInfoVersion
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "deliveryInfoVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (TPSAnalyticsDataProvider)initWithDataSource:(id)a3
{
  id v4;
  TPSAnalyticsDataProvider *v5;
  TPSAnalyticsDataProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSAnalyticsDataProvider;
  v5 = -[TPSAnalyticsDataProvider init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dataSource, v4);

  return v6;
}

- (id)displayTypeForIdentifier:(id)a3
{
  TPSAnalyticsDataProviderDataSource **p_dataSource;
  id v4;
  id WeakRetained;
  void *v6;

  p_dataSource = &self->_dataSource;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(WeakRetained, "displayTypeForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)experimentCampID
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "experimentCampID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)experimentID
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "experimentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)correlationIDForIdentifier:(id)a3
{
  TPSAnalyticsDataProviderDataSource **p_dataSource;
  id v4;
  id WeakRetained;
  void *v6;

  p_dataSource = &self->_dataSource;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(WeakRetained, "correlationIDForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bundleIDForIdentifier:(id)a3
{
  TPSAnalyticsDataProviderDataSource **p_dataSource;
  id v4;
  id WeakRetained;
  void *v6;

  p_dataSource = &self->_dataSource;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(WeakRetained, "bundleIDForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contextForIdentifier:(id)a3
{
  TPSAnalyticsDataProviderDataSource **p_dataSource;
  id v4;
  id WeakRetained;
  void *v6;

  p_dataSource = &self->_dataSource;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(WeakRetained, "contextForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hintDisplayedCountForIdentifier:(id)a3
{
  TPSAnalyticsDataProviderDataSource **p_dataSource;
  id v4;
  id WeakRetained;
  unint64_t v6;

  p_dataSource = &self->_dataSource;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  v6 = objc_msgSend(WeakRetained, "hintDisplayedCountForIdentifier:", v4);

  return v6;
}

- (TPSAnalyticsDataProviderDataSource)dataSource
{
  return (TPSAnalyticsDataProviderDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
