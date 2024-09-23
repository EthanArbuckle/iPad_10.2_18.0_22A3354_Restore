@implementation UIKeyboard

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)UIKeyboard;
  -[UIView layoutSubviews](&v2, sel_layoutSubviews);
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[UIKeyboard window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
    -[UIKeyboard clearActivePerScreenIfNeeded](self, "clearActivePerScreenIfNeeded");
}

+ (BOOL)isInputUIProcess
{
  if (qword_1ECD7C748 != -1)
    dispatch_once(&qword_1ECD7C748, &__block_literal_global_944_0);
  return byte_1ECD7C721;
}

+ (BOOL)usesInputSystemUI
{
  int v3;

  v3 = objc_msgSend(a1, "inputUIOOP");
  if (v3)
    LOBYTE(v3) = objc_msgSend(a1, "isKeyboardProcess") ^ 1;
  return v3;
}

+ (BOOL)inputUIOOP
{
  if (qword_1ECD7C740 != -1)
    dispatch_once(&qword_1ECD7C740, &__block_literal_global_935);
  return _MergedGlobals_31_0;
}

+ (BOOL)supportsAutoFillPanel
{
  if (qword_1ECD7C798 != -1)
    dispatch_once(&qword_1ECD7C798, &__block_literal_global_983);
  return byte_1ECD7C72B;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  objc_super v19;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  if (v9 == width && v8 == height)
    goto LABEL_8;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferencesActions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "currentInputModeSupportsCrescendo"))
  {

LABEL_8:
    v20.receiver = self;
    v20.super_class = (Class)UIKeyboard;
    -[UIView setBounds:](&v20, sel_setBounds_, x, y, width, height);
    return;
  }
  v13 = +[UIKeyboard resizable](UIKeyboard, "resizable");

  if (v13)
    goto LABEL_8;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1
    || (objc_msgSend(v14, "textInputTraits"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "keyboardType"),
        v15,
        v16 != 127))
  {
    -[UIKeyboard autoAdjustOrientation](self, "autoAdjustOrientation");
    self->m_hasExplicitOrientation = 0;
    +[UIKeyboardImpl sizeForInterfaceOrientation:ignoreInputView:](UIKeyboardImpl, "sizeForInterfaceOrientation:ignoreInputView:", self->m_orientation, 1);
    width = v17;
    height = v18;
  }
  v19.receiver = self;
  v19.super_class = (Class)UIKeyboard;
  -[UIView setBounds:](&v19, sel_setBounds_, x, y, width, height);
  if (!self->m_respondingToImplGeometryChange)
    -[UIKeyboard activate](self, "activate");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (id)window
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKeyboard;
  -[UIView window](&v3, sel_window);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isMinimized
{
  return self->m_minimized;
}

+ (BOOL)isInHardwareKeyboardMode
{
  void *v2;
  void *v3;
  char v4;
  void *v5;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "isInHardwareKeyboardMode");
  }
  else
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "_isHardwareKeyboardAvailable");

  }
  return v4;
}

+ (id)activeKeyboard
{
  return (id)activeKeyboard;
}

- (int64_t)interfaceOrientation
{
  return self->m_orientation;
}

+ (BOOL)isAlwaysAllowedAutoFillPanelClient
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__UIKeyboard_isAlwaysAllowedAutoFillPanelClient__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7C7A8 != -1)
    dispatch_once(&qword_1ECD7C7A8, block);
  return byte_1ECD7C72D;
}

+ (id)activeKeyboardForScreen:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (id)activeKeyboardsPerScreen;
  objc_sync_enter(v4);
  v5 = (void *)activeKeyboardsPerScreen;
  objc_msgSend(v3, "_name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  return v7;
}

+ (BOOL)usesLocalKeyboard
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;

  if (TIGetUsesLocalKeyboardValue_onceToken != -1)
    dispatch_once(&TIGetUsesLocalKeyboardValue_onceToken, &__block_literal_global_1377);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForPreferenceKey:", CFSTR("UsesLocalKeyboard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend(v3, "BOOLValue");
  if ((_DWORD)v2 && +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "snapshotting");
    if ((v5 & 1) != 0
      || (+[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate"), v3 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v3, "loadingLocalKeyboard")))
    {
      +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "sceneIsFullScreen");

      if ((v5 & 1) != 0)
        goto LABEL_12;
    }
    else
    {
      v7 = 0;
    }

LABEL_12:
    return v7;
  }
  return 0;
}

+ (BOOL)isSpotlight
{
  void *v2;
  char v3;

  objc_msgSend(a1, "keyboardBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Spotlight"));

  return v3;
}

+ (id)keyboardBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (!objc_msgSend(a1, "isKeyboardProcess"))
    goto LABEL_3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputSystemSourceSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_3:
    _UIMainBundleIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_setRenderConfig:(id)a3
{
  void *v4;
  UIKeyboard *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (UIKeyboard *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLayoutRenderConfig:", v9);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "candidateController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setRenderConfig:", v9);

  }
}

+ (BOOL)isModelessActive
{
  int v2;
  void *v3;
  char v4;

  v2 = objc_msgSend((id)objc_opt_class(), "isMajelEnabled");
  if (v2)
  {
    +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "usingTypeAndTalk");

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)isRedesignedTextCursorEnabled
{
  if (qword_1ECD7C790 != -1)
    dispatch_once(&qword_1ECD7C790, &__block_literal_global_972_0);
  return byte_1ECD7C72A;
}

+ (BOOL)isMajelEnabled
{
  void *v3;

  if (qword_1ECD7C758 != -1)
    dispatch_once(&qword_1ECD7C758, &__block_literal_global_959_0);
  if (byte_1ECD7C723 && os_variant_has_internal_diagnostics())
  {
    _UIKitUserDefaults();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    byte_1ECD7C723 = objc_msgSend(v3, "BOOLForKey:", CFSTR("UIDictationControllerDisableTypeAndTalk")) ^ 1;

  }
  return byte_1ECD7C723;
}

+ (id)suppressionPolicyDelegate
{
  return (id)_suppressionPolicyDelegate;
}

- (UIKeyboard)initWithFrame:(CGRect)a3
{
  return (UIKeyboard *)-[UIKeyboard _initWithFrame:lazily:](self, "_initWithFrame:lazily:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)_initWithFrame:(CGRect)a3 lazily:(BOOL)a4
{
  UIKeyboard *v5;
  UIKeyboard *v6;
  void *v7;
  void *v8;
  void *v9;
  CGSize v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIKeyboard;
  v5 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_shouldUpdateLayoutAutomatically = 1;
    -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 0);
    v6->m_orientation = 0;
    if (!a4)
    {
      if (!activeKeyboard)
        objc_storeStrong((id *)&activeKeyboard, v6);
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setOpaque:](v6, "setOpaque:", objc_msgSend(v7, "keyboardDrawsOpaque"));

      +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if ((UIKeyboard *)activeKeyboard == v6)
        objc_msgSend(v8, "setGeometryDelegate:", v6);
      if (-[UIKeyboard isAutomatic](v6, "isAutomatic")
        && ((objc_msgSend(v9, "_shouldMinimizeForHardwareKeyboard") & 1) != 0
         || objc_msgSend(v9, "_shouldSuppressSoftwareKeyboard")))
      {
        v6->m_minimized = 1;
      }
      v6->m_respondingToImplGeometryChange = 0;
      v10 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      v6->_forcedFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
      v6->_forcedFrame.size = v10;

    }
  }
  return v6;
}

- (void)activate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIKeyboard *v9;
  NSArray *v10;
  void *v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  NSArray *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  UIKeyboard *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSArray *v44;
  NSArray *implConstraints;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  _QWORD v58[5];

  v58[4] = *MEMORY[0x1E0C80C00];
  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if ((UIKeyboard *)activeKeyboard == self)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v9 = (UIKeyboard *)v24;
        -[UIView traitCollection](self, "traitCollection");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "userInterfaceIdiom") == 3)
        {
          v26 = -[UIKeyboard requestedInteractionModel](self, "requestedInteractionModel");

          if (v26)
            -[UIKeyboard setRequestedInteractionModel:](v9, "setRequestedInteractionModel:", -[UIKeyboard requestedInteractionModel](self, "requestedInteractionModel"));
        }
        else
        {

        }
        -[UIKeyboard setGeometryDelegate:](v9, "setGeometryDelegate:", self);
        -[UIView superview](v9, "superview");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
          v28 = self;
        else
          v28 = v9;
        -[UIView bounds](v28, "bounds");
        v30 = v29;
        v32 = v31;

        -[UIKeyboard autoAdjustOrientation](self, "autoAdjustOrientation");
        -[UIKeyboard setShouldUpdateLayoutAutomatically:](v9, "setShouldUpdateLayoutAutomatically:", -[UIKeyboard shouldUpdateLayoutAutomatically](self, "shouldUpdateLayoutAutomatically"));
        -[UIKeyboard setFrame:](v9, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v30, v32);
        -[UIView superview](v9, "superview");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v33)
        {
          -[UIView addSubview:](self, "addSubview:", v9);
          -[UIKeyboard setDefaultTextInputTraits:](v9, "setDefaultTextInputTraits:", self->m_defaultTraits);
          -[UIKeyboard setOverrideTextInputTraits:](v9, "setOverrideTextInputTraits:", self->m_overrideTraits);
          if (self->_implConstraints)
            objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
          +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "preferencesActions");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "crescendoEnabled");

          if (v36)
          {
            -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
            -[UIView topAnchor](v9, "topAnchor");
            v56 = (id)objc_claimAutoreleasedReturnValue();
            -[UIView topAnchor](self, "topAnchor");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "constraintEqualToAnchor:", v53);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v58[0] = v51;
            -[UIView leadingAnchor](v9, "leadingAnchor");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView leadingAnchor](self, "leadingAnchor");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "constraintEqualToAnchor:", v47);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v58[1] = v37;
            -[UIView bottomAnchor](self, "bottomAnchor");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView bottomAnchor](v9, "bottomAnchor");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "constraintEqualToAnchor:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v58[2] = v40;
            -[UIView trailingAnchor](self, "trailingAnchor");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView trailingAnchor](v9, "trailingAnchor");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "constraintEqualToAnchor:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v58[3] = v43;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 4);
            v44 = (NSArray *)objc_claimAutoreleasedReturnValue();
            implConstraints = self->_implConstraints;
            self->_implConstraints = v44;

            objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_implConstraints);
          }
        }
        -[UIKeyboard setupKeyFocusGuides](self, "setupKeyFocusGuides");
        -[UIKeyboard clearSnapshot](self, "clearSnapshot");
        -[UIKeyboard setNeedsDisplay](self, "setNeedsDisplay");
        goto LABEL_38;
      }
    }
    else
    {
      objc_msgSend((id)activeKeyboard, "takeSnapshot");
    }
    -[UIKeyboard clearSnapshot](self, "clearSnapshot");
    if ((objc_msgSend((id)activeKeyboard, "isAutomatic") & 1) == 0 && -[UIKeyboard isAutomatic](self, "isAutomatic"))
      objc_msgSend((id)activeKeyboard, "removeFromSuperview");
    objc_storeStrong((id *)&activeKeyboard, self);
    -[UIKeyboard window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)objc_opt_class();
      -[UIKeyboard window](self, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "screen");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "makeKeyboardActive:forScreen:", self, v7);

    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setOpaque:](self, "setOpaque:", objc_msgSend(v8, "keyboardDrawsOpaque"));

    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v9 = (UIKeyboard *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboard setGeometryDelegate:](v9, "setGeometryDelegate:", self);
    -[UIView removeFromSuperview](v9, "removeFromSuperview");
    -[UIView bounds](self, "bounds");
    -[UIKeyboard setFrame:](v9, "setFrame:");
    -[UIView addSubview:](self, "addSubview:", v9);
    if (self->_implConstraints)
    {
      objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
      v10 = self->_implConstraints;
      self->_implConstraints = 0;

    }
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferencesActions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "crescendoEnabled") & 1) != 0)
    {

    }
    else
    {
      v14 = +[UIKeyboard resizable](UIKeyboard, "resizable");

      if (!v14)
      {
        -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
        goto LABEL_27;
      }
    }
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView topAnchor](v9, "topAnchor");
    v55 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v52);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v50;
    -[UIView leadingAnchor](v9, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v46);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v15;
    -[UIView bottomAnchor](self, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v9, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v57[2] = v18;
    -[UIView trailingAnchor](self, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v9, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v57[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 4);
    v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v23 = self->_implConstraints;
    self->_implConstraints = v22;

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_implConstraints);
LABEL_27:
    -[UIKeyboard setupKeyFocusGuides](self, "setupKeyFocusGuides");
    -[UIKeyboard setDefaultTextInputTraits:](v9, "setDefaultTextInputTraits:", self->m_defaultTraits);
    -[UIKeyboard setOverrideTextInputTraits:](v9, "setOverrideTextInputTraits:", self->m_overrideTraits);
LABEL_38:

    return;
  }
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    v13 = activeKeyboard == (_QWORD)self;
  else
    v13 = 0;
  if (v13 && -[UITextInputTraits forceFloatingKeyboard](self->m_overrideTraits, "forceFloatingKeyboard"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v54 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setOverrideTextInputTraits:", self->m_overrideTraits);

  }
}

