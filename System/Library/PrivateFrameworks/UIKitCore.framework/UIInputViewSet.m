@implementation UIInputViewSet

+ (id)emptyInputSet
{
  void *v2;
  UIInputViewSet *v3;
  void *v4;

  v2 = (void *)emptyInputSet_EmptySet;
  if (!emptyInputSet_EmptySet)
  {
    v3 = -[UIInputViewSet initWithInputView:accessoryView:assistantView:isKeyboard:]([UIInputViewSet alloc], "initWithInputView:accessoryView:assistantView:isKeyboard:", 0, 0, 0, 0);
    v4 = (void *)emptyInputSet_EmptySet;
    emptyInputSet_EmptySet = (uint64_t)v3;

    v2 = (void *)emptyInputSet_EmptySet;
  }
  return v2;
}

- (void)setShouldShowDockView:(BOOL)a3
{
  self->_shouldShowDockView = a3;
}

+ (id)inputSetWithInputView:(id)a3 accessoryView:(id)a4 assistantView:(id)a5
{
  id v7;
  id v8;
  id v9;
  UIInputViewSet *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[UIInputViewSet initWithInputView:accessoryView:assistantView:isKeyboard:]([UIInputViewSet alloc], "initWithInputView:accessoryView:assistantView:isKeyboard:", v9, v8, v7, 0);

  return v10;
}

- (UIInputViewSet)initWithInputView:(id)a3 accessoryView:(id)a4 assistantView:(id)a5 isKeyboard:(BOOL)a6
{
  return -[UIInputViewSet initWithInputView:customInputView:accessoryView:assistantView:isKeyboard:](self, "initWithInputView:customInputView:accessoryView:assistantView:isKeyboard:", a3, 0, a4, a5, a6);
}

- (void)setIsCustomInputView:(BOOL)a3
{
  self->_isCustomInputView = a3;
}

- (void)setIsRemoteKeyboard:(BOOL)a3
{
  self->_isRemoteKeyboard = a3;
}

- (void)inheritNullState:(id)a3
{
  self->_isNullInputView = objc_msgSend(a3, "isNullInputView");
}

- (BOOL)isSplit
{
  void *v3;
  BOOL v4;

  if (!-[UIInputViewSet supportsSplit](self, "supportsSplit")
    || !+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"))
  {
    return 0;
  }
  -[UIInputViewSet inputView](self, "inputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (UIInputViewSet)initWithInputView:(id)a3 customInputView:(id)a4 accessoryView:(id)a5 assistantView:(id)a6 isKeyboard:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  UIInputViewSet *v16;
  double v17;
  void *v18;
  objc_super v20;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)UIInputViewSet;
  v16 = -[UIInputViewSet init](&v20, sel_init);
  if (v16)
  {
    if (objc_msgSend(v12, "translatesAutoresizingMaskIntoConstraints"))
    {
      if ((objc_msgSend(v12, "autoresizingMask") & 0x10) == 0)
      {
        objc_msgSend(v12, "frame");
        if (v17 <= 0.0)
        {

          v12 = 0;
          v16->_isNullInputView = 1;
        }
      }
    }
    objc_storeStrong((id *)&v16->_inputAssistantView, a6);
    objc_storeStrong((id *)&v16->_inputAccessoryView, a5);
    objc_storeStrong((id *)&v16->_inputView, v12);
    objc_storeStrong((id *)&v16->_hostedCustomInputView, a4);
    if (v7)
    {
      -[UIInputViewSet keyboard](v16, "keyboard");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "syncMinimizedStateToHardwareKeyboardAttachedState");

    }
    if (-[UIInputViewSet _inputViewSetSupportsSplit](v16, "_inputViewSetSupportsSplit"))
    {
      +[UIKeyboardImpl refreshRivenStateWithTraits:isKeyboard:](UIKeyboardImpl, "refreshRivenStateWithTraits:isKeyboard:", 0, v7);
      -[UIInputViewSet refreshPresentation](v16, "refreshPresentation");
    }
  }

  return v16;
}

- (BOOL)_inputViewSetSupportsSplit
{
  return +[UIKeyboardImpl rivenPreference](UIKeyboardImpl, "rivenPreference")
      && -[UIInputViewSet _inputViewSupportsSplit](self, "_inputViewSupportsSplit")
      && -[UIInputViewSet _actLikeInputAccessoryViewSupportsSplit](self, "_actLikeInputAccessoryViewSupportsSplit");
}

- (void)setHostedCustomInputView:(id)a3
{
  objc_storeStrong((id *)&self->_hostedCustomInputView, a3);
}

- (BOOL)isRemoteKeyboard
{
  return self->_isRemoteKeyboard;
}

- (BOOL)isInputViewPlaceholder
{
  void *v2;
  char v3;

  -[UIInputViewSet inputView](self, "inputView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
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
  objc_super v22;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v22.receiver = self;
  v22.super_class = (Class)UIInputViewSet;
  -[UIInputViewSet description](&v22, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; "), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UIInputViewSet isEmpty](self, "isEmpty"))
  {
    v6 = CFSTR("(empty)");
LABEL_21:
    objc_msgSend(v5, "appendString:", v6);
    goto LABEL_22;
  }
  if (!self->_inputViewController)
  {
    -[UIInputViewSet inputView](self, "inputView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v5, "appendFormat:", CFSTR("keyboard = [uninitialized]; "));
      goto LABEL_11;
    }
  }
  -[UIInputViewSet keyboard](self, "keyboard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIInputViewSet keyboard](self, "keyboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("keyboard = %@%%; "), v8);
  }
  else
  {
    -[UIInputViewSet inputView](self, "inputView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_11;
    -[UIInputViewSet inputView](self, "inputView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_kb_description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("view = %@; "), v11);

  }
LABEL_11:
  -[UIInputViewSet hostedCustomInputView](self, "hostedCustomInputView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UIInputViewSet hostedCustomInputView](self, "hostedCustomInputView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_kb_description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("hostedCustomInputView = %@; "), v14);

  }
  -[UIInputViewSet inputAssistantView](self, "inputAssistantView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[UIInputViewSet inputAssistantView](self, "inputAssistantView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_kb_description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("assistant = %@; "), v17);

  }
  -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_kb_description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("accessory = %@; "), v20);

  }
  if (!-[UIInputViewSet usesKeyClicks](self, "usesKeyClicks"))
    objc_msgSend(v5, "appendString:", CFSTR("usesKeyClicks = NO;  "));
  if (!-[UIInputViewSet visible](self, "visible"))
  {
    v6 = CFSTR("(not visible)");
    goto LABEL_21;
  }
