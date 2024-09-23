@implementation UIKeyboardLayoutGuide

- (BOOL)changeSizingConstants:(CGSize)a3
{
  return -[UIKeyboardLayoutGuide _changeSizingConstants:force:](self, "_changeSizingConstants:force:", 0, a3.width, a3.height);
}

- (BOOL)changeOffsetConstants:(UIOffset)a3
{
  return -[UIKeyboardLayoutGuide _changeOffsetConstants:force:](self, "_changeOffsetConstants:force:", 0, a3.horizontal, a3.vertical);
}

- (id)_obtainTransitionAssertionForReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[UIKeyboardLayoutGuide isWindowGuide](self, "isWindowGuide"))
  {
    -[UIKeyboardLayoutGuide _assertionController](self, "_assertionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:", 1, 1, v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[UITrackingLayoutGuide constrainedToWindowGuide](self, "constrainedToWindowGuide"))
    {
      v6 = 0;
      goto LABEL_7;
    }
    -[UILayoutGuide owningView](self, "owningView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_primaryKeyboardTrackingGuide");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_obtainTransitionAssertionForReason:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:

  return v6;
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  void *v7;

  if (a3 == 1)
    return self->_transitioning;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardLayoutGuide.m"), 732, CFSTR("Unknown _UIAssertionType %lu"), a3);

  return 0;
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  id v7;

  if (a4 == 1)
  {
    -[UIKeyboardLayoutGuide _setTransitioning:](self, "_setTransitioning:", a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardLayoutGuide.m"), 744, CFSTR("Unknown _UIAssertionType %lu"), a4);

  }
}

- (_UIAssertionController)_assertionController
{
  _UIAssertionController *assertionController;
  _UIAssertionController *v4;
  _UIAssertionController *v5;

  assertionController = self->_assertionController;
  if (!assertionController)
  {
    v4 = -[_UIAssertionController initWithAssertionSubject:]([_UIAssertionController alloc], "initWithAssertionSubject:", self);
    v5 = self->_assertionController;
    self->_assertionController = v4;

    assertionController = self->_assertionController;
  }
  return assertionController;
}

- (void)setWindowGuide:(BOOL)a3
{
  if (self->_windowGuide != a3)
    self->_windowGuide = a3;
}

- (void)inheritOptionsFromGuide:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  _UIKBLightEffectsBackground *v10;
  _UIKBLightEffectsBackground *lightEffectsBackdrop;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *assistantHeightConstraint;

  v4 = a3;
  self->_followsUndockedKeyboard = objc_msgSend(v4, "followsUndockedKeyboard");
  self->_followTypes = objc_msgSend(v4, "followTypes");
  self->_docked = objc_msgSend(v4, "isDocked");
  self->_addsHeightWhenUndocked = objc_msgSend(v4, "addsHeightWhenUndocked");
  self->_ignoresSafeArea = objc_msgSend(v4, "ignoresSafeArea");
  objc_msgSend(v4, "previousOffset");
  self->_previousOffset.horizontal = v5;
  self->_previousOffset.vertical = v6;
  objc_msgSend(v4, "previousSize");
  self->_previousSize.width = v7;
  self->_previousSize.height = v8;
  objc_msgSend(v4, "keyboardDismissPadding");
  self->_keyboardDismissPadding = v9;
  objc_msgSend(v4, "lightEffectsBackdrop");
  v10 = (_UIKBLightEffectsBackground *)objc_claimAutoreleasedReturnValue();
  lightEffectsBackdrop = self->_lightEffectsBackdrop;
  self->_lightEffectsBackdrop = v10;

  objc_msgSend(v4, "assistantHeightConstraint");
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

  assistantHeightConstraint = self->_assistantHeightConstraint;
  self->_assistantHeightConstraint = v12;

}

- (void)updateBottomConstraint
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[UIKeyboardLayoutGuide viewBottomConstraint](self, "viewBottomConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKeyboardLayoutGuide viewBottomConstraint](self, "viewBottomConstraint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActive:", 0);

  }
  v5 = -[UIKeyboardLayoutGuide ignoresSafeArea](self, "ignoresSafeArea");
  -[UILayoutGuide owningView](self, "owningView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutGuide setViewBottomConstraint:](self, "setViewBottomConstraint:", v10);
  }
  else
  {
    objc_msgSend(v6, "safeAreaLayoutGuide");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutGuide setViewBottomConstraint:](self, "setViewBottomConstraint:", v11);

  }
  -[UIKeyboardLayoutGuide viewBottomConstraint](self, "viewBottomConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIdentifier:", CFSTR("UIViewKeyboardLayoutGuide-viewBottom"));

  -[UIKeyboardLayoutGuide viewBottomConstraint](self, "viewBottomConstraint");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

}

- (NSLayoutConstraint)viewBottomConstraint
{
  return self->_viewBottomConstraint;
}

- (BOOL)ignoresSafeArea
{
  return self->_ignoresSafeArea;
}

- (void)setViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_viewBottomConstraint, a3);
}

- (CGFloat)keyboardDismissPadding
{
  return self->_keyboardDismissPadding;
}

- (BOOL)followsUndockedKeyboard
{
  return self->_followsUndockedKeyboard;
}

- (int64_t)followTypes
{
  return self->_followTypes;
}

