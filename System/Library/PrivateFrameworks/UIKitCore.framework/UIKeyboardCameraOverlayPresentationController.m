@implementation UIKeyboardCameraOverlayPresentationController

- (BOOL)updatesGuideDuringRotation
{
  return !-[UIKeyboardCameraBasePresentationController presentingOverKeyboard](self, "presentingOverKeyboard");
}

- (void)_determinePortraitHeights
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  double Height;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  CGRect v26;
  CGRect v27;

  if (-[UIKeyboardCameraBasePresentationController presentingOverKeyboard](self, "presentingOverKeyboard"))
  {
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inputViewSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputAssistantView");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v5;
    v9 = v8;
    objc_msgSend(v9, "bounds");
    objc_msgSend(v9, "convertRect:toView:", 0);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    Height = CGRectGetHeight(v26);
    v27.origin.x = v11;
    v27.origin.y = v13;
    v27.size.width = v15;
    v27.size.height = v17;
    v20 = Height - CGRectGetMinY(v27);

    self->_keyboardCameraNormalHeight = v20;
  }
  else
  {
    self->_keyboardCameraNormalHeight = 325.0;
  }
  -[UIPresentationController containerView](self, "containerView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v23 = v22;
  -[UIPresentationController containerView](self, "containerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "safeAreaInsets");
  self->_keyboardCameraFullScreenHeight = v23 - v25;

  self->_keyboardCameraHeight = self->_keyboardCameraNormalHeight;
}

- (void)_handlePan:(id)a3
{
  id v4;
  uint64_t v5;
  double keyboardCameraNormalHeight;
  double keyboardCameraFullScreenHeight;
  void *v8;
  double v9;
  double v10;
  double panningStartingHeight;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  _QWORD v22[5];

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  switch(v5)
  {
    case 3:
      keyboardCameraNormalHeight = self->_keyboardCameraNormalHeight;
      if (self->_panningStartingHeight == keyboardCameraNormalHeight)
      {
        if (self->_keyboardCameraHeight - keyboardCameraNormalHeight > 75.0)
        {
          keyboardCameraFullScreenHeight = self->_keyboardCameraFullScreenHeight;
LABEL_12:
          keyboardCameraNormalHeight = keyboardCameraFullScreenHeight;
        }
      }
      else
      {
        keyboardCameraFullScreenHeight = self->_keyboardCameraFullScreenHeight;
        if (keyboardCameraFullScreenHeight - self->_keyboardCameraHeight <= 75.0)
          goto LABEL_12;
      }
      self->_keyboardCameraHeight = keyboardCameraNormalHeight;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __60__UIKeyboardCameraOverlayPresentationController__handlePan___block_invoke;
      v22[3] = &unk_1E16B1B28;
      v22[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v22, 0.25);
      break;
    case 2:
      -[UIPresentationController containerView](self, "containerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "translationInView:", v8);
      v10 = v9;

      panningStartingHeight = self->_panningStartingHeight;
      v12 = fmax(panningStartingHeight - v10, self->_keyboardCameraNormalHeight);
      if (vabdd_f64(v12, panningStartingHeight) > 75.0)
        objc_msgSend(v4, "setState:", 3);
      self->_keyboardCameraHeight = v12;
      -[UIKeyboardCameraOverlayPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      -[UIPresentationController presentedView](self, "presentedView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

      break;
    case 1:
      self->_panningStartingHeight = self->_keyboardCameraHeight;
      break;
  }

}

void __60__UIKeyboardCameraOverlayPresentationController__handlePan___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "frameOfPresentedViewInContainerView");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "presentedView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutIfNeeded");

}

- (void)_installGrabber
{
  int has_internal_diagnostics;
  UIKeyboardCameraGrabberView *grabberView;
  UIKeyboardCameraGrabberView *v5;
  UIKeyboardCameraGrabberView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIPanGestureRecognizer *v16;
  UIPanGestureRecognizer *panGestureRecognizer;
  NSObject *v18;
  unint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[8];
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  grabberView = self->_grabberView;
  if (has_internal_diagnostics)
  {
    if (grabberView)
    {
      __UIFaultDebugAssertLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "There's a request to install the Keyboard Camera grabber when it already exists", buf, 2u);
      }

    }
  }
  else if (grabberView)
  {
    v19 = _installGrabber___s_category;
    if (!_installGrabber___s_category)
    {
      v19 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v19, (unint64_t *)&_installGrabber___s_category);
    }
    v20 = *(NSObject **)(v19 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "There's a request to install the Keyboard Camera grabber when it already exists", buf, 2u);
    }
  }
  v5 = objc_alloc_init(UIKeyboardCameraGrabberView);
  v6 = self->_grabberView;
  self->_grabberView = v5;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_grabberView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIPresentationController containerView](self, "containerView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentedView](self, "presentedView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSubview:", self->_grabberView);
  v21 = (void *)MEMORY[0x1E0D156E0];
  -[UIView topAnchor](self->_grabberView, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  -[UIView centerXAnchor](self->_grabberView, "centerXAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v7;
  objc_msgSend(v7, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v9;
  -[UIView heightAnchor](self->_grabberView, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToConstant:", 30.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v11;
  -[UIView widthAnchor](self->_grabberView, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v15);

  v16 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__handlePan_);
  panGestureRecognizer = self->_panGestureRecognizer;
  self->_panGestureRecognizer = v16;

  -[UIView addGestureRecognizer:](self->_grabberView, "addGestureRecognizer:", self->_panGestureRecognizer);
  -[UIView setHidden:](self->_grabberView, "setHidden:", self->_isLandscape);

}

- (void)presentationTransitionWillBegin
{
  void *v3;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isLandscape = (unint64_t)(objc_msgSend(v3, "orientation") - 3) < 2;

  -[UIKeyboardCameraOverlayPresentationController _determinePortraitHeights](self, "_determinePortraitHeights");
  if (!-[UIKeyboardCameraBasePresentationController presentingOverKeyboard](self, "presentingOverKeyboard"))
    -[UIKeyboardCameraBasePresentationController modifyKeyboardTrackingUsingNotificationType:forStart:](self, "modifyKeyboardTrackingUsingNotificationType:forStart:", 2, 1);
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  -[UIPresentationController _setContainerIgnoresDirectTouchEvents:](self, "_setContainerIgnoresDirectTouchEvents:", 1);
  -[UIKeyboardCameraOverlayPresentationController _installGrabber](self, "_installGrabber");
  if (!-[UIKeyboardCameraBasePresentationController presentingOverKeyboard](self, "presentingOverKeyboard"))
    -[UIKeyboardCameraBasePresentationController modifyKeyboardTrackingUsingNotificationType:forStart:](self, "modifyKeyboardTrackingUsingNotificationType:forStart:", 2, 0);
}

- (void)dismissalTransitionWillBegin
{
  if (!-[UIKeyboardCameraBasePresentationController presentingOverKeyboard](self, "presentingOverKeyboard"))
    -[UIKeyboardCameraBasePresentationController modifyKeyboardTrackingUsingNotificationType:forStart:](self, "modifyKeyboardTrackingUsingNotificationType:forStart:", 3, 1);
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (!-[UIKeyboardCameraBasePresentationController presentingOverKeyboard](self, "presentingOverKeyboard", a3))
    -[UIKeyboardCameraBasePresentationController modifyKeyboardTrackingUsingNotificationType:forStart:](self, "modifyKeyboardTrackingUsingNotificationType:forStart:", 3, 0);
}

- (CGRect)frameOfPresentedViewInContainerView
{
  void *v3;
  _BOOL4 isLandscape;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double keyboardCameraHeight;
  CGFloat Height;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect result;

  -[UIPresentationController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");

  isLandscape = self->_isLandscape;
  -[UIPresentationController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  keyboardCameraHeight = v12;

  if (!isLandscape)
  {
    v19.origin.x = v7;
    v19.origin.y = v9;
    v19.size.width = v11;
    v19.size.height = keyboardCameraHeight;
    Height = CGRectGetHeight(v19);
    keyboardCameraHeight = self->_keyboardCameraHeight;
    v9 = v9 + Height - keyboardCameraHeight;
  }
  v15 = v7;
  v16 = v9;
  v17 = v11;
  v18 = keyboardCameraHeight;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  BOOL v8;
  _QWORD v9[7];
  BOOL v10;
  _QWORD v11[7];
  BOOL v12;
  _QWORD v13[4];
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  __int128 v17;
  __int128 v18;
  objc_super v19;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)UIKeyboardCameraOverlayPresentationController;
  -[UIPresentationController viewWillTransitionToSize:withTransitionCoordinator:](&v19, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8 = -[UIKeyboardCameraOverlayPresentationController updatesGuideDuringRotation](self, "updatesGuideDuringRotation");
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x4010000000;
  v16[3] = &unk_18685B0AF;
  v17 = 0u;
  v18 = 0u;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x4010000000;
  v13[3] = &unk_18685B0AF;
  v14 = 0u;
  v15 = 0u;
  self->_isLandscape = width > height;
  -[UIView setHidden:](self->_grabberView, "setHidden:");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __100__UIKeyboardCameraOverlayPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v11[3] = &unk_1E16C1978;
  v11[4] = self;
  v11[5] = v16;
  v11[6] = v13;
  v12 = v8;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __100__UIKeyboardCameraOverlayPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v9[3] = &unk_1E16C1978;
  v10 = v8;
  v9[4] = self;
  v9[5] = v16;
  v9[6] = v13;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v11, v9);
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v16, 8);

}

void __100__UIKeyboardCameraOverlayPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double *v13;
  double *v14;
  double *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "_determinePortraitHeights");
  objc_msgSend(*(id *)(a1 + 32), "presentedView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;

  objc_msgSend(*(id *)(a1 + 32), "frameOfPresentedViewInContainerView");
  v8 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v8[4] = v9;
  v8[5] = v10;
  v8[6] = v11;
  v8[7] = v12;
  if (*(_BYTE *)(a1 + 56))
  {
    v13 = *(double **)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(double **)(*(_QWORD *)(a1 + 48) + 8);
    objc_msgSend(*(id *)(a1 + 32), "modifyKeyboardTrackingUsingNotificationType:from:to:forStart:", 1, 0, v13[4], v13[5], v13[6], v13[7], v14[4], v14[5], v14[6], v14[7]);
  }
  v15 = *(double **)(*(_QWORD *)(a1 + 48) + 8);
  v16 = v15[4];
  v17 = v15[5];
  v18 = v15[6];
  v19 = v15[7];
  objc_msgSend(*(id *)(a1 + 32), "presentedView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v16, v17, v18, v19);

}

uint64_t __100__UIKeyboardCameraOverlayPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t result)
{
  double *v1;
  double *v2;

  if (*(_BYTE *)(result + 56))
  {
    v1 = *(double **)(*(_QWORD *)(result + 40) + 8);
    v2 = *(double **)(*(_QWORD *)(result + 48) + 8);
    return objc_msgSend(*(id *)(result + 32), "modifyKeyboardTrackingUsingNotificationType:from:to:forStart:", 1, 0, v1[4], v1[5], v1[6], v1[7], v2[4], v2[5], v2[6], v2[7]);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_topLayoutConstraint, 0);
}

@end
