@implementation SKUICountdownComponent

- (SKUICountdownComponent)initWithCustomPageContext:(id)a3
{
  id v4;
  SKUICountdownComponent *v5;
  SKUICountdown *v6;
  void *v7;
  uint64_t v8;
  SKUICountdown *countdown;
  objc_super v11;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUICountdownComponent initWithCustomPageContext:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUICountdownComponent;
  v5 = -[SKUIPageComponent initWithCustomPageContext:](&v11, sel_initWithCustomPageContext_, v4);
  if (v5)
  {
    v6 = [SKUICountdown alloc];
    objc_msgSend(v4, "componentDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SKUICountdown initWithCountdownDictionary:](v6, "initWithCountdownDictionary:", v7);
    countdown = v5->_countdown;
    v5->_countdown = (SKUICountdown *)v8;

  }
  return v5;
}

- (int64_t)componentType
{
  return 2;
}

- (SKUICountdown)countdown
{
  return self->_countdown;
}

- (void)setCountdown:(id)a3
{
  objc_storeStrong((id *)&self->_countdown, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countdown, 0);
}

- (void)initWithCustomPageContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUICountdownComponent initWithCustomPageContext:]";
}

@end
