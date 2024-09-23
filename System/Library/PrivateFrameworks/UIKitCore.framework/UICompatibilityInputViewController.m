@implementation UICompatibilityInputViewController

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICompatibilityInputViewController;
  -[UIViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[UIViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EDFA9398))
  {
    objc_msgSend(v3, "controllerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "controllerDidLayoutSubviews:", v3);

  }
}

- (void)loadView
{
  _UIKBCompatInputView *v3;
  _UIKBCompatInputView *v4;
  id v5;

  v3 = [_UIKBCompatInputView alloc];
  v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIInputViewController setView:](self, "setView:", v4);

  -[UIViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UICompatibilityInputViewController;
  -[UIViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[UICompatibilityInputViewController _keyboardForThisViewController](self, "_keyboardForThisViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");

  if ((v5 & 1) == 0)
  {
    -[UICompatibilityInputViewController _keyboardForThisViewController](self, "_keyboardForThisViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activate");

  }
}

- (id)_keyboardForThisViewController
{
  void *v3;
  void *v4;

  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_keyboard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      return v4;
  }
  else
  {

  }
  if (!-[UIInputViewController _isPlaceholder](self, "_isPlaceholder"))
  {
LABEL_10:
    -[UICompatibilityInputViewController childCompatibilityController](self, "childCompatibilityController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_keyboard");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placeheldView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_10;
  }
  objc_msgSend(v7, "_keyboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_10;
  return v4;
}

- (id)childCompatibilityController
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[UICompatibilityInputViewController inputController](self, "inputController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UICompatibilityInputViewController inputController](self, "inputController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (UIViewController)inputController
{
  return self->_inputController;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)didMoveToParentViewController:(id)a3
{
  void *v4;
  char isKindOfClass;

  if (!a3)
  {
    -[UICompatibilityInputViewController inputController](self, "inputController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      -[UICompatibilityInputViewController tearDownInputController](self, "tearDownInputController");
  }
}

+ (id)inputViewControllerWithView:(id)a3
{
  id v3;
  void *v4;
  UICompatibilityInputViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  UICompatibilityInputViewController *v9;
  void *v10;
  objc_class *v11;
  const char *Name;

  v3 = a3;
  +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v3, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v7;
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(v3, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIViewController removeViewControllerForView:](UIViewController, "removeViewControllerForView:", v8);

    }
    v9 = -[UIInputViewController initWithNibName:bundle:]([UICompatibilityInputViewController alloc], "initWithNibName:bundle:", 0, 0);
    v5 = v9;
    if (v4)
    {
      objc_msgSend(v3, "_convertToAutolayoutSizingIfNecessary");
      -[UIViewController addChildViewController:](v5, "addChildViewController:", v4);
      -[UIViewController view](v5, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", v3);

      objc_msgSend(v4, "didMoveToParentViewController:", v5);
      -[UICompatibilityInputViewController rebuildChildConstraints](v5, "rebuildChildConstraints");
    }
    else
    {
      -[UIInputViewController setView:](v9, "setView:", v3);
    }
    v11 = (objc_class *)objc_opt_class();
    Name = class_getName(v11);
    if (strcmp(Name, "CKMessageEntryView"))
      -[UICompatibilityInputViewController generateCompatibleSizeConstraintsIfNecessary](v5, "generateCompatibleSizeConstraintsIfNecessary");
    goto LABEL_12;
  }
  v5 = v4;
LABEL_13:

  return v5;
}

+ (BOOL)_requiresProxyInterface
{
  return 0;
}

- (void)generateCompatibleSizeConstraintsIfNecessary
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  id v14;

  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "translatesAutoresizingMaskIntoConstraints"))
  {
    -[UIViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = ((unint64_t)objc_msgSend(v4, "autoresizingMask") >> 4) & 1;

  }
  else
  {
    LODWORD(v5) = 1;
  }

  -[UIViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intrinsicContentSize");
  v8 = v7;
  v10 = v9;

  -[UICompatibilityInputViewController _keyboard](self, "_keyboard");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

LABEL_9:
    -[UIViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    goto LABEL_10;
  }
  v12 = v8 != -1.0;
  if (v10 != -1.0)
    v12 = 1;
  if ((v12 & v5 & 1) != 0)
    goto LABEL_9;
LABEL_10:
  -[UIViewController view](self, "view");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_convertToAutolayoutSizingIfNecessary");

}

- (void)setInputMode:(id)a3
{
  UIKeyboardInputMode *v5;
  void *v6;
  _BOOL4 v7;
  UIKeyboardInputMode **p_inputMode;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIKeyboardInputMode *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIKeyboardInputMode *incomingExtensionInputMode;
  _BOOL4 v20;
  void *v21;
  BOOL v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
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
  double v45;
  CFAbsoluteTime Current;
  double incomingExtensionInputModeTime;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  dispatch_semaphore_t v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  float v65;
  int64_t v66;
  dispatch_time_t v67;
  dispatch_time_t v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t, void *);
  void *v72;
  UICompatibilityInputViewController *v73;
  UIKeyboardInputMode *v74;
  NSObject *v75;
  _QWORD block[6];
  _QWORD v77[5];
  UIKeyboardInputMode *v78;
  _QWORD v79[5];

  v5 = (UIKeyboardInputMode *)a3;
  if (qword_1ECD7C610 != -1)
    dispatch_once(&qword_1ECD7C610, &__block_literal_global_250_2);
  if (-[UIKeyboardInputMode isExtensionInputMode](v5, "isExtensionInputMode"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "_shouldSuppressSoftwareKeyboard") & 1) != 0)
    {
      v7 = +[UIKeyboardImpl isFloatingForced](UIKeyboardImpl, "isFloatingForced");

      if (!v7)
        goto LABEL_76;
    }
    else
    {

    }
  }
  p_inputMode = &self->_inputMode;
  if (-[UIKeyboardInputMode isExtensionInputMode](self->_inputMode, "isExtensionInputMode")
    || -[UIKeyboardInputMode isExtensionInputMode](v5, "isExtensionInputMode"))
  {
    v9 = 0;
  }
  else
  {
    -[UIKeyboardInputMode normalizedIdentifier](*p_inputMode, "normalizedIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (UIKeyboardInputModeUsesKBStar(v10))
    {
      -[UIKeyboardInputMode normalizedIdentifier](v5, "normalizedIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = UIKeyboardInputModeUsesKBStar(v11);

    }
    else
    {
      v9 = 0;
    }

  }
  if (!-[UIKeyboardInputMode isEqual:](*p_inputMode, "isEqual:", v5) && !v9)
    goto LABEL_17;
  -[UICompatibilityInputViewController inputController](self, "inputController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 == v18)
  {

  }
  else
  {
    incomingExtensionInputMode = self->_incomingExtensionInputMode;

    if (!incomingExtensionInputMode)
      goto LABEL_17;
  }
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v44, "_predictionGraphicsQuality") == 100)
    v45 = 3.0;
  else
    v45 = 5.0;

  if (-[UIKeyboardInputMode isExtensionInputMode](v5, "isExtensionInputMode")
    && self->_incomingExtensionInputMode
    && (Current = CFAbsoluteTimeGetCurrent(),
        incomingExtensionInputModeTime = self->_incomingExtensionInputModeTime,
        Current - incomingExtensionInputModeTime > v45)
    && vabdd_f64(self->_lastSuspendedTime, incomingExtensionInputModeTime) > v45)
  {
    -[UICompatibilityInputViewController killIncomingExtension](self, "killIncomingExtension");
    -[UICompatibilityInputViewController resetInputMode](self, "resetInputMode");
  }
  else if (!self->_incomingExtensionInputMode)
  {
    if (!self->_tearingDownInputController)
      goto LABEL_60;
    if (!-[UIKeyboardInputMode isExtensionInputMode](*p_inputMode, "isExtensionInputMode"))
    {
      -[UICompatibilityInputViewController inputController](self, "inputController");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "view");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICompatibilityInputViewController _keyboard](self, "_keyboard");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (v49 == v50)
      {
LABEL_60:
        -[UIKeyboardInputMode setIsDisplayed:](*p_inputMode, "setIsDisplayed:", 0);
        objc_storeStrong((id *)&self->_inputMode, a3);
LABEL_75:
        -[UIKeyboardInputMode setIsDisplayed:](*p_inputMode, "setIsDisplayed:", 1);
        goto LABEL_76;
      }
    }
    -[UICompatibilityInputViewController tearDownInputController](self, "tearDownInputController");
