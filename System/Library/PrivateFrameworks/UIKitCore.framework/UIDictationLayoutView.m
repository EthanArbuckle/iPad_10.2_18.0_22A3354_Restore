@implementation UIDictationLayoutView

- (UIDictationLayoutView)initWithFrame:(CGRect)a3
{
  UIDictationLayoutView *v3;
  UILabel *v4;
  uint64_t v5;
  UILabel *languageLabel;
  uint64_t v7;
  UIButton *keyboardButton;
  UIButton *v9;
  void *v10;
  uint64_t v11;
  UIButton *globeButton;
  UIButton *v13;
  void *v14;
  UIButton *v15;
  UIPointerInteraction *v16;
  UIButton *v17;
  UIPointerInteraction *v18;
  UIView *v19;
  void *v20;
  UIView *waveTapEndpointButtonView;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)UIDictationLayoutView;
  v3 = -[UIDictationView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UILabel alloc];
    v5 = -[UILabel initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    languageLabel = v3->_languageLabel;
    v3->_languageLabel = (UILabel *)v5;

    -[UILabel setTextAlignment:](v3->_languageLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v3->_languageLabel, "setLineBreakMode:", 0);
    +[UIButton buttonWithType:](UIButton, "buttonWithType:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    keyboardButton = v3->_keyboardButton;
    v3->_keyboardButton = (UIButton *)v7;

    -[UIControl addTarget:action:forControlEvents:](v3->_keyboardButton, "addTarget:action:forControlEvents:", v3, sel_keyboardButtonPressed_, 64);
    v9 = v3->_keyboardButton;
    _UIImageWithName(CFSTR("dictation_keyboard.png"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v9, "setImage:forState:", v10, 0);

    -[UIButton setFrame:](v3->_keyboardButton, "setFrame:", 0.0, 0.0, 40.0, 40.0);
    +[UIButton buttonWithType:](UIButton, "buttonWithType:", 0);
    v11 = objc_claimAutoreleasedReturnValue();
    globeButton = v3->_globeButton;
    v3->_globeButton = (UIButton *)v11;

    -[UIControl addTarget:action:forControlEvents:](v3->_globeButton, "addTarget:action:forControlEvents:", v3, sel_globeButtonPressed_withEvent_, 4095);
    v13 = v3->_globeButton;
    _UIImageWithName(CFSTR("dictation_global.png"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v13, "setImage:forState:", v14, 0);

    -[UIButton setFrame:](v3->_globeButton, "setFrame:", 0.0, 0.0, 40.0, 40.0);
    v15 = v3->_keyboardButton;
    v16 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", v3);
    -[UIView addInteraction:](v15, "addInteraction:", v16);

    v17 = v3->_globeButton;
    v18 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", v3);
    -[UIView addInteraction:](v17, "addInteraction:", v18);

    +[UIButton buttonWithType:](UIButton, "buttonWithType:", 0);
    v19 = (UIView *)objc_claimAutoreleasedReturnValue();
    +[UIColor clearColor](UIColor, "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v19, "setBackgroundColor:", v20);

    -[UIView addTarget:action:forControlEvents:](v19, "addTarget:action:forControlEvents:", v3, sel_keyboardButtonPressed_, 64);
    waveTapEndpointButtonView = v3->_waveTapEndpointButtonView;
    v3->_waveTapEndpointButtonView = v19;

  }
  return v3;
}

- (id)darkGrayColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.314, 0.333, 0.36, 1.0);
}

- (void)keyboardButtonPressed:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  UIButton *v8;

  v8 = (UIButton *)a3;
  +[UIInputSwitcherView sharedInstance](UIInputSwitcherView, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isVisible"))
  {
    objc_msgSend(v4, "hide");
  }
  else
  {
    if (self->_keyboardButton == v8)
    {
      v5 = 15;
    }
    else if ((UIButton *)self->_waveTapEndpointButtonView == v8)
    {
      v5 = 14;
    }
    else
    {
      v5 = 0;
    }
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setReasonType:", v5);

    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopDictation");

  }
  -[UIDictationLayoutView returnToKeyboard](self, "returnToKeyboard");

}

- (void)updateLanguageLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *currentDictationLanguage;
  NSString *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  UILabel *languageLabel;
  void *v25;
  unint64_t v26;
  double v27;
  double v28;
  double v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  if (self->_blackTextColor)
    -[UIDictationLayoutView darkGrayColor](self, "darkGrayColor");
  else
    +[UIColor whiteColor](UIColor, "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)off_1E1678D90;
  v30[0] = *(_QWORD *)off_1E1678D98;
  v30[1] = v4;
  v31[0] = v3;
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 18.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  UIKeyboardLocalizedDictationDisplayName(self->_currentDictationLanguage);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  currentDictationLanguage = v7;
  if (!v7)
    currentDictationLanguage = self->_currentDictationLanguage;
  v9 = currentDictationLanguage;

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v9, v6);
  -[UILabel setAttributedText:](self->_languageLabel, "setAttributedText:", v10);

  -[UILabel setNumberOfLines:](self->_languageLabel, "setNumberOfLines:", 1);
  -[UIView sizeToFit](self->_languageLabel, "sizeToFit");
  -[UIView size](self, "size");
  v12 = v11;
  -[UIView center](self, "center");
  v14 = v12 - v13;
  -[UIView center](self, "center");
  if (v14 < v15)
    v15 = v14;
  v16 = v15 + v15;
  -[UIView window](self->_keyboardButton, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    v16 = v16 + -120.0;
  -[UIView size](self->_languageLabel, "size");
  if (v16 < v18)
    -[UILabel setNumberOfLines:](self->_languageLabel, "setNumberOfLines:", 2);
  -[UIView size](self->_languageLabel, "size");
  -[UIView setSize:](self->_languageLabel, "setSize:", v16, v19 * (double)-[UILabel numberOfLines](self->_languageLabel, "numberOfLines"));
  -[UIView superview](self->_keyboardButton, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[UIView size](self, "size");
    v22 = v21 * 0.5;
    -[UIView center](self->_keyboardButton, "center");
    languageLabel = self->_languageLabel;
  }
  else
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "interfaceOrientation") - 3;

    -[UIView size](self, "size");
    v22 = v27 * 0.5;
    -[UIView size](self, "size");
    languageLabel = self->_languageLabel;
    if (v26 > 1)
      v29 = -10.0;
    else
      v29 = -20.0;
    v23 = v28 + v29;
  }
  -[UIView setCenter:](languageLabel, "setCenter:", v22, v23);
  -[UIView addSubview:](self, "addSubview:", self->_languageLabel);
  -[UIView setAlpha:](self->_languageLabel, "setAlpha:", 1.0);

}