- (void)setupKeyFocusGuides
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *m_focusGuides;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  UIKBFocusGuide *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  NSMutableDictionary *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  UIKeyboard *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[UIView focusGuides](self, "focusGuides");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v8, "owningView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeLayoutGuide:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->m_focusGuides, "removeAllObjects");
  if (-[UIKeyboard isActive](self, "isActive") && -[UIKeyboard canBecomeFocused](self, "canBecomeFocused"))
  {
    if (!self->m_focusGuides)
    {
      v10 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
      m_focusGuides = self->m_focusGuides;
      self->m_focusGuides = v10;

      *(_OWORD *)&self->m_unfocusedFocusGuideOutsets.top = 0u;
      *(_OWORD *)&self->m_unfocusedFocusGuideOutsets.bottom = 0u;
    }
    -[UIView traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    v14 = &unk_1E1A941A8;
    if (v13 != 3)
      v14 = 0;
    if (v13 == 2)
      v15 = &unk_1E1A94190;
    else
      v15 = v14;
    v16 = objc_msgSend((id)UIApp, "userInterfaceLayoutDirection");
    if (objc_msgSend(v15, "count"))
    {
      v17 = 0;
      v18 = 32;
      if (v16 == 1)
        v19 = 16;
      else
        v19 = 32;
      if (v16 != 1)
        v18 = 16;
      v31 = v18;
      v32 = v19;
      do
      {
        objc_msgSend(v15, "objectAtIndex:", v17, v31);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "integerValue");

        v22 = objc_alloc_init(UIKBFocusGuide);
        -[UIKBFocusGuide setKeyboardDelegate:](v22, "setKeyboardDelegate:", self);
        v37 = self;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIFocusGuide setPreferredFocusEnvironments:](v22, "setPreferredFocusEnvironments:", v23);

        -[UIKBFocusGuide setFocusHeading:](v22, "setFocusHeading:", v21);
        -[UIView bounds](self, "bounds");
        switch(v21)
        {
          case 1:
            v27 = 60.0;
            v25 = -60.0;
            break;
          case 4:
            goto LABEL_30;
          case 2:
            v25 = v27;
            v27 = 60.0;
            break;
          default:
            if (v21 != v32)
            {
              if (v21 == 8 || v21 == v31)
              {
                v24 = v26;
                v26 = 60.0;
              }
              break;
            }
LABEL_30:
            v26 = 60.0;
            v24 = -60.0;
            break;
        }
        -[UILayoutGuide _setManualLayoutFrame:](v22, "_setManualLayoutFrame:", v24, v25, v26, v27);
        -[UIView addLayoutGuide:](self, "addLayoutGuide:", v22);
        v29 = self->m_focusGuides;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v22, v30);

        ++v17;
      }
      while (v17 < objc_msgSend(v15, "count"));
    }
    -[UIKeyboard updateKeyFocusGuides](self, "updateKeyFocusGuides");
  }
}

- (BOOL)isActive
{
  return activeKeyboard == (_QWORD)self;
}

- (void)setNeedsDisplay
{
  id v2;

  -[UIView layer](self, "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsDisplay");

}

- (void)autoAdjustOrientation
{
  if (!self->m_hasExplicitOrientation)
    self->m_orientation = -[UIView _keyboardOrientation](self, "_keyboardOrientation");
}

- (BOOL)shouldUpdateLayoutAutomatically
{
  return self->_shouldUpdateLayoutAutomatically;
}

- (void)clearSnapshot
{
  UIView *m_snapshot;

  -[UIView removeFromSuperview](self->m_snapshot, "removeFromSuperview");
  m_snapshot = self->m_snapshot;
  self->m_snapshot = 0;

}

- (BOOL)canBecomeFocused
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 3)
  {
    if (!-[UIKeyboard requestedInteractionModel](self, "requestedInteractionModel"))
    {
      -[UIView traitCollection](self, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "primaryInteractionModel") != 1;

      return v5;
    }
    if (-[UIKeyboard requestedInteractionModel](self, "requestedInteractionModel") != 2)
      return -[UIKeyboard requestedInteractionModel](self, "requestedInteractionModel") == 8;
  }
  return 1;
}

void __30__UIKeyboard_isInputUIProcess__block_invoke()
{
  void *v0;
  int v1;

  _UIMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.InputUI"));

  if (v1)
    byte_1ECD7C721 = 1;
}

+ (CGSize)sizeForInterfaceOrientation:(int64_t)a3 inputDelegate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  objc_class *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NSObject *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  NSSize v39;
  CGSize result;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend(a1, "usesInputSystemUI"))
  {
    +[_UIKeyboardArbiterClient automaticSharedArbiterClient](_UIKeyboardArbiterClient, "automaticSharedArbiterClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentUIState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "resizing");

    if ((v9 & 1) == 0)
    {
      +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setInputModeFromPreferences");

    }
  }
  objc_msgSend(a1, "sizeForInterfaceOrientation:ignoreInputView:inputDelegate:", a3, 1, v6);
  v12 = v11;
  v14 = v13;
  if (!+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
  {
    if (objc_msgSend((id)UIApp, "_isSpringBoard"))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("SPUIProxySearchField"));

      if (v17)
      {
        +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "scene");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "intersectionHeightForWindowScene:", v20);
        v22 = v21;

        if (v22 > 0.0)
        {
          +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "currentInputMode");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          +[UIKeyboardImpl deviceSpecificPaddingForInterfaceOrientation:inputMode:](UIKeyboardImpl, "deviceSpecificPaddingForInterfaceOrientation:inputMode:", a3, v24);
          v26 = v25;
          v28 = v27;
          +[UIKeyboardImpl deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:](UIKeyboardImpl, "deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:", a3, v24);
          v31 = v22 + v26 - v29 + v28 - v30;
          if (v14 < v31)
            v14 = v31;

        }
      }
    }
  }
  if (os_variant_has_internal_diagnostics())
  {
    _UIKeyboardExtendedLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v39.width = v12;
      v39.height = v14;
      NSStringFromSize(v39);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138412290;
      v37 = v35;
      _os_log_impl(&dword_185066000, v34, OS_LOG_TYPE_DEFAULT, "keyboard size lookup ahead SPI: %@", (uint8_t *)&v36, 0xCu);

    }
  }

  v32 = v12;
  v33 = v14;
  result.height = v33;
  result.width = v32;
  return result;
}

+ (CGSize)sizeForInterfaceOrientation:(int64_t)a3 ignoreInputView:(BOOL)a4 inputDelegate:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  UISystemInputAssistantViewController *v15;
  UISystemInputAssistantViewController *v16;
  BOOL v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGSize result;

  v5 = a4;
  v7 = a5;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inputViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v7 || v9 && !objc_msgSend(v9, "isEmpty") || objc_msgSend(v10, "isCustomInputView"))
  {
    objc_msgSend(v10, "keyboard");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      if (!v5 && (objc_msgSend(v10, "isCustomInputView") & 1) != 0)
        goto LABEL_10;
      +[UIInputViewSet inputSetWithKeyboardAndAccessoryView:](UIInputViewSet, "inputSetWithKeyboardAndAccessoryView:", 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v10 = (void *)v12;
    }

LABEL_10:
    objc_msgSend(v8, "systemInputAssistantViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      v15 = v13;
    else
      v15 = objc_alloc_init(UISystemInputAssistantViewController);
    v16 = v15;

    v17 = -[UISystemInputAssistantViewController shouldBeShownForInputDelegate:inputViews:](v16, "shouldBeShownForInputDelegate:inputViews:", v7, v10);
    if (v17)
      goto LABEL_14;
    goto LABEL_16;
  }
  if ((objc_msgSend((id)objc_opt_class(), "assistantBarShouldBeIncludedInSizeForDelegate:", v7) & 1) != 0)
  {
LABEL_14:
    v18 = 1;
    goto LABEL_20;
  }
LABEL_16:
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    && !+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    objc_msgSend(v8, "responder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "inputViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v20 != 0;

  }
  else
  {
    v18 = 0;
  }
LABEL_20:
  objc_msgSend((id)objc_opt_class(), "sizeForInterfaceOrientation:includingAssistantBar:ignoreInputView:", a3, v18, v5);
  v22 = v21;
  v24 = v23;

  v25 = v22;
  v26 = v24;
  result.height = v26;
  result.width = v25;
  return result;
}

+ (BOOL)assistantBarShouldBeIncludedInSizeForDelegate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  char v18;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  unint64_t v24;
  NSObject *v25;
  uint8_t v26[16];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    if (!v3)
    {
      __UIFaultDebugAssertLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_fault_impl(&dword_185066000, v23, OS_LOG_TYPE_FAULT, "assistantBarShouldBeIncludedInSizeForDelegate:inputMode: should only be used with a valid inputDelegate", v26, 2u);
      }

    }
  }
  else if (!v3)
  {
    v24 = assistantBarShouldBeIncludedInSizeForDelegate____s_category;
    if (!assistantBarShouldBeIncludedInSizeForDelegate____s_category)
    {
      v24 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v24, (unint64_t *)&assistantBarShouldBeIncludedInSizeForDelegate____s_category);
    }
    v25 = *(NSObject **)(v24 + 8);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "assistantBarShouldBeIncludedInSizeForDelegate:inputMode: should only be used with a valid inputDelegate", v26, 2u);
    }
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "conformsToProtocolCached:", &unk_1EDE24D00))
  {
    objc_msgSend(v3, "textInputTraits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  if (!v5)
  {
    if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled")|| !objc_msgSend(v3, "conformsToProtocolCached:", &unk_1EE0CE228)|| (+[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v3), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (objc_msgSend(v3, "conformsToProtocolCached:", &unk_1EDE22B80))
      {
        +[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }
    }
  }
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentInputMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "textInputMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "identifier");
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v13;
    }

  }
  if (UIKeyboardAlwaysShowCandidateBarForInputMode())
  {
    if ((objc_msgSend(v5, "disableInputBars") & 1) == 0)
    {
      v14 = objc_msgSend(v5, "hidePrediction") ^ 1;
      goto LABEL_28;
    }
LABEL_27:
    LOBYTE(v14) = 0;
    goto LABEL_28;
  }
  if (objc_msgSend(v5, "autocorrectionType") == 1)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "autocorrectionPreferenceForTraits") != 2;

  }
  else
  {
    v16 = 0;
  }
  if ((objc_msgSend(v5, "disablePrediction") & 1) != 0 || (objc_msgSend(v5, "hidePrediction") & 1) != 0)
    goto LABEL_27;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "disableInputBars") | v16) == 1)
  {

    goto LABEL_27;
  }
  v18 = objc_msgSend(v5, "isSecureTextEntry");

  if ((v18 & 1) != 0)
    goto LABEL_27;
  v27[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIKeyboardPredictionEnabledForInputModes(v20))
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "preferencesActions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v14) = objc_msgSend(v22, "predictionEnabled");

  }
  else
  {
    LOBYTE(v14) = 0;
  }

LABEL_28:
  return v14;
}

uint64_t __43__UIKeyboard_isRedesignedTextCursorEnabled__block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  byte_1ECD7C72A = result;
  return result;
}

+ (BOOL)presentsInlineTextCompletionAsMarkedText
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__UIKeyboard_presentsInlineTextCompletionAsMarkedText__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7C770 != -1)
    dispatch_once(&qword_1ECD7C770, block);
  return byte_1ECD7C726;
}

+ (BOOL)isInlineTextCompletionUIEnabled
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__UIKeyboard_isInlineTextCompletionUIEnabled__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7C768 != -1)
    dispatch_once(&qword_1ECD7C768, block);
  return byte_1ECD7C725;
}

