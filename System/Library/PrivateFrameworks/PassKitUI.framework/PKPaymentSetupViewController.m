@implementation PKPaymentSetupViewController

+ (void)paymentSetupFeaturesForConfiguration:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  _QWORD block[4];
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD *v22;
  _QWORD v23[4];
  NSObject *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;

  v5 = a3;
  v6 = a4;
  v7 = dispatch_group_create();
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__0;
  v31[4] = __Block_byref_object_dispose__0;
  v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__0;
  v29[4] = __Block_byref_object_dispose__0;
  v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__0;
  v27[4] = __Block_byref_object_dispose__0;
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstanceWithRemoteLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_remoteLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    dispatch_group_enter(v7);
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __80__PKPaymentSetupViewController_paymentSetupFeaturesForConfiguration_completion___block_invoke;
    v23[3] = &unk_1E3E63398;
    v25 = v31;
    v26 = v29;
    v24 = v7;
    objc_msgSend(v9, "paymentSetupFeaturesForConfiguration:completion:", v5, v23);

  }
  dispatch_group_enter(v7);
  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __80__PKPaymentSetupViewController_paymentSetupFeaturesForConfiguration_completion___block_invoke_2;
  v20[3] = &unk_1E3E633C0;
  v22 = v27;
  v12 = v7;
  v21 = v12;
  objc_msgSend(v11, "paymentSetupFeaturesForConfiguration:completion:", v5, v20);

  dispatch_get_global_queue(0, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __80__PKPaymentSetupViewController_paymentSetupFeaturesForConfiguration_completion___block_invoke_3;
  block[3] = &unk_1E3E633E8;
  v16 = v6;
  v17 = v31;
  v18 = v29;
  v19 = v27;
  v14 = v6;
  dispatch_group_notify(v12, v13, block);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);

  _Block_object_dispose(v31, 8);
}

void __80__PKPaymentSetupViewController_paymentSetupFeaturesForConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v15, "identifiers", (_QWORD)v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKey:", v15, v16);
        else
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __80__PKPaymentSetupViewController_paymentSetupFeaturesForConfiguration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __80__PKPaymentSetupViewController_paymentSetupFeaturesForConfiguration_completion___block_invoke_3(_QWORD *a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "count")
    || objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "count"))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v3 = *(id *)(*(_QWORD *)(a1[7] + 8) + 40);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v36 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v8, "identifiers");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9
            && (objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "objectForKey:", v9),
                v10 = (void *)objc_claimAutoreleasedReturnValue(),
                v10,
                v10))
          {
            objc_msgSend(v8, "setSupportedDevices:", 3);
            objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "removeObjectForKey:", v9);
          }
          else
          {
            if (objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "containsObject:", v8))
            {
              objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "removeObject:", v8);
              v11 = v8;
              v12 = 3;
            }
            else
            {
              v11 = v8;
              v12 = 1;
            }
            objc_msgSend(v11, "setSupportedDevices:", v12);
          }
          objc_msgSend(v2, "addObject:", v8);

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v5);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          objc_msgSend(v18, "setSupportedDevices:", 2);
          objc_msgSend(v2, "addObject:", v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      }
      while (v15);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "allObjects", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v28;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * k);
          objc_msgSend(v24, "setSupportedDevices:", 2);
          objc_msgSend(v2, "addObject:", v24);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
      }
      while (v21);
    }

    v25 = a1[4];
    v26 = (void *)objc_msgSend(v2, "copy");
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  }
}

- (PKPaymentSetupViewController)initWithCoder:(id)a3
{

  return 0;
}

