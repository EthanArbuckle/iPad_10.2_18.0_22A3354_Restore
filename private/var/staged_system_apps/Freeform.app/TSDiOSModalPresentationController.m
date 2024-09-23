@implementation TSDiOSModalPresentationController

- (TSDiOSModalPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  TSDiOSModalPresentationController *v4;
  UIView *v5;
  UIView *dimmingView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDiOSModalPresentationController;
  v4 = -[TSDiOSModalPresentationController initWithPresentedViewController:presentingViewController:](&v9, "initWithPresentedViewController:presentingViewController:", a3, a4);
  if (v4)
  {
    v5 = objc_opt_new(UIView);
    dimmingView = v4->_dimmingView;
    v4->_dimmingView = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.4));
    -[UIView setBackgroundColor:](v4->_dimmingView, "setBackgroundColor:", v7);

    -[UIView setAutoresizingMask:](v4->_dimmingView, "setAutoresizingMask:", 18);
  }
  return v4;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[TSDiOSModalPresentationController presentedViewController](self, "presentedViewController"));

  if (v8 == v7)
  {
    objc_msgSend(v7, "preferredContentSize");
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)TSDiOSModalPresentationController;
    -[TSDiOSModalPresentationController sizeForChildContentContainer:withParentContainerSize:](&v15, "sizeForChildContentContainer:withParentContainerSize:", v7, width, height);
  }
  v11 = v9;
  v12 = v10;

  v13 = v11;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDiOSModalPresentationController containerView](self, "containerView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TSDiOSModalPresentationController presentedViewController](self, "presentedViewController"));
  objc_msgSend(v12, "preferredContentSize");
  v13 = sub_10005FDDC();
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = sub_1000616BC(v13, v15, v17, v19, v5, v7, v9, v11);
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDiOSModalPresentationController containerView](self, "containerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDiOSModalPresentationController presentedView](self, "presentedView"));
  objc_msgSend(v3, "bounds");
  -[UIView setFrame:](self->_dimmingView, "setFrame:");
  objc_msgSend(v3, "addSubview:", self->_dimmingView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDiOSModalPresentationController presentedViewController](self, "presentedViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parentViewController"));

  if (v6)
  {
    objc_msgSend(v5, "willMoveToParentViewController:", 0);
    objc_msgSend(v4, "removeFromSuperview");
    objc_msgSend(v5, "removeFromParentViewController");
  }
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  objc_msgSend(v4, "setAutoresizingMask:", 45);
  objc_msgSend(v3, "addSubview:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transitionCoordinator"));
  if (v7)
  {
    -[UIView setAlpha:](self->_dimmingView, "setAlpha:", 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transitionCoordinator"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1003A95F0;
    v9[3] = &unk_10123ACD8;
    v9[4] = self;
    objc_msgSend(v8, "animateAlongsideTransition:completion:", v9, 0);

  }
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  if (!a3)
    -[UIView removeFromSuperview](self->_dimmingView, "removeFromSuperview");
}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSDiOSModalPresentationController presentedViewController](self, "presentedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitionCoordinator"));

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003A96AC;
  v5[3] = &unk_10123ACD8;
  v5[4] = self;
  objc_msgSend(v4, "animateAlongsideTransition:completion:", v5, 0);

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  -[UIView removeFromSuperview](self->_dimmingView, "removeFromSuperview", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
}

@end
