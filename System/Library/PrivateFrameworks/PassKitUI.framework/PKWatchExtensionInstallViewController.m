@implementation PKWatchExtensionInstallViewController

+ (BOOL)shouldShowWatchExtensionInstallViewControllerForSecureElementPass:(id)a3 webService:(id)a4
{
  id v5;
  Class (__cdecl *v6)();
  id v7;
  id v8;
  id v9;
  char v10;
  void *v11;

  v5 = a3;
  v6 = (Class (__cdecl *)())getNPKCompanionAgentConnectionClass_1;
  v7 = a4;
  v8 = objc_alloc_init(v6());
  objc_msgSend(v8, "watchPaymentWebService");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v7)
  {
    objc_msgSend(v5, "paymentPass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "shouldShowWatchExtensionInstallationForPaymentPass:", v11);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (PKWatchExtensionInstallViewController)initWithSecureElementPass:(id)a3 provisioningController:(id)a4 webService:(id)a5 context:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  PKWatchExtensionInstallViewController *v14;
  PKWatchExtensionInstallViewController *v15;
  id v16;
  void *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKWatchExtensionInstallViewController;
  v14 = -[PKExplanationViewController initWithContext:](&v19, sel_initWithContext_, a6);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_secureElementPass, a3);
    objc_storeStrong((id *)&v15->_webservice, a5);
    objc_storeStrong((id *)&v15->_provisioningController, a4);
    v16 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v16, "configureWithTransparentBackground");
    -[PKWatchExtensionInstallViewController navigationItem](v15, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setStandardAppearance:", v16);

  }
  return v15;
}

- (void)loadView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  PKWatchDeviceAppCarouselView *v8;
  PKWatchDeviceAppCarouselView *v9;
  PKWatchDeviceAppCarouselView *deviceImageView;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  ASCLockupView *v28;
  ASCLockupView *appStoreView;
  ASCLockupView *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)PKWatchExtensionInstallViewController;
  -[PKExplanationViewController loadView](&v42, sel_loadView);
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  -[PKWatchExtensionInstallViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidesBackButton:", 1);

  -[PKSecureElementPass organizationName](self->_secureElementPass, "organizationName");
  v4 = objc_claimAutoreleasedReturnValue();
  -[PKExplanationViewController explanationView](self, "explanationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedAquamanString(CFSTR("INSTALL_WATCH_EXTENSION_TITLE"), CFSTR("%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleText:", v6);

  v36 = (void *)v4;
  PKLocalizedAquamanString(CFSTR("INSTALL_WATCH_EXTENSION_DESCRIPTION"), CFSTR("%@%@"), v4, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBodyText:", v7);

  objc_msgSend(v5, "setShowPrivacyView:", 0);
  objc_msgSend(v5, "setForceShowSetupLaterButton:", 1);
  v8 = [PKWatchDeviceAppCarouselView alloc];
  v9 = -[PKWatchDeviceAppCarouselView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  deviceImageView = self->_deviceImageView;
  self->_deviceImageView = v9;

  objc_msgSend(v5, "setBodyView:", self->_deviceImageView);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[PKSecureElementPass storeIdentifiers](self->_secureElementPass, "storeIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithStoreItemIdentifier:error:", objc_msgSend(v16, "unsignedLongLongValue"), 0);
        if (v17)
        {
          v21 = (void *)v17;
          v20 = v16;

          objc_msgSend(v21, "counterpartIdentifiers");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "firstObject");
          v18 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0D51850], "sharedInstance");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          PKScreenScale();
          if (v24 <= 2.0)
            v25 = 47;
          else
            v25 = 48;
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __49__PKWatchExtensionInstallViewController_loadView__block_invoke;
          v37[3] = &unk_1E3E613B0;
          v37[4] = self;
          objc_msgSend(v23, "getIconForBundleID:iconVariant:block:timeout:", v18, v25, v37, -1.0);

          goto LABEL_16;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
      if (v13)
        continue;
      break;
    }
  }

  PKLogFacilityTypeGetObject();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    -[PKSecureElementPass uniqueID](self->_secureElementPass, "uniqueID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v44 = v19;
    _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "(watch-extension-install) Failed to find application record for pass: %@", buf, 0xCu);

  }
  v20 = 0;
  v21 = 0;
