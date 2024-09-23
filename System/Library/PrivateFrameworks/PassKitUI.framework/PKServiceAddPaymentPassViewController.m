@implementation PKServiceAddPaymentPassViewController

- (PKServiceAddPaymentPassViewController)init
{
  PKServiceAddPaymentPassViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSArray *webServices;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t v14[16];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKServiceAddPaymentPassViewController;
  v2 = -[PKNavigationController init](&v15, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    if (PKSecureElementIsAvailable() || PKIsSimulator())
    {
      objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_storeStrong((id *)&v2->_managingDeviceWebService, v4);
        objc_msgSend(v3, "addObject:", v4);
      }

    }
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstanceWithRemoteLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "_hasRemoteLibrary")
      && objc_msgSend(v5, "isWatchIssuerAppProvisioningSupported"))
    {
      v6 = objc_alloc_init((Class)_MergedGlobals_1_0[0]());
      objc_msgSend(v6, "watchPaymentWebService");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(v3, "addObject:", v7);

    }
    v8 = objc_msgSend(v3, "copy");
    webServices = v2->_webServices;
    v2->_webServices = (NSArray *)v8;

    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "PKServiceAddPaymentPassViewController: Calling didCompleteFlow for Buddy", v14, 2u);
    }

    objc_msgSend((Class)off_1EE492C50[0](), "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    off_1EE492C58[0]();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didCompleteFlow:", v12);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKServiceAddPaymentPassViewController;
  -[PKNavigationController dealloc](&v2, sel_dealloc);
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
  v5.super_class = (Class)PKServiceAddPaymentPassViewController;
  -[PKServiceAddPaymentPassViewController loadView](&v5, sel_loadView);
  -[PKServiceAddPaymentPassViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningBackgroundColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)_hostApplicationWillEnterForeground
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKServiceAddPaymentPassViewController;
  -[PKServiceAddPaymentPassViewController _hostApplicationWillEnterForeground](&v2, sel__hostApplicationWillEnterForeground);
  objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", *MEMORY[0x1E0D69900]);
}

- (void)_hostApplicationDidEnterBackground
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKServiceAddPaymentPassViewController;
  -[PKServiceAddPaymentPassViewController _hostApplicationDidEnterBackground](&v2, sel__hostApplicationDidEnterBackground);
  objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", *MEMORY[0x1E0D69900]);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", *MEMORY[0x1E0D69900]);
  v5.receiver = self;
  v5.super_class = (Class)PKServiceAddPaymentPassViewController;
  -[PKServiceAddPaymentPassViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", *MEMORY[0x1E0D69900]);
  v5.receiver = self;
  v5.super_class = (Class)PKServiceAddPaymentPassViewController;
  -[PKServiceAddPaymentPassViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
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

- (void)setConfiguration:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  __SecTask *v9;
  __SecTask *v10;
  NSString *v11;
  NSString *teamID;
  NSString *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  audit_token_t token;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  -[PKServiceAddPaymentPassViewController _hostAuditToken](self, "_hostAuditToken");
  v9 = SecTaskCreateWithAuditToken(0, &token);
  if (v9)
  {
    v10 = v9;
    v11 = (NSString *)SecTaskCopyValueForEntitlement(v9, CFSTR("com.apple.developer.team-identifier"), 0);
    teamID = self->_teamID;
    self->_teamID = v11;

    if (-[NSString length](self->_teamID, "length") != 10)
    {
      v13 = self->_teamID;
      self->_teamID = 0;

    }
    v14 = objc_alloc(MEMORY[0x1E0D66D40]);
    v15 = -[PKServiceAddPaymentPassViewController _hostProcessIdentifier](self, "_hostProcessIdentifier");
    -[PKServiceAddPaymentPassViewController _hostAuditToken](self, "_hostAuditToken");
    v16 = (void *)objc_msgSend(v14, "initWithProcessIdentifier:auditToken:", v15, &v27);
    objc_msgSend(v7, "updateAllowManagedAppleIDWithEntitlements:", v16);
    self->_entitled = objc_msgSend(v16, "paymentPassProvisioning");
    CFRelease(v10);

  }
  if (-[NSArray count](self->_webServices, "count"))
  {
    if (self->_entitled)
    {
      objc_storeStrong((id *)&self->_configuration, a3);
      -[PKAddPaymentPassRequestConfiguration _filterWebServices:primaryAccountIdentifierRequired:](self->_configuration, "_filterWebServices:primaryAccountIdentifierRequired:", self->_webServices, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v17)
        v19 = (void *)v17;
      else
        v19 = (void *)MEMORY[0x1E0C9AA60];
      objc_storeStrong((id *)&self->_webServices, v19);

      -[PKServiceAddPaymentPassViewController _launchFlowWithFlowManager](self, "_launchFlowWithFlowManager");
      if (v8)
        v8[2](v8);
      goto LABEL_19;
    }
    PKLogFacilityTypeGetObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      -[PKServiceAddPaymentPassViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v26;
      _os_log_error_impl(&dword_19D178000, v24, OS_LOG_TYPE_ERROR, "%{public}@ missing entitlement: com.apple.developer.payment-pass-provisioning", buf, 0xCu);

    }
    -[PKServiceAddPaymentPassViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0D6A758];
    v23 = 2;
  }
  else
  {
    -[PKServiceAddPaymentPassViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0D6A758];
    v23 = 0;
  }
  objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, v23, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "didFinishWithPass:error:", 0, v25);

  if (v8)
    v8[2](v8);

LABEL_19:
}

