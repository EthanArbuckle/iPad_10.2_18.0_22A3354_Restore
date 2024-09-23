@implementation TSPRXDeviceUnlockViewController

- (TSPRXDeviceUnlockViewController)init
{
  TSPRXDeviceUnlockViewController *v2;
  TSPRXDeviceUnlockViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSPRXDeviceUnlockViewController;
  v2 = -[TSPRXDeviceUnlockViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[TSPRXDeviceUnlockViewController _registerLockState](v2, "_registerLockState");
    -[TSPRXDeviceUnlockViewController _startSystemMonitor](v3, "_startSystemMonitor");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[TSPRXDeviceUnlockViewController _stopSystemMonitor](self, "_stopSystemMonitor");
  -[TSPRXDeviceUnlockViewController _unregisterLockState](self, "_unregisterLockState");
  v3.receiver = self;
  v3.super_class = (Class)TSPRXDeviceUnlockViewController;
  -[TSPRXDeviceUnlockViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  UIImageView *v10;
  UIImageView *radioImageView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PRXAction *v17;
  PRXAction *action;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  id location;
  objc_super v59;
  _QWORD v60[7];

  v60[5] = *MEMORY[0x24BDAC8D0];
  v59.receiver = self;
  v59.super_class = (Class)TSPRXDeviceUnlockViewController;
  -[TSPRXDeviceUnlockViewController viewDidLoad](&v59, sel_viewDidLoad);
  v3 = +[TSUtilities isPad](TSUtilities, "isPad");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("TRANSFER_SIM");
  else
    v6 = CFSTR("PRXCARD_START_TITLE");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24DEF4290, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSPRXDeviceUnlockViewController setTitle:](self, "setTitle:", v7);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PRXCARD_START_SUBTITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSPRXDeviceUnlockViewController setSubtitle:](self, "setSubtitle:", v9);

  -[TSPRXDeviceUnlockViewController setDismissalType:](self, "setDismissalType:", 3);
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("antenna.radiowaves.left.and.right"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v55);
  radioImageView = self->_radioImageView;
  self->_radioImageView = v10;

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_radioImageView, "setTintColor:", v12);

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_radioImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TSPRXDeviceUnlockViewController contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_radioImageView);

  objc_initWeak(&location, self);
  v14 = (void *)MEMORY[0x24BE7B3C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DEVICE_UNLOCK_TO_CONTINUE"), &stru_24DEF4290, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __46__TSPRXDeviceUnlockViewController_viewDidLoad__block_invoke;
  v56[3] = &unk_24DEF2C30;
  objc_copyWeak(&v57, &location);
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v56);
  v17 = (PRXAction *)objc_claimAutoreleasedReturnValue();
  action = self->_action;
  self->_action = v17;

  v19 = (id)-[TSPRXDeviceUnlockViewController addAction:](self, "addAction:", self->_action);
  -[TSPRXDeviceUnlockViewController contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v22 = v21;
  v24 = v23;

  objc_msgSend(v55, "size");
  v26 = v25;
  objc_msgSend(v55, "size");
  v28 = v24 * 0.3 / v27;
  if (v22 * 0.3 / v26 >= v28)
    v29 = v28;
  else
    v29 = v22 * 0.3 / v26;
  objc_msgSend(v55, "size");
  v31 = v30;
  objc_msgSend(v55, "size");
  v33 = v32;
  v44 = (void *)MEMORY[0x24BDD1628];
  -[UIImageView topAnchor](self->_radioImageView, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSPRXDeviceUnlockViewController contentView](self, "contentView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "mainContentGuide");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintGreaterThanOrEqualToAnchor:", v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v50;
  -[UIImageView centerXAnchor](self->_radioImageView, "centerXAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSPRXDeviceUnlockViewController contentView](self, "contentView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "mainContentGuide");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "centerXAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v45;
  -[UIImageView centerYAnchor](self->_radioImageView, "centerYAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSPRXDeviceUnlockViewController contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "mainContentGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "centerYAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v38;
  -[UIImageView widthAnchor](self->_radioImageView, "widthAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToConstant:", v29 * v31);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v60[3] = v40;
  -[UIImageView heightAnchor](self->_radioImageView, "heightAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToConstant:", v29 * v33);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v60[4] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 5);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "activateConstraints:", v43);

  objc_destroyWeak(&v57);
  objc_destroyWeak(&location);

}

void __46__TSPRXDeviceUnlockViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_unlockScreen");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)_unlockScreen
{
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[TSPRXDeviceUnlockViewController _unlockScreen]";
    _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "requesting unlock @%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v4, (id *)buf);
  SBSRequestPasscodeUnlockUI();
  objc_destroyWeak(&v4);
  objc_destroyWeak((id *)buf);
}

void __48__TSPRXDeviceUnlockViewController__unlockScreen__block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a2 || !+[TSUtilities isDeviceLocked](TSUtilities, "isDeviceLocked"))
  {
    if (!+[TSUtilities isDeviceLocked](TSUtilities, "isDeviceLocked"))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "_unregisterLockState");

      v8 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v8, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "viewControllerDidComplete:", *(_QWORD *)(a1 + 32));

    }
  }
  else
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[TSPRXDeviceUnlockViewController _unlockScreen]_block_invoke";
      _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "unlock canceled @%s", buf, 0xCu);
    }

    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v4, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userDidTapCancel");

  }
}

