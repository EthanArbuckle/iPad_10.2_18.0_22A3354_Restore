@implementation SKUICollectionDOMFeature

- (SKUICollectionDOMFeature)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6;
  id v7;
  SKUICollectionDOMFeature *v8;
  void *v9;
  uint64_t v10;
  NSString *featureName;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUICollectionDOMFeature initWithDOMNode:featureName:].cold.1();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUICollectionDOMFeature;
  v8 = -[SKUICollectionDOMFeature init](&v13, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "appContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_appContext, v9);

    v10 = objc_msgSend(v7, "copy");
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v10;

  }
  return v8;
}

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3;
  SKUIJSDOMFeatureCollection *v4;
  void *v5;
  SKUIJSDOMFeatureCollection *v6;

  v3 = a3;
  v4 = [SKUIJSDOMFeatureCollection alloc];
  objc_msgSend(v3, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IKJSObject initWithAppContext:](v4, "initWithAppContext:", v5);

  -[SKUIJSDOMFeatureCollection setAppBridge:](v6, "setAppBridge:", v3);
  return v6;
}

+ (id)featureName
{
  return CFSTR("Collection");
}

- (void)setEditing:(BOOL)a3 options:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__SKUICollectionDOMFeature_setEditing_options___block_invoke;
  v9[3] = &unk_1E73A3550;
  v11 = a3;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(WeakRetained, "evaluateDelegateBlockSync:", v9);

}

void __47__SKUICollectionDOMFeature_setEditing_options___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("animated"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setEditing:animated:", v2, objc_msgSend(v3, "BOOLValue"));

}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (NSString)featureName
{
  return self->_featureName;
}

- (SKUICollectionDOMFeatureTargetting)collectionTarget
{
  return (SKUICollectionDOMFeatureTargetting *)objc_loadWeakRetained((id *)&self->_collectionTarget);
}

- (void)setCollectionTarget:(id)a3
{
  objc_storeWeak((id *)&self->_collectionTarget, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionTarget);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_destroyWeak((id *)&self->_appContext);
}

- (void)initWithDOMNode:featureName:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUICollectionDOMFeature initWithDOMNode:featureName:]";
}

@end
