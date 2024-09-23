@implementation UIKeyboardVCPresentationController

- (BOOL)shouldPresentInFullscreen
{
  return 0;
}

- (BOOL)_shouldKeepCurrentFirstResponder
{
  return 0;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  if (objc_msgSend((id)UIApp, "_isClassic"))
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
  }
  else
  {
    -[UIPresentationController containerView](self, "containerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "_isTextEffectsWindow") & 1) == 0)
    {
      v18.receiver = self;
      v18.super_class = (Class)UIKeyboardVCPresentationController;
      -[UIPresentationController sizeForChildContentContainer:withParentContainerSize:](&v18, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
      v12 = v14;
      v13 = v15;
      goto LABEL_7;
    }
    objc_msgSend(v8, "actualSceneFrame");
  }
  v12 = v9;
  v13 = v10;
LABEL_7:

  v16 = v12;
  v17 = v13;
  result.height = v17;
  result.width = v16;
  return result;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  double v3;
  double v4;
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
  double v15;
  double v16;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  -[UIKeyboardVCPresentationController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v5, v7, v8);
  v10 = v9;
  v12 = v11;

  v13 = v3;
  v14 = v4;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

@end
