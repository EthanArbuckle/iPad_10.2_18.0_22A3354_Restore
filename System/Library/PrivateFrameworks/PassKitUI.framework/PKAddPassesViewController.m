@implementation PKAddPassesViewController

+ (BOOL)canAddPasses
{
  void *v2;
  char v3;
  int has_internal_ui;
  char v5;
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!PKIsPad())
  {
    has_internal_ui = os_variant_has_internal_ui();
    v5 = objc_msgSend(v2, "isPassbookVisible");
    if (has_internal_ui)
    {
      if ((v5 & 1) == 0 && (objc_msgSend(v2, "passbookHasBeenDeleted") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bundleIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6AB40]);

        goto LABEL_13;
      }
    }
    else if ((v5 & 1) == 0)
    {
      v3 = objc_msgSend(v2, "passbookHasBeenDeleted");
      goto LABEL_12;
    }
    v8 = 1;
    goto LABEL_13;
  }
  if (_os_feature_enabled_impl())
  {
    v3 = objc_msgSend(v2, "iPadSupportsPasses");
LABEL_12:
    v8 = v3;
    goto LABEL_13;
  }
  v8 = 0;
LABEL_13:

  return v8;
}

- (PKAddPassesViewController)initWithPass:(PKPass *)pass
{
  void *v4;
  PKPass *v5;
  void *v6;
  PKAddPassesViewController *v7;
  PKPass *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (pass)
  {
    v9 = pass;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = pass;
    objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[PKAddPassesViewController initWithPasses:](self, "initWithPasses:", v6, v9, v10);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PKAddPassesViewController)initWithPasses:(NSArray *)passes
{
  return -[PKAddPassesViewController initWithPasses:fromPresentationSource:](self, "initWithPasses:fromPresentationSource:", passes, 0);
}

- (PKAddPassesViewController)initWithPasses:(id)a3 fromPresentationSource:(unint64_t)a4
{
  id v6;
  PKAddPassesViewController *v7;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    self = (PKAddPassesViewController *)-[PKAddPassesViewController _initWithPasses:orPassesContainer:orIssuerData:withSignature:fromPresentationSource:error:](self, "_initWithPasses:orPassesContainer:orIssuerData:withSignature:fromPresentationSource:error:", v6, 0, 0, 0, a4, 0);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PKAddPassesViewController)initWithPassesContainer:(id)a3 fromPresentationSource:(unint64_t)a4
{
  PKAddPassesViewController *v4;

  if (a3)
  {
    self = (PKAddPassesViewController *)-[PKAddPassesViewController _initWithPasses:orPassesContainer:orIssuerData:withSignature:fromPresentationSource:error:](self, "_initWithPasses:orPassesContainer:orIssuerData:withSignature:fromPresentationSource:error:", 0, a3, 0, 0, a4, 0);
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (PKAddPassesViewController)initWithIssuerData:(NSData *)issuerData signature:(NSData *)signature error:(NSError *)error
{
  PKAddPassesViewController *v5;

  v5 = 0;
  if (issuerData && signature)
  {
    self = (PKAddPassesViewController *)-[PKAddPassesViewController _initWithPasses:orPassesContainer:orIssuerData:withSignature:fromPresentationSource:error:](self, "_initWithPasses:orPassesContainer:orIssuerData:withSignature:fromPresentationSource:error:", 0, 0, issuerData, signature, 0, error);
    v5 = self;
  }

  return v5;
}

- (id)_initWithPasses:(id)a3 orPassesContainer:(id)a4 orIssuerData:(id)a5 withSignature:(id)a6 fromPresentationSource:(unint64_t)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  PKAddPassesViewController *v18;
  void *v19;
  void *v20;
  id v21;
  NSArray *v22;
  NSArray *passes;
  NSData *v24;
  NSData *signature;
  NSData *v26;
  NSData *issuerData;
  void *v28;
  int v29;
  NSObject *v30;
  PKCancelingAnimatedTransitioningHandler *v31;
  PKCancelingAnimatedTransitioningHandler *animatedTransitionHandler;
  PKCancelingAnimatedTransitioningHandler *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  PKAddPassesViewController *v38;
  _QWORD v40[4];
  id v41;
  id buf[2];
  _QWORD v43[4];
  id v44;
  const __CFString *v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (!+[PKAddPassesViewController canAddPasses](PKAddPassesViewController, "canAddPasses"))
    goto LABEL_17;
  v18 = -[PKAddPassesViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  self = v18;
  if (v18)
  {
    v18->_presentationSource = a7;
    if (v15)
    {
      objc_storeStrong((id *)&v18->_passesContainer, a4);
LABEL_8:
      -[PKAddPassesViewController _aquireAssertions](self, "_aquireAssertions");
      objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "passbookHasBeenDeleted");

      if (v29)
      {
        PKLogFacilityTypeGetObject();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_19D178000, v30, OS_LOG_TYPE_DEFAULT, "Wallet deleted, prompting user to re-install Wallet", (uint8_t *)buf, 2u);
        }

        -[PKAddPassesViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 4);
        -[PKAddPassesViewController setTransitioningDelegate:](self, "setTransitioningDelegate:", self);
        objc_initWeak(buf, self);
        v31 = objc_alloc_init(PKCancelingAnimatedTransitioningHandler);
        animatedTransitionHandler = self->_animatedTransitionHandler;
        self->_animatedTransitionHandler = v31;

        v33 = self->_animatedTransitionHandler;
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __119__PKAddPassesViewController__initWithPasses_orPassesContainer_orIssuerData_withSignature_fromPresentationSource_error___block_invoke_78;
        v40[3] = &unk_1E3E62638;
        objc_copyWeak(&v41, buf);
        -[PKCancelingAnimatedTransitioningHandler setCancelationHandler:](v33, "setCancelationHandler:", v40);
        objc_destroyWeak(&v41);
        objc_destroyWeak(buf);
      }
      else
      {
        -[PKAddPassesViewController _requestRemoteViewController](self, "_requestRemoteViewController");
      }
      v45 = CFSTR("bundle");
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "PKSanitizedBundleIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D682E0], v36);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addObserver:selector:name:object:", self, sel_applicationWillResignActive_, *MEMORY[0x1E0DC4868], 0);
      objc_msgSend(v37, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive_, *MEMORY[0x1E0DC4750], 0);

      goto LABEL_14;
    }
    if (v14)
    {
      v19 = (void *)MEMORY[0x1A1AE621C]();
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __119__PKAddPassesViewController__initWithPasses_orPassesContainer_orIssuerData_withSignature_fromPresentationSource_error___block_invoke;
      v43[3] = &unk_1E3E63A28;
      v44 = v20;
      v21 = v20;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v43);
      v22 = (NSArray *)objc_msgSend(v21, "copy");
      passes = self->_passes;
      self->_passes = v22;

      objc_autoreleasePoolPop(v19);
      goto LABEL_8;
    }
    v24 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedData:options:", v17, 0);
    signature = self->_signature;
    self->_signature = v24;

    v26 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedData:options:", v16, 0);
    issuerData = self->_issuerData;
    self->_issuerData = v26;

    if ((PKValidateIssuerBindingData() & 1) != 0)
      goto LABEL_8;
    if (a8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6A758], 3, 0);
      v38 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_17:
    v38 = 0;
    goto LABEL_18;
  }
