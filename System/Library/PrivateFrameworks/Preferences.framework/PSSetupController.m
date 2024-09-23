@implementation PSSetupController

- (PSSetupController)init
{
  PSSetupController *v2;
  PSSetupController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSSetupController;
  v2 = -[PSRootController initWithTitle:identifier:](&v5, sel_initWithTitle_identifier_, CFSTR("setup"), CFSTR("setup"));
  v3 = v2;
  if (v2)
    -[PSSetupController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 2);
  return v3;
}

- (void)handleURL:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PSSetupController topViewController](self, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE6E3CA8) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "handleURL:", v5);

}

- (id)parentController
{
  return objc_loadWeakRetained((id *)&self->_parentController);
}

- (void)setupController
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  id WeakRetained;
  NSDictionary *v8;
  NSDictionary *rootInfo;
  NSString *aClassName;

  -[PSSetupController viewControllers](self, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    -[PSSpecifier propertyForKey:](self->super._specifier, "propertyForKey:", CFSTR("customControllerClass"));
    aClassName = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString length](aClassName, "length") || (v5 = NSClassFromString(aClassName)) == 0)
      v5 = (objc_class *)objc_opt_class();
    CreateDetailControllerInstanceWithClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained(&self->super._specifier->target);

    if (!WeakRetained)
      objc_storeWeak(&self->super._specifier->target, self);
    -[PSSpecifier properties](self->super._specifier, "properties");
    v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    rootInfo = self->_rootInfo;
    self->_rootInfo = v8;

    objc_msgSend(v6, "setParentController:", self);
    objc_msgSend(v6, "setRootController:", self);
    objc_msgSend(v6, "setSpecifier:", self->super._specifier);
    -[PSRootController showController:](self, "showController:", v6);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSSetupController;
  -[PSRootController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (-[PSSetupController usePopupStyle](self, "usePopupStyle"))
  {
    -[PSRootController willDismissPopupView](self->_parentRootController, "willDismissPopupView");
  }
  else if (-[PSSetupController modalPresentationStyle](self, "modalPresentationStyle") == 2)
  {
    -[PSRootController willDismissFormSheetView](self->_parentRootController, "willDismissFormSheetView");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSSetupController;
  -[PSRootController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  if (-[PSSetupController usePopupStyle](self, "usePopupStyle"))
  {
    -[PSRootController didDismissPopupView](self->_parentRootController, "didDismissPopupView");
  }
  else if (-[PSSetupController modalPresentationStyle](self, "modalPresentationStyle") == 2)
  {
    -[PSRootController didDismissFormSheetView](self->_parentRootController, "didDismissFormSheetView");
  }
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  objc_super v10;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propertyForKey:", CFSTR("dontAnimate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    v9 = v8 ^ 1u;
  }
  else
  {
    v9 = 1;
  }
  v10.receiver = self;
  v10.super_class = (Class)PSSetupController;
  -[PSRootController showController:animate:](&v10, sel_showController_animate_, v5, v9);

}

- (void)setParentController:(id)a3
{
  id WeakRetained;
  PSRootController *v5;
  PSRootController *parentRootController;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_parentController, obj);
    objc_msgSend(obj, "rootController");
    v5 = (PSRootController *)objc_claimAutoreleasedReturnValue();
    parentRootController = self->_parentRootController;
    self->_parentRootController = v5;

  }
}

- (id)controller
{
  void *v2;
  void *v3;

  -[PSSetupController viewControllers](self, "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dismissWithCompletion:(id)a3
{
  -[PSSetupController dismissAnimated:completion:](self, "dismissAnimated:completion:", 1, a3);
}

- (void)dismiss
{
  -[PSSetupController dismissAnimated:completion:](self, "dismissAnimated:completion:", 1, 0);
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id WeakRetained;
  PSSetupController *v7;
  PSSetupController *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v12 = a4;
  if (!-[PSSetupController usePopupStyle](self, "usePopupStyle"))
  {
    -[PSSetupController parentController](self, "parentController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performSelector:", sel__setNotShowingSetupController);

    -[PSSetupController presentingViewController](self, "presentingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", v4, v12);
LABEL_7:

    goto LABEL_8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  objc_msgSend(WeakRetained, "presentedViewController");
  v7 = (PSSetupController *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
  {
    v11 = objc_loadWeakRetained((id *)&self->_parentController);
    objc_msgSend(v11, "dismissPopoverWithCompletion:", v12);
    goto LABEL_7;
  }
  -[PSRootController presentedViewController](self->_parentRootController, "presentedViewController");
  v8 = (PSSetupController *)objc_claimAutoreleasedReturnValue();

  v9 = v12;
  if (v8 == self)
  {
    -[PSRootController dismissViewControllerAnimated:completion:](self->_parentRootController, "dismissViewControllerAnimated:completion:", 1, v12);
LABEL_8:
    v9 = v12;
  }

}

- (void)dismissAnimated:(BOOL)a3
{
  -[PSSetupController dismissAnimated:completion:](self, "dismissAnimated:completion:", 1, 0);
}

- (void)pushControllerOnParentWithSpecifier:(id)a3
{
  PSController **p_parentController;
  id WeakRetained;
  char isKindOfClass;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_class **v12;

  v12 = (objc_class **)a3;
  p_parentController = &self->_parentController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    CreateDetailControllerInstanceWithClass(v12[6]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRootController:", self->_parentRootController);
    v8 = objc_loadWeakRetained((id *)&self->_parentController);
    objc_msgSend(v7, "setParentController:", v8);

    objc_msgSend(v7, "setSpecifier:", v12);
    v9 = objc_loadWeakRetained((id *)p_parentController);
    objc_msgSend(v9, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pushViewController:animated:", v7, objc_msgSend(v11, "sf_isiPad"));

  }
}

- (void)popControllerOnParent
{
  PSController **p_parentController;
  id WeakRetained;
  char isKindOfClass;
  void *v5;
  id v6;
  id v7;

  p_parentController = &self->_parentController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_parentController);
    objc_msgSend(v7, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 0);

  }
}

- (BOOL)usePopupStyle
{
  return 0;
}

- (BOOL)popupStyleIsModal
{
  return 0;
}

- (void)statusBarWillChangeHeight:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!-[PSSetupController usePopupStyle](self, "usePopupStyle")
    && -[PSSetupController modalPresentationStyle](self, "modalPresentationStyle") != 2)
  {
    v5.receiver = self;
    v5.super_class = (Class)PSSetupController;
    -[PSRootController statusBarWillChangeHeight:](&v5, sel_statusBarWillChangeHeight_, v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentRootController, 0);
  objc_destroyWeak((id *)&self->_parentController);
  objc_storeStrong((id *)&self->_rootInfo, 0);
}

@end
