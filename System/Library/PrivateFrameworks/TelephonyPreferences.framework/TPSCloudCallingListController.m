@implementation TPSCloudCallingListController

- (OBPrivacyLinkController)privacyLinkController
{
  OBPrivacyLinkController *privacyLinkController;
  void *v4;
  id v5;
  OBPrivacyLinkController *v6;
  OBPrivacyLinkController *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  privacyLinkController = self->_privacyLinkController;
  if (!privacyLinkController)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getOBPrivacyLinkControllerClass_softClass;
    v13 = getOBPrivacyLinkControllerClass_softClass;
    if (!getOBPrivacyLinkControllerClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getOBPrivacyLinkControllerClass_block_invoke;
      v9[3] = &unk_1EA2CDA28;
      v9[4] = &v10;
      __getOBPrivacyLinkControllerClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    objc_msgSend(v5, "linkWithBundleIdentifier:", CFSTR("com.apple.onboarding.cloudcalling"));
    v6 = (OBPrivacyLinkController *)objc_claimAutoreleasedReturnValue();
    v7 = self->_privacyLinkController;
    self->_privacyLinkController = v6;

    privacyLinkController = self->_privacyLinkController;
  }
  return privacyLinkController;
}

- (OBPrivacyPresenter)privacyPresenter
{
  OBPrivacyPresenter *privacyPresenter;
  void *v4;
  id v5;
  OBPrivacyPresenter *v6;
  OBPrivacyPresenter *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  privacyPresenter = self->_privacyPresenter;
  if (!privacyPresenter)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getOBPrivacyPresenterClass_softClass;
    v13 = getOBPrivacyPresenterClass_softClass;
    if (!getOBPrivacyPresenterClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getOBPrivacyPresenterClass_block_invoke;
      v9[3] = &unk_1EA2CDA28;
      v9[4] = &v10;
      __getOBPrivacyPresenterClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    objc_msgSend(v5, "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.cloudcalling"));
    v6 = (OBPrivacyPresenter *)objc_claimAutoreleasedReturnValue();
    v7 = self->_privacyPresenter;
    self->_privacyPresenter = v6;

    -[OBPrivacyPresenter setPresentingViewController:](self->_privacyPresenter, "setPresentingViewController:", self);
    privacyPresenter = self->_privacyPresenter;
  }
  return privacyPresenter;
}

- (void)appendAboutWiFiCallingFooterToGroupSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSRange v17;

  v4 = a3;
  if (v4)
  {
    v16 = v4;
    -[TPSCloudCallingListController privacyLinkController](self, "privacyLinkController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "flow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedButtonTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "propertyForKey:", *MEMORY[0x1E0D80848]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v8, v7);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v7, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperty:forKey:", v11, *MEMORY[0x1E0D80818]);

    objc_msgSend(v16, "setProperty:forKey:", v9, *MEMORY[0x1E0D80838]);
    v17.location = objc_msgSend(v9, "rangeOfString:", v7);
    NSStringFromRange(v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperty:forKey:", v12, *MEMORY[0x1E0D80828]);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperty:forKey:", v13, *MEMORY[0x1E0D80830]);

    NSStringFromSelector(sel_presentPrivacyPresenter);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperty:forKey:", v14, *MEMORY[0x1E0D80820]);

    v4 = v16;
  }

}

- (void)presentOrUpdateViewController:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  TPSCloudCallingListController *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TPSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl(&dword_1DB4B7000, v5, OS_LOG_TYPE_DEFAULT, "Asked to present or update view controller: %@", buf, 0xCu);
  }

  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __63__TPSCloudCallingListController_presentOrUpdateViewController___block_invoke;
  v14 = &unk_1EA2CD690;
  v15 = v4;
  v16 = self;
  v6 = v4;
  v7 = (void (**)(_QWORD))MEMORY[0x1DF0AF980](&v11);
  -[TPSCloudCallingListController presentedViewController](self, "presentedViewController", v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    TPSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[TPSCloudCallingListController presentedViewController](self, "presentedViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_impl(&dword_1DB4B7000, v9, OS_LOG_TYPE_DEFAULT, "A view controller is already being presented: %@. Dismissing it and presenting the new one", buf, 0xCu);

    }
    -[TPSCloudCallingListController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v7);
  }
  else
  {
    v7[2](v7);
  }

}

void __63__TPSCloudCallingListController_presentOrUpdateViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "setModalPresentationStyle:", 2);
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__TPSCloudCallingListController_presentOrUpdateViewController___block_invoke_2;
  v6[3] = &unk_1EA2CD690;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "presentViewController:animated:completion:", v4, 1, v6);

}

uint64_t __63__TPSCloudCallingListController_presentOrUpdateViewController___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    TPSLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1DB4B7000, v3, OS_LOG_TYPE_DEFAULT, "Reloading specifiers because the presented view controller was a UIAlertController: %@", (uint8_t *)&v5, 0xCu);
    }

    return objc_msgSend(*(id *)(a1 + 40), "reloadSpecifiers");
  }
  return result;
}

- (void)presentPrivacyPresenter
{
  id v2;

  -[TPSCloudCallingListController privacyPresenter](self, "privacyPresenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "present");

}

- (void)privacySplashControllerDidRequestDismissal:(id)a3
{
  -[TPSCloudCallingListController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyPresenter, 0);
  objc_storeStrong((id *)&self->_privacyLinkController, 0);
}

@end
