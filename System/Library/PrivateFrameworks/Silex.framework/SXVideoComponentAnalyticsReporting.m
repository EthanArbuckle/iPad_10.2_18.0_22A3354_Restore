@implementation SXVideoComponentAnalyticsReporting

- (SXVideoComponentAnalyticsReporting)initWithComponent:(id)a3 analyticsProviding:(id)a4
{
  id v7;
  id v8;
  SXVideoComponentAnalyticsReporting *v9;
  SXVideoComponentAnalyticsReporting *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXVideoComponentAnalyticsReporting;
  v9 = -[SXVideoComponentAnalyticsReporting init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_component, a3);
    objc_storeWeak((id *)&v10->_analyticsReporting, v8);
  }

  return v10;
}

- (void)reportEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v16;
    -[SXVideoComponentAnalyticsReporting component](self, "component");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "analytics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "jsonDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMetaData:", v7);

    -[SXVideoComponentAnalyticsReporting component](self, "component");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setComponentIdentifier:", v9);

    -[SXVideoComponentAnalyticsReporting component](self, "component");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setComponentType:", v11);

    -[SXVideoComponentAnalyticsReporting component](self, "component");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "classification");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "roleString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setComponentRole:", v14);

  }
  -[SXVideoComponentAnalyticsReporting analyticsReporting](self, "analyticsReporting");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reportEvent:", v16);

}

- (SXVideoComponent)component
{
  return self->_component;
}

- (SXAnalyticsReporting)analyticsReporting
{
  return (SXAnalyticsReporting *)objc_loadWeakRetained((id *)&self->_analyticsReporting);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_analyticsReporting);
  objc_storeStrong((id *)&self->_component, 0);
}

@end
