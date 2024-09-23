@implementation PNPWizardViewController

- (void)didCompleteAccessoryOnboarding:(id)a3 pairingSuccessful:(BOOL)a4
{
  -[PNPWizardViewController setFindMyCoordinator:](self, "setFindMyCoordinator:", 0, a4);
  -[PNPWizardViewController processNextController](self, "processNextController");
}

- (void)viewDidLoad
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[16];

  v3 = os_log_create("com.apple.pencilpairingui", ");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22ACC1000, v3, OS_LOG_TYPE_DEFAULT, "Did load wizard view controller", buf, 2u);
  }

  v12.receiver = self;
  v12.super_class = (Class)PNPWizardViewController;
  -[PNPWizardViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[PNPWizardViewController navigationBar](self, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBarStyle:", 4);

  -[PNPWizardViewController navigationBar](self, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDF6AC8]);
  objc_msgSend(v5, "setBackgroundImage:forBarMetrics:", v6, 0);

  v7 = objc_alloc_init(MEMORY[0x24BDF6AC8]);
  -[PNPWizardViewController navigationBar](self, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShadowImage:", v7);

  -[PNPWizardViewController navigationBar](self, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslucent:", 1);

  -[PNPWizardViewController setDelegate:](self, "setDelegate:", self);
  objc_msgSend(MEMORY[0x24BDE33F0], "sharedSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPWizardViewController setTextInputSettings:](self, "setTextInputSettings:", v10);

  -[PNPWizardViewController textInputSettings](self, "textInputSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPWizardViewController setHasScribbleKeyboard:](self, "setHasScribbleKeyboard:", objc_msgSend(v11, "supportedKeyboardLocaleExists"));

  -[PNPWizardViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 1);
  -[PNPWizardViewController setControllerIndex:](self, "setControllerIndex:", -1);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "viewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "controllerType");
    -[PNPWizardViewController controllerQueue](self, "controllerQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "indexOfObject:", v14);

    v16 = os_log_create("com.apple.pencilpairingui", ");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134217984;
      v18 = v15;
      _os_log_impl(&dword_22ACC1000, v16, OS_LOG_TYPE_DEFAULT, "Setting index for PNPWelcomeController: %ld", (uint8_t *)&v17, 0xCu);
    }

    -[PNPWizardViewController setControllerIndex:](self, "setControllerIndex:", v15);
  }

}

- (PNPDeviceState)deviceState
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[PNPWizardViewController wizardDelegate](self, "wizardDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PNPWizardViewController wizardDelegate](self, "wizardDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (PNPDeviceState *)v6;
}

- (void)prepareForPresentation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[PNPWizardViewController wizardDelegate](self, "wizardDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldShowWhatsNewController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v3, "deviceType");
  else
    v5 = 2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "deviceState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PNPWizardViewController setDeviceState:](self, "setDeviceState:", v6);

  }
  -[PNPWizardViewController setShowingWhatsNew:](self, "setShowingWhatsNew:", v4);
  -[PNPWizardViewController setDeviceType:](self, "setDeviceType:", v5);
  v7 = os_log_create("com.apple.pencilpairingui", ");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218240;
    v11 = v5;
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_22ACC1000, v7, OS_LOG_TYPE_DEFAULT, "PNPWizardViewController prepareForPresentation. Device type: %ld, shouldShowWhatsNew: %d", (uint8_t *)&v10, 0x12u);
  }

  -[PNPWizardViewController createControllerPlanForDeviceType:isWhatsNew:](self, "createControllerPlanForDeviceType:isWhatsNew:", v5, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPWizardViewController setControllerQueue:](self, "setControllerQueue:", v8);

  if (-[PNPWizardViewController deviceType](self, "deviceType") == 4)
  {
    +[PNPSqueezeThresholdController sharedController](PNPSqueezeThresholdController, "sharedController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "initializeToDefaultThresholdIfUninitialized");

  }
  -[PNPWizardViewController prewarmFMUIControllerIfNecessary](self, "prewarmFMUIControllerIfNecessary");
  -[PNPWizardViewController processNextController](self, "processNextController");

}

- (void)processNextController
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v3 = -[PNPWizardViewController controllerIndex](self, "controllerIndex");
  -[PNPWizardViewController controllerQueue](self, "controllerQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v7 = v3 < 0 && v5 > 0;
  if (v7)
  {
    -[PNPWizardViewController controllerQueue](self, "controllerQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
LABEL_12:
    v11 = objc_msgSend(v9, "integerValue");

    goto LABEL_13;
  }
  v11 = 0;
  v10 = -1;
  if ((v3 & 0x8000000000000000) == 0 && v3 < v5 - 1)
  {
    v10 = v3 + 1;
    -[PNPWizardViewController controllerQueue](self, "controllerQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_13:
  -[PNPWizardViewController setControllerIndex:](self, "setControllerIndex:", v10);
  if (v10 == -1 || v11 == 7)
  {
    -[PNPWizardViewController exit](self, "exit");
  }
  else if (v11 == 5)
  {
    -[PNPWizardViewController showFindMyController](self, "showFindMyController");
  }
  else
  {
    if (v10 == v5 - 1)
      v12 = 2;
    else
      v12 = 1;
    +[PNPWelcomeController controllerWithType:buttonType:deviceType:delegate:](PNPWelcomeController, "controllerWithType:buttonType:deviceType:delegate:", v11, v12, -[PNPWizardViewController deviceType](self, "deviceType"), self);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[PNPWizardViewController wizardDelegate](self, "wizardDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[PNPWizardViewController wizardDelegate](self, "wizardDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "backgroundColorForWizardController:", self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setBackgroundColor:", v15);

    }
    if (v7)
    {
      v17 = (void *)MEMORY[0x24BDF6F90];
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __48__PNPWizardViewController_processNextController__block_invoke;
      v19[3] = &unk_24F4E5270;
      v19[4] = self;
      v20 = v18;
      objc_msgSend(v17, "performWithoutAnimation:", v19);

    }
    else
    {
      -[PNPWizardViewController pushViewController:animated:](self, "pushViewController:animated:", v18, 1);
    }

  }
}

void __48__PNPWizardViewController_processNextController__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)exit
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  char v15;
  uint8_t v16[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = os_log_create("com.apple.pencilpairingui", ");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22ACC1000, v3, OS_LOG_TYPE_DEFAULT, "PNPWizardController exit", buf, 2u);
  }

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.sharingd"));
  *(_QWORD *)buf = 0;
  v13 = buf;
  v14 = 0x2020000000;
  v15 = 0;
  v15 = objc_msgSend(v4, "BOOLForKey:", CFSTR("hasSeenScribbleEducationPanelsKey"));
  -[PNPWizardViewController controllerQueue](self, "controllerQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __31__PNPWizardViewController_exit__block_invoke;
  v11[3] = &unk_24F4E57C0;
  v11[4] = buf;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

  objc_msgSend(v4, "setBool:forKey:", 1, CFSTR("hasEverShownEduUI"));
  v6 = os_log_create("com.apple.pencilpairingui", ");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_22ACC1000, v6, OS_LOG_TYPE_DEFAULT, "Setting PPUIHasShownEducationUIKey", v16, 2u);
  }

  objc_msgSend(v4, "setBool:forKey:", v13[24], CFSTR("hasSeenScribbleEducationPanelsKey"));
  v7 = os_log_create("com.apple.pencilpairingui", ");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v13[24];
    *(_DWORD *)v16 = 67109120;
    v17 = v8;
    _os_log_impl(&dword_22ACC1000, v7, OS_LOG_TYPE_DEFAULT, "Setting PPUIHasSeenScribbleEducationPanelsKey: %d", v16, 8u);
  }

  objc_msgSend(v4, "setInteger:forKey:", 2, CFSTR("lastSeenWhatsNewVersionKey"));
  v9 = os_log_create("com.apple.pencilpairingui", ");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v16 = 67109120;
    v17 = 2;
    _os_log_impl(&dword_22ACC1000, v9, OS_LOG_TYPE_DEFAULT, "Setting PPUILastSeenWhatsNewVersionKey: %d", v16, 8u);
  }

  objc_msgSend(v4, "synchronize");
  -[PNPWizardViewController wizardDelegate](self, "wizardDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "wizardViewRequestsDismiss:", self);

  _Block_object_dispose(buf, 8);
}

void __31__PNPWizardViewController_exit__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  char v5;
  BOOL v6;
  uint64_t v7;
  char v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    v5 = 1;
  }
  else
  {
    v9 = v3;
    v6 = objc_msgSend(v3, "integerValue") == 3;
    v3 = v9;
    v5 = v6;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_BYTE *)(v4 + 24) = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v7 + 24))
  {
    v8 = 1;
  }
  else
  {
    v10 = v3;
    v6 = objc_msgSend(v3, "integerValue") == 1;
    v3 = v10;
    v8 = v6;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_BYTE *)(v7 + 24) = v8;

}

- (void)prewarmFMUIControllerIfNecessary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PNPWizardViewController controllerQueue](self, "controllerQueue", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "integerValue") == 5)
        {
          -[PNPWizardViewController prewarmFMUIController](self, "prewarmFMUIController");
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)setFindMyCoordinator:(id)a3
{
  FMUIAccessoryOnboardingCoordinator **p_findMyCoordinator;
  _BOOL8 v5;

  p_findMyCoordinator = &self->_findMyCoordinator;
  objc_storeStrong((id *)&self->_findMyCoordinator, a3);
  v5 = -[PNPWizardViewController didCreateFindMyCoordinator](self, "didCreateFindMyCoordinator")
    || *p_findMyCoordinator != 0;
  -[PNPWizardViewController setDidCreateFindMyCoordinator:](self, "setDidCreateFindMyCoordinator:", v5);
}

- (void)prewarmFMUIController
{
  OUTLINED_FUNCTION_0(&dword_22ACC1000, a1, a3, "Prewarm Error: nil pencilUUID needed create AccessoryOnboardingCoordinator", a5, a6, a7, a8, 0);
}

- (id)createOnboardingControllerWithPencilUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  Class (*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:", CFSTR("PencilFindMyPin"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v8 = (void *)getFMUIDiscoveredAccessoryClass_softClass;
  v23 = getFMUIDiscoveredAccessoryClass_softClass;
  if (!getFMUIDiscoveredAccessoryClass_softClass)
  {
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __getFMUIDiscoveredAccessoryClass_block_invoke;
    v18 = &unk_24F4E57E8;
    v19 = &v20;
    __getFMUIDiscoveredAccessoryClass_block_invoke((uint64_t)&v15);
    v8 = (void *)v21[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v20, 8);
  v10 = (void *)objc_msgSend([v9 alloc], "initWithIdentifier:productType:productImage:", v4, 2, v7);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v11 = (void *)getFMUIAccessoryOnboardingCoordinatorClass_softClass;
  v23 = getFMUIAccessoryOnboardingCoordinatorClass_softClass;
  if (!getFMUIAccessoryOnboardingCoordinatorClass_softClass)
  {
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __getFMUIAccessoryOnboardingCoordinatorClass_block_invoke;
    v18 = &unk_24F4E57E8;
    v19 = &v20;
    __getFMUIAccessoryOnboardingCoordinatorClass_block_invoke((uint64_t)&v15);
    v11 = (void *)v21[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v20, 8);
  v13 = (void *)objc_msgSend([v12 alloc], "initWithPresenter:accessory:", self, v10);

  return v13;
}

- (void)showFindMyController
{
  OUTLINED_FUNCTION_0(&dword_22ACC1000, a1, a3, "ShowFindMyController Error: nil pencilUUID for FMUIDiscoveredAccessory needed create FMUIAccessoryOnboardingCoordinator", a5, a6, a7, a8, 0);
}

- (id)controllerForType:(int64_t)a3 buttonType:(int64_t)a4
{
  return +[PNPWelcomeController controllerWithType:buttonType:deviceType:delegate:](PNPWelcomeController, "controllerWithType:buttonType:deviceType:delegate:", a3, a4, -[PNPWizardViewController deviceType](self, "deviceType"), self);
}

- (id)createControllerPlanForDeviceType:(int64_t)a3 isWhatsNew:(BOOL)a4
{
  void *v5;
  void *v6;
  uint64_t v7;

  if (a4)
    -[PNPWizardViewController whatsNewControllerQueueForType:](self, "whatsNewControllerQueueForType:", a3);
  else
    -[PNPWizardViewController fullEducationControllerQueueForType:](self, "fullEducationControllerQueueForType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PNPWizardViewController hasScribbleKeyboard](self, "hasScribbleKeyboard"))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v6, "removeObject:", &unk_24F4F6100);
    v7 = objc_msgSend(v6, "copy");

    v5 = (void *)v7;
  }
  return v5;
}

- (id)whatsNewControllerQueueForType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return (id)qword_24F4E5820[a3];
}

- (id)fullEducationControllerQueueForType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return (id)qword_24F4E5848[a3];
}

+ (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(MEMORY[0x24BE6E458], "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)welcomeControllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[PNPWelcomeController controllerWithType:buttonType:deviceType:delegate:](PNPWelcomeController, "controllerWithType:buttonType:deviceType:delegate:", a3, a4, a5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPWizardViewController wizardDelegate](self, "wizardDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PNPWizardViewController wizardDelegate](self, "wizardDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backgroundColorForWizardController:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

  }
  return v6;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (PNPWizardViewDelegate)wizardDelegate
{
  return (PNPWizardViewDelegate *)objc_loadWeakRetained((id *)&self->_wizardDelegate);
}

- (void)setWizardDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_wizardDelegate, a3);
}

