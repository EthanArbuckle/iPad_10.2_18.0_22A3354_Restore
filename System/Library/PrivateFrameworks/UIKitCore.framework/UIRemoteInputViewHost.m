@implementation UIRemoteInputViewHost

- (void)setInputViewSet:(id)a3
{
  UIInputViewSet *v4;
  NSObject *v5;
  UIView *inputView;
  UIView *v7;
  void *v8;
  void *v9;
  void *v10;
  UIInputViewController *inputViewController;
  NSObject *v12;
  UIView *v13;
  UIView *v14;
  NSLayoutConstraint *inputViewHeightConstraint;
  UIInputViewSet *inputViewSet;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (UIInputViewSet *)a3;
  _UIRemoteInputViewHostLogger();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v4;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "UIRemoteInputViewHost, setInputViewSet: %@", (uint8_t *)&v17, 0xCu);
  }

  inputView = self->_inputView;
  if (inputView)
  {
    -[UIInputViewSet hostedCustomInputView](v4, "hostedCustomInputView");
    v7 = (UIView *)objc_claimAutoreleasedReturnValue();

    if (inputView != v7)
    {
      -[UIViewController willMoveToParentViewController:](self->_inputViewController, "willMoveToParentViewController:", 0);
      -[UIViewController view](self->_inputRootViewController, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self->_inputRootViewController, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraints");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeConstraints:", v10);

      -[UIView removeFromSuperview](self->_inputView, "removeFromSuperview");
      -[UIViewController removeFromParentViewController](self->_inputViewController, "removeFromParentViewController");
      inputViewController = self->_inputViewController;
      self->_inputViewController = 0;

      _UIRemoteInputViewHostLogger();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = self->_inputView;
        v17 = 138412290;
        v18 = v13;
        _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "UIRemoteInputViewHost will nil inputView: %@", (uint8_t *)&v17, 0xCu);
      }

      v14 = self->_inputView;
      self->_inputView = 0;

      inputViewHeightConstraint = self->_inputViewHeightConstraint;
      self->_inputViewHeightConstraint = 0;

    }
  }
  if (!v4)
    -[UIRemoteInputViewHost setShouldShowDockView:](self, "setShouldShowDockView:", 0);
  inputViewSet = self->_inputViewSet;
  self->_inputViewSet = v4;

}

- (UIRemoteInputViewInfo)assistantViewInfo
{
  UIRemoteInputViewInfo *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  v3 = objc_alloc_init(UIRemoteInputViewInfo);
  -[UIRemoteInputViewInfo setContextId:](v3, "setContextId:", -[UIWindow _contextId](self->_assistantViewWindow, "_contextId"));
  -[UIInputViewSet assistantViewController](self->_inputViewSet, "assistantViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  -[UIRemoteInputViewInfo setSize:](v3, "setSize:", v6, v7);

  if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", sel_insets))
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    -[UIRemoteInputViewInfo setInsets:](v3, "setInsets:", v9 * 0.5, 0.0, 50.0, 0.0);

  }
  return v3;
}

- (UIEdgeInsets)assistantViewInsets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
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
  double v16;
  double v17;
  UIEdgeInsets result;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerRootController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentInputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardImpl deviceSpecificPaddingForInterfaceOrientation:inputMode:](UIKeyboardImpl, "deviceSpecificPaddingForInterfaceOrientation:inputMode:", objc_msgSend(v3, "keyboardOrientation"), v5);
  v7 = v6;
  v9 = v8;
  +[UIKeyboardImpl deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:](UIKeyboardImpl, "deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:", objc_msgSend(v3, "keyboardOrientation"), v5);
  v11 = v7 - v10;
  v13 = -(v9 - v12);

  v14 = 0.0;
  v15 = 0.0;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v15;
  result.left = v16;
  result.top = v14;
  return result;
}

