@implementation STSetupAssistantViewController

- (STSetupAssistantViewController)init
{
  return -[STSetupAssistantViewController initWithScreenTimeState:passcode:](self, "initWithScreenTimeState:passcode:", 1, 0);
}

+ (id)new
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithScreenTimeState:passcode:", 1, 0);
}

- (STSetupAssistantViewController)initWithScreenTimeState:(int64_t)a3 passcode:(BOOL)a4
{
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  STSetupAssistantViewController *v11;
  objc_super v13;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SetupAssistantTitle"), &stru_24DB8A1D0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2 && a4)
    v9 = CFSTR("SetupAssistantDetailAccountExist");
  else
    v9 = CFSTR("SetupAssistantDetail");
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24DB8A1D0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)STSetupAssistantViewController;
  v11 = -[STSetupAssistantViewController initWithTitle:detailText:icon:contentLayout:](&v13, sel_initWithTitle_detailText_icon_contentLayout_, v8, v10, 0, 1);
  v11->_state = a3;
  v11->_hasRestrictionsPasscode = a4;

  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[16];
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)STSetupAssistantViewController;
  -[OBBaseWelcomeController viewDidLoad](&v29, sel_viewDidLoad);
  v3 = (void *)MEMORY[0x24BEBD9A0];
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storyboardWithName:bundle:", CFSTR("STSetupAssistantPosedDeviceViewController"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "instantiateInitialViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSetupAssistantViewController addChildViewController:](self, "addChildViewController:", v6);
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[STSetupAssistantViewController contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);

  _NSDictionaryOfVariableBindings(CFSTR("posedDeviceView"), v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[posedDeviceView]|"), 0, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[posedDeviceView]|"), 0, 0, v9);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD1628];
  v25 = (void *)v11;
  v26 = v10;
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activateConstraints:", v13);

  objc_msgSend(v6, "didMoveToParentViewController:", self);
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSetupAssistantViewController buttonTray](self, "buttonTray");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SetupAssistantContinue"), &stru_24DB8A1D0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:forState:", v17, 0);
  objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel__continue_, 0x2000);
  v27 = v15;
  objc_msgSend(v15, "addButton:", v16);
  if (!-[STSetupAssistantViewController hasRestrictionsPasscode](self, "hasRestrictionsPasscode")
    || -[STSetupAssistantViewController state](self, "state") != 2)
  {
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SetupAssistantSetUpLater"), &stru_24DB8A1D0, 0);
    v19 = v17;
    v20 = v7;
    v21 = v6;
    v22 = v9;
    v23 = v5;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:forState:", v24, 0);
    objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel__setUpLater_, 0x2000);
    objc_msgSend(v27, "addButton:", v18);

    v5 = v23;
    v9 = v22;
    v6 = v21;
    v7 = v20;
    v17 = v19;

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STSetupAssistantViewController.viewDidLoad", buf, 2u);
  }

}

- (void)_continue:(id)a3
{
  id v3;

  -[STSetupAssistantViewController delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "continueSetup");

}

- (void)_setUpLater:(id)a3
{
  id v3;

  -[STSetupAssistantViewController delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setupSkipped");

}

- (STSetupAssistantViewControllerDelegate)delegate
{
  return (STSetupAssistantViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)hasRestrictionsPasscode
{
  return self->_hasRestrictionsPasscode;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
