@implementation _UICurrentContextPresentationController

- (int64_t)presentationStyle
{
  return 3;
}

- (BOOL)shouldPresentInFullscreen
{
  return 0;
}

- (BOOL)_shouldRespectDefinesPresentationContext
{
  return 1;
}

- (BOOL)shouldRemovePresentersView
{
  return 1;
}

- (BOOL)_mayChildGrabPresentedViewControllerView
{
  return 1;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
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
  objc_super v24;
  CGRect result;

  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)_UICurrentContextPresentationController;
    -[UIPresentationController frameOfPresentedViewInContainerView](&v24, sel_frameOfPresentedViewInContainerView);
    v9 = v16;
    v11 = v17;
    v13 = v18;
    v15 = v19;
  }
  v20 = v9;
  v21 = v11;
  v22 = v13;
  v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)__sizeClassPair
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  -[UIPresentationController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "horizontalSizeClass");
  v4 = objc_msgSend(v2, "verticalSizeClass");

  v5 = v3;
  v6 = v4;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (id)_firstCurrentContextChildInWindow
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_existingView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_4;
  v5 = (void *)v4;
  objc_msgSend(v3, "_existingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v3;
  }
  else
  {
LABEL_4:
    -[UIPresentationController _childPresentationController](self, "_childPresentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_firstCurrentContextChildInWindow");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)transitionDidFinish:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UICurrentContextPresentationController;
  -[UIPresentationController transitionDidFinish:](&v3, sel_transitionDidFinish_, a3);
}

@end
