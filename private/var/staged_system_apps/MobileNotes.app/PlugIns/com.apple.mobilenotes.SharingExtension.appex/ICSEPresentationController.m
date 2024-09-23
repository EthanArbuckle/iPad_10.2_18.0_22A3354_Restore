@implementation ICSEPresentationController

- (CGRect)frameOfPresentedViewInContainerView:(id)a3 withKeyboardFrame:(CGRect)a4 topLayoutGuideLength:(double)a5
{
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  -[ICSEPresentationController idealFrameForMainViewControllerWithoutKeyboardForContainerView:topLayoutGuideHeight:](self, "idealFrameForMainViewControllerWithoutKeyboardForContainerView:topLayoutGuideHeight:", a3, a5);
  -[ICSEPresentationController adjustFrame:forKeyboardFrame:topLayoutGuideHeight:](self, "adjustFrame:forKeyboardFrame:topLayoutGuideHeight:", *(_QWORD *)&a5);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)adjustFrame:(CGRect)a3 forKeyboardFrame:(CGRect)a4 topLayoutGuideHeight:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  double v11;
  double v12;
  double MinY;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double MaxY;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  if (!-[ICSEPresentationController isShowingSearchResults](self, "isShowingSearchResults"))
  {
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    if (!CGRectIsNull(v26))
    {
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      if (!CGRectIsEmpty(v27))
      {
        v28.origin.x = v12;
        v28.origin.y = v11;
        v28.size.width = v10;
        v28.size.height = v9;
        MaxY = CGRectGetMaxY(v28);
        v29.origin.x = x;
        v29.origin.y = y;
        v29.size.width = width;
        v29.size.height = height;
        MinY = CGRectGetMinY(v29);
        v15 = -[ICSEPresentationController keyboardMargin](self, "keyboardMargin");
        v17 = MinY - v16;
        if (MaxY > v17)
        {
          v12 = TSDClipRectToMinY(v15, v12, v11 - (MaxY - v17), v10, v9, a5 + 8.0);
          v11 = v18;
          v10 = v19;
          v9 = v20;
        }
      }
    }
  }
  v21 = v12;
  v22 = v11;
  v23 = v10;
  v24 = v9;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)idealFrameForMainViewControllerWithoutKeyboardForContainerView:(id)a3 topLayoutGuideHeight:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  unsigned int v18;
  double width;
  double height;
  id v21;
  double v22;
  double v23;
  _BOOL8 v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGRect v39;
  CGRect v40;
  CGRect result;

  objc_msgSend(a3, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[ICSEPresentationController horizontalMargin](self, "horizontalMargin");
  v15 = v14;
  -[ICSEPresentationController verticalMargin](self, "verticalMargin");
  v17 = v16;
  v18 = +[UIDevice ic_isiPad](UIDevice, "ic_isiPad");
  v39.origin.x = v7;
  v39.origin.y = v9;
  v39.size.width = v11;
  v39.size.height = v13;
  v40 = CGRectInset(v39, v15, v17);
  width = v40.size.width;
  height = v40.size.height;
  v21 = -[ICSEPresentationController maxSize](self, "maxSize", v40.origin.x, v40.origin.y);
  TSDSizeWithMaxSize(v21, width, height, v22, v23);
  v24 = -[ICSEPresentationController isShowingSearchResults](self, "isShowingSearchResults");
  if (!v24
    && ICAccessibilityAccessibilityLargerTextSizesEnabled(v24, v25)
    && (-[ICSEPresentationController isPortrait](self, "isPortrait") | v18) == 1)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEPresentationController rootViewController](self, "rootViewController"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "traitCollection"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "preferredContentSizeCategory"));
    ICAccessibilityLinearInterpolatedValueForAccessibilityContentSizeCategory(1.0, 1.8);

  }
  -[ICSEPresentationController isPortrait](self, "isPortrait");
  -[ICSEPresentationController isPortrait](self, "isPortrait");
  v29 = TSDCenterOfRect(v7, v9, v11, v13);
  v30 = TSDRectWithCenterAndSize(v29);
  v35 = TSDClipRectToMinY(v30, v31, v32, v33, v34, v17 + a4);
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (CGSize)maxSize
{
  unsigned int v3;
  double v4;
  double v5;
  unsigned int v6;
  CGSize result;

  v3 = +[UIDevice ic_isiPad](UIDevice, "ic_isiPad");
  v4 = 10000.0;
  v5 = 10000.0;
  if (v3)
  {
    v6 = -[ICSEPresentationController isShowingSearchResults](self, "isShowingSearchResults", 10000.0, 10000.0);
    v5 = 686.0;
    if (!v6)
      v5 = 250.0;
    v4 = 536.0;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (double)horizontalMargin
{
  unsigned int v2;
  unsigned int v3;
  double result;

  v2 = -[ICSEPresentationController isPortrait](self, "isPortrait");
  v3 = +[UIDevice ic_isiPad](UIDevice, "ic_isiPad");
  result = 65.0;
  if (v3 | v2)
    return 8.0;
  return result;
}

- (double)verticalMargin
{
  unsigned int v2;
  unsigned int v3;
  double result;

  v2 = -[ICSEPresentationController isPortrait](self, "isPortrait");
  v3 = +[UIDevice ic_isiPad](UIDevice, "ic_isiPad");
  result = 28.0;
  if (v3 | v2)
    return 8.0;
  return result;
}

- (double)keyboardMargin
{
  unsigned int v2;
  double result;

  v2 = -[ICSEPresentationController isPortrait](self, "isPortrait");
  result = 8.0;
  if (v2)
    return 28.0;
  return result;
}

- (BOOL)isPortrait
{
  return !-[ICSEPresentationController isLandscape](self, "isLandscape");
}

- (BOOL)isLandscape
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEPresentationController containerView](self, "containerView"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  return v6 < v4;
}

- (ICSEPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  ICSEPresentationController *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICSEPresentationController;
  v4 = -[ICSEPresentationController initWithPresentedViewController:presentingViewController:](&v10, "initWithPresentedViewController:presentingViewController:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init((Class)UIView);
    -[ICSEPresentationController setDimmingView:](v4, "setDimmingView:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorWithAlphaComponent:", 0.4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEPresentationController dimmingView](v4, "dimmingView"));
    objc_msgSend(v8, "setBackgroundColor:", v7);

  }
  return v4;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
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
  CGRect v35;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEPresentationController rootViewController](self, "rootViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ic_safeAreaLayoutGuide"));
  objc_msgSend(v4, "layoutFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEPresentationController containerView](self, "containerView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEPresentationController rootViewController](self, "rootViewController"));
  objc_msgSend(v14, "keyboardFrame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v35.origin.x = v6;
  v35.origin.y = v8;
  v35.size.width = v10;
  v35.size.height = v12;
  -[ICSEPresentationController frameOfPresentedViewInContainerView:withKeyboardFrame:topLayoutGuideLength:](self, "frameOfPresentedViewInContainerView:withKeyboardFrame:topLayoutGuideLength:", v13, v16, v18, v20, v22, CGRectGetMinY(v35));
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v31 = v24;
  v32 = v26;
  v33 = v28;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
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
  v9.super_class = (Class)ICSEPresentationController;
  -[ICSEPresentationController presentationTransitionWillBegin](&v9, "presentationTransitionWillBegin");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEPresentationController containerView](self, "containerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEPresentationController dimmingView](self, "dimmingView"));
  objc_msgSend(v3, "addSubview:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEPresentationController dimmingView](self, "dimmingView"));
  objc_msgSend(v5, "setAlpha:", 0.0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEPresentationController presentedViewController](self, "presentedViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitionCoordinator"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002F208;
  v8[3] = &unk_1000D6A30;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEPresentationController containerView](self, "containerView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEPresentationController dimmingView](self, "dimmingView"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002F308;
  v13[3] = &unk_1000D5D10;
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
  v6.super_class = (Class)ICSEPresentationController;
  -[ICSEPresentationController dismissalTransitionWillBegin](&v6, "dismissalTransitionWillBegin");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEPresentationController presentedViewController](self, "presentedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitionCoordinator"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002F424;
  v5[3] = &unk_1000D6A30;
  v5[4] = self;
  objc_msgSend(v4, "animateAlongsideTransition:completion:", v5, 0);

}

- (BOOL)isShowingSearchResults
{
  return self->_isShowingSearchResults;
}

- (void)setIsShowingSearchResults:(BOOL)a3
{
  self->_isShowingSearchResults = a3;
}

- (ICSERootViewController)rootViewController
{
  return (ICSERootViewController *)objc_loadWeakRetained((id *)&self->_rootViewController);
}

- (void)setRootViewController:(id)a3
{
  objc_storeWeak((id *)&self->_rootViewController, a3);
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
  objc_destroyWeak((id *)&self->_rootViewController);
}

@end
