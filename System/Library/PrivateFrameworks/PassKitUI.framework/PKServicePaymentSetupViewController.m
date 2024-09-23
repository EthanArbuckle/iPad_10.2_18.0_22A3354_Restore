@implementation PKServicePaymentSetupViewController

- (unint64_t)supportedInterfaceOrientations
{
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    return 30;
  }
  else
  {
    return 2;
  }
}

- (void)setDisplayPropertiesWithScreenSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height;
  CGFloat width;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  double v12;
  uint64_t v13;
  CGSize v14;

  height = a3.height;
  width = a3.width;
  v13 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14.width = width;
    v14.height = height;
    NSStringFromCGSize(v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2048;
    v12 = a4;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Setting display properties with screenSize=%{public}@ scale=%.f", (uint8_t *)&v9, 0x16u);

  }
  PKSetDisplayProperties();
}

- (void)configureWithPaymentSetupRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  __SecTask *v8;
  __SecTask *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  PKPaymentProvisioningController *v15;
  PKPaymentProvisioningController *provisioningController;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  PKPaymentProvisioningController *v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint64_t v30;
  _QWORD aBlock[5];
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  audit_token_t token;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PKServicePaymentSetupViewController _hostAuditToken](self, "_hostAuditToken");
  v8 = SecTaskCreateWithAuditToken(0, &token);
  if (v8)
  {
    v9 = v8;
    v10 = (void *)SecTaskCopyValueForEntitlement(v8, (CFStringRef)*MEMORY[0x1E0D677C0], 0);
    if (objc_msgSend(v10, "BOOLValue"))
    {
      CFRelease(v9);

LABEL_5:
      v13 = objc_alloc(MEMORY[0x1E0D67230]);
      objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (PKPaymentProvisioningController *)objc_msgSend(v13, "initWithWebService:paymentSetupRequest:", v14, v6);
      provisioningController = self->_provisioningController;
      self->_provisioningController = v15;

      objc_msgSend(v6, "paymentSetupFeatures");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");
      v19 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __83__PKServicePaymentSetupViewController_configureWithPaymentSetupRequest_completion___block_invoke;
      aBlock[3] = &unk_1E3E61518;
      aBlock[4] = self;
      v35 = v18;
      v20 = v17;
      v32 = v20;
      v33 = v6;
      v34 = v7;
      v21 = _Block_copy(aBlock);
      v22 = self->_provisioningController;
      v27[0] = v19;
      v27[1] = 3221225472;
      v27[2] = __83__PKServicePaymentSetupViewController_configureWithPaymentSetupRequest_completion___block_invoke_3;
      v27[3] = &unk_1E3E61568;
      v27[4] = self;
      v28 = v20;
      v29 = v21;
      v30 = v18;
      v23 = v21;
      v24 = v20;
      -[PKPaymentProvisioningController preflightWithCompletion:](v22, "preflightWithCompletion:", v27);

      goto LABEL_11;
    }
    v11 = (void *)SecTaskCopyValueForEntitlement(v9, (CFStringRef)*MEMORY[0x1E0D677B8], 0);
    v12 = objc_msgSend(v11, "BOOLValue");

    CFRelease(v9);
    if ((v12 & 1) != 0)
      goto LABEL_5;
  }
  PKLogFacilityTypeGetObject();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    -[PKServicePaymentSetupViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v38 = v26;
    _os_log_error_impl(&dword_19D178000, v25, OS_LOG_TYPE_ERROR, "%{public}@ missing entitlement", buf, 0xCu);

  }
  if (v7)
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D682D8], 0, 0);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[PKServicePaymentSetupViewController paymentSetupDidFinish:withError:](self, "paymentSetupDidFinish:withError:", 0, v24);
LABEL_11:

}

