@implementation PRUISModalController

- (PRUISModalController)initWithEntryPoint:(id)a3
{
  id v5;
  PRUISModalController *v6;
  PRUISModalController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRUISModalController;
  v6 = -[PRUISModalController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_entryPoint, a3);

  return v7;
}

- (void)setDisplayConfiguration:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[FBSDisplayConfiguration isEqual:](self->_displayConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayConfiguration, a3);
    -[PRUISInlinePosterEditingViewController setDisplayConfiguration:](self->_viewController, "setDisplayConfiguration:", v5);
  }

}

- (void)presentFromWindowScene:(id)a3
{
  PRUISInlinePosterEditingViewController *v4;
  PRUISInlinePosterEditingViewController *viewController;
  PRUISInlinePosterEditingViewController *v6;
  UIWindow *v7;
  UIWindow *window;
  UIWindow *v9;
  void *v10;
  id v11;

  v11 = a3;
  BSDispatchQueueAssertMain();
  if (!self->_window)
  {
    v4 = -[PRUISInlinePosterEditingViewController initWithEntryPoint:]([PRUISInlinePosterEditingViewController alloc], "initWithEntryPoint:", self->_entryPoint);
    -[PRUISInlinePosterEditingViewController setDelegate:](v4, "setDelegate:", self);
    -[PRUISInlinePosterEditingViewController setDisplayConfiguration:](v4, "setDisplayConfiguration:", self->_displayConfiguration);
    viewController = self->_viewController;
    self->_viewController = v4;
    v6 = v4;

    v7 = (UIWindow *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FF8]), "initWithWindowScene:", v11);
    window = self->_window;
    self->_window = v7;

    -[UIWindow _setWindowInterfaceOrientation:](self->_window, "_setWindowInterfaceOrientation:", 1);
    v9 = self->_window;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[UIWindow setWindowLevel:](self->_window, "setWindowLevel:", *MEMORY[0x24BDF8000] + 1.0);
    -[UIWindow setRootViewController:](self->_window, "setRootViewController:", v6);
    -[UIWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");

  }
}

- (void)handleHostSceneTransitionedFromActiveState
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", *MEMORY[0x24BDD0C28], 0);

}

- (void)inlineEditingViewController:(id)a3 willDismissWithResponse:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  BSDispatchQueueAssertMain();
  -[PRUISModalController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "modalController:willDismissSheetWithResponse:", self, v6);

}

- (void)inlineEditingViewController:(id)a3 didDismissWithResponse:(id)a4
{
  UIWindow *window;
  void *v6;
  id v7;

  v7 = a4;
  BSDispatchQueueAssertMain();
  -[UIWindow setHidden:](self->_window, "setHidden:", 1);
  window = self->_window;
  self->_window = 0;

  -[PRUISModalController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "modalController:didDismissSheetWithResponse:", self, v7);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "modalControllerDidDismissSheet:", self);

}

- (PRUISModalControllerDelegate)delegate
{
  return (PRUISModalControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_entryPoint, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