+ (BOOL)isShowingEmojiSearch
{
  void *v2;
  char v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showingEmojiSearch");

  return v3;
}

void __35__UIKeyboard_supportsAutoFillPanel__block_invoke()
{
  char v0;
  void *v1;
  uint64_t v2;
  char v3;

  if ((_os_feature_enabled_impl() & 1) != 0)
    v0 = 1;
  else
    v0 = _os_feature_enabled_impl();
  byte_1ECD7C72B = v0;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userInterfaceIdiom");

  if (v2 == 1)
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
      v3 = 1;
    else
      v3 = _os_feature_enabled_impl();
    byte_1ECD7C72B = v3;
  }
}

+ (BOOL)isLanguageIndicatorEnabled
{
  void *v2;
  char v3;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyboardLanguageIndicatorEnabled");

  return v3;
}

+ (CGSize)sizeForInterfaceOrientation:(int64_t)a3 includingAssistantBar:(BOOL)a4 ignoreInputView:(BOOL)a5
{
  _BOOL4 v5;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
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
  double v27;
  void *v28;
  void *v29;
  void *v30;
  UISystemInputAssistantViewController *v31;
  UISystemInputAssistantViewController *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  CGSize result;

  v5 = a4;
  +[UIKeyboardImpl sizeForInterfaceOrientation:ignoreInputView:](UIKeyboardImpl, "sizeForInterfaceOrientation:ignoreInputView:", a3, a5);
  v8 = v7;
  v10 = v9;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentInputMode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardImpl deviceSpecificPaddingForInterfaceOrientation:inputMode:](UIKeyboardImpl, "deviceSpecificPaddingForInterfaceOrientation:inputMode:", a3, v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  +[UIKeyboardImpl deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:](UIKeyboardImpl, "deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:", a3, v12);
  v22 = v21;
  v24 = v23;
  v27 = v10 + v14 - v25 + v18 - v26;
  if (v5)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "systemInputAssistantViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
      v31 = v29;
    else
      v31 = objc_alloc_init(UISystemInputAssistantViewController);
    v32 = v31;

    -[UIViewController traitCollection](v32, "traitCollection");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
    {
      v35 = v33;
    }
    else
    {
      objc_msgSend(v28, "containerWindow");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "traitCollection");
      v35 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[UISystemInputAssistantViewController preferredHeightForTraitCollection:orientation:](v32, "preferredHeightForTraitCollection:orientation:", v35, a3);
    v27 = v27 + v37;

  }
  v38 = v8 + v16 - v22 + v20 - v24;
  v39 = v27;
  result.height = v39;
  result.width = v38;
  return result;
}

+ (unint64_t)serviceRole
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__UIKeyboard_OutOfProcessSupport__serviceRole__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7C7B8 != -1)
    dispatch_once(&qword_1ECD7C7B8, block);
  return qword_1ECD7C7C0;
}

void __24__UIKeyboard_inputUIOOP__block_invoke()
{
  uint64_t v0;
  int v1;
  int v2;
  void *v3;
  id v4;

  v0 = _UIDeviceNativeUserInterfaceIdiomIgnoringClassic();
  v1 = _os_feature_enabled_impl();
  if (v0 == 1)
    v1 = _os_feature_enabled_impl();
  v2 = v1;
  if (_os_feature_enabled_impl() && v2)
  {
    if (qword_1ECD7C7E8 != -1)
      dispatch_once(&qword_1ECD7C7E8, &__block_literal_global_1364);
    objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForPreferenceKey:", CFSTR("KeyboardOOP"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

    _MergedGlobals_31_0 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    _MergedGlobals_31_0 = 0;
  }
}

- (void)_didChangeKeyplaneWithContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v4 = a3;
  -[UIKeyboard updateKeyFocusGuides](self, "updateKeyFocusGuides");
  -[UIKeyboard _toggleMenuGestureRecognizer:](self, "_toggleMenuGestureRecognizer:", (-[UIKeyboard cursorLocation](self, "cursorLocation") >> 7) & 1 | -[UIKeyboard _isDictationCurrentView](self, "_isDictationCurrentView"));
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "automaticAppearanceEnabled");

  if (v6)
  {
    if (objc_msgSend(v4, "sizeDidChange"))
    {
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "preferencesActions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "currentInputModeSupportsCrescendo") & 1) != 0)
      {

      }
      else
      {
        v9 = +[UIKeyboard resizable](UIKeyboard, "resizable");

        if (!v9)
        {
          -[UIView frame](self, "frame");
          v11 = v10;
          objc_msgSend(v4, "size");
          v13 = v12;
          objc_msgSend(v4, "size");
          -[UIKeyboard setFrame:](self, "setFrame:", 0.0, v11, v13, v14);
          goto LABEL_8;
        }
      }
      -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    }
LABEL_8:
    v15.receiver = self;
    v15.super_class = (Class)UIKeyboard;
    -[UIView _didChangeKeyplaneWithContext:](&v15, sel__didChangeKeyplaneWithContext_, v4);
  }

}

- (CGSize)intrinsicContentSize
{
  BOOL v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = +[UIKeyboard resizable](UIKeyboard, "resizable");
  v4 = -1.0;
  v5 = -1.0;
  if (!v3)
  {
    -[UIView bounds](self, "bounds", -1.0, -1.0);
    v4 = v6;
    v5 = v7;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

+ (BOOL)resizable
{
  return __resizable;
}

- (void)updateKeyFocusGuides
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary count](self->m_focusGuides, "count"))
  {
    v3 = -[UIKeyboard cursorLocation](self, "cursorLocation");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[UIView layoutGuides](self, "layoutGuides", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (-[UIView isFocused](self, "isFocused"))
              v10 = -[UIKeyboard allowExternalChangeForFocusHeading:cursorLocation:](self, "allowExternalChangeForFocusHeading:cursorLocation:", objc_msgSend(v9, "focusHeading"), v3) ^ 1;
            else
              v10 = 0;
            objc_msgSend(v9, "setEnabled:", v10);
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  void *v11;
  void *v12;
  _BOOL4 v13;
  double v14;
  double v15;
  objc_super v16;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  if (v9 == width && v8 == height)
    goto LABEL_8;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferencesActions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "currentInputModeSupportsCrescendo"))
  {

LABEL_8:
    v17.receiver = self;
    v17.super_class = (Class)UIKeyboard;
    -[UIView setFrame:](&v17, sel_setFrame_, x, y, width, height);
    return;
  }
  v13 = +[UIKeyboard resizable](UIKeyboard, "resizable");

  if (v13)
    goto LABEL_8;
  -[UIKeyboard autoAdjustOrientation](self, "autoAdjustOrientation");
  self->m_hasExplicitOrientation = 0;
  +[UIKeyboardImpl sizeForInterfaceOrientation:ignoreInputView:](UIKeyboardImpl, "sizeForInterfaceOrientation:ignoreInputView:", self->m_orientation, 1);
  v16.receiver = self;
  v16.super_class = (Class)UIKeyboard;
  -[UIView setFrame:](&v16, sel_setFrame_, x, y, v14, v15);
  if (!self->m_respondingToImplGeometryChange
    && (-[UIKeyboard isAutomatic](self, "isAutomatic")
     || (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1
     || objc_msgSend((id)UIApp, "_isSpringBoard")))
  {
    -[UIKeyboard activate](self, "activate");
  }
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (unint64_t)cursorLocation
{
  void *v2;
  void *v3;
  unint64_t v4;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cursorLocation");

  return v4;
}

- (void)_toggleMenuGestureRecognizer:(BOOL)a3
{
  _BOOL8 v3;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *menuGestureRecognizer;

  v3 = a3;
  if (a3 && !self->_menuGestureRecognizer)
  {
    v5 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, 0);
    menuGestureRecognizer = self->_menuGestureRecognizer;
    self->_menuGestureRecognizer = v5;

    -[UITapGestureRecognizer setAllowedPressTypes:](self->_menuGestureRecognizer, "setAllowedPressTypes:", &unk_1E1A941C0);
    -[UIGestureRecognizer setDelegate:](self->_menuGestureRecognizer, "setDelegate:", self);
    -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_menuGestureRecognizer);
  }
  -[UIGestureRecognizer setEnabled:](self->_menuGestureRecognizer, "setEnabled:", v3);
}

- (BOOL)_isDictationCurrentView
{
  void *v2;
  void *v3;
  uint64_t v4;
  BOOL v5;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_getCurrentKeyplaneName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rangeOfString:", CFSTR("Dictation"));
  v5 = v4 != 0;

  return v5;
}

+ (BOOL)isOnScreen
{
  int v2;
  uint64_t state64;

  v2 = isOnScreen_token;
  if (!isOnScreen_token)
  {
    notify_register_check("com.apple.keyboard.isOnScreen", &isOnScreen_token);
    v2 = isOnScreen_token;
  }
  state64 = 0;
  notify_get_state(v2, &state64);
  return state64 & 1;
}

uint64_t __46__UIKeyboard_OutOfProcessSupport__serviceRole__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "usesInputSystemUI");
  if ((result & 1) != 0
    || (result = objc_msgSend(*(id *)(a1 + 32), "usesInputSystemUIForAutoFillOnlyWithRTI"), (_DWORD)result))
  {
    qword_1ECD7C7C0 = 1;
  }
  return result;
}

+ (BOOL)usesInputSystemUIForAutoFillOnlyWithRTI
{
  int v2;

  v2 = objc_msgSend(a1, "usesInputSystemUIForAutoFillOnly");
  if (v2)
    LOBYTE(v2) = _os_feature_enabled_impl();
  return v2;
}

+ (BOOL)usesInputSystemUIForAutoFillOnly
{
  if ((objc_msgSend(a1, "isKeyboardProcess") & 1) != 0 || (objc_msgSend(a1, "inputUIOOP") & 1) != 0)
    return 0;
  else
    return objc_msgSend(a1, "supportsAutoFillPanel");
}

+ (BOOL)usingEndInputSessionCompletion
{
  if (qword_1ECD7C750 != -1)
    dispatch_once(&qword_1ECD7C750, &__block_literal_global_947);
  return byte_1ECD7C722;
}

+ (BOOL)shouldExtendKeyboardInputUI
{
  void *v3;
  void *v4;
  int v5;

  if (TIGetExtendInputUIValue_onceToken != -1)
    dispatch_once(&TIGetExtendInputUIValue_onceToken, &__block_literal_global_1374);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForPreferenceKey:", CFSTR("ExtendInputUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "BOOLValue"))
    v5 = objc_msgSend(a1, "isSpotlight") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

+ (BOOL)useAutoFillUIRTIInterfaceForIphone
{
  return _os_feature_enabled_impl();
}

uint64_t __45__UIKeyboard_isInlineTextCompletionUIEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isInlineTextCompletionUISupported");
  if ((_DWORD)result)
    result = _os_feature_enabled_impl();
  byte_1ECD7C725 = result;
  return result;
}

+ (BOOL)isInlineTextCompletionUISupported
{
  return 1;
}

uint64_t __28__UIKeyboard_isMajelEnabled__block_invoke()
{
  uint64_t result;

  result = +[UIKeyboard isMajelSupported](UIKeyboard, "isMajelSupported");
  if ((_DWORD)result)
    result = _os_feature_enabled_impl();
  byte_1ECD7C723 = result;
  return result;
}

+ (BOOL)isMajelSupported
{
  if (qword_1ECD7C760 != -1)
    dispatch_once(&qword_1ECD7C760, &__block_literal_global_964);
  return byte_1ECD7C724;
}

- (void)clearActivePerScreenIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  if (-[UIKeyboard isActivePerScreen](self, "isActivePerScreen"))
  {
    v3 = (void *)objc_opt_class();
    -[UIKeyboard window](self, "window");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearActiveForScreen:", v4);

  }
}

- (BOOL)isActivePerScreen
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[UIKeyboard window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeKeyboardForScreen:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v6 != 0;

  return (char)v3;
}

uint64_t __54__UIKeyboard_presentsInlineTextCompletionAsMarkedText__block_invoke(uint64_t a1)
{
  uint64_t result;
  char v2;

  result = objc_msgSend(*(id *)(a1 + 32), "isInlineTextCompletionUIEnabled");
  if ((_DWORD)result)
  {
    result = _os_feature_enabled_impl();
    v2 = result ^ 1;
  }
  else
  {
    v2 = 0;
  }
  byte_1ECD7C726 = v2;
  return result;
}

