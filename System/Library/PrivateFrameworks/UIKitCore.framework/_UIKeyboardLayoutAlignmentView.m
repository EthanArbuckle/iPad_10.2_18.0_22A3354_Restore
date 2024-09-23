@implementation _UIKeyboardLayoutAlignmentView

- (void)setAutomaticKeyboardFrameTrackingDisabled:(BOOL)a3
{
  void *v5;
  id v6;

  if (self->_automaticKeyboardFrameTrackingDisabled != a3)
  {
    -[_UIKeyboardLayoutAlignmentView _stopObservingKeyboardNotifications](self, "_stopObservingKeyboardNotifications");
    self->_automaticKeyboardFrameTrackingDisabled = a3;
    if (!a3)
    {
      -[UIView window](self, "window");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "screen");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKeyboardLayoutAlignmentView _startObservingKeyboardNotificationsForScreen:](self, "_startObservingKeyboardNotificationsForScreen:", v5);

    }
  }
}

+ (CGRect)_frameInBoundsForKeyboardFrame:(CGRect)a3 inView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect result;
  CGRect v36;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  objc_msgSend(v8, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "coordinateSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:fromCoordinateSpace:", v12, x, y, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  objc_msgSend(v9, "bounds");
  v36.origin.x = v21;
  v36.origin.y = v22;
  v36.size.width = v23;
  v36.size.height = v24;
  v33.origin.x = v14;
  v33.origin.y = v16;
  v33.size.width = v18;
  v33.size.height = v20;
  v34 = CGRectIntersection(v33, v36);
  v25 = v34.origin.x;
  v26 = v34.origin.y;
  v27 = v34.size.width;
  v28 = v34.size.height;
  if (CGRectIsNull(v34))
  {
    v25 = *MEMORY[0x1E0C9D538];
    v26 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v28 = 0.0;
    v27 = v18;
  }

  v29 = v25;
  v30 = v26;
  v31 = v27;
  v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (CGRect)_frameInBoundsForKeyboardFrame:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend((id)objc_opt_class(), "_frameInBoundsForKeyboardFrame:inView:", self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_updateConstraintsToMatchKeyboardFrame:(CGRect)a3
{
  double height;
  void *v5;
  void *v6;
  NSLayoutConstraint *disambiguatingLeftConstraint;
  void *v8;
  _QWORD v9[3];

  height = a3.size.height;
  v9[2] = *MEMORY[0x1E0C80C00];
  -[NSLayoutConstraint setConstant:](self->widthConstraint, "setConstant:", a3.size.width, a3.origin.y);
  -[NSLayoutConstraint setConstant:](self->heightConstraint, "setConstant:", height);
  -[UIView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D156E0];
    disambiguatingLeftConstraint = self->disambiguatingLeftConstraint;
    v9[0] = self->heightConstraint;
    v9[1] = disambiguatingLeftConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activateConstraints:", v8);

  }
}

+ (BOOL)_shouldIgnoreFrameChangeNotification:(id)a3 inView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;

  v5 = a4;
  objc_msgSend(a3, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("UIKeyboardOriginatedFromRotationUserInfoKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    objc_msgSend(v5, "keyboardSceneDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isOnScreen") ^ 1;

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)_shouldOverrideAnimationForFrameChangeNotification:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("UIKeyboardOriginatedFromRotationUserInfoKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

+ (CGRect)_endFrameForNotification:(id)a3 inView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
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

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", CFSTR("UIKeyboardFrameEndUserInfoKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "CGRectValue");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  LODWORD(v8) = objc_msgSend(a1, "_shouldIgnoreFrameChangeNotification:inView:", v7, v6);
  if ((_DWORD)v8)
  {
    objc_msgSend(v6, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboard sizeForInterfaceOrientation:](UIKeyboard, "sizeForInterfaceOrientation:", objc_msgSend(v18, "interfaceOrientation"));
    v15 = v19;
    v17 = v20;

    objc_msgSend(v6, "_window");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "screen");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v13 = CGRectGetHeight(v35) - v17;

  }
  objc_msgSend(a1, "_frameInBoundsForKeyboardFrame:inView:", v6, v11, v13, v15, v17);
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

- (void)_updateConstraintsForKeyboardNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  void *v24;
  float v25;
  double v26;
  _BOOL4 v27;
  double v28;
  CGFloat v29;
  void *v30;
  void *v31;
  uint64_t v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  CGRect *p_lastKnownKeyboardRect;
  CGFloat v42;
  void *v43;
  void *v44;
  char v45;
  void (**v46)(_QWORD);
  void *v47;
  double v48;
  CGRect rect2;
  void *v50;
  _UIKeyboardLayoutAlignmentView *v51;
  id v52;
  double v53;
  uint64_t v54;
  _QWORD aBlock[9];
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKey:", CFSTR("UIKeyboardFrameBeginUserInfoKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CGRectValue");
    rect2.origin.x = v8;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    objc_msgSend((id)objc_opt_class(), "_endFrameForNotification:inView:", v5, self);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    objc_msgSend(v5, "userInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "valueForKey:", CFSTR("UIKeyboardAnimationDurationUserInfoKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "floatValue");
    v26 = v25;

    v27 = -[_UIKeyboardLayoutAlignmentView _shouldOverrideAnimationForFrameChangeNotification:](self, "_shouldOverrideAnimationForFrameChangeNotification:", v5);
    v28 = 0.3;
    if (!v27)
      v28 = v26;
    v48 = v28;
    v29 = v16;
    objc_msgSend(v5, "userInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "valueForKey:", CFSTR("UIKeyboardAnimationCurveUserInfoKey"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "integerValue");

    -[_UIKeyboardLayoutAlignmentView _frameInBoundsForKeyboardFrame:](self, "_frameInBoundsForKeyboardFrame:", rect2.origin.x, v10, v12, v14);
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    p_lastKnownKeyboardRect = &self->lastKnownKeyboardRect;
    v57.origin.x = v29;
    v57.origin.y = v18;
    v57.size.width = v20;
    v57.size.height = v22;
    if (!CGRectEqualToRect(self->lastKnownKeyboardRect, v57))
    {
      v42 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __76___UIKeyboardLayoutAlignmentView__updateConstraintsForKeyboardNotification___block_invoke;
      aBlock[3] = &unk_1E16B20D8;
      aBlock[4] = self;
      *(CGFloat *)&aBlock[5] = v29;
      *(CGFloat *)&aBlock[6] = v18;
      *(CGFloat *)&aBlock[7] = v20;
      *(CGFloat *)&aBlock[8] = v22;
      v43 = _Block_copy(aBlock);
      if (-[_UIKeyboardLayoutAlignmentView _shouldOverrideAnimationForFrameChangeNotification:](self, "_shouldOverrideAnimationForFrameChangeNotification:", v5))
      {
        goto LABEL_9;
      }
      v56.origin.x = v34;
      v56.origin.y = v36;
      v56.size.width = v38;
      v56.size.height = v40;
      v58.origin.x = v29;
      v58.origin.y = v18;
      v58.size.width = v20;
      v58.size.height = v22;
      if (CGRectEqualToRect(v56, v58)
        || (-[UIView superview](self, "superview"),
            v44 = (void *)objc_claimAutoreleasedReturnValue(),
            v45 = objc_msgSend(v44, "_is_needsLayout"),
            v44,
            (v45 & 1) != 0))
      {
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v43);
      }
      else
      {
LABEL_9:
        rect2.origin.y = v42;
        *(_QWORD *)&rect2.size.width = 3221225472;
        *(_QWORD *)&rect2.size.height = __76___UIKeyboardLayoutAlignmentView__updateConstraintsForKeyboardNotification___block_invoke_2;
        v50 = &unk_1E16C4158;
        v53 = v48;
        v54 = v32;
        v51 = self;
        v52 = v43;
        v46 = (void (**)(_QWORD))_Block_copy(&rect2.origin.y);
        if (-[_UIKeyboardLayoutAlignmentView _shouldOverrideAnimationForFrameChangeNotification:](self, "_shouldOverrideAnimationForFrameChangeNotification:", v5))
        {
          objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "performBlock:", v46);

        }
        else
        {
          v46[2](v46);
        }

      }
    }
    p_lastKnownKeyboardRect->origin.x = v29;
    p_lastKnownKeyboardRect->origin.y = v18;
    p_lastKnownKeyboardRect->size.width = v20;
    p_lastKnownKeyboardRect->size.height = v22;
  }

}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIKeyboardLayoutAlignmentView _stopObservingKeyboardNotifications](self, "_stopObservingKeyboardNotifications");
  objc_msgSend(v4, "screen");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIKeyboardLayoutAlignmentView _startObservingKeyboardNotificationsForScreen:](self, "_startObservingKeyboardNotificationsForScreen:", v5);
}