LABEL_22:
  objc_msgSend(v5, "appendString:", CFSTR(">"));
  return v5;
}

- (BOOL)isEmpty
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[UIInputViewSet inputView](self, "inputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[UIInputViewSet inputAssistantView](self, "inputAssistantView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 0;
    }
    else
    {
      -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 == 0;

    }
  }

  return v4;
}

- (id)normalizePlaceholders
{
  UIInputViewSet *v3;
  void *v4;
  uint64_t v5;
  UIView *inputView;
  void *v7;
  void *v8;
  void *v9;
  UIView *v10;
  void *inputAssistantView;
  uint64_t *p_inputAssistantView;
  uint64_t v13;
  UIView *v14;
  void *v15;
  uint64_t v16;
  UIView *inputAccessoryView;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  UIInputViewController *inputViewController;
  UIInputViewController *v22;
  uint64_t v23;
  UIInputViewController *assistantViewController;
  UIInputViewController *v25;
  uint64_t v26;
  UIInputViewController *accessoryViewController;

  v3 = objc_alloc_init(UIInputViewSet);
  -[UIInputViewSet inputView](self, "inputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NormaliseInputView(v4, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  inputView = v3->_inputView;
  v3->_inputView = (UIView *)v5;

  -[UIInputViewSet inputAssistantView](self, "inputAssistantView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NormaliseInputView(v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    p_inputAssistantView = (uint64_t *)&v3->_inputAssistantView;
    inputAssistantView = v3->_inputAssistantView;
    v3->_inputAssistantView = v10;
  }
  else
  {
    -[UIInputViewSet inputView](self, "inputView");
    inputAssistantView = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(inputAssistantView, "associatedView");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    p_inputAssistantView = (uint64_t *)&v3->_inputAssistantView;
    v14 = v3->_inputAssistantView;
    v3->_inputAssistantView = (UIView *)v13;

  }
  -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NormaliseInputView(v15, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  inputAccessoryView = v3->_inputAccessoryView;
  v3->_inputAccessoryView = (UIView *)v16;

  -[UIInputViewSet inputView](self, "inputView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (uint64_t)v3->_inputView;
  if (v18 == (void *)v19)
    -[UIInputViewSet inputViewController](self, "inputViewController");
  else
    GetInputViewController(v19);
  v20 = objc_claimAutoreleasedReturnValue();
  inputViewController = v3->_inputViewController;
  v3->_inputViewController = (UIInputViewController *)v20;

  -[UIInputViewSet assistantViewController](self, "assistantViewController");
  v22 = (UIInputViewController *)objc_claimAutoreleasedReturnValue();
  if (v22 == v3->_assistantViewController)
    -[UIInputViewSet assistantViewController](self, "assistantViewController");
  else
    GetInputViewController(*p_inputAssistantView);
  v23 = objc_claimAutoreleasedReturnValue();
  assistantViewController = v3->_assistantViewController;
  v3->_assistantViewController = (UIInputViewController *)v23;

  -[UIInputViewSet accessoryViewController](self, "accessoryViewController");
  v25 = (UIInputViewController *)objc_claimAutoreleasedReturnValue();
  if (v25 == v3->_accessoryViewController)
    -[UIInputViewSet accessoryViewController](self, "accessoryViewController");
  else
    GetInputViewController((uint64_t)v3->_inputAccessoryView);
  v26 = objc_claimAutoreleasedReturnValue();
  accessoryViewController = v3->_accessoryViewController;
  v3->_accessoryViewController = (UIInputViewController *)v26;

  v3->_isCustomInputView = -[UIInputViewSet isCustomInputView](self, "isCustomInputView");
  v3->_isNullInputView = -[UIInputViewSet isNullInputView](self, "isNullInputView");
  v3->_shouldShowDockView = -[UIInputViewSet shouldShowDockView](self, "shouldShowDockView");
  return v3;
}

- (UIView)inputView
{
  return self->_inputView;
}

- (BOOL)isCustomInputView
{
  return self->_isCustomInputView;
}

- (UIInputViewController)accessoryViewController
{
  void *v3;
  void *v4;
  UIInputViewController *v5;
  UIInputViewController *accessoryViewController;
  void *v7;

  if (!self->_accessoryViewController)
  {
    -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[UICompatibilityInputViewController inputViewControllerWithView:](UICompatibilityInputViewController, "inputViewControllerWithView:", v4);
      v5 = (UIInputViewController *)objc_claimAutoreleasedReturnValue();
      accessoryViewController = self->_accessoryViewController;
      self->_accessoryViewController = v5;

      -[UIViewController view](self->_accessoryViewController, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputViewSet setInputAccessoryView:](self, "setInputAccessoryView:", v7);

    }
  }
  return self->_accessoryViewController;
}

- (UIView)inputAccessoryView
{
  return self->_inputAccessoryView;
}

- (UIInputViewController)assistantViewController
{
  void *v3;
  void *v4;
  UIInputViewController *v5;
  UIInputViewController *assistantViewController;
  void *v7;

  if (!self->_assistantViewController)
  {
    -[UIInputViewSet inputAssistantView](self, "inputAssistantView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[UIInputViewSet inputAssistantView](self, "inputAssistantView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[UICompatibilityInputViewController inputViewControllerWithView:](UICompatibilityInputViewController, "inputViewControllerWithView:", v4);
      v5 = (UIInputViewController *)objc_claimAutoreleasedReturnValue();
      assistantViewController = self->_assistantViewController;
      self->_assistantViewController = v5;

      -[UIViewController view](self->_assistantViewController, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputViewSet setInputAssistantView:](self, "setInputAssistantView:", v7);

    }
  }
  return self->_assistantViewController;
}

- (UIView)inputAssistantView
{
  return self->_inputAssistantView;
}

- (BOOL)isNullInputView
{
  return self->_isNullInputView;
}

- (UIKeyboard)keyboard
{
  void *v2;
  void *v3;

  -[UIInputViewSet inputViewController](self, "inputViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_keyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIKeyboard *)v3;
}

- (UIInputViewController)inputViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIInputViewController *v7;
  UIInputViewController *inputViewController;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (!self->_inputViewController)
  {
    -[UIInputViewSet inputView](self, "inputView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[UIInputViewSet inputView](self, "inputView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIInputViewSet inputView](self, "inputView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[UICompatibilityInputViewController inputViewControllerWithView:](UICompatibilityInputViewController, "inputViewControllerWithView:", v6);
      v7 = (UIInputViewController *)objc_claimAutoreleasedReturnValue();
      inputViewController = self->_inputViewController;
      self->_inputViewController = v7;

      if (v5)
      {
        -[UIInputViewSet inputView](self, "inputView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "superview");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5 != v10)
        {
          +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removePreservedInputViewSetForInputView:", v5);

        }
      }
      -[UIViewController view](self->_inputViewController, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputViewSet setInputView:](self, "setInputView:", v12);

    }
  }
  return self->_inputViewController;
}

- (BOOL)shouldShowDockView
{
  return self->_shouldShowDockView;
}

- (UIView)hostedCustomInputView
{
  return self->_hostedCustomInputView;
}

- (BOOL)visible
{
  void *v3;
  BOOL v4;

  -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 1;
  else
    v4 = -[UIInputViewSet _inputViewIsVisible](self, "_inputViewIsVisible");

  return v4;
}

- (BOOL)usesKeyClicks
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  void *v11;

  -[UIInputViewSet inputView](self, "inputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIInputViewSet inputView](self, "inputView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "enableInputClicksWhenVisible");

    if ((v5 & 1) != 0)
      return 1;
  }
  else
  {

  }
  -[UIInputViewSet inputAssistantView](self, "inputAssistantView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIInputViewSet inputAssistantView](self, "inputAssistantView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "enableInputClicksWhenVisible");

    if ((v8 & 1) != 0)
      return 1;
  }
  else
  {

  }
  -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "enableInputClicksWhenVisible");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_inputViewIsVisible
{
  void *v3;
  void *v4;
  int v5;

  -[UIInputViewSet inputView](self, "inputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIInputViewSet keyboard](self, "keyboard");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isMinimized") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)refreshPresentation
{
  _BOOL4 v3;
  double Width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v3 = -[UIInputViewSet isSplit](self, "isSplit");
  -[UIInputViewSet inputViewBounds](self, "inputViewBounds");
  Width = CGRectGetWidth(v27);
  if (Width == 0.0)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = CGRectGetWidth(v28);

  }
  else
  {
    v6 = Width;
  }
  v7 = 0.0;
  v8 = 0.0;
  if (v3)
  {
    -[UIInputViewSet _leftInputViewSetFrame](self, "_leftInputViewSetFrame");
    v7 = CGRectGetWidth(v29);
    -[UIInputViewSet _rightInputViewSetFrame](self, "_rightInputViewSetFrame");
    v8 = v6 - CGRectGetWidth(v30) - v7;
  }
  if (!-[UIInputViewSet _isKeyboard](self, "_isKeyboard")
    && -[UIInputViewSet _inputViewSupportsSplit](self, "_inputViewSupportsSplit"))
  {
    -[UIView _setLeftOffset:gapWidth:](self->_inputView, "_setLeftOffset:gapWidth:", v7, v8);
  }
  if (-[UIInputViewSet _inputAccessoryViewSupportsSplit](self, "_inputAccessoryViewSupportsSplit"))
  {
    -[UIView size](self->_inputAccessoryView, "size");
    if (v9 == 0.0 && v7 != 0.0)
    {
      -[UIInputViewSet inputViewBounds](self, "inputViewBounds");
      v10 = CGRectGetWidth(v31);
      -[UIView size](self->_inputAccessoryView, "size");
      -[UIView setSize:](self->_inputAccessoryView, "setSize:", v10);
    }
    -[UIView _setLeftOffset:gapWidth:](self->_inputAccessoryView, "_setLeftOffset:gapWidth:", v7, v8);
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldShowCandidateBar");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShowsCandidateBar:", v12);

  if (+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit")
    && -[UIInputViewSet _isKeyboard](self, "_isKeyboard"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "showsCandidateBar"))
    {

    }
    else
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "shouldShowCandidateBar");

      if (!v16)
        goto LABEL_20;
    }
    -[UIInputViewSet _rightInputViewSetFrame](self, "_rightInputViewSetFrame");
    v17 = v6 - CGRectGetWidth(v32);
    -[UIInputViewSet _leftInputViewSetFrame](self, "_leftInputViewSetFrame");
    v18 = v17 - CGRectGetWidth(v33);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "candidateController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSplitGap:", v18);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "candidateController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "updateStates");

  }
