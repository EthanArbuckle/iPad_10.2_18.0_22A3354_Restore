@implementation SKUIITunesPassLearnMoreAlertDelegate

- (SKUIITunesPassLearnMoreAlertDelegate)initWithRedeemConfiguration:(id)a3 clientContext:(id)a4
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  SKUIITunesPassLearnMoreAlertDelegate *v17;
  SKUIITunesPassLearnMoreAlertDelegate *v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        -[SKUIITunesPassLearnMoreAlertDelegate initWithRedeemConfiguration:clientContext:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIITunesPassLearnMoreAlertDelegate;
  v17 = -[SKUIITunesPassLearnMoreAlertDelegate init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_clientContext, a4);
    objc_storeStrong((id *)&v18->_redeemConfiguration, a3);
  }

  return v18;
}

+ (void)beginThrottleInterval
{
  OUTLINED_FUNCTION_1();
}

+ (BOOL)shouldShowAlertForRedeem:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;

  v5 = a4;
  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        +[SKUIITunesPassLearnMoreAlertDelegate shouldShowAlertForRedeem:configuration:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  objc_msgSend(v5, "ITunesPassConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "learnMoreAlertView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "ITunesPassLearnMoreAlertInterval");
  v18 = v17;

  if (v18 >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", CFSTR("SKUILastITunesPassLearnMoreAlertTime"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v22 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v21, "doubleValue");
      objc_msgSend(v22, "dateWithTimeIntervalSinceReferenceDate:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "timeIntervalSinceNow");
      if (v24 > -v18)
      {

        v16 = 0;
      }

    }
    v19 = v16;
  }
  else
  {
    v19 = 0;
  }

  return v19 != 0;
}

- (void)show
{
  void *v3;
  id object;

  -[SKUIRedeemConfiguration ITunesPassConfiguration](self->_redeemConfiguration, "ITunesPassConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "learnMoreAlertView");
  object = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(object, "setDelegate:", self);
  objc_setAssociatedObject(object, "com.apple.StoreKitUI.SKUIITunesPassLearnMoreAlertDelegate", self, (void *)1);
  objc_msgSend(object, "show");
  objc_msgSend((id)objc_opt_class(), "beginThrottleInterval");

}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  void *v6;
  SKUIRedeemITunesPassLearnMoreViewController *v7;
  void *v8;
  id object;

  object = a3;
  if (objc_msgSend(object, "cancelButtonIndex") != a4)
  {
    -[SKUIITunesPassLearnMoreAlertDelegate presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc_init(SKUIRedeemITunesPassLearnMoreViewController);
      -[SKUIRedeemStepViewController setClientContext:](v7, "setClientContext:", self->_clientContext);
      -[SKUIRedeemStepViewController setConfiguration:](v7, "setConfiguration:", self->_redeemConfiguration);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v7);
      objc_msgSend(v6, "presentViewController:animated:completion:", v8, 1, 0);

    }
  }
  objc_msgSend(object, "setDelegate:", 0);
  objc_setAssociatedObject(object, "com.apple.StoreKitUI.SKUIITunesPassLearnMoreAlertDelegate", 0, (void *)1);

}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redeemConfiguration, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithRedeemConfiguration:(uint64_t)a3 clientContext:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)shouldShowAlertForRedeem:(uint64_t)a3 configuration:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