+ (BOOL)isInlineDictationGlowEffectEnabled
{
  void *v2;
  char v3;

  if (!objc_msgSend(a1, "isRedesignedTextCursorEnabled") || !_os_feature_enabled_impl())
    return 0;
  +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "glowEffectEnabled");

  return v3;
}

- (void)didMoveToWindow
{
  UIKeyboard *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (UIKeyboard *)activeKeyboard;
  -[UIKeyboard window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    self->m_hasExplicitOrientation = 0;
    if (v3 != self)
      goto LABEL_14;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "clearExcessKeyboardMemory");

    goto LABEL_12;
  }
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderFront:", 0);

  -[UIView subviews](self, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((v9 & 1) == 0)
    -[UIKeyboard activate](self, "activate");
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    && !+[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton")
    && self->m_minimized)
  {
    +[UIKeyboardImpl additionalInstanceHeight](UIKeyboardImpl, "additionalInstanceHeight");
    v11 = v10;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_layout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrameOrigin:", 0.0, v11);

  }
  if (v3 == self)
  {
LABEL_12:
    -[UIKeyboard window](self, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)objc_opt_class();
      -[UIKeyboard window](self, "window");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "screen");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "makeKeyboardActive:forScreen:", self, v18);

    }
  }
LABEL_14:
  -[UIKeyboard setupKeyFocusGuides](self, "setupKeyFocusGuides");
}

+ (void)makeKeyboardActive:(id)a3 forScreen:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  if (v5)
  {
    v6 = (id)activeKeyboardsPerScreen;
    objc_sync_enter(v6);
    v7 = (void *)activeKeyboardsPerScreen;
    if (!activeKeyboardsPerScreen)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = (void *)activeKeyboardsPerScreen;
      activeKeyboardsPerScreen = (uint64_t)v8;

      v7 = (void *)activeKeyboardsPerScreen;
    }
    objc_msgSend(v5, "_name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v11, v10);

    objc_sync_exit(v6);
  }

}

void __30__UIKeyboard_isMajelSupported__block_invoke()
{
  void *v0;
  id v1;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "userInterfaceIdiom"))
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    byte_1ECD7C724 = objc_msgSend(v0, "userInterfaceIdiom") == 1;

  }
  else
  {
    byte_1ECD7C724 = 1;
  }

}

void __48__UIKeyboard_isAlwaysAllowedAutoFillPanelClient__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.quicklook"), CFSTR("com.apple.quicklook.extension.previewUI"), CFSTR("com.apple.quicklook.UIExtension"), CFSTR("com.apple.mobilenotes"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "keyboardBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  byte_1ECD7C72D = objc_msgSend(v3, "containsObject:", v2);

}

- (void)syncMinimizedStateToHardwareKeyboardAttachedState
{
  char v3;
  id v4;

  if (-[UIKeyboard isAutomatic](self, "isAutomatic"))
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "_shouldMinimizeForHardwareKeyboard") & 1) != 0)
      v3 = 1;
    else
      v3 = objc_msgSend(v4, "_shouldSuppressSoftwareKeyboard");
    self->m_minimized = v3;
    objc_msgSend(v4, "notifyInputSourceStateChangeIfNeeded");

  }
}

- (void)displayLayer:(id)a3
{
  void *v4;

  if ((UIKeyboard *)activeKeyboard == self)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

    }
    else if (objc_msgSend((id)UIApp, "applicationState") != 2)
    {
      -[UIKeyboard activate](self, "activate");
    }
  }
}

void __44__UIKeyboard_usingEndInputSessionCompletion__block_invoke()
{
  Class v0;
  int v1;
  NSObject *v2;
  const char *v3;
  void *v4;
  char v5;
  int v6;
  NSObject *v7;
  char v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v0 = NSClassFromString(CFSTR("RTIInputSystemClient"));
  v1 = -[objc_class instancesRespondToSelector:](v0, "instancesRespondToSelector:", sel_endRemoteTextInputSessionWithID_options_completion_);
  if (v1)
  {
    v1 = -[objc_class instancesRespondToSelector:](v0, "instancesRespondToSelector:", sel_endAllowingRemoteTextInput_completion_);
    if (v1)
    {
      v1 = -[objc_class instancesRespondToSelector:](v0, "instancesRespondToSelector:", sel_setEnvironmentOptions_withReason_completion_);
      if (v1)
      {
        v1 = +[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP");
        if (v1)
          LOBYTE(v1) = _os_feature_enabled_impl();
      }
    }
  }
  byte_1ECD7C722 = v1;
  if (os_variant_has_internal_diagnostics())
  {
    TIGetKeyboardOOPUsingEndInputSessionCompletionValue();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    v6 = byte_1ECD7C722;
    if (byte_1ECD7C722 && (v5 & 1) == 0)
    {
      _UIKeyboardInputSessionChangeLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "endInputSession completion is available for this configuration, but is disabled by defaults override", (uint8_t *)&v9, 2u);
      }

      v6 = byte_1ECD7C722;
    }
    if (v6)
      v8 = v5;
    else
      v8 = 0;
    byte_1ECD7C722 = v8;
  }
  _UIKeyboardInputSessionChangeLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_1ECD7C722)
      v3 = "enabled";
    else
      v3 = "disabled";
    v9 = 136315138;
    v10 = v3;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "endInputSession completion is %s", (uint8_t *)&v9, 0xCu);
  }

}

+ (void)clearActiveForScreen:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = (id)activeKeyboardsPerScreen;
  objc_sync_enter(v3);
  v4 = (void *)activeKeyboardsPerScreen;
  objc_msgSend(v6, "_name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v5);

  objc_sync_exit(v3);
}

- (UIKeyboard)initWithDefaultSize
{
  double v3;
  double v4;
  double v5;
  double v6;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  +[UIKeyboard defaultSizeForInterfaceOrientation:](UIKeyboard, "defaultSizeForInterfaceOrientation:", 1);
  return -[UIKeyboard initWithFrame:](self, "initWithFrame:", v3, v4, v5, v6);
}

- (UIKeyboard)initWithRequestedInteractionModel:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIKeyboard *result;

  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  +[UIKeyboard defaultSizeForInterfaceOrientation:](UIKeyboard, "defaultSizeForInterfaceOrientation:", 1);
  result = -[UIKeyboard _initWithFrame:lazily:](self, "_initWithFrame:lazily:", 0, v5, v6, v7, v8);
  if (result)
    result->_requestedInteractionModel = a3;
  return result;
}

- (id)initLazily
{
  return -[UIKeyboard _initWithFrame:lazily:](self, "_initWithFrame:lazily:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if ((UIKeyboard *)activeKeyboard == self)
  {
    activeKeyboard = 0;

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setGeometryDelegate:", 0);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRequestedInteractionModel:", 0);

  }
  -[UIKeyboard clearActivePerScreenIfNeeded](self, "clearActivePerScreenIfNeeded");
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboard;
  -[UIView dealloc](&v5, sel_dealloc);
}

+ (void)_clearActiveKeyboard
{
  void *v2;

  v2 = (void *)activeKeyboard;
  activeKeyboard = 0;

}

+ (UIEdgeInsets)_keyboardFocusGuideMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -60.0;
  v3 = -60.0;
  v4 = -60.0;
  v5 = -60.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (void)initImplementationNow
{
  id v2;

  v2 = +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
}

+ (void)removeAllDynamicDictionaries
{
  id v2;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllDynamicDictionaries");

}

+ (CGSize)defaultSize
{
  double v2;
  double v3;
  CGSize result;

  +[UIKeyboardImpl defaultSizeForInterfaceOrientation:](UIKeyboardImpl, "defaultSizeForInterfaceOrientation:", 1);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)defaultSizeForInterfaceOrientation:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  +[UIKeyboardImpl defaultSizeForInterfaceOrientation:](UIKeyboardImpl, "defaultSizeForInterfaceOrientation:", a3);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGRect)defaultFrameForInterfaceOrientation:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
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
  CGRect result;

  +[UIKeyboard defaultSizeForInterfaceOrientation:](UIKeyboard, "defaultSizeForInterfaceOrientation:");
  v5 = v4;
  v7 = v6;
  v8 = _UIAppUseModernRotationAndPresentationBehaviors();
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "_boundsForInterfaceOrientation:", a3);
    v12 = v11;

    v13 = v12 - v7;
    v14 = 0.0;
LABEL_3:
    v15 = v5;
    v5 = v7;
  }
  else
  {
    objc_msgSend(v9, "bounds");
    v18 = v17;
    v20 = v19;

    v13 = 0.0;
    v14 = 0.0;
    v15 = v7;
    switch(a3)
    {
      case 1:
        v13 = v20 - v7;
        goto LABEL_3;
      case 2:
        goto LABEL_3;
      case 3:
        break;
      case 4:
        v14 = v18 - v7;
        v15 = v7;
        break;
      default:
        v14 = *MEMORY[0x1E0C9D648];
        v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
        break;
    }
  }
  v16 = v5;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v13;
  result.origin.x = v14;
  return result;
}

+ (BOOL)respondsToProxGesture
{
  int v2;
  uint64_t state64;

  v2 = respondsToProxGesture_token;
  if (!respondsToProxGesture_token)
  {
    notify_register_check("com.apple.keyboard.proxGestureEnabled", &respondsToProxGesture_token);
    v2 = respondsToProxGesture_token;
  }
  state64 = 0;
  notify_get_state(v2, &state64);
  return state64 & 1;
}

+ (BOOL)shouldMinimizeForHardwareKeyboard
{
  void *v2;
  void *v3;
  char v4;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_isHardwareKeyboardAvailable"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "automaticMinimizationEnabled");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)hasInputOrAssistantViewsOnScreen
{
  void *v2;
  void *v3;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerRootController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "hasInputOrAssistantViewsOnScreen");
  return (char)v2;
}

+ (void)setSuppressionPolicyDelegate:(id)a3
{
  objc_storeStrong((id *)&_suppressionPolicyDelegate, a3);
}

+ (BOOL)shouldSuppressSoftwareKeyboardForResponder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  if (!v3)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegateAsResponder");
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_shouldSuppressSoftwareKeyboardForResponder:ignoringPolicyDelegate:", v3, 0);

  return v6;
}

+ (CGSize)sizeForInterfaceOrientation:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(a1, "sizeForInterfaceOrientation:ignoreInputView:", a3, 0);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)sizeForInterfaceOrientation:(int64_t)a3 ignoreInputView:(BOOL)a4
{
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(a1, "sizeForInterfaceOrientation:ignoreInputView:inputDelegate:", a3, a4, 0);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)keyboardSizeForInterfaceOrientation:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  +[UIKeyboardImpl keyboardSizeForInterfaceOrientation:](UIKeyboardImpl, "keyboardSizeForInterfaceOrientation:", a3);
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)_isAutomaticKeyboard
{
  return 0;
}

- (void)updateLayout
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id v6;

  -[UIKeyboard activate](self, "activate");
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputMode");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isExtensionInputMode") & 1) == 0)
  {
    objc_msgSend(v6, "normalizedIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("emoji"));

    if ((v4 & 1) == 0)
    {
      +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "updateLayout");

    }
  }

}

- (void)setOrientation:(int64_t)a3
{
  self->m_orientation = a3;
  self->m_hasExplicitOrientation = 1;
}

+ (void)setResizable:(BOOL)a3
{
  __resizable = a3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  UIKeyboard *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v16;
  objc_super v17;
  objc_super v18;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (!self->m_typingDisabled
    || (v18.receiver = self,
        v18.super_class = (Class)UIKeyboard,
        !-[UIView pointInside:withEvent:](&v18, sel_pointInside_withEvent_, v7, x, y)))
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "candidateController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "candidateBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboard window](self, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == v13 && (objc_msgSend(v11, "isHidden") & 1) == 0)
    {
      v16 = -[UIKeyboard pointInside:forEvent:](self, "pointInside:forEvent:", objc_msgSend(v7, "_gsEvent"), x, y);

      if (!v16)
      {
        -[UIView convertPoint:toView:](self, "convertPoint:toView:", v11, x, y);
        objc_msgSend(v11, "hitTest:withEvent:", v7);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    else
    {

    }
    v17.receiver = self;
    v17.super_class = (Class)UIKeyboard;
    -[UIView hitTest:withEvent:](&v17, sel_hitTest_withEvent_, v7, x, y);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v8 = (UIKeyboard *)v14;

    goto LABEL_9;
  }
  v8 = self;
LABEL_9:

  return v8;
}

- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  double y;
  double x;
  void *v8;
  UIKeyboard *v9;
  char v10;

  y = a3.y;
  x = a3.x;
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v9 = (UIKeyboard *)objc_claimAutoreleasedReturnValue();
  if (v9 == self)
  {
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
    v10 = objc_msgSend(v8, "pointInside:forEvent:", a4);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 HasAlphaHittable;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (!-[UIKeyboard pointInside:forEvent:](self, "pointInside:forEvent:", objc_msgSend(v7, "_gsEvent"), x, y))
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "candidateController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "candidateBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboard window](self, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == v13 && (objc_msgSend(v11, "isHiddenOrHasHiddenAncestor") & 1) == 0)
    {
      HasAlphaHittable = -[UIView _isAlphaHittableAndHasAlphaHittableAncestors]((uint64_t)v11);

      if (HasAlphaHittable)
      {
        -[UIView convertPoint:toView:](self, "convertPoint:toView:", v11, x, y);
        v8 = objc_msgSend(v11, "pointInside:withEvent:", v7);
        goto LABEL_7;
      }
    }
    else
    {

    }
    v8 = 0;
LABEL_7:

    goto LABEL_8;
  }
  v8 = 1;
LABEL_8:

  return v8;
}

- (BOOL)_touchesInsideShouldHideCalloutBar
{
  return 0;
}

- (void)prepareForGeometryChange
{
  id v2;

  -[UIKeyboard activate](self, "activate");
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareForGeometryChange");

}

- (void)geometryChangeDone:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  if (a3)
    -[UIKeyboard activate](self, "activate");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "geometryChangeDone:", v3);

}

- (void)removeAutocorrectPrompt
{
  id v2;

  -[UIKeyboard activate](self, "activate");
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAutocorrectPromptAndCandidateList");

}

- (void)acceptAutocorrection
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  -[UIKeyboard activate](self, "activate");
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textInputTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyboardType");

  if (v3 == 126)
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopDictationIgnoreFinalizePhrases");

  }
  objc_msgSend(v5, "acceptAutocorrection");

}

- (void)acceptAutocorrectionWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIKeyboard activate](self, "activate");
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textInputTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "keyboardType");

  if (v7 == 126)
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopDictationIgnoreFinalizePhrases");

    +[UITextChecker performFinalGrammarChecking](UITextChecker, "performFinalGrammarChecking");
  }
  _UIKeyboardLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[UIKeyboard acceptAutocorrectionWithCompletionHandler:]";
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "%s Initiating accept autocorrection", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__UIKeyboard_acceptAutocorrectionWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E16B1BA0;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v5, "acceptAutocorrectionWithCompletionHandler:", v11);

}

uint64_t __56__UIKeyboard_acceptAutocorrectionWithCompletionHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    _UIKeyboardLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 136315138;
      v4 = "-[UIKeyboard acceptAutocorrectionWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "%s Completed accept autocorrection", (uint8_t *)&v3, 0xCu);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

- (BOOL)hasAutocorrectPrompt
{
  void *v2;
  void *v3;
  BOOL v4;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autocorrectPrompt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (UITextCursorAssertionController)_activeAssertionController
{
  void *v2;
  void *v3;

  -[UIKeyboard activate](self, "activate");
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_activeAssertionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextCursorAssertionController *)v3;
}

- (void)setCaretBlinks:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UIKeyboard activate](self, "activate");
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCaretBlinks:", v3);

}

- (BOOL)caretBlinks
{
  void *v2;
  char v3;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "caretBlinks");

  return v3;
}

- (void)setCaretVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UIKeyboard activate](self, "activate");
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCaretVisible:", v3);

}

- (BOOL)caretVisible
{
  void *v2;
  char v3;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "caretVisible");

  return v3;
}

- (BOOL)returnKeyEnabled
{
  void *v2;
  char v3;

  -[UIKeyboard activateIfNeeded](self, "activateIfNeeded");
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "returnKeyEnabled");

  return v3;
}

- (void)setReturnKeyEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UIKeyboard activateIfNeeded](self, "activateIfNeeded");
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnKeyEnabled:", v3);

}

- (id)defaultTextInputTraits
{
  UITextInputTraits *m_defaultTraits;
  UITextInputTraits *v4;
  UITextInputTraits *v5;

  -[UIKeyboard activate](self, "activate");
  m_defaultTraits = self->m_defaultTraits;
  if (!m_defaultTraits)
  {
    v4 = objc_alloc_init(UITextInputTraits);
    v5 = self->m_defaultTraits;
    self->m_defaultTraits = v4;

    m_defaultTraits = self->m_defaultTraits;
  }
  return m_defaultTraits;
}

- (void)setDefaultTextInputTraits:(id)a3
{
  UITextInputTraits *v4;
  UITextInputTraits *m_defaultTraits;
  UITextInputTraits *v6;
  id v7;

  v4 = (UITextInputTraits *)a3;
  -[UIKeyboard activate](self, "activate");
  m_defaultTraits = self->m_defaultTraits;
  self->m_defaultTraits = v4;
  v6 = v4;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultTextInputTraits:", self->m_defaultTraits);

}

- (id)_overrideTextInputTraits
{
  return self->m_overrideTraits;
}

- (void)set_overrideTextInputTraits:(id)a3
{
  UITextInputTraits **p_m_overrideTraits;
  void *v6;
  UITextInputTraits *v7;

  v7 = (UITextInputTraits *)a3;
  -[UIKeyboard activate](self, "activate");
  p_m_overrideTraits = &self->m_overrideTraits;
  if (*p_m_overrideTraits != v7)
  {
    objc_storeStrong((id *)p_m_overrideTraits, a3);
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOverrideTextInputTraits:", *p_m_overrideTraits);

  }
}

- (id)delegate
{
  void *v2;
  void *v3;

  -[UIKeyboard activate](self, "activate");
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)takeSnapshot
{
  UIView *v3;
  UIView *m_snapshot;
  id v5;

  if ((objc_msgSend((id)objc_opt_class(), "isSpotlight") & 1) == 0)
  {
    -[UIKeyboard clearSnapshot](self, "clearSnapshot");
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "snapshotViewAfterScreenUpdates:", 0);
    v3 = (UIView *)objc_claimAutoreleasedReturnValue();
    m_snapshot = self->m_snapshot;
    self->m_snapshot = v3;

    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->m_snapshot, 0);
    -[UIKeyboard setNeedsDisplay](self, "setNeedsDisplay");

  }
}

- (BOOL)typingEnabled
{
  return !self->m_typingDisabled;
}

- (void)setTypingEnabled:(BOOL)a3
{
  self->m_typingDisabled = !a3;
}

- (void)activateIfNeeded
{
  if ((UIKeyboard *)activeKeyboard != self)
    -[UIKeyboard activate](self, "activate");
}

- (BOOL)isAutomatic
{
  return 0;
}

- (void)deactivate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if ((UIKeyboard *)activeKeyboard == self)
  {
    -[UIView superview](self, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[UIKeyboard takeSnapshot](self, "takeSnapshot");
      -[UIKeyboard setNeedsDisplay](self, "setNeedsDisplay");
    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v6, "removeFromSuperview");
      objc_msgSend(v6, "setDefaultTextInputTraits:", 0);
      objc_msgSend(v6, "setOverrideTextInputTraits:", 0);
    }
    objc_msgSend(v6, "setGeometryDelegate:", 0);
    v5 = (void *)activeKeyboard;
    activeKeyboard = 0;

    -[UIKeyboard setupKeyFocusGuides](self, "setupKeyFocusGuides");
  }
}

- (void)_deactivateForBackgrounding
{
  void *v3;
  void *v4;
  id v5;

  if ((UIKeyboard *)activeKeyboard == self)
  {
    -[UIView superview](self, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[UIKeyboard takeSnapshot](self, "takeSnapshot");
      -[UIKeyboard setNeedsDisplay](self, "setNeedsDisplay");
    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      objc_msgSend(v5, "removeFromSuperview");

  }
}

- (int)textEffectsVisibilityLevel
{
  return 10;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v4;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateIdleDetection:", 0);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v4;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateIdleDetection:", 0);

}

- (BOOL)canHandleEvent:(id)a3
{
  return -[UIKeyboard canHandlePresses:withEvent:](self, "canHandlePresses:withEvent:", 0, a3);
}

- (BOOL)canHandlePresses:(id)a3 withEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "canHandlePresses:withEvent:", v6, v5);

  return v8;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (-[UIKeyboard canHandlePresses:withEvent:](self, "canHandlePresses:withEvent:", v6, v7))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pressesBegan:withEvent:", v6, v7);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIKeyboard;
    -[UIResponder pressesBegan:withEvent:](&v10, sel_pressesBegan_withEvent_, v6, v7);
  }

}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (-[UIKeyboard canHandlePresses:withEvent:](self, "canHandlePresses:withEvent:", v6, v7))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pressesChanged:withEvent:", v6, v7);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIKeyboard;
    -[UIResponder pressesChanged:withEvent:](&v10, sel_pressesChanged_withEvent_, v6, v7);
  }

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (-[UIKeyboard canHandlePresses:withEvent:](self, "canHandlePresses:withEvent:", v6, v7))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pressesEnded:withEvent:", v6, v7);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIKeyboard;
    -[UIResponder pressesEnded:withEvent:](&v10, sel_pressesEnded_withEvent_, v6, v7);
  }

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (-[UIKeyboard canHandlePresses:withEvent:](self, "canHandlePresses:withEvent:", v6, v7))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pressesCancelled:withEvent:", v6, v7);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIKeyboard;
    -[UIResponder pressesCancelled:withEvent:](&v10, sel_pressesCancelled_withEvent_, v6, v7);
  }

}

- (void)remoteControlReceivedWithEvent:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteControlReceivedWithEvent:", v3);

}

- (void)_wheelChangedWithEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (-[UIView isFocused](self, "isFocused"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_wheelChangedWithEvent:", v4);

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKeyboard;
    -[UIResponder _wheelChangedWithEvent:](&v6, sel__wheelChangedWithEvent_, v4);
  }

}

- (id)_systemDefaultFocusGroupIdentifier
{
  void *v3;
  __int16 v4;
  void *v5;
  objc_super v7;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "focusGroupContainmentBehavior");

  if ((v4 & 0x100) != 0)
  {
    _UIFocusGroupIdentifierForInstance(self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKeyboard;
    -[UIView _systemDefaultFocusGroupIdentifier](&v7, sel__systemDefaultFocusGroupIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int64_t)_focusTouchSensitivityStyle
{
  return 2;
}

- (int64_t)_rotaryFocusMovementAxis
{
  return 3;
}

- (int64_t)_focusedSound
{
  return 4;
}

- (void)setImpendingCursorLocation:(unint64_t)a3
{
  self->_impendingCursorLocation = a3;
  -[UIKeyboard setHasImpendingCursorLocation:](self, "setHasImpendingCursorLocation:", 1);
}

- (CGRect)_focusCastingFrameForHeading:(unint64_t)a3 inCoordinateSpace:(id)a4
{
  id v4;
  void *v5;
  void *v6;
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
  CGRect result;

  v4 = a4;
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "state") != 16)
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    objc_msgSend(v11, "convertRect:toCoordinateSpace:", v4);
    v7 = v12;
    v8 = v13;
    v9 = v14;
    v10 = v15;

  }
  else
  {
    v7 = *MEMORY[0x1E0C9D628];
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v16 = v7;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKeyboard;
  -[UIView didUpdateFocusInContext:withAnimationCoordinator:](&v8, sel_didUpdateFocusInContext_withAnimationCoordinator_, a3, a4);
  if (-[UIKeyboard hasImpendingCursorLocation](self, "hasImpendingCursorLocation"))
  {
    -[UIKeyboard setCursorLocation:](self, "setCursorLocation:", -[UIKeyboard impendingCursorLocation](self, "impendingCursorLocation"));
    -[UIKeyboard setHasImpendingCursorLocation:](self, "setHasImpendingCursorLocation:", 0);
LABEL_7:
    -[UIKeyboard updateFocusMarginsUpToView:](self, "updateFocusMarginsUpToView:", 0);
    goto LABEL_8;
  }
  if (!-[UIView isFocused](self, "isFocused") && -[UIKeyboard cursorLocation](self, "cursorLocation"))
  {
    -[UIKeyboard updateFocusMarginsUpToView:](self, "updateFocusMarginsUpToView:", 0);
    v5 = 0;
LABEL_12:
    -[UIKeyboard setCursorLocation:](self, "setCursorLocation:", v5);
    goto LABEL_13;
  }
  if (-[UIView isFocused](self, "isFocused"))
    goto LABEL_7;
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  -[UIKeyboard updateFocusMarginsUpToView:](self, "updateFocusMarginsUpToView:", 0);
  v5 = 0;
  if (v7 == 3)
    goto LABEL_12;
LABEL_8:
  if (-[UIView isFocused](self, "isFocused") && !-[UIKeyboard cursorLocation](self, "cursorLocation"))
  {
    v5 = 2;
    goto LABEL_12;
  }
LABEL_13:
  if (-[UIView isFocused](self, "isFocused") && -[UIKeyboard disableInteraction](self, "disableInteraction"))
    -[UIKeyboard setDisableInteraction:](self, "setDisableInteraction:", 0);
  -[UIKeyboard updateKeyFocusGuides](self, "updateKeyFocusGuides");
}

