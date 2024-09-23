@implementation OBPrivacyModalNavigationController

- (void)addDismissButtonWithPressedHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];

  v4 = a3;
  -[OBPrivacyModalNavigationController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[OBPrivacyModalNavigationController setDismissButtonPressedHandler:](self, "setDismissButtonPressedHandler:", v4);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__doneButtonPressed);
    -[OBPrivacyModalNavigationController viewControllers](self, "viewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRightBarButtonItem:", v7);

  }
  else
  {
    _OBLoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_199FE5000, v11, OS_LOG_TYPE_DEFAULT, "addDismissButtonWithHandler: Need a view controller before we can add a button.", v12, 2u);
    }

  }
}

- (void)_doneButtonPressed
{
  void *v3;
  void (**v4)(void);

  -[OBPrivacyModalNavigationController dismissButtonPressedHandler](self, "dismissButtonPressedHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[OBPrivacyModalNavigationController dismissButtonPressedHandler](self, "dismissButtonPressedHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    -[OBPrivacyModalNavigationController setDismissButtonPressedHandler:](self, "setDismissButtonPressedHandler:", 0);
  }
}

- (void)setDarkMode:(BOOL)a3
{
  self->_darkMode = a3;
  -[OBPrivacyModalNavigationController setNeedsUserInterfaceAppearanceUpdate](self, "setNeedsUserInterfaceAppearanceUpdate");
}

- (int64_t)preferredUserInterfaceStyle
{
  objc_super v3;

  if (self->_darkMode)
    return 2;
  v3.receiver = self;
  v3.super_class = (Class)OBPrivacyModalNavigationController;
  return -[OBPrivacyModalNavigationController preferredUserInterfaceStyle](&v3, sel_preferredUserInterfaceStyle);
}

- (unint64_t)supportedInterfaceOrientations
{
  unint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OBPrivacyModalNavigationController;
  if (-[OBNavigationController supportedInterfaceOrientations](&v10, sel_supportedInterfaceOrientations))
    return -[OBNavigationController supportedInterfaceOrientations](&v9, sel_supportedInterfaceOrientations, v8.receiver, v8.super_class, self, OBPrivacyModalNavigationController);
  -[OBPrivacyModalNavigationController presentingViewController](self, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[OBPrivacyModalNavigationController presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "supportedInterfaceOrientations");

    return v4;
  }
  return -[OBNavigationController supportedInterfaceOrientations](&v8, sel_supportedInterfaceOrientations, self, OBPrivacyModalNavigationController, v9.receiver, v9.super_class);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isDarkMode
{
  return self->_darkMode;
}

- (id)dismissButtonPressedHandler
{
  return objc_getProperty(self, a2, 1424, 1);
}

- (void)setDismissButtonPressedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1424);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissButtonPressedHandler, 0);
}

@end
