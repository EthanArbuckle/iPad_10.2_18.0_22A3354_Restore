@implementation BFFFaceIDViewController

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  id BKUIPearlEnrollControllerClass;
  _QWORD v6[5];

  v4 = (void (**)(id, uint64_t))a3;
  BKUIPearlEnrollControllerClass = getBKUIPearlEnrollControllerClass();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__BFFFaceIDViewController_performExtendedInitializationWithCompletion___block_invoke;
  v6[3] = &unk_24D2342B0;
  v6[4] = self;
  objc_msgSend(BKUIPearlEnrollControllerClass, "preloadWithCompletion:", v6);
  if (v4)
    v4[2](v4, 1);

}

void __71__BFFFaceIDViewController_performExtendedInitializationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 968);
  *(_QWORD *)(v5 + 968) = v3;
  v7 = v3;

  objc_sync_exit(v4);
}

- (BFFFaceIDViewController)init
{
  BFFFaceIDViewController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BFFFaceIDViewController;
  result = -[BFFFaceIDViewController initWithNibName:bundle:](&v3, sel_initWithNibName_bundle_, 0, 0);
  if (result)
    result->_enrollmentConfiguration = 0;
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  objc_super v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;

  v39.receiver = self;
  v39.super_class = (Class)BFFFaceIDViewController;
  -[BFFFaceIDViewController viewDidLoad](&v39, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BACK_BUTTON_TITLE"), &stru_24D234A48, CFSTR("Pearl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFFaceIDViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackButtonTitle:", v4);

  v45 = 0;
  v46 = &v45;
  v47 = 0x2050000000;
  v6 = (void *)getBKDeviceClass_softClass;
  v48 = getBKDeviceClass_softClass;
  if (!getBKDeviceClass_softClass)
  {
    v40 = MEMORY[0x24BDAC760];
    v41 = 3221225472;
    v42 = __getBKDeviceClass_block_invoke;
    v43 = &unk_24D234208;
    v44 = &v45;
    __getBKDeviceClass_block_invoke((uint64_t)&v40);
    v6 = (void *)v46[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v45, 8);
  v45 = 0;
  v46 = &v45;
  v47 = 0x2050000000;
  v8 = (void *)getBKDeviceDescriptorClass_softClass;
  v48 = getBKDeviceDescriptorClass_softClass;
  if (!getBKDeviceDescriptorClass_softClass)
  {
    v40 = MEMORY[0x24BDAC760];
    v41 = 3221225472;
    v42 = __getBKDeviceDescriptorClass_block_invoke;
    v43 = &unk_24D234208;
    v44 = &v45;
    __getBKDeviceDescriptorClass_block_invoke((uint64_t)&v40);
    v8 = (void *)v46[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v45, 8);
  objc_msgSend(v9, "deviceDescriptorForType:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceWithDescriptor:error:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BFFFaceIDViewController enrollmentConfiguration](self, "enrollmentConfiguration") == 3)
  {
    v45 = 0;
    v46 = &v45;
    v47 = 0x2050000000;
    v12 = (void *)getBKUIPeriocularEnableSplashViewControllerClass_softClass;
    v48 = getBKUIPeriocularEnableSplashViewControllerClass_softClass;
    if (!getBKUIPeriocularEnableSplashViewControllerClass_softClass)
    {
      v40 = MEMORY[0x24BDAC760];
      v41 = 3221225472;
      v42 = __getBKUIPeriocularEnableSplashViewControllerClass_block_invoke;
      v43 = &unk_24D234208;
      v44 = &v45;
      __getBKUIPeriocularEnableSplashViewControllerClass_block_invoke((uint64_t)&v40);
      v12 = (void *)v46[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v45, 8);
    v14 = [v13 alloc];
    v37[4] = self;
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __38__BFFFaceIDViewController_viewDidLoad__block_invoke;
    v38[3] = &unk_24D2341B8;
    v38[4] = self;
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __38__BFFFaceIDViewController_viewDidLoad__block_invoke_2;
    v37[3] = &unk_24D2341B8;
    v15 = objc_msgSend(v14, "initInBuddy:bkDevice:upsell:withEndEnrollmentActionPrimary:enrollmentActionSecondary:", 1, v11, 0, v38, v37);
  }
  else
  {
    v45 = 0;
    v46 = &v45;
    v47 = 0x2050000000;
    v16 = (void *)getBKUIFaceIDSplashViewControllerClass_softClass;
    v48 = getBKUIFaceIDSplashViewControllerClass_softClass;
    v17 = MEMORY[0x24BDAC760];
    if (!getBKUIFaceIDSplashViewControllerClass_softClass)
    {
      v40 = MEMORY[0x24BDAC760];
      v41 = 3221225472;
      v42 = __getBKUIFaceIDSplashViewControllerClass_block_invoke;
      v43 = &unk_24D234208;
      v44 = &v45;
      __getBKUIFaceIDSplashViewControllerClass_block_invoke((uint64_t)&v40);
      v16 = (void *)v46[3];
    }
    v18 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v45, 8);
    v35[4] = self;
    v36[0] = v17;
    v36[1] = 3221225472;
    v36[2] = __38__BFFFaceIDViewController_viewDidLoad__block_invoke_3;
    v36[3] = &unk_24D2341B8;
    v36[4] = self;
    v35[0] = v17;
    v35[1] = 3221225472;
    v35[2] = __38__BFFFaceIDViewController_viewDidLoad__block_invoke_4;
    v35[3] = &unk_24D2341B8;
    v15 = objc_msgSend([v18 alloc], "initInBuddy:bkDevice:withEndEnrollmentActionPrimary:enrollmentActionSecondary:", 1, v11, v36, v35);
  }
  v19 = (void *)v15;
  -[BFFFaceIDViewController setContentController:](self, "setContentController:", v15);

  -[BFFFaceIDViewController contentController](self, "contentController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFFaceIDViewController addChildViewController:](self, "addChildViewController:", v20);

  -[BFFFaceIDViewController contentController](self, "contentController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[BFFFaceIDViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFFaceIDViewController contentController](self, "contentController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", v25);

  -[BFFFaceIDViewController contentController](self, "contentController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFFaceIDViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "pinToEdges:", v28);

  -[BFFFaceIDViewController contentController](self, "contentController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "didMoveToParentViewController:", self);

  -[BFFFaceIDViewController contentController](self, "contentController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "headerView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("FACE_ID_DETAIL"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localizedStringForKey:value:table:", v33, &stru_24D234A48, CFSTR("Pearl"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setDetailText:", v34);

}

uint64_t __38__BFFFaceIDViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didSelectEnroll");
}

uint64_t __38__BFFFaceIDViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didSelectSkip");
}

uint64_t __38__BFFFaceIDViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didSelectEnroll");
}

uint64_t __38__BFFFaceIDViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didSelectSkip");
}

- (void)setCompletesOnCancel:(BOOL)a3
{
  void *v4;
  id v5;
  id v6;

  if (self->_completesOnCancel != a3)
  {
    self->_completesOnCancel = a3;
    if (a3)
    {
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__userDidTapCancelButton_);
      -[BFFFaceIDViewController navigationItem](self, "navigationItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setLeftBarButtonItem:animated:", v5, 1);

    }
    else
    {
      -[BFFFaceIDViewController navigationItem](self, "navigationItem");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLeftBarButtonItem:animated:", 0, 1);

    }
  }
}

- (void)_userDidTapCancelButton:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_214875000, v4, OS_LOG_TYPE_DEFAULT, "Face ID Enroll user did cancel", v7, 2u);
  }

  -[BFFFaceIDViewController resetColorsAnimated:](self, "resetColorsAnimated:", 0);
  -[BFFFaceIDViewController faceIDViewControllerDelegate](self, "faceIDViewControllerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = self;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "faceIDViewController:didCompleteWithResult:pushedViewControllers:", self, 2, v6);

}

- (void)resetColorsAnimated:(BOOL)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__BFFFaceIDViewController_resetColorsAnimated___block_invoke;
  v4[3] = &unk_24D2341B8;
  v4[4] = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__BFFFaceIDViewController_resetColorsAnimated___block_invoke_2;
  v3[3] = &unk_24D2342D8;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v4, v3, 0.3);
}

