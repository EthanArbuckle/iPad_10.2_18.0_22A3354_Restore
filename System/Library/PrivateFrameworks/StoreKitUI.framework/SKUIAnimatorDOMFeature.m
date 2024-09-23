@implementation SKUIAnimatorDOMFeature

- (SKUIAnimatorDOMFeature)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIAnimatorDOMFeature *v16;
  void *v17;
  uint64_t v18;
  NSString *featureName;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIAnimatorDOMFeature initWithDOMNode:featureName:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIAnimatorDOMFeature;
  v16 = -[SKUIAnimatorDOMFeature init](&v21, sel_init);
  if (v16)
  {
    objc_msgSend(v6, "appContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v16->_appContext, v17);

    v18 = objc_msgSend(v7, "copy");
    featureName = v16->_featureName;
    v16->_featureName = (NSString *)v18;

  }
  return v16;
}

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SKJSUIAnimatorDOMFeature *v12;
  void *v13;
  SKJSUIAnimatorDOMFeature *v14;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIAnimatorDOMFeature makeFeatureJSObjectForFeature:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = [SKJSUIAnimatorDOMFeature alloc];
  objc_msgSend(v3, "appContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SKJSUIAnimatorDOMFeature initWithAppContext:DOMFeature:](v12, "initWithAppContext:DOMFeature:", v13, v3);

  return v14;
}

+ (id)featureName
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    +[SKUIAnimatorDOMFeature featureName].cold.1();
  }
  return CFSTR("animator");
}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (SKUIAnimatorDOMFeatureDelegate)delegate
{
  return (SKUIAnimatorDOMFeatureDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDOMNode:(uint64_t)a3 featureName:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)makeFeatureJSObjectForFeature:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)featureName
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "+[SKUIAnimatorDOMFeature featureName]";
  OUTLINED_FUNCTION_1();
}

@end