LABEL_20:
  -[UIInputViewSet _splittableInputAccessoryView](self, "_splittableInputAccessoryView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[UIInputViewSet _splittableInputAccessoryView](self, "_splittableInputAccessoryView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "didEndSplitTransition");

  }
  if (-[UIInputViewSet _isKeyboard](self, "_isKeyboard")
    && +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating")
    && !-[UIInputViewSet isInputViewPlaceholder](self, "isInputViewPlaceholder"))
  {
    -[UIInputViewSet inputViewBounds](self, "inputViewBounds");
    +[UIPeripheralHost adjustFloatingPersistentOffsetForKeyboardSize:](UIPeripheralHost, "adjustFloatingPersistentOffsetForKeyboardSize:", v25, v26);
  }
}

- (BOOL)_isKeyboard
{
  void *v2;
  BOOL v3;

  -[UIInputViewSet keyboard](self, "keyboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CGRect)inputViewBounds
{
  double v3;
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
  double v16;
  CGRect result;

  -[UIView _compatibleBounds](self->_inputView, "_compatibleBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (!-[UIInputViewSet _isKeyboard](self, "_isKeyboard") && -[UIInputViewSet isSplit](self, "isSplit"))
  {
    -[UIView leftContentViewSize](self->_inputView, "leftContentViewSize");
    v10 = v11;
    -[UIView rightContentViewSize](self->_inputView, "rightContentViewSize");
    if (v10 < v12)
      v10 = v12;
    v6 = 0.0;
    v4 = 0.0;
  }
  v13 = v4;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)_splittableInputAccessoryView
{
  void *v3;

  if (-[UIInputViewSet _inputAccessoryViewSupportsSplit](self, "_inputAccessoryViewSupportsSplit"))
  {
    -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)_inputAccessoryViewSupportsSplit
{
  UIView *inputAccessoryView;
  char v3;
  void *v4;

  inputAccessoryView = self->_inputAccessoryView;
  if (!inputAccessoryView)
    return 1;
  v3 = 1;
  NormaliseInputView(inputAccessoryView, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "conformsToProtocol:", &unk_1EDED9CB8))
      v3 = objc_msgSend(v4, "_supportsSplit");
    else
      v3 = 0;
  }

  return v3;
}

- (BOOL)_inputViewSupportsSplit
{
  char v4;
  void *v5;

  if (-[UIInputViewSet _isKeyboard](self, "_isKeyboard"))
    return UIKeyboardSupportsSplit();
  v4 = 1;
  NormaliseInputView(self->_inputView, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = objc_msgSend(v5, "_supportsSplit");
    else
      v4 = 0;
  }

  return v4;
}

- (void)setInputView:(id)a3
{
  objc_storeStrong((id *)&self->_inputView, a3);
}

- (void)setInputAssistantView:(id)a3
{
  objc_storeStrong((id *)&self->_inputAssistantView, a3);
}

+ (id)inputSetWithOriginalInputSet:(id)a3 duplicateInputView:(BOOL)a4 duplicateInputAccessoryView:(BOOL)a5 duplicateInputAssistantView:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  UIInputViewSet *v11;
  uint64_t v12;
  UIView *inputAssistantView;
  uint64_t v14;
  UIInputViewController *assistantViewController;
  uint64_t v17;
  UIView *inputView;
  uint64_t v19;
  UIInputViewController *inputViewController;
  uint64_t v21;
  UIView *inputAccessoryView;
  uint64_t v23;
  UIInputViewController *accessoryViewController;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = v9;
  if (!v8 || !v7 || !v6)
  {
    v11 = objc_alloc_init(UIInputViewSet);
    if (v8)
    {
      objc_msgSend(v10, "inputView");
      v17 = objc_claimAutoreleasedReturnValue();
      inputView = v11->_inputView;
      v11->_inputView = (UIView *)v17;

      objc_msgSend(v10, "inputViewController");
      v19 = objc_claimAutoreleasedReturnValue();
      inputViewController = v11->_inputViewController;
      v11->_inputViewController = (UIInputViewController *)v19;

      v11->_isCustomInputView = objc_msgSend(v10, "isCustomInputView");
      if (!v7)
      {
LABEL_7:
        if (!v6)
          goto LABEL_9;
LABEL_8:
        objc_msgSend(v10, "inputAssistantView");
        v12 = objc_claimAutoreleasedReturnValue();
        inputAssistantView = v11->_inputAssistantView;
        v11->_inputAssistantView = (UIView *)v12;

        objc_msgSend(v10, "assistantViewController");
        v14 = objc_claimAutoreleasedReturnValue();
        assistantViewController = v11->_assistantViewController;
        v11->_assistantViewController = (UIInputViewController *)v14;

        goto LABEL_9;
      }
    }
    else if (!v7)
    {
      goto LABEL_7;
    }
    objc_msgSend(v10, "inputAccessoryView");
    v21 = objc_claimAutoreleasedReturnValue();
    inputAccessoryView = v11->_inputAccessoryView;
    v11->_inputAccessoryView = (UIView *)v21;

    objc_msgSend(v10, "accessoryViewController");
    v23 = objc_claimAutoreleasedReturnValue();
    accessoryViewController = v11->_accessoryViewController;
    v11->_accessoryViewController = (UIInputViewController *)v23;

    if (!v6)
      goto LABEL_9;
    goto LABEL_8;
  }
  v11 = (UIInputViewSet *)v9;
LABEL_9:

  return v11;
}

- (void)setAssistantViewController:(id)a3
{
  objc_storeStrong((id *)&self->_assistantViewController, a3);
}

- (void)setAccessoryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViewController, a3);
}

