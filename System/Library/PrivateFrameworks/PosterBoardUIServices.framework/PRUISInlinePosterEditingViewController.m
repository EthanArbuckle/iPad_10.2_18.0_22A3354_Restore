@implementation PRUISInlinePosterEditingViewController

- (PRUISInlinePosterEditingViewController)initWithEntryPoint:(id)a3
{
  id v5;
  PRUISInlinePosterEditingViewController *v6;
  PRUISInlinePosterEditingViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRUISInlinePosterEditingViewController;
  v6 = -[PRUISInlinePosterEditingViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_entryPoint, a3);

  return v7;
}

- (void)setDisplayConfiguration:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[FBSDisplayConfiguration isEqual:](self->_displayConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayConfiguration, a3);
    -[PRUISModalRemoteViewController setDisplayConfiguration:](self->_fallbackViewController, "setDisplayConfiguration:", v5);
  }

}

- (void)_getEditingViewControllerIfPossible
{
  uint64_t v3;
  void (**v4)(_QWORD);
  void *v5;
  int v6;
  PRUISExternallyHostedPosterEditingService *v7;
  PRUISExternallyHostedPosterEditingRequest *v8;
  PRUISExternallyHostedPosterEditingRequest *remoteEditingRequest;
  PRUISExternallyHostedPosterEditingRequest *v10;
  void (**v11)(_QWORD);
  PRUISExternallyHostedPosterEditingService *v12;
  dispatch_time_t v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  id v16;
  _QWORD v17[4];
  PRUISExternallyHostedPosterEditingService *v18;
  PRUISInlinePosterEditingViewController *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  BSDispatchQueueAssertMain();
  if (!-[PRUISInlinePosterEditingViewController _isPresentingRemoteOrLocalEditingUI](self, "_isPresentingRemoteOrLocalEditingUI"))
  {
    objc_initWeak(&location, self);
    v3 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke;
    v22[3] = &unk_251534E38;
    objc_copyWeak(&v23, &location);
    v4 = (void (**)(_QWORD))MEMORY[0x249513F24](v22);
    if (+[PRUISExternallyHostedPosterEditingService isExternalEditingSupported](PRUISExternallyHostedPosterEditingService, "isExternalEditingSupported")&& (objc_msgSend(MEMORY[0x24BE0BE88], "processHandle"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "hasEntitlement:", CFSTR("com.apple.posterboardui.externalEditing")), v5, v6))
    {
      v7 = objc_alloc_init(PRUISExternallyHostedPosterEditingService);
      -[PRUISExternallyHostedPosterEditingService setDelegate:](v7, "setDelegate:", self);
      +[PRUISExternallyHostedPosterEditingService editingRequestForEntryPoint:](PRUISExternallyHostedPosterEditingService, "editingRequestForEntryPoint:", self->_entryPoint);
      v8 = (PRUISExternallyHostedPosterEditingRequest *)objc_claimAutoreleasedReturnValue();
      remoteEditingRequest = self->_remoteEditingRequest;
      self->_remoteEditingRequest = v8;

      v10 = self->_remoteEditingRequest;
      v17[0] = v3;
      v17[1] = 3221225472;
      v17[2] = __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke_2;
      v17[3] = &unk_251535798;
      objc_copyWeak(&v21, &location);
      v11 = v4;
      v20 = v11;
      v12 = v7;
      v18 = v12;
      v19 = self;
      -[PRUISExternallyHostedPosterEditingService beginEditingWithRequest:completion:](v12, "beginEditingWithRequest:completion:", v10, v17);
      v13 = dispatch_time(0, 3000000000);
      v14[0] = v3;
      v14[1] = 3221225472;
      v14[2] = __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke_5;
      v14[3] = &unk_2515357C0;
      objc_copyWeak(&v16, &location);
      v15 = v11;
      dispatch_after(v13, MEMORY[0x24BDAC9B8], v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&v21);

    }
    else
    {
      v4[2](v4);
    }

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

void __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke(uint64_t a1)
{
  PRUISModalRemoteViewController *v1;
  void *v2;
  void *v3;
  PRUISModalRemoteViewController *v4;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = -[PRUISModalRemoteViewController initWithEntryPoint:]([PRUISModalRemoteViewController alloc], "initWithEntryPoint:", WeakRetained[121]);
    -[PRUISModalRemoteViewController setDelegate:](v1, "setDelegate:", WeakRetained);
    objc_msgSend(WeakRetained, "displayConfiguration");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRUISModalRemoteViewController setDisplayConfiguration:](v1, "setDisplayConfiguration:", v2);

    v3 = (void *)WeakRetained[124];
    WeakRetained[124] = v1;
    v4 = v1;

    objc_msgSend(WeakRetained, "bs_addChildViewController:animated:transitionBlock:", v4, 1, 0);
  }

}

void __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke_2(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  id v6;
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v7 = a1[6];
  v6 = a1[4];
  v5 = v3;
  BSDispatchMain();

}

void __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke_3(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  uint64_t v4;
  PRUISInlinePosterEditingPlaceholderViewController *v5;

  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    PRUISLogRemoteEditing();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke_3_cold_1(v2, v3);

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      objc_storeStrong((id *)(v4 + 984), *(id *)(a1 + 48));
      v5 = objc_alloc_init(PRUISInlinePosterEditingPlaceholderViewController);
      -[PRUISInlinePosterEditingPlaceholderViewController setDelegate:](v5, "setDelegate:", *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 40), "bs_addChildViewController:animated:transitionBlock:", v5, 1, 0);

    }
  }
}

