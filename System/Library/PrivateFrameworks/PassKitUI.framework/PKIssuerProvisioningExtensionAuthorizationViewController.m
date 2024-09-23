@implementation PKIssuerProvisioningExtensionAuthorizationViewController

- (PKIssuerProvisioningExtensionAuthorizationViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (PKIssuerProvisioningExtensionAuthorizationViewController)initWithExtension:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  PKIssuerProvisioningExtensionAuthorizationViewController *v9;
  void *v10;
  id completionHandler;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  PKIssuerProvisioningExtensionAuthorizationViewController *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  void (**v21)(void *, PKIssuerProvisioningExtensionAuthorizationViewController *, void *);
  PKIssuerProvisioningExtensionAuthorizationPlaceholderViewController *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void (**v26)(void *, PKIssuerProvisioningExtensionAuthorizationViewController *, void *);
  _QWORD v28[4];
  id v29;
  id v30;
  void (**v31)(void *, PKIssuerProvisioningExtensionAuthorizationViewController *, void *);
  _QWORD *v32;
  id v33;
  id location;
  _QWORD v35[5];
  _QWORD v36[3];
  char v37;
  _QWORD aBlock[4];
  id v39;
  objc_super v40;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    v40.receiver = self;
    v40.super_class = (Class)PKIssuerProvisioningExtensionAuthorizationViewController;
    v9 = -[PKIssuerProvisioningExtensionAuthorizationViewController initWithNibName:bundle:](&v40, sel_initWithNibName_bundle_, 0, 0);
    if (v9)
    {
      v10 = _Block_copy(v8);
      completionHandler = v9->_completionHandler;
      v9->_completionHandler = v10;

      objc_msgSend(v6, "_plugIn");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedContainingName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = v13;
      }
      else
      {
        objc_msgSend(v6, "_localizedName");
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v17 = v15;

      v18 = v17;
      v19 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke;
      aBlock[3] = &unk_1E3E6DF78;
      v20 = v18;
      v39 = v20;
      v21 = (void (**)(void *, PKIssuerProvisioningExtensionAuthorizationViewController *, void *))_Block_copy(aBlock);
      v22 = objc_alloc_init(PKIssuerProvisioningExtensionAuthorizationPlaceholderViewController);
      -[PKIssuerProvisioningExtensionAuthorizationPlaceholderViewController navigationItem](v22, "navigationItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, v9, v23);

      -[PKIssuerProvisioningExtensionAuthorizationViewController pushViewController:animated:](v9, "pushViewController:animated:", v22, 0);
      v36[0] = 0;
      v36[1] = v36;
      v36[2] = 0x2020000000;
      v37 = 0;
      v35[0] = v19;
      v35[1] = 3221225472;
      v35[2] = __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_2;
      v35[3] = &unk_1E3E6DFA0;
      v35[4] = v36;
      -[PKIssuerProvisioningExtensionAuthorizationViewController _beginDelayingPresentation:cancellationHandler:](v9, "_beginDelayingPresentation:cancellationHandler:", v35, 1.0);
      objc_initWeak(&location, v9);
      dispatch_get_global_queue(25, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      v28[0] = v19;
      v28[1] = 3221225472;
      v28[2] = __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_3;
      v28[3] = &unk_1E3E6E040;
      v29 = v6;
      v30 = v20;
      v25 = v20;
      objc_copyWeak(&v33, &location);
      v31 = v21;
      v32 = v36;
      v26 = v21;
      dispatch_async(v24, v28);

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
      _Block_object_dispose(v36, 8);

    }
    else if (v8)
    {
      v8[2](v8, 0, 0);
    }
    self = v9;
    v16 = self;
  }
  else
  {
    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    v16 = 0;
  }

  return v16;
}

void __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v5, "setTitle:", v4);
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v6, sel__cancel);

  objc_msgSend(v5, "setLeftBarButtonItem:", v7);
}

uint64_t __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return 1;
}

void __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD block[4];
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _QWORD v42[3];
  _QWORD v43[5];

  v43[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AE621C]();
  objc_msgSend(*(id *)(a1 + 32), "_plugIn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containingUrl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "path");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
    v9 = 0;
  }
  else
  {
    v28 = v2;
    v29 = a1;
    v27 = v4;
    v9 = v4;
    v10 = *MEMORY[0x1E0CB29D8];
    v42[0] = *MEMORY[0x1E0CB2A28];
    v42[1] = v10;
    v43[0] = CFSTR("com.apple.PassKit.issuer-provisioning.authorization");
    v43[1] = v6;
    v26 = v6;
    v42[2] = CFSTR("ENTITLEMENT:com.apple.developer.payment-pass-provisioning");
    v43[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35D8], "extensionsWithMatchingAttributes:error:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v12)
    {
      v13 = v12;
      v8 = 0;
      v14 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v38 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v16, "_plugIn");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "containingUrl");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = PKEqualObjects();

          if (v19)
          {
            v20 = v16;

            v8 = v20;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v13);
    }
    else
    {
      v8 = 0;
    }

    v2 = v28;
    a1 = v29;
    v6 = v26;
    v4 = v27;
  }

  objc_autoreleasePoolPop(v2);
  if (!v9)
    v9 = *(id *)(a1 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_4;
  block[3] = &unk_1E3E6E018;
  objc_copyWeak(&v36, (id *)(a1 + 64));
  v21 = *(id *)(a1 + 48);
  v22 = *(_QWORD *)(a1 + 56);
  v34 = v21;
  v35 = v22;
  v31 = *(id *)(a1 + 40);
  v32 = v8;
  v33 = v9;
  v23 = v9;
  v24 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v36);
}

