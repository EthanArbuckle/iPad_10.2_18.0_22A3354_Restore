@implementation PKPerformActionSetupViewController

- (PKPerformActionSetupViewController)init
{

  return 0;
}

- (PKPerformActionSetupViewController)initWithPassIdentifier:(id)a3
{
  id v5;
  PKPerformActionSetupViewController *v6;
  PKPerformActionSetupViewController *v7;
  uint64_t v8;
  _UIAsyncInvocation *remoteVCRequest;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPerformActionSetupViewController;
  v6 = -[PKPerformActionSetupViewController init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_explicitPresentationStyle = 0;
    objc_storeStrong((id *)&v6->_passIdentifier, a3);
    objc_initWeak(&location, v7);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__PKPerformActionSetupViewController_initWithPassIdentifier___block_invoke;
    v11[3] = &unk_1E3E63410;
    objc_copyWeak(&v12, &location);
    +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](PKRemotePerformActionSetupViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("PKServicePerformActionSetupViewController"), CFSTR("com.apple.PassbookUIService"), v11);
    v8 = objc_claimAutoreleasedReturnValue();
    remoteVCRequest = v7->_remoteVCRequest;
    v7->_remoteVCRequest = (_UIAsyncInvocation *)v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __61__PKPerformActionSetupViewController_initWithPassIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 122);
    *((_QWORD *)WeakRetained + 122) = 0;

    if (v6)
      objc_msgSend(v4, "_setRemoteVC:completionHandler:", v6, 0);
    else
      objc_msgSend(v4, "didCancel");
  }

}

- (void)dealloc
{
  _UIAsyncInvocation *remoteVCRequest;
  id v4;
  _UIAsyncInvocation *v5;
  objc_super v6;

  remoteVCRequest = self->_remoteVCRequest;
  if (remoteVCRequest)
  {
    v4 = (id)-[_UIAsyncInvocation invoke](remoteVCRequest, "invoke");
    v5 = self->_remoteVCRequest;
    self->_remoteVCRequest = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)PKPerformActionSetupViewController;
  -[PKPerformActionSetupViewController dealloc](&v6, sel_dealloc);
}

- (void)_setRemoteVC:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  PKRemotePerformActionSetupViewController *remoteVC;
  uint64_t v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSString *passIdentifier;
  _QWORD v23[4];
  void (**v24)(_QWORD);
  _QWORD v25[4];
  id v26;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_remoteVC, a3);
  -[PKPerformActionSetupViewController addChildViewController:](self, "addChildViewController:", self->_remoteVC);
  -[PKRemotePerformActionSetupViewController view](self->_remoteVC, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPerformActionSetupViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v9);
  objc_msgSend(v10, "setNeedsLayout");
  objc_msgSend(v10, "layoutIfNeeded");
  objc_msgSend(v9, "setUserInteractionEnabled:", 0);
  -[_UIRemoteViewController didMoveToParentViewController:](self->_remoteVC, "didMoveToParentViewController:", self);
  -[PKPerformActionSetupViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[PKPerformActionSetupViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
  remoteVC = self->_remoteVC;
  v12 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __69__PKPerformActionSetupViewController__setRemoteVC_completionHandler___block_invoke;
  v25[3] = &unk_1E3E63438;
  v13 = (void (**)(_QWORD))v8;
  v26 = v13;
  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](remoteVC, "serviceViewControllerProxyWithErrorHandler:", v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fixedCoordinateSpace");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v18 = v17;
    v20 = v19;
    objc_msgSend(v15, "scale");
    objc_msgSend(v14, "setDisplayPropertiesWithScreenSize:scale:", v18, v20, v21);

    passIdentifier = self->_passIdentifier;
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __69__PKPerformActionSetupViewController__setRemoteVC_completionHandler___block_invoke_3;
    v23[3] = &unk_1E3E614F0;
    v24 = v13;
    objc_msgSend(v14, "configureWithPassUniqueIdentifier:actionType:completion:", passIdentifier, 1, v23);

  }
  else if (v13)
  {
    v13[2](v13);
  }

}