LABEL_17:
    -[UIViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_rootInputWindowController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerPowerLogEvent:", 1);

    if (-[UIKeyboardInputMode isExtensionInputMode](*p_inputMode, "isExtensionInputMode")
      && self->_shouldSuppressRemoteInputController)
    {
      v14 = *p_inputMode;
    }
    else
    {
      v20 = -[UIKeyboardInputMode isExtensionInputMode](v5, "isExtensionInputMode");
      v14 = v5;
      if (!v20)
      {
LABEL_25:
        -[UICompatibilityInputViewController tearDownInputController](self, "tearDownInputController", v14);
        objc_storeStrong((id *)&self->_inputMode, a3);
        if (-[UIKeyboardInputMode isExtensionInputMode](v5, "isExtensionInputMode")
          && !self->_shouldSuppressRemoteInputController
          && !+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
        {
          objc_storeStrong((id *)&self->_incomingExtensionInputMode, a3);
          self->_incomingExtensionInputModeTime = CFAbsoluteTimeGetCurrent();
          v58 = MEMORY[0x1E0C809B0];
          v79[0] = MEMORY[0x1E0C809B0];
          v79[1] = 3221225472;
          v79[2] = __51__UICompatibilityInputViewController_setInputMode___block_invoke_2;
          v79[3] = &unk_1E16CD708;
          v79[4] = self;
          -[UIKeyboardInputMode extension](v5, "extension");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setRequestInterruptionBlock:", v79);

          -[UIKeyboardInputMode extension](v5, "extension");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v77[0] = v58;
          v77[1] = 3221225472;
          v77[2] = __51__UICompatibilityInputViewController_setInputMode___block_invoke_4;
          v77[3] = &unk_1E16CD730;
          v77[4] = self;
          v78 = v5;
          objc_msgSend(v60, "instantiateViewControllerWithInputItems:connectionHandler:", MEMORY[0x1E0C9AA60], v77);

          v61 = (void *)_MergedGlobals_15_1;
          -[UIKeyboardInputMode identifier](self->_incomingExtensionInputMode, "identifier");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectForKey:", v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          v64 = 3.0;
          if (self->_lastSuspendedTime <= self->_currentResumeTime)
          {
            if (CFAbsoluteTimeGetCurrent() - self->_currentResumeTime >= 1.0)
              v64 = 0.5;
            else
              v64 = 3.0;
          }
          if (v63)
          {
            objc_msgSend(v63, "floatValue");
            v66 = (uint64_t)((v64 + (float)(v65 + v65)) * 1000000000.0);
          }
          else
          {
            v66 = 5000000000;
          }
          v68 = dispatch_time(0, v66);
          self->_latestDelayTime = v68;
          block[0] = v58;
          block[1] = 3221225472;
          block[2] = __51__UICompatibilityInputViewController_setInputMode___block_invoke_6;
          block[3] = &unk_1E16B1888;
          block[4] = self;
          block[5] = v68;
          dispatch_after(v68, MEMORY[0x1E0C80D38], block);

          goto LABEL_75;
        }
        -[UIKeyboardInputMode identifier](v5, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "isEqualToString:", CFSTR("autofillsignup")))
        {
          if (!self->_incomingExtensionInputMode)
          {

LABEL_54:
            +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "_autofillContext");
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v37, "objectForKey:", CFSTR("_automaticPasswordKeyboard"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v52)
            {

              v37 = 0;
            }
            +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "_passwordRules");
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            if (get_SFAutomaticPasswordInputViewControllerClass()
              && !-[UIKeyboardInputMode isDisplayed](*p_inputMode, "isDisplayed"))
            {
              v55 = dispatch_semaphore_create(0);
              v69 = MEMORY[0x1E0C809B0];
              v70 = 3221225472;
              v71 = __51__UICompatibilityInputViewController_setInputMode___block_invoke_7;
              v72 = &unk_1E16CD758;
              v73 = self;
              v74 = v5;
              v56 = v55;
              v75 = v56;
              v57 = _Block_copy(&v69);
              if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess", v69, v70, v71, v72, v73))
              {
                objc_storeStrong((id *)&self->_incomingExtensionInputMode, *p_inputMode);
              }
              else
              {
                get_SFAutomaticPasswordInputViewControllerClass();
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_storeStrong((id *)&self->_incomingExtensionInputMode, *p_inputMode);
                  objc_msgSend(get_SFAutomaticPasswordInputViewControllerClass(), "inputViewControllerWithAutoFillContext:passwordRules:completion:", v37, v54, v57);
                  v67 = dispatch_time(0, 500000000);
                  dispatch_semaphore_wait(v56, v67);
                }
                else
                {
                  -[UICompatibilityInputViewController resetInputMode](self, "resetInputMode");
                }
              }

            }
LABEL_74:

            goto LABEL_75;
          }
          v22 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");

          if (v22)
            goto LABEL_54;
        }
        else
        {

        }
        if (-[UIKeyboardInputMode isExtensionInputMode](v5, "isExtensionInputMode"))
          goto LABEL_75;
        if (!self->_deferredSystemView)
          goto LABEL_75;
        -[UIKeyboardInputMode identifier](v5, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("autofillsignup"));

        if ((v24 & 1) != 0)
          goto LABEL_75;
        -[UICompatibilityInputViewController removeSnapshotView](self, "removeSnapshotView");
        -[UICompatibilityInputViewController _systemViewControllerForInputMode:](self, "_systemViewControllerForInputMode:", v5);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICompatibilityInputViewController setInputController:](self, "setInputController:", v25);

        -[UIInputViewController _proxyInterface](self, "_proxyInterface");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setForwardingInterface:", 0);

        -[UICompatibilityInputViewController inputController](self, "inputController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController addChildViewController:](self, "addChildViewController:", v27);

        -[UIViewController view](self, "view");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICompatibilityInputViewController inputController](self, "inputController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "view");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addSubview:", v30);

        -[UICompatibilityInputViewController _compatView](self, "_compatView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICompatibilityInputViewController inputController](self, "inputController");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "view");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setTouchableView:", v33);

        -[UICompatibilityInputViewController inputController](self, "inputController");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "didMoveToParentViewController:", self);

        -[UICompatibilityInputViewController rebuildChildConstraints](self, "rebuildChildConstraints");
        if (!-[UIKeyboard isActive](self->_deferredSystemView, "isActive"))
          -[UIKeyboard activate](self->_deferredSystemView, "activate");
        -[UICompatibilityInputViewController inputController](self, "inputController");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "view");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "size");
        +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v37, "setSplitWidthsChanged:", 1);
        objc_msgSend(v37, "setUpdateAssistantView:", 1);
        -[UIViewController view](self, "view");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "superview");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "_didChangeKeyplaneWithContext:", v37);

        -[UICompatibilityInputViewController inputController](self, "inputController");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "view");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController view](self, "view");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "_inheritedRenderConfig");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "_setRenderConfig:", v43);

        +[UIAssistantBarButtonItemProvider updateFloatingAssistantBarIfNeeded](UIAssistantBarButtonItemProvider, "updateFloatingAssistantBarIfNeeded");
        goto LABEL_74;
      }
    }
    -[UICompatibilityInputViewController addSnapshotViewForInputMode:](self, "addSnapshotViewForInputMode:", v14);
    goto LABEL_25;
  }