- (void)constrainToReference:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[UITrackingLayoutGuide constrainedToWindowGuide](self, "constrainedToWindowGuide"))
  {
    -[UILayoutGuide _systemConstraints](self, "_systemConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0D156E0];
      -[UILayoutGuide _systemConstraints](self, "_systemConstraints");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deactivateConstraints:", v8);

    }
    -[UILayoutGuide topAnchor](self, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v12) = 1148829696;
    objc_msgSend(v11, "setPriority:", v12);
    objc_msgSend(v11, "setIdentifier:", CFSTR("UIViewKeyboardLayoutGuide-topConstraint"));
    -[UILayoutGuide leadingAnchor](self, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setIdentifier:", CFSTR("UIViewKeyboardLayoutGuide-leadingConstraint"));
    objc_msgSend(v4, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setIdentifier:", CFSTR("UIViewKeyboardLayoutGuide-bottomConstraint"));
    objc_msgSend(v4, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "setIdentifier:", CFSTR("UIViewKeyboardLayoutGuide-trailingConstraint"));
    v25[0] = v11;
    v25[1] = v15;
    v25[2] = v18;
    v25[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide _setSystemConstraints:](self, "_setSystemConstraints:", v22);

    v23 = (void *)MEMORY[0x1E0D156E0];
    -[UILayoutGuide _systemConstraints](self, "_systemConstraints");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateConstraints:", v24);

    -[UIKeyboardLayoutGuide updateBottomConstraint](self, "updateBottomConstraint");
  }

}

- (BOOL)addsHeightWhenUndocked
{
  return self->_addsHeightWhenUndocked;
}

- (BOOL)_changeOffsetConstants:(UIOffset)a3 force:(BOOL)a4
{
  double vertical;
  double horizontal;
  int v8;
  double v9;
  double v10;
  NSObject *v12;
  double v13;
  _BOOL4 v14;
  double v15;
  _BOOL4 v16;
  double v17;
  double v18;
  _BOOL4 v19;
  double v20;
  double v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 v26;
  objc_super v28;
  uint8_t buf[4];
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = -[UIKeyboardLayoutGuide isWindowGuide](self, "isWindowGuide");
  if (!v8)
    return v8;
  -[UIKeyboardLayoutGuide previousOffset](self, "previousOffset");
  if (horizontal == v10 && vertical == v9)
  {
LABEL_11:
    LOBYTE(v8) = 0;
    return v8;
  }
  if (-[UIKeyboardLayoutGuide ignoreKeyboardChanges](self, "ignoreKeyboardChanges") && !a4)
  {
    _UIKeyboardLayoutGuideLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "*** changeOffsetConstants: called while ignoring changes; skipping ***",
        buf,
        2u);
    }

    goto LABEL_11;
  }
  -[UIKeyboardLayoutGuide previousSize](self, "previousSize");
  v14 = *MEMORY[0x1E0C9D820] == v13;
  v16 = *(double *)(MEMORY[0x1E0C9D820] + 8) == v15;
  if (v14 && v16)
    v17 = 0.0;
  else
    v17 = horizontal;
  if (v14 && v16)
    v18 = 0.0;
  else
    v18 = vertical;
  v19 = -[UIKeyboardLayoutGuide isDocked](self, "isDocked");
  if (v18 <= 0.0)
  {
    if (v19 || -[UIKeyboardLayoutGuide isTransitioning](self, "isTransitioning"))
    {
      if (v18 < 0.0)
        v18 = 0.0;
      goto LABEL_26;
    }
  }
  else if (v19)
  {
    -[UIKeyboardLayoutGuide setDocked:](self, "setDocked:", 0);
  }
  v20 = 0.0;
  v21 = 0.0;
  if (-[UIKeyboardLayoutGuide shouldFollowCurrentKeyboard](self, "shouldFollowCurrentKeyboard"))
  {
LABEL_26:
    if (v17 >= 0.0)
    {
      v20 = v18;
      v21 = v17;
    }
    else
    {
      if (-[UIKeyboardLayoutGuide isTransitioning](self, "isTransitioning"))
        v21 = v17;
      else
        v21 = 0.0;
      v20 = v18;
    }
  }
  _UIKeyboardLayoutGuideLogger();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    -[UIKeyboardLayoutGuide previousOffset](self, "previousOffset");
    v24 = v23;
    -[UIKeyboardLayoutGuide previousOffset](self, "previousOffset");
    *(_DWORD *)buf = 134218752;
    v30 = v21;
    v31 = 2048;
    v32 = v20;
    v33 = 2048;
    v34 = v24;
    v35 = 2048;
    v36 = v25;
    _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_DEFAULT, "changeOffsetConstants: offset is changing to {%0.f, %0.f} [previous offset: {%0.f, %0.f}]", buf, 0x2Au);
  }

  -[UIKeyboardLayoutGuide setPreviousOffset:](self, "setPreviousOffset:", v21, v20);
  v28.receiver = self;
  v28.super_class = (Class)UIKeyboardLayoutGuide;
  v26 = -[UITrackingLayoutGuide changeOffsetConstants:](&v28, sel_changeOffsetConstants_, v21, v20);
  LOBYTE(v8) = v26 & ~-[UIKeyboardLayoutGuide isTransitioning](self, "isTransitioning");
  return v8;
}

- (UIOffset)previousOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_previousOffset.horizontal;
  vertical = self->_previousOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (BOOL)isDocked
{
  return self->_docked;
}

- (BOOL)ignoreKeyboardChanges
{
  return self->_ignoreKeyboardChanges;
}

- (void)setPreviousOffset:(UIOffset)a3
{
  self->_previousOffset = a3;
}

