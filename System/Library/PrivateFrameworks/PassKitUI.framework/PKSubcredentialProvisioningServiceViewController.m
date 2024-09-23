@implementation PKSubcredentialProvisioningServiceViewController

- (PKSubcredentialProvisioningServiceViewController)init
{
  PKSubcredentialProvisioningServiceViewController *v2;
  PKSubcredentialPairingFlowControllerContext *v3;
  PKSubcredentialPairingFlowControllerContext *pairingContext;
  PKSubcredentialPairingFlowController *v5;
  PKSubcredentialPairingFlowController *flowController;
  PKSubcredentialPairingFlowControllerContext *v7;
  void *v8;
  PKSubcredentialPairingFlowControllerContext *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKSubcredentialProvisioningServiceViewController;
  v2 = -[PKNavigationController init](&v12, sel_init);
  if (v2)
  {
    v3 = -[PKSubcredentialPairingFlowControllerContext initWithFlowType:referralSource:]([PKSubcredentialPairingFlowControllerContext alloc], "initWithFlowType:referralSource:", 1, 1);
    pairingContext = v2->_pairingContext;
    v2->_pairingContext = v3;

    v5 = -[PKSubcredentialPairingFlowController initWithDelegate:]([PKSubcredentialPairingFlowController alloc], "initWithDelegate:", v2);
    flowController = v2->_flowController;
    v2->_flowController = v5;

    v7 = v2->_pairingContext;
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSubcredentialProvisioningFlowControllerContext setLocalDeviceWebService:](v7, "setLocalDeviceWebService:", v8);

    v9 = v2->_pairingContext;
    -[PKSubcredentialProvisioningServiceViewController remoteDeviceWebService](v2, "remoteDeviceWebService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSubcredentialProvisioningFlowControllerContext setRemoteDeviceWebService:](v9, "setRemoteDeviceWebService:", v10);

  }
  return v2;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSubcredentialProvisioningServiceViewController;
  -[PKSubcredentialProvisioningServiceViewController loadView](&v5, sel_loadView);
  -[PKSubcredentialProvisioningServiceViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningBackgroundColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)_hostApplicationWillEnterForeground
{
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSubcredentialProvisioningServiceViewController;
  -[PKSubcredentialProvisioningServiceViewController _hostApplicationWillEnterForeground](&v5, sel__hostApplicationWillEnterForeground);
  -[PKSubcredentialProvisioningServiceViewController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE543430))
  {
    v4 = v3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "hostApplicationWillEnterForeground");

  }
}

- (void)_hostApplicationDidEnterBackground
{
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSubcredentialProvisioningServiceViewController;
  -[PKSubcredentialProvisioningServiceViewController _hostApplicationDidEnterBackground](&v5, sel__hostApplicationDidEnterBackground);
  -[PKSubcredentialProvisioningServiceViewController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE543430))
  {
    v4 = v3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "hostApplicationDidEnterBackground");

  }
}

