@implementation OBPrivacyPresenter

+ (id)presenterForPrivacySplashWithBundle:(id)a3
{
  id v4;
  void *v5;
  int v6;
  OBPrivacyPresenter *v7;
  void *v8;
  OBPrivacySplashController *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.onboarding.imessagefacetime"));

  if (v6)
  {
    objc_msgSend(a1, "presenterForPrivacyUnifiedAboutWithIdentifiers:", &unk_1E37BC7F0);
    v7 = (OBPrivacyPresenter *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "privacyFlow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v7 = objc_alloc_init(OBPrivacyPresenter);
      v9 = -[OBPrivacySplashController initWithFlow:]([OBPrivacySplashController alloc], "initWithFlow:", v8);
      -[OBPrivacyPresenter setSplashController:](v7, "setSplashController:", v9);

      -[OBPrivacyPresenter splashController](v7, "splashController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setShowsLinkToUnifiedAbout:", 1);

      objc_msgSend(v8, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBPrivacyPresenter setPresentedIdentifiers:](v7, "setPresentedIdentifiers:", v12);

      -[OBPrivacyPresenter setModalPresentationStyle:](v7, "setModalPresentationStyle:", 2);
      -[OBPrivacyPresenter setAnimatePresentAndDismiss:](v7, "setAnimatePresentAndDismiss:", 1);
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

+ (id)presenterForPrivacySplashWithIdentifier:(id)a3
{
  void *v4;
  void *v5;

  +[OBBundle bundleWithIdentifier:](OBBundle, "bundleWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "presenterForPrivacySplashWithBundle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)presenterForPrivacySplashWithBundleAtPath:(id)a3
{
  void *v4;
  void *v5;

  +[OBBundle bundleAtPath:](OBBundle, "bundleAtPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "presenterForPrivacySplashWithBundle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)presenterForPrivacyUnifiedAbout
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "setCombinedController:", v3);

  objc_msgSend(v2, "setModalPresentationStyle:", 2);
  objc_msgSend(v2, "setAnimatePresentAndDismiss:", 1);
  return v2;
}

+ (id)presenterForPrivacyUnifiedAboutWithBundles:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  OBPrivacyCombinedController *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "identifier", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_opt_new();
  v12 = -[OBPrivacyCombinedController initWithBundles:]([OBPrivacyCombinedController alloc], "initWithBundles:", v5);
  objc_msgSend(v11, "setCombinedController:", v12);

  objc_msgSend(v11, "setPresentedIdentifiers:", v4);
  objc_msgSend(v11, "setModalPresentationStyle:", 2);
  objc_msgSend(v11, "setAnimatePresentAndDismiss:", 1);

  return v11;
}

+ (id)presenterForPrivacyUnifiedAboutWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[OBBundleManager sharedManager](OBBundleManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundlesWithIdentifiers:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "presenterForPrivacyUnifiedAboutWithBundles:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)presenterForPrivacyUnifiedAboutWithBundlesAtPaths:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        +[OBBundle bundleAtPath:](OBBundle, "bundleAtPath:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(a1, "presenterForPrivacyUnifiedAboutWithBundles:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setDisplayLanguage:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_displayLanguage, a3);
  v5 = a3;
  -[OBPrivacyPresenter splashController](self, "splashController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisplayLanguage:", v5);

  -[OBPrivacyPresenter combinedController](self, "combinedController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisplayLanguage:", v5);

}

- (void)_presenterDidDismiss
{
  void *v3;
  void (**v4)(void);

  -[OBPrivacyPresenter dismissHandler](self, "dismissHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[OBPrivacyPresenter dismissHandler](self, "dismissHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
  -[OBPrivacyPresenter setPresentedController:](self, "setPresentedController:", 0);
}

- (void)present
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  OBPrivacyModalNavigationController *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];
  _QWORD v17[5];
  _QWORD v18[5];

  -[OBPrivacyPresenter splashController](self, "splashController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[OBPrivacyPresenter combinedController](self, "combinedController"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[OBPrivacyPresenter presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[OBPrivacyPresenter setPresentedController:](self, "setPresentedController:", v3);
      -[OBPrivacyPresenter customTintColor](self, "customTintColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBPrivacyPresenter splashController](self, "splashController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCustomTintColor:", v5);

      -[OBPrivacyPresenter customTintColor](self, "customTintColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBPrivacyPresenter combinedController](self, "combinedController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCustomTintColor:", v7);

      v9 = -[OBPrivacyModalNavigationController initWithRootViewController:]([OBPrivacyModalNavigationController alloc], "initWithRootViewController:", v3);
      -[OBPrivacyPresenter customTintColor](self, "customTintColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBPrivacyModalNavigationController view](v9, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTintColor:", v10);

      -[OBPrivacyModalNavigationController setDarkMode:](v9, "setDarkMode:", -[OBPrivacyPresenter darkMode](self, "darkMode"));
      -[OBNavigationController setSupportedInterfaceOrientations:](v9, "setSupportedInterfaceOrientations:", self->_supportedInterfaceOrientations);
      -[OBPrivacyModalNavigationController setModalPresentationStyle:](v9, "setModalPresentationStyle:", self->_modalPresentationStyle);
      v12 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __29__OBPrivacyPresenter_present__block_invoke;
      v18[3] = &unk_1E37AA900;
      v18[4] = self;
      -[OBPrivacyModalNavigationController addDismissButtonWithPressedHandler:](v9, "addDismissButtonWithPressedHandler:", v18);
      -[OBPrivacyPresenter dismissHandler](self, "dismissHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[OBPrivacyModalNavigationController presentationController](v9, "presentationController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setDelegate:", self);

      }
      -[OBPrivacyPresenter presentingViewController](self, "presentingViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __29__OBPrivacyPresenter_present__block_invoke_2;
      v17[3] = &unk_1E37AA900;
      v17[4] = self;
      objc_msgSend(v15, "presentViewController:animated:completion:", v9, -[OBPrivacyPresenter animatePresentAndDismiss](self, "animatePresentAndDismiss"), v17);

    }
    else
    {
      _OBLoggingFacility();
      v9 = (OBPrivacyModalNavigationController *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v9->super.super.super.super.super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_199FE5000, &v9->super.super.super.super.super, OS_LOG_TYPE_DEFAULT, "Tried to present with no presenter", v16, 2u);
      }
    }

  }
}

uint64_t __29__OBPrivacyPresenter_present__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismiss");
}

void __29__OBPrivacyPresenter_present__block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "presentationCompletionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentationCompletionHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (void)presentInNavigationStack:(id)a3
{
  -[OBPrivacyPresenter presentInNavigationStack:animated:](self, "presentInNavigationStack:animated:", a3, 1);
}

- (void)presentInNavigationStack:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a3)
  {
    v5 = a4;
    -[OBPrivacyPresenter setPresentingViewController:](self, "setPresentingViewController:");
    -[OBPrivacyPresenter splashController](self, "splashController");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6
      || (-[OBPrivacyPresenter combinedController](self, "combinedController"),
          (v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = (id)v6;
      -[OBPrivacyPresenter presentingViewController](self, "presentingViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pushViewController:animated:", v8, v5);

    }
  }
  else
  {
    -[OBPrivacyPresenter present](self, "present", 0, a4);
  }
}

- (void)dismiss
{
  void *v3;
  _BOOL8 v4;
  _QWORD v5[5];

  -[OBPrivacyPresenter presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[OBPrivacyPresenter animatePresentAndDismiss](self, "animatePresentAndDismiss");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__OBPrivacyPresenter_dismiss__block_invoke;
  v5[3] = &unk_1E37AA900;
  v5[4] = self;
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", v4, v5);

}

uint64_t __29__OBPrivacyPresenter_dismiss__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presenterDidDismiss");
}

- (void)setDarkMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  id v13;

  v3 = a3;
  self->_darkMode = a3;
  -[OBPrivacyPresenter splashController](self, "splashController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDarkMode:", v3);

  -[OBPrivacyPresenter combinedController](self, "combinedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDarkMode:", v3);

  -[OBPrivacyPresenter splashController](self, "splashController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[OBPrivacyPresenter combinedController](self, "combinedController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v9;

  objc_msgSend(v13, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v13, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDarkMode:", v3);

  }
}

- (id)dismissHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (OBPrivacySplashController)splashController
{
  return (OBPrivacySplashController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSplashController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OBPrivacyCombinedController)combinedController
{
  return (OBPrivacyCombinedController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCombinedController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)displayLanguage
{
  return self->_displayLanguage;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (UIColor)customTintColor
{
  return self->_customTintColor;
}

- (void)setCustomTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_customTintColor, a3);
}

- (BOOL)underlineLinks
{
  return self->_underlineLinks;
}

- (void)setUnderlineLinks:(BOOL)a3
{
  self->_underlineLinks = a3;
}

- (BOOL)darkMode
{
  return self->_darkMode;
}

- (BOOL)usesFullScreenPresentation
{
  return self->_usesFullScreenPresentation;
}

- (void)setUsesFullScreenPresentation:(BOOL)a3
{
  self->_usesFullScreenPresentation = a3;
}

- (int64_t)modalPresentationStyle
{
  return self->_modalPresentationStyle;
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  self->_modalPresentationStyle = a3;
}

- (unint64_t)supportedInterfaceOrientations
{
  return self->_supportedInterfaceOrientations;
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_supportedInterfaceOrientations = a3;
}

- (UIViewController)presentedController
{
  return (UIViewController *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPresentedController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSArray)presentedIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPresentedIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (id)presentationCompletionHandler
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setPresentationCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (BOOL)animatePresentAndDismiss
{
  return self->_animatePresentAndDismiss;
}

- (void)setAnimatePresentAndDismiss:(BOOL)a3
{
  self->_animatePresentAndDismiss = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_presentedIdentifiers, 0);
  objc_storeStrong((id *)&self->_presentedController, 0);
  objc_storeStrong((id *)&self->_customTintColor, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_displayLanguage, 0);
  objc_storeStrong((id *)&self->_combinedController, 0);
  objc_storeStrong((id *)&self->_splashController, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
}

@end