LABEL_76:

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("UIApplicationDidEnterBackgroundNotification");
  v6[1] = CFSTR("UIApplicationWillEnterForegroundNotification");
  v6[2] = CFSTR("UITextEffectsWindowIsHostedNotification");
  v6[3] = CFSTR("UICompatibilityInputViewControllerShouldUpdateNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  -[UICompatibilityInputViewController tearDownInputController](self, "tearDownInputController");
  v5.receiver = self;
  v5.super_class = (Class)UICompatibilityInputViewController;
  -[UIInputViewController dealloc](&v5, sel_dealloc);
}

- (void)tearDownInputController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[UIKeyboardInputMode setIsDisplayed:](self->_inputMode, "setIsDisplayed:", 0);
  if (-[UIKeyboardInputMode isExtensionInputMode](self->_inputMode, "isExtensionInputMode"))
  {
    -[UIKeyboardInputMode extension](self->_inputMode, "extension");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRequestInterruptionBlock:", 0);

  }
  -[UICompatibilityInputViewController inputController](self, "inputController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIInputViewController _proxyInterface](self, "_proxyInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "forwardingInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_tearDownRemoteService");

    -[UIInputViewController _proxyInterface](self, "_proxyInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setForwardingInterface:", 0);

    -[UICompatibilityInputViewController _compatView](self, "_compatView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTouchableView:", 0);

    -[UICompatibilityInputViewController inputController](self, "inputController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

    -[UICompatibilityInputViewController inputController](self, "inputController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromParentViewController");

    -[UICompatibilityInputViewController setInputController:](self, "setInputController:", 0);
  }
  self->_tearingDownInputController = 0;
}

