@implementation PKAddPassesRemoteAlertViewController

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKAddPassesRemoteAlertViewController;
  -[PKAddPassesRemoteAlertViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  if (v6)
  {
    objc_msgSend(v6, "bounds");
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    PKSetDisplayProperties();

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAddPassesRemoteAlertViewController;
  -[PKAddPassesRemoteAlertViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAddPassesRemoteAlertViewController;
  -[PKAddPassesRemoteAlertViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PKAddPassesRemoteAlertViewController _dismiss](self, "_dismiss");
}

- (unint64_t)supportedInterfaceOrientations
{
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    return 30;
  }
  else
  {
    return 2;
  }
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t buf[16];

  v6 = (void (**)(_QWORD))a4;
  v7 = a3;
  -[PKAddPassesRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 1;
  objc_msgSend(v8, "setAllowsAlertItems:", 1);
  objc_msgSend(v8, "setAllowsAlertStacking:", 1);
  objc_msgSend(v8, "setAllowsBanners:", 1);
  objc_msgSend(v8, "setAllowsSiri:", 0);
  objc_msgSend(v8, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v8, "setSwipeDismissalStyle:", 0);
  objc_msgSend(v8, "setDismissalAnimationStyle:", 1);
  objc_msgSend(v8, "setWallpaperStyle:withDuration:", 0, 0.0);
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AB98]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    if (!v11)
      goto LABEL_5;
    v10 = objc_msgSend(v11, "integerValue");
  }
  objc_msgSend(v8, "setLaunchingInterfaceOrientation:", v10);
LABEL_5:
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D6AB88]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D6AB90]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Creating remote view controller for issuer binding.", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PKAddPassesRemoteAlertViewController_configureWithContext_completion___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v18 = v12;
  v19 = v13;
  v15 = v13;
  v16 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  if (v6)
    v6[2](v6);

}

void __72__PKAddPassesRemoteAlertViewController_configureWithContext_completion___block_invoke(uint64_t a1)
{
  PKServiceAddPassesViewController *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t v14[16];

  v2 = objc_alloc_init(PKServiceAddPassesViewController);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 976);
  *(_QWORD *)(v3 + 976) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setResultsDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setModalPresentationStyle:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "presentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "ingestPasses:orPassesContainer:orIssuerData:withSignature:fromPresentationSource:", 0, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 2);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 976);
  if (v6
    && (objc_msgSend(v6, "topViewController"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976), 1, 0);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Unable to present issuer binding view controller", v14, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6A758], 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("ISSUER_DATA_GENERATION_FAILURE_TITLE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("ISSUER_DATA_GENERATION_FAILURE_MESSAGE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayableErrorCustom();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = PKAlertForDisplayableErrorWithHandlers(v12, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v13, 1, 0);

  }
}

- (void)didInvalidateForRemoteAlert
{
  objc_super v3;

  -[PKAddPassesRemoteAlertViewController _dismiss](self, "_dismiss");
  v3.receiver = self;
  v3.super_class = (Class)PKAddPassesRemoteAlertViewController;
  -[SBUIRemoteAlertServiceViewController didInvalidateForRemoteAlert](&v3, sel_didInvalidateForRemoteAlert);
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)_dismiss
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__PKAddPassesRemoteAlertViewController__dismiss__block_invoke;
  v2[3] = &unk_1E3E612E8;
  v2[4] = self;
  -[PKAddPassesRemoteAlertViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v2);
}

void __48__PKAddPassesRemoteAlertViewController__dismiss__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