- (BOOL)_changeSizingConstants:(CGSize)a3 force:(BOOL)a4
{
  double height;
  double width;
  int v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  const __CFString *v38;
  unsigned __int8 v39;
  objc_super v41;
  uint8_t buf[4];
  const __CFString *v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  height = a3.height;
  width = a3.width;
  v52 = *MEMORY[0x1E0C80C00];
  v8 = -[UIKeyboardLayoutGuide isWindowGuide](self, "isWindowGuide");
  if (v8)
  {
    -[UIKeyboardLayoutGuide previousSize](self, "previousSize");
    v10 = v9;
    v11 = v9 <= 1.0;
    -[UILayoutGuide layoutFrame](self, "layoutFrame");
    if (width == v13 && height == v12 && !v11)
    {
LABEL_14:
      LOBYTE(v8) = 0;
      return v8;
    }
    if (-[UIKeyboardLayoutGuide ignoreKeyboardChanges](self, "ignoreKeyboardChanges") && !a4)
    {
      _UIKeyboardLayoutGuideLogger();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "*** changeSizingConstants: called while ignoring changes; skipping ***",
          buf,
          2u);
      }

      goto LABEL_14;
    }
    -[UIKeyboardLayoutGuide previousSize](self, "previousSize");
    v18 = v17;
    v20 = v19;
    -[UIKeyboardLayoutGuide setPreviousSize:](self, "setPreviousSize:", width, height);
    if (!-[UIKeyboardLayoutGuide shouldFollowCurrentKeyboard](self, "shouldFollowCurrentKeyboard") || height == 0.0)
    {
      v21 = -[UIKeyboardLayoutGuide addsHeightWhenUndocked](self, "addsHeightWhenUndocked");
      -[UILayoutGuide owningView](self, "owningView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v21)
      {
        objc_msgSend(v22, "safeAreaInsets");
        height = height + v24;
      }
      else
      {
        objc_msgSend(v22, "window");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "insetForDismissedKeyboardGuide");
        height = v26;

      }
      -[UILayoutGuide owningView](self, "owningView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bounds");
      width = v28;

      if (!-[UIKeyboardLayoutGuide shouldFollowCurrentKeyboard](self, "shouldFollowCurrentKeyboard"))
      {
        -[UIKeyboardLayoutGuide previousOffset](self, "previousOffset");
        if (v29 > 0.0)
          -[UIKeyboardLayoutGuide changeOffsetConstants:](self, "changeOffsetConstants:", 0.0, 0.0);
      }
    }
    -[UIKeyboardLayoutGuide assistantHeightConstraint](self, "assistantHeightConstraint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      -[UILayoutGuide owningView](self, "owningView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "traitCollection");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:](UISystemInputAssistantViewController, "_defaultPreferredHeightForTraitCollection:", v32);
      v34 = v33;

      -[UIKeyboardLayoutGuide assistantHeightConstraint](self, "assistantHeightConstraint");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setConstant:", v34);

    }
    _UIKeyboardLayoutGuideLogger();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = -[UIKeyboardLayoutGuide isTransitioning](self, "isTransitioning");
      *(_DWORD *)buf = 138413314;
      v38 = CFSTR("not transitioning");
      if (v37)
        v38 = CFSTR("transitioning");
      v43 = v38;
      v44 = 2048;
      v45 = width;
      v46 = 2048;
      v47 = height;
      v48 = 2048;
      v49 = v18;
      v50 = 2048;
      v51 = v20;
      _os_log_impl(&dword_185066000, v36, OS_LOG_TYPE_DEFAULT, "changeSizingConstants: size is changing [%@] to {%0.f, %0.f} [previous size: {%0.f, %0.f}]", buf, 0x34u);
    }

    v41.receiver = self;
    v41.super_class = (Class)UIKeyboardLayoutGuide;
    v39 = -[UITrackingLayoutGuide changeSizingConstants:](&v41, sel_changeSizingConstants_, width, height);
    LOBYTE(v8) = v11 | ((v10 <= 1.0) | ~-[UIKeyboardLayoutGuide isTransitioning](self, "isTransitioning")) & v39;
  }
  return v8;
}

- (CGSize)previousSize
{
  double width;
  double height;
  CGSize result;

  width = self->_previousSize.width;
  height = self->_previousSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setTransitioning:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  if (-[UIKeyboardLayoutGuide isWindowGuide](self, "isWindowGuide") && self->_transitioning != v3)
  {
    self->_transitioning = v3;
    _UIKeyboardLayoutGuideLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("not transitioning");
      if (v3)
        v6 = CFSTR("transitioning");
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "setTransitioning: %@", (uint8_t *)&v7, 0xCu);
    }

    if (!v3)
      -[UITrackingLayoutGuide resetAnimationOptions](self, "resetAnimationOptions");
  }
}

- (BOOL)isTransitioning
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if (-[UIKeyboardLayoutGuide isWindowGuide](self, "isWindowGuide"))
  {
    LOBYTE(v3) = self->_transitioning;
  }
  else
  {
    v3 = -[UITrackingLayoutGuide constrainedToWindowGuide](self, "constrainedToWindowGuide");
    if (v3)
    {
      -[UILayoutGuide owningView](self, "owningView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_primaryKeyboardTrackingGuide");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isTransitioning");

      LOBYTE(v3) = v7;
    }
  }
  return v3;
}

- (BOOL)isWindowGuide
{
  return self->_windowGuide;
}

- (UIKeyboardLayoutGuide)init
{
  UIKeyboardLayoutGuide *v2;
  UIKeyboardLayoutGuide *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardLayoutGuide;
  v2 = -[UITrackingLayoutGuide init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_followsUndockedKeyboard = 0;
    -[UIKeyboardLayoutGuide _commonInit](v2, "_commonInit");
  }
  return v3;
}

- (unint64_t)validatedOverlappingEdges:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;

  if ((~(_BYTE)a3 & 0xA) != 0)
    v3 = a3;
  else
    v3 = a3 ^ 0xA;
  if ((~(_BYTE)a3 & 5) != 0)
    v4 = v3;
  else
    v4 = a3 ^ 1;
  if ((v4 & 4) == 0
    && -[UIKeyboardLayoutGuide currentKeyboardVisualState](self, "currentKeyboardVisualState") != 3
    && -[UIKeyboardLayoutGuide currentKeyboardVisualState](self, "currentKeyboardVisualState") != 4)
  {
    v4 |= 4uLL;
  }
  return v4;
}

- (void)_commonInit
{
  self->_docked = 1;
  -[UITrackingLayoutGuide pauseUpdatingConstraintsForEdges:](self, "pauseUpdatingConstraintsForEdges:", 11);
  self->_transitioning = 0;
  self->_windowGuide = 0;
  self->_addsHeightWhenUndocked = 0;
  self->_ignoresSafeArea = 0;
  self->_ignoreKeyboardChanges = 0;
  self->_keyboardDismissPadding = 0.0;
  self->_followTypes = 0;
  self->_currentKeyboardVisualState = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  self->_previousOffset = _Q0;
  self->_previousSize = (CGSize)xmmword_1866721B0;
  -[UITrackingLayoutGuide setProportionalEdgeThresholds:](self, "setProportionalEdgeThresholds:", 0.1, 0.1, 0.03, 0.1);
  -[UITrackingLayoutGuide startUpdatingConstraintsForEdges:](self, "startUpdatingConstraintsForEdges:", 15);
}