- (void)_registerLockState
{
  int *p_springBoardLockStateNotifyToken;
  void (**v3)(_QWORD, _QWORD);
  const char *v4;
  NSObject *v5;
  id v6;
  uint32_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id location;
  uint8_t buf[4];
  uint32_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  p_springBoardLockStateNotifyToken = &self->springBoardLockStateNotifyToken;
  self->springBoardLockStateNotifyToken = -1;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__TSPRXDeviceUnlockViewController__registerLockState__block_invoke;
  v9[3] = &unk_24DEF2C80;
  objc_copyWeak(&v10, &location);
  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x220765A70](v9);
  v4 = (const char *)*MEMORY[0x24BEB0ED0];
  v5 = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC9B8];
  v7 = notify_register_dispatch(v4, p_springBoardLockStateNotifyToken, v5, v3);

  if (v7)
  {
    _TSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      v13 = v7;
      v14 = 2080;
      v15 = v4;
      v16 = 2080;
      v17 = "-[TSPRXDeviceUnlockViewController _registerLockState]";
      _os_log_impl(&dword_21B647000, v8, OS_LOG_TYPE_DEFAULT, "Error %u settingup notification handler for %s @%s", buf, 0x1Cu);
    }

  }
  else
  {
    v3[2](v3, *p_springBoardLockStateNotifyToken);
  }

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __53__TSPRXDeviceUnlockViewController__registerLockState__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleLockState:", a2);

}

- (void)_unregisterLockState
{
  int springBoardLockStateNotifyToken;

  springBoardLockStateNotifyToken = self->springBoardLockStateNotifyToken;
  if (springBoardLockStateNotifyToken != -1)
  {
    notify_cancel(springBoardLockStateNotifyToken);
    self->springBoardLockStateNotifyToken = -1;
  }
}

- (void)_handleLockState:(int)a3
{
  BOOL v4;
  int v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  uint64_t state64;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  state64 = 0;
  if (notify_get_state(a3, &state64))
    v4 = 0;
  else
    v4 = state64 == 0;
  v5 = v4;
  _TSLogDomain();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "locked";
    if (v5)
      v7 = "unlocked";
    *(_DWORD *)buf = 136315650;
    v11 = v7;
    v12 = 2048;
    v13 = state64;
    v14 = 2080;
    v15 = "-[TSPRXDeviceUnlockViewController _handleLockState:]";
    _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "SB lock state : %s, raw state : %llu @%s", buf, 0x20u);
  }

  if (v5)
  {
    -[TSPRXDeviceUnlockViewController _unregisterLockState](self, "_unregisterLockState");
    -[TSPRXDeviceUnlockViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewControllerDidComplete:", self);

  }
}

- (void)_startSystemMonitor
{
  CUSystemMonitor *v3;
  CUSystemMonitor *systemMonitor;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  if (!self->_systemMonitor)
  {
    v3 = (CUSystemMonitor *)objc_alloc_init(MEMORY[0x24BE29840]);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v3;

    -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", MEMORY[0x24BDAC9B8]);
    objc_initWeak(&location, self);
    v5 = MEMORY[0x24BDAC760];
    v6 = 3221225472;
    v7 = __54__TSPRXDeviceUnlockViewController__startSystemMonitor__block_invoke;
    v8 = &unk_24DEF29F8;
    objc_copyWeak(&v9, &location);
    -[CUSystemMonitor setScreenOnChangedHandler:](self->_systemMonitor, "setScreenOnChangedHandler:", &v5);
    -[CUSystemMonitor activateWithCompletion:](self->_systemMonitor, "activateWithCompletion:", &__block_literal_global_1, v5, v6, v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __54__TSPRXDeviceUnlockViewController__startSystemMonitor__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_screenStateChanged");

}

void __54__TSPRXDeviceUnlockViewController__startSystemMonitor__block_invoke_2()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1 = 136315138;
    v2 = "-[TSPRXDeviceUnlockViewController _startSystemMonitor]_block_invoke_2";
    _os_log_impl(&dword_21B647000, v0, OS_LOG_TYPE_INFO, "[I] screen on monitor activated @%s", (uint8_t *)&v1, 0xCu);
  }

}

- (void)_stopSystemMonitor
{
  NSObject *v3;
  CUSystemMonitor *systemMonitor;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[TSPRXDeviceUnlockViewController _stopSystemMonitor]";
    _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_INFO, "[I] stop screen on monitor @%s", (uint8_t *)&v5, 0xCu);
  }

  -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0;

}

- (void)_screenStateChanged
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if ((-[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn") & 1) == 0)
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[TSPRXDeviceUnlockViewController _screenStateChanged]";
      _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "app enter background, dismiss. @%s", (uint8_t *)&v5, 0xCu);
    }

    -[TSPRXDeviceUnlockViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewControllerDidComplete:", self);

  }
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PRXAction)action
{
  return (PRXAction *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1080);
}

- (UIImageView)radioImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setRadioImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- (CUSystemMonitor)systemMonitor
{
  return (CUSystemMonitor *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setSystemMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1096);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_radioImageView, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