LABEL_14:
  self = self;
  v38 = self;
LABEL_18:

  return v38;
}

void __119__PKAddPassesViewController__initWithPasses_orPassesContainer_orIssuerData_withSignature_fromPresentationSource_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "archiveData");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __119__PKAddPassesViewController__initWithPasses_orPassesContainer_orIssuerData_withSignature_fromPresentationSource_error___block_invoke_78(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleCanceledPresentationWithPresentingViewController:", v3);

}

- (void)dealloc
{
  void *v3;
  id v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[PKAssertion invalidate](self->_contactlessInterfaceAssertion, "invalidate");
  v4 = (id)-[_UIAsyncInvocation invoke](self->_viewServiceCancelRequest, "invoke");
  -[PKRemoteAddPassesViewController setDelegate:](self->_remoteViewController, "setDelegate:", 0);
  v5.receiver = self;
  v5.super_class = (Class)PKAddPassesViewController;
  -[PKAddPassesViewController dealloc](&v5, sel_dealloc);
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v3;

  -[_UIRemoteViewController serviceViewControllerProxy](self->_remoteViewController, "serviceViewControllerProxy", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "evaluateBrightness");

}

- (void)applicationWillResignActive:(id)a3
{
  id v3;

  -[_UIRemoteViewController serviceViewControllerProxy](self->_remoteViewController, "serviceViewControllerProxy", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetBrightness");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKAddPassesViewController;
  -[PKAddPassesViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  if (self->_animatedTransitionHandler)
  {
    -[PKAddPassesViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAddPassesViewController _handleCanceledPresentationWithPresentingViewController:](self, "_handleCanceledPresentationWithPresentingViewController:", v4);

  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__PKAddPassesViewController_viewDidAppear___block_invoke;
    v5[3] = &unk_1E3E612E8;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v5, 0, 0.4, 0.1);
  }
}

void __43__PKAddPassesViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v1);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAddPassesViewController;
  -[PKAddPassesViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKAddPassesViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemoteAddPassesViewController view](self->_remoteViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (int64_t)modalTransitionStyle
{
  return 0;
}

- (int64_t)modalPresentationStyle
{
  if (PKIsPad())
    return 16;
  else
    return 0;
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 450.0;
  v3 = 700.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  PKRemoteAddPassesViewController *remoteViewController;

  remoteViewController = self->_remoteViewController;
  if (remoteViewController)
    return -[_UIRemoteViewController supportedInterfaceOrientations](remoteViewController, "supportedInterfaceOrientations");
  else
    return 2;
}

- (BOOL)prefersStatusBarHidden
{
  PKRemoteAddPassesViewController *remoteViewController;

  remoteViewController = self->_remoteViewController;
  if (remoteViewController)
    LOBYTE(remoteViewController) = -[PKRemoteAddPassesViewController prefersStatusBarHidden](remoteViewController, "prefersStatusBarHidden");
  return (char)remoteViewController;
}

- (int64_t)preferredStatusBarStyle
{
  int64_t result;

  result = (int64_t)self->_remoteViewController;
  if (result)
    return objc_msgSend((id)result, "preferredStatusBarStyle");
  return result;
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_remoteViewController;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_remoteViewController;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)result
{
  objc_super v4;

  if (self->_remoteViewController != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)PKAddPassesViewController;
    -[PKAddPassesViewController sizeForChildContentContainer:withParentContainerSize:](&v4, sel_sizeForChildContentContainer_withParentContainerSize_, result.width, result.height);
  }
  return result;
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (void)_requestRemoteViewController
{
  _UIAsyncInvocation *viewServiceCancelRequest;
  id v4;
  _UIAsyncInvocation *v5;
  void *v6;
  _UIAsyncInvocation *v7;
  _UIAsyncInvocation *v8;
  _QWORD aBlock[5];

  viewServiceCancelRequest = self->_viewServiceCancelRequest;
  if (viewServiceCancelRequest)
  {
    v4 = (id)-[_UIAsyncInvocation invoke](viewServiceCancelRequest, "invoke");
    v5 = self->_viewServiceCancelRequest;
    self->_viewServiceCancelRequest = 0;

  }
  -[PKAddPassesViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", 0, 10.0);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__PKAddPassesViewController__requestRemoteViewController__block_invoke;
  aBlock[3] = &unk_1E3E63A50;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](PKRemoteAddPassesViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("PKServiceAddPassesViewController"), CFSTR("com.apple.PassbookUIService"), v6);
  v7 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  v8 = self->_viewServiceCancelRequest;
  self->_viewServiceCancelRequest = v7;

}

void __57__PKAddPassesViewController__requestRemoteViewController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 976);
  *(_QWORD *)(v7 + 976) = 0;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_applyRemoteViewController:", v5);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543362;
      v15 = v6;
      _os_log_error_impl(&dword_19D178000, v9, OS_LOG_TYPE_ERROR, "Connection to PassbookUIService failed: %{public}@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_endDelayingPresentation");
    objc_msgSend(*(id *)(a1 + 32), "_ingestionDidFinishWithResult:", 0);
  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 1024);
  *(_QWORD *)(v10 + 1024) = 0;

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 1048);
  *(_QWORD *)(v12 + 1048) = 0;

}

