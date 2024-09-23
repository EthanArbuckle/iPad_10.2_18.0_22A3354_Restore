@implementation MFTransferSplitViewController

- (MFTransferSplitViewController)initWithItems:(id)a3 scene:(id)a4 options:(unint64_t)a5 didDismissHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  MFTransferSplitViewController *v14;
  MFTransferSplitViewController *v15;
  id v16;
  id didDismissHandler;
  void *v18;
  void *v19;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)MFTransferSplitViewController;
  v14 = -[MFTransferSplitViewController initWithStyle:](&v21, "initWithStyle:", 2);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_itemsToDisplay, a3);
    objc_storeWeak((id *)&v15->_scene, v12);
    v15->_transferOptions = a5;
    v16 = objc_retainBlock(v13);
    didDismissHandler = v15->_didDismissHandler;
    v15->_didDismissHandler = v16;

    -[MFTransferSplitViewController setDelegate:](v15, "setDelegate:", v15);
    v18 = (void *)objc_opt_new(UISlidingBarConfiguration);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailSplitViewBorderColor](UIColor, "mailSplitViewBorderColor"));
    objc_msgSend(v18, "setBorderColor:", v19);

    -[MFTransferSplitViewController setConfiguration:](v15, "setConfiguration:", v18);
  }

  return v15;
}

- (TransferNavigationController)transferNavigationController
{
  TransferNavigationController *transferNavigationController;
  TransferNavigationController *v4;
  NSArray *itemsToDisplay;
  void *v6;
  TransferNavigationController *v7;
  TransferNavigationController *v8;

  transferNavigationController = self->_transferNavigationController;
  if (!transferNavigationController)
  {
    v4 = [TransferNavigationController alloc];
    itemsToDisplay = self->_itemsToDisplay;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController scene](self, "scene"));
    v7 = -[TransferNavigationController initWithMessages:scene:options:](v4, "initWithMessages:scene:options:", itemsToDisplay, v6, self->_transferOptions);
    v8 = self->_transferNavigationController;
    self->_transferNavigationController = v7;

    transferNavigationController = self->_transferNavigationController;
  }
  return transferNavigationController;
}

- (MFTransferStackViewController)stackViewController
{
  MFTransferStackViewController *stackViewController;
  MFTransferStackViewController *v4;
  void *v5;
  MFTransferStackViewController *v6;
  MFTransferStackViewController *v7;

  stackViewController = self->_stackViewController;
  if (!stackViewController)
  {
    v4 = [MFTransferStackViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController scene](self, "scene"));
    v6 = -[MFTransferStackViewController initWithScene:](v4, "initWithScene:", v5);
    v7 = self->_stackViewController;
    self->_stackViewController = v6;

    stackViewController = self->_stackViewController;
  }
  return stackViewController;
}

