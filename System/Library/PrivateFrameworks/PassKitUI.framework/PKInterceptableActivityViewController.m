@implementation PKInterceptableActivityViewController

- (PKInterceptableActivityViewController)initWithItems:(id)a3 delegate:(id)a4
{
  return -[PKInterceptableActivityViewController initWithItems:peopleSuggestionBundleIds:delegate:](self, "initWithItems:peopleSuggestionBundleIds:delegate:", a3, 0, a4);
}

- (PKInterceptableActivityViewController)initWithItems:(id)a3 peopleSuggestionBundleIds:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKMessageExtensionActivityItem *v11;
  void *v12;
  PKInterceptableActivityViewController *v13;
  PKInterceptableActivityViewController *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, unsigned int);
  void *v19;
  id v20;
  id location;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(PKMessageExtensionActivityItem);
  v23[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)PKInterceptableActivityViewController;
  v13 = -[PKInterceptableActivityViewController initWithActivityItems:applicationActivities:peopleSuggestionBundleIds:](&v22, sel_initWithActivityItems_applicationActivities_peopleSuggestionBundleIds_, v8, v12, v9);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_initWeak(&location, v14);
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __90__PKInterceptableActivityViewController_initWithItems_peopleSuggestionBundleIds_delegate___block_invoke;
    v19 = &unk_1E3E7A830;
    objc_copyWeak(&v20, &location);
    -[PKInterceptableActivityViewController setCompletionWithItemsHandler:](v14, "setCompletionWithItemsHandler:", &v16);
    -[PKInterceptableActivityViewController setExcludedActivityTypes:](v14, "setExcludedActivityTypes:", 0, v16, v17, v18, v19);
    -[PKInterceptableActivityViewController setAirDropDelegate:](v14, "setAirDropDelegate:", v14);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __90__PKInterceptableActivityViewController_initWithItems_peopleSuggestionBundleIds_delegate___block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  id v16;
  int v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained && !*((_BYTE *)WeakRetained + 1336))
  {
    v8 = (void *)*MEMORY[0x1E0D96D88];
    v9 = v5;
    v10 = v8;
    v11 = v10;
    if (v10 == v9)
    {
      v12 = 0;
    }
    else
    {
      v12 = 1;
      if (v9 && v10)
        v12 = objc_msgSend(v9, "isEqualToString:", v10) ^ 1;
    }

    v13 = v12 & a3;
    PKLogFacilityTypeGetObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = CFSTR("No");
      if ((_DWORD)v13)
        v15 = CFSTR("Yes");
      v17 = 138412290;
      v18 = v15;
      _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Share Sheet did finish with completed: %@", (uint8_t *)&v17, 0xCu);
    }

    v16 = objc_loadWeakRetained(v7 + 170);
    objc_msgSend(v16, "interceptableActivityViewController:didFinishWithShare:", v7, v13);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v4;
  id WeakRetained;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKInterceptableActivityViewController;
  -[PKInterceptableActivityViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  if (self->_isSendingOverAirdrop)
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Share Sheet did finish from 'viewWillDisappear'", v6, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "interceptableActivityViewController:didFinishWithShare:", self, 0);

  }
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKInterceptableActivityViewController;
  -[PKInterceptableActivityViewController loadView](&v3, sel_loadView);
  -[PKInterceptableActivityViewController setSharingStyle:](self, "setSharingStyle:", 1);
}

- (void)setExcludedActivityTypes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v6 = (void *)objc_msgSend(v5, "initWithObjects:", *MEMORY[0x1E0D96DA0], *MEMORY[0x1E0D96D90], *MEMORY[0x1E0D96D80], 0);
  v7 = v6;
  if (v4)
    objc_msgSend(v6, "addObjectsFromArray:", v4);
  v8.receiver = self;
  v8.super_class = (Class)PKInterceptableActivityViewController;
  -[PKInterceptableActivityViewController setExcludedActivityTypes:](&v8, sel_setExcludedActivityTypes_, v7);

}

- (id)selectedRecipientWithOutContactIdentifier:(id *)a3
{
  NSString *airdropRecipientName;
  NSObject *v6;
  NSString *v7;
  NSString *v8;
  NSString *airdropRecipientContactIdentifier;
  int v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  airdropRecipientName = self->_airdropRecipientName;
  if (*(_OWORD *)&self->_airdropRecipientName == 0)
    return 0;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = airdropRecipientName;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Share Sheet: returning cached airdrop recipient %@", (uint8_t *)&v11, 0xCu);
  }

  v7 = self->_airdropRecipientName;
  *a3 = objc_retainAutorelease(self->_airdropRecipientContactIdentifier);
  v8 = self->_airdropRecipientName;
  self->_airdropRecipientName = 0;

  airdropRecipientContactIdentifier = self->_airdropRecipientContactIdentifier;
  self->_airdropRecipientContactIdentifier = 0;

  return v7;
}

