@implementation UIDictationPopoverView

+ (CGSize)viewSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 172.0;
  v3 = 40.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "viewSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)buttonImageNamed:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor systemGrayColor](UIColor, "systemGrayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithTintColor:renderingMode:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIDictationPopoverView)initWithFrame:(CGRect)a3
{
  UIDictationPopoverView *v3;
  uint64_t v4;
  UIButton *cancelButton;
  UIButton *v6;
  void *v7;
  uint64_t v8;
  UIButton *centerButton;
  uint64_t v10;
  UIImage *stopDictationImage;
  uint64_t v12;
  UIButton *languageButton;
  void *v14;
  uint64_t v15;
  UIButton *startButton;
  UIButton *v17;
  void *v18;
  uint64_t v19;
  UIButton *stopButton;
  UIButton *v21;
  void *v22;
  uint64_t v23;
  UIButton *keyboardButton;
  uint64_t v25;
  UIImage *showKeyboardButtonImage;
  uint64_t v27;
  UIImage *hideKeyboardButtonImage;
  uint64_t v29;
  NSMutableArray *languageButtons;
  UIButton *v31;
  UIPointerInteraction *v32;
  UIButton *v33;
  UIPointerInteraction *v34;
  UIButton *v35;
  UIPointerInteraction *v36;
  UIButton *v37;
  UIPointerInteraction *v38;
  UIButton *v39;
  UIPointerInteraction *v40;
  UIButton *v41;
  UIPointerInteraction *v42;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)UIDictationPopoverView;
  v3 = -[UIDictationView initWithFrame:](&v44, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIButton buttonWithType:](UIButton, "buttonWithType:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    cancelButton = v3->_cancelButton;
    v3->_cancelButton = (UIButton *)v4;

    -[UIControl addTarget:action:forControlEvents:](v3->_cancelButton, "addTarget:action:forControlEvents:", v3, sel_cancelButtonPressed_, 64);
    v6 = v3->_cancelButton;
    -[UIDictationPopoverView buttonImageNamed:](v3, "buttonImageNamed:", CFSTR("xmark.square.fill"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v6, "setImage:forState:", v7, 0);

    -[UIView addSubview:](v3, "addSubview:", v3->_cancelButton);
    -[UIButton setFrame:](v3->_cancelButton, "setFrame:", 130.0, 0.0, 42.0, 40.0);
    +[UIButton buttonWithType:](UIButton, "buttonWithType:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    centerButton = v3->_centerButton;
    v3->_centerButton = (UIButton *)v8;

    -[UIControl addTarget:action:forControlEvents:](v3->_centerButton, "addTarget:action:forControlEvents:", v3, sel_centerButtonPressed_, 64);
    -[UIView addSubview:](v3, "addSubview:", v3->_centerButton);
    -[UIDictationPopoverView buttonImageNamed:](v3, "buttonImageNamed:", CFSTR("mic.slash"));
    v10 = objc_claimAutoreleasedReturnValue();
    stopDictationImage = v3->_stopDictationImage;
    v3->_stopDictationImage = (UIImage *)v10;

    -[UIView setSize:](v3->_centerButton, "setSize:", 114.0, 40.0);
    -[UIView setAlpha:](v3->_centerButton, "setAlpha:", 0.3);
    +[UIButton buttonWithType:](UIButton, "buttonWithType:", 0);
    v12 = objc_claimAutoreleasedReturnValue();
    languageButton = v3->_languageButton;
    v3->_languageButton = (UIButton *)v12;

    -[UIControl addTarget:action:forControlEvents:](v3->_languageButton, "addTarget:action:forControlEvents:", v3, sel_languageButtonPressed_withEvent_, 64);
    -[UIView addSubview:](v3, "addSubview:", v3->_languageButton);
    +[UIColor systemGrayColor](UIColor, "systemGrayColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v3->_languageButton, "setTintColor:", v14);

    -[UIButton setFrame:](v3->_languageButton, "setFrame:", 0.0, 0.0, 42.0, 40.0);
    +[UIButton buttonWithType:](UIButton, "buttonWithType:", 0);
    v15 = objc_claimAutoreleasedReturnValue();
    startButton = v3->_startButton;
    v3->_startButton = (UIButton *)v15;

    -[UIControl addTarget:action:forControlEvents:](v3->_startButton, "addTarget:action:forControlEvents:", v3, sel_startButtonPressed_, 64);
    v17 = v3->_startButton;
    -[UIDictationPopoverView buttonImageNamed:](v3, "buttonImageNamed:", CFSTR("mic"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v17, "setImage:forState:", v18, 0);

    -[UIView addSubview:](v3, "addSubview:", v3->_startButton);
    -[UIView size](v3->_cancelButton, "size");
    -[UIView setSize:](v3->_startButton, "setSize:");
    +[UIButton buttonWithType:](UIButton, "buttonWithType:", 0);
    v19 = objc_claimAutoreleasedReturnValue();
    stopButton = v3->_stopButton;
    v3->_stopButton = (UIButton *)v19;

    -[UIControl addTarget:action:forControlEvents:](v3->_stopButton, "addTarget:action:forControlEvents:", v3, sel_stopButtonPressed_, 64);
    v21 = v3->_stopButton;
    -[UIDictationPopoverView buttonImageNamed:](v3, "buttonImageNamed:", CFSTR("mic.slash"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v21, "setImage:forState:", v22, 0);

    -[UIView addSubview:](v3, "addSubview:", v3->_stopButton);
    -[UIView size](v3->_cancelButton, "size");
    -[UIView setSize:](v3->_stopButton, "setSize:");
    +[UIButton buttonWithType:](UIButton, "buttonWithType:", 0);
    v23 = objc_claimAutoreleasedReturnValue();
    keyboardButton = v3->_keyboardButton;
    v3->_keyboardButton = (UIButton *)v23;

    -[UIControl addTarget:action:forControlEvents:](v3->_keyboardButton, "addTarget:action:forControlEvents:", v3, sel_keyboardButtonPressed_, 64);
    -[UIDictationPopoverView buttonImageNamed:](v3, "buttonImageNamed:", CFSTR("keyboard"));
    v25 = objc_claimAutoreleasedReturnValue();
    showKeyboardButtonImage = v3->_showKeyboardButtonImage;
    v3->_showKeyboardButtonImage = (UIImage *)v25;

    -[UIDictationPopoverView buttonImageNamed:](v3, "buttonImageNamed:", CFSTR("keyboard.chevron.compact.down"));
    v27 = objc_claimAutoreleasedReturnValue();
    hideKeyboardButtonImage = v3->_hideKeyboardButtonImage;
    v3->_hideKeyboardButtonImage = (UIImage *)v27;

    -[UIButton setImage:forState:](v3->_keyboardButton, "setImage:forState:", v3->_hideKeyboardButtonImage, 0);
    -[UIView addSubview:](v3, "addSubview:", v3->_keyboardButton);
    -[UIView size](v3->_cancelButton, "size");
    -[UIView setSize:](v3->_keyboardButton, "setSize:");
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v29 = objc_claimAutoreleasedReturnValue();
    languageButtons = v3->_languageButtons;
    v3->_languageButtons = (NSMutableArray *)v29;

    -[UIDictationView removeBackgroundView](v3, "removeBackgroundView");
    v31 = v3->_cancelButton;
    v32 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", v3);
    -[UIView addInteraction:](v31, "addInteraction:", v32);

    v33 = v3->_languageButton;
    v34 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", v3);
    -[UIView addInteraction:](v33, "addInteraction:", v34);

    v35 = v3->_centerButton;
    v36 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", v3);
    -[UIView addInteraction:](v35, "addInteraction:", v36);

    v37 = v3->_startButton;
    v38 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", v3);
    -[UIView addInteraction:](v37, "addInteraction:", v38);

    v39 = v3->_stopButton;
    v40 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", v3);
    -[UIView addInteraction:](v39, "addInteraction:", v40);

    v41 = v3->_keyboardButton;
    v42 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", v3);
    -[UIView addInteraction:](v41, "addInteraction:", v42);

  }
  return v3;
}

- (void)keyboardButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  self->_popoverPage = 1;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerRootController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "showsKeyboard");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setKeyboardMinimizedByDictation:", v7);

  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)startButtonPressed:(id)a3
{
  void *v4;

  self->_popoverPage = 0;
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDictation");

  -[UIDictationView setSwitchingLanguage:](self, "setSwitchingLanguage:", 0);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)stopButtonPressed:(id)a3
{
  void *v4;

  self->_popoverPage = 1;
  -[UIDictationView setSwitchingLanguage:](self, "setSwitchingLanguage:", 1);
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAndCancelDictationWithReasonType:", 15);

  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)centerButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    if (!self->_popoverPage)
    {
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "preferencesActions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "BOOLForPreferenceKey:", CFSTR("ShowKeyboardButtonOnDictationPopover"));

      if (v6)
        -[UIDictationPopoverView stopButtonPressed:](self, "stopButtonPressed:", v7);
      else
        -[UIDictationPopoverView cancelButtonPressed:](self, "cancelButtonPressed:", v7);
    }
  }
  else
  {
    -[UIDictationPopoverView startButtonPressed:](self, "startButtonPressed:", v7);
  }

}

