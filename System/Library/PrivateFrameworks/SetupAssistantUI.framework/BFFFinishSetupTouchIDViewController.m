@implementation BFFFinishSetupTouchIDViewController

- (BFFFinishSetupTouchIDViewController)init
{
  BFFFinishSetupTouchIDViewController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BFFFinishSetupTouchIDViewController;
  v2 = -[BFFFinishSetupTouchIDViewController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_didBecomeActive_, *MEMORY[0x24BEBDF88], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_didResignActive_, *MEMORY[0x24BEBE010], 0);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BiometricKitUIEnrollViewController setDelegate:](self->_enrollController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BFFFinishSetupTouchIDViewController;
  -[BFFFinishSetupTouchIDViewController dealloc](&v3, sel_dealloc);
}

- (void)didBecomeActive:(id)a3
{
  if (!self->_enrollController)
    -[BFFFinishSetupTouchIDViewController beginEnrollment](self, "beginEnrollment", a3);
}

- (void)didResignActive:(id)a3
{
  if (!self->_enrollComplete)
    -[BFFFinishSetupTouchIDViewController deleteIdentity](self, "deleteIdentity", a3);
  -[BFFFinishSetupTouchIDViewController endEnrollment](self, "endEnrollment", a3);
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BFFFinishSetupTouchIDViewController;
  -[BFFFinishSetupTouchIDViewController loadView](&v6, sel_loadView);
  -[BFFFinishSetupTouchIDViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BFFFinishSetupTouchIDViewController;
  -[BFFFinishSetupTouchIDViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[BFFFinishSetupTouchIDViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftItemsSupplementBackButton:", 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BFFFinishSetupTouchIDViewController;
  -[BFFFinishSetupTouchIDViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (!objc_msgSend((id)*MEMORY[0x24BEBDF78], "applicationState"))
    -[BFFFinishSetupTouchIDViewController beginEnrollment](self, "beginEnrollment");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BFFFinishSetupTouchIDViewController;
  -[BFFFinishSetupTouchIDViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[BFFFinishSetupTouchIDViewController endEnrollment](self, "endEnrollment");
}

- (void)beginEnrollment
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  void (**v18)(_QWORD);
  _QWORD v19[4];
  id v20;
  BFFFinishSetupTouchIDViewController *v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v3 = (void *)getBiometricKitUIClass_softClass;
  v26 = getBiometricKitUIClass_softClass;
  if (!getBiometricKitUIClass_softClass)
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __getBiometricKitUIClass_block_invoke;
    v22[3] = &unk_24D234208;
    v22[4] = &v23;
    __getBiometricKitUIClass_block_invoke((uint64_t)v22);
    v3 = (void *)v24[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v23, 8);
  objc_msgSend(v4, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getEnrollUIViewController:bundleName:", 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __54__BFFFinishSetupTouchIDViewController_beginEnrollment__block_invoke;
    v19[3] = &unk_24D2341E0;
    v9 = v6;
    v20 = v9;
    v21 = self;
    v10 = (void (**)(_QWORD))MEMORY[0x2199D7C3C](v19);
    -[BFFFinishSetupTouchIDViewController passcode](self, "passcode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length") == 0;

    if (v12)
    {
      v10[2](v10);
    }
    else
    {
      v13 = (void *)MEMORY[0x24BE85870];
      -[BFFFinishSetupTouchIDViewController passcode](self, "passcode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = &unk_24D23E138;
      v28[0] = &unk_24D23E150;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = __54__BFFFinishSetupTouchIDViewController_beginEnrollment__block_invoke_22;
      v16[3] = &unk_24D234600;
      v16[4] = self;
      v17 = v9;
      v18 = v10;
      objc_msgSend(v13, "createContextWithSecret:policy:options:completion:", v14, 1007, v15, v16);

    }
  }

}

void __54__BFFFinishSetupTouchIDViewController_beginEnrollment__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", MEMORY[0x24BDBD1C8], CFSTR("IN_BUDDY"));
  v2 = *(void **)(a1 + 32);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v3 = (void *)getBiometricKitClass_softClass;
  v15 = getBiometricKitClass_softClass;
  if (!getBiometricKitClass_softClass)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __getBiometricKitClass_block_invoke;
    v11[3] = &unk_24D234208;
    v11[4] = &v12;
    __getBiometricKitClass_block_invoke((uint64_t)v11);
    v3 = (void *)v13[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v12, 8);
  objc_msgSend(v4, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBiometricKit:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "addChildViewController:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pinToEdges:", v10);

  objc_msgSend(*(id *)(a1 + 32), "didMoveToParentViewController:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 968), *(id *)(a1 + 32));
}

void __54__BFFFinishSetupTouchIDViewController_beginEnrollment__block_invoke_22(id *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(a1[4], "setAuthContext:", a2);
  objc_msgSend(a1[4], "authContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "externalizedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(a1[5], "setProperty:forKey:", v4, CFSTR("credset"));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__BFFFinishSetupTouchIDViewController_beginEnrollment__block_invoke_2;
  block[3] = &unk_24D2345D8;
  v6 = a1[6];
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __54__BFFFinishSetupTouchIDViewController_beginEnrollment__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)endEnrollment
{
  void *v3;
  BiometricKitUIEnrollViewController *enrollController;
  BiometricKitUIEnrollViewController *v5;

  v5 = self->_enrollController;
  -[BiometricKitUIEnrollViewController willMoveToParentViewController:](v5, "willMoveToParentViewController:", 0);
  -[BiometricKitUIEnrollViewController view](v5, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[BiometricKitUIEnrollViewController removeFromParentViewController](v5, "removeFromParentViewController");
  -[BiometricKitUIEnrollViewController setDelegate:](v5, "setDelegate:", 0);
  enrollController = self->_enrollController;
  self->_enrollController = 0;

}

- (void)restartEnrollment
{
  -[BFFFinishSetupTouchIDViewController deleteIdentity](self, "deleteIdentity");
  -[BiometricKitUIEnrollViewController restartEnroll](self->_enrollController, "restartEnroll");
  -[BFFFinishSetupTouchIDViewController resetLeftNavigationItem](self, "resetLeftNavigationItem");
}

- (void)deleteIdentity
{
  void *v3;
  BKIdentity *identity;

  if (self->_identity)
  {
    objc_msgSend(MEMORY[0x24BE75448], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeIdentity:", self->_identity);

    identity = self->_identity;
    self->_identity = 0;

  }
}

- (id)_cancelLeftNavigationItem
{
  UIBarButtonItem *cancelLeftNavigationItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  cancelLeftNavigationItem = self->_cancelLeftNavigationItem;
  if (!cancelLeftNavigationItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__userDidTapCancelButton_);
    v5 = self->_cancelLeftNavigationItem;
    self->_cancelLeftNavigationItem = v4;

    cancelLeftNavigationItem = self->_cancelLeftNavigationItem;
  }
  return cancelLeftNavigationItem;
}

- (void)_userDidTapCancelButton:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_214875000, v4, OS_LOG_TYPE_DEFAULT, "Buddy followup touch ID user did tap cancel", v5, 2u);
  }

  -[BFFFinishSetupTouchIDViewController deleteIdentity](self, "deleteIdentity");
  -[BFFFinishSetupTouchIDViewController _didCompleteMesaControllerWithResult:](self, "_didCompleteMesaControllerWithResult:", 2);
}

- (void)resetLeftNavigationItem
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  -[BFFFinishSetupTouchIDViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leftBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFFinishSetupTouchIDViewController _cancelLeftNavigationItem](self, "_cancelLeftNavigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    -[BFFFinishSetupTouchIDViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performSelector:withObject:withObject:", sel_setLeftBarButtonItem_animated_, 0, MEMORY[0x24BDBD1C8]);

    -[BFFFinishSetupTouchIDViewController navigationItem](self, "navigationItem");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidesBackButton:", 0);

  }
}

- (void)_didCompleteMesaControllerWithResult:(unint64_t)a3
{
  void (**completion)(id, BFFFinishSetupTouchIDViewController *, unint64_t);
  id v5;

  self->_enrollComplete = 1;
  completion = (void (**)(id, BFFFinishSetupTouchIDViewController *, unint64_t))self->_completion;
  if (completion)
  {
    completion[2](completion, self, a3);
    v5 = self->_completion;
    self->_completion = 0;

  }
}

- (void)enrollResult:(int)a3 bkIdentity:(id)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  BKIdentity *identity;
  BFFFinishSetupTouchIDViewController *v13;
  uint64_t v14;
  void *v15;
  BKIdentity *v16;
  BKIdentity *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _DWORD v23[2];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  _BYLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v23[0] = 67109120;
    v23[1] = a3;
    _os_log_impl(&dword_214875000, v8, OS_LOG_TYPE_DEFAULT, "Enroll result: %d", (uint8_t *)v23, 8u);
  }

  switch(a3)
  {
    case 0:
      self->_enrollComplete = 0;
      -[BFFFinishSetupTouchIDViewController resetLeftNavigationItem](self, "resetLeftNavigationItem");
      break;
    case 1:
      if (v7)
      {
        objc_storeStrong((id *)&self->_identity, a4);
        objc_msgSend(MEMORY[0x24BE75448], "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE75480], "nextIdentityName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setName:forIdentity:", v10, v7);

      }
      break;
    case 3:
      if (v7)
      {
        objc_msgSend(MEMORY[0x24BE75448], "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeIdentity:", v7);

        identity = self->_identity;
        self->_identity = 0;

      }
      v13 = self;
      v14 = 1;
      goto LABEL_11;
    case 4:
      v13 = self;
      v14 = 0;
LABEL_11:
      -[BFFFinishSetupTouchIDViewController _didCompleteMesaControllerWithResult:](v13, "_didCompleteMesaControllerWithResult:", v14);
      break;
    case 9:
      if (v7)
      {
        objc_msgSend(MEMORY[0x24BE75448], "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeIdentity:", v7);

        v16 = self->_identity;
        self->_identity = 0;

      }
      -[BiometricKitUIEnrollViewController restartEnroll](self->_enrollController, "restartEnroll");
      break;
    case 10:
      v17 = self->_identity;
      self->_identity = 0;

      v18 = (void *)MEMORY[0x24BEDCDF0];
      -[BFFFinishSetupTouchIDViewController navigationItem](self, "navigationItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "cancelPreviousPerformRequestsWithTarget:selector:object:", v19, sel_setLeftBarButtonItem_, 0);

      -[BFFFinishSetupTouchIDViewController navigationItem](self, "navigationItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setHidesBackButton:", 1);

      -[BFFFinishSetupTouchIDViewController navigationItem](self, "navigationItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[BFFFinishSetupTouchIDViewController _cancelLeftNavigationItem](self, "_cancelLeftNavigationItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setLeftBarButtonItem:animated:", v22, 1);

      break;
    default:
      break;
  }

}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (LAContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
  objc_storeStrong((id *)&self->_authContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_cancelLeftNavigationItem, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_enrollController, 0);
}

@end