void __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "_isPresentingRemoteOrLocalEditingUI") & 1) == 0)
  {
    PRUISLogRemoteEditing();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke_5_cold_1(v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRUISInlinePosterEditingViewController;
  -[PRUISInlinePosterEditingViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PRUISInlinePosterEditingViewController _getEditingViewControllerIfPossible](self, "_getEditingViewControllerIfPossible");
}

- (void)sendRequestDismissalAction
{
  PRUISModalRemoteViewController *fallbackViewController;

  if (self->_remoteEditingService)
  {
    -[PRUISExternallyHostedPosterEditingService sendRequestDismissalActionWithRequest:](self->_remoteEditingService, "sendRequestDismissalActionWithRequest:", self->_remoteEditingRequest);
  }
  else
  {
    fallbackViewController = self->_fallbackViewController;
    if (fallbackViewController)
      -[PRUISModalRemoteViewController sendRequestDismissalAction](fallbackViewController, "sendRequestDismissalAction");
  }
}

- (BOOL)prefersStatusBarHidden
{
  objc_super v3;

  if (self->_fallbackViewController)
    return -[PRUISModalRemoteViewController prefersStatusBarHidden](self->_fallbackViewController, "prefersStatusBarHidden");
  v3.receiver = self;
  v3.super_class = (Class)PRUISInlinePosterEditingViewController;
  return -[PRUISInlinePosterEditingViewController prefersStatusBarHidden](&v3, sel_prefersStatusBarHidden);
}

- (int64_t)preferredStatusBarStyle
{
  objc_super v3;

  if (self->_fallbackViewController)
    return -[PRUISModalRemoteViewController preferredStatusBarStyle](self->_fallbackViewController, "preferredStatusBarStyle");
  v3.receiver = self;
  v3.super_class = (Class)PRUISInlinePosterEditingViewController;
  return -[PRUISInlinePosterEditingViewController preferredStatusBarStyle](&v3, sel_preferredStatusBarStyle);
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  objc_super v3;

  if (self->_fallbackViewController)
    return -[PRUISModalRemoteViewController preferredStatusBarUpdateAnimation](self->_fallbackViewController, "preferredStatusBarUpdateAnimation");
  v3.receiver = self;
  v3.super_class = (Class)PRUISInlinePosterEditingViewController;
  return -[PRUISInlinePosterEditingViewController preferredStatusBarUpdateAnimation](&v3, sel_preferredStatusBarUpdateAnimation);
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_super v3;

  if (self->_fallbackViewController)
    return -[PRUISModalRemoteViewController supportedInterfaceOrientations](self->_fallbackViewController, "supportedInterfaceOrientations");
  v3.receiver = self;
  v3.super_class = (Class)PRUISInlinePosterEditingViewController;
  return -[PRUISInlinePosterEditingViewController supportedInterfaceOrientations](&v3, sel_supportedInterfaceOrientations);
}

- (void)modalRemoteViewController:(id)a3 willDismissWithResponse:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = v7;
  if (self->_fallbackViewController != a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRUISInlinePosterEditingViewController.m"), 157, CFSTR("should be our view controller!"));

    v7 = v9;
  }
  -[PRUISInlinePosterEditingViewController _shared_willDismissWithResponse:](self, "_shared_willDismissWithResponse:", v7);

}

- (void)modalRemoteViewController:(id)a3 didDismissWithResponse:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = v7;
  if (self->_fallbackViewController != a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRUISInlinePosterEditingViewController.m"), 162, CFSTR("should be our view controller!"));

    v7 = v9;
  }
  -[PRUISInlinePosterEditingViewController _shared_didDismissWithResponse:](self, "_shared_didDismissWithResponse:", v7);

}

- (void)_shared_willDismissWithResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  BSDispatchQueueAssertMain();
  -[PRUISInlinePosterEditingViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "inlineEditingViewController:willDismissWithResponse:", self, v5);

}

- (void)_shared_didDismissWithResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  BSDispatchQueueAssertMain();
  -[PRUISInlinePosterEditingViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "inlineEditingViewController:didDismissWithResponse:", self, v5);
  -[PRUISExternallyHostedPosterEditingService invalidate](self->_remoteEditingService, "invalidate");

}

- (BOOL)_isPresentingRemoteOrLocalEditingUI
{
  return self->_remoteEditingService || self->_fallbackViewController != 0;
}

- (PRUISInlinePosterEditingViewControllerDelegate)delegate
{
  return (PRUISInlinePosterEditingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fallbackViewController, 0);
  objc_storeStrong((id *)&self->_remoteEditingService, 0);
  objc_storeStrong((id *)&self->_remoteEditingRequest, 0);
  objc_storeStrong((id *)&self->_entryPoint, 0);
}

void __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke_3_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_2445ED000, a2, OS_LOG_TYPE_ERROR, "Failed to load remote editing service, falling back to local. Error: %@", (uint8_t *)&v3, 0xCu);
}

void __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke_5_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2445ED000, log, OS_LOG_TYPE_ERROR, "Remote editing service appears to have timed out, falling back to local.", v1, 2u);
}

@end