- (void)cancelButtonPressed:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  self->_popoverPage = 0;
  -[UIDictationView setSwitchingLanguage:](self, "setSwitchingLanguage:", 0);
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReasonType:", 29);

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissDictationPopover");

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponderWhenIdleIfNeeded");

}

- (void)clearLanguageButtons
{
  UIDictationPopoverView *v3;
  double v4;
  double v5;
  double v6;
  UIView *languageView;

  if (self->_languageView)
  {
    -[UIView superview](self->_cancelButton, "superview");
    v3 = (UIDictationPopoverView *)objc_claimAutoreleasedReturnValue();

    if (v3 != self)
    {
      -[UIView addSubview:](self, "addSubview:", self->_cancelButton);
      -[UIView size](self, "size");
      v5 = v4;
      -[UIView size](self, "size");
      -[UIView setFrameOrigin:](self->_cancelButton, "setFrameOrigin:", v5 - v6, 0.0);
    }
    -[NSMutableArray makeObjectsPerformSelector:](self->_languageButtons, "makeObjectsPerformSelector:", sel_removeFromSuperview);
    -[NSMutableArray removeAllObjects](self->_languageButtons, "removeAllObjects");
    -[UIView removeFromSuperview](self->_languageView, "removeFromSuperview");
    languageView = self->_languageView;
    self->_languageView = 0;

  }
}