- (BOOL)shouldFollowCurrentKeyboard
{
  int64_t v3;
  uint64_t v4;

  if (-[UIKeyboardLayoutGuide currentKeyboardVisualState](self, "currentKeyboardVisualState") == 2)
    goto LABEL_5;
  v3 = -[UIKeyboardLayoutGuide currentKeyboardVisualState](self, "currentKeyboardVisualState");
  if (v3 != 1)
  {
    if (self->_followsUndockedKeyboard || self->_followTypes == 30)
    {
LABEL_5:
      LOBYTE(v3) = 1;
      return v3;
    }
    if (-[UIKeyboardLayoutGuide currentKeyboardVisualState](self, "currentKeyboardVisualState") == 3)
    {
      v4 = 2;
    }
    else if (-[UIKeyboardLayoutGuide currentKeyboardVisualState](self, "currentKeyboardVisualState") == 4)
    {
      v4 = 4;
    }
    else if (-[UIKeyboardLayoutGuide currentKeyboardVisualState](self, "currentKeyboardVisualState") == 5)
    {
      v4 = 8;
    }
    else
    {
      if (-[UIKeyboardLayoutGuide currentKeyboardVisualState](self, "currentKeyboardVisualState") != 6)
      {
        LOBYTE(v3) = 0;
        return v3;
      }
      v4 = 16;
    }
    LOBYTE(v3) = (self->_followTypes & v4) != 0;
  }
  return v3;
}

- (void)setPreviousSize:(CGSize)a3
{
  self->_previousSize = a3;
}

- (int64_t)currentKeyboardVisualState
{
  return self->_currentKeyboardVisualState;
}

- (void)setCurrentKeyboardVisualState:(int64_t)a3
{
  _BOOL8 v5;

  if (self->_currentKeyboardVisualState != a3)
  {
    -[UIKeyboardLayoutGuide keyboardStateIsDocked:](self, "keyboardStateIsDocked:");
    v5 = -[UIKeyboardLayoutGuide keyboardStateIsDocked:](self, "keyboardStateIsDocked:", a3);
    self->_currentKeyboardVisualState = a3;
    -[UIKeyboardLayoutGuide setDocked:](self, "setDocked:", v5);
    if (!v5)
      -[UIKeyboardLayoutGuide setPreviousSize:](self, "setPreviousSize:", 1.0, 0.0);
  }
}

- (BOOL)keyboardStateIsDocked:(int64_t)a3
{
  return (unint64_t)a3 < 3;
}

- (void)setDocked:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;

  if (self->_docked != a3)
  {
    v3 = a3;
    self->_docked = a3;
    if (-[UITrackingLayoutGuide constrainedToWindowGuide](self, "constrainedToWindowGuide"))
    {
      -[UILayoutGuide owningView](self, "owningView");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_primaryKeyboardTrackingGuide");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDocked:", v3);
    }
    else
    {
      -[UITrackingLayoutGuide resetAnimationOptions](self, "resetAnimationOptions");
      if (!-[UIKeyboardLayoutGuide isTransitioning](self, "isTransitioning")
        || !v3
        || -[UIKeyboardLayoutGuide shouldFollowCurrentKeyboard](self, "shouldFollowCurrentKeyboard"))
      {
        return;
      }
      -[UILayoutGuide owningView](self, "owningView");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v8 = v7;
      -[UILayoutGuide owningView](self, "owningView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "insetForDismissedKeyboardGuide");
      -[UIKeyboardLayoutGuide setPreviousSize:](self, "setPreviousSize:", v8, v9);
    }

  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardLayoutGuide;
  v4 = a3;
  -[UILayoutGuide encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_followsUndockedKeyboard, CFSTR("UIKeyboardLayoutGuideFollowsUndocked"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_usesBottomSafeArea, CFSTR("UIKeyboardLayoutGuideUsesBottomSafeArea"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("UIKeyboardLayoutGuideKeyboardDismissPadding"), self->_keyboardDismissPadding);

}

- (UIKeyboardLayoutGuide)initWithCoder:(id)a3
{
  id v4;
  UIKeyboardLayoutGuide *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardLayoutGuide;
  v5 = -[UILayoutGuide initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_followsUndockedKeyboard = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIKeyboardLayoutGuideFollowsUndocked"));
    v5->_usesBottomSafeArea = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIKeyboardLayoutGuideUsesBottomSafeArea"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("UIKeyboardLayoutGuideKeyboardDismissPadding"));
    v5->_keyboardDismissPadding = v6;
    -[UIKeyboardLayoutGuide _commonInit](v5, "_commonInit");
  }

  return v5;
}

- (void)setFollowsUndockedKeyboard:(BOOL)followsUndockedKeyboard
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if (self->_followsUndockedKeyboard != followsUndockedKeyboard)
  {
    v3 = followsUndockedKeyboard;
    self->_followsUndockedKeyboard = followsUndockedKeyboard;
    if (-[UITrackingLayoutGuide constrainedToWindowGuide](self, "constrainedToWindowGuide"))
    {
      -[UILayoutGuide owningView](self, "owningView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_primaryKeyboardTrackingGuide");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFollowsUndockedKeyboard:", v3);

    }
    else
    {
      if (v3)
        v8 = 30;
      else
        v8 = 0;
      -[UIKeyboardLayoutGuide setFollowTypes:](self, "setFollowTypes:", v8);
    }
    -[UITrackingLayoutGuide resetAnimationOptions](self, "resetAnimationOptions");
  }
}

- (void)setIgnoresSafeArea:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  id v8;

  if (self->_ignoresSafeArea != a3)
  {
    v3 = a3;
    self->_ignoresSafeArea = a3;
    if (-[UITrackingLayoutGuide constrainedToWindowGuide](self, "constrainedToWindowGuide"))
    {
      -[UIKeyboardLayoutGuide updateBottomConstraint](self, "updateBottomConstraint");
      -[UILayoutGuide owningView](self, "owningView");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_primaryKeyboardTrackingGuide");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setIgnoresSafeArea:", v3);

    }
    else if (-[UIKeyboardLayoutGuide isWindowGuide](self, "isWindowGuide"))
    {
      -[UIKeyboardLayoutGuide previousOffset](self, "previousOffset");
      if (v7 < 0.0)
        -[UIKeyboardLayoutGuide _moveGuideOffscreenAtEdge:force:](self, "_moveGuideOffscreenAtEdge:force:", 4, 1);
    }
  }
}