- (void)setInputViewController:(id)a3
{
  objc_storeStrong((id *)&self->_inputViewController, a3);
}

+ (id)inputSetWithPlaceholderAndAccessoryView:(id)a3 assistantView:(id)a4
{
  return (id)objc_msgSend(a1, "inputSetWithPlaceholderAndCustomInputView:accessoryView:assistantView:", 0, a3, a4);
}

+ (id)inputSetWithPlaceholderAndAccessoryView:(id)a3
{
  return (id)objc_msgSend(a1, "inputSetWithPlaceholderAndAccessoryView:assistantView:", a3, 0);
}

- (BOOL)containsResponder:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  -[UIInputViewSet inputView](self, "inputView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "_containsResponder:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "_containsResponder:", v4);

  }
  return v6;
}

- (void)dealloc
{
  UIInputViewController *accessoryViewController;
  UIInputViewController *assistantViewController;
  UIInputViewController *inputViewController;
  objc_super v6;

  accessoryViewController = self->_accessoryViewController;
  self->_accessoryViewController = 0;

  assistantViewController = self->_assistantViewController;
  self->_assistantViewController = 0;

  inputViewController = self->_inputViewController;
  self->_inputViewController = 0;

  v6.receiver = self;
  v6.super_class = (Class)UIInputViewSet;
  -[UIInputViewSet dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedCustomInputView, 0);
  objc_storeStrong((id *)&self->_assistantViewController, 0);
  objc_storeStrong((id *)&self->_accessoryViewController, 0);
  objc_storeStrong((id *)&self->_inputViewController, 0);
  objc_storeStrong((id *)&self->_inputAssistantView, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
  objc_destroyWeak((id *)&self->_accessoryViewNextResponder);
  objc_storeStrong((id *)&self->_restorableRenderConfig, 0);
  objc_destroyWeak((id *)&self->_restorableResponder);
}

- (BOOL)isInputAccessoryViewPlaceholder
{
  void *v2;
  char v3;

  -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = objc_msgSend(v4, "isRemoteKeyboard"), v5 == -[UIInputViewSet isRemoteKeyboard](self, "isRemoteKeyboard")))
  {
    objc_msgSend(v4, "inputView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputViewSet inputView](self, "inputView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8 || objc_msgSend(v7, "isEqual:", v8))
    {
      objc_msgSend(v4, "hostedCustomInputView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputViewSet hostedCustomInputView](self, "hostedCustomInputView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 == v10 || objc_msgSend(v9, "isEqual:", v10))
      {
        objc_msgSend(v4, "inputAssistantView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIInputViewSet inputAssistantView](self, "inputAssistantView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 == v12 || objc_msgSend(v11, "isEqual:", v12))
        {
          objc_msgSend(v4, "inputAccessoryView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13 == v14)
            v6 = 1;
          else
            v6 = objc_msgSend(v13, "isEqual:", v14);

        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CGRect)inputAccessoryViewBounds
{
  double v3;
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
  double v16;
  CGRect result;

  -[UIView _compatibleBounds](self->_inputAccessoryView, "_compatibleBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[UIInputViewSet isSplit](self, "isSplit")
    && -[UIInputViewSet _inputAccessoryViewSupportsSplit](self, "_inputAccessoryViewSupportsSplit"))
  {
    -[UIView leftContentViewSize](self->_inputAccessoryView, "leftContentViewSize");
    v10 = v11;
    -[UIView rightContentViewSize](self->_inputAccessoryView, "rightContentViewSize");
    if (v10 < v12)
      v10 = v12;
    v6 = 0.0;
    v4 = 0.0;
  }
  v13 = v4;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)_inputViewIsSplit
{
  void *v3;
  BOOL v4;

  if (!-[UIInputViewSet inputViewKeyboardCanSplit](self, "inputViewKeyboardCanSplit")
    || !+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"))
  {
    return 0;
  }
  -[UIInputViewSet inputView](self, "inputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)inputViewKeyboardCanSplit
{
  _BOOL4 v3;

  v3 = +[UIKeyboardImpl rivenPreference](UIKeyboardImpl, "rivenPreference");
  if (v3)
    LOBYTE(v3) = -[UIInputViewSet _inputViewSupportsSplit](self, "_inputViewSupportsSplit");
  return v3;
}

- (BOOL)hasNonPlaceholderViews
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  void *v7;
  int v8;

  -[UIInputViewSet inputView](self, "inputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = !-[UIInputViewSet isInputViewPlaceholder](self, "isInputViewPlaceholder");
  else
    v4 = 0;

  -[UIInputViewSet inputAssistantView](self, "inputAssistantView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = !-[UIInputViewSet isInputAssistantViewPlaceholder](self, "isInputAssistantViewPlaceholder");
  else
    LOBYTE(v6) = 0;

  -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = !-[UIInputViewSet isInputAccessoryViewPlaceholder](self, "isInputAccessoryViewPlaceholder");
  else
    LOBYTE(v8) = 0;

  if ((v4 & 1) != 0)
    return 1;
  else
    return v6 | v8;
}

+ (id)inputSetWithPlaceholderAndCustomInputView:(id)a3 accessoryView:(id)a4 assistantView:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  UIInputViewSet *v16;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  +[_UIRemoteKeyboardPlaceholderView placeholderWithWidthSizer:heightWithScene:](_UIRemoteKeyboardPlaceholderView, "placeholderWithWidthSizer:heightWithScene:", &__block_literal_global_16, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "heightForRemoteIAVPlaceholderIfNecessary");
    v13 = v12;

    if (v13 == 0.0)
    {
      v7 = 0;
    }
    else
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");
      +[_UIRemoteKeyboardPlaceholderView placeholderWithWidth:height:](_UIRemoteKeyboardPlaceholderView, "placeholderWithWidth:height:", v15, v13);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v16 = -[UIInputViewSet initWithInputView:customInputView:accessoryView:assistantView:isKeyboard:]([UIInputViewSet alloc], "initWithInputView:customInputView:accessoryView:assistantView:isKeyboard:", v10, v9, v7, v8, 0);

  return v16;
}

double __88__UIInputViewSet_inputSetWithPlaceholderAndCustomInputView_accessoryView_assistantView___block_invoke()
{
  double result;
  void *v1;
  double v2;
  double v3;

  if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    +[UIKeyboardImpl floatingWidth](UIKeyboardImpl, "floatingWidth");
  }
  else
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "bounds");
    v3 = v2;

    return v3;
  }
  return result;
}

- (BOOL)isInputAssistantViewPlaceholder
{
  void *v2;
  char v3;

  -[UIInputViewSet inputAssistantView](self, "inputAssistantView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

+ (id)inputSetWithInputView:(id)a3 accessoryView:(id)a4
{
  return (id)objc_msgSend(a1, "inputSetWithInputView:accessoryView:assistantView:", a3, a4, 0);
}

+ (id)inputSetWithKeyboardAndAccessoryView:(id)a3 assistantView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  UIInputView *v9;
  UIInputView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIInputViewSet *v15;

  v5 = a4;
  v6 = a3;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "userInterfaceIdiom") != 6)
  {

    goto LABEL_5;
  }
  v8 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");

  if (!v8)
  {
LABEL_5:
    +[UIKeyboardAutomatic sharedInstance](UIKeyboardAutomatic, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UICompatibilityInputViewController deferredInputModeControllerWithKeyboard:](UICompatibilityInputViewController, "deferredInputModeControllerWithKeyboard:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "view");
    v10 = (UIInputView *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v9 = [UIInputView alloc];
  v10 = -[UIInputView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIInputView setAllowsSelfSizing:](v10, "setAllowsSelfSizing:", 1);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView heightAnchor](v10, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToConstant:", 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  v13 = 0;
LABEL_6:
  v15 = -[UIInputViewSet initWithInputView:accessoryView:assistantView:isKeyboard:]([UIInputViewSet alloc], "initWithInputView:accessoryView:assistantView:isKeyboard:", v10, v6, v5, 1);

  -[UIInputViewSet setInputViewController:](v15, "setInputViewController:", v13);
  return v15;
}

- (BOOL)canAnimateToInputViewSet:(id)a3
{
  id v4;
  BOOL v5;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (-[UIInputViewSet isEmpty](self, "isEmpty") || (objc_msgSend(v4, "isEmpty") & 1) != 0)
    goto LABEL_3;
  -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputAccessoryView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != v8)
  {

LABEL_7:
    v5 = -[UIInputViewSet isEqual:](self, "isEqual:", v4);
    goto LABEL_4;
  }
  -[UIInputViewSet inputView](self, "inputView");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(v4, "inputView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_7;
  }
  else
  {

  }
LABEL_3:
  v5 = 1;
LABEL_4:

  return v5;
}

+ (id)inputSetWithKeyboardAndAccessoryView:(id)a3
{
  return (id)objc_msgSend(a1, "inputSetWithKeyboardAndAccessoryView:assistantView:", a3, 0);
}

- (void)setKeyboardAssistantBar:(id)a3
{
  id v4;
  void *v5;
  UIView *inputAssistantView;
  BOOL v7;
  UICompatibilityInputViewController *v8;
  UIInputViewController *assistantViewController;
  void *v10;
  UIView *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = v4;
  inputAssistantView = self->_inputAssistantView;
  if (v4)
  {
    if (!inputAssistantView)
    {
      if (self->_inputView)
      {
        v13 = v4;
        v7 = -[UIInputViewSet isInputViewPlaceholder](self, "isInputViewPlaceholder");
        v5 = v13;
        if (!v7)
        {
          v8 = -[UIInputViewController initWithNibName:bundle:]([UICompatibilityInputViewController alloc], "initWithNibName:bundle:", 0, 0);
          assistantViewController = self->_assistantViewController;
          self->_assistantViewController = &v8->super;

          -[UIViewController view](self->_assistantViewController, "view");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addSubview:", v13);

          -[UIViewController view](self->_assistantViewController, "view");
          v11 = (UIView *)objc_claimAutoreleasedReturnValue();
          v12 = self->_inputAssistantView;
          self->_inputAssistantView = v11;
LABEL_8:

          v5 = v13;
        }
      }
    }
  }
  else if (inputAssistantView)
  {
    v13 = 0;
    self->_inputAssistantView = 0;

    v12 = self->_assistantViewController;
    self->_assistantViewController = 0;
    goto LABEL_8;
  }

}

- (id)inputSetWithInputAccessoryViewOnly
{
  void *v2;
  void *v3;

  -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIInputViewSet inputSetWithInputView:accessoryView:](UIInputViewSet, "inputSetWithInputView:accessoryView:", 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)inputSetWithInputAccessoryViewFromInputSet:(id)a3
{
  id v4;
  UIInputViewSet *v5;
  uint64_t v6;
  UIView *inputView;
  uint64_t v8;
  UIView *inputAssistantView;
  uint64_t v10;
  UIView *inputAccessoryView;
  uint64_t v12;
  UIInputViewController *inputViewController;
  uint64_t v14;
  UIInputViewController *assistantViewController;
  uint64_t v16;
  UIInputViewController *accessoryViewController;

  v4 = a3;
  v5 = objc_alloc_init(UIInputViewSet);
  -[UIInputViewSet inputView](self, "inputView");
  v6 = objc_claimAutoreleasedReturnValue();
  inputView = v5->_inputView;
  v5->_inputView = (UIView *)v6;

  -[UIInputViewSet inputAssistantView](self, "inputAssistantView");
  v8 = objc_claimAutoreleasedReturnValue();
  inputAssistantView = v5->_inputAssistantView;
  v5->_inputAssistantView = (UIView *)v8;

  objc_msgSend(v4, "inputAccessoryView");
  v10 = objc_claimAutoreleasedReturnValue();
  inputAccessoryView = v5->_inputAccessoryView;
  v5->_inputAccessoryView = (UIView *)v10;

  -[UIInputViewSet inputViewController](self, "inputViewController");
  v12 = objc_claimAutoreleasedReturnValue();
  inputViewController = v5->_inputViewController;
  v5->_inputViewController = (UIInputViewController *)v12;

  -[UIInputViewSet assistantViewController](self, "assistantViewController");
  v14 = objc_claimAutoreleasedReturnValue();
  assistantViewController = v5->_assistantViewController;
  v5->_assistantViewController = (UIInputViewController *)v14;

  objc_msgSend(v4, "accessoryViewController");
  v16 = objc_claimAutoreleasedReturnValue();

  accessoryViewController = v5->_accessoryViewController;
  v5->_accessoryViewController = (UIInputViewController *)v16;

  v5->_isCustomInputView = -[UIInputViewSet isCustomInputView](self, "isCustomInputView");
  v5->_isNullInputView = -[UIInputViewSet isNullInputView](self, "isNullInputView");
  v5->_shouldShowDockView = -[UIInputViewSet shouldShowDockView](self, "shouldShowDockView");
  return v5;
}

- (void)_setRenderConfig:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[UIInputViewSet keyboard](self, "keyboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIInputViewSet keyboard](self, "keyboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setRenderConfig:", v8);

  }
  -[UIInputViewSet _themableInputAccessoryView](self, "_themableInputAccessoryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIInputViewSet _themableInputAccessoryView](self, "_themableInputAccessoryView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setRenderConfig:", v8);

  }
}

- (UIView)layeringView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UIInputViewSet inputView](self, "inputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (UIView *)v6;
}

- (UIView)splitExemptSubview
{
  void *v2;
  void *v3;
  void *v4;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "showsCandidateBar"))
  {
    objc_msgSend(v2, "candidateController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "candidateBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return (UIView *)v4;
}

- (void)_forceRestoreUsingBecomeFirstResponder:(BOOL)a3
{
  self->_restoreUsingBecomeFirstResponder = a3;
}

- (void)setRestoreUsingBecomeFirstResponder:(BOOL)a3
{
  self->_restoreUsingBecomeFirstResponder = a3 & ~dyld_program_sdk_at_least();
}

- (BOOL)restoreUsingBecomeFirstResponder
{
  return self->_restoreUsingBecomeFirstResponder;
}

- (BOOL)containsView:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  BOOL v8;

  v4 = a3;
  -[UIInputViewSet inputView](self, "inputView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    v8 = 1;
  }
  else
  {
    -[UIInputViewSet inputAssistantView](self, "inputAssistantView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v4)
    {
      v8 = 1;
    }
    else
    {
      -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v7 == v4;

    }
  }

  return v8;
}

- (BOOL)isStrictSupersetOfViewSet:(id)a3
{
  void *v3;
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self) & 1) == 0)
  {
    objc_msgSend(v5, "inputAccessoryView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "inputAccessoryView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v8 != (void *)v9)
      {
        v3 = (void *)v9;
        v6 = 0;
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
      v3 = v8;
    }
    objc_msgSend(v5, "inputView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v5, "inputView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputViewSet inputView](self, "inputView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v11 == v12;

    }
    else
    {
      v6 = 1;
    }

    v8 = v3;
    if (!v7)
      goto LABEL_13;
    goto LABEL_12;
  }
  v6 = 0;
LABEL_14:

  return v6;
}