- (void)globeButtonPressed:(id)a3 withEvent:(id)a4
{
  id v6;
  double MidX;
  id v8;
  CGRect v9;
  CGRect v10;

  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "bounds");
  MidX = CGRectGetMidX(v9);
  objc_msgSend(v8, "bounds");
  objc_msgSend(v8, "convertPoint:toView:", 0, MidX, CGRectGetMidY(v10) + -20.0);
  -[UIDictationLayoutView globeButtonPressed:withEvent:location:](self, "globeButtonPressed:withEvent:location:", v8, v6);

}

- (void)globeButtonPressed:(id)a3 withEvent:(id)a4 location:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enabledDictationLanguages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    -[UIDictationView setSwitchingLanguage:](self, "setSwitchingLanguage:", 1);
    +[UIInputSwitcherView sharedInstance](UIInputSwitcherView, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __63__UIDictationLayoutView_globeButtonPressed_withEvent_location___block_invoke;
    v17[3] = &unk_1E16B1B28;
    v17[4] = self;
    v14 = (id)objc_msgSend(v13, "buttonPressed:withEvent:location:isForDictation:tapAction:", v9, v10, 1, v17, x, y);

  }
  else
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setReasonType:", 16);

    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stopDictation");

    -[UIDictationLayoutView returnToKeyboard](self, "returnToKeyboard");
  }

}

