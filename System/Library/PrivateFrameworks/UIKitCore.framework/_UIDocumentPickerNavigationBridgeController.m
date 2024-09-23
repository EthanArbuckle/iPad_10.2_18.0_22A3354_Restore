@implementation _UIDocumentPickerNavigationBridgeController

+ (id)_exportedInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDEFB670);
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0), sel__prepareWithExtensionInfo_completionHandler_, 0, 0);
  return v2;
}

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDEFF258);
}

- (void)_setPickableTypes:(id)a3
{
  id v5;

  if (objc_msgSend(-[NSArray firstObject](-[UINavigationController viewControllers](self, "viewControllers"), "firstObject"), "conformsToProtocol:", &unk_1EDEFB670))v5 = -[NSArray firstObject](-[UINavigationController viewControllers](self, "viewControllers"), "firstObject");
  else
    v5 = 0;
  objc_msgSend(v5, "_setPickableTypes:", a3);
}

- (void)_setPickerMode:(unint64_t)a3
{
  id v5;

  if (objc_msgSend(-[NSArray firstObject](-[UINavigationController viewControllers](self, "viewControllers"), "firstObject"), "conformsToProtocol:", &unk_1EDEFB670))v5 = -[NSArray firstObject](-[UINavigationController viewControllers](self, "viewControllers"), "firstObject");
  else
    v5 = 0;
  objc_msgSend(v5, "_setPickerMode:", a3);
}

- (void)_setUploadURLWrapper:(id)a3
{
  id v5;

  if (objc_msgSend(-[NSArray firstObject](-[UINavigationController viewControllers](self, "viewControllers"), "firstObject"), "conformsToProtocol:", &unk_1EDEFB670))v5 = -[NSArray firstObject](-[UINavigationController viewControllers](self, "viewControllers"), "firstObject");
  else
    v5 = 0;
  objc_msgSend(v5, "_setUploadURLWrapper:", a3);
}

- (void)_prepareWithExtensionInfo:(id)a3 completionHandler:(id)a4
{
  id v7;

  if (objc_msgSend(-[NSArray firstObject](-[UINavigationController viewControllers](self, "viewControllers"), "firstObject"), "conformsToProtocol:", &unk_1EDEFB670))v7 = -[NSArray firstObject](-[UINavigationController viewControllers](self, "viewControllers"), "firstObject");
  else
    v7 = 0;
  if ((dyld_program_sdk_at_least() & 1) == 0)
    -[UINavigationController setNavigationBarHidden:](self, "setNavigationBarHidden:", 1);
  if (v7)
    objc_msgSend(v7, "_prepareWithExtensionInfo:completionHandler:", a3, a4);
  else
    (*((void (**)(id, _QWORD))a4 + 2))(a4, _UIApplicationLinkedOnVersion);
}

- (void)_documentPickerDidDismiss
{
  id v3;

  if (objc_msgSend(-[NSArray firstObject](-[UINavigationController viewControllers](self, "viewControllers"), "firstObject"), "conformsToProtocol:", &unk_1EDEFB670))v3 = -[NSArray firstObject](-[UINavigationController viewControllers](self, "viewControllers"), "firstObject");
  else
    v3 = 0;
  objc_msgSend(v3, "_documentPickerDidDismiss");
}

- (void)_setTintColor:(id)a3
{
  -[UIView setTintColor:](-[UIViewController view](self, "view"), "setTintColor:", a3);
}

- (void)_doneButton:(id)a3
{
  objc_msgSend(-[_UIDocumentPickerNavigationBridgeController hostingViewController](self, "hostingViewController", a3), "_doneButtonPressed");
}

- (void)_locationsMenu:(id)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v5 = (void *)objc_msgSend(a3, "view");
  objc_msgSend((id)objc_msgSend(a3, "view"), "bounds");
  objc_msgSend(v5, "convertRect:toView:", -[UIViewController view](self, "view"), v6, v7, v8, v9);
  objc_msgSend(-[_UIDocumentPickerNavigationBridgeController hostingViewController](self, "hostingViewController"), "_displayLocationMenu:", v10, v11, v12, v13);
}

- (void)_updateNavigationItem
{
  id v3;
  UIViewController *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (!self->_hasSetInitialNavigationItem)
  {
    self->_hasSetInitialNavigationItem = 1;
    v3 = -[NSArray firstObject](-[UINavigationController viewControllers](self, "viewControllers"), "firstObject");
    objc_msgSend(v3, "_setExistingNavigationItem:", -[_UIDocumentPickerNavigationItem initWithTitle:rightBarButtonItem:]([_UIDocumentPickerNavigationItem alloc], "initWithTitle:rightBarButtonItem:", objc_msgSend((id)objc_msgSend(v3, "_existingNavigationItem"), "title"), -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 1, self, sel__doneButton_)));
  }
  v4 = -[UINavigationController topViewController](self, "topViewController");
  if (!-[NSArray count](-[UINavigationItem rightBarButtonItems](-[UIViewController navigationItem](v4, "navigationItem"), "rightBarButtonItems"), "count"))
  {
    v5[0] = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 1, self, sel__doneButton_);
    -[UINavigationItem setRightBarButtonItems:](-[UIViewController navigationItem](v4, "navigationItem"), "setRightBarButtonItems:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1));
  }
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerNavigationBridgeController;
  -[UINavigationController pushViewController:animated:](&v5, sel_pushViewController_animated_, a3, a4);
  -[_UIDocumentPickerNavigationBridgeController _updateNavigationItem](self, "_updateNavigationItem");
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  UIViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDocumentPickerNavigationBridgeController;
  v4 = -[UINavigationController popViewControllerAnimated:](&v6, sel_popViewControllerAnimated_, a3);
  -[_UIDocumentPickerNavigationBridgeController _updateNavigationItem](self, "_updateNavigationItem");
  return v4;
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  NSArray *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIDocumentPickerNavigationBridgeController;
  v5 = -[UINavigationController popToViewController:animated:](&v7, sel_popToViewController_animated_, a3, a4);
  -[_UIDocumentPickerNavigationBridgeController _updateNavigationItem](self, "_updateNavigationItem");
  return v5;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  NSArray *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDocumentPickerNavigationBridgeController;
  v4 = -[UINavigationController popToRootViewControllerAnimated:](&v6, sel_popToRootViewControllerAnimated_, a3);
  -[_UIDocumentPickerNavigationBridgeController _updateNavigationItem](self, "_updateNavigationItem");
  return v4;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerNavigationBridgeController;
  -[UINavigationController setViewControllers:animated:](&v5, sel_setViewControllers_animated_, a3, a4);
  -[_UIDocumentPickerNavigationBridgeController _updateNavigationItem](self, "_updateNavigationItem");
}

@end