- (int64_t)keyboardOrientation:(id)a3
{
  __objc2_class *v4;
  void *v5;
  int64_t v6;
  __objc2_class *v7;

  v4 = (__objc2_class *)a3;
  if (-[UIInputViewSet _isKeyboard](self, "_isKeyboard"))
  {
    -[UIInputViewSet keyboard](self, "keyboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "interfaceOrientation");

  }
  else
  {
    if (v4)
      v7 = v4;
    else
      v7 = UIKeyboardSceneDelegate;
    v6 = -[__objc2_class interfaceOrientation](v7, "interfaceOrientation");
  }

  return v6;
}

- (BOOL)inSyncWithOrientation:(int64_t)a3 forKeyboard:(id)a4
{
  UIView *inputAccessoryView;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if (-[UIInputViewSet keyboardOrientation:](self, "keyboardOrientation:", a4) != a3)
    return 0;
  inputAccessoryView = self->_inputAccessoryView;
  if (!inputAccessoryView)
    return 1;
  -[UIView bounds](inputAccessoryView, "bounds");
  v8 = v7;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;

  v14 = (unint64_t)(a3 - 3) >= 2 ? v11 : v13;
  return v8 == v14;
}

- (BOOL)__isCKAccessoryView
{
  void *v3;
  void *v4;
  objc_class *v5;
  const char *Name;

  -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  Name = class_getName(v5);

  return strcmp(Name, "CKMessageEntryView") == 0;
}

- (BOOL)_isFullscreen
{
  id *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  BOOL v14;

  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", 0);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[UIWindow _fbsScene](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v2, "frame");
  if (v10 == v6 && v9 == v8)
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend(v2, "frame");
    v14 = v13 == v6 && v12 == v8;
  }

  return v14;
}