void __83__PKServicePaymentSetupViewController_configureWithPaymentSetupRequest_completion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  PKPaymentSetupNavigationController *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = -[PKPaymentSetupNavigationController initWithProvisioningController:context:]([PKPaymentSetupNavigationController alloc], "initWithProvisioningController:context:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968), 7);
    -[PKPaymentSetupNavigationController setSetupDelegate:](v4, "setSetupDelegate:", *(_QWORD *)(a1 + 32));
    if (objc_msgSend(*(id *)(a1 + 32), "pkui_userInterfaceIdiomSupportsLargeLayouts"))
      -[PKNavigationController setCustomFormSheetPresentationStyleForiPad](v4, "setCustomFormSheetPresentationStyleForiPad");
    else
      -[PKPaymentSetupNavigationController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 3);
    -[PKPaymentSetupNavigationController setModalTransitionStyle:](v4, "setModalTransitionStyle:", 2);
    if (*(_QWORD *)(a1 + 64) == 1
      && (objc_msgSend(*(id *)(a1 + 40), "firstObject"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "type"),
          v5,
          v6 == 3))
    {
      v7 = 3;
    }
    else
    {
      v7 = 4;
    }
    -[PKPaymentSetupNavigationController setPaymentSetupMode:](v4, "setPaymentSetupMode:", v7);
    if (*(_QWORD *)(a1 + 64))
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      objc_msgSend(*(id *)(a1 + 48), "paymentSetupFeatures");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v8);
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "type"))
            {
              v9 = 1;
              goto LABEL_21;
            }
          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v9)
            continue;
          break;
        }
      }
LABEL_21:

      -[PKPaymentSetupNavigationController setShowsWelcomeViewController:](v4, "setShowsWelcomeViewController:", v9);
    }
    v12 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __83__PKServicePaymentSetupViewController_configureWithPaymentSetupRequest_completion___block_invoke_2;
    v13[3] = &unk_1E3E614F0;
    v14 = *(id *)(a1 + 56);
    objc_msgSend(v12, "pk_presentViewController:animated:popToViewControllerAfterPresentation:completion:", v4, 1, 0, v13);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleError:completion:", a3, *(_QWORD *)(a1 + 56));
  }
}

uint64_t __83__PKServicePaymentSetupViewController_configureWithPaymentSetupRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __83__PKServicePaymentSetupViewController_configureWithPaymentSetupRequest_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "paymentSetupProductModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allSetupProducts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 56) != 1)
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifiers");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

    goto LABEL_6;
  }
  v9 = (void *)v8;
  v10 = objc_msgSend(v6, "count");

  if (v10 != 1)
  {
LABEL_6:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_7;
  }
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
  objc_msgSend(v6, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__PKServicePaymentSetupViewController_configureWithPaymentSetupRequest_completion___block_invoke_4;
  v13[3] = &unk_1E3E61540;
  v14 = *(id *)(a1 + 48);
  objc_msgSend(v11, "setupProductForProvisioning:includePurchases:withCompletionHandler:", v12, 1, v13);

LABEL_7:
}

uint64_t __83__PKServicePaymentSetupViewController_configureWithPaymentSetupRequest_completion___block_invoke_4(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)paymentSetupDidFinish:(id)a3
{
  -[PKServicePaymentSetupViewController paymentSetupDidFinish:withError:](self, "paymentSetupDidFinish:withError:", a3, 0);
}

- (void)paymentSetupDidShowError:(id)a3
{
  -[PKServicePaymentSetupViewController paymentSetupDidFinish:withError:](self, "paymentSetupDidFinish:withError:", 0, a3);
}

- (void)paymentSetupDidFinish:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0D682D8];
    v11 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D682D8]);

    v12 = v8;
    if ((v11 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v10, 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v12 = 0;
  }
  PKLogFacilityTypeGetObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v12;
    v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "PKServicePaymentSetupViewController did show error: %@ (original error: %@)", buf, 0x16u);
  }

  -[PKServicePaymentSetupViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[PKPaymentProvisioningController provisionedPasses](self->_provisioningController, "provisionedPasses", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "secureElementPass");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(v15, "addObject:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v18);
  }

  objc_msgSend(v14, "didFinishWithPasses:error:", v15, v8);
}

- (void)_handleError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD aBlock[5];

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    PKDisplayableErrorForCommonType();
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKServicePaymentSetupViewController__handleError_completion___block_invoke;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = self;
  v9 = _Block_copy(aBlock);
  PKAlertForDisplayableErrorWithHandlers(v6, 0, v9, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __63__PKServicePaymentSetupViewController__handleError_completion___block_invoke_2;
    v11[3] = &unk_1E3E61590;
    v12 = v7;
    -[PKServicePaymentSetupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, v11);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __63__PKServicePaymentSetupViewController__handleError_completion___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D682D8], 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "paymentSetupDidFinish:withError:", 0, v2);

}

uint64_t __63__PKServicePaymentSetupViewController__handleError_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end