- (void)setInputController:(id)a3
{
  objc_storeStrong((id *)&self->_inputController, a3);
}

- (void)removeSnapshotView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[UICompatibilityInputViewController _compatibilityController](self, "_compatibilityController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_compatView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshotView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UICompatibilityInputViewController _compatibilityController](self, "_compatibilityController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_compatView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "snapshotView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[UICompatibilityInputViewController _compatibilityController](self, "_compatibilityController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_compatView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSnapshotView:", 0);

  }
}

- (id)_compatibilityController
{
  void *v3;
  char isKindOfClass;
  UICompatibilityInputViewController *v5;

  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v5 = self;
  else
    v5 = 0;
  return v5;
}

- (id)_compatView
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UIViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)rebuildChildConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  -[UICompatibilityInputViewController internalEdgeMatchConstraints](self, "internalEdgeMatchConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICompatibilityInputViewController internalEdgeMatchConstraints](self, "internalEdgeMatchConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeConstraints:", v5);

    -[UICompatibilityInputViewController setInternalEdgeMatchConstraints:](self, "setInternalEdgeMatchConstraints:", 0);
  }
  -[UICompatibilityInputViewController inputController](self, "inputController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v30 = (id)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    -[UICompatibilityInputViewController _compatView](self, "_compatView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "touchableView");
    v30 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[UIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v30, "isDescendantOfView:", v8);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0D156E0];
    -[UIViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 1, 0, v30, 1, 1.0, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v13);

    v14 = (void *)MEMORY[0x1E0D156E0];
    -[UIViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 2, 0, v30, 2, 1.0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v16);

    v17 = (void *)MEMORY[0x1E0D156E0];
    -[UIViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 3, 0, v30, 3, 1.0, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v19);

    v20 = (void *)MEMORY[0x1E0D156E0];
    -[UIViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 4, 0, v30, 4, 1.0, 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v22);

    -[UICompatibilityInputViewController inputController](self, "inputController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addConstraints:", v10);

    -[UICompatibilityInputViewController setInternalEdgeMatchConstraints:](self, "setInternalEdgeMatchConstraints:", v10);
  }
  -[UIViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "invalidateIntrinsicContentSize");

  -[UIViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setNeedsLayout");

  -[UIViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_rootInputWindowController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "updateViewSizingConstraints");

}

- (void)setInternalEdgeMatchConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_internalEdgeMatchConstraints, a3);
}

- (NSArray)internalEdgeMatchConstraints
{
  return self->_internalEdgeMatchConstraints;
}

- (id)_systemViewControllerForInputMode:(id)a3
{
  id v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v5 = (objc_class *)objc_msgSend(v4, "viewControllerClass")) != 0)
  {
    v6 = objc_alloc_init(v5);
    -[UIViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_inheritedRenderConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "lightKeyboard"))
      v9 = 1;
    else
      v9 = 2;

    objc_msgSend(v6, "traitOverrides");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUserInterfaceStyle:", v9);

  }
  else
  {
    +[UICompatibilityInputViewController inputViewControllerWithView:](UICompatibilityInputViewController, "inputViewControllerWithView:", self->_deferredSystemView);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v3;
  int v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UICompatibilityInputViewController;
  -[UIViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  +[UIInputSwitcherView activeInstance](UIInputSwitcherView, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isVisible");

  if (v4)
  {
    +[UIInputSwitcherView activeInstance](UIInputSwitcherView, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hide");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blinkAssertion, 0);
  objc_storeStrong((id *)&self->_internalEdgeMatchConstraints, 0);
  objc_storeStrong((id *)&self->_inputController, 0);
  objc_storeStrong((id *)&self->_focusSafeAreaLayoutGuide, 0);
  objc_storeStrong((id *)&self->_incomingExtensionInputMode, 0);
  objc_storeStrong((id *)&self->_deferredSystemView, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

void __51__UICompatibilityInputViewController_setInputMode___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_MergedGlobals_15_1;
  _MergedGlobals_15_1 = (uint64_t)v0;

}

void __78__UICompatibilityInputViewController_deferredInputModeControllerWithKeyboard___block_invoke()
{
  id v0;
  void *v1;

  v0 = -[UICompatibilityInputViewController _initAsDeferredController]([UICompatibilityInputViewController alloc], "_initAsDeferredController");
  v1 = (void *)qword_1ECD7C600;
  qword_1ECD7C600 = (uint64_t)v0;

}

- (id)_initAsDeferredController
{
  UICompatibilityInputViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UICompatibilityInputViewController;
  v2 = -[UIViewController init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_didSuspend_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_willResume_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_isHosted_, CFSTR("UITextEffectsWindowIsHostedNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_shouldUpdateInputMode_, CFSTR("UICompatibilityInputViewControllerShouldUpdateNotification"), 0);
    if ((objc_msgSend((id)UIApp, "isSuspended") & 1) != 0)
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "containerWindow");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v2->_shouldSuppressRemoteInputController = objc_msgSend(v5, "_isHostedInAnotherProcess") ^ 1;

    }
    else
    {
      v2->_shouldSuppressRemoteInputController = 0;
    }

  }
  return v2;
}

+ (id)deferredInputModeControllerWithKeyboard:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (qword_1ECD7C608 != -1)
    dispatch_once(&qword_1ECD7C608, &__block_literal_global_312);
  v5 = (void *)qword_1ECD7C600;
  if (*(id *)(qword_1ECD7C600 + 1016) != v4)
  {
    objc_msgSend((id)qword_1ECD7C600, "tearDownInputController");
    objc_storeStrong((id *)(qword_1ECD7C600 + 1016), a3);
    v5 = (void *)qword_1ECD7C600;
  }
  v6 = v5;

  return v6;
}

- (void)shouldUpdateInputMode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("UICompatibilityInputViewControllerScreenKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIResponder _responderWindow](self, "_responderWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "screen");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[UIResponder _responderWindow](self, "_responderWindow");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "screen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 != v10)
        goto LABEL_9;
    }
    else
    {

    }
  }
  objc_msgSend(v13, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("UICompatibilityInputViewControllerInputModeKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    -[UICompatibilityInputViewController setInputMode:](self, "setInputMode:", v12);

LABEL_9:
}

- (void)setDeferredSystemView:(id)a3
{
  UIKeyboard *v5;
  UIKeyboard *v6;

  v5 = (UIKeyboard *)a3;
  if (self->_deferredSystemView != v5)
  {
    v6 = v5;
    -[UICompatibilityInputViewController tearDownInputController](self, "tearDownInputController");
    objc_storeStrong((id *)&self->_deferredSystemView, a3);
    v5 = v6;
  }

}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
  return 1;
}

- (void)killIncomingExtension
{
  void *v3;
  UIKeyboardInputMode *incomingExtensionInputMode;

  -[UIKeyboardInputMode extension](self->_incomingExtensionInputMode, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_kill:", 3);

  incomingExtensionInputMode = self->_incomingExtensionInputMode;
  self->_incomingExtensionInputMode = 0;

}

- (void)didSuspend:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[UICompatibilityInputViewController didMoveToParentViewController:](self, "didMoveToParentViewController:", 0);
  self->_shouldSuppressRemoteInputController = 1;
  self->_lastSuspendedTime = CFAbsoluteTimeGetCurrent();
  if (self->_incomingExtensionInputMode)
  {
    if (CFAbsoluteTimeGetCurrent() - self->_incomingExtensionInputModeTime > 0.5)
    {
      -[UICompatibilityInputViewController killIncomingExtension](self, "killIncomingExtension");
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "currentSystemInputMode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setKeyboardInputMode:userInitiated:", v5, 1);

    }
  }
}

