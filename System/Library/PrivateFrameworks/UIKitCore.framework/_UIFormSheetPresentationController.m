@implementation _UIFormSheetPresentationController

+ (int64_t)_initialMode
{
  return 1;
}

- (int64_t)_defaultPresentationStyleForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v4 = a3;
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_UISheetPresentationControllerStylesSheetsAsCards(v5) & 1) != 0)
  {

LABEL_5:
    v9.receiver = self;
    v9.super_class = (Class)_UIFormSheetPresentationController;
    v7 = -[UIPresentationController _defaultPresentationStyleForTraitCollection:](&v9, sel__defaultPresentationStyleForTraitCollection_, v4);
    goto LABEL_6;
  }
  v6 = objc_msgSend(v4, "horizontalSizeClass");

  if (v6 != 1)
    goto LABEL_5;
  v7 = 0;
LABEL_6:

  return (int64_t)v7;
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIFormSheetPresentationController;
  -[UISheetPresentationController presentationTransitionWillBegin](&v10, sel_presentationTransitionWillBegin);
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _UISheetPresentationControllerStylesSheetsAsCards(v3);

  if ((v4 & 1) == 0)
  {
    -[UISheetPresentationController dropShadowView](self, "dropShadowView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAutoresizingMask:", 45);

  }
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "disablesAutomaticKeyboardDismissal");

  if (v7)
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_beginPinningInputViews");

  }
  if (-[_UIFormSheetPresentationController shouldSubscribeToKeyboardNotifications](self, "shouldSubscribeToKeyboardNotifications"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, CFSTR("UIKeyboardPrivateWillShowNotification"), 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__keyboardWillHide_, CFSTR("UIKeyboardPrivateWillHideNotification"), 0);

  }
}

- (BOOL)_shouldPresentedViewControllerControlStatusBarAppearance
{
  void *v3;
  int v4;
  objc_super v6;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _UISheetPresentationControllerStylesSheetsAsCards(v3);

  if (!v4)
    return -[UIPresentationController _isAdapted](self, "_isAdapted");
  v6.receiver = self;
  v6.super_class = (Class)_UIFormSheetPresentationController;
  return -[UISheetPresentationController _shouldPresentedViewControllerControlStatusBarAppearance](&v6, sel__shouldPresentedViewControllerControlStatusBarAppearance);
}

