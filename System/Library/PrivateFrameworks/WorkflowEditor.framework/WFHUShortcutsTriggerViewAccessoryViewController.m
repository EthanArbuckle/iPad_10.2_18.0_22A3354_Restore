@implementation WFHUShortcutsTriggerViewAccessoryViewController

- (WFHUShortcutsTriggerViewAccessoryViewController)initWithHome:(id)a3 services:(id)a4
{
  id v6;
  id v7;
  WFHUShortcutsTriggerViewAccessoryViewController *v8;
  void *v9;
  uint64_t v10;
  UIViewController *accessoryPickerViewController;
  WFHUShortcutsTriggerViewAccessoryViewController *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFHUShortcutsTriggerViewAccessoryViewController;
  v8 = -[WFHUShortcutsTriggerViewAccessoryViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    getHUShortcutsTriggerViewAccessoryPickerConfigurationClass();
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setServicesOnly:", 1);
    -[objc_class accessoryPickerViewControllerInHome:withConfiguration:](getHUShortcutsTriggerViewUtilitiesClass_5865(), "accessoryPickerViewControllerInHome:withConfiguration:", v6, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    -[objc_class setServices:onAccessoryPicker:](getHUShortcutsTriggerViewUtilitiesClass_5865(), "setServices:onAccessoryPicker:", v7, v10);
    accessoryPickerViewController = v8->_accessoryPickerViewController;
    v8->_accessoryPickerViewController = (UIViewController *)v10;

    v12 = v8;
  }

  return v8;
}

- (void)loadView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)WFHUShortcutsTriggerViewAccessoryViewController;
  -[WFHUShortcutsTriggerViewAccessoryViewController loadView](&v21, sel_loadView);
  -[WFHUShortcutsTriggerViewAccessoryViewController accessoryPickerViewController](self, "accessoryPickerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHUShortcutsTriggerViewAccessoryViewController addChildViewController:](self, "addChildViewController:", v3);

  -[WFHUShortcutsTriggerViewAccessoryViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[WFHUShortcutsTriggerViewAccessoryViewController accessoryPickerViewController](self, "accessoryPickerViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);

  -[WFHUShortcutsTriggerViewAccessoryViewController accessoryPickerViewController](self, "accessoryPickerViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAutoresizingMask:", 18);

  -[WFHUShortcutsTriggerViewAccessoryViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHUShortcutsTriggerViewAccessoryViewController accessoryPickerViewController](self, "accessoryPickerViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v19);

  -[WFHUShortcutsTriggerViewAccessoryViewController accessoryPickerViewController](self, "accessoryPickerViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "didMoveToParentViewController:", self);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFHUShortcutsTriggerViewAccessoryViewController;
  -[WFHUShortcutsTriggerViewAccessoryViewController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismissEditor);
  -[WFHUShortcutsTriggerViewAccessoryViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelEditor);
  -[WFHUShortcutsTriggerViewAccessoryViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftBarButtonItem:", v5);

}

- (void)dismissEditor
{
  Class HUShortcutsTriggerViewUtilitiesClass_5865;
  void *v4;
  void *v5;
  id v6;

  -[WFHUShortcutsTriggerViewAccessoryViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  HUShortcutsTriggerViewUtilitiesClass_5865 = getHUShortcutsTriggerViewUtilitiesClass_5865();
  -[WFHUShortcutsTriggerViewAccessoryViewController accessoryPickerViewController](self, "accessoryPickerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class getServicesOnAccessoryPicker:](HUShortcutsTriggerViewUtilitiesClass_5865, "getServicesOnAccessoryPicker:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "servicePickerDidFinish:selectedServices:", self, v5);

}

- (void)cancelEditor
{
  id v3;

  -[WFHUShortcutsTriggerViewAccessoryViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "servicePickerDidCancel:", self);

}

- (UIViewController)accessoryPickerViewController
{
  return self->_accessoryPickerViewController;
}

- (WFHUShortcutsTriggerViewAccessoryViewControllerDelegate)delegate
{
  return (WFHUShortcutsTriggerViewAccessoryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessoryPickerViewController, 0);
}

@end