- (void)isHosted:(id)a3
{
  if (self->_shouldSuppressRemoteInputController)
    -[UICompatibilityInputViewController willResume:](self, "willResume:", a3);
}

- (void)willResume:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  UIKeyboardInputMode *incomingExtensionInputMode;
  id v8;

  self->_shouldSuppressRemoteInputController = 0;
  self->_currentResumeTime = CFAbsoluteTimeGetCurrent();
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (v8 = v4, v5 = -[UIKeyboardInputMode isExtensionInputMode](self->_inputMode, "isExtensionInputMode"), v4 = v8, v5))
  {
    -[UICompatibilityInputViewController inputController](self, "inputController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      incomingExtensionInputMode = self->_incomingExtensionInputMode;

      if (!incomingExtensionInputMode)
        -[UICompatibilityInputViewController setInputMode:](self, "setInputMode:", self->_inputMode);
    }
  }
  else
  {

  }
}

+ (void)applicationDidReceiveMemoryWarning:(id)a3
{
  objc_msgSend((id)__snapshotViews, "removeAllObjects", a3);
}

+ (id)inputSnapshotViewForInputMode:(id)a3 orientation:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)__snapshotViews;
  objc_msgSend(a3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("%d"), (unint64_t)(a4 - 3) < 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)takeSnapshotView
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__UICompatibilityInputViewController_takeSnapshotView__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

void __54__UICompatibilityInputViewController_takeSnapshotView__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "isExtensionInputMode"))
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "window");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)v2;
      objc_msgSend(*(id *)(a1 + 32), "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "size");
      v6 = v5;

      if (v6 <= 0.0)
        return;
      if (!__snapshotViews)
      {
        v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v8 = (void *)__snapshotViews;
        __snapshotViews = (uint64_t)v7;

      }
      objc_msgSend(*(id *)(a1 + 32), "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_rootInputWindowController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "inputViewSnapshotOfView:afterScreenUpdates:", v11, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      v12 = v17;
      if (!v17)
        goto LABEL_10;
      objc_msgSend(v17, "size");
      if (v13 > 0.0)
      {
        v14 = (void *)__snapshotViews;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("%d"), (unint64_t)(+[UIKeyboardSceneDelegate interfaceOrientation](UIKeyboardSceneDelegate, "interfaceOrientation")- 3) < 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v17, v16);

      }
    }
    v12 = v17;
LABEL_10:

  }
}

- (void)addSnapshotViewForInputMode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[UICompatibilityInputViewController _compatibilityController](self, "_compatibilityController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_compatView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UICompatibilityInputViewController _compatibilityController](self, "_compatibilityController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_compatView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "snapshotView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend((id)objc_opt_class(), "inputSnapshotViewForInputMode:orientation:", v19, +[UIKeyboardSceneDelegate interfaceOrientation](UIKeyboardSceneDelegate, "interfaceOrientation"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_layout");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController view](self, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "updateGlobeKeyAndLayoutOriginBeforeSnapshotForInputView:", v12);

        -[UIViewController view](self, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_rootInputWindowController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController view](self, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "inputViewSnapshotOfView:afterScreenUpdates:", v15, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[UIViewController view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addSubview:", v9);

      -[UICompatibilityInputViewController _compatibilityController](self, "_compatibilityController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_compatView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSnapshotView:", v9);

    }
  }

}

