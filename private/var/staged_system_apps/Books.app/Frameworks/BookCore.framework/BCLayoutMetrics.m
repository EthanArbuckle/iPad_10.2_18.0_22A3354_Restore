@implementation BCLayoutMetrics

- (BCLayoutMetrics)initWithObserver:(id)a3 factory:(id)a4 manager:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BCLayoutMetrics *v14;
  BCLayoutMetrics *v15;
  void *v16;
  uint64_t v17;
  TUITemplate *metricsTemplate;
  void *v19;
  void *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BCLayoutMetrics;
  v14 = -[BCLayoutMetrics init](&v22, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_observer, v10);
    objc_storeStrong((id *)&v15->_metricsTemplateFactory, a4);
    objc_storeStrong((id *)&v15->_manager, a5);
    objc_storeWeak((id *)&v15->_delegate, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "metricsTemplateURL"));
    v17 = objc_claimAutoreleasedReturnValue(-[TUITemplateFactory templateFromURL:](v15->_metricsTemplateFactory, "templateFromURL:", v16));
    metricsTemplate = v15->_metricsTemplate;
    v15->_metricsTemplate = (TUITemplate *)v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v19, "addObserver:selector:name:object:", v15, "_fontNeedsUpdate", NSCurrentLocaleDidChangeNotification, 0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v20, "addObserver:forKeyPath:options:context:", v15, TUIUserDefaultForceFallbackFont, 0, off_3079F8);

  }
  return v15;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, TUIUserDefaultForceFallbackFont, off_3079F8);

  v5.receiver = self;
  v5.super_class = (Class)BCLayoutMetrics;
  -[BCLayoutMetrics dealloc](&v5, "dealloc");
}

- (void)_fontNeedsUpdate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  objc_msgSend(WeakRetained, "bc_environmentDidChangeFont");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD block[5];

  if (off_3079F8 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_17F8C;
    block[3] = &unk_28B960;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)BCLayoutMetrics;
    -[BCLayoutMetrics observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (BOOL)updateIfNeededWithEnvironment:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSDictionary *v6;
  NSDictionary *metrics;

  v4 = a3;
  v5 = -[BCLayoutMetrics _needsUpdatingWithEnvironment:](self, "_needsUpdatingWithEnvironment:", v4);
  if (v5)
  {
    if (v4)
    {
      v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[BCLayoutMetrics _computeMetricsWithEnvironment:](self, "_computeMetricsWithEnvironment:", v4));
      metrics = self->_metrics;
      self->_metrics = v6;
    }
    else
    {
      metrics = self->_metrics;
      self->_metrics = 0;
    }

  }
  return v5;
}

- (BOOL)_needsUpdatingWithEnvironment:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutMetrics environment](self, "environment"));

  LOBYTE(v6) = 1;
  if (v4 && v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutMetrics environment](self, "environment"));
    v6 = objc_msgSend(v4, "isEqualToEnvironment:", v7) ^ 1;

  }
  return v6;
}

- (void)invalidate
{
  TUIEnvironment *environment;
  NSDictionary *metrics;

  environment = self->_environment;
  self->_environment = 0;

  metrics = self->_metrics;
  self->_metrics = 0;

}

- (id)_computeMetricsWithEnvironment:(id)a3
{
  id v5;
  id v6;
  void *v7;
  TUIManager *manager;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v5 = a3;
  kdebug_trace(725353712, 104, 0, 0, 0);
  objc_storeStrong((id *)&self->_environment, a3);
  v6 = objc_alloc((Class)TUIInstantiateContext);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUITemplate package](self->_metricsTemplate, "package"));
  manager = self->_manager;
  v9 = (void *)objc_opt_new(TUIIdentifierMap);
  v10 = objc_msgSend(v6, "initWithDelegate:package:manager:identifierMap:environment:state:feedId:", 0, v7, manager, v9, v5, 0, TUIFeedIdentifierNil);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutMetrics delegate](self, "delegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUITemplate package](self->_metricsTemplate, "package"));
  objc_msgSend(v11, "addSymbolsToMetricsEnvironment:package:", v5, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v27 = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "instantiateTemplate:bindings:actionObject:", self->_metricsTemplate, 0, 0));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v16 = objc_msgSend((id)objc_opt_class(WeakRetained), "supportedMetrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v23 = objc_msgSend((id)objc_opt_class(v22), "sectionName");
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sectionForKey:", v24));
        if (v25)
        {
          objc_msgSend(v22, "configureWithSection:", v25);
          objc_msgSend(v13, "setObject:forKey:", v22, v24);
        }

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v19);
  }

  kdebug_trace(725353712, 105, 0, 0, 0);
  return v13;
}

- (BOOL)compactWidth
{
  return self->_compactWidth;
}

- (void)setCompactWidth:(BOOL)a3
{
  self->_compactWidth = a3;
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (BCMetricsEnvironmentObserver)observer
{
  return (BCMetricsEnvironmentObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (BCLayoutMetricsDelegate)delegate
{
  return (BCLayoutMetricsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TUITemplateFactory)metricsTemplateFactory
{
  return self->_metricsTemplateFactory;
}

- (void)setMetricsTemplateFactory:(id)a3
{
  objc_storeStrong((id *)&self->_metricsTemplateFactory, a3);
}

- (TUITemplate)metricsTemplate
{
  return self->_metricsTemplate;
}

- (void)setMetricsTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_metricsTemplate, a3);
}

- (TUIEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (TUIManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_metricsTemplate, 0);
  objc_storeStrong((id *)&self->_metricsTemplateFactory, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
