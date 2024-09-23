@implementation PKShareableCredentialsMessageComposeViewController

- (PKShareableCredentialsMessageComposeViewController)initWithCoder:(id)a3
{

  return 0;
}

- (PKShareableCredentialsMessageComposeViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (PKShareableCredentialsMessageComposeViewController)init
{

  return 0;
}

- (PKShareableCredentialsMessageComposeViewController)initWithConfiguration:(id)a3
{
  return (PKShareableCredentialsMessageComposeViewController *)-[PKShareableCredentialsMessageComposeViewController _initWithPartialShareInvite:configuration:](self, "_initWithPartialShareInvite:configuration:", 0, a3);
}

- (PKShareableCredentialsMessageComposeViewController)initWithPartialShareInvite:(id)a3
{
  return (PKShareableCredentialsMessageComposeViewController *)-[PKShareableCredentialsMessageComposeViewController _initWithPartialShareInvite:configuration:](self, "_initWithPartialShareInvite:configuration:", a3, 0);
}

- (id)_initWithPartialShareInvite:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  id *v9;
  id *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[PKShareableCredentialsMessageComposeViewController _init](self, "_init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(v9 + 123, a3);
    objc_storeStrong(v10 + 122, a4);
  }

  return v10;
}

- (id)_init
{
  PKShareableCredentialsMessageComposeViewController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKShareableCredentialsMessageComposeViewController;
  v2 = -[PKShareableCredentialsMessageComposeViewController initWithNibName:bundle:](&v4, sel_initWithNibName_bundle_, 0, 0);
  -[PKShareableCredentialsMessageComposeViewController _setupRemoteView](v2, "_setupRemoteView");
  return v2;
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
  v6.super_class = (Class)PKShareableCredentialsMessageComposeViewController;
  -[PKShareableCredentialsMessageComposeViewController dealloc](&v6, sel_dealloc);
}

- (void)_setupRemoteView
{
  uint64_t v3;
  _UIAsyncInvocation *v4;
  _UIAsyncInvocation *remoteVCRequest;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[PKShareableCredentialsMessageComposeViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", 0, 10.0);
  v3 = *MEMORY[0x1E0D69C80];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__PKShareableCredentialsMessageComposeViewController__setupRemoteView__block_invoke;
  v6[3] = &unk_1E3E63410;
  objc_copyWeak(&v7, &location);
  +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](PKRemoteShareableCredentialsMessageComposeViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("PKServiceMessagesComposeViewController"), v3, v6);
  v4 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  remoteVCRequest = self->_remoteVCRequest;
  self->_remoteVCRequest = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __70__PKShareableCredentialsMessageComposeViewController__setupRemoteView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = (void *)*((_QWORD *)WeakRetained + 124);
    *((_QWORD *)WeakRetained + 124) = 0;

    if (v5)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __70__PKShareableCredentialsMessageComposeViewController__setupRemoteView__block_invoke_2;
      v12[3] = &unk_1E3E61310;
      objc_copyWeak(&v13, v7);
      objc_msgSend(v9, "_setRemoteVC:completionHandler:", v5, v12);
      objc_destroyWeak(&v13);
    }
    else
    {
      objc_msgSend(v9, "_endDelayingPresentation");
      objc_msgSend(v9, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "messageComposeViewControllerDidFinishWithResult:", 0);

    }
  }

}

void __70__PKShareableCredentialsMessageComposeViewController__setupRemoteView__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_endDelayingPresentation");

}