void __69__PKPerformActionSetupViewController__setRemoteVC_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__PKPerformActionSetupViewController__setRemoteVC_completionHandler___block_invoke_2;
    block[3] = &unk_1E3E61590;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __69__PKPerformActionSetupViewController__setRemoteVC_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__PKPerformActionSetupViewController__setRemoteVC_completionHandler___block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKPerformActionSetupViewController__setRemoteVC_completionHandler___block_invoke_4;
  block[3] = &unk_1E3E61590;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __69__PKPerformActionSetupViewController__setRemoteVC_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setPresentationStyle:(int64_t)a3
{
  if (self->_presentationStyle != a3 || !self->_explicitPresentationStyle)
  {
    self->_presentationStyle = 2 * (a3 == 2);
    self->_explicitPresentationStyle = 1;
    -[PKPerformActionSetupViewController updateModalPresentationStyle](self, "updateModalPresentationStyle");
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPerformActionSetupViewController;
  -[PKPerformActionSetupViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[PKPerformActionSetupViewController updateModalPresentationStyle](self, "updateModalPresentationStyle");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPerformActionSetupViewController;
  -[PKPerformActionSetupViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v5, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  -[PKPerformActionSetupViewController updateModalPresentationStyle](self, "updateModalPresentationStyle");
}

- (void)updateModalPresentationStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PKPerformActionSetupViewController *v8;
  int64_t presentationStyle;
  id v10;

  -[PKPerformActionSetupViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v10;
  if (v10)
  {
    objc_msgSend(v10, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = objc_msgSend(v5, "interfaceOrientation");
      if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
      {
        v8 = self;
        presentationStyle = 16;
      }
      else if ((unint64_t)(v7 - 3) >= 2 && self->_explicitPresentationStyle)
      {
        presentationStyle = self->_presentationStyle;
        v8 = self;
      }
      else
      {
        v8 = self;
        presentationStyle = 0;
      }
      -[PKPerformActionSetupViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", presentationStyle);
    }

    v4 = v10;
  }

}

- (int64_t)modalTransitionStyle
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  PKRemotePerformActionSetupViewController *remoteVC;

  remoteVC = self->_remoteVC;
  if (remoteVC)
    return -[_UIRemoteViewController supportedInterfaceOrientations](remoteVC, "supportedInterfaceOrientations");
  else
    return 2;
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_remoteVC;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_remoteVC;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)result
{
  objc_super v4;

  if (self->_remoteVC != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)PKPerformActionSetupViewController;
    -[PKPerformActionSetupViewController sizeForChildContentContainer:withParentContainerSize:](&v4, sel_sizeForChildContentContainer_withParentContainerSize_, result.width, result.height);
  }
  return result;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPerformActionSetupViewController;
  -[PKPerformActionSetupViewController loadView](&v5, sel_loadView);
  -[PKPerformActionSetupViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPerformActionSetupViewController;
  -[PKPerformActionSetupViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKPerformActionSetupViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemotePerformActionSetupViewController view](self->_remoteVC, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (void)didCancel
{
  NSObject *v3;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t v13[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPerformActionSetupViewController did cancel", v13, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "performActionSetupViewControllerDidCancel:", self);

    }
  }
  -[PKPerformActionSetupViewController presentingViewController](self, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    -[PKPerformActionSetupViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "popViewControllerAnimated:", 1);

  }
}

- (void)didFinish
{
  NSObject *v3;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t v13[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPerformActionSetupViewController did finish", v13, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "performActionSetupViewControllerDidFinish:", self);

    }
  }
  -[PKPerformActionSetupViewController presentingViewController](self, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    -[PKPerformActionSetupViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "popViewControllerAnimated:", 1);

  }
}

- (PKPerformActionSetupViewControllerDelegate)delegate
{
  return (PKPerformActionSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteVCRequest, 0);
  objc_storeStrong((id *)&self->_remoteVC, 0);
}

@end