- (BOOL)_actLikeInputAccessoryViewSupportsSplit
{
  if (-[UIInputViewSet _inputAccessoryViewSupportsSplit](self, "_inputAccessoryViewSupportsSplit"))
    return 1;
  else
    return !-[UIInputViewSet _isFullscreen](self, "_isFullscreen");
}

- (BOOL)isLocalMinimumHeightInputView
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[UIInputViewSet isInputViewPlaceholder](self, "isInputViewPlaceholder");
  if (v3)
  {
    -[UIInputViewSet inputView](self, "inputView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isLocalMinimumHeightPlaceholder");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (double)inputViewSplitHeight
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  if (-[UIInputViewSet _isKeyboard](self, "_isKeyboard"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frameForKeylayoutName:", CFSTR("split-left"));
    v5 = v4;

  }
  else if (-[UIInputViewSet supportsSplit](self, "supportsSplit"))
  {
    -[UIView leftContentViewSize](self->_inputView, "leftContentViewSize");
    return v6;
  }
  else
  {
    -[UIInputViewSet inputViewBounds](self, "inputViewBounds");
    return v7;
  }
  return v5;
}

- (CGRect)_leftInputViewSetFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect result;

  if (-[UIInputViewSet _isKeyboard](self, "_isKeyboard"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frameForKeylayoutName:", CFSTR("split-left"));
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

  }
  else
  {
    v12 = -[UIInputViewSet supportsSplit](self, "supportsSplit");
    v5 = *MEMORY[0x1E0C9D538];
    v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    if (v12)
    {
      -[UIView leftContentViewSize](self->_inputView, "leftContentViewSize");
      v9 = v13;
      v11 = v14;
    }
    else
    {
      -[UIInputViewSet inputViewBounds](self, "inputViewBounds");
      v9 = v15 * 0.5;
      -[UIInputViewSet inputViewBounds](self, "inputViewBounds");
      v11 = v16;
    }
  }
  -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (-[UIInputViewSet isSplit](self, "isSplit")
      && -[UIInputViewSet _inputAccessoryViewSupportsSplit](self, "_inputAccessoryViewSupportsSplit"))
    {
      -[UIView leftContentViewSize](self->_inputAccessoryView, "leftContentViewSize");
      v11 = v11 + v18;
    }
    else
    {
      -[UIView bounds](self->_inputAccessoryView, "bounds");
      v11 = v11 + v19;
    }
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "showsCandidateBar");

  if (v21)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "candidateController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "candidateBarHeight");
    v11 = v11 + v24;

  }
  v25 = v5;
  v26 = v7;
  v27 = v9;
  v28 = v11;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)_rightInputViewSetFrame
{
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
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect result;

  if (-[UIInputViewSet _isKeyboard](self, "_isKeyboard"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frameForKeylayoutName:", CFSTR("split-right"));
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

  }
  else
  {
    if (-[UIInputViewSet supportsSplit](self, "supportsSplit"))
    {
      -[UIView rightContentViewSize](self->_inputView, "rightContentViewSize");
      v9 = v12;
      v11 = v13;
      -[UIInputViewSet inputViewBounds](self, "inputViewBounds");
      v5 = v14 - v9;
    }
    else
    {
      -[UIInputViewSet inputViewBounds](self, "inputViewBounds");
      v5 = v15 * 0.5;
      -[UIInputViewSet inputViewBounds](self, "inputViewBounds");
      v9 = v16 * 0.5;
      -[UIInputViewSet inputViewBounds](self, "inputViewBounds");
      v11 = v17;
    }
    v7 = 0.0;
  }
  -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    if (-[UIInputViewSet supportsSplit](self, "supportsSplit")
      && -[UIInputViewSet _inputAccessoryViewSupportsSplit](self, "_inputAccessoryViewSupportsSplit"))
    {
      -[UIView rightContentViewSize](self->_inputAccessoryView, "rightContentViewSize");
      v11 = v11 + v19;
    }
    else
    {
      -[UIView bounds](self->_inputAccessoryView, "bounds");
      v11 = v11 + v20;
    }
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "showsCandidateBar");

  if (v22)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "candidateController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "candidateBarHeight");
    v11 = v11 + v25;

  }
  v26 = v5;
  v27 = v7;
  v28 = v9;
  v29 = v11;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (BOOL)hierarchyContainsView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  -[UIInputViewSet inputView](self, "inputView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_6;
  if (-[UIInputViewSet isInputViewPlaceholder](self, "isInputViewPlaceholder"))
  {
    objc_msgSend(v5, "placeheldView");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  if ((objc_msgSend(v4, "isDescendantOfView:", v5) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
LABEL_6:
    -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_11;
    if (-[UIInputViewSet isInputAccessoryViewPlaceholder](self, "isInputAccessoryViewPlaceholder"))
    {
      objc_msgSend(v8, "placeheldView");
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    if ((objc_msgSend(v4, "isDescendantOfView:", v8) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
LABEL_11:
      -[UIInputViewSet inputAssistantView](self, "inputAssistantView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_16;
      if (-[UIInputViewSet isInputAssistantViewPlaceholder](self, "isInputAssistantViewPlaceholder"))
      {
        objc_msgSend(v10, "placeheldView");
        v11 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v11;
      }
      if ((objc_msgSend(v4, "isDescendantOfView:", v10) & 1) != 0)
        v7 = 1;
      else
LABEL_16:
        v7 = 0;

    }
  }

  return v7;
}

- (BOOL)setAccessoryViewVisible:(BOOL)a3 delay:(double)a4
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  _QWORD v17[4];
  id v18;
  id v19;
  double v20;

  v5 = a3;
  -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "showsCandidateBar");

  if (v8)
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "candidateController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "candidateBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  v12 = (double)v5;
  if ((!v6 || (objc_msgSend(v6, "alpha"), v13 == v12)) && (!v11 || (objc_msgSend(v11, "alpha"), v14 == v12)))
  {
    v15 = 0;
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __48__UIInputViewSet_setAccessoryViewVisible_delay___block_invoke;
    v17[3] = &unk_1E16B1C28;
    v18 = v11;
    v20 = (double)v5;
    v19 = v6;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 117440512, v17, 0, 0.15, a4);

    v15 = 1;
  }

  return v15;
}

uint64_t __48__UIInputViewSet_setAccessoryViewVisible_delay___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", *(double *)(a1 + 48));
}

- (id)_themableInputAccessoryView
{
  UIView *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->_inputAccessoryView;
  else
    v3 = 0;
  return v3;
}

- (BOOL)_accessorySuppressesShadow
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  char v6;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    || (-[UIInputViewSet inputAccessoryView](self, "inputAccessoryView"), (v3 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v4 = (void *)v3, v5 = -[UIInputViewSet __isCKAccessoryView](self, "__isCKAccessoryView"), v4, v5))
  {
    v6 = 0;
  }
  else
  {
    -[UIInputViewSet _splittableInputAccessoryView](self, "_splittableInputAccessoryView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      isKindOfClass = objc_msgSend(v8, "_isToolbars");
    }
    else
    {
      -[UIInputViewSet inputAccessoryView](self, "inputAccessoryView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

    }
    v6 = isKindOfClass ^ 1;

  }
  return v6 & 1;
}

- (void)_beginSplitTransitionIfNeeded
{
  double Width;
  double v4;
  double v5;
  void *v6;
  char v7;
  CGRect v8;
  CGRect v9;
  CGRect v10;

  -[UIInputViewSet _leftInputViewSetFrame](self, "_leftInputViewSetFrame");
  Width = CGRectGetWidth(v8);
  -[UIInputViewSet inputViewBounds](self, "inputViewBounds");
  v4 = CGRectGetWidth(v9);
  -[UIInputViewSet _rightInputViewSetFrame](self, "_rightInputViewSetFrame");
  v5 = v4 - CGRectGetWidth(v10) - Width;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "centerFilled");

  if (!-[UIInputViewSet _isKeyboard](self, "_isKeyboard")
    && -[UIInputViewSet _inputViewSupportsSplit](self, "_inputViewSupportsSplit"))
  {
    -[UIView _beginSplitTransitionIfNeeded:gapWidth:](self->_inputView, "_beginSplitTransitionIfNeeded:gapWidth:", Width, v5);
  }
  if ((v7 & 1) == 0)
  {
    if (-[UIInputViewSet _inputAccessoryViewSupportsSplit](self, "_inputAccessoryViewSupportsSplit"))
      -[UIView _beginSplitTransitionIfNeeded:gapWidth:](self->_inputAccessoryView, "_beginSplitTransitionIfNeeded:gapWidth:", Width, v5);
  }
}