- (BOOL)allowExternalChangeForFocusHeading:(unint64_t)a3 cursorLocation:(unint64_t)a4
{
  char v4;
  int64x2_t v5;
  int8x16_t v6;

  if (a3 == 1 && (a4 & 8) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = vdupq_n_s64(a3);
    v6 = (int8x16_t)vdupq_n_s64(a4);
    v4 = vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vbicq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v5, (int64x2_t)xmmword_186679FB0), (int32x4_t)vceqq_s64(v5, (int64x2_t)xmmword_186681260)), (int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v6, (int8x16_t)xmmword_186681270)), (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v6, (int8x16_t)xmmword_186681280)))))) | (a3 == 32) & a4;
  }
  return v4 & 1;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4;
  UIKeyboard *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  char v9;
  _BOOL4 v10;
  _BOOL4 v11;
  BOOL v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  UIKeyboard *v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(v4, "nextFocusedItem");
  v5 = (UIKeyboard *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "focusHeading");

  if (!-[UIView isFocused](self, "isFocused") || !-[UIKeyboard canBecomeFocused](self, "canBecomeFocused"))
  {
    if (v5 == self)
    {
      v16 = self;
      v17 = 2;
      goto LABEL_20;
    }
LABEL_18:
    v16 = self;
    v17 = 0;
LABEL_20:
    -[UIKeyboard setImpendingCursorLocation:](v16, "setImpendingCursorLocation:", v17);
LABEL_21:
    v8 = 1;
    goto LABEL_22;
  }
  v7 = -[UIKeyboard cursorLocation](self, "cursorLocation");
  v8 = v5 == self;
  if (!v7)
  {
    if (v5 == self)
    {
      v8 = 1;
      -[UIKeyboard setImpendingCursorLocation:](self, "setImpendingCursorLocation:", 1);
      goto LABEL_22;
    }
    goto LABEL_24;
  }
  v9 = v7;
  v10 = -[UIKeyboard allowExternalChangeForFocusHeading:cursorLocation:](self, "allowExternalChangeForFocusHeading:cursorLocation:", v6, v7);
  v11 = (v9 & 0x80) == 0 && v10;
  v12 = v5 == self && v10;
  v13 = v5 != self && v11;
  -[UIView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "userInterfaceIdiom");

  if (v15 == 3)
  {
    if ((v9 & 0x20) != 0 && v6 == 4 || (v9 & 0x40) != 0 && v6 == 8)
    {
      v8 = 0;
      goto LABEL_22;
    }
    if (!v13)
    {
      -[UIKeyboard setHasImpendingCursorLocation:](self, "setHasImpendingCursorLocation:", 0);
      goto LABEL_22;
    }
    goto LABEL_18;
  }
  if (v15 != 2)
  {
LABEL_24:
    -[UIKeyboard setHasImpendingCursorLocation:](self, "setHasImpendingCursorLocation:", 0);
    goto LABEL_21;
  }
  if (v13)
    -[UIKeyboard setImpendingCursorLocation:](self, "setImpendingCursorLocation:", 0);
  else
    -[UIKeyboard setHasImpendingCursorLocation:](self, "setHasImpendingCursorLocation:", 0);
  v8 = !v12;
LABEL_22:

  return v8;
}

- (void)setCursorLocation:(unint64_t)a3
{
  void *v4;
  id v5;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCursorLocation:", a3);

}

- (void)didFocusGuideWithHeading:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = -[UIEvent _init]([UIMoveEvent alloc], "_init");
  objc_msgSend(v9, "_setFocusHeading:", a3);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_moveWithEvent:", v9);

  -[UIKeyboard updateKeyFocusGuides](self, "updateKeyFocusGuides");
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == 2)
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateHelperMessageDisplayIfNeeded");

  }
}

- (UIEdgeInsets)unfocusedFocusGuideOutsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->m_unfocusedFocusGuideOutsets.top;
  left = self->m_unfocusedFocusGuideOutsets.left;
  bottom = self->m_unfocusedFocusGuideOutsets.bottom;
  right = self->m_unfocusedFocusGuideOutsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setUnfocusedFocusGuideOutsets:(UIEdgeInsets)a3
{
  -[UIKeyboard setUnfocusedFocusGuideOutsets:fromView:](self, "setUnfocusedFocusGuideOutsets:fromView:", 0, a3.top, a3.left, a3.bottom, a3.right);
}

- (void)setUnfocusedFocusGuideOutsets:(UIEdgeInsets)a3 fromView:(id)a4
{
  self->m_unfocusedFocusGuideOutsets = a3;
  -[UIKeyboard updateFocusMarginsUpToView:](self, "updateFocusMarginsUpToView:", a4);
}

- (void)updateFocusMarginsUpToView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIKeyboard *v16;
  UIKeyboard *v17;
  UIKeyboard *v18;
  id v19;

  v19 = a3;
  -[UIKeyboard unfocusedFocusGuideOutsets](self, "unfocusedFocusGuideOutsets");
  if (v7 != 0.0 || v4 != 0.0 || v6 != 0.0 || v5 != 0.0)
  {
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    if (!-[UIView isFocused](self, "isFocused"))
    {
      -[UIKeyboard unfocusedFocusGuideOutsets](self, "unfocusedFocusGuideOutsets");
      v11 = v12;
      v10 = v13;
      v9 = v14;
      v8 = v15;
    }
    v16 = self;
    objc_msgSend(v19, "superview");
    v17 = (UIKeyboard *)objc_claimAutoreleasedReturnValue();
    do
    {
      v18 = v16;
      -[UIView _setFocusableContentMargins:](v16, "_setFocusableContentMargins:", v11, v10, v9, v8);
      -[UIView superview](v16, "superview");
      v16 = (UIKeyboard *)objc_claimAutoreleasedReturnValue();

    }
    while (v16 && v17 && v16 != v17);

  }
}

- (BOOL)disableInteraction
{
  void *v2;
  void *v3;
  char v4;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disableInteraction");

  return v4;
}

- (void)setDisableInteraction:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisableInteraction:", v3);

}

- (void)_setPreferredHeight:(double)a3
{
  void *v4;
  id v5;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferredHeight:", a3);

}

- (BOOL)showPredictionBar
{
  void *v2;
  char v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPredictionViewControllerVisible");

  return v3;
}

- (void)_showAutofillExtras
{
  UIKeyboard *v3;
  id v4;

  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v3 = (UIKeyboard *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_showAutofillExtras");

  }
}

- (void)setShouldUpdateLayoutAutomatically:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_shouldUpdateLayoutAutomatically = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldUpdateLayoutAutomatically:", v3);

}

+ (void)clearLastKeyboardApplicationIdentifier
{
  void *v2;

  v2 = (void *)qword_1ECD7C738;
  qword_1ECD7C738 = 0;

  dword_1ECD7C730 = 0;
}

+ (id)keyboardApplicationIdentifier
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;

  if ((objc_msgSend(a1, "isKeyboardProcess") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIKeyboard.m"), 1686, CFSTR("keyboardApplicationIdentifier can only be called from keyboard process"));

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputSystemSourceSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appId");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
    goto LABEL_7;
  objc_msgSend(v6, "bundleId");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = (void *)qword_1ECD7C738;
  if (v8)
    v10 = (void *)v8;
  v7 = v10;

  if (v7)
LABEL_7:
    objc_storeStrong((id *)&qword_1ECD7C738, v7);

  return v7;
}

+ (int)keyboardProcessId
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v10;

  if ((objc_msgSend(a1, "isKeyboardProcess") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIKeyboard.m"), 1698, CFSTR("keyboardProcessId can only be called from keyboard process"));

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputSystemSourceSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "processId");
  if (v7)
    v8 = v7;
  else
    v8 = dword_1ECD7C730;
  if (v8)
    dword_1ECD7C730 = v8;

  return v8;
}

+ (id)currentDocumentState
{
  void *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "isKeyboardProcess"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "inputSystemSourceSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "documentState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (BOOL)doesSpacebarAcceptInlineTextCompletion
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__UIKeyboard_doesSpacebarAcceptInlineTextCompletion__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7C778 != -1)
    dispatch_once(&qword_1ECD7C778, block);
  return byte_1ECD7C727;
}

uint64_t __52__UIKeyboard_doesSpacebarAcceptInlineTextCompletion__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isInlineTextCompletionUIEnabled");
  if ((_DWORD)result)
    result = _os_feature_enabled_impl();
  byte_1ECD7C727 = result;
  return result;
}

+ (BOOL)isInlineTextCompletionEducationUIEnabled
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__UIKeyboard_isInlineTextCompletionEducationUIEnabled__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7C780 != -1)
    dispatch_once(&qword_1ECD7C780, block);
  return byte_1ECD7C728;
}

uint64_t __54__UIKeyboard_isInlineTextCompletionEducationUIEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isInlineTextCompletionUIEnabled");
  if ((_DWORD)result)
    result = _os_feature_enabled_impl();
  byte_1ECD7C728 = result;
  return result;
}

+ (BOOL)doesSpacebarAcceptFullInlineTextCompletion
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__UIKeyboard_doesSpacebarAcceptFullInlineTextCompletion__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7C788 != -1)
    dispatch_once(&qword_1ECD7C788, block);
  return byte_1ECD7C729;
}

uint64_t __56__UIKeyboard_doesSpacebarAcceptFullInlineTextCompletion__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "doesSpacebarAcceptInlineTextCompletion");
  if ((_DWORD)result)
    result = _os_feature_enabled_impl();
  byte_1ECD7C729 = result;
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  unint64_t v5;

  if (self->_menuGestureRecognizer != a3)
    return 1;
  v5 = (-[UIKeyboard cursorLocation](self, "cursorLocation") >> 7) & 1;
  return v5 | -[UIKeyboard _isDictationCurrentView](self, "_isDictationCurrentView");
}

- (BOOL)shouldSaveMinimizationState
{
  return 1;
}

- (UIPeripheralAnimationGeometry)geometryForMinimize:(SEL)a3
{
  _BOOL4 v4;
  CGPoint *p_inPosition;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  unint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIPeripheralAnimationGeometry *result;
  double v21;
  float v22;
  float v23;
  CGFloat v24;
  CGPoint v25;
  uint64_t v26;
  __int128 v27;

  v4 = a4;
  retstr->targetFrameHeightDelta = 0.0;
  *(_OWORD *)&retstr->transform.c = 0u;
  *(_OWORD *)&retstr->transform.tx = 0u;
  retstr->bounds.size = 0u;
  *(_OWORD *)&retstr->transform.a = 0u;
  retstr->bounds.origin = 0u;
  retstr->outPosition = 0u;
  retstr->inPosition = 0u;
  p_inPosition = &retstr->inPosition;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  retstr->bounds.origin.x = v12;
  retstr->bounds.origin.y = v13;
  retstr->bounds.size.width = v8;
  retstr->bounds.size.height = v10;
  v14 = -[UIView _keyboardOrientation](self, "_keyboardOrientation") - 3;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;

  if (v14 >= 2)
    v21 = v19;
  else
    v21 = v17;
  v22 = v9 * 0.5;
  v23 = v21 - v11 * 0.5;
  v24 = v23;
  p_inPosition->x = v22;
  retstr->inPosition.y = v24;
  *(float *)&v24 = v11 + v24;
  retstr->outPosition.x = v22;
  retstr->outPosition.y = *(float *)&v24;
  if (v4)
  {
    v25 = *p_inPosition;
    *p_inPosition = retstr->outPosition;
    retstr->outPosition = v25;
  }
  v26 = MEMORY[0x1E0C9BAA8];
  v27 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->transform.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->transform.c = v27;
  *(_OWORD *)&retstr->transform.tx = *(_OWORD *)(v26 + 32);
  return result;
}