- (AccountListController)accountListController
{
  AccountListController *accountListController;
  unint64_t transferOptions;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AccountListController *v10;
  void *v11;
  AccountListController *v12;
  AccountListController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;

  accountListController = self->_accountListController;
  if (!accountListController)
  {
    transferOptions = self->_transferOptions;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController transferNavigationController](self, "transferNavigationController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mailboxPickerController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sourceAccounts"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController _disabledMailAccountForSourceAccounts:toSameAccountOnly:](self, "_disabledMailAccountForSourceAccounts:toSameAccountOnly:", v8, (transferOptions >> 7) & 1));
    if ((self->_transferOptions & 0x80) != 0 && objc_msgSend(v8, "count") != (id)1)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFTransferSplitViewController.m"), 80, CFSTR("TransferOptionSameAccountOnly option only allows messages in one account. Accounts: %@"), v8);

    }
    v10 = [AccountListController alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController scene](self, "scene"));
    v12 = -[AccountListController initWithScene:](v10, "initWithScene:", v11);
    v13 = self->_accountListController;
    self->_accountListController = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController transferNavigationController](self, "transferNavigationController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mailboxPickerController"));
    -[AccountListController setAccountListDelegate:](self->_accountListController, "setAccountListDelegate:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController transferNavigationController](self, "transferNavigationController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mailboxPickerController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "account"));
    -[AccountListController setSelectedAccount:](self->_accountListController, "setSelectedAccount:", v18);

    -[AccountListController setDisabledAccounts:](self->_accountListController, "setDisabledAccounts:", v9);
    accountListController = self->_accountListController;
  }
  return accountListController;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  UINavigationController *v15;
  UINavigationController *stackNavigationController;
  void *v17;
  void *v18;
  unint64_t transferOptions;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v3 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MFTransferSplitViewController;
  -[MFTransferSplitViewController viewWillAppear:](&v30, "viewWillAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController stackViewController](self, "stackViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationController"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewControllers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController stackViewController](self, "stackViewController"));

    if (v8 == v9)
      v10 = objc_msgSend(v6, "popViewControllerAnimated:", 0);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController transferNavigationController](self, "transferNavigationController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mailboxPickerController"));
  objc_msgSend(v12, "setAnimationDelegate:", self);

  v13 = objc_alloc((Class)UINavigationController);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController stackViewController](self, "stackViewController"));
  v15 = (UINavigationController *)objc_msgSend(v13, "initWithRootViewController:", v14);
  stackNavigationController = self->_stackNavigationController;
  self->_stackNavigationController = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController accountListController](self, "accountListController"));
  -[MFTransferSplitViewController setViewController:forColumn:](self, "setViewController:forColumn:", v17, 0);

  -[MFTransferSplitViewController setViewController:forColumn:](self, "setViewController:forColumn:", v11, 1);
  -[MFTransferSplitViewController setViewController:forColumn:](self, "setViewController:forColumn:", self->_stackNavigationController, 2);
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001B7294;
  v25[3] = &unk_10051C150;
  v25[4] = &v26;
  -[MFTransferSplitViewController executeIfSplitViewIsAvailable:](self, "executeIfSplitViewIsAvailable:", v25);
  -[MFTransferSplitViewController _restoreLayoutForDisplayMode:](self, "_restoreLayoutForDisplayMode:", v27[3]);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController view](self, "view"));
  objc_msgSend(v18, "layoutIfNeeded");

  transferOptions = self->_transferOptions;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController stackViewController](self, "stackViewController"));
  objc_msgSend(v20, "setTransferOptions:", transferOptions);

  objc_msgSend(v11, "beginAppearanceTransition:animated:", 1, v3);
  -[UINavigationController beginAppearanceTransition:animated:](self->_stackNavigationController, "beginAppearanceTransition:animated:", 1, v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController stackViewController](self, "stackViewController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stackController"));
  LOBYTE(transferOptions) = objc_msgSend(v22, "hasStackedItems");

  if ((transferOptions & 1) == 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray ef_map:](self->_itemsToDisplay, "ef_map:", &stru_100522E70));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController stackViewController](self, "stackViewController"));
    objc_msgSend(v24, "displayStackedViewsForItemsWithIDs:", v23);

  }
  _Block_object_dispose(&v26, 8);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFTransferSplitViewController;
  -[MFTransferSplitViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  if (-[MFTransferSplitViewController displayMode](self, "displayMode") == (id)1)
    -[MFTransferSplitViewController _ensureSupplementaryViewControllerIsVisibleAnimated:](self, "_ensureSupplementaryViewControllerIsVisibleAnimated:", 1);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MFTransferSplitViewController;
  -[MFTransferSplitViewController viewDidLoad](&v16, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController scene](self, "scene"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mf_window"));
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController view](self, "view"));
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFTransferSplitViewController;
  -[MFTransferSplitViewController viewDidDisappear:](&v6, "viewDidDisappear:", a3);
  v4 = objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController didDismissHandler](self, "didDismissHandler"));
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  -[MFTransferSplitViewController setDidDismissHandler:](self, "setDidDismissHandler:", 0);

}

- (void)_restoreLayoutForDisplayMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) <= 4)
    -[MFTransferSplitViewController mf_setColumn:visible:animated:completion:](self, "mf_setColumn:visible:animated:completion:", qword_1004C9B30[a3 - 2], 1, 0, 0);
}