- (BOOL)updateAssistantViewIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIWindow *assistantViewWindow;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  _UIRemoteInputViewHostWindow *v24;
  UIWindow *v25;
  _UIRemoteInputViewHostViewController *v26;
  UIViewController *assistantViewController;
  void *v28;
  UIViewController *v29;
  UIViewController *v30;
  UIViewController *v31;
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
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  _BOOL4 v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIWindowScene _keyboardWindowSceneForScreen:create:](UIWindowScene, "_keyboardWindowSceneForScreen:create:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIRemoteInputViewHost settingsScene](self, "settingsScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setSettingsScene:", v5);

  -[UIInputViewSet inputAssistantView](self->_inputViewSet, "inputAssistantView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  assistantViewWindow = self->_assistantViewWindow;
  if (v6)
  {
    if (assistantViewWindow)
    {
      -[UIWindow windowScene](assistantViewWindow, "windowScene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 != v4)
      {
        -[UIWindow setWindowScene:](self->_assistantViewWindow, "setWindowScene:", v4);
        -[UIWindow setRootViewController:](self->_assistantViewWindow, "setRootViewController:", self->_assistantViewController);
      }
    }
    else
    {
      v24 = -[_UIRemoteInputViewHostWindow initWithWindowScene:]([_UIRemoteInputViewHostWindow alloc], "initWithWindowScene:", v4);
      v25 = self->_assistantViewWindow;
      self->_assistantViewWindow = &v24->super.super.super;

      v26 = objc_alloc_init(_UIRemoteInputViewHostViewController);
      assistantViewController = self->_assistantViewController;
      self->_assistantViewController = &v26->super;

      -[UIWindow setRootViewController:](self->_assistantViewWindow, "setRootViewController:", self->_assistantViewController);
      -[UIWindow setHidden:](self->_assistantViewWindow, "setHidden:", 0);
    }
    -[UIInputViewSet assistantViewController](self->_inputViewSet, "assistantViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "parentViewController");
    v29 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    v30 = self->_assistantViewController;

    if (v29 != v30)
    {
      v31 = self->_assistantViewController;
      -[UIInputViewSet assistantViewController](self->_inputViewSet, "assistantViewController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController addChildViewController:](v31, "addChildViewController:", v32);

      -[UIViewController view](self->_assistantViewController, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputViewSet inputAssistantView](self->_inputViewSet, "inputAssistantView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addSubview:", v34);

      -[UIInputViewSet assistantViewController](self->_inputViewSet, "assistantViewController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "didMoveToParentViewController:", self->_assistantViewController);

      -[UIViewController view](self->_assistantViewController, "view");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

    }
    -[UIInputViewSet assistantViewController](self->_inputViewSet, "assistantViewController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "delegate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "automaticallySetCenterViewControllerBasedOnInputDelegate:", v39);

    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "containerRootController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView bounds](self->_assistantViewWindow, "bounds");
    v43 = v42;
    v45 = v44;
    -[UIInputViewSet inputAssistantView](self->_inputViewSet, "inputAssistantView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "traitCollection");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "preferredHeightForTraitCollection:", v47);
    v49 = v48;

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v50, "isMinimized"))
    {
      v51 = +[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton");

      if (!v51)
        v49 = v49 + 14.0;
    }
    else
    {

    }
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "bounds");

    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "bounds");
    v55 = v54;

    -[UIRemoteInputViewHost assistantViewInsets](self, "assistantViewInsets");
    v58 = v55 - (v56 - v57);
    -[UIRemoteInputViewHost assistantViewInfo](self, "assistantViewInfo");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "insets");
    v61 = v60;

    -[UIViewController view](self->_assistantViewController, "view");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setFrame:", v43, v61, v58, v49);

    -[UIInputViewSet inputAssistantView](self->_inputViewSet, "inputAssistantView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

    -[UIInputViewSet inputAssistantView](self->_inputViewSet, "inputAssistantView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setFrame:", v43, v45, v58, v49);

    objc_msgSend(v37, "view");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "layoutIfNeeded");

    objc_msgSend(v37, "view");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v66, "isHidden") ^ 1;

  }
  else
  {
    -[UIWindow rootViewController](assistantViewWindow, "rootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "childViewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      -[UIWindow rootViewController](self->_assistantViewWindow, "rootViewController", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "childViewControllers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v69 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
            objc_msgSend(v18, "willMoveToParentViewController:", 0);
            objc_msgSend(v18, "view");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "view");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "constraints");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "removeConstraints:", v21);

            objc_msgSend(v18, "view");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "removeFromSuperview");

            objc_msgSend(v18, "removeFromParentViewController");
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
        }
        while (v15);
      }

    }
    LOBYTE(v23) = 0;
  }

  return v23;
}

