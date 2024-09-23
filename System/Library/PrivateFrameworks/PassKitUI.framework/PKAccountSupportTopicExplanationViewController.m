@implementation PKAccountSupportTopicExplanationViewController

- (PKAccountSupportTopicExplanationViewController)initWithAccount:(id)a3 topic:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKAccountSupportTopicExplanationViewController *v12;
  PKAccountSupportTopicExplanationViewController *v13;
  PKAccountSupportTopicExplanationContentSectionController *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  PKAccountSupportTopicExplanationContentSectionController *contentSectionController;
  PKAccountSupportTopicExplanationLinkSectionController *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  PKAccountSupportTopicExplanationLinkSectionController *linkSectionController;
  void *v24;
  void *v25;
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PKAccountSupportTopicExplanationViewController;
  v12 = -[PKPaymentSetupOptionsViewController initWithProvisioningController:context:delegate:](&v27, sel_initWithProvisioningController_context_delegate_, 0, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_topic, a4);
    objc_storeStrong((id *)&v13->_account, a3);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v14 = [PKAccountSupportTopicExplanationContentSectionController alloc];
    objc_msgSend(v10, "explanation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "content");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PKAccountSupportTopicExplanationContentSectionController initWithContent:](v14, "initWithContent:", v16);
    contentSectionController = v13->_contentSectionController;
    v13->_contentSectionController = (PKAccountSupportTopicExplanationContentSectionController *)v17;

    v19 = [PKAccountSupportTopicExplanationLinkSectionController alloc];
    objc_msgSend(v10, "explanation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "link");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[PKAccountSupportTopicExplanationLinkSectionController initWithLink:delegate:](v19, "initWithLink:delegate:", v21, v13);
    linkSectionController = v13->_linkSectionController;
    v13->_linkSectionController = (PKAccountSupportTopicExplanationLinkSectionController *)v22;

    -[PKAccountSupportTopicExplanationViewController navigationItem](v13, "navigationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccount feature](v13->_account, "feature");
    PKLocalizedFeatureString();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTitle:", v25);

  }
  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PKAccountSupportTopicExplanationLinkSectionController *linkSectionController;
  void *v16;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)PKAccountSupportTopicExplanationViewController;
  -[PKPaymentSetupOptionsViewController viewDidLoad](&v17, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[PKPaymentSetupOptionsViewController setHeaderBackgroundColor:](self, "setHeaderBackgroundColor:", v3);
  -[PKAccountSupportTopic explanation](self->_topic, "explanation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v6);

  objc_msgSend(v5, "headerSubtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v7);

  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B60], (void *)*MEMORY[0x1E0DC48C8], 2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleFont:](self, "setTitleFont:", v8);

  -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryActionTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "primaryButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:forState:", v10, 0);
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__performPrimaryAction, 0x2000);

  }
  else
  {
    objc_msgSend(v9, "setPrimaryButton:", 0);
  }
  objc_msgSend(v9, "footerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondaryActionTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "manualEntryButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:forState:", v13, 0);
    objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel__cancelTapped, 64);

  }
  else
  {
    objc_msgSend(v12, "setManualEntryButton:", 0);
  }
  linkSectionController = self->_linkSectionController;
  v18[0] = self->_contentSectionController;
  v18[1] = linkSectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v16, 0);

}

- (BOOL)shouldShowSupportLink:(id)a3
{
  PKAccountSupportTopicExplanationViewControllerDelegate **p_delegate;
  id v4;
  id WeakRetained;
  char v6;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = objc_msgSend(WeakRetained, "shouldShowSupportLink:", v4);

  return v6;
}

- (void)openSupportLink:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "action");
  if (v4 == 1)
  {
    -[PKAccountSupportTopicExplanationViewController _showMerchantDetails](self, "_showMerchantDetails");
  }
  else if (!v4)
  {
    objc_msgSend(v7, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "confirmationTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountSupportTopicExplanationViewController _openSupportLinkURL:confirmationTitle:](self, "_openSupportLinkURL:confirmationTitle:", v5, v6);

  }
}

- (void)_openSupportLinkURL:(id)a3 confirmationTitle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "containsString:", CFSTR("http"))
    && (objc_msgSend(v9, "containsString:", *MEMORY[0x1E0D6BCB0]) & 1) == 0)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5600]), "initWithURL:", v6);
    objc_msgSend(v15, "setModalPresentationStyle:", 2);
    -[PKAccountSupportTopicExplanationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);

  }
  else if (objc_msgSend(v8, "containsString:", CFSTR("tel")))
  {
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    if (v10)
    {
      objc_msgSend(v10, "pkFormattedStringValue");
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v12;
    }
    v23 = v7;
    v24 = v10;
    if (objc_msgSend(v7, "length"))
    {
      v13 = v7;
    }
    else
    {
      -[PKAccount feature](self->_account, "feature");
      PKLocalizedFeatureString();
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v13;
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v13, 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0DC3448];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __88__PKAccountSupportTopicExplanationViewController__openSupportLinkURL_confirmationTitle___block_invoke;
    v25[3] = &unk_1E3E61D68;
    v26 = v6;
    objc_msgSend(v18, "actionWithTitle:style:handler:", v11, 0, v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAction:", v19);

    v20 = (void *)MEMORY[0x1E0DC3448];
    -[PKAccount feature](self->_account, "feature");
    PKLocalizedFeatureString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAction:", v22);

    -[PKAccountSupportTopicExplanationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
    v7 = v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "openSensitiveURL:withOptions:", v6, 0);

  }
}

void __88__PKAccountSupportTopicExplanationViewController__openSupportLinkURL_confirmationTitle___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", *(_QWORD *)(a1 + 32), 0);

}

- (void)_showMerchantDetails
{
  PKAccountSupportTopicExplanationViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v4;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "showMerchantDetailsForTransaction");

  }
}

- (void)deselectCells
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKAccountSupportTopicExplanationViewController;
  -[PKDynamicCollectionViewController deselectCells](&v2, sel_deselectCells);
}

- (void)_performPrimaryAction
{
  id WeakRetained;

  if ((unint64_t)-[PKAccountSupportTopic issueType](self->_topic, "issueType") <= 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "openBusinessChatForTopic:", self->_topic);

  }
}

- (void)_cancelTapped
{
  -[PKAccountSupportTopicExplanationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_linkSectionController, 0);
  objc_storeStrong((id *)&self->_contentSectionController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

@end