- (void)_ensureSupplementaryViewControllerIsVisibleAnimated:(BOOL)a3
{
  -[MFTransferSplitViewController mf_setColumn:visible:animated:completion:](self, "mf_setColumn:visible:animated:completion:", 1, 1, a3, 0);
}

- (void)setUsePushFromLeftPresentation:(BOOL)a3
{
  MFTransferSplitViewController *v3;

  self->_usePushFromLeftPresentation = a3;
  if (a3)
    v3 = self;
  else
    v3 = 0;
  -[MFTransferSplitViewController setTransitioningDelegate:](self, "setTransitioningDelegate:", v3);
}

- (void)transferMailboxPickerController:(id)a3 animateMessageToPoint:(CGPoint)a4 inView:(id)a5 completion:(id)a6
{
  double y;
  double x;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat b;
  CGFloat c;
  CGFloat d;
  CGFloat tx;
  CGFloat ty;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  __int128 v60;
  double v61;
  double a;
  double v63;
  double v64;
  double v65;
  double v66;
  CGPath *Mutable;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  double v74;
  double v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  CGAffineTransform v80;
  CGAffineTransform m;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[7];

  y = a4.y;
  x = a4.x;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
  objc_msgSend(v10, "convertPoint:toView:", 0, x, y);
  objc_msgSend(v12, "convertPoint:toWindow:", 0);
  v14 = v13;
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController stackViewController](self, "stackViewController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stackContainerView"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "snapshotView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController view](self, "view"));
  objc_msgSend(v18, "frame");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "superview"));
  objc_msgSend(v20, "convertRect:fromView:", v29, v22, v24, v26, v28);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;

  objc_msgSend(v20, "addSubview:", v19);
  objc_msgSend(v19, "setFrame:", v31, v33, v35, v37);
  b = CGAffineTransformIdentity.b;
  c = CGAffineTransformIdentity.c;
  d = CGAffineTransformIdentity.d;
  tx = CGAffineTransformIdentity.tx;
  ty = CGAffineTransformIdentity.ty;
  v85[0] = *(_QWORD *)&CGAffineTransformIdentity.a;
  *(CGFloat *)&v85[1] = b;
  *(CGFloat *)&v85[2] = c;
  *(CGFloat *)&v85[3] = d;
  *(CGFloat *)&v85[4] = tx;
  *(CGFloat *)&v85[5] = ty;
  objc_msgSend(v19, "setTransform:", v85);
  objc_msgSend(v18, "setHidden:", 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layer"));
  objc_msgSend(v43, "position");
  v45 = v44;
  v47 = v46;

  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "superview"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "window"));
  objc_msgSend(v49, "convertPoint:fromWindow:", 0, v14, v16);
  objc_msgSend(v48, "convertPoint:fromView:", 0);
  v51 = v50;
  v53 = v52;

  v74 = v53;
  v75 = v51;
  if (v19)
  {
    objc_msgSend(v19, "transform");
    v54 = *((double *)&v82 + 1);
    v55 = *(double *)&v82;
    v57 = *((double *)&v83 + 1);
    v56 = *(double *)&v83;
    v59 = *((double *)&v84 + 1);
    v58 = *(double *)&v84;
  }
  else
  {
    v83 = 0u;
    v84 = 0u;
    v82 = 0u;
    v59 = 0.0;
    v57 = 0.0;
    v54 = 0.0;
    v58 = 0.0;
    v56 = 0.0;
    v55 = 0.0;
  }
  *(_QWORD *)&v60 = -1;
  *((_QWORD *)&v60 + 1) = -1;
  *(_OWORD *)&m.c = v60;
  *(_OWORD *)&m.tx = v60;
  *(_OWORD *)&m.a = v60;
  if (v19)
    objc_msgSend(v19, "transform");
  else
    memset(&v80, 0, sizeof(v80));
  CGAffineTransformTranslate(&m, &v80, v58 + v47 * v56 + v55 * v45 - v45, v59 + v47 * v57 + v54 * v45 - v47);
  a = m.a;
  v61 = m.b;
  v64 = m.c;
  v63 = m.d;
  v66 = m.tx;
  v65 = m.ty;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, &m, v45, v47);
  CGPathAddQuadCurveToPoint(Mutable, &m, (v45 + v66 + v74 * v64 + a * v75) * 0.5 + 0.0, (v47 + v65 + v74 * v63 + v61 * v75) * 0.5 + -450.0, v66 + v74 * v64 + a * v75, v65 + v74 * v63 + v61 * v75);
  v68 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("position")));
  objc_msgSend(v69, "setPath:", Mutable);
  CGPathRelease(Mutable);
  objc_msgSend(v68, "addObject:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[CAAnimationGroup animation](CAAnimationGroup, "animation"));
  objc_msgSend(v70, "setDuration:", UIAnimationDragCoefficient(objc_msgSend(v70, "setAnimations:", v68)) * 0.5);
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layer"));
  objc_msgSend(v71, "addAnimation:forKey:", v70, 0);

  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_1001B7AE0;
  v78[3] = &unk_10051AA98;
  v72 = v19;
  v79 = v72;
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_1001B7B98;
  v76[3] = &unk_10051C658;
  v73 = v11;
  v77 = v73;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 196609, v78, v76, 0.200000003, 0.299999997);

}

- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4
{
  return self->_stackNavigationController;
}

- (void)splitViewController:(id)a3 willCollapseToProposedTopColumn:(int64_t *)a4
{
  *a4 = 1;
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController stackViewController](self, "stackViewController"));
  objc_msgSend(v6, "updateForDisplayMode:isCollapsed:", a4, objc_msgSend(v7, "isCollapsed"));

}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v5;
  uint64_t v6;
  MFTransferSplitViewPresentationAnimationController *v7;

  v5 = a3;
  v6 = objc_opt_class(MFTransferSplitViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = objc_alloc_init(MFTransferSplitViewPresentationAnimationController);
  else
    v7 = 0;

  return v7;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v3;
  uint64_t v4;
  MFTransferSplitViewDismissalAnimationController *v5;

  v3 = a3;
  v4 = objc_opt_class(MFTransferSplitViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = objc_alloc_init(MFTransferSplitViewDismissalAnimationController);
  else
    v5 = 0;

  return v5;
}

- (BOOL)executeIfSplitViewIsAvailable:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  unsigned int v6;
  void *v7;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferSplitViewController scene](self, "scene"));
  v6 = objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___SplitLayoutCapable);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "splitViewController"));
    v4[2](v4, v7);

  }
  return v6;
}

- (id)_disabledMailAccountForSourceAccounts:(id)a3 toSameAccountOnly:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v17;
  id obj;
  uint64_t v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v4 = a4;
  v17 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountsProvider"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayedAccounts"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v17;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v8)
  {
    v19 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      v21 = v8;
      do
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v9);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v11 = v20;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v23;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v11);
              v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v14);
              if (v4 && v15 != v10
                || (+[MailAccount canMoveMessagesFromAccount:toAccount:](MailAccount, "canMoveMessagesFromAccount:toAccount:", v10, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v14)) & 1) == 0)
              {
                objc_msgSend(v7, "addObject:", v15);
              }
              v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v12);
        }

        v9 = (char *)v9 + 1;
      }
      while (v9 != v21);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }

  return v7;
}

- (void)setTransferNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_transferNavigationController, a3);
}

- (void)setStackViewController:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewController, a3);
}

- (BOOL)usePushFromLeftPresentation
{
  return self->_usePushFromLeftPresentation;
}

- (MessageDisplayCapable)scene
{
  return (MessageDisplayCapable *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void)setAccountListController:(id)a3
{
  objc_storeStrong((id *)&self->_accountListController, a3);
}

- (id)didDismissHandler
{
  return self->_didDismissHandler;
}

- (void)setDidDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didDismissHandler, 0);
  objc_storeStrong((id *)&self->_accountListController, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_stackViewController, 0);
  objc_storeStrong((id *)&self->_transferNavigationController, 0);
  objc_storeStrong((id *)&self->_stackNavigationController, 0);
  objc_storeStrong((id *)&self->_itemsToDisplay, 0);
}

@end
