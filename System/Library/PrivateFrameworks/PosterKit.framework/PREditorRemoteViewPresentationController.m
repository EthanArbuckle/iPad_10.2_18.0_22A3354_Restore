@implementation PREditorRemoteViewPresentationController

- (CGRect)frameOfPresentedViewInContainerView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect result;

  -[PREditorRemoteViewPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSize");
  if (v5 >= 50.0)
    v6 = v5;
  else
    v6 = 50.0;
  if (v4 >= 400.0)
    v7 = v4;
  else
    v7 = 400.0;
  -[PREditorRemoteViewPresentationController presentingViewController](self, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  v14 = CGRectGetMidX(v20) + v7 * -0.5;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v15 = CGRectGetMaxY(v21) - v6;

  v16 = v14;
  v17 = v15;
  v18 = v7;
  v19 = v6;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)containerViewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PREditorRemoteViewPresentationController;
  -[PREditorRemoteViewPresentationController containerViewDidLayoutSubviews](&v4, sel_containerViewDidLayoutSubviews);
  -[PREditorRemoteViewPresentationController presentedView](self, "presentedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRemoteViewPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
  objc_msgSend(v3, "setFrame:");

}

@end
