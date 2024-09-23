@implementation PKProvisioningContinuityAlertViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKProvisioningContinuityAlertViewController;
  -[PKProvisioningContinuityAlertViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  if (v6)
  {
    objc_msgSend(v6, "bounds");
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    PKSetDisplayProperties();

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKProvisioningContinuityAlertViewController;
  -[PKProvisioningContinuityAlertViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PKProvisioningContinuityAlertViewController _configureViewController](self, "_configureViewController");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKProvisioningContinuityAlertViewController;
  -[PKProvisioningContinuityAlertViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PKProvisioningContinuityAlertViewController _dismissForSource:](self, "_dismissForSource:", 1);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void (**v11)(void *, uint64_t);
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  PKSharingChannelHandle *v16;
  PKSharingChannelHandle *handle;
  PKSharingChannelHandle *v18;
  _BOOL4 v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  PKProvisioningContinuityCarKeyHostViewController *v24;
  PKProvisioningContinuityAlertHostContentProviding *contentProvider;
  void (*v26)(void *, uint64_t);
  int v27;
  id v28;
  void *v29;
  _QWORD aBlock[4];
  id v31;
  PKProvisioningContinuityAlertViewController *v32;
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[PKProvisioningContinuityAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsAlertItems:", 1);
  objc_msgSend(v8, "setAllowsSiri:", 0);
  objc_msgSend(v8, "setAllowsBanners:", 1);
  objc_msgSend(v8, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v8, "setSwipeDismissalStyle:", 0);
  objc_msgSend(v8, "setDismissalAnimationStyle:", 0);
  objc_msgSend(v8, "setWallpaperStyle:withDuration:", 0, 0.0);
  objc_msgSend(v8, "setLaunchingInterfaceOrientation:", 1);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKProvisioningContinuityAlertViewController_configureWithContext_completion___block_invoke;
  aBlock[3] = &unk_1E3E689B8;
  v9 = v6;
  v33 = v9;
  v10 = v8;
  v31 = v10;
  v32 = self;
  v11 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  objc_msgSend(v7, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v12;
    _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "PKProvisioningContinuityAlertViewController: presenting for info: %@", buf, 0xCu);
  }

  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D6ABB8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D6ABA8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "PKProvisioningContinuityAlertViewController: Missing transfer token", buf, 2u);
      }

      v11[2](v11, 1);
      goto LABEL_33;
    }
    v29 = (void *)objc_msgSend(MEMORY[0x1E0D676B0], "createForTransferToken:", v15);
    v16 = (PKSharingChannelHandle *)objc_msgSend(MEMORY[0x1E0D67698], "createHandleForDescriptor:queue:");
    handle = self->_handle;
    self->_handle = v16;

    v18 = self->_handle;
    v19 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (!v18)
    {
      if (v19)
      {
        *(_DWORD *)buf = 138412290;
        v35 = v15;
        _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "PKProvisioningContinuityAlertViewController: Failed to create handle for transferToken: '%@'", buf, 0xCu);
      }

      v11[2](v11, 1);
      goto LABEL_32;
    }
    v28 = v9;
    if (v19)
    {
      *(_DWORD *)buf = 138412290;
      v35 = v14;
      _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "PKProvisioningContinuityAlertViewController: Creating content provider for %@", buf, 0xCu);
    }

    v20 = (void *)*MEMORY[0x1E0D6ABC0];
    v21 = v14;
    v22 = v20;
    if (v21 == v22)
    {

    }
    else
    {
      v23 = v22;
      if (!v22)
      {

LABEL_24:
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v21;
          _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "PKProvisioningContinuityAlertViewController: Unknown type: '%@'", buf, 0xCu);
        }

        goto LABEL_27;
      }
      v27 = objc_msgSend(v21, "isEqualToString:", v22);

      if (!v27)
        goto LABEL_24;
    }
    v24 = -[PKProvisioningContinuityCarKeyHostViewController initWithHandle:userInfo:parent:]([PKProvisioningContinuityCarKeyHostViewController alloc], "initWithHandle:userInfo:parent:", self->_handle, v12, self);
    contentProvider = self->_contentProvider;
    self->_contentProvider = (PKProvisioningContinuityAlertHostContentProviding *)v24;

LABEL_27:
    v26 = v11[2];
    v9 = v28;
    if (self->_contentProvider)
    {
      v26(v11, 0);
    }
    else
    {
      v26(v11, 1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "PKProvisioningContinuityAlertViewController: Unknown create content provider", buf, 2u);
      }

    }
LABEL_32:

LABEL_33:
    goto LABEL_34;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "PKProvisioningContinuityAlertViewController: Alert presentation missing type", buf, 2u);
  }

  v11[2](v11, 1);
LABEL_34:

}

uint64_t __79__PKProvisioningContinuityAlertViewController_configureWithContext_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    result = (*(uint64_t (**)(void))(result + 16))();
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    return objc_msgSend(*(id *)(a1 + 40), "_dismissForSource:", 2);
  }
  return result;
}

- (void)handleButtonActions:(id)a3
{
  -[PKProvisioningContinuityAlertViewController _dismissForSource:](self, "_dismissForSource:", 1);
}

- (void)invalidate
{
  -[PKProvisioningContinuityAlertViewController _dismissForSource:](self, "_dismissForSource:", 3);
}

- (void)_configureViewController
{
  PKProvisioningContinuityAlertHostContentProviding *contentProvider;
  PKProvisioningContinuityAlertHostContentProviding *v4;
  void *v5;
  id v6;

  contentProvider = self->_contentProvider;
  if (contentProvider)
  {
    v4 = contentProvider;
    -[PKProvisioningContinuityAlertViewController view](self, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PKProvisioningContinuityAlertHostContentProviding view](v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProvisioningContinuityAlertViewController addChildViewController:](self, "addChildViewController:", v4);
    objc_msgSend(v6, "addSubview:", v5);
    -[PKProvisioningContinuityAlertHostContentProviding didMoveToParentViewController:](v4, "didMoveToParentViewController:", self);

    -[PKProvisioningContinuityAlertViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    -[PKProvisioningContinuityAlertViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
    objc_msgSend(v6, "setNeedsLayout");
    objc_msgSend(v6, "layoutIfNeeded");

  }
}

- (void)_dismissForSource:(unint64_t)a3
{
  PKSharingChannelHandle *handle;
  void (**v5)(_QWORD);
  void *v6;
  _QWORD aBlock[5];

  if (a3)
  {
    -[PKSharingChannelHandle closeWithCompletion:](self->_handle, "closeWithCompletion:", 0);
    -[PKSharingChannelHandle invalidate](self->_handle, "invalidate");
    handle = self->_handle;
    self->_handle = 0;

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PKProvisioningContinuityAlertViewController__dismissForSource___block_invoke;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = self;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[PKProvisioningContinuityAlertViewController presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[PKProvisioningContinuityAlertViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5);
  else
    v5[2](v5);

}

void __65__PKProvisioningContinuityAlertViewController__dismissForSource___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
