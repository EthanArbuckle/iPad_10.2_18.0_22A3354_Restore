@implementation SKUIMediaQueryFeature

- (SKUIMediaQueryFeature)initWithFeatureName:(id)a3 value:(id)a4
{
  id v5;
  SKUIMediaQueryFeature *v6;
  uint64_t v7;
  NSString *featureName;
  objc_super v10;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaQueryFeature initWithFeatureName:value:].cold.1();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIMediaQueryFeature;
  v6 = -[SKUIMediaQueryFeature init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    featureName = v6->_featureName;
    v6->_featureName = (NSString *)v7;

  }
  return v6;
}

+ (BOOL)supportsFeatureName:(id)a3
{
  return 0;
}

- (BOOL)evaluateWithValues:(id)a3
{
  return 0;
}

- (NSArray)notificationNames
{
  return 0;
}

- (NSArray)requiredKeys
{
  return 0;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureName, 0);
}

- (void)initWithFeatureName:value:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMediaQueryFeature initWithFeatureName:value:]";
}

@end
