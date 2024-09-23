@implementation WFActionUserInterface

- (WFActionUserInterface)initWithUserInterfaceType:(id)a3 attribution:(id)a4
{
  id v7;
  id v8;
  WFActionUserInterface *v9;
  WFActionUserInterface *v10;
  WFActionUserInterface *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFActionUserInterface;
  v9 = -[WFActionUserInterface init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userInterfaceType, a3);
    objc_storeStrong((id *)&v10->_attribution, a4);
    v11 = v10;
  }

  return v10;
}

- (UIViewController)viewControllerForPresenting
{
  UIViewController *viewControllerForPresenting;
  void *v4;
  UIViewController *v5;
  UIViewController *v6;

  viewControllerForPresenting = self->_viewControllerForPresenting;
  if (!viewControllerForPresenting)
  {
    -[WFActionUserInterface delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewControllerForPresentingActionUserInterface:", self);
    v5 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    v6 = self->_viewControllerForPresenting;
    self->_viewControllerForPresenting = v5;

    viewControllerForPresenting = self->_viewControllerForPresenting;
  }
  return viewControllerForPresenting;
}

- (UIWindow)presentationAnchor
{
  UIViewController *viewControllerForPresenting;
  void *v4;
  void *v5;

  viewControllerForPresenting = self->_viewControllerForPresenting;
  if (viewControllerForPresenting)
  {
    -[UIViewController view](viewControllerForPresenting, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
  }
  else
  {
    -[WFActionUserInterface delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationAnchorForActionUserInterface:", self);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIWindow *)v5;
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  void *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[UIViewController presentedViewController](self->_viewControllerForPresenting, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[UIViewController dismissViewControllerAnimated:completion:](self->_viewControllerForPresenting, "dismissViewControllerAnimated:completion:", 1, v5);
  else
    v5[2]();

}

- (NSString)userInterfaceType
{
  return self->_userInterfaceType;
}

- (WFActionUserInterfaceDelegate)delegate
{
  return (WFActionUserInterfaceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFDialogAttribution)attribution
{
  return self->_attribution;
}

- (void)setViewControllerForPresenting:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllerForPresenting, a3);
}

- (WFWorkflowRunningContext)runningContext
{
  return self->_runningContext;
}

- (void)setRunningContext:(id)a3
{
  objc_storeStrong((id *)&self->_runningContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningContext, 0);
  objc_storeStrong((id *)&self->_viewControllerForPresenting, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userInterfaceType, 0);
}

@end
