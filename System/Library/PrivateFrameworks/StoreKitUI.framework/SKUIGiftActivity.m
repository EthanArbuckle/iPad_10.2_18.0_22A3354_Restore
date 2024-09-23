@implementation SKUIGiftActivity

- (SKUIGiftActivity)initWithItem:(id)a3 clientContext:(id)a4
{
  id v7;
  id v8;
  SKUIGiftActivity *v9;
  SKUIGiftActivity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftActivity initWithItem:clientContext:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIGiftActivity;
  v9 = -[UIActivity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a4);
    objc_storeStrong((id *)&v10->_item, a3);
  }

  return v10;
}

- (id)activityImage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("ShareSheetGift"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activityTitle
{
  SKUIClientContext *clientContext;

  clientContext = self->_clientContext;
  if (clientContext)
    -[SKUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("SHARE_SHEET_GIFT_TITLE"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("SHARE_SHEET_GIFT_TITLE"), 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)activityType
{
  return CFSTR("SKUIActivityTypeGift");
}

- (id)activityViewController
{
  SKUIGift *v3;
  SKUIGiftViewController *v4;

  v3 = -[SKUIGift initWithItem:]([SKUIGift alloc], "initWithItem:", self->_item);
  v4 = -[SKUIGiftViewController initWithGift:]([SKUIGiftViewController alloc], "initWithGift:", v3);
  -[SKUIGiftViewController setClientContext:](v4, "setClientContext:", self->_clientContext);
  -[SKUIGiftViewController setGiftDelegate:](v4, "setGiftDelegate:", self);

  return v4;
}

- (id)_beforeActivity
{
  return (id)*MEMORY[0x1E0CEB1C0];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)giftViewController:(id)a3 didFinishWithResult:(BOOL)a4
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithItem:clientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGiftActivity initWithItem:clientContext:]";
}

@end