- (id)languageButtons:(BOOL)a3
{
  UIView *v4;
  UIView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIPointerInteraction *v20;
  double v21;
  double v22;
  _BOOL4 v24;
  id obj;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v24 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v4 = [UIView alloc];
  v5 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentInputModeForDictation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictationLanguage");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enabledDictationLanguages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        +[UIButton buttonWithType:](UIButton, "buttonWithType:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "indicatorIconForDictationLanguage:scaleFactor:", v15, 1.0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setImage:forState:", v18, 0);

        if ((objc_msgSend(v15, "isEqualToString:", v26) & 1) != 0)
          +[UIColor blueColor](UIColor, "blueColor");
        else
          +[UIColor systemGrayColor](UIColor, "systemGrayColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTintColor:", v19);

        objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel_languageButtonPressed_withEvent_, 64);
        -[UIView addSubview:](v5, "addSubview:", v16);
        objc_msgSend(v16, "setFrame:", v13, 0.0, 42.0, 40.0);
        v13 = v13 + 31.0;
        -[NSMutableArray addObject:](self->_languageButtons, "addObject:", v16);
        v20 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", self);
        objc_msgSend(v16, "addInteraction:", v20);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v11);
  }
  else
  {
    v13 = 0.0;
  }

  if (v24)
  {
    -[UIView addSubview:](v5, "addSubview:", self->_cancelButton);
    -[UIView setFrameOrigin:](self->_cancelButton, "setFrameOrigin:", v13, 0.0);
    -[UIView size](self->_cancelButton, "size");
    v13 = v13 + v21;
  }
  -[UIView size](self, "size");
  -[UIView setFrame:](v5, "setFrame:", 0.0, 0.0, v13, v22);

  return v5;
}

