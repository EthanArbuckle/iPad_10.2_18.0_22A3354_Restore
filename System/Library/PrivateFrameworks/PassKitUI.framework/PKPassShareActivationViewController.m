@implementation PKPassShareActivationViewController

- (PKPassShareActivationViewController)init
{

  return 0;
}

- (PKPassShareActivationViewController)initWithPendingActivation:(id)a3
{
  id v5;
  PKPassShareActivationViewController *v6;
  PKPassShareActivationViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassShareActivationViewController;
  v6 = -[PKPassShareRedemptionViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pendingActivation, a3);

  return v7;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPassShareActivationViewController;
  -[PKPassShareRedemptionViewController loadView](&v8, sel_loadView);
  -[PKPassShareActivationViewController loadCardArt](self, "loadCardArt");
  PKLocalizedShareableCredentialString(CFSTR("SHARE_ACTIVATION_REENTRY_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v3);

  PKLocalizedShareableCredentialString(CFSTR("SHARE_ACTIVATION_REENTRY_SUBTITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v4);

  -[PKPassShareRedemptionViewController cardHeaderView](self, "cardHeaderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "showLoadingContent");

  -[PKPassSharePendingActivation originalInvitation](self->_pendingActivation, "originalInvitation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_msgSend(v6, "activationOptions"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[PKPassShareActivationViewController _showError:](self, "_showError:", 0);
    v7 = 0;
  }
  -[PKPassShareRedemptionViewController setActivationOptions:](self, "setActivationOptions:", v7);

}

- (void)loadCardArt
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  -[PKPassShareRedemptionViewController cardHeaderView](self, "cardHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassSharePendingActivation originalInvitation](self->_pendingActivation, "originalInvitation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__PKPassShareActivationViewController_loadCardArt__block_invoke;
    v7[3] = &unk_1E3E64B48;
    v8 = v3;
    PKCommonCachedImageFromURL(v6, v7);

  }
  else
  {
    objc_msgSend(v3, "hideLoadingContent");
  }

}

uint64_t __50__PKPassShareActivationViewController_loadCardArt__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCardImage:");
  return objc_msgSend(*(id *)(a1 + 32), "hideLoadingContent");
}

- (void)_showError:(id)a3
{
  NSError *v4;
  void *v5;
  NSError *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  BOOL v19;

  v4 = (NSError *)a3;
  -[PKPassShareRedemptionViewController showFailureUI](self, "showFailureUI");
  v19 = 0;
  PKSharingDisplayableError(v4, &v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v19 = 1;
    objc_msgSend(MEMORY[0x1E0CB35C8], "pkSharingError:", 6);
    v6 = (NSError *)objc_claimAutoreleasedReturnValue();
    PKSharingDisplayableError(v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  PKTitleForDisplayableError();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1A1AE46BC](v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC3448];
  if (v19)
  {
    PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_OK_BUTTON"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __50__PKPassShareActivationViewController__showError___block_invoke;
    v18[3] = &unk_1E3E61D68;
    v18[4] = self;
    v12 = v18;
    v13 = v10;
    v14 = v11;
    v15 = 1;
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("TRY_AGAIN_BUTTON_TITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __50__PKPassShareActivationViewController__showError___block_invoke_2;
    v17[3] = &unk_1E3E61D68;
    v17[4] = self;
    v12 = v17;
    v13 = v10;
    v14 = v11;
    v15 = 0;
  }
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v16);

  -[PKPassShareActivationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

uint64_t __50__PKPassShareActivationViewController__showError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __50__PKPassShareActivationViewController__showError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showStartingUI");
}

- (void)cancelButtonPressed
{
  -[PKPassShareActivationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)continueButtonPressed
{
  id v3;
  void *v4;
  NSString *activationCode;
  _QWORD v6[5];
  id v7;
  id location;

  if (-[NSString length](self->_activationCode, "length"))
  {
    -[PKPassShareRedemptionViewController showLoadingUI](self, "showLoadingUI");
    v3 = objc_alloc_init(MEMORY[0x1E0D672B0]);
    objc_initWeak(&location, self);
    -[PKPassSharePendingActivation originalInvitation](self->_pendingActivation, "originalInvitation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    activationCode = self->_activationCode;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__PKPassShareActivationViewController_continueButtonPressed__block_invoke;
    v6[3] = &unk_1E3E64B98;
    v6[4] = self;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v3, "acceptCarKeyShareForMessage:activationCode:completion:", v4, activationCode, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);

  }
}

void __60__PKPassShareActivationViewController_continueButtonPressed__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__PKPassShareActivationViewController_continueButtonPressed__block_invoke_2;
  v9[3] = &unk_1E3E64B70;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], v9);
  objc_destroyWeak(&v12);

}

void __60__PKPassShareActivationViewController_continueButtonPressed__block_invoke_2(uint64_t a1)
{
  id *v2;
  id *v3;
  BOOL v4;
  NSObject *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (id *)*(id *)(a1 + 32);
  v3 = v2;
  if (v2)
  {
    if (*(_QWORD *)(a1 + 40))
      v4 = *(_QWORD *)(a1 + 48) == 0;
    else
      v4 = 0;
    if (v4)
    {
      PKLogFacilityTypeGetObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3[170], "shareIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v6;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Successfully redeemed share %@", buf, 0xCu);

      }
      PKLocalizedShareableCredentialString(CFSTR("DONE_ADDING_SHAREABLE_CREDENTIAL_PASS"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTitleText:", v7);

      objc_msgSend(v3, "showSuccessUI");
      v8 = dispatch_time(0, 2000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__PKPassShareActivationViewController_continueButtonPressed__block_invoke_26;
      block[3] = &unk_1E3E61310;
      objc_copyWeak(&v10, (id *)(a1 + 56));
      dispatch_after(v8, MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(&v10);
    }
    else
    {
      objc_msgSend(v2, "_showError:");
    }
  }

}

void __60__PKPassShareActivationViewController_continueButtonPressed__block_invoke_26(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)activationCodeDidChangeToCode:(id)a3
{
  objc_storeStrong((id *)&self->_activationCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingActivation, 0);
  objc_storeStrong((id *)&self->_activationCode, 0);
}

@end
