@implementation PKRemoteShareSecureElementPassViewController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKRemoteShareSecureElementPassViewController;
  -[PKRemoteShareSecureElementPassViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKRemoteShareSecureElementPassViewController;
  -[PKRemoteShareSecureElementPassViewController loadView](&v5, sel_loadView);
  -[PKRemoteShareSecureElementPassViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKRemoteShareSecureElementPassViewController;
  -[PKRemoteShareSecureElementPassViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v4, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
}

- (void)setDisplayPropertiesWithScreenSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height;
  CGFloat width;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  double v12;
  uint64_t v13;
  CGSize v14;

  height = a3.height;
  width = a3.width;
  v13 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14.width = width;
    v14.height = height;
    NSStringFromCGSize(v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2048;
    v12 = a4;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Setting display properties with screenSize=%{public}@ scale=%.f", (uint8_t *)&v9, 0x16u);

  }
  PKSetDisplayProperties();
}

- (void)setPass:(id)a3 environment:(unint64_t)a4 isFromPeopleScreen:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31[2];
  BOOL v32;
  id location[2];
  _BYTE v34[32];

  v10 = a3;
  v11 = a6;
  v12 = objc_alloc(MEMORY[0x1E0D66D40]);
  v13 = -[PKRemoteShareSecureElementPassViewController _hostProcessIdentifier](self, "_hostProcessIdentifier");
  -[PKRemoteShareSecureElementPassViewController _hostAuditToken](self, "_hostAuditToken");
  v14 = (void *)objc_msgSend(v12, "initWithProcessIdentifier:auditToken:", v13, v34);
  if ((objc_msgSend(v14, "shareableCredentialProvisioning") & 1) != 0
    || (objc_msgSend(v14, "carKeyCredentialProvisioning") & 1) != 0
    || (objc_msgSend(v14, "passesAllAccess") & 1) != 0)
  {
    objc_msgSend(v10, "uniqueID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "passWithUniqueID:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "secureElementPass");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      if ((objc_msgSend(v14, "entitledToPerformPassAction:pass:", 2, v18) & 1) != 0)
      {
        objc_initWeak(location, self);
        v19 = objc_alloc(MEMORY[0x1E0D67688]);
        objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = MEMORY[0x1E0C80D38];
        v22 = MEMORY[0x1E0C80D38];
        v23 = (void *)objc_msgSend(v19, "initWithPass:webService:paymentServiceProvider:queue:", v18, v20, 0, v21);

        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __98__PKRemoteShareSecureElementPassViewController_setPass_environment_isFromPeopleScreen_completion___block_invoke;
        v28[3] = &unk_1E3E78638;
        objc_copyWeak(v31, location);
        v30 = v11;
        v24 = v23;
        v29 = v24;
        v31[1] = (id)a4;
        v32 = a5;
        objc_msgSend(v24, "updateSharesWithCompletion:", v28);

        objc_destroyWeak(v31);
        objc_destroyWeak(location);
LABEL_13:

        goto LABEL_14;
      }
      PKLogFacilityTypeGetObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        v26 = "Process not entitled for presented pass";
        goto LABEL_11;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        v26 = "Unable to find pass for provide pass uniqueID";
LABEL_11:
        _os_log_impl(&dword_19D178000, v25, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)location, 2u);
      }
    }

    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
    goto LABEL_13;
  }
  PKLogFacilityTypeGetObject();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_impl(&dword_19D178000, v27, OS_LOG_TYPE_DEFAULT, "Process not entitled for shareable pass provisioning", (uint8_t *)location, 2u);
  }

  (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
LABEL_14:

}

void __98__PKRemoteShareSecureElementPassViewController_setPass_environment_isFromPeopleScreen_completion___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  PKPassShareInitiationNavigationController *v3;
  void *v4;
  PKPassShareInitiationNavigationController *v5;
  NSObject *v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
LABEL_7:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_8;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "sharingEnabled") & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Sharing not enabled for pass", v7, 2u);
    }

    goto LABEL_7;
  }
  v3 = -[PKPassShareInitiationNavigationController initWithSharesController:environment:]([PKPassShareInitiationNavigationController alloc], "initWithSharesController:environment:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  -[PKPassShareInitiationNavigationController setShareDelegate:](v3, "setShareDelegate:", WeakRetained);
  -[PKPassShareInitiationNavigationController setIsFromPeopleScreen:](v3, "setIsFromPeopleScreen:", *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(WeakRetained, "_setRootViewController:", v3);
  v4 = (void *)WeakRetained[121];
  WeakRetained[121] = v3;
  v5 = v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_8:

}

- (void)setShouldPromptUserToShare:(BOOL)a3
{
  -[PKPassShareInitiationNavigationController setShouldPromptUserToShare:](self->_shareNavigationController, "setShouldPromptUserToShare:", a3);
}

- (void)_setRootViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PKRemoteShareSecureElementPassViewController addChildViewController:](self, "addChildViewController:", v4);
  objc_msgSend(v4, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKRemoteShareSecureElementPassViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);
  objc_msgSend(v5, "setNeedsLayout");
  objc_msgSend(v5, "layoutIfNeeded");
  objc_msgSend(v4, "didMoveToParentViewController:", self);

}

- (void)didFinishShareWithDidUserShare:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[PKRemoteShareSecureElementPassViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didFinishShareWithDidUserShare:error:", v4, v6);

}

- (void)didCreateShareURL:(id)a3 activationCode:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PKRemoteShareSecureElementPassViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didCreateShareURL:activationCode:error:", v10, v9, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareNavigationController, 0);
}

@end
