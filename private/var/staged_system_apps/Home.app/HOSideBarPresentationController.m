@implementation HOSideBarPresentationController

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v5 = objc_opt_class(UISplitViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOSideBarPresentationController presentingViewController](self, "presentingViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewControllers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
  if ((objc_opt_isKindOfClass(v8, v5) & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
  objc_msgSend(v11, "frame");
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));

  objc_msgSend(v14, "frame");
  v16 = v15;

  v17 = v13;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)containerViewWillLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[HOSideBarPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[HOSideBarPresentationController presentedView](self, "presentedView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (CGRect)frameOfPresentedViewInContainerView
{
  CGFloat y;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double x;
  double v13;
  double v14;
  double v15;
  CGRect result;

  y = CGPointZero.y;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOSideBarPresentationController presentedViewController](self, "presentedViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOSideBarPresentationController containerView](self, "containerView"));
  objc_msgSend(v5, "bounds");
  -[HOSideBarPresentationController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v4, v6, v7);
  v9 = v8;
  v11 = v10;

  x = CGPointZero.x;
  v13 = y;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = x;
  return result;
}

@end