- (BOOL)updateCustomInputViewIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIInputViewController *v8;
  UIInputViewController *inputViewController;
  UIWindow *inputViewWindow;
  void *v11;
  int v12;
  BOOL v13;
  _UIRemoteInputViewHostWindow *v14;
  UIWindow *v15;
  _UIRemoteInputViewHostViewController *v16;
  UIViewController *inputRootViewController;
  void *v18;
  void *v19;
  void *v20;
  UIView *inputView;
  UIView *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UIView *v27;
  UIView *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSLayoutConstraint *v41;
  NSLayoutConstraint *inputViewWidthConstraint;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSLayoutConstraint *v50;
  NSLayoutConstraint *inputViewBottomConstraint;
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
  double v66;
  double v67;
  NSLayoutConstraint *inputViewHeightConstraint;
  NSLayoutConstraint *v69;
  uint64_t v70;
  NSLayoutConstraint *v71;
  double v72;
  NSLayoutConstraint *v73;
  _BOOL4 v74;
  double v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIWindowScene _keyboardWindowSceneForScreen:create:](UIWindowScene, "_keyboardWindowSceneForScreen:create:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIRemoteInputViewHost settingsScene](self, "settingsScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setSettingsScene:", v5);

  -[UIInputViewSet hostedCustomInputView](self->_inputViewSet, "hostedCustomInputView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIInputViewSet hostedCustomInputView](self->_inputViewSet, "hostedCustomInputView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UICompatibilityInputViewController inputViewControllerWithView:](UICompatibilityInputViewController, "inputViewControllerWithView:", v7);
    v8 = (UIInputViewController *)objc_claimAutoreleasedReturnValue();
    inputViewController = self->_inputViewController;
    self->_inputViewController = v8;

    inputViewWindow = self->_inputViewWindow;
    if (inputViewWindow)
    {
      -[UIWindow windowScene](self->_inputViewWindow, "windowScene");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 != v4)
      {
        -[UIWindow setWindowScene:](self->_inputViewWindow, "setWindowScene:", v4);
        v12 = 1;
        goto LABEL_8;
      }
    }
    else
    {
      v14 = -[_UIRemoteInputViewHostWindow initWithWindowScene:]([_UIRemoteInputViewHostWindow alloc], "initWithWindowScene:", v4);
      v15 = self->_inputViewWindow;
      self->_inputViewWindow = &v14->super.super.super;

      v16 = objc_alloc_init(_UIRemoteInputViewHostViewController);
      inputRootViewController = self->_inputRootViewController;
      self->_inputRootViewController = &v16->super;

      -[UIWindow setHostWindowDelegate:](self->_inputViewWindow, "setHostWindowDelegate:", self);
      -[UIWindow setRootViewController:](self->_inputViewWindow, "setRootViewController:", self->_inputRootViewController);
      -[UIWindow setHidden:](self->_inputViewWindow, "setHidden:", 0);
      -[UIViewController view](self->_inputRootViewController, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[UIViewController view](self->_inputRootViewController, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setHitTestsAsOpaque:", 1);

    }
    v12 = 0;
LABEL_8:
    inputView = self->_inputView;
    -[UIViewController view](self->_inputViewController, "view");
    v22 = (UIView *)objc_claimAutoreleasedReturnValue();

    if (inputView != v22)
    {
      +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", self->_inputView);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "willMoveToParentViewController:", 0);
      -[UIViewController view](self->_inputRootViewController, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self->_inputRootViewController, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraints");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeConstraints:", v26);

      -[UIView removeFromSuperview](self->_inputView, "removeFromSuperview");
      objc_msgSend(v23, "removeFromParentViewController");
      -[UIViewController view](self->_inputViewController, "view");
      v27 = (UIView *)objc_claimAutoreleasedReturnValue();
      v28 = self->_inputView;
      self->_inputView = v27;

      v12 = 1;
    }
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    v31 = v30;

    if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
    {
      +[UIKeyboardImpl floatingWidth](UIKeyboardImpl, "floatingWidth");
      v31 = v32;
    }
    -[UIView superview](self->_inputView, "superview");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self->_inputRootViewController, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33 != v34)
    {
      -[UIViewController willMoveToParentViewController:](self->_inputViewController, "willMoveToParentViewController:", 0);
      -[UIViewController view](self->_inputRootViewController, "view");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self->_inputRootViewController, "view");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraints");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "removeConstraints:", v37);

      -[UIView removeFromSuperview](self->_inputView, "removeFromSuperview");
      -[UIViewController removeFromParentViewController](self->_inputViewController, "removeFromParentViewController");
      -[UIViewController addChildViewController:](self->_inputRootViewController, "addChildViewController:", self->_inputViewController);
      -[UIViewController view](self->_inputRootViewController, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addSubview:", self->_inputView);

      -[UIViewController didMoveToParentViewController:](self->_inputViewController, "didMoveToParentViewController:", self->_inputRootViewController);
      -[UIViewController view](self->_inputRootViewController, "view");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "widthAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraintEqualToConstant:", v31);
      v41 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      inputViewWidthConstraint = self->_inputViewWidthConstraint;
      self->_inputViewWidthConstraint = v41;

      v12 = 1;
      -[NSLayoutConstraint setActive:](self->_inputViewWidthConstraint, "setActive:", 1);
      -[UIViewController view](self->_inputRootViewController, "view");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "topAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self->_inputView, "topAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintEqualToAnchor:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setActive:", 1);

      -[UIViewController view](self->_inputRootViewController, "view");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "bottomAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_inputView, "bottomAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "constraintEqualToAnchor:", v49);
      v50 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      inputViewBottomConstraint = self->_inputViewBottomConstraint;
      self->_inputViewBottomConstraint = v50;

      -[NSLayoutConstraint setActive:](self->_inputViewBottomConstraint, "setActive:", 1);
      -[UIViewController view](self->_inputRootViewController, "view");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "leadingAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self->_inputView, "leadingAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "constraintEqualToAnchor:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setActive:", 1);

      -[UIViewController view](self->_inputRootViewController, "view");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "trailingAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_inputView, "trailingAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "constraintEqualToAnchor:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setActive:", 1);

      -[UIViewController view](self->_inputRootViewController, "view");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "bottomAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_inputViewWindow, "bottomAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "constraintEqualToAnchor:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setActive:", 1);

    }
    if (SubviewUsesClassicLayout(self->_inputView))
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "containerRootController");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "sizeForInputViewController:inputView:", self->_inputViewController, self->_inputView);
      v67 = v66;

      inputViewHeightConstraint = self->_inputViewHeightConstraint;
      if (inputViewHeightConstraint)
      {
        -[NSLayoutConstraint setConstant:](inputViewHeightConstraint, "setConstant:", v67);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_inputView, 8, 0, 0, 0, 0.0, v67);
        v71 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
        LODWORD(v72) = 1148846080;
        -[NSLayoutConstraint setPriority:](v71, "setPriority:", v72);
        -[NSLayoutConstraint setIdentifier:](v71, "setIdentifier:", CFSTR("inputHeight"));
        v73 = self->_inputViewHeightConstraint;
        self->_inputViewHeightConstraint = v71;

      }
      v69 = self->_inputViewHeightConstraint;
      v12 = 1;
      v70 = 1;
    }
    else
    {
      v69 = self->_inputViewHeightConstraint;
      if (!v69)
        goto LABEL_22;
      v70 = 0;
    }
    -[NSLayoutConstraint setActive:](v69, "setActive:", v70);