- (void)_setRemoteVC:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  PKRemoteShareableCredentialsMessageComposeViewController *remoteVC;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  void (**v14)(_QWORD);
  void *v15;
  PKRemoteShareableCredentialsMessageComposeViewController *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  PKAddShareablePassConfiguration *configuration;
  PKPartialShareInvitation *partialShareInvite;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  id v32;
  _QWORD aBlock[4];
  id v34;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_remoteVC, a3);
  remoteVC = self->_remoteVC;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[PKRemoteShareableCredentialsMessageComposeViewController setDelegate:](remoteVC, "setDelegate:", WeakRetained);

  objc_storeWeak((id *)&self->_delegate, 0);
  -[PKShareableCredentialsMessageComposeViewController addChildViewController:](self, "addChildViewController:", self->_remoteVC);
  -[PKRemoteShareableCredentialsMessageComposeViewController view](self->_remoteVC, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKShareableCredentialsMessageComposeViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v11);
  objc_msgSend(v12, "setNeedsLayout");
  objc_msgSend(v12, "layoutIfNeeded");
  -[_UIRemoteViewController didMoveToParentViewController:](self->_remoteVC, "didMoveToParentViewController:", self);
  -[PKShareableCredentialsMessageComposeViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[PKShareableCredentialsMessageComposeViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PKShareableCredentialsMessageComposeViewController__setRemoteVC_completionHandler___block_invoke;
  aBlock[3] = &unk_1E3E61590;
  v14 = (void (**)(_QWORD))v8;
  v34 = v14;
  v15 = _Block_copy(aBlock);
  v16 = self->_remoteVC;
  v28 = v13;
  v29 = 3221225472;
  v30 = __85__PKShareableCredentialsMessageComposeViewController__setRemoteVC_completionHandler___block_invoke_3;
  v31 = &unk_1E3E63438;
  v17 = v15;
  v32 = v17;
  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](v16, "serviceViewControllerProxyWithErrorHandler:", &v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", v28, v29, v30, v31);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fixedCoordinateSpace");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    v22 = v21;
    v24 = v23;
    objc_msgSend(v19, "scale");
    objc_msgSend(v18, "setDisplayPropertiesWithScreenSize:scale:", v22, v24, v25);

    configuration = self->_configuration;
    if (configuration)
    {
      objc_msgSend(v18, "setConfiguration:completionHandler:", configuration, v17);
    }
    else
    {
      partialShareInvite = self->_partialShareInvite;
      if (partialShareInvite)
        objc_msgSend(v18, "setPartialShareInvite:completion:", partialShareInvite, v17);
    }

  }
  else
  {
    v14[2](v14);
  }

}

void __85__PKShareableCredentialsMessageComposeViewController__setRemoteVC_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PKShareableCredentialsMessageComposeViewController__setRemoteVC_completionHandler___block_invoke_2;
  block[3] = &unk_1E3E61590;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __85__PKShareableCredentialsMessageComposeViewController__setRemoteVC_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__PKShareableCredentialsMessageComposeViewController__setRemoteVC_completionHandler___block_invoke_3(uint64_t a1)
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
  PKRemoteShareableCredentialsMessageComposeViewController *remoteVC;

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
    v4.super_class = (Class)PKShareableCredentialsMessageComposeViewController;
    -[PKShareableCredentialsMessageComposeViewController sizeForChildContentContainer:withParentContainerSize:](&v4, sel_sizeForChildContentContainer_withParentContainerSize_, result.width, result.height);
  }
  return result;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKShareableCredentialsMessageComposeViewController;
  -[PKShareableCredentialsMessageComposeViewController loadView](&v5, sel_loadView);
  -[PKShareableCredentialsMessageComposeViewController view](self, "view");
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
  v5.super_class = (Class)PKShareableCredentialsMessageComposeViewController;
  -[PKShareableCredentialsMessageComposeViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKShareableCredentialsMessageComposeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemoteShareableCredentialsMessageComposeViewController view](self->_remoteVC, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (PKShareableCredentialsMessageComposeViewControllerDelegate)delegate
{
  void *WeakRetained;

  if (self->_remoteVC)
  {
    -[PKRemoteShareableCredentialsMessageComposeViewController delegate](self->_remoteVC, "delegate");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  return (PKShareableCredentialsMessageComposeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  if (self->_remoteVC)
    -[PKRemoteShareableCredentialsMessageComposeViewController setDelegate:](self->_remoteVC, "setDelegate:", a3);
  else
    objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)recipientAddresses
{
  return self->_recipientAddresses;
}

- (void)setRecipientAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_recipientAddresses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_remoteVC, 0);
  objc_storeStrong((id *)&self->_remoteVCRequest, 0);
  objc_storeStrong((id *)&self->_partialShareInvite, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
