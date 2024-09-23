@implementation SKUIRedeemStepViewController

- (BOOL)shouldShowPassbookLearnMore
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemStepViewController shouldShowPassbookLearnMore].cold.1();
  }
  v3 = SKUIPassKitCoreFramework();
  v4 = SKUIWeakLinkedClassForString(CFSTR("PKPassLibrary"), v3);
  -[SKUIRedeemStepViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ITunesPassConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return 0;
  if (!objc_msgSend(v4, "isPassLibraryAvailable"))
    return 0;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 1)
    return 0;
  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activeAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ITunesPassSerialNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc_init((Class)v4);
    objc_msgSend(v14, "passWithPassTypeIdentifier:serialNumber:", CFSTR("pass.com.apple.itunes.storecredit"), v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15 == 0;

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (SKUIRedeemConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (SKUIRedeemStepDelegate)redeemStepDelegate
{
  return (SKUIRedeemStepDelegate *)objc_loadWeakRetained((id *)&self->_redeemStepDelegate);
}

- (void)setRedeemStepDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_redeemStepDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_redeemStepDelegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)shouldShowPassbookLearnMore
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIRedeemStepViewController shouldShowPassbookLearnMore]";
}

@end