- (void)languageButtonPressed:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  UIScrollView *v11;
  UIScrollView *v12;
  double v13;
  double v14;
  UIScrollView *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UIView *v22;
  UIView *languageView;
  void *v24;
  _QWORD v25[4];
  UIScrollView *v26;

  v5 = a3;
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReasonType:", 28);

  if (-[UIButton isEqual:](self->_languageButton, "isEqual:", v5))
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enabledDictationLanguages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 < 5)
    {
      -[UIDictationPopoverView languageButtons:](self, "languageButtons:", 0);
      v22 = (UIView *)objc_claimAutoreleasedReturnValue();
      languageView = self->_languageView;
      self->_languageView = v22;

    }
    else
    {
      -[UIDictationPopoverView languageButtons:](self, "languageButtons:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = [UIScrollView alloc];
      -[UIView bounds](self, "bounds");
      v12 = -[UIScrollView initWithFrame:](v11, "initWithFrame:");
      objc_msgSend(v10, "frame");
      -[UIScrollView setContentSize:](v12, "setContentSize:", v13, v14);
      -[UIView addSubview:](v12, "addSubview:", v10);
      objc_storeStrong((id *)&self->_languageView, v12);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __58__UIDictationPopoverView_languageButtonPressed_withEvent___block_invoke;
      v25[3] = &unk_1E16B1B28;
      v26 = v12;
      v15 = v12;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v25, 0, 0.25, 0.25);

    }
    -[UIView addSubview:](self, "addSubview:", self->_languageView);
    self->_popoverPage = 2;
    -[UIDictationView setSwitchingLanguage:](self, "setSwitchingLanguage:", 1);
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stopDictation");

    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "state");

    if (!v17)
    {
      self->_popoverPage = 0;
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "enabledDictationLanguages");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndex:", -[NSMutableArray indexOfObject:](self->_languageButtons, "indexOfObject:", v5));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIDictationPopoverView clearLanguageButtons](self, "clearLanguageButtons");
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "switchToDictationLanguage:", v20);

      -[UIDictationView setSwitchingLanguage:](self, "setSwitchingLanguage:", 0);
    }
  }

}

uint64_t __58__UIDictationPopoverView_languageButtonPressed_withEvent___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "contentSize");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "size");
  return objc_msgSend(v2, "setContentOffset:", v4 - v5, 0.0);
}

