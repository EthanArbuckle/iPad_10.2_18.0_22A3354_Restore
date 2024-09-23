@implementation BKViewController

- (BKViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BKViewController *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v6 = AEBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v11.receiver = self;
  v11.super_class = (Class)BKViewController;
  v8 = -[BKViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", v5, v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    -[BKViewController setLayoutDirection:](v8, "setLayoutDirection:", objc_msgSend(v9, "userInterfaceLayoutDirection"));

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[BKViewController releaseViews](self, "releaseViews");
  v3.receiver = self;
  v3.super_class = (Class)BKViewController;
  -[BKViewController dealloc](&v3, "dealloc");
}

- (void)releaseViews
{
  UIImageView *topLeftCorner;
  UIImageView *topRightCorner;
  objc_super v5;

  topLeftCorner = self->_topLeftCorner;
  self->_topLeftCorner = 0;

  topRightCorner = self->_topRightCorner;
  self->_topRightCorner = 0;

  -[BKViewController dismissCurrentPopover](self, "dismissCurrentPopover");
  -[BKViewController cleanupPopovers](self, "cleanupPopovers");
  v5.receiver = self;
  v5.super_class = (Class)BKViewController;
  -[BKViewController releaseViews](&v5, "releaseViews");
}

- (void)cleanupPopovers
{
  self->_currentPopoverDirections = 15;
}

- (void)dismissCurrentPopover
{
  -[BKViewController dismissCurrentPopoverWithCompletion:](self, "dismissCurrentPopoverWithCompletion:", 0);
}

- (void)dismissCurrentPopoverAnimated:(BOOL)a3
{
  -[BKViewController dismissCurrentPopoverWithCompletion:animated:](self, "dismissCurrentPopoverWithCompletion:animated:", 0, a3);
}

- (void)dismissCurrentPopoverWithCompletion:(id)a3
{
  -[BKViewController dismissCurrentPopoverWithCompletion:animated:](self, "dismissCurrentPopoverWithCompletion:animated:", a3, 1);
}

- (void)dismissCurrentPopoverWithCompletion:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  BOOL v23;
  uint8_t buf[4];
  void *v25;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKViewController bc_contextualPresentedViewController](self, "bc_contextualPresentedViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bc_deepestPresentedViewController"));

  if (!v8)
  {
    -[BKViewController cleanupPopovers](self, "cleanupPopovers");
    v17 = objc_retainBlock(v6);
    v10 = v17;
    if (v17)
      ((void (*))v17[2].isa)(v17);
    goto LABEL_6;
  }
  if ((objc_msgSend(v8, "isBeingPresented") & 1) != 0
    || objc_msgSend(v8, "isBeingDismissed"))
  {
    v9 = BCIMLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_11CA5C((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);
LABEL_6:

    goto LABEL_13;
  }
  v18 = BCIMLog();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v8;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "dismissCurrentPopoverWithCompletion: dismissing top view controller: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_6DB70;
  v20[3] = &unk_1C06A0;
  objc_copyWeak(&v22, (id *)buf);
  v21 = v6;
  v23 = v4;
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", v4, v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
LABEL_13:

}

- (void)setCurrentOverlayViewController:(id)a3
{
  UIViewController **p_currentOverlayViewController;
  id v5;
  id WeakRetained;
  unsigned __int8 v7;

  p_currentOverlayViewController = &self->_currentOverlayViewController;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_currentOverlayViewController);
  v7 = objc_msgSend(WeakRetained, "isEqual:", v5);

  objc_storeWeak((id *)p_currentOverlayViewController, v5);
  if ((v7 & 1) == 0)
    -[BKViewController didChangeCurrentOverlayViewController](self, "didChangeCurrentOverlayViewController");
}

