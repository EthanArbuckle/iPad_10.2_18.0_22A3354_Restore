@implementation SiriUISnippetExtensionCardSectionViewController

- (void)dealloc
{
  id v3;
  objc_super v4;

  -[SiriUISnippetExtensionCardSectionViewController _resumeTouchesIfNecessary](self, "_resumeTouchesIfNecessary");
  v3 = (id)-[INUIRemoteViewController disconnect](self->_remoteViewController, "disconnect");
  v4.receiver = self;
  v4.super_class = (Class)SiriUISnippetExtensionCardSectionViewController;
  -[SiriUISnippetExtensionCardSectionViewController dealloc](&v4, sel_dealloc);
}

+ (id)cardSectionClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
}

- (void)_loadCardSectionView
{
  SiriUICardSectionView *v3;
  SiriUICardSectionView *v4;

  v3 = [SiriUICardSectionView alloc];
  v4 = -[SiriUICardSectionView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[SiriUISnippetExtensionCardSectionViewController setView:](self, "setView:", v4);

}

- (void)_cancelTouchesIfNecessary
{
  void *v3;
  id touchDeliveryPolicyAssertion;

  -[INUIRemoteViewController _cancelTouchesForCurrentEventInHostedContent](self->_remoteViewController, "_cancelTouchesForCurrentEventInHostedContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  touchDeliveryPolicyAssertion = self->_touchDeliveryPolicyAssertion;
  self->_touchDeliveryPolicyAssertion = v3;

}

- (void)_resumeTouchesIfNecessary
{
  id touchDeliveryPolicyAssertion;

  objc_msgSend(self->_touchDeliveryPolicyAssertion, "invalidate");
  touchDeliveryPolicyAssertion = self->_touchDeliveryPolicyAssertion;
  self->_touchDeliveryPolicyAssertion = 0;

}

- (BOOL)_shouldAttemptToConnectToRemoteViewController
{
  return 1;
}

- (void)_attemptToConnectToRemoteViewControllerWithInteraction:(id)a3 forParameters:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SiriUISnippetExtensionCardSectionViewController *v10;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDDA510];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __120__SiriUISnippetExtensionCardSectionViewController__attemptToConnectToRemoteViewControllerWithInteraction_forParameters___block_invoke;
  v8[3] = &unk_24D7DA098;
  v9 = v5;
  v10 = self;
  v7 = v5;
  objc_msgSend(v6, "_requestRemoteViewControllerForSnippetExtensionInteraction:delegate:connectionHandler:", v7, self, v8);

}

void __120__SiriUISnippetExtensionCardSectionViewController__attemptToConnectToRemoteViewControllerWithInteraction_forParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v11 = *MEMORY[0x24BE08FB0];
    v12 = *MEMORY[0x24BE08FB0];
    if (v7)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __120__SiriUISnippetExtensionCardSectionViewController__attemptToConnectToRemoteViewControllerWithInteraction_forParameters___block_invoke_cold_1();
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v19 = "-[SiriUISnippetExtensionCardSectionViewController _attemptToConnectToRemoteViewControllerWithInteraction:for"
            "Parameters:]_block_invoke";
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_21764F000, v11, OS_LOG_TYPE_DEFAULT, "%s No remote view controller for interaction: %@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 40), "_finishLoadingViewIfNecessary");
  }
  else
  {
    objc_msgSend(v5, "setServiceViewShouldShareTouchesWithHost:", 1);
    v8 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __120__SiriUISnippetExtensionCardSectionViewController__attemptToConnectToRemoteViewControllerWithInteraction_forParameters___block_invoke_2;
    v14[3] = &unk_24D7DA070;
    v9 = v8;
    v10 = *(_QWORD *)(a1 + 40);
    v15 = v9;
    v16 = v10;
    v17 = v5;
    objc_msgSend(v17, "configureForParameters:ofInteraction:interactiveBehavior:context:completion:", 0, v9, 0, 0, v14);

  }
}

void __120__SiriUISnippetExtensionCardSectionViewController__attemptToConnectToRemoteViewControllerWithInteraction_forParameters___block_invoke_2(uint64_t a1, double a2, double a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v10 = a5;
  v11 = a6;
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __120__SiriUISnippetExtensionCardSectionViewController__attemptToConnectToRemoteViewControllerWithInteraction_forParameters___block_invoke_2_cold_1();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(v12 + 1024);
    if (v13)
    {
      objc_msgSend(v13, "willMoveToParentViewController:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1024), "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeFromSuperview");

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1024), "removeFromParentViewController");
      v12 = *(_QWORD *)(a1 + 40);
    }
    objc_storeStrong((id *)(v12 + 1024), *(id *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "addChildViewController:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFrame:", 0.0, 0.0, a2, a3);

    objc_msgSend(*(id *)(a1 + 40), "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setContentSize:", a2, a3);

    objc_msgSend(*(id *)(a1 + 40), "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setContentView:", v18);

    objc_msgSend(*(id *)(a1 + 48), "didMoveToParentViewController:", *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 40), "_finishLoadingViewIfNecessary");

}

- (CGSize)minimumSizeForRemoteViewController:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x24BDBF148];
  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)maximumSizeForRemoteViewController:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[CRKCardSectionViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingSizeForCardSectionViewController:", self);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_touchDeliveryPolicyAssertion, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

void __120__SiriUISnippetExtensionCardSectionViewController__attemptToConnectToRemoteViewControllerWithInteraction_forParameters___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_21764F000, v0, v1, "%s Failed to instantiate remote view controller with error: %{public}@ for interaction: %@", v2);
}

void __120__SiriUISnippetExtensionCardSectionViewController__attemptToConnectToRemoteViewControllerWithInteraction_forParameters___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_21764F000, v0, v1, "%s Failed to configure remote view controller with error: %{public}@ for interaction: %@", v2);
}

@end
