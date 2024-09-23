@implementation SKUITracklistPageComponent

- (SKUITracklistPageComponent)initWithViewElement:(id)a3
{
  id v4;
  SKUITracklistPageComponent *v5;
  objc_super v7;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUITracklistPageComponent initWithViewElement:].cold.1();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUITracklistPageComponent;
  v5 = -[SKUIPageComponent initWithViewElement:](&v7, sel_initWithViewElement_, v4);

  return v5;
}

- (int64_t)componentType
{
  return 23;
}

- (void)initWithViewElement:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUITracklistPageComponent initWithViewElement:]";
}

@end