void __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD aBlock[4];
  id v16;
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v4 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_5;
    aBlock[3] = &unk_1E3E6DFC8;
    v5 = *(id *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 64);
    v17 = v5;
    v18 = v6;
    v16 = *(id *)(a1 + 32);
    v7 = _Block_copy(aBlock);
    v8 = *(void **)(a1 + 40);
    if (v8)
    {
      v11[0] = v4;
      v11[1] = 3221225472;
      v11[2] = __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_6;
      v11[3] = &unk_1E3E6DFF0;
      objc_copyWeak(&v14, v2);
      v13 = v7;
      v12 = *(id *)(a1 + 48);
      objc_msgSend(v8, "instantiateViewControllerWithInputItems:connectionHandler:", 0, v11);

      objc_destroyWeak(&v14);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        v20 = v10;
        _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "PKIssuerProvisioningExtensionAuthorizationViewController: failed to find matching authorization UI extension for %@.", buf, 0xCu);
      }

      (*((void (**)(void *, id, _QWORD))v7 + 2))(v7, WeakRetained, 0);
    }

  }
}

void __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_5(_QWORD *a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = a1[5];
    v6 = a3;
    v7 = a2;
    objc_msgSend(v6, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id *, void *))(v5 + 16))(v5, v7, v8);

    objc_msgSend(v7[177], "reportViewAppeared");
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);

    objc_msgSend(v7, "setViewControllers:animated:", v9, v10);
    objc_msgSend(v7, "_endDelayingPresentation");
  }
  else
  {
    v11 = a2;
    objc_msgSend(v11, "_endDelayingPresentation");
    objc_msgSend(v11, "_failWithApplicationName:", a1[4]);
  }

}

void __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v8 && !v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_7;
      v13[3] = &unk_1E3E61C58;
      objc_copyWeak(&v14, (id *)(a1 + 48));
      objc_msgSend(v8, "pkui_setCompletionHandler:", v13);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      objc_destroyWeak(&v14);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v16 = v12;
        _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "PKIssuerProvisioningExtensionAuthorizationViewController: failed to materialize authorization UI extension for %@.", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }

}

void __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_7(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invokeCompletionWithAuthorized:", a2);

}

- (void)dealloc
{
  id completionHandler;
  void *v4;
  id v5;
  objc_super v6;
  _QWORD block[4];
  id v8;

  completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    v4 = _Block_copy(completionHandler);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__PKIssuerProvisioningExtensionAuthorizationViewController_dealloc__block_invoke;
    block[3] = &unk_1E3E61590;
    v8 = v4;
    v5 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  v6.receiver = self;
  v6.super_class = (Class)PKIssuerProvisioningExtensionAuthorizationViewController;
  -[PKIssuerProvisioningExtensionAuthorizationViewController dealloc](&v6, sel_dealloc);
}

uint64_t __67__PKIssuerProvisioningExtensionAuthorizationViewController_dealloc__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

- (void)_invokeCompletionWithAuthorized:(BOOL)a3
{
  _BOOL8 v3;
  void (**completionHandler)(id, PKIssuerProvisioningExtensionAuthorizationViewController *, _BOOL8);
  id v6;

  v3 = a3;
  -[PKProvisioningAnalyticsSessionUIReporter reportPageCompleted:context:](self->_reporter, "reportPageCompleted:context:", a3, 0);
  completionHandler = (void (**)(id, PKIssuerProvisioningExtensionAuthorizationViewController *, _BOOL8))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, self, v3);
    v6 = self->_completionHandler;
    self->_completionHandler = 0;

  }
}

- (void)_cancel
{
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 2);
  -[PKIssuerProvisioningExtensionAuthorizationViewController _invokeCompletionWithAuthorized:](self, "_invokeCompletionWithAuthorized:", 0);
}

- (void)_failWithApplicationName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  PKLocalizedPaymentString(CFSTR("PROVISIONING_EXTENSION_GENERIC_ERROR_MESSAGE"), CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedPaymentString(CFSTR("PROVISIONING_EXTENSION_GENERIC_ERROR_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v5, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__PKIssuerProvisioningExtensionAuthorizationViewController__failWithApplicationName___block_invoke;
  v12[3] = &unk_1E3E63F88;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v11);

  -[PKIssuerProvisioningExtensionAuthorizationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __85__PKIssuerProvisioningExtensionAuthorizationViewController__failWithApplicationName___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invokeCompletionWithAuthorized:", 0);

}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_reporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
