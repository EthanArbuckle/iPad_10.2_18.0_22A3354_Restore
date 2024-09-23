@implementation PKTransactionAuthenticationPasscodeViewController

- (PKTransactionAuthenticationPasscodeViewController)init
{

  return 0;
}

- (PKTransactionAuthenticationPasscodeViewController)initWithPassUniqueIdentifier:(id)a3 transactionIdentifier:(id)a4 archivedAnalyticsSessionToken:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKTransactionAuthenticationPasscodeViewController *v12;
  PKTransactionAuthenticationPasscodeViewController *v13;
  uint64_t v14;
  _UIAsyncInvocation *remoteVCRequest;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PKTransactionAuthenticationPasscodeViewController;
  v12 = -[PKTransactionAuthenticationPasscodeViewController init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_passUniqueIdentifier, a3);
    objc_storeStrong((id *)&v13->_transactionIdentifier, a4);
    objc_storeStrong((id *)&v13->_archivedAnalyticsSessionToken, a5);
    v13->_delegateLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v13);
    -[PKTransactionAuthenticationPasscodeViewController _beginDelayingPresentation:cancellationHandler:](v13, "_beginDelayingPresentation:cancellationHandler:", 0, 10.0);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __134__PKTransactionAuthenticationPasscodeViewController_initWithPassUniqueIdentifier_transactionIdentifier_archivedAnalyticsSessionToken___block_invoke;
    v17[3] = &unk_1E3E63410;
    objc_copyWeak(&v18, &location);
    +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](PKRemoteTransactionAuthenticationPasscodeViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("PKServiceTransactionAuthenticationPasscodeViewController"), CFSTR("com.apple.PassbookSecureUIService"), v17);
    v14 = objc_claimAutoreleasedReturnValue();
    remoteVCRequest = v13->_remoteVCRequest;
    v13->_remoteVCRequest = (_UIAsyncInvocation *)v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __134__PKTransactionAuthenticationPasscodeViewController_initWithPassUniqueIdentifier_transactionIdentifier_archivedAnalyticsSessionToken___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v10 = (void *)*((_QWORD *)WeakRetained + 121);
    *((_QWORD *)WeakRetained + 121) = 0;

    if (v5)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __134__PKTransactionAuthenticationPasscodeViewController_initWithPassUniqueIdentifier_transactionIdentifier_archivedAnalyticsSessionToken___block_invoke_2;
      v12[3] = &unk_1E3E61C58;
      objc_copyWeak(&v13, v7);
      objc_msgSend(v9, "_setRemoteVC:completion:", v5, v12);
      objc_destroyWeak(&v13);
    }
    else
    {
      objc_msgSend(v9, "_endDelayingPresentation");
      objc_msgSend(v9, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "passcodeViewControllerDidCancel:", v9);

    }
  }

}

void __134__PKTransactionAuthenticationPasscodeViewController_initWithPassUniqueIdentifier_transactionIdentifier_archivedAnalyticsSessionToken___block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_endDelayingPresentation");
    WeakRetained = v5;
    if ((a2 & 1) == 0)
    {
      objc_msgSend(v5, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "passcodeViewControllerDidCancel:", v5);

      WeakRetained = v5;
    }
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
  v6.super_class = (Class)PKTransactionAuthenticationPasscodeViewController;
  -[PKTransactionAuthenticationPasscodeViewController dealloc](&v6, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  PKRemoteTransactionAuthenticationPasscodeViewController *remoteVC;

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
    v4.super_class = (Class)PKTransactionAuthenticationPasscodeViewController;
    -[PKTransactionAuthenticationPasscodeViewController sizeForChildContentContainer:withParentContainerSize:](&v4, sel_sizeForChildContentContainer_withParentContainerSize_, result.width, result.height);
  }
  return result;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTransactionAuthenticationPasscodeViewController;
  -[PKTransactionAuthenticationPasscodeViewController loadView](&v5, sel_loadView);
  -[PKTransactionAuthenticationPasscodeViewController view](self, "view");
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
  v5.super_class = (Class)PKTransactionAuthenticationPasscodeViewController;
  -[PKTransactionAuthenticationPasscodeViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKRemoteTransactionAuthenticationPasscodeViewController view](self->_remoteVC, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionAuthenticationPasscodeViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (void)resetWithTransactionAuthenticationFailure:(int64_t)a3 completion:(id)a4
{
  id v6;
  PKRemoteTransactionAuthenticationPasscodeViewController *remoteVC;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  remoteVC = self->_remoteVC;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __106__PKTransactionAuthenticationPasscodeViewController_resetWithTransactionAuthenticationFailure_completion___block_invoke;
  v13[3] = &unk_1E3E63438;
  v9 = v6;
  v14 = v9;
  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](remoteVC, "serviceViewControllerProxyWithErrorHandler:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __106__PKTransactionAuthenticationPasscodeViewController_resetWithTransactionAuthenticationFailure_completion___block_invoke_2;
    v11[3] = &unk_1E3E614F0;
    v12 = v9;
    objc_msgSend(v10, "resetWithTransactionAuthenticationFailure:completion:", a3, v11);

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

uint64_t __106__PKTransactionAuthenticationPasscodeViewController_resetWithTransactionAuthenticationFailure_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __106__PKTransactionAuthenticationPasscodeViewController_resetWithTransactionAuthenticationFailure_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_delegateLock;
  id v5;

  p_delegateLock = &self->_delegateLock;
  v5 = a3;
  os_unfair_lock_lock(p_delegateLock);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_delegateLock);
}