- (void)didMoveToWindow
{
  -[_UIKeyboardLayoutAlignmentView _removeConstraints](self, "_removeConstraints");
  -[_UIKeyboardLayoutAlignmentView _createConstraints](self, "_createConstraints");
}

- (void)_createConstraints
{
  void *v3;
  NSLayoutConstraint *v4;
  NSLayoutConstraint *bottomConstraint;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *widthConstraint;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *heightConstraint;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *disambiguatingLeftConstraint;
  void *v12;
  NSLayoutConstraint *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 4, 0, v3, 4, 1.0, 0.0);
    v4 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    bottomConstraint = self->bottomConstraint;
    self->bottomConstraint = v4;

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 7, 0, 0, 7, 1.0, 0.0);
    v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    widthConstraint = self->widthConstraint;
    self->widthConstraint = v6;

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 8, 0, 0, 8, 1.0, 0.0);
    v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    heightConstraint = self->heightConstraint;
    self->heightConstraint = v8;

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 1, 0, v3, 1, 1.0, 0.0);
    v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    disambiguatingLeftConstraint = self->disambiguatingLeftConstraint;
    self->disambiguatingLeftConstraint = v10;

    v12 = (void *)MEMORY[0x1E0D156E0];
    v13 = self->widthConstraint;
    v16[0] = self->bottomConstraint;
    v16[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activateConstraints:", v14);

    -[UIView window](self, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      -[_UIKeyboardLayoutAlignmentView _matchInitialKeyboardFrame](self, "_matchInitialKeyboardFrame");

  }
}