- (id)remoteDeviceWebService
{
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstanceWithRemoteLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_hasRemoteLibrary"))
  {
    v3 = objc_alloc_init(getNPKCompanionAgentConnectionClass_4());
    objc_msgSend(v3, "watchPaymentWebService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)didFinishWithPass:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D682D8]);

    v11 = v8;
    if ((v10 & 1) == 0)
    {
      PKConvertErrorToAddSecureElementPassProvisioningErrorDomain();
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v11 = 0;
  }
  PKLogFacilityTypeGetObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v18 = v6;
    v19 = 2112;
    v20 = v11;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Provisioning did finish with pass %@ and error %@ (original error: %@)", buf, 0x20u);
  }

  objc_msgSend(v6, "sanitizePaymentApplications");
  -[PKSubcredentialProvisioningServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v6)
  {
    v16 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "didFinishWithPasses:error:", v15, v11);

  }
  else
  {
    objc_msgSend(v13, "didFinishWithPasses:error:", 0, v11);
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
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v14.width = width;
    v14.height = height;
    NSStringFromCGSize(v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2048;
    v12 = a4;
    _os_log_error_impl(&dword_19D178000, v7, OS_LOG_TYPE_ERROR, "Setting display properties with screenSize=%{public}@ scale=%.f", (uint8_t *)&v9, 0x16u);

  }
  PKSetDisplayProperties();
}

- (void)setConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD v25[5];
  _BYTE v26[32];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = objc_alloc(MEMORY[0x1E0D66D40]);
  v9 = -[PKSubcredentialProvisioningServiceViewController _hostProcessIdentifier](self, "_hostProcessIdentifier");
  -[PKSubcredentialProvisioningServiceViewController _hostAuditToken](self, "_hostAuditToken");
  v10 = (void *)objc_msgSend(v8, "initWithProcessIdentifier:auditToken:", v9, v26);
  if ((objc_msgSend(v10, "carKeyCredentialProvisioning") & 1) != 0)
  {
    objc_msgSend(v6, "updateAllowManagedAppleIDWithEntitlements:", v10);
    if (objc_msgSend(v6, "configurationType") == 1)
    {
      objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "canAddSecureElementPassWithConfiguration:", v6) & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v6;
          if (!objc_msgSend(v12, "supportedRadioTechnologies"))
          {
            PKLogFacilityTypeGetObject();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Configuration did not have radio technology type set defaulting to NFC", buf, 2u);
            }

            objc_msgSend(v12, "setSupportedRadioTechnologies:", 1);
          }
          objc_msgSend(v12, "supportedRadioTechnologies");
          objc_msgSend(v12, "setSupportedRadioTechnologies:", PKRadioTechnologyForConfigurationTechnology());
          -[PKSubcredentialPairingFlowControllerContext setConfiguration:](self->_pairingContext, "setConfiguration:", v12);
          if (PKV2SharingFlowEnabled())
          {
            PKLogFacilityTypeGetObject();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Using v2 owner pairing flow", buf, 2u);
            }

            v15 = objc_alloc(MEMORY[0x1E0D67230]);
            objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (void *)objc_msgSend(v15, "initWithWebService:", v16);

            v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", 7, v17, 0);
            v25[0] = MEMORY[0x1E0C809B0];
            v25[1] = 3221225472;
            v25[2] = __87__PKSubcredentialProvisioningServiceViewController_setConfiguration_completionHandler___block_invoke;
            v25[3] = &unk_1E3E6C0F0;
            v25[4] = self;
            +[PKProvisioningFlowBridge startInAppFlowWithNavController:context:addCarKeyConfiguration:completion:](PKProvisioningFlowBridge, "startInAppFlowWithNavController:context:addCarKeyConfiguration:completion:", self, v18, v12, v25);
            if (v7)
              v7[2](v7);

          }
          else
          {
            -[PKSubcredentialPairingFlowController startingViewControllerForContext:](self->_flowController, "startingViewControllerForContext:", self->_pairingContext);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKSubcredentialProvisioningServiceViewController pushViewController:animated:](self, "pushViewController:animated:", v17, 0);
            if (v7)
              v7[2](v7);
          }

LABEL_31:
          goto LABEL_32;
        }
      }
      else
      {
        PKLogFacilityTypeGetObject();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v6;
          _os_log_impl(&dword_19D178000, v24, OS_LOG_TYPE_DEFAULT, "Configuration is not supported by device: %@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D682D8], 3, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[PKSubcredentialProvisioningServiceViewController didFinishWithPass:error:](self, "didFinishWithPass:error:", 0, v12);
      if (v7)
        v7[2](v7);
      goto LABEL_31;
    }
    PKLogFacilityTypeGetObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v23, OS_LOG_TYPE_DEFAULT, "Unsupported configuration type", buf, 2u);
    }

    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0D682D8];
    v22 = 3;
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v19, OS_LOG_TYPE_DEFAULT, "Remote process is not entitled for provisioning", buf, 2u);
    }

    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0D682D8];
    v22 = 2;
  }
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v22, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialProvisioningServiceViewController didFinishWithPass:error:](self, "didFinishWithPass:error:", 0, v11);
  if (v7)
    v7[2](v7);
LABEL_32:

}

void __87__PKSubcredentialProvisioningServiceViewController_setConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __87__PKSubcredentialProvisioningServiceViewController_setConfiguration_completionHandler___block_invoke_2;
  block[3] = &unk_1E3E61400;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v7;
  v13 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __87__PKSubcredentialProvisioningServiceViewController_setConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v2;
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "didFinishWithPass:error:", v2, 0);
  }
  else
  {
    v3 = *(void **)(a1 + 48);
    if (v3)
    {
      v4 = v3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D682D8], 3, 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 40), "didFinishWithPass:error:", 0, v4);

  }
}

- (void)subcredentialProvisioningFlowController:(id)a3 didFinishWithPass:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __116__PKSubcredentialProvisioningServiceViewController_subcredentialProvisioningFlowController_didFinishWithPass_error___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __116__PKSubcredentialProvisioningServiceViewController_subcredentialProvisioningFlowController_didFinishWithPass_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didFinishWithPass:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)userCanceledPairingWithSubcredentialProvisioningFlowController:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D682D8], 1, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialProvisioningServiceViewController didFinishWithPass:error:](self, "didFinishWithPass:error:", 0, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingContext, 0);
  objc_storeStrong((id *)&self->_flowController, 0);
}

@end
