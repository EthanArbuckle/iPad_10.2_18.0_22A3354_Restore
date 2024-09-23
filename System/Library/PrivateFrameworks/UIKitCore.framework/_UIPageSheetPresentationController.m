@implementation _UIPageSheetPresentationController

+ (int64_t)_initialMode
{
  return 0;
}

- (BOOL)shouldSubscribeToKeyboardNotifications
{
  return 0;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  void *v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGRect result;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _UISheetPresentationControllerStylesSheetsAsCards(v3);

  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIPageSheetPresentationController;
    -[_UIFormSheetPresentationController frameOfPresentedViewInContainerView](&v14, sel_frameOfPresentedViewInContainerView);
  }
  else
  {
    -[UIPresentationController containerView](self, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;

    if (v11 >= v13)
      v7 = v13;
    else
      v7 = v11;
    v5 = (v11 - v7) * 0.5;
    v8 = v13 + -20.0;
    v6 = 20.0;
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)_shouldHideBottomCorner
{
  return 1;
}

@end