void __63__UIDictationLayoutView_globeButtonPressed_withEvent_location___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  dispatch_time_t v11;
  _QWORD v12[6];

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setReasonType:", 16);

  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopDictation");

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enabledDictationLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "indexOfObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504));
  if (v6 + 1 < (unint64_t)objc_msgSend(v5, "count"))
    v7 = v6 + 1;
  else
    v7 = 0;
  objc_msgSend(v5, "objectAtIndex:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 504);
  *(_QWORD *)(v9 + 504) = v8;

  gDictationViewSharedInstance_block_invoke___touchUp = CFAbsoluteTimeGetCurrent();
  v11 = dispatch_time(0, 500000000);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__UIDictationLayoutView_globeButtonPressed_withEvent_location___block_invoke_2;
  v12[3] = &unk_1E16B1888;
  v12[4] = *(_QWORD *)(a1 + 32);
  v12[5] = 0x3FE0000000000000;
  dispatch_after(v11, MEMORY[0x1E0C80D38], v12);
  objc_msgSend(*(id *)(a1 + 32), "updateLanguageLabel");

}

void __63__UIDictationLayoutView_globeButtonPressed_withEvent_location___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  if (CFAbsoluteTimeGetCurrent() - *(double *)&gDictationViewSharedInstance_block_invoke___touchUp >= *(double *)(a1 + 40))
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setReasonType:", 16);

    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "switchToDictationLanguage:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504));

    objc_msgSend(*(id *)(a1 + 32), "setSwitchingLanguage:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  }
}

- (void)setRenderConfig:(id)a3
{
  UIKeyboardDicationBackground *background;
  id v4;
  id v5;

  background = self->super._background;
  v4 = a3;
  -[UIKeyboardDicationBackground gradient](background, "gradient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRenderConfig:", v4);

}