- (CGRect)frameOfPresentedViewInContainerView
{
  void *v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  _BOOL8 v31;
  void *v32;
  void *v33;
  unint64_t v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  objc_super v43;
  CGRect result;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _UISheetPresentationControllerStylesSheetsAsCards(v3);

  if (v4)
  {
    v43.receiver = self;
    v43.super_class = (Class)_UIFormSheetPresentationController;
    -[UISheetPresentationController frameOfPresentedViewInContainerView](&v43, sel_frameOfPresentedViewInContainerView);
    v8 = v7;
    v10 = v9;
  }
  else
  {
    -[UIPresentationController containerView](self, "containerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    -[UIPresentationController containerView](self, "containerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "safeAreaInsets");

    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = _UISheetContentContainerSize(v21, v22, v17, v19);
    v25 = v24;

    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController containerView](self, "containerView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_screen");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bounds");
    objc_msgSend(v26, "_formSheetSizeForWindowWithSize:screenSize:", v23, v25);
    v8 = v29;
    v10 = v30;

    v31 = -[_UIFormSheetPresentationController _shouldHideBottomCorner](self, "_shouldHideBottomCorner");
    -[UISheetPresentationController dropShadowView](self, "dropShadowView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setMasksTopCornersOnly:", v31);

    if (-[_UIFormSheetPresentationController _shouldHideBottomCorner](self, "_shouldHideBottomCorner"))
    {
      v10 = v25 + -20.0;
      v6 = 20.0;
    }
    else if (self->_layoutStateShouldAvoidKeyboard
           && (-[UIPresentationController presentedViewController](self, "presentedViewController"),
               v33 = (void *)objc_claimAutoreleasedReturnValue(),
               v34 = objc_msgSend(v33, "interfaceOrientation") - 5,
               v33,
               v34 > 0xFFFFFFFFFFFFFFFDLL))
    {
      v35 = v15 + (self->_keyboardYOrigin - v10) * 0.5;
      -[UIPresentationController containerView](self, "containerView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "window");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      __UIStatusBarManagerForWindow(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "defaultStatusBarHeightInOrientation:", 1);
      v40 = v39;

      if (v40 >= v35)
        v6 = v40;
      else
        v6 = v35;
    }
    else
    {
      v6 = v15 + (v25 - v10) * 0.5;
    }
    v5 = v13 + (v23 - v8) * 0.5;
  }
  v41 = v8;
  v42 = v10;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFormSheetPresentationController;
  -[UISheetPresentationController dismissalTransitionWillBegin](&v7, sel_dismissalTransitionWillBegin);
  if (-[_UIFormSheetPresentationController shouldSubscribeToKeyboardNotifications](self, "shouldSubscribeToKeyboardNotifications"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIKeyboardPrivateWillShowNotification"), 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIKeyboardPrivateWillHideNotification"), 0);

  }
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "disablesAutomaticKeyboardDismissal");

  if (v5)
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_endPinningInputViews");

  }
}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGRect v14;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("UIKeyboardFrameEndUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14.origin.x = v7;
  v14.origin.y = v9;
  v14.size.width = v11;
  v14.size.height = v13;
  -[_UIFormSheetPresentationController _changeLayoutModeToAvoidKeyboard:withOrigin:](self, "_changeLayoutModeToAvoidKeyboard:withOrigin:", 1, CGRectGetMinY(v14));
}

- (void)_keyboardWillHide:(id)a3
{
  -[_UIFormSheetPresentationController _changeLayoutModeToAvoidKeyboard:withOrigin:](self, "_changeLayoutModeToAvoidKeyboard:withOrigin:", 0, 0.0);
}

- (void)_changeLayoutModeToAvoidKeyboard:(BOOL)a3 withOrigin:(double)a4
{
  void *v5;
  _QWORD v6[5];

  if (self->_layoutStateShouldAvoidKeyboard != a3 || self->_keyboardYOrigin != a4)
  {
    self->_layoutStateShouldAvoidKeyboard = a3;
    self->_keyboardYOrigin = a4;
    -[UIPresentationController containerView](self, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

    if (-[UIPresentationController presented](self, "presented"))
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __82___UIFormSheetPresentationController__changeLayoutModeToAvoidKeyboard_withOrigin___block_invoke;
      v6[3] = &unk_1E16B1B28;
      v6[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v6, 0.25);
    }
  }
}

- (BOOL)_shouldHideBottomCorner
{
  void *v2;
  BOOL v3;

  -[UIPresentationController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 0;

  return v3;
}

- (BOOL)shouldSubscribeToKeyboardNotifications
{
  void *v2;
  char v3;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _UISheetPresentationControllerStylesSheetsAsCards(v2) ^ 1;

  return v3;
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
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController containerView](self, "containerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_screen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    objc_msgSend(v13, "_formSheetSizeForWindowWithSize:screenSize:", width, height);
    v10 = v16;
    v12 = v17;

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)_UIFormSheetPresentationController;
    -[UIPresentationController sizeForChildContentContainer:withParentContainerSize:](&v20, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
    v10 = v9;
    v12 = v11;
  }

  v18 = v10;
  v19 = v12;
  result.height = v19;
  result.width = v18;
  return result;
}

- (BOOL)_presentationPotentiallyUnderlapsStatusBar
{
  void *v2;
  char v3;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _UISheetPresentationControllerStylesSheetsAsCards(v2);

  return v3;
}

@end