- (id)barButtonItemForButton:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_opt_class(UIBarButtonItem);
  v5 = BUDynamicCast(v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (void)showOverlayViewController:(id)a3 fromItem:(id)a4 popoverOnPhone:(BOOL)a5 passthroughViews:(id)a6 popoverBackgroundColor:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  id v21;
  void ***v22;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  BOOL v34;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_6DE34;
  v29[3] = &unk_1C06C8;
  v29[4] = self;
  v34 = a5;
  v16 = v12;
  v30 = v16;
  v31 = v15;
  v32 = v14;
  v33 = v13;
  v17 = v13;
  v18 = v14;
  v19 = v15;
  v23 = _NSConcreteStackBlock;
  v24 = 3221225472;
  v25 = sub_6E198;
  v26 = &unk_1BF2A0;
  v27 = v16;
  v28 = objc_retainBlock(v29);
  v20 = v28;
  v21 = v16;
  v22 = objc_retainBlock(&v23);
  -[BKViewController dismissCurrentPopoverWithCompletion:](self, "dismissCurrentPopoverWithCompletion:", v22, v23, v24, v25, v26);

}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
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
  double v34;
  void *v35;
  id v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  void *v41;
  id v42;

  v42 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bc_realSourceBarButtonItem"));
  if (!v8)
    goto LABEL_8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_viewForPresenting"));
  objc_msgSend(v8, "_rectForPresenting");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v10, "bounds");
  objc_msgSend(v10, "convertRect:toView:", v9);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  objc_msgSend(v10, "convertRect:toView:", v9, v12, v14, v16, v18);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bc_fakeSourceView"));
  if (!v35)
  {
    v36 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v20, v22, v24, v26);
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v36, "setBackgroundColor:", v41);

    objc_msgSend(v36, "setUserInteractionEnabled:", 0);
    objc_msgSend(v9, "addSubview:", v36);
    if (!a5)
      goto LABEL_5;
    goto LABEL_4;
  }
  v36 = v35;
  objc_msgSend(v35, "setFrame:", v20, v22, v24, v26);
  if (a5)
LABEL_4:
    *a5 = objc_retainAutorelease(v36);
LABEL_5:
  if (a4)
  {
    objc_msgSend(v9, "convertRect:toView:", v36, v28, v30, v32, v34);
    a4->origin.x = v37;
    a4->origin.y = v38;
    a4->size.width = v39;
    a4->size.height = v40;
  }

LABEL_8:
}

- (void)hideOverlayViewControllerWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKViewController bc_contextualPresentedViewController](self, "bc_contextualPresentedViewController"));
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v4);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKViewController traitCollection](self, "traitCollection"));
  v6 = -[BKViewController adaptivePresentationStyleForPresentationController:traitCollection:](self, "adaptivePresentationStyleForPresentationController:traitCollection:", v4, v5);

  return v6;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v5;
  int64_t v6;
  char *v7;

  v5 = a4;
  if (-[BKViewController forcePopoverInsteadOfSheet](self, "forcePopoverInsteadOfSheet"))
  {
    v6 = -1;
  }
  else if (v5
         || (v5 = (id)objc_claimAutoreleasedReturnValue(-[BKViewController traitCollection](self, "traitCollection"))) != 0)
  {
    v7 = (char *)objc_msgSend(v5, "horizontalSizeClass");
    if (objc_msgSend(v5, "verticalSizeClass") == (char *)&dword_0 + 1 || v7 == (_BYTE *)&dword_0 + 1)
      v6 = 0;
    else
      v6 = 7;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  *(_QWORD *)&v4 = objc_opt_class(BKViewController).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController", v4));

  v8 = BUDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  objc_msgSend(v9, "ae_willDismissPopoverContainingThisViewController");
  return 1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  *(_QWORD *)&v4 = objc_opt_class(BKViewController).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "presentedViewController", v4));
  v8 = BUDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  objc_msgSend(v9, "ae_didDismissPopoverContainingThisViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "presentedViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKViewController currentOverlayViewController](self, "currentOverlayViewController"));

  if (v10 == v11)
    -[BKViewController setCurrentOverlayViewController:](self, "setCurrentOverlayViewController:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bc_fakeSourceView"));
  objc_msgSend(v12, "removeFromSuperview");

  objc_msgSend(v13, "setBc_fakeSourceView:", 0);
  objc_msgSend(v13, "setBc_realSourceBarButtonItem:", 0);

}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (UIViewController)currentOverlayViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_currentOverlayViewController);
}

- (BOOL)forcePopoverInsteadOfSheet
{
  return self->_forcePopoverInsteadOfSheet;
}

- (void)setForcePopoverInsteadOfSheet:(BOOL)a3
{
  self->_forcePopoverInsteadOfSheet = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentOverlayViewController);
  objc_storeStrong((id *)&self->_topRightCorner, 0);
  objc_storeStrong((id *)&self->_topLeftCorner, 0);
}

@end