- (void)setCorrectionLearningAllowed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCorrectionLearningAllowed:", v3);

}

- (void)responseContextDidChange
{
  id v2;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "responseContextDidChange");

}

- (void)textInputTraitsDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "takeTextInputTraitsFromDelegate");

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteTextInputPartner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "documentTraitsChanged");
LABEL_5:

    goto LABEL_6;
  }
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "responder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputAccessoryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputAccessoryView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v8)
  {
    +[UIKBKeyplaneChangeContext keyplaneChangeContext](UIKBKeyplaneChangeContext, "keyplaneChangeContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUpdateAssistantView:", 1);
    -[UIKeyboard _didChangeKeyplaneWithContext:](self, "_didChangeKeyplaneWithContext:", v4);
    goto LABEL_5;
  }
LABEL_6:

}

- (id)targetWindow
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setPasscodeOutlineAlpha:(double)a3
{
  void *v4;
  id v5;

  if (-[UIKeyboard isActive](self, "isActive"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_layout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPasscodeOutlineAlpha:", a3);

  }
}

- (void)_setDisableUpdateMaskForSecureTextEntry:(BOOL)a3
{
  _BOOL4 v3;
  _UIKeyboardPasscodeObscuringInteraction *passcodeObscuringInteraction;
  _UIKeyboardPasscodeObscuringInteraction *v6;
  _UIKeyboardPasscodeObscuringInteraction *v7;
  _UIKeyboardPasscodeObscuringInteraction *v8;

  v3 = a3;
  passcodeObscuringInteraction = self->_passcodeObscuringInteraction;
  if (v3)
  {
    if (!passcodeObscuringInteraction)
    {
      v6 = objc_alloc_init(_UIKeyboardPasscodeObscuringInteraction);
      v7 = self->_passcodeObscuringInteraction;
      self->_passcodeObscuringInteraction = v6;

      passcodeObscuringInteraction = self->_passcodeObscuringInteraction;
    }
    -[UIView addInteraction:](self, "addInteraction:", passcodeObscuringInteraction);
  }
  else if (passcodeObscuringInteraction)
  {
    -[UIView removeInteraction:](self, "removeInteraction:");
    v8 = self->_passcodeObscuringInteraction;
    self->_passcodeObscuringInteraction = 0;

  }
}

- (BOOL)_disableTouchInput
{
  return self->m_disableTouchInput;
}

- (void)_setDisableTouchInput:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->m_disableTouchInput = a3;
  if (-[UIKeyboard isActive](self, "isActive"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_layout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDisableTouchInput:", v3);

  }
}

- (BOOL)_useLinearLayout
{
  return self->m_useLinearLayout;
}

- (void)_setUseLinearLayout:(BOOL)a3
{
  self->m_useLinearLayout = a3;
}

- (BOOL)_useRecentsAlert
{
  return self->m_useRecentsAlert;
}

- (void)_setUseRecentsAlert:(BOOL)a3
{
  self->m_useRecentsAlert = a3;
}

- (void)minimize
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  _OWORD v15[7];
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  -[UIKeyboard geometryForMinimize:](self, "geometryForMinimize:", 1);
  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15[4] = v21;
    v15[5] = v22;
    v15[6] = v23;
    v16 = v24;
    v15[0] = v17;
    v15[1] = v18;
    v15[2] = v19;
    v15[3] = v20;
    objc_msgSend(v4, "postWillShowNotificationForGeometry:duration:", v15, 0.25);

    v6[0] = MEMORY[0x1E0C809B0];
    v11 = v21;
    v12 = v22;
    v13 = v23;
    v7 = v17;
    v8 = v18;
    v9 = v19;
    v6[1] = 3221225472;
    v6[2] = __22__UIKeyboard_minimize__block_invoke;
    v6[3] = &unk_1E16D6460;
    v6[4] = self;
    v14 = v24;
    v10 = v20;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __22__UIKeyboard_minimize__block_invoke_2;
    v5[3] = &unk_1E16B3FD8;
    v5[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v6, v5, 0.25, 0.0);
  }
  else
  {
    -[UIView setCenter:](self, "setCenter:", v18);
  }
}

uint64_t __22__UIKeyboard_minimize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __22__UIKeyboard_minimize__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "keyboardMinMaximized:", 1);
}

- (void)maximize
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  _OWORD v15[7];
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  -[UIKeyboard geometryForMinimize:](self, "geometryForMinimize:", 0);
  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15[4] = v21;
    v15[5] = v22;
    v15[6] = v23;
    v16 = v24;
    v15[0] = v17;
    v15[1] = v18;
    v15[2] = v19;
    v15[3] = v20;
    objc_msgSend(v4, "postWillShowNotificationForGeometry:duration:", v15, 0.25);

    v6[0] = MEMORY[0x1E0C809B0];
    v11 = v21;
    v12 = v22;
    v13 = v23;
    v7 = v17;
    v8 = v18;
    v9 = v19;
    v6[1] = 3221225472;
    v6[2] = __22__UIKeyboard_maximize__block_invoke;
    v6[3] = &unk_1E16D6460;
    v6[4] = self;
    v14 = v24;
    v10 = v20;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __22__UIKeyboard_maximize__block_invoke_2;
    v5[3] = &unk_1E16B3FD8;
    v5[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v6, v5, 0.25, 0.0);
  }
  else
  {
    -[UIView setCenter:](self, "setCenter:", v18);
  }
}

uint64_t __22__UIKeyboard_maximize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __22__UIKeyboard_maximize__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "keyboardMinMaximized:", 0);
}

- (void)setMinimized:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  char v9;
  id v10;

  if (-[UIKeyboard isAutomatic](self, "isAutomatic"))
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textInputTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "keyboardAppearance");

    v7 = v6 != 127 && a3;
    self->m_minimized = v7;
    objc_msgSend(v10, "notifyInputSourceStateChangeIfNeeded");
    if (self->m_minimized)
    {
      -[UIKeyboard minimize](self, "minimize");
    }
    else
    {
      +[UIDictationController activeInstance](UIDictationController, "activeInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "resigningFirstResponder");

      if ((v9 & 1) == 0)
        -[UIKeyboard maximize](self, "maximize");
    }

  }
}

- (void)keyboardMinMaximized:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BYTE v6[120];

  v3 = a3;
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboard geometryForMinimize:](self, "geometryForMinimize:", v3);
  objc_msgSend(v5, "postDidShowNotificationForGeometry:", v6);

  if (v3)
    -[UIKeyboard geometryChangeDone:](self, "geometryChangeDone:", 0);
}

- (UIPeripheralAnimationGeometry)geometryForImplHeightDelta:(SEL)a3
{
  CGPoint *p_inPosition;
  int64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIPeripheralAnimationGeometry *result;
  double v20;
  CGFloat v21;
  double v22;
  CGPoint v23;
  uint64_t v24;
  __int128 v25;

  retstr->targetFrameHeightDelta = 0.0;
  *(_OWORD *)&retstr->transform.c = 0u;
  *(_OWORD *)&retstr->transform.tx = 0u;
  retstr->bounds.size = 0u;
  *(_OWORD *)&retstr->transform.a = 0u;
  retstr->bounds.origin = 0u;
  retstr->outPosition = 0u;
  retstr->inPosition = 0u;
  p_inPosition = &retstr->inPosition;
  v7 = -[UIView _keyboardOrientation](self, "_keyboardOrientation");
  retstr->bounds.origin.x = 0.0;
  retstr->bounds.origin.y = 0.0;
  +[UIKeyboard defaultSizeForInterfaceOrientation:](UIKeyboard, "defaultSizeForInterfaceOrientation:", v7);
  v10 = v9;
  v11 = -0.0;
  if (a4 >= 0.0)
    v11 = a4;
  v12 = v11 + v8;
  retstr->bounds.size.width = v10;
  retstr->bounds.size.height = v11 + v8;
  v13 = v7 - 3;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;

  if (v13 >= 2)
    v20 = v18;
  else
    v20 = v16;
  v21 = v20 - v12 * 0.5;
  p_inPosition->x = v10 * 0.5;
  retstr->inPosition.y = v21;
  v22 = fabs(a4);
  retstr->outPosition.x = v10 * 0.5;
  retstr->outPosition.y = v22 + v21;
  if (a4 < 0.0)
  {
    v23 = *p_inPosition;
    *p_inPosition = retstr->outPosition;
    retstr->outPosition = v23;
    retstr->inPosition.y = retstr->inPosition.y - v22;
    retstr->outPosition.y = retstr->outPosition.y - v22;
  }
  v24 = MEMORY[0x1E0C9BAA8];
  v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->transform.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->transform.c = v25;
  *(_OWORD *)&retstr->transform.tx = *(_OWORD *)(v24 + 32);
  retstr->targetFrameHeightDelta = 0.0;
  return result;
}

- (void)prepareForImplBoundsHeightChange:(double)a3 suppressNotification:(BOOL)a4
{
  void *v4;
  _OWORD v5[7];
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  if (!a4)
  {
    v14 = 0;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
    -[UIKeyboard geometryForImplHeightDelta:](self, "geometryForImplHeightDelta:", a3);
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[4] = v11;
    v5[5] = v12;
    v5[6] = v13;
    v6 = v14;
    v5[0] = v7;
    v5[1] = v8;
    v5[2] = v9;
    v5[3] = v10;
    objc_msgSend(v4, "postWillShowNotificationForGeometry:duration:", v5, 0.0);

  }
}

- (void)implBoundsHeightChangeDone:(double)a3 suppressNotification:(BOOL)a4
{
  void *v7;
  _OWORD v8[7];
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  self->m_respondingToImplGeometryChange = 1;
  -[UIView frame](self, "frame");
  -[UIKeyboard setFrame:](self, "setFrame:");
  self->m_respondingToImplGeometryChange = 0;
  if (!a4)
  {
    v17 = 0;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
    -[UIKeyboard geometryForImplHeightDelta:](self, "geometryForImplHeightDelta:", a3);
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[4] = v14;
    v8[5] = v15;
    v8[6] = v16;
    v9 = v17;
    v8[0] = v10;
    v8[1] = v11;
    v8[2] = v12;
    v8[3] = v13;
    objc_msgSend(v7, "postDidShowNotificationForGeometry:", v8);

  }
}

- (BOOL)canDismiss
{
  return 1;
}

- (BOOL)showsCandidatesInline
{
  void *v2;
  char v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsCandidateInline");

  return v3;
}

- (void)setShowsCandidatesInline:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsCandidateInline:", v3);

}

+ (BOOL)splitKeyboardEnabled
{
  return +[UIKeyboardImpl rivenPreference](UIKeyboardImpl, "rivenPreference");
}

+ (BOOL)isSafari
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__UIKeyboard_isSafari__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7C7A0 != -1)
    dispatch_once(&qword_1ECD7C7A0, block);
  return byte_1ECD7C72C;
}

void __22__UIKeyboard_isSafari__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "keyboardBundleIdentifier");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  byte_1ECD7C72C = objc_msgSend(&unk_1E1A941D8, "containsObject:", v1);

}

+ (BOOL)isAutoFillPanelInAppsEnabled
{
  UIKeyboardGetSafeDeviceIdiom();
  return _os_feature_enabled_impl();
}

+ (BOOL)isAutoFillPanelUIEnabled
{
  UIKeyboardGetSafeDeviceIdiom();
  return _os_feature_enabled_impl();
}

+ (BOOL)isAlwaysBlockedAutoFillPanelClient
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__UIKeyboard_isAlwaysBlockedAutoFillPanelClient__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7C7B0 != -1)
    dispatch_once(&qword_1ECD7C7B0, block);
  return byte_1ECD7C72E;
}

void __48__UIKeyboard_isAlwaysBlockedAutoFillPanelClient__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.mobilesafari"), CFSTR("com.apple.SafariViewService"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "keyboardBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  byte_1ECD7C72E = objc_msgSend(v3, "containsObject:", v2);

}

