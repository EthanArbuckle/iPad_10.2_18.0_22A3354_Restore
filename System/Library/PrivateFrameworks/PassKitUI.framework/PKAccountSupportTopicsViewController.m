@implementation PKAccountSupportTopicsViewController

- (PKAccountSupportTopicsViewController)initWithAccount:(id)a3
{
  id v5;
  PKAccountSupportTopicsViewController *v6;
  PKAccountSupportTopicsViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountSupportTopicsViewController;
  v6 = -[PKPaymentSetupOptionsViewController initWithProvisioningController:context:delegate:](&v12, sel_initWithProvisioningController_context_delegate_, 0, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    v7->_loadingTopics = 0;
    -[PKAccountSupportTopicsViewController navigationItem](v7, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v7, sel__cancelTapped);
    objc_msgSend(v8, "setLeftBarButtonItem:", v9);

    objc_msgSend(v8, "setBackButtonDisplayMode:", 2);
    PKLocalizedFeatureString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v10);

  }
  return v7;
}

- (void)_fetchCommonSupportTopics
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  self->_loadingTopics = 1;
  -[PKAccountSupportTopicsViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
  v3 = objc_alloc_init(MEMORY[0x1E0D669E0]);
  -[PKAccount accountBaseURL](self->_account, "accountBaseURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBaseURL:", v4);

  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccountIdentifier:", v5);

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__PKAccountSupportTopicsViewController__fetchCommonSupportTopics__block_invoke;
  v7[3] = &unk_1E3E66110;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v6, "supportTopicsWithRequest:completion:", v3, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __65__PKAccountSupportTopicsViewController__fetchCommonSupportTopics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PKAccountSupportTopicsViewController__fetchCommonSupportTopics__block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __65__PKAccountSupportTopicsViewController__fetchCommonSupportTopics__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id *v7;
  _QWORD v8[4];
  id v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1304) = 0;
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "_setNeedsUpdateContentUnavailableConfiguration");
    objc_msgSend(*(id *)(a1 + 32), "topics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_reloadSectionControllerWithTopics:", v3);
    objc_msgSend(v7[164], "businessChatTargetDialog");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (!*(_QWORD *)(a1 + 40) && v4 && objc_msgSend(v3, "count"))
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __65__PKAccountSupportTopicsViewController__fetchCommonSupportTopics__block_invoke_3;
      v8[3] = &unk_1E3E660E8;
      v9 = v5;
      objc_msgSend(v3, "pk_firstObjectPassingTest:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(v7, "showExplanationForTopic:", v6);

    }
    WeakRetained = v7;
  }

}