- (void)setUsesBottomSafeArea:(BOOL)usesBottomSafeArea
{
  -[UIKeyboardLayoutGuide setIgnoresSafeArea:](self, "setIgnoresSafeArea:", !usesBottomSafeArea);
}

- (void)setKeyboardDismissPadding:(CGFloat)keyboardDismissPadding
{
  void *v5;
  void *v6;
  id v7;

  if (self->_keyboardDismissPadding != keyboardDismissPadding)
  {
    self->_keyboardDismissPadding = keyboardDismissPadding;
    if (-[UITrackingLayoutGuide constrainedToWindowGuide](self, "constrainedToWindowGuide"))
    {
      -[UILayoutGuide owningView](self, "owningView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_primaryKeyboardTrackingGuide");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setKeyboardDismissPadding:", keyboardDismissPadding);

    }
  }
}

- (void)followUndockedKeyboardOfTypes:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  if (self->_followTypes != a3)
  {
    self->_followTypes = a3;
    if (-[UITrackingLayoutGuide constrainedToWindowGuide](self, "constrainedToWindowGuide"))
    {
      -[UILayoutGuide owningView](self, "owningView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_primaryKeyboardTrackingGuide");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "followUndockedKeyboardOfTypes:", a3);

    }
  }
}

- (void)forceResizeGuideForOrientation:(int64_t)a3 showsAssistantBar:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  int64_t v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v5 = a5;
  v6 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  _UIKeyboardLayoutGuideLogger();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134218496;
    v13 = a3;
    v14 = 1024;
    v15 = v6;
    v16 = 1024;
    v17 = v5;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "forceResizeGuideForOrientation: %li assistant bar: %i animated: %i", (uint8_t *)&v12, 0x18u);
  }

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentInputMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutGuide updateSizeForInputMode:orientation:showsAssistantBar:animated:](self, "updateSizeForInputMode:orientation:showsAssistantBar:animated:", v11, a3, v6, v5);

}

- (void)forceResizeGuideForInputMode:(id)a3 orientation:(BOOL)a4 showsAssistantBar:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL4 v8;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  _BOOL8 v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  _UIKeyboardLayoutGuideLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138413058;
    v16 = v10;
    v17 = 2048;
    v18 = v8;
    v19 = 1024;
    v20 = v7;
    v21 = 1024;
    v22 = v6;
    _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "forceResizeGuideForInputMode: %@ orientation: %li assistant bar: %i animated: %i", (uint8_t *)&v15, 0x22u);
  }

  if (!v10)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "documentInputMode");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastUsedInputModeForTextInputMode:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardLayoutGuide updateSizeForInputMode:orientation:showsAssistantBar:animated:](self, "updateSizeForInputMode:orientation:showsAssistantBar:animated:", v14, v8, v7, v6);
}

- (void)forceDismissGuideAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  _UIKeyboardLayoutGuideLogger();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "forceDismissGuideAnimated: %i", (uint8_t *)v6, 8u);
  }

  -[UIKeyboardLayoutGuide updateSizeForInputMode:orientation:showsAssistantBar:animated:](self, "updateSizeForInputMode:orientation:showsAssistantBar:animated:", 0, 0, 0, v3);
}

- (void)updateSizeForInputMode:(id)a3 orientation:(int64_t)a4 showsAssistantBar:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  NSObject *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t *v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  UIKeyboardLayoutGuide *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  UIKeyboardLayoutGuide *v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;
  CGSize v40;

  v6 = a6;
  v7 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (-[UITrackingLayoutGuide constrainedToWindowGuide](self, "constrainedToWindowGuide"))
  {
    -[UILayoutGuide owningView](self, "owningView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNeedsLayout");

    -[UILayoutGuide owningView](self, "owningView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_primaryKeyboardTrackingGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateSizeForInputMode:orientation:showsAssistantBar:animated:", v10, a4, v7, v6);

LABEL_14:
    goto LABEL_15;
  }
  if (v10)
  {
    -[UIKeyboardLayoutGuide defaultKeyboardSizeForInputMode:orientation:addingAssistant:](self, "defaultKeyboardSizeForInputMode:orientation:addingAssistant:", v10, a4, v7);
    v16 = v15;
    v18 = v17;
    if (-[UIKeyboardLayoutGuide _changeSizingConstants:force:](self, "_changeSizingConstants:force:", 1))
    {
      _UIKeyboardLayoutGuideLogger();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v40.width = v16;
        v40.height = v18;
        NSStringFromCGSize(v40);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v20;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_DEFAULT, "Force resize guide to: %@", buf, 0xCu);

      }
      if (v6)
      {
        +[UIInputViewAnimationStyle animationStyleDefault](UIInputViewAnimationStyle, "animationStyleDefault");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "duration");
        v23 = v22;
        v24 = objc_msgSend(v21, "extraOptions");
        v27 = MEMORY[0x1E0C809B0];
        v28 = 3221225472;
        v29 = __87__UIKeyboardLayoutGuide_updateSizeForInputMode_orientation_showsAssistantBar_animated___block_invoke_24;
        v30 = &unk_1E16B1B28;
        v31 = self;
        v25 = &v27;