- (PKPaymentSetupViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (PKPaymentSetupViewController)initWithPaymentSetupRequest:(id)a3
{
  id v5;
  PKPaymentSetupViewController *v6;
  PKPaymentSetupViewController *v7;
  uint64_t v8;
  _UIAsyncInvocation *remoteVCRequest;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentSetupViewController;
  v6 = -[PKPaymentSetupViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_paymentSetupRequest, a3);
    v7->_explicitPresentationStyle = 0;
    objc_initWeak(&location, v7);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__PKPaymentSetupViewController_initWithPaymentSetupRequest___block_invoke;
    v11[3] = &unk_1E3E63410;
    objc_copyWeak(&v12, &location);
    +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](PKRemotePaymentSetupViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("PKServicePaymentSetupViewController"), CFSTR("com.apple.PassbookUIService"), v11);
    v8 = objc_claimAutoreleasedReturnValue();
    remoteVCRequest = v7->_remoteVCRequest;
    v7->_remoteVCRequest = (_UIAsyncInvocation *)v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __60__PKPaymentSetupViewController_initWithPaymentSetupRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = (void *)*((_QWORD *)WeakRetained + 123);
    *((_QWORD *)WeakRetained + 123) = 0;

    if (v5)
    {
      objc_msgSend(v8, "_setRemoteVC:completionHandler:", v5, 0);
    }
    else
    {
      if (v6)
      {
        v12 = *MEMORY[0x1E0CB3388];
        v13[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D682D8], 0, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "didFinishWithPasses:error:", 0, v11);

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
  v6.super_class = (Class)PKPaymentSetupViewController;
  -[PKPaymentSetupViewController dealloc](&v6, sel_dealloc);
}

- (void)_setRemoteVC:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  PKRemotePaymentSetupViewController *remoteVC;
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
  PKPaymentSetupRequest *paymentSetupRequest;
  _QWORD v23[4];
  id v24;
  void (**v25)(_QWORD);
  id v26;
  id location;
  _QWORD v28[4];
  id v29;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_remoteVC, a3);
  -[PKPaymentSetupViewController addChildViewController:](self, "addChildViewController:", self->_remoteVC);
  -[PKRemotePaymentSetupViewController view](self->_remoteVC, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v9);
  objc_msgSend(v10, "setNeedsLayout");
  objc_msgSend(v10, "layoutIfNeeded");
  objc_msgSend(v9, "setUserInteractionEnabled:", 0);
  -[_UIRemoteViewController didMoveToParentViewController:](self->_remoteVC, "didMoveToParentViewController:", self);
  -[PKPaymentSetupViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[PKPaymentSetupViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
  remoteVC = self->_remoteVC;
  v12 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __63__PKPaymentSetupViewController__setRemoteVC_completionHandler___block_invoke;
  v28[3] = &unk_1E3E63438;
  v13 = (void (**)(_QWORD))v8;
  v29 = v13;
  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](remoteVC, "serviceViewControllerProxyWithErrorHandler:", v28);
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

    objc_initWeak(&location, self);
    paymentSetupRequest = self->_paymentSetupRequest;
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __63__PKPaymentSetupViewController__setRemoteVC_completionHandler___block_invoke_3;
    v23[3] = &unk_1E3E61968;
    objc_copyWeak(&v26, &location);
    v25 = v13;
    v24 = v9;
    objc_msgSend(v14, "configureWithPaymentSetupRequest:completion:", paymentSetupRequest, v23);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
  else if (v13)
  {
    v13[2](v13);
  }

}

void __63__PKPaymentSetupViewController__setRemoteVC_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__PKPaymentSetupViewController__setRemoteVC_completionHandler___block_invoke_2;
    block[3] = &unk_1E3E61590;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __63__PKPaymentSetupViewController__setRemoteVC_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__PKPaymentSetupViewController__setRemoteVC_completionHandler___block_invoke_3(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKPaymentSetupViewController__setRemoteVC_completionHandler___block_invoke_4;
  block[3] = &unk_1E3E61478;
  objc_copyWeak(&v5, a1 + 6);
  v4 = a1[5];
  v3 = a1[4];
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v5);
}

void __63__PKPaymentSetupViewController__setRemoteVC_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "setUserInteractionEnabled:", 1);
    objc_msgSend(WeakRetained, "_hideLoadingContent");
  }
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();

}