- (void)_launchFlowWithFlowManager
{
  NSArray *webServices;
  uint64_t v4;
  void *v5;
  NSArray *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PKAddPaymentPassRequestConfiguration *configuration;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  id location;
  _QWORD v16[5];
  _QWORD v17[5];

  webServices = self->_webServices;
  v4 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__PKServiceAddPaymentPassViewController__launchFlowWithFlowManager__block_invoke;
  v17[3] = &unk_1E3E6C0A0;
  v17[4] = self;
  -[NSArray pk_firstObjectPassingTest:](webServices, "pk_firstObjectPassingTest:", v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_webServices;
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __67__PKServiceAddPaymentPassViewController__launchFlowWithFlowManager__block_invoke_2;
  v16[3] = &unk_1E3E6C0A0;
  v16[4] = self;
  -[NSArray pk_firstObjectPassingTest:](v6, "pk_firstObjectPassingTest:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", self->_managingDeviceWebService);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", 7, v8, 0);
  objc_msgSend(v9, "setTeamIdentifier:", self->_teamID);
  -[PKServiceAddPaymentPassViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHostApplicationBundleIdentifier:", v10);

  objc_initWeak(&location, self);
  configuration = self->_configuration;
  v13[4] = self;
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __67__PKServiceAddPaymentPassViewController__launchFlowWithFlowManager__block_invoke_3;
  v14[3] = &unk_1E3E6C0C8;
  v14[4] = self;
  v12[4] = self;
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __67__PKServiceAddPaymentPassViewController__launchFlowWithFlowManager__block_invoke_4;
  v13[3] = &unk_1E3E612E8;
  v12[1] = 3221225472;
  v12[2] = __67__PKServiceAddPaymentPassViewController__launchFlowWithFlowManager__block_invoke_5;
  v12[3] = &unk_1E3E6C0F0;
  v12[0] = v4;
  +[PKProvisioningFlowBridge startInAppFlowWithNavController:context:requestConfiguration:phoneWebService:watchWebService:generateRequest:onViewLoaded:completion:](PKProvisioningFlowBridge, "startInAppFlowWithNavController:context:requestConfiguration:phoneWebService:watchWebService:generateRequest:onViewLoaded:completion:", self, v9, configuration, v5, v7, v14, v13, v12);
  objc_destroyWeak(&location);

}

BOOL __67__PKServiceAddPaymentPassViewController__launchFlowWithFlowManager__block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1488) == a2;
}

BOOL __67__PKServiceAddPaymentPassViewController__launchFlowWithFlowManager__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1488) != a2;
}

uint64_t __67__PKServiceAddPaymentPassViewController__launchFlowWithFlowManager__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;

  v5 = *(void **)(a1 + 32);
  if (v5)
    return objc_msgSend(v5, "generateRequestWithCertificateChain:nonce:nonceSignature:completionHandler:", a2, a3, a4, a5);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(a5 + 16))(a5, 0);
}

void __67__PKServiceAddPaymentPassViewController__launchFlowWithFlowManager__block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v2, "viewControllers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_applyCancelItem:", v4);

  }
}

