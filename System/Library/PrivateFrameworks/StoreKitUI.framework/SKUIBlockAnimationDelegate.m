@implementation SKUIBlockAnimationDelegate

- (SKUIBlockAnimationDelegate)initWithCompletionHandler:(id)a3
{
  id v4;
  SKUIBlockAnimationDelegate *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBlockAnimationDelegate initWithCompletionHandler:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIBlockAnimationDelegate;
  v5 = -[SKUIBlockAnimationDelegate init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void (**block)(id, id, BOOL);
  id v6;

  block = (void (**)(id, id, BOOL))self->_block;
  if (block)
  {
    block[2](block, a3, a4);
    v6 = self->_block;
    self->_block = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

- (void)initWithCompletionHandler:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIBlockAnimationDelegate initWithCompletionHandler:]";
}

@end
