@implementation PKShareSecureElementPassViewController

- (PKShareSecureElementPassViewController)init
{

  return 0;
}

- (PKShareSecureElementPassViewController)initWithSecureElementPass:(PKSecureElementPass *)pass delegate:(id)delegate
{
  return -[PKShareSecureElementPassViewController initWithSecureElementPass:environment:isFromPeopleScreen:delegate:](self, "initWithSecureElementPass:environment:isFromPeopleScreen:delegate:", pass, 2, 0, delegate);
}

- (PKShareSecureElementPassViewController)initWithSecureElementPass:(id)a3 environment:(unint64_t)a4 isFromPeopleScreen:(BOOL)a5 delegate:(id)a6
{
  id v11;
  id v12;
  PKShareSecureElementPassViewController *v13;
  PKShareSecureElementPassViewController *v14;
  objc_super v16;

  v11 = a3;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PKShareSecureElementPassViewController;
  v13 = -[PKShareSecureElementPassViewController init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_pass, a3);
    v14->_environment = a4;
    v14->_isFromPeopleScreen = a5;
    objc_storeWeak((id *)&v14->_delegate, v12);
    v14->_promptToShareURL = 1;
    -[PKShareSecureElementPassViewController loadRemoteViewController](v14, "loadRemoteViewController");
  }

  return v14;
}

- (void)dealloc
{
  id v3;
  _UIAsyncInvocation *remoteVCRequest;
  objc_super v5;

  v3 = (id)-[_UIAsyncInvocation invoke](self->_remoteVCRequest, "invoke");
  remoteVCRequest = self->_remoteVCRequest;
  self->_remoteVCRequest = 0;

  v5.receiver = self;
  v5.super_class = (Class)PKShareSecureElementPassViewController;
  -[PKShareSecureElementPassViewController dealloc](&v5, sel_dealloc);
}

- (void)loadRemoteViewController
{
  uint64_t v3;
  int v4;
  id *v5;
  id v6;
  _UIAsyncInvocation *v7;
  _UIAsyncInvocation *remoteVCRequest;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__PKShareSecureElementPassViewController_loadRemoteViewController__block_invoke;
  v11[3] = &unk_1E3E66CE8;
  v11[4] = self;
  -[PKShareSecureElementPassViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", v11, 10.0);
  v4 = -[PKSecureElementPass isCarKeyPass](self->_pass, "isCarKeyPass");
  v5 = (id *)MEMORY[0x1E0D6B9F0];
  if (!v4)
    v5 = (id *)MEMORY[0x1E0D69C80];
  v6 = *v5;
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __66__PKShareSecureElementPassViewController_loadRemoteViewController__block_invoke_75;
  v9[3] = &unk_1E3E66D10;
  v9[4] = self;
  objc_copyWeak(&v10, &location);
  +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](PKShareSecureElementPassRemoteViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("PKRemoteShareSecureElementPassViewController"), v6, v9);
  v7 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  remoteVCRequest = self->_remoteVCRequest;
  self->_remoteVCRequest = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

uint64_t __66__PKShareSecureElementPassViewController_loadRemoteViewController__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  id v5;
  uint8_t v7[16];

  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "ShareSecureElementPass: Timed out while presenting share pass view controller", v7, 2u);
  }

  v5 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "invoke");
  return a2 ^ 1u;
}

void __66__PKShareSecureElementPassViewController_loadRemoteViewController__block_invoke_75(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id *v11;
  id WeakRetained;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 992);
  *(_QWORD *)(v7 + 992) = 0;

  if (!v5 || v6)
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "ShareSecureElementPass: Failed to load remote view controller: %@", buf, 0xCu);
    }

    v11 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained(v11);
    objc_msgSend(WeakRetained, "_endDelayingPresentation");

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6B6B0], 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained(v11);
    objc_msgSend(v14, "didFinishShareWithDidUserShare:error:", 0, v13);

  }
  else
  {
    v9 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __66__PKShareSecureElementPassViewController_loadRemoteViewController__block_invoke_2;
    v15[3] = &unk_1E3E61C58;
    objc_copyWeak(&v16, (id *)(a1 + 40));
    objc_msgSend(v9, "setRemoteVC:completionHandler:", v5, v15);
    objc_destroyWeak(&v16);
  }

}

void __66__PKShareSecureElementPassViewController_loadRemoteViewController__block_invoke_2(uint64_t a1, int a2)
{
  id *v3;
  id WeakRetained;
  id v5;
  id v6;
  id v7;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_endDelayingPresentation");

  if (a2)
  {
    v5 = objc_loadWeakRetained(v3);
    objc_msgSend(v5, "_addRemoteVCToView");

    v7 = objc_loadWeakRetained(v3);
    objc_msgSend(v7, "_remoteDidGetConfigured");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6B6B0], 1, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained(v3);
    objc_msgSend(v6, "didFinishShareWithDidUserShare:error:", 0, v7);

  }
}