- (void)_applyRemoteViewController:(id)a3
{
  PKRemoteAddPassesViewController *v4;
  _UIAsyncInvocation *viewServiceCancelRequest;
  id v6;
  _UIAsyncInvocation *v7;
  PKRemoteAddPassesViewController *remoteViewController;
  PKRemoteAddPassesViewController *v9;
  void *v10;
  void *v11;
  PKRemoteAddPassesViewController *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;

  v4 = (PKRemoteAddPassesViewController *)a3;
  viewServiceCancelRequest = self->_viewServiceCancelRequest;
  if (viewServiceCancelRequest)
  {
    v6 = (id)-[_UIAsyncInvocation invoke](viewServiceCancelRequest, "invoke");
    v7 = self->_viewServiceCancelRequest;
    self->_viewServiceCancelRequest = 0;

  }
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = v4;
  v9 = v4;

  -[PKRemoteAddPassesViewController view](self->_remoteViewController, "view");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[PKAddPassesViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAddPassesViewController addChildViewController:](self, "addChildViewController:", self->_remoteViewController);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v11);

  objc_msgSend(v10, "addSubview:", v23);
  objc_msgSend(v10, "setNeedsLayout");
  objc_msgSend(v10, "layoutIfNeeded");
  -[_UIRemoteViewController didMoveToParentViewController:](self->_remoteViewController, "didMoveToParentViewController:", self);
  v12 = self->_remoteViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[PKRemoteAddPassesViewController setDelegate:](v12, "setDelegate:", WeakRetained);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRemoteViewController serviceViewControllerProxy](v9, "serviceViewControllerProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fixedCoordinateSpace");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  objc_msgSend(v14, "scale");
  objc_msgSend(v15, "setDisplayPropertiesWithScreenSize:scale:", v18, v20, v21);

  -[_UIRemoteViewController serviceViewControllerProxy](v9, "serviceViewControllerProxy");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ingestPasses:orPassesContainer:orIssuerData:withSignature:fromPresentationSource:", self->_passes, self->_passesContainer, self->_issuerData, self->_signature, self->_presentationSource);

  -[PKAddPassesViewController _endDelayingPresentation](self, "_endDelayingPresentation");
  -[PKAddPassesViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[PKAddPassesViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");

}

- (void)_ingestionDidFinishWithResult:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void **v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[PKAddPassesViewController delegate](self, "delegate");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (a3 == 1)
    self->_succeeded = 1;
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "addPassesViewControllerDidFinish:", self);
  }
  else
  {
    -[PKAddPassesViewController presentingViewController](self, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[PKAddPassesViewController presentingViewController](self, "presentingViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);
    }
    else
    {
      -[PKAddPassesViewController navigationController](self, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v9, "popViewControllerAnimated:", 1);
    }

  }
  v11 = (void **)MEMORY[0x1E0D682F0];
  if (a3 != 1)
    v11 = (void **)MEMORY[0x1E0D682E8];
  v12 = *v11;
  v18 = CFSTR("bundle");
  v13 = (void *)MEMORY[0x1E0CB34D0];
  v14 = v12;
  objc_msgSend(v13, "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "PKSanitizedBundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1A1AE3A74](v14, v17);

}