LABEL_12:
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v24, v25, 0, v23, 0.0, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36);

        goto LABEL_15;
      }
      goto LABEL_13;
    }
  }
  else if (-[UIKeyboardLayoutGuide _moveGuideOffscreenAtEdge:force:](self, "_moveGuideOffscreenAtEdge:force:", 4, 1))
  {
    if (v6)
    {
      +[UIInputViewAnimationStyle animationStyleDefault](UIInputViewAnimationStyle, "animationStyleDefault");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "duration");
      v23 = v26;
      v24 = objc_msgSend(v21, "extraOptions");
      v32 = MEMORY[0x1E0C809B0];
      v33 = 3221225472;
      v34 = __87__UIKeyboardLayoutGuide_updateSizeForInputMode_orientation_showsAssistantBar_animated___block_invoke;
      v35 = &unk_1E16B1B28;
      v36 = self;
      v25 = &v32;
      goto LABEL_12;
    }
LABEL_13:
    -[UILayoutGuide owningView](self, "owningView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutViewsForTrackedGuides");
    goto LABEL_14;
  }
LABEL_15:

}

void __87__UIKeyboardLayoutGuide_updateSizeForInputMode_orientation_showsAssistantBar_animated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "owningView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutViewsForTrackedGuides");

}

void __87__UIKeyboardLayoutGuide_updateSizeForInputMode_orientation_showsAssistantBar_animated___block_invoke_24(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "owningView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutViewsForTrackedGuides");

}

- (void)disableSynchronizingWithKeyboard
{
  -[UIKeyboardLayoutGuide _detachGuideFromKeyboard:](self, "_detachGuideFromKeyboard:", 1);
}

- (void)reenableSynchronizingWithKeyboard
{
  -[UIKeyboardLayoutGuide _detachGuideFromKeyboard:](self, "_detachGuideFromKeyboard:", 0);
}

- (void)_detachGuideFromKeyboard:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (-[UIKeyboardLayoutGuide ignoreKeyboardChanges](self, "ignoreKeyboardChanges") != a3)
  {
    _UIKeyboardLayoutGuideLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("attached");
      if (v3)
        v6 = CFSTR("detached");
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "_detachGuideFromKeyboard: changed to %@", (uint8_t *)&v10, 0xCu);
    }

    if (-[UITrackingLayoutGuide constrainedToWindowGuide](self, "constrainedToWindowGuide"))
    {
      -[UILayoutGuide owningView](self, "owningView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_primaryKeyboardTrackingGuide");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_detachGuideFromKeyboard:", v3);

    }
    -[UIKeyboardLayoutGuide setIgnoreKeyboardChanges:](self, "setIgnoreKeyboardChanges:", v3);
  }
}

- (CGSize)defaultKeyboardSizeForInputMode:(id)a3 orientation:(int64_t)a4 addingAssistant:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
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
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  CGSize result;

  v5 = a5;
  v8 = a3;
  +[UIKeyboardImpl keyboardScreen](UIKeyboardImpl, "keyboardScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardLayoutStar keyboardSizeForInputMode:screenTraits:keyboardType:](UIKeyboardLayoutStar, "keyboardSizeForInputMode:screenTraits:keyboardType:", v11, v10, 0);
  v13 = v12;
  v15 = v14;

  +[UIKeyboardImpl topMarginForInterfaceOrientation:](UIKeyboardImpl, "topMarginForInterfaceOrientation:", a4);
  v17 = v15 + v16;
  +[UIKeyboardImpl deviceSpecificPaddingForInterfaceOrientation:inputMode:](UIKeyboardImpl, "deviceSpecificPaddingForInterfaceOrientation:inputMode:", a4, v8);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = v17 + v19 + v23;
  if (v5)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "systemInputAssistantViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      objc_msgSend(v28, "traitCollection");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "preferredHeightForTraitCollection:orientation:", v30, a4);
    }
    else
    {
      -[UILayoutGuide owningView](self, "owningView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "traitCollection");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:interfaceOrientation:](UISystemInputAssistantViewController, "_defaultPreferredHeightForTraitCollection:interfaceOrientation:", v30, a4);
    }
    v33 = v31;

    v26 = v26 + v33;
  }

  v34 = v13 + v21 + v25;
  v35 = v26;
  result.height = v35;
  result.width = v34;
  return result;
}

- (void)useLightEffectsBackgroundBelowView:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  _UIKBLightEffectsBackground *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  _QWORD v79[5];
  _QWORD v80[9];
  uint8_t buf[4];
  uint64_t v82;
  __int16 v83;
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[UILayoutGuide owningView](self, "owningView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardLayoutGuide.m"), 402, CFSTR("You cannot add a backdrop below a view to that view's keyboardLayoutGuide. Please use a keyboardLayoutGuide from higher up the view hierarchy. For best results, use viewController.view.keyboardLayoutGuide (or something else that's the size of your window)."));

  }
  -[UILayoutGuide owningView](self, "owningView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isDescendantOfView:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardLayoutGuide.m"), 403, CFSTR("To add a backdrop with keyboardLayoutGuide, the backedView to put it below must be a subview of the keyboardLayoutGuide's owning view. Ideally use viewController.view.keyboardLayoutGuide (or something else that's the size of your window)."));

  }
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    _UIKeyboardLayoutGuideLogger();
    v10 = (_UIKBLightEffectsBackground *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super.super.super.super, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_185066000, &v10->super.super.super.super, OS_LOG_TYPE_DEBUG, "useLightEffectsBackgroundBelowView: is only supported on iPhone", buf, 2u);
    }