- (void)setRemoteVC:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  PKShareSecureElementPassRemoteViewController *remoteVC;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  PKSecureElementPass *pass;
  unint64_t environment;
  _BOOL8 isFromPeopleScreen;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_remoteVC, a3);
  remoteVC = self->_remoteVC;
  v10 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __72__PKShareSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke;
  v25[3] = &unk_1E3E63438;
  v11 = v8;
  v26 = v11;
  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](remoteVC, "serviceViewControllerProxyWithErrorHandler:", v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fixedCoordinateSpace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15;
    v18 = v17;
    objc_msgSend(v13, "scale");
    objc_msgSend(v12, "setDisplayPropertiesWithScreenSize:scale:", v16, v18, v19);

    pass = self->_pass;
    environment = self->_environment;
    isFromPeopleScreen = self->_isFromPeopleScreen;
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __72__PKShareSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_3;
    v23[3] = &unk_1E3E614F0;
    v24 = v11;
    objc_msgSend(v12, "setPass:environment:isFromPeopleScreen:completion:", pass, environment, isFromPeopleScreen, v23);

  }
  else
  {
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
  }

}

void __72__PKShareSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PKShareSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_2;
  block[3] = &unk_1E3E61590;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __72__PKShareSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__PKShareSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_3(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__PKShareSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_4;
  v3[3] = &unk_1E3E61A58;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __72__PKShareSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_addRemoteVCToView
{
  void *v3;
  id v4;

  -[PKShareSecureElementPassViewController addChildViewController:](self, "addChildViewController:", self->_remoteVC);
  -[PKShareSecureElementPassRemoteViewController view](self->_remoteVC, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKShareSecureElementPassViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);
  objc_msgSend(v3, "setNeedsLayout");
  objc_msgSend(v3, "layoutIfNeeded");
  -[_UIRemoteViewController didMoveToParentViewController:](self->_remoteVC, "didMoveToParentViewController:", self);
  -[PKShareSecureElementPassViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");

}

- (void)_remoteDidGetConfigured
{
  if (!self->_remoteVCConfigured)
  {
    self->_remoteVCConfigured = 1;
    -[PKShareSecureElementPassViewController setPromptToShareURL:](self, "setPromptToShareURL:", self->_promptToShareURL);
  }
}

- (void)setPromptToShareURL:(BOOL)promptToShareURL
{
  id v4;

  self->_promptToShareURL = promptToShareURL;
  if (self->_remoteVCConfigured)
  {
    -[_UIRemoteViewController serviceViewControllerProxy](self->_remoteVC, "serviceViewControllerProxy");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShouldPromptUserToShare:", self->_promptToShareURL);

  }
}

- (BOOL)shouldViewControllerBeAnimatedIn
{
  return self->_environment == 2;
}

- (void)didCreateShareURL:(id)a3 activationCode:(id)a4 error:(id)a5
{
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  char v11;
  id v12;
  id v13;

  v13 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "shareSecureElementPassViewController:didCreateShareURL:activationCode:", self, v13, v7);

    }
  }

}

- (void)didFinishShareWithDidUserShare:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("N");
    if (v4)
      v8 = CFSTR("Y");
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "ShareSecureElementPass: didFinishShare didUserShare: %@ error: %@", (uint8_t *)&v12, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    if (v6)
      v10 = 2;
    else
      v10 = v4;
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "shareSecureElementPassViewController:didFinishWithResult:", self, v10);
  }
  else
  {
    -[PKShareSecureElementPassViewController presentingViewController](self, "presentingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (int64_t)modalTransitionStyle
{
  return 0;
}

- (int64_t)modalPresentationStyle
{
  return 5;
}

- (unint64_t)supportedInterfaceOrientations
{
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
    v4.super_class = (Class)PKShareSecureElementPassViewController;
    -[PKShareSecureElementPassViewController sizeForChildContentContainer:withParentContainerSize:](&v4, sel_sizeForChildContentContainer_withParentContainerSize_, result.width, result.height);
  }
  return result;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKShareSecureElementPassViewController;
  -[PKShareSecureElementPassViewController loadView](&v5, sel_loadView);
  -[PKShareSecureElementPassViewController view](self, "view");
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
  v5.super_class = (Class)PKShareSecureElementPassViewController;
  -[PKShareSecureElementPassViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKShareSecureElementPassViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKShareSecureElementPassRemoteViewController view](self->_remoteVC, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (BOOL)promptToShareURL
{
  return self->_promptToShareURL;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteVC, 0);
  objc_storeStrong((id *)&self->_remoteVCRequest, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