- (void)resetInputModeInMainThread
{
  double Current;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16[2];
  id location;

  Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_resetInputModeTime >= 0.3 && !self->_shouldSuppressRemoteInputController)
  {
    -[UIKeyboardInputMode identifier](self->_inputMode, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v4);

    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "switchToCurrentSystemInputMode");

    if (-[UIKeyboardInputMode isExtensionInputMode](self->_inputMode, "isExtensionInputMode"))
    {
      v6 = (void *)_MergedGlobals_15_1;
      v7 = objc_loadWeakRetained(&location);
      objc_msgSend(v6, "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        if (Current - self->_resetInputModeTime > 3.0)
        {
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __64__UICompatibilityInputViewController_resetInputModeInMainThread__block_invoke;
          v15[3] = &unk_1E16CD6E0;
          objc_copyWeak(v16, &location);
          v15[4] = self;
          v16[1] = *(id *)&Current;
          dispatch_async(MEMORY[0x1E0C80D38], v15);
          objc_destroyWeak(v16);
        }
      }
      else
      {
        +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_inputModeChangedWhileContextTracked");

        +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "preferencesActions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "currentInputMode");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setLanguageAwareInputModeLastUsed:", v14);

      }
    }
    objc_destroyWeak(&location);
  }
}

void __64__UICompatibilityInputViewController_resetInputModeInMainThread__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInputMode:", WeakRetained);

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1064) = *(_QWORD *)(a1 + 48);
}

- (void)resetInputMode
{
  void *v3;
  _QWORD block[5];

  +[_UIKeyboardUsageTracking keyboardExtensionCrashed](_UIKeyboardUsageTracking, "keyboardExtensionCrashed");
  -[UIKeyboardInputMode extension](self->_inputMode, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRequestInterruptionBlock:", 0);

  if (pthread_main_np() == 1)
  {
    -[UICompatibilityInputViewController resetInputModeInMainThread](self, "resetInputModeInMainThread");
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__UICompatibilityInputViewController_resetInputMode__block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __52__UICompatibilityInputViewController_resetInputMode__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetInputModeInMainThread");
}

- (void)assertCurrentInputModeIfNecessary
{
  UIKeyboardInputMode *inputMode;
  void *v4;
  id v5;

  inputMode = self->_inputMode;
  if (inputMode && !-[UIKeyboardInputMode isDisplayed](inputMode, "isDisplayed"))
  {
    -[UICompatibilityInputViewController setInputMode:](self, "setInputMode:", self->_inputMode);
  }
  else
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentInputMode");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "isDisplayed") & 1) == 0)
      -[UICompatibilityInputViewController setInputMode:](self, "setInputMode:", v5);

  }
}

- (void)validateInputModeIsDisplayed
{
  UIKeyboardInputMode *inputMode;

  inputMode = self->_inputMode;
  if (inputMode)
  {
    if (!-[UIKeyboardInputMode isDisplayed](inputMode, "isDisplayed"))
      -[UICompatibilityInputViewController setInputMode:](self, "setInputMode:", self->_inputMode);
  }
}

- (void)setTearingDownInputController
{
  self->_tearingDownInputController = 1;
}

void __51__UICompatibilityInputViewController_setInputMode___block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__UICompatibilityInputViewController_setInputMode___block_invoke_3;
  block[3] = &unk_1E16B1B28;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __51__UICompatibilityInputViewController_setInputMode___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetInputMode");
}

void __51__UICompatibilityInputViewController_setInputMode___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _UITextDocumentInterface *v16;
  void *v17;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  CFAbsoluteTime Current;
  uint64_t v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  float v40;
  float v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  _QWORD block[5];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v10 + 1024) == *(_QWORD *)(v10 + 1008) && !*(_BYTE *)(v10 + 1057))
  {
    if (v8)
    {
      objc_msgSend((id)v10, "removeSnapshotView");
      objc_msgSend(*(id *)(a1 + 32), "setInputController:", v8);
      v15 = *(void **)(a1 + 32);
      v16 = objc_alloc_init(_UITextDocumentInterface);
      objc_msgSend(v15, "_setTextDocumentProxy:", v16);

      objc_msgSend(*(id *)(a1 + 40), "extension");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_extensionContextForUUID:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_proxyInterface");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setForwardingInterface:", v18);

      v20 = *(void **)(a1 + 32);
      objc_msgSend(v20, "inputController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addChildViewController:", v21);

      objc_msgSend(*(id *)(a1 + 32), "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "inputController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addSubview:", v24);

      objc_msgSend(*(id *)(a1 + 32), "_compatView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "inputController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setTouchableView:", v27);

      objc_msgSend(*(id *)(a1 + 32), "inputController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "didMoveToParentViewController:", *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(a1 + 32), "rebuildChildConstraints");
      objc_msgSend(*(id *)(a1 + 32), "inputController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "size");
      +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "setSplitWidthsChanged:", 1);
      objc_msgSend(v31, "setUpdateAssistantView:", 1);
      objc_msgSend(*(id *)(a1 + 32), "view");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "superview");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "_didChangeKeyplaneWithContext:", v31);

      Current = CFAbsoluteTimeGetCurrent();
      v35 = *(_QWORD *)(a1 + 32);
      v36 = Current - *(double *)(v35 + 1032);
      v37 = (void *)_MergedGlobals_15_1;
      objc_msgSend(*(id *)(v35 + 1024), "identifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKey:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "floatValue");
      v41 = v40;
      v42 = v40;

      if (v41 == 0.0 || vabdd_f64(v36, v42) > 0.2)
      {
        v43 = (v36 + v42) * 0.5;
        if (v41 <= 0.0)
          v43 = v36;
        v44 = (void *)_MergedGlobals_15_1;
        *(float *)&v43 = v43;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "identifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKey:", v45, v46);

      }
      objc_msgSend(*(id *)(a1 + 32), "takeSnapshotView");
      +[UIAssistantBarButtonItemProvider updateFloatingAssistantBarIfNeeded](UIAssistantBarButtonItemProvider, "updateFloatingAssistantBarIfNeeded");

    }
    else if (v9)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__UICompatibilityInputViewController_setInputMode___block_invoke_5;
      block[3] = &unk_1E16B1B28;
      block[4] = v10;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    v47 = *(_QWORD *)(a1 + 32);
    v48 = *(void **)(v47 + 1024);
    *(_QWORD *)(v47 + 1024) = 0;

  }
  else if (!objc_msgSend(*(id *)(v10 + 1008), "isExtensionInputMode")
         || *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1057))
  {
    objc_msgSend(*(id *)(a1 + 40), "extension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_extensionContextForUUID:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "_tearDownRemoteService");
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 1024);
    *(_QWORD *)(v13 + 1024) = 0;

  }
}

