@implementation BSUIDimmingPresentationController

- (UIView)dimmingView
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)qword_32BF30;
  if (!qword_32BF30)
  {
    v4 = objc_alloc((Class)UIView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDimmingPresentationController containerView](self, "containerView"));
    objc_msgSend(v5, "bounds");
    v6 = objc_msgSend(v4, "initWithFrame:");
    v7 = (void *)qword_32BF30;
    qword_32BF30 = (uint64_t)v6;

    objc_msgSend((id)qword_32BF30, "setBackgroundColor:", self->_dimmingViewBackgroundColor);
    v3 = (void *)qword_32BF30;
  }
  return (UIView *)v3;
}

- (void)setDimmingViewBackgroundColor:(id)a3
{
  void *v5;
  UIColor *v6;

  v6 = (UIColor *)a3;
  if (self->_dimmingViewBackgroundColor != v6)
  {
    objc_storeStrong((id *)&self->_dimmingViewBackgroundColor, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDimmingPresentationController dimmingView](self, "dimmingView"));
    objc_msgSend(v5, "setBackgroundColor:", v6);

  }
}

- (void)presentationTransitionWillBegin
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDimmingPresentationController presentedViewController](self, "presentedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  objc_msgSend(v5, "setCornerRadius:", 20.0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDimmingPresentationController containerView](self, "containerView"));
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDimmingPresentationController dimmingView](self, "dimmingView"));
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDimmingPresentationController dimmingView](self, "dimmingView"));
  objc_msgSend(v16, "setAlpha:", 0.0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDimmingPresentationController containerView](self, "containerView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDimmingPresentationController dimmingView](self, "dimmingView"));
  objc_msgSend(v17, "addSubview:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDimmingPresentationController presentedViewController](self, "presentedViewController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "transitionCoordinator"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_70D0;
  v21[3] = &unk_2E3FB0;
  v21[4] = self;
  objc_msgSend(v20, "animateAlongsideTransition:completion:", v21, 0);

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  id v3;

  if (!a3)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[BSUIDimmingPresentationController dimmingView](self, "dimmingView"));
    objc_msgSend(v3, "removeFromSuperview");

  }
}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDimmingPresentationController presentedViewController](self, "presentedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitionCoordinator"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_71C0;
  v5[3] = &unk_2E3FB0;
  v5[4] = self;
  objc_msgSend(v4, "animateAlongsideTransition:completion:", v5, 0);

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  id v3;

  if (a3)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[BSUIDimmingPresentationController dimmingView](self, "dimmingView"));
    objc_msgSend(v3, "removeFromSuperview");

  }
}

- (CGRect)frameOfPresentedViewInContainerView
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDimmingPresentationController containerView](self, "containerView"));
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)containerViewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDimmingPresentationController containerView](self, "containerView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDimmingPresentationController dimmingView](self, "dimmingView"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[BSUIDimmingPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = (id)objc_claimAutoreleasedReturnValue(-[BSUIDimmingPresentationController presentedView](self, "presentedView"));
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

}

- (UIColor)dimmingViewBackgroundColor
{
  return self->_dimmingViewBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingViewBackgroundColor, 0);
}

@end