uint64_t __65__PKAccountSupportTopicsViewController__fetchCommonSupportTopics__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "businessChatTargetDialog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (void)_reloadSectionControllerWithTopics:(id)a3
{
  id v4;
  PKAccountSupportTopicsSectionController *v5;
  PKAccount *account;
  void *v7;
  void *v8;
  PKAccountSupportTopicsSectionController *v9;
  PKAccountSupportTopicsSectionController *sectionTopicController;
  PKAccountSupportSectionController *v11;
  PKAccountSupportSectionController *sectionAccountController;
  PKAccountSupportTopicsSectionController *v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = [PKAccountSupportTopicsSectionController alloc];
    account = self->_account;
    -[PKAccount feature](account, "feature");
    PKLocalizedFeatureString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uppercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKAccountSupportTopicsSectionController initWithAccount:topics:sectionTitle:delegate:](v5, "initWithAccount:topics:sectionTitle:delegate:", account, v4, v8, self);
    sectionTopicController = self->_sectionTopicController;
    self->_sectionTopicController = v9;

    v11 = -[PKAccountSupportSectionController initWithAccount:]([PKAccountSupportSectionController alloc], "initWithAccount:", self->_account);
    sectionAccountController = self->_sectionAccountController;
    self->_sectionAccountController = v11;

    v13 = self->_sectionTopicController;
    v15[0] = self->_sectionAccountController;
    v15[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v14, 1);

  }
  else
  {
    -[PKAccountSupportTopicsViewController _continueToChat](self, "_continueToChat");
  }

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKAccountSupportTopicsViewController;
  -[PKPaymentSetupOptionsViewController viewDidLoad](&v8, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[PKPaymentSetupOptionsViewController setHeaderBackgroundColor:](self, "setHeaderBackgroundColor:", v3);
  -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v7, 0);

  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__continueToChat, 0x2000);
  -[PKAccountSupportTopicsViewController _fetchCommonSupportTopics](self, "_fetchCommonSupportTopics");

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAccountSupportTopicsViewController;
  -[PKPaymentSetupOptionsViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountSupportTopicsViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  if (self->_loadingTopics)
  {
    v4 = (void *)MEMORY[0x1E0DC3698];
    v5 = a3;
    objc_msgSend(v4, "loadingConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updatedConfigurationForState:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  -[PKAccountSupportTopicsViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v7);

}

- (BOOL)shouldShowSupportLink:(id)a3
{
  return 1;
}

- (void)openBusinessChatForTopic:(id)a3
{
  PKAccountSupportTopic *v4;
  PKBusinessChatController *businessChatController;
  PKBusinessChatController *v6;
  PKBusinessChatController *v7;
  PKAccountSupportTopic *suggestedTopic;
  PKAccountSupportTopic *v9;
  PKBusinessChatAccountContext *v10;
  PKBusinessChatController *v11;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = (PKAccountSupportTopic *)a3;
  businessChatController = self->_businessChatController;
  if (businessChatController)
    v6 = businessChatController;
  else
    v6 = objc_alloc_init(PKBusinessChatController);
  v7 = self->_businessChatController;
  self->_businessChatController = v6;

  objc_initWeak(&location, self);
  if (!v4)
  {
    suggestedTopic = self->_suggestedTopic;
    if (suggestedTopic)
      v9 = suggestedTopic;
    else
      v9 = (PKAccountSupportTopic *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66908]), "initWithOtherTopicForAccount:", self->_account);
    v4 = v9;
  }
  v10 = -[PKBusinessChatAccountContext initWithAccount:topic:]([PKBusinessChatAccountContext alloc], "initWithAccount:topic:", self->_account, v4);
  v11 = self->_businessChatController;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__PKAccountSupportTopicsViewController_openBusinessChatForTopic___block_invoke;
  v12[3] = &unk_1E3E61DB8;
  objc_copyWeak(&v13, &location);
  -[PKBusinessChatController openBusinessChatWithContext:completion:](v11, "openBusinessChatWithContext:completion:", v10, v12);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
}

void __65__PKAccountSupportTopicsViewController_openBusinessChatForTopic___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__PKAccountSupportTopicsViewController_openBusinessChatForTopic___block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __65__PKAccountSupportTopicsViewController_openBusinessChatForTopic___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      v5 = WeakRetained;
      v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
      if (v4)
        objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

      WeakRetained = v5;
    }
  }

}

- (void)showExplanationForTopic:(id)a3
{
  id v4;
  void *v5;
  PKAccountSupportTopicExplanationViewController *v6;

  v4 = a3;
  v6 = -[PKAccountSupportTopicExplanationViewController initWithAccount:topic:delegate:]([PKAccountSupportTopicExplanationViewController alloc], "initWithAccount:topic:delegate:", self->_account, v4, self);

  -[PKAccountSupportTopicsViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (void)deselectCells
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKAccountSupportTopicsViewController;
  -[PKDynamicCollectionViewController deselectCells](&v2, sel_deselectCells);
}

- (void)reloadItem:(id)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAccountSupportTopicsViewController;
  -[PKDynamicCollectionViewController reloadItem:animated:](&v4, sel_reloadItem_animated_, a3, a4);
}

- (void)_continueToChat
{
  -[PKAccountSupportTopicsViewController openBusinessChatForTopic:](self, "openBusinessChatForTopic:", 0);
}

- (void)_cancelTapped
{
  -[PKAccountSupportTopicsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (PKAccountSupportTopic)suggestedTopic
{
  return self->_suggestedTopic;
}

- (void)setSuggestedTopic:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedTopic, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedTopic, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_sectionAccountController, 0);
  objc_storeStrong((id *)&self->_sectionTopicController, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