LABEL_14:

    goto LABEL_15;
  }
  -[UIKeyboardLayoutGuide lightEffectsBackdrop](self, "lightEffectsBackdrop");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[UILayoutGuide owningView](self, "owningView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_primaryKeyboardTrackingGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "previousSize");
    v16 = v15;

    _UIKeyboardLayoutGuideLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v82 = objc_opt_class();
      v83 = 2048;
      v84 = v5;
      _os_log_debug_impl(&dword_185066000, v17, OS_LOG_TYPE_DEBUG, "useLightEffectsBackgroundBelowView: adding below <%@: %p>", buf, 0x16u);
    }

    v10 = objc_alloc_init(_UIKBLightEffectsBackground);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILayoutGuide owningView](self, "owningView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v5;
    objc_msgSend(v18, "insertSubview:belowSubview:", v10, v5);

    -[UIView topAnchor](v10, "topAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide owningView](self, "owningView");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "topAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:", v75);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v74;
    -[UIView leadingAnchor](v10, "leadingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide owningView](self, "owningView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "leadingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:", v71);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v80[1] = v70;
    -[UILayoutGuide owningView](self, "owningView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "bottomAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v10, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v67);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v80[2] = v66;
    -[UILayoutGuide owningView](self, "owningView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "trailingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v10, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v63);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v80[3] = v62;
    -[_UIKBLightEffectsBackground fullBackdropLayoutGuide](v10, "fullBackdropLayoutGuide");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self, "topAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v59);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v80[4] = v58;
    -[_UIKBLightEffectsBackground fullBackdropLayoutGuide](v10, "fullBackdropLayoutGuide");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](self, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v55);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v80[5] = v54;
    -[UILayoutGuide trailingAnchor](self, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBLightEffectsBackground fullBackdropLayoutGuide](v10, "fullBackdropLayoutGuide");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v51);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v80[6] = v50;
    -[_UIKBLightEffectsBackground fullBackdropLayoutGuide](v10, "fullBackdropLayoutGuide");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v80[7] = v21;
    -[_UIKBLightEffectsBackground assistantLayoutGuide](v10, "assistantLayoutGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v80[8] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutGuide setBackdropConstraints:](self, "setBackdropConstraints:", v26);

    -[UILayoutGuide owningView](self, "owningView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "traitCollection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:](UISystemInputAssistantViewController, "_defaultPreferredHeightForTraitCollection:", v28);
    v30 = v29;

    -[_UIKBLightEffectsBackground assistantLayoutGuide](v10, "assistantLayoutGuide");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "heightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToConstant:", v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutGuide setAssistantHeightConstraint:](self, "setAssistantHeightConstraint:", v33);

    v34 = (void *)MEMORY[0x1E0D156E0];
    -[UIKeyboardLayoutGuide backdropConstraints](self, "backdropConstraints");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutGuide assistantHeightConstraint](self, "assistantHeightConstraint");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "arrayByAddingObject:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateConstraints:", v37);

    -[UIKeyboardLayoutGuide setLightEffectsBackdrop:](self, "setLightEffectsBackdrop:", v10);
    -[UIKeyboardLayoutGuide lightEffectsBackdrop](self, "lightEffectsBackdrop");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "changeClippingStyle:", 3);

    -[UILayoutGuide owningView](self, "owningView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "_window");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "_primaryKeyboardTrackingGuide");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutGuide lightEffectsBackdrop](self, "lightEffectsBackdrop");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setLightEffectsBackdrop:", v42);

    -[UILayoutGuide owningView](self, "owningView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "_window");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_primaryKeyboardTrackingGuide");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutGuide assistantHeightConstraint](self, "assistantHeightConstraint");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setAssistantHeightConstraint:", v46);

    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __60__UIKeyboardLayoutGuide_useLightEffectsBackgroundBelowView___block_invoke;
    v79[3] = &unk_1E16B1B28;
    v79[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v79);
    if (v16 > 1.0)
      +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", &__block_literal_global_558);
    v5 = v78;
    goto LABEL_14;
  }
LABEL_15:

}

void __60__UIKeyboardLayoutGuide_useLightEffectsBackgroundBelowView___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "owningView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

uint64_t __60__UIKeyboardLayoutGuide_useLightEffectsBackgroundBelowView___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateLightEffectsBackdropAnimated:", 0);
}

- (void)hideLightEffectsView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UIKeyboardLayoutGuide lightEffectsBackdrop](self, "lightEffectsBackdrop");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)removeLightEffectsView
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  UIKeyboardLayoutGuide *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardLayoutGuide lightEffectsBackdrop](self, "lightEffectsBackdrop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _UIKeyboardLayoutGuideLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138412546;
      v14 = objc_opt_class();
      v15 = 2048;
      v16 = self;
      _os_log_debug_impl(&dword_185066000, v4, OS_LOG_TYPE_DEBUG, "removeLightEffectsView for <%@: %p>", (uint8_t *)&v13, 0x16u);
    }

    v5 = (void *)MEMORY[0x1E0D156E0];
    -[UIKeyboardLayoutGuide backdropConstraints](self, "backdropConstraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v6);

    -[UIKeyboardLayoutGuide setBackdropConstraints:](self, "setBackdropConstraints:", 0);
    -[UIKeyboardLayoutGuide assistantHeightConstraint](self, "assistantHeightConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 0);

    -[UIKeyboardLayoutGuide setAssistantHeightConstraint:](self, "setAssistantHeightConstraint:", 0);
    -[UIKeyboardLayoutGuide lightEffectsBackdrop](self, "lightEffectsBackdrop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[UIKeyboardLayoutGuide setLightEffectsBackdrop:](self, "setLightEffectsBackdrop:", 0);
    -[UILayoutGuide owningView](self, "owningView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutIfNeeded");

    if (-[UIKeyboardLayoutGuide isWindowGuide](self, "isWindowGuide"))
    {
      +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", &__block_literal_global_43_1);
    }
    else
    {
      -[UILayoutGuide owningView](self, "owningView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_primaryKeyboardTrackingGuide");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeLightEffectsView");

    }
  }
}

uint64_t __47__UIKeyboardLayoutGuide_removeLightEffectsView__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateLightEffectsBackdropAnimated:", 0);
}

- (void)transitionBackdropForAnimationStart:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UIKeyboardLayoutGuide lightEffectsBackdrop](self, "lightEffectsBackdrop");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateAlphaForAnimationStart:", v3);

}

- (BOOL)updateLightEffectsRenderConfig:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  -[UIKeyboardLayoutGuide lightEffectsBackdrop](self, "lightEffectsBackdrop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(v6, "animatedBackground"))
    {
      -[UIKeyboardLayoutGuide lightEffectsBackdrop](self, "lightEffectsBackdrop");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v4)
        objc_msgSend(v8, "animatedTransitionToRenderConfig:", v6);
      else
        objc_msgSend(v8, "_setRenderConfig:", v6);

    }
    else
    {
      -[UIKeyboardLayoutGuide hideLightEffectsView:](self, "hideLightEffectsView:", 1);
    }
  }

  return v7 != 0;
}

