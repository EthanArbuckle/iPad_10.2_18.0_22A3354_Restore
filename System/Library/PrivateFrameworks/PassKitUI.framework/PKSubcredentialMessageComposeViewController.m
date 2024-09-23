@implementation PKSubcredentialMessageComposeViewController

- (PKSubcredentialMessageComposeViewController)initWithCoder:(id)a3
{

  return 0;
}

- (PKSubcredentialMessageComposeViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (PKSubcredentialMessageComposeViewController)initWithSharingRequest:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  PKSubcredentialMessageComposeViewController *v9;
  PKSubcredentialMessageComposeViewController *v10;
  uint64_t v11;
  uint64_t v12;
  _UIAsyncInvocation *remoteVCRequest;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKSubcredentialMessageComposeViewController;
  v9 = -[PKSubcredentialMessageComposeViewController initWithNibName:bundle:](&v18, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sharingRequest, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    objc_initWeak(&location, v10);
    -[PKSubcredentialMessageComposeViewController _beginDelayingPresentation:cancellationHandler:](v10, "_beginDelayingPresentation:cancellationHandler:", 0, 10.0);
    v11 = *MEMORY[0x1E0D6B9F0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __79__PKSubcredentialMessageComposeViewController_initWithSharingRequest_delegate___block_invoke;
    v15[3] = &unk_1E3E63410;
    objc_copyWeak(&v16, &location);
    +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](PKRemoteSubcredentialMessageComposeViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("PKServiceSubcredentialMessageComposeViewController"), v11, v15);
    v12 = objc_claimAutoreleasedReturnValue();
    remoteVCRequest = v10->_remoteVCRequest;
    v10->_remoteVCRequest = (_UIAsyncInvocation *)v12;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __79__PKSubcredentialMessageComposeViewController_initWithSharingRequest_delegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = (void *)*((_QWORD *)WeakRetained + 122);
    *((_QWORD *)WeakRetained + 122) = 0;

    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "ReadyController: %@", buf, 0xCu);
    }

    if (v5)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __79__PKSubcredentialMessageComposeViewController_initWithSharingRequest_delegate___block_invoke_80;
      v13[3] = &unk_1E3E61310;
      objc_copyWeak(&v14, v7);
      objc_msgSend(v9, "_setRemoteVC:completionHandler:", v5, v13);
      objc_destroyWeak(&v14);
    }
    else
    {
      objc_msgSend(v9, "_endDelayingPresentation");
      objc_msgSend(v9, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "messageComposeViewControllerDidFinishWithResult:", 0);

    }
  }

}

void __79__PKSubcredentialMessageComposeViewController_initWithSharingRequest_delegate___block_invoke_80(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_endDelayingPresentation");
    WeakRetained = v2;
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
  v6.super_class = (Class)PKSubcredentialMessageComposeViewController;
  -[PKSubcredentialMessageComposeViewController dealloc](&v6, sel_dealloc);
}

- (void)_setRemoteVC:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  PKRemoteSubcredentialMessageComposeViewController *remoteVC;
  id WeakRetained;
  void *v11;
  void *v12;
  PKRemoteSubcredentialMessageComposeViewController *v13;
  uint64_t v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  PKAppletSubcredentialSharingRequest *sharingRequest;
  NSObject *v25;
  uint8_t v26[16];
  _QWORD v27[4];
  void (**v28)(_QWORD);
  _QWORD v29[4];
  id v30;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_remoteVC, a3);
  remoteVC = self->_remoteVC;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[PKRemoteSubcredentialMessageComposeViewController setDelegate:](remoteVC, "setDelegate:", WeakRetained);

  objc_storeWeak((id *)&self->_delegate, 0);
  -[PKSubcredentialMessageComposeViewController addChildViewController:](self, "addChildViewController:", self->_remoteVC);
  -[PKRemoteSubcredentialMessageComposeViewController view](self->_remoteVC, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialMessageComposeViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v11);
  objc_msgSend(v12, "setNeedsLayout");
  objc_msgSend(v12, "layoutIfNeeded");
  -[_UIRemoteViewController didMoveToParentViewController:](self->_remoteVC, "didMoveToParentViewController:", self);
  -[PKSubcredentialMessageComposeViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[PKSubcredentialMessageComposeViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
  v13 = self->_remoteVC;
  v14 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __78__PKSubcredentialMessageComposeViewController__setRemoteVC_completionHandler___block_invoke;
  v29[3] = &unk_1E3E63438;
  v15 = (void (**)(_QWORD))v8;
  v30 = v15;
  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](v13, "serviceViewControllerProxyWithErrorHandler:", v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fixedCoordinateSpace");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v20 = v19;
    v22 = v21;
    objc_msgSend(v17, "scale");
    objc_msgSend(v16, "setDisplayPropertiesWithScreenSize:scale:", v20, v22, v23);

    sharingRequest = self->_sharingRequest;
    v27[0] = v14;
    v27[1] = 3221225472;
    v27[2] = __78__PKSubcredentialMessageComposeViewController__setRemoteVC_completionHandler___block_invoke_3;
    v27[3] = &unk_1E3E61590;
    v28 = v15;
    objc_msgSend(v16, "setSharingRequest:completionHandler:", sharingRequest, v27);

  }
  else if (v15)
  {
    PKLogFacilityTypeGetObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_19D178000, v25, OS_LOG_TYPE_DEFAULT, "No serviceVCProxy", v26, 2u);
    }

    v15[2](v15);
  }

}

void __78__PKSubcredentialMessageComposeViewController__setRemoteVC_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__PKSubcredentialMessageComposeViewController__setRemoteVC_completionHandler___block_invoke_2;
    block[3] = &unk_1E3E61590;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __78__PKSubcredentialMessageComposeViewController__setRemoteVC_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__PKSubcredentialMessageComposeViewController__setRemoteVC_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__PKSubcredentialMessageComposeViewController__setRemoteVC_completionHandler___block_invoke_4;
    block[3] = &unk_1E3E61590;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __78__PKSubcredentialMessageComposeViewController__setRemoteVC_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int64_t)modalTransitionStyle
{
  return 0;
}

- (int64_t)modalPresentationStyle
{
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    return 16;
  }
  else
  {
    return 0;
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  PKRemoteSubcredentialMessageComposeViewController *remoteVC;

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
    v4.super_class = (Class)PKSubcredentialMessageComposeViewController;
    -[PKSubcredentialMessageComposeViewController sizeForChildContentContainer:withParentContainerSize:](&v4, sel_sizeForChildContentContainer_withParentContainerSize_, result.width, result.height);
  }
  return result;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSubcredentialMessageComposeViewController;
  -[PKSubcredentialMessageComposeViewController loadView](&v5, sel_loadView);
  -[PKSubcredentialMessageComposeViewController view](self, "view");
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
  v5.super_class = (Class)PKSubcredentialMessageComposeViewController;
  -[PKSubcredentialMessageComposeViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKSubcredentialMessageComposeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemoteSubcredentialMessageComposeViewController view](self->_remoteVC, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (PKSubcredentialMessageComposeViewControllerDelegate)delegate
{
  void *WeakRetained;

  if (self->_remoteVC)
  {
    -[PKRemoteSubcredentialMessageComposeViewController delegate](self->_remoteVC, "delegate");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  return (PKSubcredentialMessageComposeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  if (self->_remoteVC)
    -[PKRemoteSubcredentialMessageComposeViewController setDelegate:](self->_remoteVC, "setDelegate:", a3);
  else
    objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteVC, 0);
  objc_storeStrong((id *)&self->_sharingRequest, 0);
  objc_storeStrong((id *)&self->_remoteVCRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