LABEL_22:
    v74 = -[UIRemoteInputViewHost shouldShowDockView](self, "shouldShowDockView");
    v75 = 75.0;
    if (!v74)
      v75 = 0.0;
    -[NSLayoutConstraint setConstant:](self->_inputViewBottomConstraint, "setConstant:", v75);
    -[NSLayoutConstraint setConstant:](self->_inputViewWidthConstraint, "setConstant:", v31);
    -[UIRemoteInputViewHost inputViewSet](self, "inputViewSet");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "hostedCustomInputView");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "frame");
    v79 = v78;
    v81 = v80;

    if (self->_previousInputViewSize.width == v79 && self->_previousInputViewSize.height == v81)
    {
      if (!inputViewWindow)
        goto LABEL_30;
    }
    else
    {
      self->_previousInputViewSize.width = v79;
      self->_previousInputViewSize.height = v81;
      v12 = 1;
      if (!inputViewWindow)
        goto LABEL_30;
    }
    -[UIView frame](self->_inputView, "frame");
    if (v82 != 0.0)
    {
LABEL_31:
      v13 = v12 != 0;
      goto LABEL_32;
    }
LABEL_30:
    -[UIView layoutIfNeeded](self->_inputViewWindow, "layoutIfNeeded");
    v12 = 1;
    goto LABEL_31;
  }
  v13 = 0;
LABEL_32:

  return v13;
}