LABEL_16:

  objc_msgSend(v5, "dockView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setPrimaryButton:", 0);
  if (v20)
  {
    _PKCreateASCLookupRequestForStoreID(v20, 1);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (ASCLockupView *)objc_alloc_init(MEMORY[0x1E0CF9BC8]);
    appStoreView = self->_appStoreView;
    self->_appStoreView = v28;

    -[ASCLockupView setDelegate:](self->_appStoreView, "setDelegate:", self);
    v30 = self->_appStoreView;
    -[PKExplanationViewController context](self, "context");
    if ((PKPaymentSetupContextIsBridge() & 1) != 0)
      PKBridgeForegroundColor();
    else
      PKProvisioningSecondaryBackgroundColor();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupView setBackgroundColor:](v30, "setBackgroundColor:", v31);

    -[ASCLockupView layer](self->_appStoreView, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setCornerRadius:", 16.0);

    -[ASCLockupView setLayoutMargins:](self->_appStoreView, "setLayoutMargins:", 10.0, 16.0, 10.0, 16.0);
    -[ASCLockupView setRequest:](self->_appStoreView, "setRequest:", v27);
    objc_msgSend(v26, "setLockUpView:", self->_appStoreView);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19D178000, v27, OS_LOG_TYPE_ERROR, "PKWatchExtensionInstallViewController had nil storeID.", buf, 2u);
    }
  }

  objc_msgSend(v26, "footerView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setManualEntryButton:", 0);
  objc_msgSend(v33, "setupLaterButton");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedAquamanString(CFSTR("INSTALL_WATCH_EXTENSION_INSTALL_LATER"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTitle:forState:", v35, 0);

}

uint64_t __49__PKWatchExtensionInstallViewController_loadView__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setAppIconImage:", a2);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKWatchExtensionInstallViewController;
  -[PKWatchExtensionInstallViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  PKProvisioningAnalyticsSessionUIReporter *reporter;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  reporter = self->_reporter;
  v9 = *MEMORY[0x1E0D69418];
  v10[0] = *MEMORY[0x1E0D69410];
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:context:](reporter, "reportButtonPressed:context:", 3, v7);

  -[PKExplanationViewController explanationView](self, "explanationView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
    -[PKWatchExtensionInstallViewController _proceedToNextScreen](self, "_proceedToNextScreen");
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id location[2];

  v4 = a3;
  PKLocalizedAquamanString(CFSTR("INSTALL_WATCH_EXTENSION_INSTALL"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF9BE0], "textMetadataWithTitle:subtitle:", v5, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v7 = objc_alloc(MEMORY[0x1E0CF9BA8]);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __68__PKWatchExtensionInstallViewController_lockupViewDidFinishRequest___block_invoke;
  v29[3] = &unk_1E3E61310;
  objc_copyWeak(&v30, location);
  v25 = (void *)objc_msgSend(v7, "initWithMetadata:action:", v6, v29);
  v22 = (void *)v6;
  v23 = (void *)v5;
  v24 = v4;
  objc_msgSend(v4, "lockup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CF9BB0]);
  objc_msgSend(v8, "id");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "kind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "icon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "heading");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subtitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ageRating");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v9, "initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:", v10, v11, v12, v13, v14, v15, v16, v17, v25);

  v19 = (void *)MEMORY[0x1E0DC3F10];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __68__PKWatchExtensionInstallViewController_lockupViewDidFinishRequest___block_invoke_2;
  v26[3] = &unk_1E3E61388;
  v20 = v24;
  v27 = v20;
  v21 = v18;
  v28 = v21;
  objc_msgSend(v19, "performWithoutAnimation:", v26);

  objc_destroyWeak(&v30);
  objc_destroyWeak(location);

}

void __68__PKWatchExtensionInstallViewController_lockupViewDidFinishRequest___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_installNowPressed");
    WeakRetained = v2;
  }

}

uint64_t __68__PKWatchExtensionInstallViewController_lockupViewDidFinishRequest___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLockup:", *(_QWORD *)(a1 + 40));
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;

  v4 = a3;
  -[PKWatchExtensionInstallViewController view](self, "view", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v4 ^ 1);

  -[PKExplanationViewController showSpinner:](self, "showSpinner:", v4);
}

- (void)_installNowPressed
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, void *);
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PKSecureElementPass uniqueID](self->_secureElementPass, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v3;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "(watch-extension-install) begining install of watch extension for pass %@", buf, 0xCu);
  }

  v5 = objc_alloc_init(getNPKCompanionAgentConnectionClass_1());
  objc_initWeak((id *)buf, self);
  -[PKSecureElementPass paymentPass](self->_secureElementPass, "paymentPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __59__PKWatchExtensionInstallViewController__installNowPressed__block_invoke;
  v11 = &unk_1E3E625E8;
  objc_copyWeak(&v13, (id *)buf);
  v7 = v3;
  v12 = v7;
  objc_msgSend(v5, "beginPairedWatchInstallationOfApplicationForPaymentPass:completion:", v6, &v8);

  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 0, v8, v9, v10, v11);
  -[PKWatchExtensionInstallViewController _proceedToNextScreen](self, "_proceedToNextScreen");

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

void __59__PKWatchExtensionInstallViewController__installNowPressed__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = CFSTR("NO");
    v11 = 138412802;
    if ((_DWORD)a2)
      v9 = CFSTR("YES");
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "(watch-extension-install) install of watch extension for %@ didBegin %@ error %@", (uint8_t *)&v11, 0x20u);
  }

  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "reporter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reportPageCompleted:context:", a2, 0);

  }
}

- (void)_proceedToNextScreen
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  objc_msgSend(WeakRetained, "watchExtensionInstallViewControllerDidFinish:", self);

}

- (PKWatchExtensionInstallViewControllerFlowDelegate)flowItemDelegate
{
  return (PKWatchExtensionInstallViewControllerFlowDelegate *)objc_loadWeakRetained((id *)&self->_flowItemDelegate);
}

- (void)setFlowItemDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowItemDelegate, a3);
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_reporter, a3);
}

- (PKSecureElementPass)secureElementPass
{
  return self->_secureElementPass;
}

- (void)setSecureElementPass:(id)a3
{
  objc_storeStrong((id *)&self->_secureElementPass, a3);
}

- (PKPaymentWebService)webservice
{
  return self->_webservice;
}

- (void)setWebservice:(id)a3
{
  objc_storeStrong((id *)&self->_webservice, a3);
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_webservice, 0);
  objc_storeStrong((id *)&self->_secureElementPass, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_destroyWeak((id *)&self->_flowItemDelegate);
  objc_storeStrong((id *)&self->_appStoreView, 0);
  objc_storeStrong((id *)&self->_deviceImageView, 0);
}

@end