- (void)setPresentationStyle:(int64_t)a3
{
  if (self->_presentationStyle != a3 || !self->_explicitPresentationStyle)
  {
    self->_presentationStyle = 2 * (a3 == 2);
    self->_explicitPresentationStyle = 1;
    -[PKPaymentSetupViewController updateModalPresentationStyle](self, "updateModalPresentationStyle");
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupViewController;
  -[PKPaymentSetupViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[PKPaymentSetupViewController updateModalPresentationStyle](self, "updateModalPresentationStyle");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupViewController;
  -[PKPaymentSetupViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v5, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  -[PKPaymentSetupViewController updateModalPresentationStyle](self, "updateModalPresentationStyle");
}

- (void)updateModalPresentationStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PKPaymentSetupViewController *v8;
  int64_t presentationStyle;
  id v10;

  -[PKPaymentSetupViewController view](self, "view");
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
      -[PKPaymentSetupViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", presentationStyle);
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
  PKRemotePaymentSetupViewController *remoteVC;

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
    v4.super_class = (Class)PKPaymentSetupViewController;
    -[PKPaymentSetupViewController sizeForChildContentContainer:withParentContainerSize:](&v4, sel_sizeForChildContentContainer_withParentContainerSize_, result.width, result.height);
  }
  return result;
}

- (void)loadView
{
  void *v3;
  void *v4;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *spinner;
  id v7;
  UILabel *v8;
  UILabel *loadingLabel;
  UILabel *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIButton *v18;
  UIButton *cancelButton;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id location;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PKPaymentSetupViewController;
  -[PKPaymentSetupViewController loadView](&v26, sel_loadView);
  -[PKPaymentSetupViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningBackgroundColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  spinner = self->_spinner;
  self->_spinner = v5;

  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
  objc_msgSend(v3, "addSubview:", self->_spinner);
  v7 = objc_alloc(MEMORY[0x1E0DC3990]);
  v8 = (UILabel *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  loadingLabel = self->_loadingLabel;
  self->_loadingLabel = v8;

  v10 = self->_loadingLabel;
  PKLocalizedString(CFSTR("LOADING"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v10, "setText:", v11);

  objc_msgSend(v3, "addSubview:", self->_loadingLabel);
  v12 = (void *)MEMORY[0x1E0DC3520];
  PKLocalizedString(CFSTR("CANCEL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pkui_plainConfigurationWithTitle:font:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v16 = (void *)MEMORY[0x1E0DC3428];
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __40__PKPaymentSetupViewController_loadView__block_invoke;
  v23 = &unk_1E3E62BD0;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v16, "actionWithHandler:", &v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v15, v17, v20, v21, v22, v23);
  v18 = (UIButton *)objc_claimAutoreleasedReturnValue();
  cancelButton = self->_cancelButton;
  self->_cancelButton = v18;

  -[UIButton setConfigurationUpdateHandler:](self->_cancelButton, "setConfigurationUpdateHandler:", &__block_literal_global_19);
  objc_msgSend(v3, "addSubview:", self->_cancelButton);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __40__PKPaymentSetupViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cancelTapped");

}

uint64_t __40__PKPaymentSetupViewController_loadView__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  objc_super v29;
  CGRect v30;

  v29.receiver = self;
  v29.super_class = (Class)PKPaymentSetupViewController;
  -[PKPaymentSetupViewController viewWillLayoutSubviews](&v29, sel_viewWillLayoutSubviews);
  -[PKPaymentSetupViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemotePaymentSetupViewController view](self->_remoteVC, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setFrame:");

  objc_msgSend(v3, "bounds");
  v6 = v5;
  v28 = v7;
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  objc_msgSend(v3, "center");
  UIRectCenteredAboutPoint();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:");
  -[UILabel sizeToFit](self->_loadingLabel, "sizeToFit");
  -[UILabel frame](self->_loadingLabel, "frame");
  UIRectCenteredXInRect();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v30.origin.x = v9;
  v30.origin.y = v11;
  v30.size.width = v13;
  v30.size.height = v15;
  -[UILabel setFrame:](self->_loadingLabel, "setFrame:", v17, CGRectGetMaxY(v30) + 10.0, v19, v21);
  -[UIButton sizeToFit](self->_cancelButton, "sizeToFit");
  -[UIButton frame](self->_cancelButton, "frame");
  v23 = v22;
  v25 = v24;
  v26 = -[PKPaymentSetupViewController modalPresentationStyle](self, "modalPresentationStyle");
  v27 = 50.0;
  if (v26)
    v27 = 10.0;
  -[UIButton setFrame:](self->_cancelButton, "setFrame:", v6 + 10.0, v28 + v27, v23, v25);

}

- (void)_hideLoadingContent
{
  -[UIButton removeFromSuperview](self->_cancelButton, "removeFromSuperview");
  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  -[UIActivityIndicatorView removeFromSuperview](self->_spinner, "removeFromSuperview");
  -[UILabel removeFromSuperview](self->_loadingLabel, "removeFromSuperview");
}

- (void)_cancelTapped
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D682D8], 1, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupViewController didFinishWithPasses:error:](self, "didFinishWithPasses:error:", 0, v3);

}

- (void)didFinishWithPasses:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  void *v10;
  id v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412546;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupViewController did finish with passes: %@ error: %@", (uint8_t *)&v18, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v13, "paymentSetupViewController:didFinishAddingPaymentPasses:error:", self, v6, v7);

    }
  }
  -[PKPaymentSetupViewController presentingViewController](self, "presentingViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    -[PKPaymentSetupViewController navigationController](self, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v16, "popViewControllerAnimated:", 1);

  }
}

- (PKPaymentSetupRequestViewControllerDelegate)delegate
{
  return (PKPaymentSetupRequestViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_remoteVCRequest, 0);
  objc_storeStrong((id *)&self->_paymentSetupRequest, 0);
  objc_storeStrong((id *)&self->_remoteVC, 0);
}

@end