- (void)updateInputViewsIfNecessary
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  int v9;
  _BOOL4 v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (+[UIKeyboard usesLocalKeyboard](UIKeyboard, "usesLocalKeyboard"))
  {
    -[UIInputViewSet inputAssistantView](self->_inputViewSet, "inputAssistantView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    _UIRemoteInputViewHostLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 67109120;
      v10 = +[UIKeyboard usesLocalKeyboard](UIKeyboard, "usesLocalKeyboard");
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "UIRemoteInputViewHost, updateInputViewsIfNecessary useLocal %d", (uint8_t *)&v9, 8u);
    }
    goto LABEL_8;
  }
  v5 = -[UIRemoteInputViewHost updateAssistantViewIfNecessary](self, "updateAssistantViewIfNecessary");
  v6 = -[UIRemoteInputViewHost updateCustomInputViewIfNecessary](self, "updateCustomInputViewIfNecessary");
  _UIRemoteInputViewHostLogger();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 67109376;
    v10 = v5;
    v11 = 1024;
    v12 = v6;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "UIRemoteInputViewHost, assistantViewNeedsUpdate: %d, customInputViewNeedsUpdate: %d", (uint8_t *)&v9, 0xEu);
  }

  if (v5 || v6)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteTextInputPartner](v4, "remoteTextInputPartner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "documentTraitsChanged");

LABEL_8:
  }
}

- (UIRemoteInputViewInfo)inputViewInfo
{
  UIRemoteInputViewInfo *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  double v10;
  double v11;
  double v12;

  if (-[UIInputViewSet isCustomInputView](self->_inputViewSet, "isCustomInputView"))
  {
    v3 = objc_alloc_init(UIRemoteInputViewInfo);
    -[UIRemoteInputViewInfo setContextId:](v3, "setContextId:", -[UIWindow _contextId](self->_inputViewWindow, "_contextId"));
    -[UIViewController view](self->_inputViewController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;

    v9 = -[UIRemoteInputViewHost shouldShowDockView](self, "shouldShowDockView");
    v10 = -0.0;
    if (v9)
      v10 = 75.0;
    v11 = v8 + v10;
    -[UIRemoteInputViewInfo setSize:](v3, "setSize:", v6, v11);
    -[UIView frame](self->_inputViewWindow, "frame");
    -[UIRemoteInputViewInfo setInsets:](v3, "setInsets:", v12 - v11, 0.0, 0.0, 0.0);
    -[UIRemoteInputViewInfo setShouldShowDockView:](v3, "setShouldShowDockView:", -[UIRemoteInputViewHost shouldShowDockView](self, "shouldShowDockView"));
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)rtiGroupsForBarButtonItemGroups:(id)a3
{
  void *v4;
  objc_class *v5;
  id v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2050000000;
  v4 = (void *)qword_1ECD7CBD8;
  v50 = qword_1ECD7CBD8;
  if (!qword_1ECD7CBD8)
  {
    v42 = MEMORY[0x1E0C809B0];
    v43 = 3221225472;
    v44 = __getTUIAssistantButtonSizeProviderClass_block_invoke;
    v45 = &unk_1E16B14C0;
    v46 = &v47;
    __getTUIAssistantButtonSizeProviderClass_block_invoke((uint64_t)&v42);
    v4 = (void *)v48[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v47, 8);
  v6 = objc_alloc_init(v5);
  if (v6)
  {
    -[UIInputViewSet assistantViewController](self->_inputViewSet, "assistantViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "styleFromAssistantBarStyle:", objc_msgSend(v28, "assistantBarStyle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "barButtonWidth");
    objc_msgSend(v6, "setBarButtonWidth:");
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v29, "count"));
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v29;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    if (v33)
    {
      v32 = *(_QWORD *)v39;
      while (2)
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v39 != v32)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if ((objc_msgSend(v8, "isHidden") & 1) == 0)
          {
            v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v8, "barButtonItems");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

            v47 = 0;
            v48 = &v47;
            v49 = 0x2050000000;
            v12 = (void *)qword_1ECD7CBE8;
            v50 = qword_1ECD7CBE8;
            if (!qword_1ECD7CBE8)
            {
              v42 = MEMORY[0x1E0C809B0];
              v43 = 3221225472;
              v44 = __getRTIBarButtonGroupClass_block_invoke;
              v45 = &unk_1E16B14C0;
              v46 = &v47;
              __getRTIBarButtonGroupClass_block_invoke((uint64_t)&v42);
              v12 = (void *)v48[3];
            }
            v13 = objc_retainAutorelease(v12);
            _Block_object_dispose(&v47, 8);
            v14 = objc_alloc_init(v13);
            if (!v14)
            {

              v25 = 0;
              v24 = v30;
              goto LABEL_28;
            }
            objc_msgSend(v8, "representativeItem");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "preferredSizeForButtonBarItem:", v15);
            *(float *)&v16 = v16;
            objc_msgSend(v14, "setRepresentativeItemWidth:", v16);

            v36 = 0u;
            v37 = 0u;
            v34 = 0u;
            v35 = 0u;
            objc_msgSend(v8, "barButtonItems");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
            if (v18)
            {
              v19 = *(_QWORD *)v35;
              do
              {
                for (j = 0; j != v18; ++j)
                {
                  if (*(_QWORD *)v35 != v19)
                    objc_enumerationMutation(v17);
                  v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
                  if ((objc_msgSend(v21, "isHidden") & 1) == 0)
                  {
                    objc_msgSend(v6, "preferredSizeForButtonBarItem:", v21);
                    *(float *)&v22 = v22;
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v11, "addObject:", v23);

                  }
                }
                v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
              }
              while (v18);
            }

            objc_msgSend(v14, "setItemWidths:", v11);
            objc_msgSend(v30, "addObject:", v14);

          }
        }
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
        if (v33)
          continue;
        break;
      }
    }

    v24 = v30;
    v25 = v30;
