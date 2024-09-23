@implementation SKUIApplicationControllerOptions

- (SKUIApplicationControllerOptions)init
{
  SKUIApplicationControllerOptions *result;
  objc_super v4;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIApplicationControllerOptions init].cold.1();
  }
  v4.receiver = self;
  v4.super_class = (Class)SKUIApplicationControllerOptions;
  result = -[SKUIApplicationControllerOptions init](&v4, sel_init);
  if (result)
  {
    result->_supportsFullApplicationReload = 1;
    result->_tabBarControllerStyle = 0;
    *(_DWORD *)((char *)&result->_tabBarControllerStyle + 7) = 0;
    result->_bootstrapScriptFallbackMaximumAge = 604800.0;
    result->_bootstrapScriptTimeoutInterval = 30.0;
    result->_useTransientStorageForTests = 0;
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v2 = 10;
  if (!self->_supportsFullApplicationReload)
    v2 = 0;
  v3 = v2 | self->_requiresLocalBootstrapScript;
  v4 = 100;
  if (!self->_pageRenderMetricsEnabled)
    v4 = 0;
  v5 = (v3 | v4) + 1000 * self->_tabBarControllerStyle;
  v6 = 10000;
  if (!self->_bootstrapScriptFallbackEnabled)
    v6 = 0;
  v7 = v5
     + v6
     + 100000 * (unint64_t)self->_bootstrapScriptFallbackMaximumAge
     + 1000000 * (unint64_t)self->_bootstrapScriptTimeoutInterval;
  v8 = 10000000;
  if (!self->_useTransientStorageForTests)
    v8 = 0;
  return v7 + v8;
}

- (BOOL)isEqual:(id)a3
{
  SKUIApplicationControllerOptions *v4;
  SKUIApplicationControllerOptions *v5;
  BOOL v6;

  v4 = (SKUIApplicationControllerOptions *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = self->_requiresLocalBootstrapScript == v5->_requiresLocalBootstrapScript
        && self->_supportsFullApplicationReload == v5->_supportsFullApplicationReload
        && self->_pageRenderMetricsEnabled == v5->_pageRenderMetricsEnabled
        && self->_tabBarControllerStyle == v5->_tabBarControllerStyle
        && self->_bootstrapScriptFallbackEnabled == v5->_bootstrapScriptFallbackEnabled
        && self->_bootstrapScriptFallbackMaximumAge == v5->_bootstrapScriptFallbackMaximumAge
        && self->_bootstrapScriptTimeoutInterval == v5->_bootstrapScriptTimeoutInterval
        && self->_useTransientStorageForTests == v5->_useTransientStorageForTests;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  SKUIMutableApplicationControllerOptions *v4;

  v4 = objc_alloc_init(SKUIMutableApplicationControllerOptions);
  -[SKUIMutableApplicationControllerOptions setSupportsFullApplicationReload:](v4, "setSupportsFullApplicationReload:", self->_supportsFullApplicationReload);
  -[SKUIMutableApplicationControllerOptions setTabBarControllerStyle:](v4, "setTabBarControllerStyle:", self->_tabBarControllerStyle);
  -[SKUIMutableApplicationControllerOptions setPageRenderMetricsEnabled:](v4, "setPageRenderMetricsEnabled:", self->_pageRenderMetricsEnabled);
  -[SKUIMutableApplicationControllerOptions setRequiresLocalBootstrapScript:](v4, "setRequiresLocalBootstrapScript:", self->_requiresLocalBootstrapScript);
  -[SKUIMutableApplicationControllerOptions setBootstrapScriptFallbackEnabled:](v4, "setBootstrapScriptFallbackEnabled:", self->_bootstrapScriptFallbackEnabled);
  -[SKUIMutableApplicationControllerOptions setBootstrapScriptFallbackMaximumAge:](v4, "setBootstrapScriptFallbackMaximumAge:", self->_bootstrapScriptFallbackMaximumAge);
  -[SKUIMutableApplicationControllerOptions setBootstrapScriptTimeoutInterval:](v4, "setBootstrapScriptTimeoutInterval:", self->_bootstrapScriptTimeoutInterval);
  -[SKUIMutableApplicationControllerOptions setUseTransientStorageForTests:](v4, "setUseTransientStorageForTests:", self->_useTransientStorageForTests);
  return v4;
}

- (BOOL)supportsFullApplicationReload
{
  return self->_supportsFullApplicationReload;
}

- (int64_t)tabBarControllerStyle
{
  return self->_tabBarControllerStyle;
}

- (BOOL)pageRenderMetricsEnabled
{
  return self->_pageRenderMetricsEnabled;
}

- (BOOL)requiresLocalBootstrapScript
{
  return self->_requiresLocalBootstrapScript;
}

- (BOOL)isBootstrapScriptFallbackEnabled
{
  return self->_bootstrapScriptFallbackEnabled;
}

- (double)bootstrapScriptFallbackMaximumAge
{
  return self->_bootstrapScriptFallbackMaximumAge;
}

- (double)bootstrapScriptTimeoutInterval
{
  return self->_bootstrapScriptTimeoutInterval;
}

- (BOOL)useTransientStorageForTests
{
  return self->_useTransientStorageForTests;
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIApplicationControllerOptions init]";
}

@end