void __51__UICompatibilityInputViewController_setInputMode___block_invoke_5(uint64_t a1)
{
  CFAbsoluteTime Current;
  double *v3;
  id v4;

  Current = CFAbsoluteTimeGetCurrent();
  v3 = *(double **)(a1 + 32);
  if (Current - v3[133] >= 0.3)
  {
    objc_msgSend(v3, "resetInputMode");
  }
  else
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "switchToCurrentSystemInputMode");

  }
}

void __51__UICompatibilityInputViewController_setInputMode___block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 1072) == *(_QWORD *)(a1 + 40))
  {
    v3 = *(void **)(v1 + 1024);
    if (v3 == *(void **)(v1 + 1008) && !*(_BYTE *)(v1 + 1057))
    {
      objc_msgSend(v3, "identifier");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "killIncomingExtension");
      objc_msgSend(*(id *)(a1 + 32), "resetInputMode");
      objc_msgSend((id)_MergedGlobals_15_1, "removeObjectForKey:", v4);

    }
  }
}

void __51__UICompatibilityInputViewController_setInputMode___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  _UITextDocumentInterface *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  uint64_t v23;
  void *v24;
  id v25;

  v25 = a2;
  if (v25)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("autofillsignup"));

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "removeSnapshotView");
      objc_msgSend(*(id *)(a1 + 32), "setInputController:", v25);
      v5 = *(void **)(a1 + 32);
      v6 = objc_alloc_init(_UITextDocumentInterface);
      objc_msgSend(v5, "_setTextDocumentProxy:", v6);

      v7 = *(void **)(a1 + 32);
      objc_msgSend(v7, "inputController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addChildViewController:", v8);

      objc_msgSend(*(id *)(a1 + 32), "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "inputController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", v11);

      objc_msgSend(*(id *)(a1 + 32), "_compatView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "inputController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTouchableView:", v14);

      objc_msgSend(*(id *)(a1 + 32), "inputController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "didMoveToParentViewController:", *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(a1 + 32), "rebuildChildConstraints");
      objc_msgSend(*(id *)(a1 + 32), "inputController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "size");
      +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setSplitWidthsChanged:", 1);
      objc_msgSend(*(id *)(a1 + 32), "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "superview");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_didChangeKeyplaneWithContext:", v18);

      objc_msgSend(*(id *)(a1 + 32), "takeSnapshotView");
LABEL_8:

    }
  }
  else
  {
    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
      objc_msgSend(*(id *)(a1 + 40), "clearViewControllerClass");
    objc_msgSend(*(id *)(a1 + 32), "resetInputMode");
    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setSkipRecomputeInputMode:", 1);

      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "forceReloadInputViews");

      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSkipRecomputeInputMode:", 0);
      goto LABEL_8;
    }
  }
  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(void **)(v23 + 1024);
  *(_QWORD *)(v23 + 1024) = 0;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)preferredFocusedView
{
  void *v2;
  void *v3;

  -[UICompatibilityInputViewController inputController](self, "inputController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)keyboardWillChangeFromDelegate:(id)a3 toDelegate:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[UICompatibilityInputViewController inputController](self, "inputController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[UICompatibilityInputViewController inputController](self, "inputController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "keyboardWillChangeFromDelegate:toDelegate:", v10, v6);

  }
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  -[UICompatibilityInputViewController _keyboardForThisViewController](self, "_keyboardForThisViewController", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isActive");

  if (v7)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "prepareLayoutForInterfaceOrientation:", a3);

  }
  -[UICompatibilityInputViewController inputController](self, "inputController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    goto LABEL_4;
  -[UIViewController childViewControllers](self, "childViewControllers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    -[UICompatibilityInputViewController _compatView](self, "_compatView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "touchableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "_hasAutolayoutHeightConstraint"))
    {
      if (v9)
      {
        v15 = objc_msgSend(v9, "_disableLayoutFlushingCount");
        if (v15 >= 1)
          v16 = v15 + 1;
        else
          v16 = 1;
        objc_msgSend(v9, "_setDisableLayoutFlushingCount:", v16);
        objc_msgSend(v9, "_disableLayoutFlushing");
      }
      objc_msgSend(v9, "_removeAutolayoutSizingConstraints");
      self->_shouldRegenerateSizingConstraints = 1;
    }
LABEL_4:

  }
  +[UIInputSwitcherView activeInstance](UIInputSwitcherView, "activeInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isVisible");

  if (v11)
  {
    +[UIInputSwitcherView activeInstance](UIInputSwitcherView, "activeInstance");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hide");

  }
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  void *v6;
  int v7;
  id v8;

  -[UICompatibilityInputViewController _keyboardForThisViewController](self, "_keyboardForThisViewController", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isActive");

  if (v7)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateLayoutToCurrentInterfaceOrientation");

  }
  else
  {
    -[UIKeyboard setOrientation:](self->_deferredSystemView, "setOrientation:", a3);
  }
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  -[UICompatibilityInputViewController _keyboardForThisViewController](self, "_keyboardForThisViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");

  if (v5)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishLayoutToCurrentInterfaceOrientation");

  }
  -[UICompatibilityInputViewController inputController](self, "inputController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    goto LABEL_7;
  -[UIViewController childViewControllers](self, "childViewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 && self->_shouldRegenerateSizingConstraints)
  {
    self->_shouldRegenerateSizingConstraints = 0;
    -[UICompatibilityInputViewController _compatView](self, "_compatView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "touchableView");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "_convertToAutolayoutSizingIfNecessary");
    -[UIView _popDisableLayoutFlushing](v11);
    v7 = v11;
LABEL_7:

  }
}

- (void)willBeginTranslation
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[UICompatibilityInputViewController _keyboard](self, "_keyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActive");

  if (v4)
  {
    if (!-[UIInputViewController _isPlaceholder](self, "_isPlaceholder"))
    {
      -[UICompatibilityInputViewController blinkAssertion](self, "blinkAssertion");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "invalidate");

      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_activeAssertionController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "nonBlinkingAssertionWithReason:", CFSTR("Split/Floating Keyboard Translation"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICompatibilityInputViewController setBlinkAssertion:](self, "setBlinkAssertion:", v8);

      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "autocorrectPrompt");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "prepareForGeometryChange");

      }
    }
    -[UICompatibilityInputViewController _keyboard](self, "_keyboard");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "showsCandidateBar");

      if (v15)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "candidateController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v17, "barIsExtended"))
          objc_msgSend(v17, "collapse");

      }
    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_layout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "deactivateActiveKeys");

  }
}

