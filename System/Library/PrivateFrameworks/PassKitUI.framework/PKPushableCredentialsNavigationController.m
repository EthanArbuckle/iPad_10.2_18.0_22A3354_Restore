@implementation PKPushableCredentialsNavigationController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)loadView
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPushableCredentialsNavigationController;
  -[PKPushableCredentialsNavigationController loadView](&v2, sel_loadView);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPushableCredentialsNavigationController;
  -[PKPushableCredentialsNavigationController viewDidMoveToWindow:shouldAppearOrDisappear:](&v4, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
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
  id v6;
  void (**v7)(_QWORD);
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id buf[2];
  _BYTE v29[32];

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = objc_alloc(MEMORY[0x1E0D66D40]);
  v9 = -[PKPushableCredentialsNavigationController _hostProcessIdentifier](self, "_hostProcessIdentifier");
  -[PKPushableCredentialsNavigationController _hostAuditToken](self, "_hostAuditToken");
  v10 = (void *)objc_msgSend(v8, "initWithProcessIdentifier:auditToken:", v9, v29);
  if ((objc_msgSend(v10, "shareableCredentialProvisioning") & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "Remote process is not entitled for provisioning", (uint8_t *)buf, 2u);
    }

    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D682D8];
    v20 = 2;
    goto LABEL_16;
  }
  objc_msgSend(v6, "updateAllowManagedAppleIDWithEntitlements:", v10);
  v11 = objc_msgSend(v6, "configurationType");
  if (v11 == 2 || v11 == 4)
  {
    if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EE66E528) & 1) != 0)
    {
      v12 = v6;
      objc_msgSend(v12, "metadataProviders");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "provisioningTarget");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "targetDevice");

      if (v16 == 2)
        objc_msgSend(MEMORY[0x1E0D673C8], "remoteDeviceWebService");
      else
        objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", v23);
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", 7, v24, 0);
      objc_initWeak(buf, self);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __80__PKPushableCredentialsNavigationController_setConfiguration_completionHandler___block_invoke;
      v26[3] = &unk_1E3E696C0;
      objc_copyWeak(&v27, buf);
      +[PKProvisioningFlowBridge startInAppFlowWithNavController:context:addPassConfiguration:completion:](PKProvisioningFlowBridge, "startInAppFlowWithNavController:context:addPassConfiguration:completion:", self, v25, v12, v26);
      v7[2](v7);
      objc_destroyWeak(&v27);
      objc_destroyWeak(buf);

      goto LABEL_20;
    }
    PKLogFacilityTypeGetObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    LOWORD(buf[0]) = 0;
    v22 = "Unsupported as configuration is not pushable";
    goto LABEL_14;
  }
  PKLogFacilityTypeGetObject();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    v22 = "Unsupported configuration type";
LABEL_14:
    _os_log_impl(&dword_19D178000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)buf, 2u);
  }
LABEL_15:

  v18 = (void *)MEMORY[0x1E0CB35C8];
  v19 = *MEMORY[0x1E0D682D8];
  v20 = 3;
LABEL_16:
  objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, v20, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPushableCredentialsNavigationController didFinishWithPasses:error:](self, "didFinishWithPasses:error:", 0, v12);
  if (v7)
    v7[2](v7);
LABEL_20:

}

void __80__PKPushableCredentialsNavigationController_setConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "didFinishWithPasses:error:", v6, v5);

}

- (void)didFinishWithPasses:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  char v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v39 = v6;
    v40 = 2112;
    v41 = v7;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Provisioning did finish with passes %@ and error %@", buf, 0x16u);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "sanitizePaymentApplications", (_QWORD)v33);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v11);
  }

  if (v7)
  {
    objc_msgSend(v7, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)*MEMORY[0x1E0D682D8];
    v16 = v14;
    v17 = v15;
    v18 = v17;
    if (v16 == v17)
    {

    }
    else
    {
      if (!v16 || !v17)
      {

LABEL_20:
        v20 = 0;
LABEL_21:
        objc_msgSend(v7, "underlyingErrors", (_QWORD)v33);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
          goto LABEL_46;
        objc_msgSend(v22, "domain");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (v23 == v18)
        {

        }
        else
        {
          v24 = v23;
          if (!v18 || !v23)
          {

            goto LABEL_31;
          }
          v25 = objc_msgSend(v23, "isEqualToString:", v18);

          if (!v25)
          {
LABEL_31:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_45;
            v26 = v7;
            objc_msgSend(v26, "underlyingError");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "domain");
            v28 = (id)objc_claimAutoreleasedReturnValue();
            if (v28 == v18)
            {

            }
            else
            {
              v29 = v28;
              if (!v18 || !v28)
              {

LABEL_40:
                if (objc_msgSend(v26, "severity") == 1)
                {
                  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v18, 0, 0);
                  v31 = objc_claimAutoreleasedReturnValue();
LABEL_42:
                  v20 = (id)v31;

                  if (!v20)
                    goto LABEL_45;
LABEL_46:

                  goto LABEL_47;
                }

LABEL_45:
                objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v18, 0, 0);
                v20 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_46;
              }
              v30 = objc_msgSend(v28, "isEqualToString:", v18);

              if ((v30 & 1) == 0)
                goto LABEL_40;
            }
            objc_msgSend(v26, "underlyingError");
            v31 = objc_claimAutoreleasedReturnValue();
            goto LABEL_42;
          }
        }
        v20 = v22;
        if (v20)
          goto LABEL_46;
        goto LABEL_31;
      }
      v19 = objc_msgSend(v16, "isEqualToString:", v17);

      if (!v19)
        goto LABEL_20;
    }
    v20 = v7;
    goto LABEL_21;
  }
  v20 = 0;
LABEL_47:
  -[PKPushableCredentialsNavigationController _remoteViewControllerProxy](self, "_remoteViewControllerProxy", (_QWORD)v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "didFinishWithPasses:error:", v9, v20);

}

@end