- (void)setDelegate:(id)delegate
{
  if (self->_remoteViewController)
    -[PKRemoteAddPassesViewController setDelegate:](self->_remoteViewController, "setDelegate:", delegate);
  else
    objc_storeWeak((id *)&self->_delegate, delegate);
}

- (id)delegate
{
  void *WeakRetained;

  if (self->_remoteViewController)
  {
    -[PKRemoteAddPassesViewController delegate](self->_remoteViewController, "delegate");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  return WeakRetained;
}

- (void)_handleCanceledPresentationWithPresentingViewController:(id)a3
{
  PKCancelingAnimatedTransitioningHandler *animatedTransitionHandler;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[5];

  animatedTransitionHandler = self->_animatedTransitionHandler;
  self->_animatedTransitionHandler = 0;
  v5 = a3;

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PKAddPassesViewController__handleCanceledPresentationWithPresentingViewController___block_invoke;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = self;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__PKAddPassesViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_2;
  v15[3] = &unk_1E3E61590;
  v7 = _Block_copy(aBlock);
  v16 = v7;
  v8 = PKCreateAlertControllerForWalletUninstalled(v15);
  objc_msgSend(v5, "pkui_frontMostViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __85__PKAddPassesViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_4;
  v12[3] = &unk_1E3E61850;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v9, "presentViewController:animated:completion:", v11, 1, v12);

}

uint64_t __85__PKAddPassesViewController__handleCanceledPresentationWithPresentingViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ingestionDidFinishWithResult:", 0);
}

void __85__PKAddPassesViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PKAddPassesViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_3;
  block[3] = &unk_1E3E61590;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

uint64_t __85__PKAddPassesViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __85__PKAddPassesViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_4(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Failed to present download wallet alert!", v4, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)_aquireAssertions
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__PKAddPassesViewController__aquireAssertions__block_invoke;
  v2[3] = &unk_1E3E63A78;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0D66B80], "acquireAssertionOfType:withReason:completion:", 0, CFSTR("Add Passes View Controller"), v2);
}

void __46__PKAddPassesViewController__aquireAssertions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PKAddPassesViewController__aquireAssertions__block_invoke_2;
  block[3] = &unk_1E3E61400;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v7;
  v13 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __46__PKAddPassesViewController__aquireAssertions__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 992), v2);
    objc_initWeak(location, *(id *)(a1 + 32));
    v3 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__PKAddPassesViewController__aquireAssertions__block_invoke_3;
    v6[3] = &unk_1E3E61310;
    objc_copyWeak(&v7, location);
    objc_msgSend(v3, "setInvalidationHandler:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(location);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 48);
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v5;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Error Acquiring Assertion for Add Passes View Controller: %@", (uint8_t *)location, 0xCu);
    }

  }
}

void __46__PKAddPassesViewController__aquireAssertions__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = 138412290;
    v5 = WeakRetained;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Assertion Invalidated: %@", (uint8_t *)&v4, 0xCu);

  }
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return self->_animatedTransitionHandler;
}

- (id)interactionControllerForPresentation:(id)a3
{
  return self->_animatedTransitionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passesContainer, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_issuerData, 0);
  objc_storeStrong((id *)&self->_passes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_animatedTransitionHandler, 0);
  objc_storeStrong((id *)&self->_contactlessInterfaceAssertion, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_viewServiceCancelRequest, 0);
}

@end
