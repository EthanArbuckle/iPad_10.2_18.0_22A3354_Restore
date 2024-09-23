@implementation HODiscoverModalPresentationController

- (BOOL)shouldAllowViewTranslation
{
  void *v2;
  void *v3;
  double v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController presentedViewController](self, "presentedViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));
  objc_msgSend(v3, "frame");
  v5 = v4 > 40.0;

  return v5;
}

- (void)dismissalPanTranslationChanged:(double)a3
{
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v4 = a3 + 40.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController presentedViewController](self, "presentedViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController presentedViewController](self, "presentedViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v12, "frame");
  v14 = v13;

  v16 = (id)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController presentedViewController](self, "presentedViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
  objc_msgSend(v15, "setFrame:", v14, fmax(v4, 40.0), v8, v10);

}

- (void)dismissalPanTranslationEnded
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController presentedViewController](self, "presentedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v4, "bounds");
  v6 = v5 * 0.75;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController presentedViewController](self, "presentedViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v8, "frame");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController presentedViewController](self, "presentedViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v12, "bounds");
  v14 = v13 - v10;

  if (v14 >= v6)
  {
    -[HODiscoverModalPresentationController _setPresenteViewControllerBackToOriginalPosition](self, "_setPresenteViewControllerBackToOriginalPosition");
  }
  else
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController presentedViewController](self, "presentedViewController"));
    objc_msgSend(v15, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (CGRect)frameOfPresentedViewInContainerView
{
  void *v3;
  void *v4;
  double v5;
  float v6;
  void *v7;
  double v8;
  float v9;
  double v10;
  double width;
  void *v12;
  double v13;
  double x;
  void *v15;
  double v16;
  double height;
  double y;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController containerView](self, "containerView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController containerView](self, "containerView"));
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController containerView](self, "containerView"));
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v10 = fminf(v6, v9);

    width = v10 + -120.0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController containerView](self, "containerView"));
    objc_msgSend(v12, "bounds");
    x = (v13 - width) * 0.5;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController containerView](self, "containerView"));
    objc_msgSend(v15, "bounds");
    height = v16 + -40.0;

    y = 40.0;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v19 = x;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = y;
  result.origin.x = v19;
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
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController presentedView](self, "presentedView"));

  if (v3)
  {
    -[HODiscoverModalPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v12 = (id)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController presentedView](self, "presentedView"));
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  }
}

- (void)presentationTransitionWillBegin
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  _QWORD v43[4];

  v3 = objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController containerView](self, "containerView"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController presentedViewController](self, "presentedViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transitionCoordinator"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController blurView](self, "blurView"));

      if (!v7)
      {
        v8 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", 0);
        -[HODiscoverModalPresentationController setBlurView:](self, "setBlurView:", v8);

        v9 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController blurView](self, "blurView"));
        objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        v10 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleTap:");
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController blurView](self, "blurView"));
        objc_msgSend(v11, "addGestureRecognizer:", v10);

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController blurView](self, "blurView"));
      objc_msgSend(v12, "setEffect:", 0);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController containerView](self, "containerView"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController blurView](self, "blurView"));
      objc_msgSend(v13, "addSubview:", v14);

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController blurView](self, "blurView"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController containerView](self, "containerView"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "leadingAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
      v43[0] = v37;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController blurView](self, "blurView"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "trailingAnchor"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController containerView](self, "containerView"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
      v43[1] = v32;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController blurView](self, "blurView"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController containerView](self, "containerView"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v16));
      v43[2] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController blurView](self, "blurView"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController containerView](self, "containerView"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
      v43[3] = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController blurView](self, "blurView"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "contentView"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController presentedViewController](self, "presentedViewController"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "view"));
      objc_msgSend(v25, "addSubview:", v27);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController presentedViewController](self, "presentedViewController"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "transitionCoordinator"));
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_10003E6A4;
      v42[3] = &unk_1000B7D08;
      v42[4] = self;
      objc_msgSend(v29, "animateAlongsideTransition:completion:", v42, 0);

    }
  }
}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController presentedViewController](self, "presentedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitionCoordinator"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController presentedViewController](self, "presentedViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transitionCoordinator"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10003E7B0;
    v7[3] = &unk_1000B7D08;
    v7[4] = self;
    objc_msgSend(v6, "animateAlongsideTransition:completion:", v7, 0);

  }
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  id v3;

  if (a3)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController blurView](self, "blurView"));
    objc_msgSend(v3, "removeFromSuperview");

  }
}

- (void)handleTap:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController presentingViewController](self, "presentingViewController", a3));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_setPresenteViewControllerBackToOriginalPosition
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController presentedViewController](self, "presentedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v4, "frame");
  v6 = v5;

  if (v6 != 40.0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalPresentationController presentedViewController](self, "presentedViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    objc_msgSend(v8, "layoutIfNeeded");

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003E934;
    v9[3] = &unk_1000B5A50;
    v9[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v9, 0, 0.300000012, 0.0);
  }
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end
