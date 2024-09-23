@implementation RUINavigationController

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_ruiSupportedInterfaceOrientations = a3;
}

- (unint64_t)supportedInterfaceOrientations
{
  unint64_t result;
  objc_super v4;

  result = self->_ruiSupportedInterfaceOrientations;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)RUINavigationController;
    return -[RUINavigationController supportedInterfaceOrientations](&v4, sel_supportedInterfaceOrientations);
  }
  return result;
}

- (void)loadView
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RUINavigationController;
  -[RUINavigationController loadView](&v2, sel_loadView);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RUINavigationController;
  -[RUINavigationController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__menuButtonPressed_);
  objc_msgSend(v3, "setAllowedPressTypes:", &unk_24C2B1F30);
  -[RUINavigationController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v3);

}

- (void)_menuButtonPressed:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void (**menuDismissalHandler)(void);
  void *v8;
  _QWORD v9[5];

  -[RUINavigationController viewControllers](self, "viewControllers", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 < 2)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __46__RUINavigationController__menuButtonPressed___block_invoke;
    v9[3] = &unk_24C2973F0;
    v9[4] = self;
    -[RUINavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v9);
  }
  else
  {
    -[RUINavigationController popViewControllerAnimated:](self, "popViewControllerAnimated:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    menuDismissalHandler = (void (**)(void))self->_menuDismissalHandler;
    if (menuDismissalHandler)
    {
      v8 = v6;
      menuDismissalHandler[2]();
      v6 = v8;
    }

  }
}

uint64_t __46__RUINavigationController__menuButtonPressed___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1448);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  id v5;
  id WeakRetained;
  int v7;
  id v8;
  objc_super v9;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  v7 = objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_2545FEF40);

  if (v7)
  {
    v8 = objc_loadWeakRetained((id *)&self->_hostViewController);
    objc_msgSend(v8, "dismissModalRUIController:completion:", self, v5);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)RUINavigationController;
    -[RUINavigationController dismissViewControllerAnimated:completion:](&v9, sel_dismissViewControllerAnimated_completion_, 1, v5);
  }

}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RUINavigationController;
  v4 = a3;
  -[RUINavigationController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v9.receiver, v9.super_class);

  -[RUINavigationController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
  {
    -[RUINavigationController style](self, "style");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applyToNavigationController:", self);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void (**viewDidDisappearHandler)(id, RUINavigationController *);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RUINavigationController;
  -[RUINavigationController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  viewDidDisappearHandler = (void (**)(id, RUINavigationController *))self->_viewDidDisappearHandler;
  if (viewDidDisappearHandler)
    viewDidDisappearHandler[2](viewDidDisappearHandler, self);
}

- (RUIStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (unint64_t)ruiModalPresentationStyle
{
  return self->_ruiModalPresentationStyle;
}

- (void)setRuiModalPresentationStyle:(unint64_t)a3
{
  self->_ruiModalPresentationStyle = a3;
}

- (UIViewController)hostViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_hostViewController);
}

- (void)setHostViewController:(id)a3
{
  objc_storeWeak((id *)&self->_hostViewController, a3);
}

- (id)menuDismissalHandler
{
  return self->_menuDismissalHandler;
}

- (void)setMenuDismissalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1448);
}

- (id)viewDidDisappearHandler
{
  return self->_viewDidDisappearHandler;
}

- (void)setViewDidDisappearHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1456);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewDidDisappearHandler, 0);
  objc_storeStrong(&self->_menuDismissalHandler, 0);
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