- (void)_matchInitialKeyboardFrame
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[UIView keyboardSceneDelegate](self, "keyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isOnScreen");

  if (v4)
  {
    -[UIView keyboardSceneDelegate](self, "keyboardSceneDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visibleFrameInView:", 0);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    -[_UIKeyboardLayoutAlignmentView _frameInBoundsForKeyboardFrame:](self, "_frameInBoundsForKeyboardFrame:", v7, v9, v11, v13);
    -[_UIKeyboardLayoutAlignmentView _updateConstraintsToMatchKeyboardFrame:](self, "_updateConstraintsToMatchKeyboardFrame:");
  }
}

- (void)_removeConstraints
{
  NSLayoutConstraint *bottomConstraint;
  NSLayoutConstraint *widthConstraint;
  NSLayoutConstraint *heightConstraint;
  NSLayoutConstraint *disambiguatingLeftConstraint;

  -[NSLayoutConstraint setActive:](self->bottomConstraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->widthConstraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->heightConstraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->disambiguatingLeftConstraint, "setActive:", 0);
  bottomConstraint = self->bottomConstraint;
  self->bottomConstraint = 0;

  widthConstraint = self->widthConstraint;
  self->widthConstraint = 0;

  heightConstraint = self->heightConstraint;
  self->heightConstraint = 0;

  disambiguatingLeftConstraint = self->disambiguatingLeftConstraint;
  self->disambiguatingLeftConstraint = 0;

}

- (_UIKeyboardLayoutAlignmentView)initWithFrame:(CGRect)a3
{
  _UIKeyboardLayoutAlignmentView *v3;
  _UIKeyboardLayoutAlignmentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIKeyboardLayoutAlignmentView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIKeyboardLayoutAlignmentView _stopObservingKeyboardNotifications](self, "_stopObservingKeyboardNotifications");
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardLayoutAlignmentView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)_stopObservingKeyboardNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIKeyboardPrivateWillChangeFrameNotification"), 0);

}

- (void)_startObservingKeyboardNotificationsForScreen:(id)a3
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB37D0];
    v5 = a3;
    objc_msgSend(v4, "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__keyboardChanged_, CFSTR("UIKeyboardPrivateWillChangeFrameNotification"), v5);

  }
}

- (BOOL)automaticKeyboardFrameTrackingDisabled
{
  return self->_automaticKeyboardFrameTrackingDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->disambiguatingLeftConstraint, 0);
  objc_storeStrong((id *)&self->heightConstraint, 0);
  objc_storeStrong((id *)&self->widthConstraint, 0);
  objc_storeStrong((id *)&self->bottomConstraint, 0);
}

@end