LABEL_28:

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)remoteAssistantItemForResponder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v4 = a3;
  objc_msgSend(v4, "_responderWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyboardSceneDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemInputAssistantViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "_assistantItemsVisibleForResponder:", v4)
    && (objc_msgSend(v8, "observedInputAssistantItem"), (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (void *)v9;
    objc_msgSend(v8, "observedInputAssistantItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "inputAssistantItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = 0;
  v32 = &v31;
  v33 = 0x2050000000;
  v12 = (void *)getRTIAssistantItemClass_softClass;
  v34 = getRTIAssistantItemClass_softClass;
  if (!getRTIAssistantItemClass_softClass)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __getRTIAssistantItemClass_block_invoke;
    v30[3] = &unk_1E16B14C0;
    v30[4] = &v31;
    __getRTIAssistantItemClass_block_invoke((uint64_t)v30);
    v12 = (void *)v32[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v31, 8);
  v14 = objc_alloc_init(v13);
  if (v14)
  {
    objc_msgSend(v14, "setShowsBarButtonItemsInline:", objc_msgSend(v11, "_showsBarButtonItemsInline"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "inputDashboardViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setShowsInputDashboardViewController:", v15 != 0);

    }
    else
    {
      objc_msgSend(v14, "setShowsInputDashboardViewController:", 0);
    }
    if (objc_msgSend(v14, "showsInputDashboardViewController"))
    {
      objc_msgSend(v4, "inputDashboardViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) != 0)
      {
        objc_msgSend(v4, "inputDashboardViewController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "inputDashboardViewController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "traitCollection");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "preferredWidthForTraitCollection:", v20);
        *(float *)&v21 = v21;
        objc_msgSend(v14, "setCenterViewPreferredWidth:", v21);

      }
    }
    objc_msgSend(v11, "_detachedTintColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDetachedTintColor:", v22);

    objc_msgSend(v11, "_detachedBackgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDetachedBackgroundColor:", v23);

    objc_msgSend(v14, "setVisibleWhenMinimized:", objc_msgSend(v11, "_isVisibleWhenMinimized"));
    objc_msgSend(v11, "leadingBarButtonGroups");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIRemoteInputViewHost rtiGroupsForBarButtonItemGroups:](self, "rtiGroupsForBarButtonItemGroups:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLeadingBarButtonGroups:", v25);

    objc_msgSend(v11, "trailingBarButtonGroups");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIRemoteInputViewHost rtiGroupsForBarButtonItemGroups:](self, "rtiGroupsForBarButtonItemGroups:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTrailingBarButtonGroups:", v27);

    v28 = v14;
  }

  return v14;
}

- (id)settingsScene
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(v2, "responder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_responderWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (UIWindow)inputViewWindow
{
  return self->_inputViewWindow;
}

- (UIWindow)assistantViewWindow
{
  return self->_assistantViewWindow;
}

- (UIInputViewSet)inputViewSet
{
  return self->_inputViewSet;
}

- (BOOL)shouldShowDockView
{
  return self->_shouldShowDockView;
}

- (void)setShouldShowDockView:(BOOL)a3
{
  self->_shouldShowDockView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputViewSet, 0);
  objc_storeStrong((id *)&self->_assistantViewWindow, 0);
  objc_storeStrong((id *)&self->_inputViewWindow, 0);
  objc_storeStrong((id *)&self->_assistantViewController, 0);
  objc_storeStrong((id *)&self->_inputViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_inputViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_inputViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
  objc_storeStrong((id *)&self->_inputViewController, 0);
  objc_storeStrong((id *)&self->_inputRootViewController, 0);
}

@end
