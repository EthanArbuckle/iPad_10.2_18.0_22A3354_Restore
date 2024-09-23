@implementation PKServicePerformActionSetupViewController

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

- (void)configureWithPassUniqueIdentifier:(id)a3 actionType:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  __SecTask *v10;
  __SecTask *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  NSObject *v27;
  char v28;
  id v29;
  PKPerformActionViewController *v30;
  PKNavigationController *v31;
  NSObject *v32;
  void *v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  _QWORD aBlock[5];
  id v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  audit_token_t token;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  PKPerformActionViewController *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  -[PKServicePerformActionSetupViewController _hostAuditToken](self, "_hostAuditToken");
  v10 = SecTaskCreateWithAuditToken(0, &token);
  if (!v10)
    goto LABEL_16;
  v11 = v10;
  v12 = (void *)SecTaskCopyValueForEntitlement(v10, (CFStringRef)*MEMORY[0x1E0D677C0], 0);
  if (!objc_msgSend(v12, "BOOLValue"))
  {
    v13 = (void *)SecTaskCopyValueForEntitlement(v11, (CFStringRef)*MEMORY[0x1E0D677B8], 0);
    v14 = objc_msgSend(v13, "BOOLValue");

    CFRelease(v11);
    if ((v14 & 1) != 0)
      goto LABEL_5;
LABEL_16:
    PKLogFacilityTypeGetObject();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      -[PKServicePerformActionSetupViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v40;
      _os_log_error_impl(&dword_19D178000, v27, OS_LOG_TYPE_ERROR, "%{public}@ missing entitlement", buf, 0xCu);

    }
    if (!v9)
      goto LABEL_20;
LABEL_19:
    v9[2](v9, 0);
LABEL_20:
    -[PKServicePerformActionSetupViewController dismiss](self, "dismiss");
    goto LABEL_32;
  }
  CFRelease(v11);

LABEL_5:
  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "passWithUniqueID:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "paymentPass");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstanceWithRemoteLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_remoteLibrary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "passWithUniqueID:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "paymentPass");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      PKLogFacilityTypeGetObject();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        PKPaymentPassActionTypeToString();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v50 = v39;
        _os_log_impl(&dword_19D178000, v38, OS_LOG_TYPE_DEFAULT, "No payment pass to perform top up action %@", buf, 0xCu);

      }
      if (!v9)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  objc_msgSend(v17, "availableActions");
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (!v22)
    goto LABEL_29;
  v23 = v22;
  v24 = *(_QWORD *)v45;
  while (2)
  {
    for (i = 0; i != v23; ++i)
    {
      if (*(_QWORD *)v45 != v24)
        objc_enumerationMutation(v21);
      v26 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
      if (objc_msgSend(v26, "type") == a4)
      {
        v42 = 0;
        v43 = 0;
        v28 = objc_msgSend(v17, "canPerformAction:unableReason:displayableError:", v26, &v43, &v42);
        v29 = v42;
        if ((v28 & 1) != 0 || v43 == 2)
        {
          v30 = -[PKPerformActionViewController initWithPass:action:]([PKPerformActionViewController alloc], "initWithPass:action:", v17, v26);
          -[PKPerformActionViewController setDelegate:](v30, "setDelegate:", self);
          v31 = objc_alloc_init(PKNavigationController);
          -[PKNavigationController setSupportedInterfaceOrientations:](v31, "setSupportedInterfaceOrientations:", 2);
          -[PKNavigationController setModalPresentationStyle:](v31, "setModalPresentationStyle:", 3);
          v53 = v30;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKNavigationController setViewControllers:animated:](v31, "setViewControllers:animated:", v37, 1);

          -[UIViewController pk_presentViewController:animated:popToViewControllerAfterPresentation:completion:](self, "pk_presentViewController:animated:popToViewControllerAfterPresentation:completion:", v31, 1, 0, 0);
          PKLogFacilityTypeGetObject();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            PKPaymentPassActionTypeToString();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v50 = v33;
            v34 = "Presented PKPerformActionViewController for actionType %@";
            v35 = v32;
            v36 = 12;
            goto LABEL_27;
          }
        }
        else
        {
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __101__PKServicePerformActionSetupViewController_configureWithPassUniqueIdentifier_actionType_completion___block_invoke;
          aBlock[3] = &unk_1E3E612E8;
          aBlock[4] = self;
          v30 = (PKPerformActionViewController *)_Block_copy(aBlock);
          +[PKPerformActionViewController alertControllerForUnableReason:action:displayableError:addCardActionHandler:unavailableActionHandler:cancelActionHandler:](PKPerformActionViewController, "alertControllerForUnableReason:action:displayableError:addCardActionHandler:unavailableActionHandler:cancelActionHandler:", v43, v26, v29, 0, v30, v30);
          v31 = (PKNavigationController *)objc_claimAutoreleasedReturnValue();
          -[PKServicePerformActionSetupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v31, 1, 0);
          PKLogFacilityTypeGetObject();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            PKPaymentPassActionTypeToString();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v50 = v33;
            v51 = 2112;
            v52 = v29;
            v34 = "PKPerformActionViewController unavailable for actionType %@, error: %@";
            v35 = v32;
            v36 = 22;
LABEL_27:
            _os_log_impl(&dword_19D178000, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);

          }
        }

        goto LABEL_29;
      }
    }
    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    if (v23)
      continue;
    break;
  }
LABEL_29:

  if (v9)
    v9[2](v9, 1);

LABEL_32:
}

uint64_t __101__PKServicePerformActionSetupViewController_configureWithPassUniqueIdentifier_actionType_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismiss");
}

- (void)dismiss
{
  id v2;

  -[PKServicePerformActionSetupViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didCancelAction");

}

- (void)performActionViewControllerDidCancel:(id)a3
{
  objc_msgSend(a3, "setDelegate:", 0);
  -[PKServicePerformActionSetupViewController dismiss](self, "dismiss");
}

- (void)performActionViewControllerDidPerformAction:(id)a3
{
  id v4;

  objc_msgSend(a3, "setDelegate:", 0);
  -[PKServicePerformActionSetupViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didPerformAction");

}

@end
