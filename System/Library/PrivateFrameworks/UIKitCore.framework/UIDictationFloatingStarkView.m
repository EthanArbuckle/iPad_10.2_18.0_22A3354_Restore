@implementation UIDictationFloatingStarkView

- (UIDictationFloatingStarkView)initWithFrame:(CGRect)a3
{
  UIDictationFloatingStarkView *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UIButton *endpointButton;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIDictationFloatingStarkView *v18;
  objc_super v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)UIDictationFloatingStarkView;
  v3 = -[UIDictationView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_applicationEnteredBackground, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel_keyboardDidShow_, CFSTR("UIKeyboardDidShowNotification"), 0);

    +[UIButton buttonWithType:](UIKeyboardDictationStarkDoneButton, "buttonWithType:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    endpointButton = v3->super._endpointButton;
    v3->super._endpointButton = (UIButton *)v6;

    -[UIControl addTarget:action:forControlEvents:](v3->super._endpointButton, "addTarget:action:forControlEvents:", v3, sel_endpointButtonPressed, 64);
    -[UIButton setFrame:](v3->super._endpointButton, "setFrame:", 0.0, 0.0, 143.0, 48.0);
    v23 = *(_QWORD *)off_1E1678D90;
    objc_msgSend(off_1E167A828, "systemFontOfSize:", 20.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v8;
    v24 = *(_QWORD *)off_1E1678D98;
    v9 = v24;
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.8, 0.8, 0.8, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v23, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    _UIKitBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Done"), CFSTR("Done"), CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v13, v11);
    -[UIButton setAttributedTitle:forState:](v3->super._endpointButton, "setAttributedTitle:forState:", v14, 0);
    v15 = (void *)objc_msgSend(v14, "mutableCopy");
    v21 = v9;
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.5, 0.5, 0.5, 1.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "addAttributes:range:", v17, 0, objc_msgSend(v13, "length"));
    -[UIButton setAttributedTitle:forState:](v3->super._endpointButton, "setAttributedTitle:forState:", v15, 1);
    v18 = v3;

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  UIDictationFloatingStarkView *v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)UIDictationFloatingStarkView;
  -[UIView layoutSubviews](&v23, sel_layoutSubviews);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIStatusBarManagerForWindow(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusBarHeight");
  v6 = v5;

  v7 = v6 + 20.0;
  v8 = v6 + 20.0 + 100.0 + 20.0;
  -[UIView frame](self, "frame");
  v10 = v9 * 0.5;
  -[UIView size](self, "size");
  v12 = v11 - v8;
  -[UIView size](self->super._endpointButton, "size");
  -[UIView setCenter:](self->super._endpointButton, "setCenter:", v10, v12 - v13 * 0.5);
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scene");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "screen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "_capabilityForKey:", CFSTR("UIScreenCapabilityTouchLevelsKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue");

  -[UIView superview](self->super._endpointButton, "superview");
  v19 = (UIDictationFloatingStarkView *)objc_claimAutoreleasedReturnValue();

  if (v18 == 2)
  {
    if (v19 == self)
      -[UIView removeFromSuperview](self->super._endpointButton, "removeFromSuperview");
  }
  else if (v19 != self)
  {
    -[UIView addSubview:](self, "addSubview:", self->super._endpointButton);
  }
  -[UIView size](self, "size");
  v21 = v20 + -100.0 - v7;
  -[UIView size](self, "size");
  -[SUICFlamesView setFrame:](self->super._flamesView, "setFrame:", 0.0, v21, v22, 100.0);
  -[SUICFlamesView setNeedsLayout](self->super._flamesView, "setNeedsLayout");

}

- (void)finishReturnToKeyboard
{
  _BOOL8 automaticAppearanceWasEnabled;
  id v3;

  automaticAppearanceWasEnabled = self->super._automaticAppearanceWasEnabled;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutomaticAppearanceEnabled:", automaticAppearanceWasEnabled);

}

- (void)prepareForReturnToKeyboard
{
  void *v3;
  id v4;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->super._automaticAppearanceWasEnabled = objc_msgSend(v3, "automaticAppearanceEnabled");

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutomaticAppearanceEnabled:", 1);

}

