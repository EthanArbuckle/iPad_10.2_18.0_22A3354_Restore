@implementation SKUIDonationStepViewController

- (SKUIDonationStepViewController)initWithCharity:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  SKUIDonationStepViewController *v9;
  SKUIDonationStepViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDonationStepViewController initWithCharity:configuration:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIDonationStepViewController;
  v9 = -[SKUIDonationStepViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_charity, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
  }

  return v10;
}

- (SKUIDonationViewController)donationViewController
{
  void *v2;
  id v3;

  -[SKUIDonationStepViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (SKUIDonationViewController *)v3;
}

- (SKUIGiftCharity)charity
{
  return self->_charity;
}

- (SKUIDonationConfiguration)donationConfiguration
{
  return self->_configuration;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_charity, 0);
}

- (void)initWithCharity:configuration:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIDonationStepViewController initWithCharity:configuration:]";
}

@end