void __67__PKServiceAddPaymentPassViewController__launchFlowWithFlowManager__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v6 = v3;
    v7 = a3;
    objc_msgSend(a2, "firstObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sanitizePaymentApplications");
    objc_msgSend(v6, "_remoteViewControllerProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "paymentPass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didFinishWithPass:error:", v9, v7);

  }
}

- (void)generateRequestWithCertificateChain:(id)a3 nonce:(id)a4 nonceSignature:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSString *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  _OWORD v35[2];
  _QWORD v36[4];
  id v37;
  _QWORD *v38;
  __int128 v39;
  __int128 v40;
  _QWORD aBlock[4];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  NSString *v47;
  id v48;
  id v49;
  id v50;
  _QWORD *v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[4];
  id v55;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    v14 = MEMORY[0x1E0C809B0];
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke;
    v54[3] = &unk_1E3E63438;
    v30 = v13;
    v15 = v13;
    v55 = v15;
    -[PKServiceAddPaymentPassViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", v54);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAddPaymentPassRequestConfiguration encryptionScheme](self->_configuration, "encryptionScheme");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self->_teamID;
    -[PKServiceAddPaymentPassViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v18, 1, 0);
    objc_msgSend(v29, "shortVersionString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x3032000000;
    v52[3] = __Block_byref_object_copy__24;
    v52[4] = __Block_byref_object_dispose__24;
    v53 = 0;
    aBlock[0] = v14;
    aBlock[1] = 3221225472;
    aBlock[2] = __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke_63;
    aBlock[3] = &unk_1E3E6C140;
    v28 = v16;
    v42 = v28;
    v33 = v10;
    v43 = v10;
    v32 = v11;
    v20 = v11;
    v44 = v20;
    v31 = v12;
    v45 = v12;
    v21 = v34;
    v46 = v21;
    v22 = v17;
    v47 = v22;
    v23 = v18;
    v48 = v23;
    v24 = v19;
    v49 = v24;
    v51 = v52;
    v50 = v15;
    v25 = _Block_copy(aBlock);
    v26 = v25;
    if (self->_entitled)
    {
      v39 = 0u;
      v40 = 0u;
      -[PKServiceAddPaymentPassViewController _hostAuditToken](self, "_hostAuditToken");
      v27 = (void *)MEMORY[0x1E0D66FC0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke_4;
      v36[3] = &unk_1E3E6C168;
      v38 = v52;
      v37 = v26;
      v35[0] = v39;
      v35[1] = v40;
      objc_msgSend(v27, "getFairPlayInfoWithAuditToken:nonce:completion:", v35, v20, v36);

    }
    else
    {
      (*((void (**)(void *))v25 + 2))(v25);
    }

    _Block_object_dispose(v52, 8);
    v11 = v32;
    v10 = v33;
    v13 = v30;
    v12 = v31;
  }

}

void __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke_2;
  block[3] = &unk_1E3E61590;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke_63(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke_2_64;
  v8[3] = &unk_1E3E6C118;
  v9 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 72);
  v11 = *(id *)(a1 + 80);
  v12 = *(id *)(a1 + 88);
  v7 = *(_OWORD *)(a1 + 96);
  v6 = (id)v7;
  v13 = v7;
  objc_msgSend(v2, "generateRequestWithCertificateChain:nonce:nonceSignature:completionHandler:", v3, v4, v5, v8);

}

void __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke_2_64(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "setEncryptionVersion:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setIssuerIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setHostApplicationIdentifier:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "setHostApplicationVersion:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v3, "setFPInfo:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke_3;
  v6[3] = &unk_1E3E618A0;
  v4 = *(id *)(a1 + 64);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_applyCancelItem:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0DC34F0];
  v5 = a3;
  v6 = [v4 alloc];
  PKLocalizedString(CFSTR("CANCEL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "initWithTitle:style:target:action:", v7, 0, self, sel__cancel);

  objc_msgSend(v5, "setLeftBarButtonItem:", v8);
}

- (void)_cancel
{
  void *v2;
  id v3;

  -[PKServiceAddPaymentPassViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6A758], 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didFinishWithPass:error:", 0, v2);

  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D683F0], &unk_1E3FAEBB8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_managingDeviceWebService, 0);
  objc_storeStrong((id *)&self->_webServices, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