- (void)finishSplitTransition:(BOOL)a3
{
  void (**v5)(_QWORD);
  void *v6;
  int v7;
  void *v8;
  void *v9;
  _QWORD aBlock[4];
  BOOL v11;

  if (!-[UIInputViewController _isPlaceholder](self, "_isPlaceholder"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__UICompatibilityInputViewController_finishSplitTransition___block_invoke;
    aBlock[3] = &__block_descriptor_33_e5_v8__0l;
    v11 = a3;
    v5 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[UICompatibilityInputViewController _keyboard](self, "_keyboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isActive");

    if (v7)
    {
      v5[2](v5);
    }
    else
    {
      -[UICompatibilityInputViewController _keyboard](self, "_keyboard");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 == v9)
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);
    }

  }
}

void __60__UICompatibilityInputViewController_finishSplitTransition___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  if (+[UIKeyboardImpl rivenPreference](UIKeyboardImpl, "rivenPreference"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v2;
    v3 = 1.0;
    if (!*(_BYTE *)(a1 + 32))
      v3 = 0.0;
    objc_msgSend(v2, "finishSplitTransitionWithProgress:", v3);

  }
}

- (void)didFinishTranslation
{
  BOOL v3;
  void *v4;
  void *v5;
  id v6;

  -[UICompatibilityInputViewController _keyboard](self, "_keyboard");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isActive"))
    goto LABEL_5;
  v3 = -[UIInputViewController _isPlaceholder](self, "_isPlaceholder");

  if (!v3)
  {
    -[UICompatibilityInputViewController blinkAssertion](self, "blinkAssertion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[UICompatibilityInputViewController setBlinkAssertion:](self, "setBlinkAssertion:", 0);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v5, "geometryIsChanging");

    if ((_DWORD)v4)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "geometryChangeDone:", 1);
LABEL_5:

    }
  }
}

- (void)_tvUpdateAppearanceForUserInterfaceStyle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[UIViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == 1000 || v4 == 2)
  {
    +[UIKBRenderConfig darkConfig](UIKBRenderConfig, "darkConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIKBRenderConfig defaultConfig](UIKBRenderConfig, "defaultConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  v7 = v5;

  -[UIViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setRenderConfig:", v7);

}

- (UILayoutGuide)focusSafeAreaLayoutGuide
{
  UILayoutGuide *focusSafeAreaLayoutGuide;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UILayoutGuide *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UILayoutGuide *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[6];

  v34[4] = *MEMORY[0x1E0C80C00];
  focusSafeAreaLayoutGuide = self->_focusSafeAreaLayoutGuide;
  if (!focusSafeAreaLayoutGuide)
  {
    +[UIKeyboard _keyboardFocusGuideMargins](UIKeyboard, "_keyboardFocusGuideMargins");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v12 = objc_alloc_init(UILayoutGuide);
    -[UIViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addLayoutGuide:", v12);

    v26 = (void *)MEMORY[0x1E0D156E0];
    -[UILayoutGuide topAnchor](v12, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, v5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v30;
    -[UILayoutGuide leftAnchor](v12, "leftAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leftAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, v7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v25;
    -[UIViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v12, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v14, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v15;
    -[UIViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide rightAnchor](v12, "rightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v20);

    v21 = self->_focusSafeAreaLayoutGuide;
    self->_focusSafeAreaLayoutGuide = v12;

    focusSafeAreaLayoutGuide = self->_focusSafeAreaLayoutGuide;
  }
  return focusSafeAreaLayoutGuide;
}

- (UITextCursorAssertion)blinkAssertion
{
  return self->_blinkAssertion;
}

- (void)setBlinkAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_blinkAssertion, a3);
}

@end