- (void)handleInterceptedShareActivity
{
  NSString *airdropRecipientName;
  UIActivity *defferedActivity;
  NSObject *p_super;
  _BOOL4 v6;
  UIActivity *v7;
  objc_super v8;
  uint8_t buf[16];

  airdropRecipientName = self->_airdropRecipientName;
  self->_airdropRecipientName = 0;

  defferedActivity = self->_defferedActivity;
  PKLogFacilityTypeGetObject();
  p_super = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
  if (defferedActivity)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, p_super, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Share Sheet handling intercepted share activity.", buf, 2u);
    }

    v7 = self->_defferedActivity;
    v8.receiver = self;
    v8.super_class = (Class)PKInterceptableActivityViewController;
    -[PKInterceptableActivityViewController _performActivity:](&v8, sel__performActivity_, v7);
    p_super = &self->_defferedActivity->super;
    self->_defferedActivity = 0;
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, p_super, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Share Sheet attempted to handle intercepted share activity, but no activity found.", buf, 2u);
  }

}

- (void)_performActivity:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  int v19;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  self->_isSendingOverAirdrop = 0;
  objc_msgSend(v5, "activityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInterceptableActivityViewController excludedActivityTypes](self, "excludedActivityTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v22 = v6;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Share Sheet blocking share over %@", buf, 0xCu);
    }

    v11 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedShareableCredentialString(CFSTR("SHARE_INITIATION_ERROR_CHANNEL_UNSUPPORTED_TITLE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedShareableCredentialString(CFSTR("SHARE_INITIATION_ERROR_CHANNEL_UNSUPPORTED_DESCRIPTION"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v12, v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v17);

    -[PKInterceptableActivityViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v22 = v6;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Share Sheet intercepting share activity of type %@", buf, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v19 = objc_msgSend(WeakRetained, "interceptableActivityViewController:shouldInterceptActivitySelectionOfType:", self, v6);

    if (!v19)
    {
      v20.receiver = self;
      v20.super_class = (Class)PKInterceptableActivityViewController;
      -[PKInterceptableActivityViewController _performActivity:](&v20, sel__performActivity_, v5);
      goto LABEL_11;
    }
    objc_storeStrong((id *)&self->_defferedActivity, a3);
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v14, "interceptableActivityViewController:didInterceptActivitySelectionOfType:", self, v6);
  }

LABEL_11:
}

- (void)activityViewControllerWillStartAirdropTransfer:(id)a3
{
  NSString *airdropRecipientName;

  self->_isSendingOverAirdrop = 1;
  airdropRecipientName = self->_airdropRecipientName;
  self->_airdropRecipientName = 0;

}

- (void)activityViewControllerDidFinishAirdropTransfer:(id)a3
{
  NSString *airdropRecipientName;
  NSObject *v5;
  id WeakRetained;
  uint8_t v7[16];

  self->_isSendingOverAirdrop = 0;
  airdropRecipientName = self->_airdropRecipientName;
  self->_airdropRecipientName = 0;

  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Share Sheet did finish airdrop transfer", v7, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "interceptableActivityViewController:didFinishWithShare:", self, 1);

}

- (void)activityViewController:(id)a3 willStartAirdropTransferToRecipient:(id)a4 contactIdentifier:(id)a5
{
  NSString *v7;
  NSString *v8;
  NSString *airdropRecipientName;
  NSString *airdropRecipientContactIdentifier;
  NSString *v11;

  v7 = (NSString *)a4;
  v8 = (NSString *)a5;
  airdropRecipientName = self->_airdropRecipientName;
  self->_airdropRecipientName = v7;
  v11 = v7;

  airdropRecipientContactIdentifier = self->_airdropRecipientContactIdentifier;
  self->_airdropRecipientContactIdentifier = v8;

}

- (PKInterceptableActivityViewControllerDelegate)delegate
{
  return (PKInterceptableActivityViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_airdropRecipientContactIdentifier, 0);
  objc_storeStrong((id *)&self->_airdropRecipientName, 0);
  objc_storeStrong((id *)&self->_defferedActivity, 0);
}

@end