- (BOOL)showingWhatsNew
{
  return self->_showingWhatsNew;
}

- (void)setShowingWhatsNew:(BOOL)a3
{
  self->_showingWhatsNew = a3;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (void)setDeviceState:(id)a3
{
  objc_storeStrong((id *)&self->_deviceState, a3);
}

- (PKTextInputSettings)textInputSettings
{
  return self->_textInputSettings;
}

- (void)setTextInputSettings:(id)a3
{
  objc_storeStrong((id *)&self->_textInputSettings, a3);
}

- (NSArray)controllerQueue
{
  return self->_controllerQueue;
}

- (void)setControllerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_controllerQueue, a3);
}

- (int64_t)controllerIndex
{
  return self->_controllerIndex;
}

- (void)setControllerIndex:(int64_t)a3
{
  self->_controllerIndex = a3;
}

- (BOOL)hasScribbleKeyboard
{
  return self->_hasScribbleKeyboard;
}

- (void)setHasScribbleKeyboard:(BOOL)a3
{
  self->_hasScribbleKeyboard = a3;
}

- (BOOL)didCreateFindMyCoordinator
{
  return self->_didCreateFindMyCoordinator;
}

- (void)setDidCreateFindMyCoordinator:(BOOL)a3
{
  self->_didCreateFindMyCoordinator = a3;
}

- (FMUIAccessoryOnboardingCoordinator)findMyCoordinator
{
  return self->_findMyCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findMyCoordinator, 0);
  objc_storeStrong((id *)&self->_controllerQueue, 0);
  objc_storeStrong((id *)&self->_textInputSettings, 0);
  objc_storeStrong((id *)&self->_deviceState, 0);
  objc_destroyWeak((id *)&self->_wizardDelegate);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