- (PKTransactionAuthenticationPasscodeViewControllerDelegate)delegate
{
  os_unfair_lock_s *p_delegateLock;
  id WeakRetained;

  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_delegateLock);
  return (PKTransactionAuthenticationPasscodeViewControllerDelegate *)WeakRetained;
}

- (void)passcodeViewControllerRequestSessionExchangeTokenWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKTransactionAuthenticationPasscodeViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passcodeViewController:requestSessionExchangeTokenWithHandler:", self, v4);

}

- (void)passcodeViewControllerDidEndSessionExchange
{
  id v3;

  -[PKTransactionAuthenticationPasscodeViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passcodeViewControllerDidEndSessionExchange:", self);

}

- (void)passcodeViewControllerDidCancel
{
  id v3;

  -[PKTransactionAuthenticationPasscodeViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passcodeViewControllerDidCancel:", self);

}

- (void)passcodeViewControllerDidGenerateEncryptedPasscode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKTransactionAuthenticationPasscodeViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passcodeViewController:didGenerateEncryptedPasscode:", self, v4);

}

- (void)_setRemoteVC:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  PKRemoteTransactionAuthenticationPasscodeViewController *remoteVC;
  uint64_t v12;
  id v13;
  void *v14;
  NSString *passUniqueIdentifier;
  NSString *transactionIdentifier;
  NSData *archivedAnalyticsSessionToken;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_remoteVC, a3);
  -[PKRemoteTransactionAuthenticationPasscodeViewController setDelegate:](self->_remoteVC, "setDelegate:", self);
  -[PKTransactionAuthenticationPasscodeViewController addChildViewController:](self, "addChildViewController:", self->_remoteVC);
  -[PKRemoteTransactionAuthenticationPasscodeViewController view](self->_remoteVC, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionAuthenticationPasscodeViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v9);
  objc_msgSend(v10, "setNeedsLayout");
  objc_msgSend(v10, "layoutIfNeeded");
  -[_UIRemoteViewController didMoveToParentViewController:](self->_remoteVC, "didMoveToParentViewController:", self);
  -[PKTransactionAuthenticationPasscodeViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[PKTransactionAuthenticationPasscodeViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
  remoteVC = self->_remoteVC;
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __77__PKTransactionAuthenticationPasscodeViewController__setRemoteVC_completion___block_invoke;
  v20[3] = &unk_1E3E63438;
  v13 = v8;
  v21 = v13;
  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](remoteVC, "serviceViewControllerProxyWithErrorHandler:", v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    passUniqueIdentifier = self->_passUniqueIdentifier;
    transactionIdentifier = self->_transactionIdentifier;
    archivedAnalyticsSessionToken = self->_archivedAnalyticsSessionToken;
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __77__PKTransactionAuthenticationPasscodeViewController__setRemoteVC_completion___block_invoke_3;
    v18[3] = &unk_1E3E614F0;
    v19 = v13;
    objc_msgSend(v14, "setPassUniqueIdentifier:transactionIdentifier:archivedAnalyticsSessionToken:completionHandler:", passUniqueIdentifier, transactionIdentifier, archivedAnalyticsSessionToken, v18);

  }
  else if (v13)
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

void __77__PKTransactionAuthenticationPasscodeViewController__setRemoteVC_completion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__PKTransactionAuthenticationPasscodeViewController__setRemoteVC_completion___block_invoke_2;
    block[3] = &unk_1E3E61590;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __77__PKTransactionAuthenticationPasscodeViewController__setRemoteVC_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__PKTransactionAuthenticationPasscodeViewController__setRemoteVC_completion___block_invoke_3(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  id v5;
  char v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __77__PKTransactionAuthenticationPasscodeViewController__setRemoteVC_completion___block_invoke_4;
    v4[3] = &unk_1E3E61A58;
    v5 = v2;
    v6 = a2;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

uint64_t __77__PKTransactionAuthenticationPasscodeViewController__setRemoteVC_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivedAnalyticsSessionToken, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteVC, 0);
  objc_storeStrong((id *)&self->_remoteVCRequest, 0);
}

@end