void __47__BFFFaceIDViewController_resetColorsAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", 0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "_systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

void __47__BFFFaceIDViewController_resetColorsAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyThemeToNavigationController:", v2);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id BKUIPearlEnrollControllerClass;
  _QWORD v6[5];
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BFFFaceIDViewController;
  -[BFFFaceIDViewController viewWillAppear:](&v7, sel_viewWillAppear_);
  if ((-[BFFFaceIDViewController isMovingToParentViewController](self, "isMovingToParentViewController") & 1) == 0)
  {
    BKUIPearlEnrollControllerClass = getBKUIPearlEnrollControllerClass();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __42__BFFFaceIDViewController_viewWillAppear___block_invoke;
    v6[3] = &unk_24D2342B0;
    v6[4] = self;
    objc_msgSend(BKUIPearlEnrollControllerClass, "preloadWithCompletion:", v6);
  }
  -[BFFFaceIDViewController resetColorsAnimated:](self, "resetColorsAnimated:", v3);
}

void __42__BFFFaceIDViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 968);
  *(_QWORD *)(v5 + 968) = v3;
  v7 = v3;

  objc_sync_exit(v4);
}

- (void)willStartOver
{
  -[BFFFaceIDViewController resetColorsAnimated:](self, "resetColorsAnimated:", 0);
}