- (void)setState:(int)a3
{
  uint64_t v3;
  double v5;
  double v6;
  objc_class *SUICFlamesViewClass;
  SUICFlamesView *flamesView;
  id v9;
  void *v10;
  SUICFlamesView *v11;
  SUICFlamesView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  objc_super v18;
  _QWORD v19[5];

  v3 = *(_QWORD *)&a3;
  if (a3 == 2)
  {
    -[UIView bounds](self, "bounds");
    v6 = v5;
    SUICFlamesViewClass = (objc_class *)getSUICFlamesViewClass();
    flamesView = self->super._flamesView;
    if (flamesView)
    {
      -[SUICFlamesView setFrame:](flamesView, "setFrame:", 0.0, 0.0, v6, 100.0);
    }
    else
    {
      v9 = [SUICFlamesViewClass alloc];
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (SUICFlamesView *)objc_msgSend(v9, "initWithFrame:screen:fidelity:", v10, 2, 0.0, 0.0, v6, 100.0);
      v12 = self->super._flamesView;
      self->super._flamesView = v11;

    }
    -[SUICFlamesView setDelegate:](self->super._flamesView, "setDelegate:", self);
    -[SUICFlamesView setMode:](self->super._flamesView, "setMode:", 1);
    -[SUICFlamesView setState:](self->super._flamesView, "setState:", 1);
    -[SUICFlamesView setNeedsLayout](self->super._flamesView, "setNeedsLayout");
    -[UIView addSubview:](self, "addSubview:", self->super._flamesView);
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "screen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "_capabilityForKey:", CFSTR("UIScreenCapabilityTouchLevelsKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue");

    if (v17 != 2)
      -[UIView addSubview:](self, "addSubview:", self->super._endpointButton);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __41__UIDictationFloatingStarkView_setState___block_invoke;
    v19[3] = &unk_1E16B1B28;
    v19[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v19, &__block_literal_global_234_0, 0.1, 0.0);
    -[UIView setNeedsLayout](self, "setNeedsLayout");

  }
  v18.receiver = self;
  v18.super_class = (Class)UIDictationFloatingStarkView;
  -[UIDictationView setState:](&v18, sel_setState_, v3);
}

uint64_t __41__UIDictationFloatingStarkView_setState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 1.0);
}

- (void)setInputViewsHiddenForDictation:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  void *v11;
  _QWORD v12[4];
  void *v13;

  v3 = a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__UIDictationFloatingStarkView_setInputViewsHiddenForDictation___block_invoke;
    v12[3] = &unk_1E16B1B28;
    v6 = &v13;
    v13 = v5;
    v7 = v5;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v12, &__block_literal_global_236_0, 0.25);
  }
  else
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMinimized:", 0);

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__UIDictationFloatingStarkView_setInputViewsHiddenForDictation___block_invoke_3;
    v10[3] = &unk_1E16B1B28;
    v6 = &v11;
    v11 = v5;
    v9 = v5;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v10, 0, 0.25, 0.25);
  }

}

uint64_t __64__UIDictationFloatingStarkView_setInputViewsHiddenForDictation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __64__UIDictationFloatingStarkView_setInputViewsHiddenForDictation___block_invoke_2()
{
  id v0;

  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setMinimized:", 1);

}

uint64_t __64__UIDictationFloatingStarkView_setInputViewsHiddenForDictation___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)dimmingViewWasTapped:(id)a3
{
  id v3;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelDictation");

}

- (void)returnToKeyboard
{
  _BOOL8 automaticAppearanceWasEnabled;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  automaticAppearanceWasEnabled = self->super._automaticAppearanceWasEnabled;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutomaticAppearanceEnabled:", automaticAppearanceWasEnabled);

  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disableInterfaceAutorotation:", 0);

  -[UIDictationFloatingStarkView prepareForReturnToKeyboard](self, "prepareForReturnToKeyboard");
  self->super._keyboardInTransition = 1;
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "disableInterfaceAutorotation:", 1);

  v7[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__UIDictationFloatingStarkView_returnToKeyboard__block_invoke;
  v8[3] = &unk_1E16B1B28;
  v8[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__UIDictationFloatingStarkView_returnToKeyboard__block_invoke_2;
  v7[3] = &unk_1E16B3FD8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v8, v7, 0.125, 0.0);
  -[UIDictationFloatingStarkView finishReturnToKeyboard](self, "finishReturnToKeyboard");
}

uint64_t __48__UIDictationFloatingStarkView_returnToKeyboard__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __48__UIDictationFloatingStarkView_returnToKeyboard__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "setInputViewsHiddenForDictation:", 0);
  objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel_keyboardDidShow_, 0, 0.1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "removeFromSuperview");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setDelegate:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 448);
  *(_QWORD *)(v2 + 448) = 0;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "removeFromSuperview");
}

- (CGPoint)positionForShow
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGPoint result;

  -[UIDictationView currentScreenSize](self, "currentScreenSize");
  v3 = v2 * 0.5;
  v5 = v4 * 0.5;
  result.y = v5;
  result.x = v3;
  return result;
}

- (void)show
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  self->super._automaticAppearanceWasEnabled = objc_msgSend(v12, "automaticAppearanceEnabled");
  objc_msgSend(v12, "setAutomaticAppearanceEnabled:", 0);
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disableInterfaceAutorotation:", 1);

  objc_msgSend(v12, "containerWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginDisablingInterfaceAutorotation");

  -[UIDictationFloatingStarkView setInputViewsHiddenForDictation:](self, "setInputViewsHiddenForDictation:", 1);
  +[UIWindowScene _keyWindowScene]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIDictationView viewSize](UIDictationView, "viewSize");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "size");
  -[UIView setFrame:](self, "setFrame:", 0.0, v11 - v10, v8, v10);
  objc_msgSend(v6, "addSubview:", self);
  -[UIView setAlpha:](self, "setAlpha:", 1.0);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
  -[UIView setAlpha:](self->super._endpointButton, "setAlpha:", 0.0);

}

- (void)endpointButtonPressed
{
  id v2;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopDictation");

}

@end