- (id)guideBackdropMatchLayer
{
  void *v2;
  void *v3;

  -[UIKeyboardLayoutGuide lightEffectsBackdrop](self, "lightEffectsBackdrop");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layerForPositionMatchMove");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)currentStateIsDocked
{
  return -[UIKeyboardLayoutGuide currentKeyboardVisualState](self, "currentKeyboardVisualState") != 3
      && -[UIKeyboardLayoutGuide currentKeyboardVisualState](self, "currentKeyboardVisualState") != 4
      && -[UIKeyboardLayoutGuide currentKeyboardVisualState](self, "currentKeyboardVisualState") != 5
      && -[UIKeyboardLayoutGuide currentKeyboardVisualState](self, "currentKeyboardVisualState") != 6;
}

- (BOOL)moveGuideOffscreenAtEdge:(unint64_t)a3
{
  return -[UIKeyboardLayoutGuide _moveGuideOffscreenAtEdge:force:](self, "_moveGuideOffscreenAtEdge:force:", a3, 0);
}

- (BOOL)_moveGuideOffscreenAtEdge:(unint64_t)a3 force:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v7;
  void *v8;
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
  void *v22;
  double v23;
  BOOL v24;
  BOOL v25;
  BOOL result;
  int v27;
  unint64_t v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  if (!-[UIKeyboardLayoutGuide isWindowGuide](self, "isWindowGuide")
    || -[UIKeyboardLayoutGuide isTransitioning](self, "isTransitioning") && !v4)
  {
    return 0;
  }
  _UIKeyboardLayoutGuideLogger();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 134217984;
    v28 = a3;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "_moveGuideOffscreenAtEdge: %lu", (uint8_t *)&v27, 0xCu);
  }

  -[UILayoutGuide owningView](self, "owningView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;

  -[UIKeyboardLayoutGuide previousOffset](self, "previousOffset");
  v12 = v11;
  v14 = v13;
  -[UIKeyboardLayoutGuide previousSize](self, "previousSize");
  v16 = v15;
  v18 = v17;
  v19 = v12 >= 0.0 ? v12 : 0.0;
  v20 = v14 >= 0.0 ? v14 : 0.0;
  -[UIKeyboardLayoutGuide setInteractionResetOffset:](self, "setInteractionResetOffset:", v19, v20);
  -[UIKeyboardLayoutGuide setInteractionResetSize:](self, "setInteractionResetSize:", v16, v18);
  if (a3 == 2)
  {
    v21 = v19 - v10;
  }
  else if (a3 == 8)
  {
    v21 = v10 + v19;
  }
  else
  {
    v20 = 0.0;
    if (-[UIKeyboardLayoutGuide ignoresSafeArea](self, "ignoresSafeArea"))
    {
      v18 = 0.0;
    }
    else
    {
      -[UILayoutGuide owningView](self, "owningView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "safeAreaInsets");
      v18 = v23;

    }
    v16 = v10;
    v21 = 0.0;
  }
  v24 = -[UIKeyboardLayoutGuide _changeOffsetConstants:force:](self, "_changeOffsetConstants:force:", v4, v21, v20);
  v25 = -[UIKeyboardLayoutGuide _changeSizingConstants:force:](self, "_changeSizingConstants:force:", v4, v16, v18);
  -[UITrackingLayoutGuide updateConstraintsForActiveEdges](self, "updateConstraintsForActiveEdges");
  result = 1;
  if (!v24 && !v25)
    return 0;
  return result;
}

- (void)resetGuideForCancelledDismissInteraction
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  UIOffset v8;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[UIKeyboardLayoutGuide isWindowGuide](self, "isWindowGuide"))
  {
    _UIKeyboardLayoutGuideLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[UIKeyboardLayoutGuide interactionResetOffset](self, "interactionResetOffset");
      NSStringFromUIOffset(v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "resetGuideForCancelledDismissInteraction %@", (uint8_t *)&v5, 0xCu);

    }
    -[UIKeyboardLayoutGuide interactionResetOffset](self, "interactionResetOffset");
    -[UIKeyboardLayoutGuide changeOffsetConstants:](self, "changeOffsetConstants:");
    -[UIKeyboardLayoutGuide setInteractionResetOffset:](self, "setInteractionResetOffset:", 0.0, 0.0);
  }
}

- (void)setAddsHeightWhenUndocked:(BOOL)a3
{
  self->_addsHeightWhenUndocked = a3;
}

- (BOOL)usesBottomSafeArea
{
  return self->_usesBottomSafeArea;
}

- (void)setIgnoreKeyboardChanges:(BOOL)a3
{
  self->_ignoreKeyboardChanges = a3;
}

- (void)setFollowTypes:(int64_t)a3
{
  self->_followTypes = a3;
}

- (_UIKBLightEffectsBackground)lightEffectsBackdrop
{
  return self->_lightEffectsBackdrop;
}

- (void)setLightEffectsBackdrop:(id)a3
{
  objc_storeStrong((id *)&self->_lightEffectsBackdrop, a3);
}

- (NSArray)backdropConstraints
{
  return self->_backdropConstraints;
}

- (void)setBackdropConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_backdropConstraints, a3);
}

- (NSLayoutConstraint)assistantHeightConstraint
{
  return self->_assistantHeightConstraint;
}

- (void)setAssistantHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_assistantHeightConstraint, a3);
}

- (UIOffset)interactionResetOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_interactionResetOffset.horizontal;
  vertical = self->_interactionResetOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)setInteractionResetOffset:(UIOffset)a3
{
  self->_interactionResetOffset = a3;
}

- (CGSize)interactionResetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_interactionResetSize.width;
  height = self->_interactionResetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInteractionResetSize:(CGSize)a3
{
  self->_interactionResetSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantHeightConstraint, 0);
  objc_storeStrong((id *)&self->_backdropConstraints, 0);
  objc_storeStrong((id *)&self->_lightEffectsBackdrop, 0);
  objc_storeStrong((id *)&self->_viewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_assertionController, 0);
}

@end
