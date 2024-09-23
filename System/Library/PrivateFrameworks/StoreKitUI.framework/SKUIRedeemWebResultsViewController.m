@implementation SKUIRedeemWebResultsViewController

+ (BOOL)canShowResultsForRedeem:(id)a3
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
  void *v12;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIRedeemWebResultsViewController canShowResultsForRedeem:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  objc_msgSend(v3, "customizedThankyouURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12 != 0;
}

- (void)viewDidLoad
{
}

- (void)dealloc
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[SKUIRedeemWebResultsViewController childViewControllers](self, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "willMoveToParentViewController:", 0);
        objc_msgSend(v10, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeFromSuperview");

        objc_msgSend(v10, "removeFromParentViewController");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v12.receiver = self;
  v12.super_class = (Class)SKUIRedeemWebResultsViewController;
  -[SKUIRedeemWebResultsViewController dealloc](&v12, sel_dealloc);
}

- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4
{
  SKUIRedeemNativeResultsViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SKUIRedeemNativeResultsViewController *v11;

  if (!a4)
  {
    v5 = [SKUIRedeemNativeResultsViewController alloc];
    -[SKUIRedeemResultsViewController redeem](self, "redeem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SKUIRedeemNativeResultsViewController initWithRedeem:](v5, "initWithRedeem:", v6);

    -[SKUIRedeemStepViewController clientContext](self, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemStepViewController setClientContext:](v11, "setClientContext:", v7);

    -[SKUIRedeemResultsViewController setRedeemCategory:](v11, "setRedeemCategory:", -[SKUIRedeemResultsViewController redeemCategory](self, "redeemCategory"));
    -[SKUIRedeemStepViewController operationQueue](self, "operationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemNativeResultsViewController setOperationQueue:](v11, "setOperationQueue:", v8);

    -[SKUIRedeemStepViewController configuration](self, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemStepViewController setConfiguration:](v11, "setConfiguration:", v9);

    -[SKUIRedeemWebResultsViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pushViewController:animated:", v11, 1);

  }
}

+ (void)canShowResultsForRedeem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