- (void)setState:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  objc_class *SUICFlamesViewClass;
  SUICFlamesView *flamesView;
  id v12;
  void *v13;
  SUICFlamesView *v14;
  SUICFlamesView *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v3 = *(_QWORD *)&a3;
  if (a3 == 2)
  {
    -[UIView bounds](self, "bounds");
    v9 = v8;
    SUICFlamesViewClass = (objc_class *)getSUICFlamesViewClass();
    flamesView = self->super._flamesView;
    if (flamesView)
    {
      -[SUICFlamesView setFrame:](flamesView, "setFrame:", 0.0, 0.0, v9, 100.0);
    }
    else
    {
      v12 = [SUICFlamesViewClass alloc];
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (SUICFlamesView *)objc_msgSend(v12, "initWithFrame:screen:fidelity:", v13, 2, 0.0, 0.0, v9, 100.0);
      v15 = self->super._flamesView;
      self->super._flamesView = v14;

    }
    -[SUICFlamesView setDelegate:](self->super._flamesView, "setDelegate:", self);
    -[SUICFlamesView setHidden:](self->super._flamesView, "setHidden:", 0);
    -[SUICFlamesView setMode:](self->super._flamesView, "setMode:", 1);
    -[SUICFlamesView setState:](self->super._flamesView, "setState:", 1);
    if (self->_blackTextColor)
      -[UIDictationLayoutView darkGrayColor](self, "darkGrayColor");
    else
      +[UIColor whiteColor](UIColor, "whiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUICFlamesView setDictationColor:](self->super._flamesView, "setDictationColor:", v16);

    -[SUICFlamesView setNeedsLayout](self->super._flamesView, "setNeedsLayout");
    -[UIView addSubview:](self, "addSubview:", self->super._flamesView);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
  else if (a3 == 1)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_inheritedRenderConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationLayoutView setRenderConfig:](self, "setRenderConfig:", v6);

    -[UIKeyboardDicationBackground gradient](self->super._background, "gradient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startColorTransitionIn");

  }
  else
  {
    -[SUICFlamesView setHidden:](self->super._flamesView, "setHidden:", 1);
  }
  -[UIKeyboardDicationBackground gradient](self->super._background, "gradient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setNeedsLayout");

  v18.receiver = self;
  v18.super_class = (Class)UIDictationLayoutView;
  -[UIDictationView setState:](&v18, sel_setState_, v3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  char v8;
  void *v9;
  double v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  char v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
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
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  unint64_t v41;
  UIButton *globeButton;
  UIButton *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  double v47;
  UIButton *keyboardButton;
  __CFString *v49;
  void *v50;
  void *v51;
  NSString *v52;
  NSString *currentDictationLanguage;
  double v54;
  double v55;
  void *v56;
  double v57;
  _QWORD v58[5];
  _QWORD v59[5];
  objc_super v60;

  v60.receiver = self;
  v60.super_class = (Class)UIDictationLayoutView;
  -[UIView layoutSubviews](&v60, sel_layoutSubviews);
  -[UIView size](self, "size");
  v4 = v3;
  v6 = v5;
  if (+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "centerFilled");

    if ((v8 & 1) == 0)
    {
      +[UIKeyboardLayoutDictation activeInstance](UIKeyboardLayoutDictation, "activeInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "splitLeftSize");
      v4 = v10;

    }
  }
  v11 = +[UIKeyboardImpl showsGlobeAndDictationKeysExternally](UIKeyboardImpl, "showsGlobeAndDictationKeysExternally");
  +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "triggeringTouch");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    v14 = 1;
  else
    v14 = v11;

  -[SUICFlamesView setSize:](self->super._flamesView, "setSize:", v4, 100.0);
  -[UIView frame](self, "frame");
  if (v11)
    v16 = v15 * 0.5;
  else
    v16 = v15 * 94.0 / 216.0;
  -[SUICFlamesView setCenter:](self->super._flamesView, "setCenter:", v4 * 0.5, v16);
  -[SUICFlamesView setNeedsLayout](self->super._flamesView, "setNeedsLayout");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_inheritedRenderConfig");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  self->_blackTextColor = objc_msgSend(v18, "lightKeyboard");

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "userInterfaceIdiom");

  -[UIView bounds](self, "bounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[UIView size](self, "size");
    v30 = v29 * 0.5;
    -[UIView size](self, "size");
    v57 = v6;
    v32 = v31 * 0.25;
    -[UIView size](self, "size");
    v34 = v33 * 0.25;
    v22 = v22 + v34;
    v35 = v32 + v34;
    v6 = v57;
    v26 = v26 - v35;
    v24 = v24 + v30;
    v28 = v28 - (v30 + 0.0);
  }
  -[UIView setFrame:](self->_waveTapEndpointButtonView, "setFrame:", v22, v24, v26, v28);
  -[UIView addSubview:](self, "addSubview:", self->_waveTapEndpointButtonView);
  if (v4 * 0.25 <= 80.0)
    v36 = v4 * 0.25;
  else
    v36 = 80.0;
  if ((v14 & 1) != 0)
  {
    -[UIView removeFromSuperview](self->_globeButton, "removeFromSuperview");
    -[UIView removeFromSuperview](self->_keyboardButton, "removeFromSuperview");
  }
  else
  {
    v37 = v6 - fmin(v6 * 0.25, 40.0);
    v38 = v6 * 0.5;
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "enabledDictationLanguages");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "count");

    globeButton = self->_globeButton;
    if (v41 < 2)
    {
      -[UIView removeFromSuperview](globeButton, "removeFromSuperview");
    }
    else
    {
      -[UIView setSize:](globeButton, "setSize:", v36, v38);
      -[UIView setCenter:](self->_globeButton, "setCenter:", 40.0, v37);
      v43 = self->_globeButton;
      if (self->_blackTextColor)
        v44 = CFSTR("dictation_global_dark.png");
      else
        v44 = CFSTR("dictation_global.png");
      _UIImageWithName(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setImage:forState:](v43, "setImage:forState:", v45, 0);

      -[UIView addSubview:](self, "addSubview:", self->_globeButton);
    }
    -[UIView setSize:](self->_keyboardButton, "setSize:", v36, v38);
    -[UIView superview](self->_globeButton, "superview");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = v4 + -40.0;
    if (!v46)
      v47 = v4 * 0.5;
    -[UIView setCenter:](self->_keyboardButton, "setCenter:", v47, v37);
    keyboardButton = self->_keyboardButton;
    if (self->_blackTextColor)
      v49 = CFSTR("dictation_keyboard_dark.png");
    else
      v49 = CFSTR("dictation_keyboard.png");
    _UIImageWithName(v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](keyboardButton, "setImage:forState:", v50, 0);

    -[UIView addSubview:](self, "addSubview:", self->_keyboardButton);
  }
  if (-[UIDictationView showLanguageLabel](self, "showLanguageLabel"))
  {
    -[UIDictationView setShowLanguageLabel:](self, "setShowLanguageLabel:", 0);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "activeDictationLanguage");
    v52 = (NSString *)objc_claimAutoreleasedReturnValue();
    currentDictationLanguage = self->_currentDictationLanguage;
    self->_currentDictationLanguage = v52;

    -[UIView alpha](self->_languageLabel, "alpha");
    if (v54 == 0.0)
      v55 = 0.75;
    else
      v55 = 0.25;
    if (self->_currentDictationLanguage)
    {
      -[UIView superview](self->_globeButton, "superview");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v56)
        -[UIView setAlpha:](self->_keyboardButton, "setAlpha:", 0.0);
      -[UIDictationLayoutView updateLanguageLabel](self, "updateLanguageLabel");
    }
    v58[4] = self;
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __39__UIDictationLayoutView_layoutSubviews__block_invoke;
    v59[3] = &unk_1E16B1B28;
    v59[4] = self;
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __39__UIDictationLayoutView_layoutSubviews__block_invoke_2;
    v58[3] = &unk_1E16B3FD8;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v59, v58, 0.25, v55);
  }
  -[UIDictationView removeBackgroundView](self, "removeBackgroundView");
}

