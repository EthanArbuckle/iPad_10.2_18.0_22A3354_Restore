@implementation ICStartupQuickNoteFirstLaunchPresentationController

- (ICStartupQuickNoteFirstLaunchPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  ICStartupQuickNoteFirstLaunchPresentationController *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICStartupQuickNoteFirstLaunchPresentationController;
  v4 = -[ICStartupQuickNoteFirstLaunchPresentationController initWithPresentedViewController:presentingViewController:](&v10, "initWithPresentedViewController:presentingViewController:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init((Class)UIView);
    -[ICStartupQuickNoteFirstLaunchPresentationController setDimmingView:](v4, "setDimmingView:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorWithAlphaComponent:", 0.4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchPresentationController dimmingView](v4, "dimmingView"));
    objc_msgSend(v8, "setBackgroundColor:", v7);

  }
  return v4;
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
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchPresentationController containerView](self, "containerView"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchPresentationController presentedView](self, "presentedView"));
  LODWORD(v13) = 1148846080;
  LODWORD(v14) = 1112014848;
  objc_msgSend(v12, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", 270.0, UILayoutFittingCompressedSize.height, v13, v14);
  v16 = v15;
  v18 = v17;

  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  v19 = CGRectGetMidX(v24) - v16 * 0.5;
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  v20 = CGRectGetMidY(v25) - v18 * 0.5;
  v21 = v19;
  v22 = v16;
  v23 = v18;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v20;
  result.origin.x = v21;
  return result;
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICStartupQuickNoteFirstLaunchPresentationController;
  -[ICStartupQuickNoteFirstLaunchPresentationController presentationTransitionWillBegin](&v9, "presentationTransitionWillBegin");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchPresentationController containerView](self, "containerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchPresentationController dimmingView](self, "dimmingView"));
  objc_msgSend(v3, "addSubview:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchPresentationController dimmingView](self, "dimmingView"));
  objc_msgSend(v5, "setAlpha:", 0.0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchPresentationController presentedViewController](self, "presentedViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitionCoordinator"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C9940;
  v8[3] = &unk_1005500E8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

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
  _QWORD v13[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchPresentationController containerView](self, "containerView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchPresentationController dimmingView](self, "dimmingView"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000C9A40;
  v13[3] = &unk_100550110;
  v13[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v13, 0.0);
}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICStartupQuickNoteFirstLaunchPresentationController;
  -[ICStartupQuickNoteFirstLaunchPresentationController dismissalTransitionWillBegin](&v6, "dismissalTransitionWillBegin");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupQuickNoteFirstLaunchPresentationController presentedViewController](self, "presentedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitionCoordinator"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C9B5C;
  v5[3] = &unk_1005500E8;
  v5[4] = self;
  objc_msgSend(v4, "animateAlongsideTransition:completion:", v5, 0);

}

- (double)transitionDuration:(id)a3
{
  return 0.25;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  id v12;
  void *v13;
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
  id *v24;
  id *v25;
  id v26;
  id v27;
  _QWORD *v28;
  void ***v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  id v34;
  id v35;
  void **v36;
  uint64_t v37;
  id (*v38)(uint64_t);
  void *v39;
  id v40;
  _QWORD v41[4];
  void *v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  void *v46;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v9 = objc_opt_class(ICStartupQuickNoteFirstLaunchViewController);
  isKindOfClass = objc_opt_isKindOfClass(v6, v9);
  v11 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "addSubview:", v7);
    v11 = v6;
  }
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  objc_msgSend(v4, "finalFrameForViewController:", v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  objc_msgSend(v13, "setFrame:", v15, v17, v19, v21);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v13, "setAlpha:", 0.0);
    -[ICStartupQuickNoteFirstLaunchPresentationController transitionDuration:](self, "transitionDuration:", v4);
    v23 = v22;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1000C9E38;
    v45[3] = &unk_100550110;
    v24 = &v46;
    v46 = v13;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000C9E44;
    v43[3] = &unk_100550BE8;
    v25 = &v44;
    v44 = v4;
    v26 = v4;
    v27 = v13;
    v28 = v45;
    v29 = (void ***)v43;
    v30 = v23;
    v31 = 4;
  }
  else
  {
    -[ICStartupQuickNoteFirstLaunchPresentationController transitionDuration:](self, "transitionDuration:", v4);
    v33 = v32;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1000C9E50;
    v41[3] = &unk_100550110;
    v24 = &v42;
    v42 = v13;
    v36 = _NSConcreteStackBlock;
    v37 = 3221225472;
    v38 = sub_1000C9E7C;
    v39 = &unk_100550BE8;
    v25 = &v40;
    v40 = v4;
    v34 = v4;
    v35 = v13;
    v28 = v41;
    v29 = &v36;
    v30 = v33;
    v31 = 65540;
  }
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v31, v28, v29, v30, 0.0, v36, v37, v38, v39);

}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
}

@end
