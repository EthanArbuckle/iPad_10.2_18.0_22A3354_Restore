@implementation TUIEmojiSearchTextField

- (TUIEmojiSearchTextField)initWithFrame:(CGRect)a3
{
  return -[TUIEmojiSearchTextField initWithFrame:pretendsToBecomeFirstResponder:](self, "initWithFrame:pretendsToBecomeFirstResponder:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (TUIEmojiSearchTextField)initWithFrame:(CGRect)a3 pretendsToBecomeFirstResponder:(BOOL)a4
{
  TUIEmojiSearchTextField *v5;
  TUIEmojiSearchTextField *v6;
  uint64_t v7;
  TUIEmojiSearchTextFieldBackgroundView *backgroundView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UIImageView *magnifyingGlassView;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)TUIEmojiSearchTextField;
  v5 = -[TUIEmojiSearchTextField initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_pretendsToBecomeFirstResponder = a4;
    v7 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    backgroundView = v6->_backgroundView;
    v6->_backgroundView = (TUIEmojiSearchTextFieldBackgroundView *)v7;

    -[TUIEmojiSearchTextField insertSubview:atIndex:](v6, "insertSubview:atIndex:", v6->_backgroundView, 0);
    -[TUIEmojiSearchTextField layer](v6, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupBlending:", 0);

    -[TUIEmojiSearchTextField setClearButtonMode:](v6, "setClearButtonMode:", 1);
    -[TUIEmojiSearchTextField setAutocapitalizationType:](v6, "setAutocapitalizationType:", 0);
    -[TUIEmojiSearchTextField setDelegate:](v6, "setDelegate:", v6);
    v10 = (void *)MEMORY[0x1E0DC3888];
    -[TUIEmojiSearchTextField font](v6, "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configurationWithFont:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_configurationIgnoringDynamicType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("magnifyingglass"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v14);
    magnifyingGlassView = v6->_magnifyingGlassView;
    v6->_magnifyingGlassView = (UIImageView *)v15;

    -[UIImageView setContentMode:](v6->_magnifyingGlassView, "setContentMode:", 4);
    v17 = *MEMORY[0x1E0CD2E98];
    -[TUIEmojiSearchTextField _placeholderLabel](v6, "_placeholderLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCompositingFilter:", v17);

    -[UIImageView sizeToFit](v6->_magnifyingGlassView, "sizeToFit");
    -[TUIEmojiSearchTextField setLeftView:](v6, "setLeftView:", v6->_magnifyingGlassView);
    -[TUIEmojiSearchTextField setLeftViewMode:](v6, "setLeftViewMode:", 3);
    -[TUIEmojiSearchTextField setRightViewMode:](v6, "setRightViewMode:", 3);
    objc_msgSend(MEMORY[0x1E0DC3658], "_systemInteractionTintColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiSearchTextField setTintColor:](v6, "setTintColor:", v20);

  }
  return v6;
}

- (id)_textAndGlyphColorForRenderConfig:(id)a3
{
  int v3;
  double v4;

  v3 = objc_msgSend(a3, "lightKeyboard");
  v4 = 0.36;
  if (v3)
    v4 = 0.6;
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v4, 1.0);
}

- (id)_textAndGlyphCompositingFilterForRenderConfig:(id)a3
{
  int v3;
  id *v4;

  v3 = objc_msgSend(a3, "lightKeyboard");
  v4 = (id *)MEMORY[0x1E0CD2E98];
  if (!v3)
    v4 = (id *)MEMORY[0x1E0CD2EA0];
  return *v4;
}

- (void)_setRenderConfig:(id)a3
{
  id v4;
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TUIEmojiSearchTextField;
  v4 = a3;
  -[TUIEmojiSearchTextField _setRenderConfig:](&v15, sel__setRenderConfig_, v4);
  -[TUIEmojiSearchTextField _textAndGlyphColorForRenderConfig:](self, "_textAndGlyphColorForRenderConfig:", v4, v15.receiver, v15.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIEmojiSearchTextField _textAndGlyphCompositingFilterForRenderConfig:](self, "_textAndGlyphCompositingFilterForRenderConfig:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_magnifyingGlassView, "setTintColor:", v5);
  -[TUIEmojiSearchTextField _placeholderLabel](self, "_placeholderLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v5);

  -[TUIEmojiSearchTextField _clearButton](self, "_clearButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v5);

  -[UIImageView layer](self->_magnifyingGlassView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCompositingFilter:", v6);

  -[TUIEmojiSearchTextField _placeholderLabel](self, "_placeholderLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCompositingFilter:", v6);

  -[TUIEmojiSearchTextField _clearButton](self, "_clearButton");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCompositingFilter:", v6);

  LOBYTE(v12) = objc_msgSend(v4, "lightKeyboard");
  if ((v12 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIEmojiSearchTextField setTextColor:](self, "setTextColor:", v14);

}

- (id)_clearButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUIEmojiSearchTextField;
  -[TUIEmojiSearchTextField _clearButton](&v9, sel__clearButton);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIEmojiSearchTextField _inheritedRenderConfig](self, "_inheritedRenderConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIEmojiSearchTextField _textAndGlyphCompositingFilterForRenderConfig:](self, "_textAndGlyphCompositingFilterForRenderConfig:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCompositingFilter:", v5);

  -[TUIEmojiSearchTextField _textAndGlyphColorForRenderConfig:](self, "_textAndGlyphColorForRenderConfig:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v7);

  return v3;
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUIEmojiSearchTextField;
  -[TUIEmojiSearchTextField didMoveToWindow](&v4, sel_didMoveToWindow);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__windowBecameKeyNotificationPosted_, *MEMORY[0x1E0DC5608], 0);

}

- (id)portalView
{
  TUIEmojiSearchTextFieldPortalView *v3;
  TUIEmojiSearchTextFieldPortalView *portalView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (!self->_portalView)
  {
    v3 = -[_UIPortalView initWithSourceView:]([TUIEmojiSearchTextFieldPortalView alloc], "initWithSourceView:", self);
    portalView = self->_portalView;
    self->_portalView = v3;

    -[TUIEmojiSearchTextFieldPortalView setHitTestView:](self->_portalView, "setHitTestView:", self);
    -[_UIPortalView setHidesSourceView:](self->_portalView, "setHidesSourceView:", 1);
    -[_UIPortalView setForwardsClientHitTestingToSourceView:](self->_portalView, "setForwardsClientHitTestingToSourceView:", 1);
    -[TUIEmojiSearchTextFieldPortalView addObserver:forKeyPath:options:context:](self->_portalView, "addObserver:forKeyPath:options:context:", self, CFSTR("frame"), 1, kFrameChangeContext);
    -[TUIEmojiSearchTextFieldPortalView addObserver:forKeyPath:options:context:](self->_portalView, "addObserver:forKeyPath:options:context:", self, CFSTR("bounds"), 1, kFrameChangeContext);
    objc_msgSend(MEMORY[0x1E0DC3980], "activeKeyboardSceneDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "scene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0DC3DB0], "activeTextEffectsWindowForWindowScene:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
          objc_msgSend(v8, "addSubview:", self);

      }
    }

  }
  -[TUIEmojiSearchTextField frame](self, "frame");
  -[_UIPortalView setFrame:](self->_portalView, "setFrame:");
  return self->_portalView;
}

- (void)_updatePlaceholderPosition
{
  uint64_t v3;
  id v4;

  if (-[TUIEmojiSearchTextField _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v3 = 2;
  else
    v3 = 0;
  -[TUIEmojiSearchTextField _placeholderLabel](self, "_placeholderLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextAlignment:", v3);

}

- (void)layoutSubviews
{
  objc_super v3;

  -[TUIEmojiSearchTextField setLeftView:](self, "setLeftView:", self->_magnifyingGlassView);
  -[TUIEmojiSearchTextField setRightView:](self, "setRightView:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TUIEmojiSearchTextField;
  -[TUIEmojiSearchTextField layoutSubviews](&v3, sel_layoutSubviews);
  -[TUIEmojiSearchTextField bounds](self, "bounds");
  -[TUIEmojiSearchTextFieldBackgroundView setFrame:](self->_backgroundView, "setFrame:");
  if (-[TUIEmojiSearchTextField isActive](self, "isActive"))
    -[TUIEmojiSearchTextField _setCursorVisibleAndBlinks:](self, "_setCursorVisibleAndBlinks:", 1);
}

- (CGRect)leftViewRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGRect result;

  v14.receiver = self;
  v14.super_class = (Class)TUIEmojiSearchTextField;
  -[TUIEmojiSearchTextField leftViewRectForBounds:](&v14, sel_leftViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  UIRectInsetEdges();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = TUIRemoteEmojiSearchViewControllerEnabled();
  v10 = 10.0;
  if (v9)
    v10 = 3.0;
  v11 = v4;
  v12 = v6;
  v13 = v8;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)TUIEmojiSearchTextField;
  -[TUIEmojiSearchTextField rightViewRectForBounds:](&v8, sel_rightViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  UIRectInsetEdges();
  v7 = width - v5 + -10.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v7;
  return result;
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect result;

  v17.receiver = self;
  v17.super_class = (Class)TUIEmojiSearchTextField;
  -[TUIEmojiSearchTextField clearButtonRectForBounds:](&v17, sel_clearButtonRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = TUIRemoteEmojiSearchViewControllerEnabled();
  v12 = 0.0;
  if (v11)
    v12 = -3.0;
  v13 = v4 + v12;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)insertionPointColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.004, 0.525, 0.988, 1.0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;

  if ((void *)kFrameChangeContext == a6)
  {
    objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8], a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CGRectValue");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    -[TUIEmojiSearchTextField _matchPortalViewFrame:](self, "_matchPortalViewFrame:", v9, v11, v13, v15);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)TUIEmojiSearchTextField;
    -[TUIEmojiSearchTextField observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_matchPortalViewFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
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

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TUIEmojiSearchTextField superview](self, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIEmojiSearchTextFieldPortalView superview](self->_portalView, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:fromView:", v9, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[TUIEmojiSearchTextField setFrame:](self, "setFrame:", v11, v13, v15, v17);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  NSDate *v5;
  NSDate *highlightBeginTime;
  TUIEmojiSearchTextFieldBackgroundView *backgroundView;
  uint64_t v8;
  _BOOL8 v9;
  TUIEmojiSearchTextFieldBackgroundView *v10;
  NSDate *v11;
  double v12;
  objc_super v13;

  v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TUIEmojiSearchTextField;
  -[TUIEmojiSearchTextField setHighlighted:](&v13, sel_setHighlighted_);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    highlightBeginTime = self->_highlightBeginTime;
    self->_highlightBeginTime = v5;

    backgroundView = self->_backgroundView;
    v8 = 2;
    v9 = 1;
  }
  else
  {
    v10 = self->_backgroundView;
    v11 = self->_highlightBeginTime;
    if (v11)
    {
      -[NSDate timeIntervalSinceNow](v11, "timeIntervalSinceNow");
      v9 = v12 < -0.3;
    }
    else
    {
      v9 = 0;
    }
    backgroundView = v10;
    v8 = 1;
  }
  -[TUIEmojiSearchTextFieldBackgroundView setBackgroundStyle:animated:](backgroundView, "setBackgroundStyle:animated:", v8, v9);
}

- (void)_setCursorVisibleAndBlinks:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  -[TUIEmojiSearchTextField interactionAssistant](self, "interactionAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCursorVisible:", v3);

  -[TUIEmojiSearchTextField interactionAssistant](self, "interactionAssistant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  -[TUIEmojiSearchTextField interactionAssistant](self, "interactionAssistant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v8, "setCursorBlinkAnimationEnabled:", v3);
  }
  else
  {
    objc_msgSend(v8, "selectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCaretBlinks:", v3);

  }
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  if (self->_active != a3)
  {
    v3 = a3;
    self->_active = a3;
    -[TUIEmojiSearchTextField _setCursorVisibleAndBlinks:](self, "_setCursorVisibleAndBlinks:");
    if (v3)
    {
      -[TUIEmojiSearchTextField _attachFieldEditor](self, "_attachFieldEditor");
      -[TUIEmojiSearchTextField interactionAssistant](self, "interactionAssistant");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activateSelection");
    }
    else
    {
      -[TUIEmojiSearchTextField _detachFieldEditor](self, "_detachFieldEditor");
      -[TUIEmojiSearchTextField interactionAssistant](self, "interactionAssistant");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deactivateSelection");
    }

  }
}

- (BOOL)isActive
{
  if (self->_pretendsToBecomeFirstResponder)
    return self->_active;
  else
    return -[TUIEmojiSearchTextField isFirstResponder](self, "isFirstResponder");
}

- (BOOL)isEditing
{
  objc_super v3;

  if (self->_pretendsToBecomeFirstResponder)
    return -[TUIEmojiSearchTextField isActive](self, "isActive");
  v3.receiver = self;
  v3.super_class = (Class)TUIEmojiSearchTextField;
  return -[TUIEmojiSearchTextField isEditing](&v3, sel_isEditing);
}

- (void)_windowBecameKeyNotificationPosted:(id)a3
{
  if (-[TUIEmojiSearchTextField pretendsToBecomeFirstResponder](self, "pretendsToBecomeFirstResponder", a3))
    -[TUIEmojiSearchTextField setActive:](self, "setActive:", 0);
}

- (BOOL)canBecomeFirstResponder
{
  return !-[TUIEmojiSearchTextField pretendsToBecomeFirstResponder](self, "pretendsToBecomeFirstResponder");
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  TUIEmojiSearchTextFieldPortalView *portalView;
  void *v8;
  void *v9;
  objc_super v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (-[TUIEmojiSearchTextField isActive](self, "isActive"))
  {
    if (-[TUIEmojiSearchTextField pretendsToBecomeFirstResponder](self, "pretendsToBecomeFirstResponder"))
      goto LABEL_8;
  }
  else
  {
    -[TUIEmojiSearchTextField searchDelegate](self, "searchDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "emojiSearchTextFieldWillBecomeActive:", self);

    if (-[TUIEmojiSearchTextField pretendsToBecomeFirstResponder](self, "pretendsToBecomeFirstResponder"))
    {
      -[TUIEmojiSearchTextField setActive:](self, "setActive:", 1);
      -[TUIEmojiSearchTextField searchDelegate](self, "searchDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "emojiSearchTextFieldDidBecomeActive:", self);

      goto LABEL_8;
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)TUIEmojiSearchTextField;
  if (-[TUIEmojiSearchTextField becomeFirstResponder](&v11, sel_becomeFirstResponder))
  {
    -[TUIEmojiSearchTextField searchDelegate](self, "searchDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "emojiSearchTextFieldDidBecomeActive:", self);

    v6 = 1;
    goto LABEL_9;
  }
LABEL_8:
  v6 = 0;
LABEL_9:
  portalView = self->_portalView;
  if (portalView)
  {
    -[TUIEmojiSearchTextFieldPortalView frame](portalView, "frame");
    -[TUIEmojiSearchTextField _matchPortalViewFrame:](self, "_matchPortalViewFrame:");
  }
  v12 = CFSTR("ButtonConfiguration");
  v13[0] = &unk_1E25173E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("TUIEmojiSearchViewButtonConfigurationWillChangeNotification"), 0, v8);

  return v6;
}

- (BOOL)resignFirstResponder
{
  void *v3;
  BOOL v4;
  void *v5;
  objc_super v7;

  -[TUIEmojiSearchTextField searchDelegate](self, "searchDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emojiSearchTextFieldWillBecomeInactive:", self);

  if (-[TUIEmojiSearchTextField pretendsToBecomeFirstResponder](self, "pretendsToBecomeFirstResponder"))
  {
    -[TUIEmojiSearchTextField setActive:](self, "setActive:", 0);
    v4 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TUIEmojiSearchTextField;
    v4 = -[TUIEmojiSearchTextField resignFirstResponder](&v7, sel_resignFirstResponder);
  }
  -[TUIEmojiSearchTextField searchDelegate](self, "searchDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emojiSearchTextFieldDidBecomeInactive:", self);

  return v4;
}

- (CGRect)visibleRect
{
  void *v2;
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
  CGRect result;

  -[TUIEmojiSearchTextField window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)fieldEditorDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TUIEmojiSearchTextField;
  -[TUIEmojiSearchTextField fieldEditorDidChange:](&v14, sel_fieldEditorDidChange_, a3);
  if (-[TUIEmojiSearchTextField hasMarkedText](self, "hasMarkedText")
    && (-[TUIEmojiSearchTextField text](self, "text"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "length"),
        v4,
        v5 == 1))
  {
    -[TUIEmojiSearchTextField text](self, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "rangeOfCharacterFromSet:", v7))
      v9 = 0;
    else
      v9 = v8 == 1;
    v10 = v9;

  }
  else
  {
    v10 = 0;
  }
  -[TUIEmojiSearchTextField searchDelegate](self, "searchDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if ((v10 & 1) == 0)
    {
      -[TUIEmojiSearchTextField searchDelegate](self, "searchDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIEmojiSearchTextField text](self, "text");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "emojiSearchTextField:didChangeSearchString:", self, v13);

    }
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[TUIEmojiSearchTextField searchDelegate](self, "searchDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TUIEmojiSearchTextField searchDelegate](self, "searchDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "emojiSearchTextFieldWillClear:", self);

    -[TUIEmojiSearchTextField searchDelegate](self, "searchDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "emojiSearchTextField:didChangeSearchString:", self, &stru_1E24FC6C0);

  }
  return 1;
}

- (TUIEmojiSearchTextFieldDelegate)searchDelegate
{
  return (TUIEmojiSearchTextFieldDelegate *)objc_loadWeakRetained((id *)&self->_searchDelegate);
}

- (void)setSearchDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_searchDelegate, a3);
}

- (BOOL)pretendsToBecomeFirstResponder
{
  return self->_pretendsToBecomeFirstResponder;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_searchDelegate);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_magnifyingGlassView, 0);
  objc_storeStrong((id *)&self->_highlightBeginTime, 0);
}

+ (double)preferredHeight
{
  return 49.0;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v10;
  void *v11;
  char v12;
  objc_super v14;

  v6 = a4;
  if (sel_paste_ == a3)
  {
    if (-[TUIEmojiSearchTextField isEditing](self, "isEditing"))
    {
      objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hasStrings");
LABEL_20:
      v10 = v12;

      goto LABEL_23;
    }
LABEL_21:
    v10 = 0;
    goto LABEL_23;
  }
  if (sel_selectAll_ == a3)
  {
    if (-[TUIEmojiSearchTextField isEditing](self, "isEditing")
      && -[TUIEmojiSearchTextField hasText](self, "hasText"))
    {
      -[TUIEmojiSearchTextField selectedTextRange](self, "selectedTextRange");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEmpty");
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (sel_replace_ == a3)
  {
    v10 = 1;
    goto LABEL_23;
  }
  if (sel__share_ == a3 || sel__define_ == a3 || sel__translate_ == a3 || sel_captureTextFromCamera_ == a3)
    goto LABEL_21;
  v14.receiver = self;
  v14.super_class = (Class)TUIEmojiSearchTextField;
  v10 = -[TUIEmojiSearchTextField canPerformAction:withSender:](&v14, sel_canPerformAction_withSender_, a3, v6);
LABEL_23:

  return v10;
}

- (void)paste:(id)a3
{
  void *v4;
  id v5;
  objc_super v6;

  if (self->_pretendsToBecomeFirstResponder)
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "string");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[TUIEmojiSearchTextField insertText:](self, "insertText:", v5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TUIEmojiSearchTextField;
    -[TUIEmojiSearchTextField paste:](&v6, sel_paste_, a3);
  }
}

@end