void __39__UIDictationLayoutView_layoutSubviews__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "setAlpha:", 1.0);
}

uint64_t __39__UIDictationLayoutView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "removeFromSuperview");
}

- (void)finishReturnToKeyboard
{
  SUICFlamesView *flamesView;
  objc_super v4;

  -[SUICFlamesView removeFromSuperview](self->super._flamesView, "removeFromSuperview");
  -[SUICFlamesView setDelegate:](self->super._flamesView, "setDelegate:", 0);
  flamesView = self->super._flamesView;
  self->super._flamesView = 0;

  v4.receiver = self;
  v4.super_class = (Class)UIDictationLayoutView;
  -[UIDictationView finishReturnToKeyboard](&v4, sel_finishReturnToKeyboard);
}

- (void)returnToKeyboard
{
  id v2;
  objc_super v3;

  if (self->super._background)
  {
    -[UIKeyboardDicationBackground gradient](self->super._background, "gradient");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "startColorTransitionOut");

  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)UIDictationLayoutView;
    -[UIDictationView returnToKeyboard](&v3, sel_returnToKeyboard);
  }
}

- (BOOL)isShowing
{
  void *v2;
  char v3;
  void *v4;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isUsingDictationLayout") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isDictationPopoverPresented");

  }
  return v3;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  void *v5;
  UITargetedPreview *v6;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_11:
    v25 = 0;
    goto LABEL_12;
  }
  v6 = -[UITargetedPreview initWithView:]([UITargetedPreview alloc], "initWithView:", v5);
  objc_msgSend(v4, "size");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v5, "origin");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v5, "size");
  v17 = v10 - v16;
  v18 = 0.0;
  if (v10 - v16 < 0.0)
    v17 = 0.0;
  if (v8 - v15 >= 0.0)
    v18 = v8 - v15;
  if (v17 >= v18)
    v17 = v18;
  v19 = v12 - v17 * 0.5;
  v20 = v14 - v17 * 0.5;
  v21 = v15 + v17;
  v22 = v16 + v17;
  +[UIPointerEffect effectWithPreview:](UIPointerEffect, "effectWithPreview:", v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", v19, v20, v21, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  v26 = v25;

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waveTapEndpointButtonView, 0);
  objc_storeStrong((id *)&self->_currentDictationLanguage, 0);
  objc_storeStrong((id *)&self->_languageLabel, 0);
  objc_storeStrong((id *)&self->_keyboardButton, 0);
  objc_storeStrong((id *)&self->_globeButton, 0);
}

@end