- (void)_endSplitTransitionIfNeeded
{
  _BOOL8 v3;
  void *v4;
  char v5;

  v3 = -[UIInputViewSet isSplit](self, "isSplit");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "centerFilled");

  if (!-[UIInputViewSet _isKeyboard](self, "_isKeyboard")
    && -[UIInputViewSet _inputViewSupportsSplit](self, "_inputViewSupportsSplit"))
  {
    -[UIView _endSplitTransitionIfNeeded:](self->_inputView, "_endSplitTransitionIfNeeded:", v3);
  }
  if ((v5 & 1) == 0)
  {
    if (-[UIInputViewSet _inputAccessoryViewSupportsSplit](self, "_inputAccessoryViewSupportsSplit"))
      -[UIView _endSplitTransitionIfNeeded:](self->_inputAccessoryView, "_endSplitTransitionIfNeeded:", v3);
  }
}

- (void)_setSplitProgress:(double)a3
{
  void *v5;
  char v6;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "centerFilled");

  if (!-[UIInputViewSet _isKeyboard](self, "_isKeyboard")
    && -[UIInputViewSet _inputViewSupportsSplit](self, "_inputViewSupportsSplit"))
  {
    -[UIView _setProgress:boundedBy:](self->_inputView, "_setProgress:boundedBy:", a3, 0.0);
  }
  if ((v6 & 1) == 0)
  {
    if (-[UIInputViewSet _inputAccessoryViewSupportsSplit](self, "_inputAccessoryViewSupportsSplit"))
      -[UIView _setProgress:boundedBy:](self->_inputAccessoryView, "_setProgress:boundedBy:", a3, 0.25);
  }
}

- (void)setInputAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_inputAccessoryView, a3);
}

- (double)splitHeightDelta
{
  return self->_splitHeightDelta;
}

- (void)setSplitHeightDelta:(double)a3
{
  self->_splitHeightDelta = a3;
}

- (UIResponder)restorableResponder
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_restorableResponder);
}

- (void)setRestorableResponder:(id)a3
{
  objc_storeWeak((id *)&self->_restorableResponder, a3);
}

- (UIKBRenderConfig)restorableRenderConfig
{
  return self->_restorableRenderConfig;
}

- (void)setRestorableRenderConfig:(id)a3
{
  objc_storeStrong((id *)&self->_restorableRenderConfig, a3);
}

- (UIResponder)accessoryViewNextResponder
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_accessoryViewNextResponder);
}

- (void)setAccessoryViewNextResponder:(id)a3
{
  objc_storeWeak((id *)&self->_accessoryViewNextResponder, a3);
}

- (CGRect)inputAssistantViewBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inputAssistantViewBounds.origin.x;
  y = self->_inputAssistantViewBounds.origin.y;
  width = self->_inputAssistantViewBounds.size.width;
  height = self->_inputAssistantViewBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
