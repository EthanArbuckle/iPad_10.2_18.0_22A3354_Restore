@implementation IMPopoverAction

- (void)showViewController:(id)a3 inPopoverFromButton:(id)a4
{
  UIViewController *v6;
  void *v7;
  UIViewController *viewControllerPresentedInPopover;
  UIViewController *v9;
  void *v10;
  id v11;

  v6 = (UIViewController *)a3;
  -[IMPopoverPresentationAction setPresentingButton:](self, "setPresentingButton:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMAction controller](self, "controller"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));

  -[UIViewController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 7);
  objc_msgSend(v11, "presentViewController:animated:completion:", v6, 1, 0);
  viewControllerPresentedInPopover = self->_viewControllerPresentedInPopover;
  self->_viewControllerPresentedInPopover = v6;
  v9 = v6;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController popoverPresentationController](v9, "popoverPresentationController"));
  objc_msgSend(v10, "setPermittedArrowDirections:", 3);
  objc_msgSend(v10, "setDelegate:", self);

}

- (void)dealloc
{
  objc_super v3;

  -[IMPopoverAction dismissPopover](self, "dismissPopover");
  v3.receiver = self;
  v3.super_class = (Class)IMPopoverAction;
  -[IMPopoverAction dealloc](&v3, "dealloc");
}

- (void)dismissPopover
{
  UIViewController *viewControllerPresentedInPopover;
  UIViewController *v4;
  UIViewController *v5;
  _QWORD block[4];
  UIViewController *v7;

  viewControllerPresentedInPopover = self->_viewControllerPresentedInPopover;
  if (viewControllerPresentedInPopover)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008979C;
    block[3] = &unk_1004A6200;
    v7 = viewControllerPresentedInPopover;
    v4 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v5 = self->_viewControllerPresentedInPopover;
    self->_viewControllerPresentedInPopover = 0;

  }
}

- (void)updatePopover
{
  UIViewController *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  UIViewController *v15;
  id v16;
  id location;

  v3 = self->_viewControllerPresentedInPopover;
  v4 = objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](v3, "presentingViewController"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](v3, "presentingViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollection"));
    v8 = objc_msgSend(v7, "horizontalSizeClass");

    if (v8 != (id)1)
    {
      objc_initWeak(&location, self);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMAction controller](self, "controller"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](v3, "presentingViewController"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100089988;
      v13[3] = &unk_1004A82E8;
      v12 = v10;
      v14 = v12;
      v15 = v3;
      objc_copyWeak(&v16, &location);
      objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 0, v13);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerPresentedInPopover, 0);
}

@end
