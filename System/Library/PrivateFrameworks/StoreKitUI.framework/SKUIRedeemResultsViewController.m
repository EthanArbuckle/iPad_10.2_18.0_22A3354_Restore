@implementation SKUIRedeemResultsViewController

+ (BOOL)canShowResultsForRedeem:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIRedeemResultsViewController canShowResultsForRedeem:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = (void *)MEMORY[0x1E0C99DA0];
  v13 = *MEMORY[0x1E0C99768];
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "raise:format:", v13, CFSTR("Your view controller class (%@) MUST override %@ to be considered for showing a redeem"), v15, v16);

  return 0;
}

+ (id)redeemResultsControllerForRedeem:(id)a3
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
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIRedeemResultsViewController redeemResultsControllerForRedeem:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
LABEL_7:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v16);
      if ((objc_msgSend(v17, "canShowResultsForRedeem:", v3, (_QWORD)v20) & 1) != 0)
        break;
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v14)
          goto LABEL_7;
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    v17 = 0;
  }

  v18 = (void *)objc_msgSend(objc_alloc((Class)v17), "initWithRedeem:", v3);
  return v18;
}

- (SKUIRedeemResultsViewController)initWithRedeem:(id)a3
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKUIRedeemResultsViewController *v14;
  SKUIRedeemResultsViewController *v15;
  SKUIRedeemResultsViewController *v16;
  SKUIRedeemResultsViewController *v17;
  objc_super v19;

  v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIRedeemResultsViewController initWithRedeem:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (-[SKUIRedeemResultsViewController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    +[SKUIRedeemResultsViewController redeemResultsControllerForRedeem:](SKUIRedeemResultsViewController, "redeemResultsControllerForRedeem:", v5);
    v14 = (SKUIRedeemResultsViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SKUIRedeemResultsViewController;
    v15 = -[SKUIRedeemResultsViewController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
    v16 = v15;
    if (v15)
      objc_storeStrong((id *)&v15->_redeem, a3);
    v14 = v16;
    self = v14;
  }
  v17 = v14;

  return v17;
}

- (SKUIRedeemResultsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIRedeemResultsViewController initWithNibName:bundle:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  return 0;
}

- (SKUIRedeemResultsViewController)initWithCoder:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIRedeemResultsViewController initWithCoder:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }

  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUIRedeemResultsViewController;
  -[SKUIRedeemResultsViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[SKUIRedeemStepViewController clientContext](self, "clientContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemResultsViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesBackButton:", 1);
  v5 = objc_alloc_init(MEMORY[0x1E0DC34F0]);
  objc_msgSend(v5, "setAction:", sel__doneAction_);
  objc_msgSend(v5, "setTarget:", self);
  if (v3)
    objc_msgSend(v3, "localizedStringForKey:inTable:", CFSTR("REDEEM_SUCCESS_DONE_BUTTON"), CFSTR("Redeem"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_SUCCESS_DONE_BUTTON"), 0, CFSTR("Redeem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  objc_msgSend(v5, "setStyle:", 2);
  objc_msgSend(v4, "setRightBarButtonItem:", v5);

}

- (void)_doneAction:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  SKUIITunesPassLearnMoreAlertDelegate *v7;
  void *v8;
  void *v9;
  SKUIITunesPassLearnMoreAlertDelegate *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  SKUIRedeemResultsViewController *v16;
  SKUIRedeemResultsViewController *v17;
  SKUIITunesPassLearnMoreAlertDelegate *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  SKUIITunesPassLearnMoreAlertDelegate *v22;

  if (-[SKUIRedeemStepViewController shouldShowPassbookLearnMore](self, "shouldShowPassbookLearnMore", a3)
    && (-[SKUIRedeemResultsViewController redeem](self, "redeem"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SKUIRedeemStepViewController configuration](self, "configuration"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = +[SKUIITunesPassLearnMoreAlertDelegate shouldShowAlertForRedeem:configuration:](SKUIITunesPassLearnMoreAlertDelegate, "shouldShowAlertForRedeem:configuration:", v4, v5), v5, v4, v6))
  {
    v7 = [SKUIITunesPassLearnMoreAlertDelegate alloc];
    -[SKUIRedeemStepViewController configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemStepViewController clientContext](self, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SKUIITunesPassLearnMoreAlertDelegate initWithRedeemConfiguration:clientContext:](v7, "initWithRedeemConfiguration:clientContext:", v8, v9);

    -[SKUIRedeemResultsViewController presentingViewController](self, "presentingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIITunesPassLearnMoreAlertDelegate setPresentingViewController:](v10, "setPresentingViewController:", v11);

  }
  else
  {
    v10 = 0;
  }
  -[SKUIRedeemResultsViewController redeem](self, "redeem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "redirectURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIRedeemResultsViewController parentViewController](self, "parentViewController");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (SKUIRedeemResultsViewController *)v14;
  else
    v16 = self;
  v17 = v16;

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __47__SKUIRedeemResultsViewController__doneAction___block_invoke;
  v20[3] = &unk_1E739FD10;
  v21 = v13;
  v22 = v10;
  v18 = v10;
  v19 = v13;
  -[SKUIRedeemResultsViewController dismissViewControllerAnimated:completion:](v17, "dismissViewControllerAnimated:completion:", 1, v20);

}

void __47__SKUIRedeemResultsViewController__doneAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    SKUIMetricsOpenURL(v2);
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    if (v3)
      objc_msgSend(v3, "show");
  }
}

- (SKUIRedeem)redeem
{
  return self->_redeem;
}

- (void)setRedeem:(id)a3
{
  objc_storeStrong((id *)&self->_redeem, a3);
}

- (int64_t)redeemCategory
{
  return self->_redeemCategory;
}

- (void)setRedeemCategory:(int64_t)a3
{
  self->_redeemCategory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redeem, 0);
}

+ (void)canShowResultsForRedeem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)redeemResultsControllerForRedeem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithRedeem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithNibName:(uint64_t)a3 bundle:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