- (void)setState:(int)a3
{
  uint64_t v3;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  SUICFlamesView *v15;
  SUICFlamesView *flamesView;
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
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;

  v3 = *(_QWORD *)&a3;
  if (a3 == 2)
  {
    if (!self->super._flamesView)
    {
      v5 = objc_alloc((Class)getSUICFlamesViewClass());
      -[UIView bounds](self, "bounds");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (SUICFlamesView *)objc_msgSend(v5, "initWithFrame:screen:fidelity:", v14, 2, v7, v9, v11, v13);
      flamesView = self->super._flamesView;
      self->super._flamesView = v15;

      -[SUICFlamesView setDelegate:](self->super._flamesView, "setDelegate:", self);
      -[SUICFlamesView setMode:](self->super._flamesView, "setMode:", 1);
      -[UIView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->super._flamesView, self->_centerButton);
      -[SUICFlamesView setTranslatesAutoresizingMaskIntoConstraints:](self->super._flamesView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[SUICFlamesView leadingAnchor](self->super._flamesView, "leadingAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self->_centerButton, "leadingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setActive:", 1);

      -[SUICFlamesView trailingAnchor](self->super._flamesView, "trailingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_centerButton, "trailingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setActive:", 1);

      -[SUICFlamesView leadingAnchor](self->super._flamesView, "leadingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self->_centerButton, "leadingAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setActive:", 1);

      -[SUICFlamesView topAnchor](self->super._flamesView, "topAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self->_centerButton, "topAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setActive:", 1);

      -[SUICFlamesView bottomAnchor](self->super._flamesView, "bottomAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_centerButton, "bottomAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setActive:", 1);

    }
    v32 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v32)
      objc_msgSend(v33, "remoteTextInputPartner");
    else
      objc_msgSend(v33, "textInputTraits");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "insertionPointColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      -[SUICFlamesView setDictationColor:](self->super._flamesView, "setDictationColor:", v36);
    }
    else
    {
      +[UIColor blueColor](UIColor, "blueColor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUICFlamesView setDictationColor:](self->super._flamesView, "setDictationColor:", v37);

    }
    -[SUICFlamesView setHidden:](self->super._flamesView, "setHidden:", 0);
    -[SUICFlamesView setState:](self->super._flamesView, "setState:", 1);
    -[SUICFlamesView setNeedsLayout](self->super._flamesView, "setNeedsLayout");
    -[UIView setNeedsLayout](self, "setNeedsLayout");

  }
  else if (a3 == 1)
  {
    -[UIDictationPopoverView clearLanguageButtons](self, "clearLanguageButtons");
    self->_popoverPage = 0;
  }
  else
  {
    -[SUICFlamesView setHidden:](self->super._flamesView, "setHidden:", 1);
  }
  v38.receiver = self;
  v38.super_class = (Class)UIDictationPopoverView;
  -[UIDictationView setState:](&v38, sel_setState_, v3);
}

- (void)layoutSubviews
{
  UIButton *startButton;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  unint64_t popoverPage;
  UIButton *languageButton;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  BOOL v22;
  _BOOL4 v23;
  _BOOL4 v24;
  UIImage *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  UIButton *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  objc_super v42;
  _QWORD v43[4];

  v43[3] = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)UIDictationPopoverView;
  -[UIView layoutSubviews](&v42, sel_layoutSubviews);
  startButton = self->_startButton;
  v43[0] = self->_stopButton;
  v43[1] = startButton;
  v43[2] = self->_keyboardButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_338_0);

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferencesActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForPreferenceKey:", CFSTR("ShowKeyboardButtonOnDictationPopover"));

  -[UIView setHidden:](self->_centerButton, "setHidden:", 0);
  -[UIView size](self->_languageButton, "size");
  v9 = v8;
  objc_msgSend((id)objc_opt_class(), "viewSize");
  -[UIView setSize:](self, "setSize:");
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enabledDictationLanguages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setHidden:](self->_languageButton, "setHidden:", (unint64_t)objc_msgSend(v11, "count") < 2);

  popoverPage = self->_popoverPage;
  if (popoverPage == 1)
  {
    -[UIView setHidden:](self->_startButton, "setHidden:", 0);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v7 & ~objc_msgSend(v15, "hardwareKeyboardAttached");

    if (v16 == 1)
    {
      -[UIView setHidden:](self->_keyboardButton, "setHidden:", 0);
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "containerRootController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "placement");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "showsKeyboard");

      v21 = 22;
      if (v20)
        v21 = 23;
      -[UIButton setImage:forState:](self->_keyboardButton, "setImage:forState:", *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___UIKeyboardDicationBackground__gradient[v21]), 0);
    }
    v22 = -[UIView isHidden](self->_languageButton, "isHidden");
    v23 = -[UIView isHidden](self->_keyboardButton, "isHidden");
    v24 = v23;
    if (v22)
    {
      -[UIView center](self->_languageButton, "center");
      if (v24)
      {
        -[UIView setCenter:](self->_startButton, "setCenter:");
        v25 = 0;
        v9 = 0.0;
        goto LABEL_24;
      }
      -[UIView setCenter:](self->_keyboardButton, "setCenter:");
    }
    else if (!v23)
    {
      -[UIView size](self, "size");
      v27 = v26;
      -[UIView size](self, "size");
      v29 = (v27 - v28) / 3.0;
      -[UIView center](self->_languageButton, "center");
      v31 = v30 + v29;
      -[UIView center](self->_keyboardButton, "center");
      -[UIView setCenter:](self->_keyboardButton, "setCenter:", v31);
      -[UIView center](self->_keyboardButton, "center");
      v33 = v29 + v32;
LABEL_22:
      -[UIView center](self->_startButton, "center");
      -[UIView setCenter:](self->_startButton, "setCenter:", v33);
      goto LABEL_23;
    }
    -[UIView center](self, "center");
    v33 = v40;
    goto LABEL_22;
  }
  if (popoverPage == 2)
  {
    -[UIView setHidden:](self->_centerButton, "setHidden:", 1);
    languageButton = self->_languageButton;
    v14 = 1;
LABEL_4:
    -[UIView setHidden:](languageButton, "setHidden:", v14);
LABEL_23:
    v25 = 0;
    goto LABEL_24;
  }
  if (-[UIView isHidden](self->_languageButton, "isHidden"))
  {
    if (!v7)
    {
      v25 = 0;
      v9 = 16.0;
      goto LABEL_24;
    }
    languageButton = self->_stopButton;
    v14 = 0;
    goto LABEL_4;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "activeDictationLanguage");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = self->_languageButton;
  +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "indicatorIconForDictationLanguage:scaleFactor:", v35, 1.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setImage:forState:](v36, "setImage:forState:", v38, 0);

  v25 = 0;
  if (v7)
    v25 = self->_stopDictationImage;
  -[UIView size](self->_languageButton, "size");
  v9 = v39;

LABEL_24:
  -[UIButton setImage:forState:](self->_centerButton, "setImage:forState:", v25, 0);
  -[UIView origin](self->_cancelButton, "origin");
  -[UIButton setFrame:](self->_centerButton, "setFrame:", v9, 0.0, v41 - v9, 40.0);

}

