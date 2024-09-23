@implementation UINavigationController

- (id)im_visibleChildViewControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self, "topViewController"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self, "topViewController"));
    v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)im_dismissChildViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  UINavigationController *v13;
  _BOOL8 v14;
  id v15;
  id v16;
  objc_super v17;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController childViewControllers](self, "childViewControllers"));
  v8 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController delegate](self, "delegate"));
  v10 = BUProtocolCast(&OBJC_PROTOCOL___IMNavigationControllerDelegateAdditions, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL
    || (objc_opt_respondsToSelector(v11, "im_navigationController:dismissChildViewController:animated:") & 1) == 0)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self, "topViewController"));

    if (v12 == v6)
    {
      v13 = self;
      v14 = v4;
    }
    else
    {
      if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v17.receiver = self;
        v17.super_class = (Class)UINavigationController;
        -[UINavigationController im_dismissChildViewController:animated:](&v17, "im_dismissChildViewController:animated:", self, v4);
        goto LABEL_10;
      }
      v15 = -[UINavigationController popToViewController:animated:](self, "popToViewController:animated:", v6, 0);
      v13 = self;
      v14 = 0;
    }
    v16 = -[UINavigationController popViewControllerAnimated:](v13, "popViewControllerAnimated:", v14);
    goto LABEL_10;
  }
  objc_msgSend(v11, "im_navigationController:dismissChildViewController:animated:", self, v6, v4);
LABEL_10:

}

- (void)bc_updateNavBarVisibleWithTransitionCoordinator:(id)a3 duration:(double)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  _QWORD v14[6];

  v6 = a3;
  v7 = objc_opt_class(UISearchController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self, "topViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));
  v10 = BUDynamicCast(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if ((objc_msgSend(v11, "hidesNavigationBarDuringPresentation") & 1) == 0)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_113F94;
    v14[3] = &unk_28BA50;
    v14[4] = self;
    *(double *)&v14[5] = a4;
    v12 = objc_retainBlock(v14);
    v13 = v12;
    if (v6)
      objc_msgSend(v6, "animateAlongsideTransition:completion:", v12, 0);
    else
      ((void (*)(_QWORD *, _QWORD))v12[2])(v12, 0);

  }
}

- (void)bc_updateNavBarVisibleWithTransitionCoordinator:(id)a3
{
  -[UINavigationController bc_updateNavBarVisibleWithTransitionCoordinator:duration:](self, "bc_updateNavBarVisibleWithTransitionCoordinator:duration:", a3, 0.4);
}

- (id)bc_navBarSnapshot
{
  void *v2;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  CGFloat MaxY;
  void *v10;
  id v11;
  id v12;
  void *v13;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationBar](self, "navigationBar"));
  objc_msgSend(v2, "frame");
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  v7 = CGRectGetHeight(v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v8 = CGRectGetWidth(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MaxY = CGRectGetMaxY(v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, 0.0, -(MaxY - v7), v8, v7 + MaxY - v7, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right));
  v11 = objc_alloc((Class)UIView);
  objc_msgSend(v10, "frame");
  v12 = objc_msgSend(v11, "initWithFrame:");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "barTintColor"));
  objc_msgSend(v12, "setBackgroundColor:", v13);

  objc_msgSend(v12, "addSubview:", v10);
  return v12;
}

- (id)_bc_activeNavBarSnapshot
{
  return objc_getAssociatedObject(self, &off_291700);
}

- (void)_bc_setActiveNavBarSnapshot:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[UINavigationController _bc_activeNavBarSnapshot](self, "_bc_activeNavBarSnapshot"));
  objc_msgSend(v5, "removeFromSuperview");
  objc_setAssociatedObject(self, &off_291700, v4, (char *)&dword_0 + 1);

}

@end