+ (BOOL)isRemoteEmojiCollectionViewEnabled
{
  void *v2;
  void *v3;
  void *v4;

  if ((_UIApplicationIsFirstPartyStickers() & 1) != 0 || (_UIApplicationIsStickerPickerService() & 1) != 0)
    return 0;
  if (TIGetRemoteEmojiValue_onceToken != -1)
    dispatch_once(&TIGetRemoteEmojiValue_onceToken, &__block_literal_global_1380);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForPreferenceKey:", CFSTR("RemoteEmoji"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend(v3, "BOOLValue");
  if (!(_DWORD)v2)
    return 0;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInterfaceIdiom");

  return _os_feature_enabled_impl();
}

- (int64_t)keyboardIdiom
{
  return self->m_idiom;
}

- (void)setKeyboardIdiom:(int64_t)a3
{
  self->m_idiom = a3;
}

- (BOOL)hasImpendingCursorLocation
{
  return self->_hasImpendingCursorLocation;
}

- (void)setHasImpendingCursorLocation:(BOOL)a3
{
  self->_hasImpendingCursorLocation = a3;
}

- (unint64_t)impendingCursorLocation
{
  return self->_impendingCursorLocation;
}

- (unint64_t)requestedInteractionModel
{
  return self->_requestedInteractionModel;
}

- (void)setRequestedInteractionModel:(unint64_t)a3
{
  self->_requestedInteractionModel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implConstraints, 0);
  objc_storeStrong((id *)&self->_menuGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_passcodeObscuringInteraction, 0);
  objc_storeStrong((id *)&self->m_focusGuides, 0);
  objc_storeStrong((id *)&self->m_overrideTraits, 0);
  objc_storeStrong((id *)&self->m_defaultTraits, 0);
  objc_storeStrong((id *)&self->m_snapshot, 0);
}

- (id)createPathEffectViewIfNecessary
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "pathEffectView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "pathEffectView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2050000000;
      v7 = (void *)qword_1ECD7C7F0;
      v15 = qword_1ECD7C7F0;
      if (!qword_1ECD7C7F0)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __getTUIKeyboardPathEffectViewClass_block_invoke_0;
        v11[3] = &unk_1E16B14C0;
        v11[4] = &v12;
        __getTUIKeyboardPathEffectViewClass_block_invoke_0((uint64_t)v11);
        v7 = (void *)v13[3];
      }
      v8 = objc_retainAutorelease(v7);
      _Block_object_dispose(&v12, 8);
      v9 = [v8 alloc];
      v6 = (void *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v6, "setAlpha:", 0.0);
      objc_msgSend(v4, "setPathEffectView:", v6);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)platformSupportsKeyboardServiceRole:(unint64_t)a3
{
  return 1;
}

+ (void)setServiceRole:(unint64_t)a3
{
  id v5;

  if (objc_msgSend(a1, "platformSupportsKeyboardServiceRole:"))
  {
    objc_msgSend(a1, "serviceRole");
    qword_1ECD7C7C0 = a3;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setServiceRole:", a3);

  }
}

+ (void)resetServiceRole
{
  uint64_t v3;

  if ((objc_msgSend(a1, "usesInputSystemUI") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(a1, "usesInputSystemUIForAutoFillOnly");
  objc_msgSend(a1, "setServiceRole:", v3);
}

- (void)manualKeyboardWillBeOrderedIn
{
  id v3;

  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "manualKeyboardWillBeOrderedIn:", self);

}

- (void)manualKeyboardWasOrderedIn
{
  id v3;

  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "manualKeyboardWasOrderedIn:", self);

}

- (void)manualKeyboardWillBeOrderedOut
{
  id v3;

  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "manualKeyboardWillBeOrderedOut:", self);

}

- (void)manualKeyboardWasOrderedOut
{
  id v3;

  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "manualKeyboardWasOrderedOut:", self);

}

+ (id)homeGestureExclusionZones
{
  void *v2;

  if (objc_msgSend((id)objc_opt_class(), "isOnScreen"))
  {
    +[UIKeyboardDockView dockViewHomeGestureExclusionZones](UIKeyboardDockView, "dockViewHomeGestureExclusionZones");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v2;
}

- (id)_getCurrentKeyplaneName
{
  void *v2;
  void *v3;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_getCurrentKeyplaneName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_getCurrentKeyboardName
{
  void *v2;
  void *v3;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_getCurrentKeyboardName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_getLocalizedInputMode
{
  void *v2;
  void *v3;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_getLocalizedInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_baseKeyForRepresentedString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canProduceString:", v3);

  if (v6)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_layout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "baseKeyForString:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_keyplaneForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyplaneForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_keyplaneNamed:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyplaneNamed:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_changeToKeyplane:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeToKeyplane:", v3);

}

- (void)_setUndocked:(BOOL)a3
{
  UIKeyboardSetUndocked(a3);
}

- (void)_setSplit:(BOOL)a3
{
  UIKeyboardSetSplit(a3);
}

- (id)_touchPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setNeedsCandidates:", 1);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "simulateTouch:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_typeCharacter:(id)a3 withError:(CGPoint)a4 shouldTypeVariants:(BOOL)a5 baseKeyForVariants:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  double y;
  double x;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a6;
  v7 = a5;
  y = a4.y;
  x = a4.x;
  v10 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setNeedsCandidates:", 1);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_layout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "simulateTouchForCharacter:errorVector:shouldTypeVariants:baseKeyForVariants:", v10, v7, v6, x, y);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_setInputMode:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInputMode:", v3);

}

- (void)_setAutocorrects:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setAutocorrects:", v3);

}

- (id)_getAutocorrection
{
  void *v2;
  void *v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_getAutocorrection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_acceptCurrentCandidate
{
  id v2;
  id v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "acceptCurrentCandidate");

}

- (BOOL)_hasCandidates
{
  void *v2;
  char v3;
  void *v4;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "_needsCandidates") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "_hasCandidates");

  }
  return v3;
}

- (int64_t)_positionInCandidateList:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_positionInCandidateList:", v3);

  return v5;
}

- (CGRect)_floatingKeyboardDraggableRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    -[UIView _rootInputWindowController](self, "_rootInputWindowController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hosting");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemForPurpose:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "applicator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "draggableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "superview");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      objc_msgSend(v13, "convertRect:toView:", self);
      v3 = v14;
      v4 = v15;
      v5 = v16;
      v6 = v17;

    }
  }
  v18 = v3;
  v19 = v4;
  v20 = v5;
  v21 = v6;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

+ (double)predictionViewHeightForCurrentInputMode
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesCandidateSelection");

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "candidateController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "candidateBarHeightForOrientation:", objc_msgSend(v7, "interfaceOrientation"));
    v9 = v8;
    v10 = v5;
  }
  else
  {
    objc_msgSend(v4, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemInputAssistantViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v11 && (objc_msgSend(v11, "isEmojiSearchResultsVisible") & 1) == 0)
      objc_msgSend(v7, "preferredHeightForTraitCollection:", v10);
    else
      +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:](UISystemInputAssistantViewController, "_defaultPreferredHeightForTraitCollection:", v10);
    v9 = v12;
  }

  return v9;
}

+ (UIEdgeInsets)keyplanePadding
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "keyplanePadding");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

+ (id)snapshotViewForPredictionViewTransition
{
  void *v2;
  UIView *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIView *v10;
  UIView *v11;

  if (objc_msgSend(a1, "usesInputSystemUI"))
  {
    +[UIKeyboardUIClient sharedInstance](UIKeyboardUIClient, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "snapshotViewForOptions:", 2);
    v3 = (UIView *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v10 = v3;
    goto LABEL_12;
  }
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "usesCandidateSelection");

  if (!v5)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "systemInputAssistantViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      objc_msgSend(v9, "snapshotView");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = [UIView alloc];
      objc_msgSend(v2, "bounds");
      v10 = -[UIView initWithFrame:](v11, "initWithFrame:");
      -[UIView setClipsToBounds:](v10, "setClipsToBounds:", 1);
      -[UIView addSubview:](v10, "addSubview:", v2);
      goto LABEL_12;
    }
    v3 = v9;
    v2 = v3;
    goto LABEL_8;
  }
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "candidateController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "candidateBar");
  }
  else
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "candidateController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "snapshot");
  }
  v10 = (UIView *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v10;
}

+ (id)snapshotViewForOptions:(unint64_t)a3
{
  void *v6;
  void *v7;
  void *v9;

  if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIKeyboard.m"), 2946, CFSTR("snapshotViewForOptions only supports OOP keyboard"));

  }
  +[UIKeyboardUIClient sharedInstance](UIKeyboardUIClient, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "snapshotViewForOptions:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)forceKeyboardAlpha:(double)a3
{
  id v4;

  if (objc_msgSend(a1, "usesInputSystemUI"))
  {
    +[UIKeyboardUIClient sharedInstance](UIKeyboardUIClient, "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setKeyboardAlpha:force:", 1, a3);

  }
}

+ (void)setKeyboardAlpha:(double)a3
{
  objc_msgSend(a1, "setKeyboardAlpha:remote:force:processId:", 0, 0, 0, a3);
}

+ (void)setKeyboardAlpha:(double)a3 remote:(BOOL)a4 force:(BOOL)a5 processId:(int)a6
{
  uint64_t v6;
  _BOOL8 v7;
  _BOOL4 v8;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int *v25;
  char *v26;
  uint8_t v27[4];
  _BYTE v28[18];
  uint8_t buf[16];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v8 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "usesInputSystemUI") & 1) != 0)
  {
    _UIKeyboardLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = a3;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "Setting keyboard alpha: %f", buf, 0xCu);
    }

    +[UIKeyboardUIClient sharedInstance](UIKeyboardUIClient, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setKeyboardAlpha:force:", v7, a3);

  }
  else
  {
    if (qword_1ECD7C7D0 != -1)
      dispatch_once(&qword_1ECD7C7D0, &__block_literal_global_1298);
    v37 = 0;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    *(_OWORD *)buf = 0u;
    v30 = 0u;
    if (proc_pidinfo(v6, 3, 0, buf, 136) > 0x87)
    {
      v14 = *((_QWORD *)&v36 + 1);
    }
    else
    {
      _UIKeyboardLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v25 = __error();
        v26 = strerror(*v25);
        *(_DWORD *)v27 = 67109378;
        *(_DWORD *)v28 = v6;
        *(_WORD *)&v28[4] = 2080;
        *(_QWORD *)&v28[6] = v26;
        _os_log_error_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Failed to get pid info for pid %d: %s", v27, 0x12u);
      }

      v14 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d:%llu"), v6, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15 && v8 && !v7)
    {
      if (a3 == 0.0)
        objc_msgSend((id)qword_1ECD7C7C8, "addObject:", v15);
      else
        objc_msgSend((id)qword_1ECD7C7C8, "removeObject:", v15);
    }
    else if (v15 && !v7 && objc_msgSend((id)qword_1ECD7C7C8, "containsObject:", v15))
    {
      a3 = 0.0;
    }
    _UIKeyboardLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 134218242;
      *(double *)v28 = a3;
      *(_WORD *)&v28[8] = 2112;
      *(_QWORD *)&v28[10] = v16;
      _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_DEFAULT, "Setting keyboard alpha: %f, key=%@", v27, 0x16u);
    }

    if ((objc_msgSend(a1, "isKeyboardProcess") & 1) == 0)
    {
      +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "keyboardWindow");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "rootViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAlpha:", a3);

    }
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "containerRootController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "setAlpha:", a3);
  }
}

void __70__UIKeyboard_TestingSupport__setKeyboardAlpha_remote_force_processId___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7C7C8;
  qword_1ECD7C7C8 = v0;

}

+ (BOOL)predictionViewPrewarmsPredictiveCandidates
{
  void *v2;
  char v3;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "prewarmsPredictiveCandidates");

  return v3;
}

+ (void)setPredictionViewPrewarmsPredictiveCandidates:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrewarmsPredictiveCandidates:", v3);

}

+ (BOOL)candidateDisplayIsExtended
{
  void *v2;
  void *v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "candidateController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isExtended");
  return (char)v2;
}

+ (id)obtainHideDisambiguationCandidatesAssertionForReason:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidateController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "obtainHideDisambiguationCandidatesAssertionForReason:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)obtainHideInlineCandidatesAssertionForReason:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "obtainHideInlineCandidatesAssertionForReason:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