uint64_t __40__UIDictationPopoverView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHidden:", 1);
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  unint64_t v5;
  SUICFlamesView *flamesView;
  void *v7;
  int v8;
  void *v9;
  int v10;
  objc_super v11;

  v4 = a3;
  if (!v4)
  {
    -[UIDictationView setSwitchingLanguage:](self, "setSwitchingLanguage:", 0);
    -[SUICFlamesView removeFromSuperview](self->super._flamesView, "removeFromSuperview");
    -[SUICFlamesView setDelegate:](self->super._flamesView, "setDelegate:", 0);
    flamesView = self->super._flamesView;
    self->super._flamesView = 0;

    goto LABEL_12;
  }
  if (-[NSMutableArray count](self->_languageButtons, "count"))
  {
    -[UIDictationView setSwitchingLanguage:](self, "setSwitchingLanguage:", 1);
    v5 = 2;
  }
  else if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    v5 = 0;
  }
  else
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isDictationPopoverPresented");

    if (!v8)
      goto LABEL_10;
    v5 = 1;
  }
  self->_popoverPage = v5;
LABEL_10:
  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "state");

  if (v10 == 2)
    -[UIDictationPopoverView setState:](self, "setState:", 2);
LABEL_12:
  v11.receiver = self;
  v11.super_class = (Class)UIDictationPopoverView;
  -[UIView willMoveToWindow:](&v11, sel_willMoveToWindow_, v4);

}

- (void)returnToKeyboard
{
  void *v3;
  int v4;
  void *v5;
  objc_super v6;

  -[UIDictationPopoverView willMoveToWindow:](self, "willMoveToWindow:", 0);
  if (self->_popoverPage != 1)
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "shouldSuppressSoftwareKeyboard");

    if (v4)
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resignFirstResponderWhenIdleIfNeeded");

    }
  }
  v6.receiver = self;
  v6.super_class = (Class)UIDictationPopoverView;
  -[UIDictationView returnToKeyboard](&v6, sel_returnToKeyboard);
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
  objc_storeStrong((id *)&self->_languageView, 0);
  objc_storeStrong((id *)&self->_languageButtons, 0);
  objc_storeStrong((id *)&self->_stopDictationImage, 0);
  objc_storeStrong((id *)&self->_hideKeyboardButtonImage, 0);
  objc_storeStrong((id *)&self->_showKeyboardButtonImage, 0);
  objc_storeStrong((id *)&self->_keyboardButton, 0);
  objc_storeStrong((id *)&self->_stopButton, 0);
  objc_storeStrong((id *)&self->_startButton, 0);
  objc_storeStrong((id *)&self->_centerButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_languageButton, 0);
}

@end