- (void)controllerWasPopped
{
  BKUIPearlEnrollControllerPreloadedState *preloadedState;
  BFFFaceIDViewController *obj;

  obj = self;
  objc_sync_enter(obj);
  preloadedState = obj->_preloadedState;
  obj->_preloadedState = 0;

  objc_sync_exit(obj);
}

- (void)_didSelectEnroll
{
  BFFFaceIDViewController *v2;
  BKUIPearlEnrollControllerPreloadedState *preloadedState;
  BKUIPearlEnrollControllerPreloadedState *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v2 = self;
  objc_sync_enter(v2);
  preloadedState = v2->_preloadedState;
  v2->_preloadedState = 0;
  v4 = preloadedState;

  objc_sync_exit(v2);
  v14 = (id)objc_msgSend(objc_alloc((Class)getBKUIPearlEnrollControllerClass()), "initWithPreloadedState:", v4);

  objc_msgSend(v14, "setInSheet:", -[BFFFaceIDViewController _sheetMode](v2, "_sheetMode"));
  objc_msgSend(v14, "setEnrollmentConfiguration:", -[BFFFaceIDViewController enrollmentConfiguration](v2, "enrollmentConfiguration"));
  -[BFFFaceIDViewController faceIDViewControllerDelegate](v2, "faceIDViewControllerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passcodeForFaceIDViewController:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v14, "primeWithPasscode:", v7);
  }
  else
  {
    -[BFFFaceIDViewController authContext](v2, "authContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[BFFFaceIDViewController authContext](v2, "authContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "externalizedContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "primeWithExternalizedAuthContext:", v10);

    }
  }
  objc_msgSend(v14, "setDelegate:", v2);
  objc_msgSend(v14, "setInBuddy:", 1);
  v11 = objc_alloc_init(MEMORY[0x24BEBD790]);
  objc_msgSend(v11, "configureWithTransparentBackground");
  objc_msgSend(v14, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setStandardAppearance:", v11);

  -[BFFFaceIDViewController navigationController](v2, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pushViewController:animated:", v14, 1);

}

- (void)_didSelectSkip
{
  BFFFaceIDViewController *v2;
  BKUIPearlEnrollControllerPreloadedState *preloadedState;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  preloadedState = v2->_preloadedState;
  v2->_preloadedState = 0;

  objc_sync_exit(v2);
  -[BFFFaceIDViewController faceIDViewControllerDelegate](v2, "faceIDViewControllerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "faceIDViewController:didCompleteWithResult:pushedViewControllers:", v2, 1, v5);

}

- (void)pearlEnrollController:(id)a3 finishedEnrollWithError:(id)a4
{
  void *v4;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BFFFaceIDViewController *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char isKindOfClass;
  void *v30;
  id v31;
  _BOOL4 v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  _BYLoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v10 = 0;
      v11 = v8;
    }
    else if (v8)
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v8, "domain");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v4, objc_msgSend(v8, "code"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 1;
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
    *(_DWORD *)buf = 138543362;
    v38 = v11;
    _os_log_impl(&dword_214875000, v9, OS_LOG_TYPE_DEFAULT, "Enroll finished with error: %{public}@", buf, 0xCu);
    if (v10)
    {

    }
  }

  if (!v8)
  {
    -[BFFFaceIDViewController resetColorsAnimated:](self, "resetColorsAnimated:", 0);
    -[BFFFaceIDViewController faceIDViewControllerDelegate](self, "faceIDViewControllerDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = self;
    v34[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v19;
    v25 = self;
    v26 = 0;
LABEL_21:
    objc_msgSend(v24, "faceIDViewController:didCompleteWithResult:pushedViewControllers:", v25, v26, v23);
LABEL_31:

    goto LABEL_32;
  }
  objc_msgSend(v8, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  getBKUIPearlEnrollErrorDomain();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "isEqualToString:", v14) || objc_msgSend(v8, "code") != -1)
  {

    goto LABEL_13;
  }
  v32 = -[BFFFaceIDViewController completesOnCancel](self, "completesOnCancel");

  if (v32)
  {
    -[BFFFaceIDViewController resetColorsAnimated:](self, "resetColorsAnimated:", 0);
    -[BFFFaceIDViewController faceIDViewControllerDelegate](self, "faceIDViewControllerDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = self;
    v36[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v19;
    v25 = self;
    v26 = 2;
    goto LABEL_21;
  }
LABEL_13:
  objc_msgSend(v8, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  getBKUIPearlEnrollErrorDomain();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualToString:", v16))
  {
    v17 = objc_msgSend(v8, "code");

    if (v17 == -2)
    {
      -[BFFFaceIDViewController resetColorsAnimated:](self, "resetColorsAnimated:", 0);
      objc_msgSend(v8, "userInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "domain");
      v20 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject isEqualToString:](v20, "isEqualToString:", CFSTR("com.apple.preferences.biokit")))
      {
        v21 = objc_msgSend(v19, "code");

        if (v21 != 8)
        {
          v22 = 1;
          goto LABEL_30;
        }
        _BYLoggingFacility();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_214875000, v20, OS_LOG_TYPE_DEFAULT, "Enroll observed interlock error", buf, 2u);
        }
        v22 = 3;
      }
      else
      {
        v22 = 1;
      }

LABEL_30:
      -[BFFFaceIDViewController faceIDViewControllerDelegate](self, "faceIDViewControllerDelegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = self;
      v35[1] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "faceIDViewController:didCompleteWithResult:pushedViewControllers:", self, v22, v33);

      goto LABEL_31;
    }
  }
  else
  {

  }
  -[BFFFaceIDViewController navigationController](self, "navigationController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "topViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  getBKUIPearlEnrollControllerClass();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[BFFFaceIDViewController navigationController](self, "navigationController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (id)objc_msgSend(v30, "popToViewController:animated:", self, 1);

    -[BFFFaceIDViewController resetColorsAnimated:](self, "resetColorsAnimated:", 1);
  }
LABEL_32:

}

- (BOOL)_sheetMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") == 1)
  {
    -[BFFFaceIDViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "modalPresentationStyle") == 2)
    {
      -[BFFFaceIDViewController navigationController](self, "navigationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "presentingViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 != 0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)startIndeterminateProgressIndicator
{
  void *v2;
  id v3;

  -[BFFFaceIDViewController contentController](self, "contentController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonTray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showButtonsBusy");

}

- (void)stopIndeterminateProgressIndicator
{
  void *v2;
  id v3;

  -[BFFFaceIDViewController contentController](self, "contentController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonTray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showButtonsAvailable");

}

- (BOOL)isAnimating
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[BFFFaceIDViewController contentController](self, "contentController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") != 0;

  return v7;
}

uint64_t __38__BFFFaceIDViewController_isAnimating__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsActivityIndicator");

  return v3;
}

- (BOOL)completesOnCancel
{
  return self->_completesOnCancel;
}

- (unint64_t)enrollmentConfiguration
{
  return self->_enrollmentConfiguration;
}

- (void)setEnrollmentConfiguration:(unint64_t)a3
{
  self->_enrollmentConfiguration = a3;
}

- (BYDeviceProvider)deviceProvider
{
  return self->_deviceProvider;
}

- (void)setDeviceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_deviceProvider, a3);
}

- (LAContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
  objc_storeStrong((id *)&self->_authContext, a3);
}

- (BFFFaceIDViewControllerDelegate)faceIDViewControllerDelegate
{
  return (BFFFaceIDViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_faceIDViewControllerDelegate);
}

- (void)setFaceIDViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_faceIDViewControllerDelegate, a3);
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeCacheManager, a3);
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (OBWelcomeController)contentController
{
  return self->_contentController;
}

- (void)setContentController:(id)a3
{
  objc_storeStrong((id *)&self->_contentController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentController, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_passcodeCacheManager, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_destroyWeak((id *)&self->_faceIDViewControllerDelegate);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_deviceProvider, 0);
  objc_storeStrong((id *)&self->_preloadedState, 0);
}

@end
