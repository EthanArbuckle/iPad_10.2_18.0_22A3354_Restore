@implementation UISystemKeyboardDockController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISystemKeyboardDockController;
  -[UIViewController viewDidLoad](&v5, sel_viewDidLoad);
  if (!+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP")
    || +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__dictationDidBeginNotification_, CFSTR("UIKeyboardDidBeginDictationNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_updateDockItemsVisibility, CFSTR("UIKeyboardDictationAvailabilityDidChangeNotification"), 0);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UISystemKeyboardDockController;
  v4 = a3;
  -[UIViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  -[UIViewController traitCollection](self, "traitCollection", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasDifferentColorAppearanceComparedToTraitCollection:", v5);

  if (v6)
    -[UISystemKeyboardDockController updateDockItemsVisibility](self, "updateDockItemsVisibility");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  UIKeyboardDockView *v3;
  void *v4;
  id v5;
  UIKeyboardDockItem *v6;
  void *v7;
  UIKeyboardDockItem *v8;
  UIKeyboardDockItem *globeDockItem;
  UIKeyboardDockItem *v10;
  void *v11;
  UIKeyboardDockItem *v12;
  UIKeyboardDockItem *dictationDockItem;
  UIKeyboardDockItem *v14;
  void *v15;
  UIKeyboardDockItem *v16;
  UIKeyboardDockItem *dictationRunningDockItem;
  UIKeyboardDockItem *v18;
  void *v19;
  UIKeyboardDockItem *v20;
  UIKeyboardDockItem *keyboardDockItem;
  UIButton *v22;
  UIButton *stopDictationButton;
  void *v24;
  UIKeyboardDockView *v25;

  v3 = [UIKeyboardDockView alloc];
  v25 = -[UIKeyboardDockView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIKeyboardDockView setDelegate:](v25, "setDelegate:", self);
  +[_UIKeyboardTextSelectionGestureController sharedInstance](_UIKeyboardTextSelectionGestureController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "addLongPressTextSelectionInteractionsToView:", v25);

  v6 = [UIKeyboardDockItem alloc];
  -[UISystemKeyboardDockController configuredGlyphWithName:](self, "configuredGlyphWithName:", CFSTR("globe"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIKeyboardDockItem initWithTitle:image:identifier:](v6, "initWithTitle:image:identifier:", CFSTR("globe"), v7, CFSTR("globe"));
  globeDockItem = self->_globeDockItem;
  self->_globeDockItem = v8;

  v10 = [UIKeyboardDockItem alloc];
  -[UISystemKeyboardDockController configuredGlyphWithName:](self, "configuredGlyphWithName:", CFSTR("mic"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UIKeyboardDockItem initWithTitle:image:identifier:](v10, "initWithTitle:image:identifier:", CFSTR("mic"), v11, CFSTR("dictation"));
  dictationDockItem = self->_dictationDockItem;
  self->_dictationDockItem = v12;

  v14 = [UIKeyboardDockItem alloc];
  -[UISystemKeyboardDockController configuredGlyphWithName:](self, "configuredGlyphWithName:", CFSTR("mic"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[UIKeyboardDockItem initWithTitle:image:identifier:](v14, "initWithTitle:image:identifier:", CFSTR("mic"), v15, CFSTR("dictationRunning"));
  dictationRunningDockItem = self->_dictationRunningDockItem;
  self->_dictationRunningDockItem = v16;

  v18 = [UIKeyboardDockItem alloc];
  -[UISystemKeyboardDockController configuredGlyphWithName:](self, "configuredGlyphWithName:", CFSTR("keyboard"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[UIKeyboardDockItem initWithTitle:image:identifier:](v18, "initWithTitle:image:identifier:", CFSTR("keyboard"), v19, CFSTR("keyboardkeyboard"));
  keyboardDockItem = self->_keyboardDockItem;
  self->_keyboardDockItem = v20;

  +[UIButton buttonWithType:](UIButton, "buttonWithType:", 0);
  v22 = (UIButton *)objc_claimAutoreleasedReturnValue();
  stopDictationButton = self->_stopDictationButton;
  self->_stopDictationButton = v22;

  +[UIColor clearColor](UIColor, "clearColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_stopDictationButton, "setBackgroundColor:", v24);

  -[UIControl addTarget:action:forControlEvents:](self->_stopDictationButton, "addTarget:action:forControlEvents:", self, sel_keyboardItemButtonWasTapped_withEvent_, 0xFFFFFFFFLL);
  -[UIKeyboardDockView setLeftDockItem:](v25, "setLeftDockItem:", self->_globeDockItem);
  -[UIKeyboardDockView setRightDockItem:](v25, "setRightDockItem:", self->_dictationDockItem);
  -[UIViewController setView:](self, "setView:", v25);

}

- (void)updateDockItemsVisibility
{
  void *v3;
  void *v4;
  id v5;

  -[UISystemKeyboardDockController dockView](self, "dockView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightDockItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISystemKeyboardDockController updateDockItemsVisibilityWithCustomDictationAction:](self, "updateDockItemsVisibilityWithCustomDictationAction:", v4);

}

- (id)configuredGlyphWithName:(id)a3
{
  id v4;
  NSBundle *v5;
  NSBundle *priorityGlyphBundle;
  void *v7;
  void *v8;

  v4 = a3;
  if (!self->_priorityGlyphBundle)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SFSymbols.framework/CoreGlyphsPriority.bundle"));
    v5 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    priorityGlyphBundle = self->_priorityGlyphBundle;
    self->_priorityGlyphBundle = v5;

  }
  -[UISystemKeyboardDockController imageConfig](self, "imageConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage imageNamed:inBundle:withConfiguration:](UIImage, "imageNamed:inBundle:withConfiguration:", v4, self->_priorityGlyphBundle, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("UIKeyboardDidBeginDictationNotification");
  v6[1] = CFSTR("UIKeyboardDictationAvailabilityDidChangeNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)UISystemKeyboardDockController;
  -[UIViewController dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dockView, 0);
  objc_storeStrong((id *)&self->_priorityGlyphBundle, 0);
  objc_storeStrong((id *)&self->_globeItemButtonTouchDownTime, 0);
  objc_storeStrong((id *)&self->_dictationItemButtonTouchDownTime, 0);
  objc_storeStrong((id *)&self->_stopDictationButton, 0);
  objc_storeStrong((id *)&self->_keyboardDockItem, 0);
  objc_storeStrong((id *)&self->_dictationRunningDockItem, 0);
  objc_storeStrong((id *)&self->_dictationDockItem, 0);
  objc_storeStrong((id *)&self->_globeDockItem, 0);
}

- (void)setKeyboardDockItem
{
  _BOOL4 v3;
  void *v4;
  int v5;
  _BOOL4 v6;
  int v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  UIKeyboardDockItem *keyboardDockItem;
  void *v15;
  void *v16;
  id v17;

  v3 = +[UIDictationController isRunning](UIDictationController, "isRunning");
  +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCurrentDictationLanguageOnDevice");

  v6 = -[UIKeyboardDockItem enabled](self->_globeDockItem, "enabled");
  v7 = v3 & v5;
  if (v6)
  {
    v8 = v7 == 0;
    v9 = 3;
    if (!v8)
      v9 = 2;
    v10 = OBJC_IVAR___UISystemKeyboardDockController__globeDockItem[v9];
  }
  else
  {
    if (!v7)
    {
      keyboardDockItem = self->_keyboardDockItem;
      -[UISystemKeyboardDockController dockView](self, "dockView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCenterDockItem:", keyboardDockItem);

      -[UISystemKeyboardDockController dockView](self, "dockView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setRightDockItem:", 0);
      goto LABEL_9;
    }
    v10 = 992;
  }
  v11 = *(uint64_t *)((char *)&self->super.super.super.isa + v10);
  -[UISystemKeyboardDockController dockView](self, "dockView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRightDockItem:", v11);

  -[UISystemKeyboardDockController dockView](self, "dockView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCenterDockItem:", 0);
LABEL_9:

  -[UIViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  -[UIButton setFrame:](self->_stopDictationButton, "setFrame:");

  -[UIViewController view](self, "view");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "insertSubview:atIndex:", self->_stopDictationButton, 0);

}

- (void)updateRightButtonItemWithCustomAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIKeyboardDockItem *v9;
  UIKeyboardDockItem *v10;
  void *v11;
  void *v12;
  UIKeyboardDockItem *dictationDockItem;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  v19 = v4;
  if (v4)
  {
    objc_msgSend(v4, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemKeyboardDockController imageConfig](self, "imageConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageByApplyingSymbolConfiguration:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UISystemKeyboardDockController dockView](self, "dockView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rightDockItem");
    v9 = (UIKeyboardDockItem *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = [UIKeyboardDockItem alloc];
      objc_msgSend(v19, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v9 = -[UIKeyboardDockItem initWithTitle:image:identifier:](v10, "initWithTitle:image:identifier:", v11, v7, v12);
      }
      else
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v19, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("CustomAction_%@"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[UIKeyboardDockItem initWithTitle:image:identifier:](v10, "initWithTitle:image:identifier:", v11, v7, v16);

      }
      -[UISystemKeyboardDockController dockView](self, "dockView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setRightDockItem:", v9);

    }
    objc_msgSend(v19, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardDockItem setTitle:image:](v9, "setTitle:image:", v18, v7);

    -[UIKeyboardDockItem setCustomAction:](v9, "setCustomAction:", v19);
  }
  else
  {
    dictationDockItem = self->_dictationDockItem;
    -[UISystemKeyboardDockController dockView](self, "dockView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightDockItem:", dictationDockItem);
  }

}

- (void)_dictationDidBeginNotification:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess", a3)
    || !+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCurrentDictationLanguageOnDevice");

    if ((v5 & 1) == 0)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isUsingDictationLayout"))
      {

      }
      else
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isMinimized");

        if ((v8 & 1) == 0)
        {
          +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "cancelDictation");

          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "dismissDictationPopover");

          -[UIView removeFromSuperview](self->_stopDictationButton, "removeFromSuperview");
          return;
        }
      }
      if (!self->_dictationHasUsedServerManualEndpointing)
      {
        -[UISystemKeyboardDockController setKeyboardDockItem](self, "setKeyboardDockItem");
        -[UIKeyboardDockItem setEnabled:](self->_keyboardDockItem, "setEnabled:", 1);
      }
    }
  }
}

- (void)dictationItemButtonWasPressed:(id)a3 withEvent:(id)a4 isRunningButton:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  UIKeyboardDockItem *dictationDockItem;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSDate *v22;
  NSDate *dictationItemButtonTouchDownTime;
  double MidX;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  double v32;
  dispatch_time_t v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  _QWORD block[4];
  id v45;
  UISystemKeyboardDockController *v46;
  id v47;
  id v48;
  char v49;
  _QWORD v50[5];
  id v51;
  id v52;
  uint64_t *v53;
  BOOL v54;
  char v55;
  uint64_t v56;
  CGPoint *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  CGPoint v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "touchesForView:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!+[UIDictationController isRunning](UIDictationController, "isRunning")
      || objc_msgSend(v12, "phase")
      || a5)
    {
      v56 = 0;
      v57 = (CGPoint *)&v56;
      v58 = 0x3010000000;
      v60 = 0;
      v61 = 0;
      v59 = &unk_18685B0AF;
      objc_msgSend(v12, "locationInView:", v8);
      v60 = v19;
      v61 = v20;
      v21 = objc_msgSend(v8, "pointInsideTapActionRegion:", v57[2].x, v57[2].y);
      if (!objc_msgSend(v12, "phase") && !self->_dictationItemButtonTouchDownTime)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v22 = (NSDate *)objc_claimAutoreleasedReturnValue();
        dictationItemButtonTouchDownTime = self->_dictationItemButtonTouchDownTime;
        self->_dictationItemButtonTouchDownTime = v22;

        self->_dictationItemButtonTouchDownLocationInView = v57[2];
      }
      objc_msgSend(v8, "bounds");
      MidX = CGRectGetMidX(v63);
      objc_msgSend(v8, "bounds");
      objc_msgSend(v8, "convertPoint:toView:", 0, MidX, CGRectGetMinY(v64));
      v26 = v25;
      v28 = v27;
      +[UIInputSwitcherView sharedInstance](UIInputSwitcherView, "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_dictationHasUsedServerManualEndpointing)
      {
        v30 = 0;
      }
      else
      {
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __90__UISystemKeyboardDockController_dictationItemButtonWasPressed_withEvent_isRunningButton___block_invoke;
        v50[3] = &unk_1E16D75E8;
        v50[4] = self;
        v51 = v12;
        v54 = a5;
        v52 = v8;
        v53 = &v56;
        v55 = v21;
        objc_msgSend(v29, "buttonPressed:withEvent:location:isLocationInsideViewHitArea:isForDictation:tapAction:", v52, v10, v21, 1, v50, v26, v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v31 = objc_msgSend(v12, "phase");
      if ((unint64_t)(v31 - 3) < 2)
      {
        self->_dictationUsingServerManualEndpointing = 0;
        objc_msgSend(v29, "hide");
      }
      else if (v31 == 1)
      {
        if (objc_msgSend(v29, "isVisible"))
        {
          objc_msgSend(v29, "bounds");
          v35 = v34;
          v37 = v36;
          v39 = v38;
          v41 = v40;
          objc_msgSend(v12, "locationInView:", v29);
          v62.x = v42;
          v62.y = v43;
          v65.origin.x = v35;
          v65.origin.y = v37;
          v65.size.width = v39;
          v65.size.height = v41;
          if (CGRectContainsPoint(v65, v62))
            self->_dictationUsingServerManualEndpointing = 0;
        }
      }
      else if (!v31
             && !a5
             && +[UIDictationController usingServerManualEndpointingThreshold](UIDictationController, "usingServerManualEndpointingThreshold"))
      {
        self->_dictationUsingServerManualEndpointing = 1;
        self->_dictationHasUsedServerManualEndpointing = 0;
        +[UIDictationController serverManualEndpointingThreshold](UIDictationController, "serverManualEndpointingThreshold");
        v33 = dispatch_time(0, (uint64_t)(v32 * 1000000000.0));
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __90__UISystemKeyboardDockController_dictationItemButtonWasPressed_withEvent_isRunningButton___block_invoke_56;
        block[3] = &unk_1E16BD778;
        v45 = v30;
        v46 = self;
        v49 = v21;
        v47 = v12;
        v48 = v29;
        dispatch_after(v33, MEMORY[0x1E0C80D38], block);

      }
      _Block_object_dispose(&v56, 8);
    }
    else
    {
      dictationDockItem = self->_dictationDockItem;
      -[UISystemKeyboardDockController dockView](self, "dockView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setRightDockItem:", dictationDockItem);

      v15 = +[UIDictationController specificReasonTypeMicButtonOnKeyboard](UIDictationController, "specificReasonTypeMicButtonOnKeyboard");
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setReasonType:", v15);

      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stopDictation");

      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "cancelDictation");

    }
  }

}

void __90__UISystemKeyboardDockController_dictationItemButtonWasPressed_withEvent_isRunningButton___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  double *v28;
  uint64_t v29;
  NSObject *v30;
  dispatch_time_t v31;
  double v32;
  double v33;
  double *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint8_t v38[16];

  v2 = +[UIDictationController specificReasonTypeMicButtonOnKeyboard](UIDictationController, "specificReasonTypeMicButtonOnKeyboard");
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReasonType:", v2);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "timeIntervalSinceNow");
  v5 = -v4;
  +[UIKBTouchState touchStateForTouch:](UIKBTouchState, "touchStateForTouch:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 64))
  {
    v7 = *(_QWORD **)(a1 + 32);
    v8 = v7[123];
    objc_msgSend(v7, "dockView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightDockItem:", v8);

    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stopDictation");

    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_textInputSessionAnalytics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "size");
    v14 = v13;
    v16 = v15;
    v17 = (double *)(*(_QWORD *)(a1 + 32) + 1024);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v19 = objc_msgSend(v6, "inputSource");
    v20 = *v17;
    v21 = v17[1];
    v22 = *(double *)(v18 + 32);
    v23 = *(double *)(v18 + 40);
    v24 = 3;
  }
  else if (*(_BYTE *)(a1 + 65))
  {
    if (+[UIDictationController _applicationIsActive](UIDictationController, "_applicationIsActive"))
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "switchToDictationInputModeWithTouch:", 0);

    }
    else
    {
      _UIDictationControllerLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v38 = 0;
        _os_log_impl(&dword_185066000, v30, OS_LOG_TYPE_DEFAULT, "Tap mic button will delay switch to dictation", v38, 2u);
      }

      v31 = dispatch_time(0, 200000000);
      dispatch_after(v31, MEMORY[0x1E0C80D38], &__block_literal_global_359);
    }
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_textInputSessionAnalytics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "size");
    v14 = v32;
    v16 = v33;
    v34 = (double *)(*(_QWORD *)(a1 + 32) + 1024);
    v35 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v19 = objc_msgSend(v6, "inputSource");
    v20 = *v34;
    v21 = v34[1];
    v22 = *(double *)(v35 + 32);
    v23 = *(double *)(v35 + 40);
    v24 = 1;
  }
  else
  {
    _logRejectedTapAction();
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_textInputSessionAnalytics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "size");
    v14 = v26;
    v16 = v27;
    v28 = (double *)(*(_QWORD *)(a1 + 32) + 1024);
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v19 = objc_msgSend(v6, "inputSource");
    v20 = *v28;
    v21 = v28[1];
    v22 = *(double *)(v29 + 32);
    v23 = *(double *)(v29 + 40);
    v24 = 2;
  }
  objc_msgSend(v12, "didKeyboardDockItemButtonPress:buttonType:buttonSize:touchDown:touchUp:touchDuration:inputSource:", v24, 1, v19, v14, v16, v20, v21, v22, v23, v5);

  v36 = *(_QWORD *)(a1 + 32);
  v37 = *(void **)(v36 + 1016);
  *(_QWORD *)(v36 + 1016) = 0;

}

void __90__UISystemKeyboardDockController_dictationItemButtonWasPressed_withEvent_isRunningButton___block_invoke_54()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  _UIDictationControllerLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_185066000, v0, OS_LOG_TYPE_DEFAULT, "Tap mic button will switch to dictation", v2, 2u);
  }

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "switchToDictationInputModeWithTouch:", 0);

}

uint64_t __90__UISystemKeyboardDockController_dictationItemButtonWasPressed_withEvent_isRunningButton___block_invoke_56(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  void *v5;

  result = objc_msgSend(*(id *)(a1 + 32), "gestureConflictsWithTypingWindow");
  v3 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v3 + 969) && (result & 1) == 0)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      *(_BYTE *)(v3 + 968) = 1;
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setReasonType:", 7);

      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "switchToDictationInputModeWithTouch:", *(_QWORD *)(a1 + 48));

      return objc_msgSend(*(id *)(a1 + 56), "hide");
    }
  }
  return result;
}

- (void)globeItemButtonWasPressed:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double MidX;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  uint64_t v19;
  NSDate *v20;
  NSDate *globeItemButtonTouchDownTime;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  CGFloat v34;
  CGFloat v35;
  char v36;
  CGRect v37;
  CGRect v38;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "touchesForView:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bounds");
  MidX = CGRectGetMidX(v37);
  objc_msgSend(v6, "bounds");
  objc_msgSend(v6, "convertPoint:toView:", 0, MidX, CGRectGetMinY(v38));
  v12 = v11;
  v14 = v13;
  objc_msgSend(v9, "locationInView:", v6);
  v16 = v15;
  v18 = v17;
  v19 = objc_msgSend(v6, "pointInsideTapActionRegion:");
  if (!objc_msgSend(v9, "phase") && !self->_globeItemButtonTouchDownTime)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (NSDate *)objc_claimAutoreleasedReturnValue();
    globeItemButtonTouchDownTime = self->_globeItemButtonTouchDownTime;
    self->_globeItemButtonTouchDownTime = v20;

    self->_globeItemButtonTouchDownLocationInView.x = v16;
    self->_globeItemButtonTouchDownLocationInView.y = v18;
  }
  +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "currentInputMode");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v22, "isEqual:", v24);

  if (v25)
  {
    +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "globeButtonPressed:withEvent:location:", v6, v7, v12, v14);

    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_textInputSessionAnalytics");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "didInsertKeyPressWithInputSource:", 1);

  }
  else
  {
    +[UIInputSwitcherView sharedInstance](UIInputSwitcherView, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __70__UISystemKeyboardDockController_globeItemButtonWasPressed_withEvent___block_invoke;
    v31[3] = &unk_1E16D7638;
    v31[4] = self;
    v32 = v9;
    v36 = v19;
    v33 = v6;
    v34 = v16;
    v35 = v18;
    v30 = (id)objc_msgSend(v29, "buttonPressed:withEvent:location:isLocationInsideViewHitArea:isForDictation:tapAction:", v33, v7, v19, 0, v31, v12, v14);

  }
}

void __70__UISystemKeyboardDockController_globeItemButtonWasPressed_withEvent___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  double v21;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "timeIntervalSinceNow");
  v3 = -v2;
  +[UIKBTouchState touchStateForTouch:](UIKBTouchState, "touchStateForTouch:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 72))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __70__UISystemKeyboardDockController_globeItemButtonWasPressed_withEvent___block_invoke_2;
    v15[3] = &unk_1E16D7610;
    v16 = v5;
    v7 = *(id *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 32);
    v17 = v7;
    v18 = v8;
    v20 = *(_OWORD *)(a1 + 56);
    v21 = v3;
    v19 = v4;
    v9 = v5;
    objc_msgSend(v6, "performSingleTask:", v15);

  }
  else
  {
    _logRejectedTapAction();
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_textInputSessionAnalytics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "size");
    objc_msgSend(v10, "didKeyboardDockItemButtonPress:buttonType:buttonSize:touchDown:touchUp:touchDuration:inputSource:", 2, 2, objc_msgSend(v4, "inputSource"), v11, v12, *(double *)(*(_QWORD *)(a1 + 32) + 1048), *(double *)(*(_QWORD *)(a1 + 32) + 1056), *(double *)(a1 + 56), *(double *)(a1 + 64), v3);

  }
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 1040);
  *(_QWORD *)(v13 + 1040) = 0;

}

void __70__UISystemKeyboardDockController_globeItemButtonWasPressed_withEvent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setInputModeToNextInPreferredListWithExecutionContext:", a2);
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_textInputSessionAnalytics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "size");
  objc_msgSend(v3, "didKeyboardDockItemButtonPress:buttonType:buttonSize:touchDown:touchUp:touchDuration:inputSource:", 1, 2, objc_msgSend(*(id *)(a1 + 56), "inputSource"), v4, v5, *(double *)(*(_QWORD *)(a1 + 48) + 1048), *(double *)(*(_QWORD *)(a1 + 48) + 1056), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

}

- (void)keyboardItemButtonWasTapped:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a4, "touchesForView:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "phase") == 3)
  {
    if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setReasonType:", 15);

      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stopDictation");

      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dismissDictationPopover");

    }
    +[UIDictationView activeInstance](UIDictationView, "activeInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "returnToKeyboard");

    -[UIKeyboardDockItem setEnabled:](self->_keyboardDockItem, "setEnabled:", 0);
  }

}

- (void)customDockItemWasTapped:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v5 = a4;
  objc_msgSend(v22, "customAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v22, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "touchesForView:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locationInView:", v10);
    v12 = v11;
    v14 = v13;

    objc_msgSend(v22, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "pointInsideTapActionRegion:", v12, v14);

    if (objc_msgSend(v9, "phase") == 3)
    {
      objc_msgSend(v22, "lastTouchUp");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v16 & ~objc_msgSend(v9, "isEqual:", v17);

      if (v18 == 1)
      {
        objc_msgSend(v22, "setLastTouchUp:", v9);
        objc_msgSend(v22, "customAction");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "customAction");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "sender");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "performWithSender:target:", v21, 0);

      }
    }

  }
}

- (void)keyboardDockView:(id)a3 didPressDockItem:(id)a4 withEvent:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  UIKeyboardDockItem *v14;
  void *v15;
  void *v16;
  UIKeyboardDockItem *v17;

  v17 = (UIKeyboardDockItem *)a4;
  v7 = a5;
  -[UIKeyboardDockItem view](v17, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "touchesForView:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "phase"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "continuousPathUnderway");

    if (v12)
      self->_isSuppressingDockItemTouch = 1;
  }
  if (!self->_isSuppressingDockItemTouch)
  {
    -[UIKeyboardDockItem customAction](v17, "customAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[UISystemKeyboardDockController customDockItemWasTapped:withEvent:](self, "customDockItemWasTapped:withEvent:", v17, v7);
      goto LABEL_15;
    }
    v14 = v17;
    if (self->_dictationDockItem == v17 || (v14 = v17, self->_dictationRunningDockItem == v17))
    {
      -[UIKeyboardDockItem view](v14, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISystemKeyboardDockController dictationItemButtonWasPressed:withEvent:isRunningButton:](self, "dictationItemButtonWasPressed:withEvent:isRunningButton:", v16, v7, self->_dictationRunningDockItem == v17);
      goto LABEL_14;
    }
    if (self->_keyboardDockItem == v17)
    {
      -[UIKeyboardDockItem view](v17, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISystemKeyboardDockController keyboardItemButtonWasTapped:withEvent:](self, "keyboardItemButtonWasTapped:withEvent:", v16, v7);
      goto LABEL_14;
    }
    if (self->_globeDockItem == v17)
    {
      -[UIKeyboardDockItem customAction](v17, "customAction");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        -[UIKeyboardDockItem view](v17, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISystemKeyboardDockController globeItemButtonWasPressed:withEvent:](self, "globeItemButtonWasPressed:withEvent:", v16, v7);
LABEL_14:

      }
    }
  }
LABEL_15:
  if (objc_msgSend(v10, "phase") == 3 || objc_msgSend(v10, "phase") == 4)
    self->_isSuppressingDockItemTouch = 0;

}

- (void)updateDockItemsVisibilityWithCustomDictationAction:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  __CFString **v22;
  __CFString *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  _BOOL8 v32;
  void *v33;
  __CFString *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  __CFString *v42;
  void *v43;
  UIKeyboardDockItem *dictationDockItem;
  void *v45;
  UIKeyboardDockItem *dictationRunningDockItem;
  void *v47;
  UIKeyboardDockItem *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  _BOOL8 v55;
  _UNKNOWN **v56;
  __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;

  v62 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCurrentEditResponderInEditingMode");

  if (v5)
  {
    -[UIViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_inheritedRenderConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "animatedBackground");

    -[UIViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8)
    {
      objc_msgSend(v10, "setAllowsGroupOpacity:", 0);

      -[UIViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = 0;
    }
    else
    {
      objc_msgSend(v10, "setAllowsGroupOpacity:", 1);

      -[UIViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = 1;
    }
    objc_msgSend(v13, "setAllowsGroupBlending:", v15);

    v16 = CFSTR("globe");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "globeKeyDisplaysAsEmojiKey"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "showsDedicatedEmojiKeyAlongsideGlobeButton") ^ 1;

    }
    else
    {
      v19 = 0;
    }

    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "lastInputModeSwitchTriggeredByASCIIToggle");

    if (v19)
    {
      v22 = UIKeyboardEmojiIconImageName;
    }
    else
    {
      if (!v21)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "internationalKeyDisplayStringOnEmojiKeyboard");
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v35 = -[__CFString length](v34, "length");
        v24 = v35 != 0;
        if (v35)
        {
          v23 = v34;

        }
        else
        {
          v23 = v16;
        }
        if (v34 == CFSTR(""))
        {
          v57 = CFSTR("hand.draw");

          v16 = v34;
          v23 = v57;
        }
        else
        {
          v16 = v34;
        }
LABEL_13:

        -[UISystemKeyboardDockController dockView](self, "dockView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "leftDockItem");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISystemKeyboardDockController configuredGlyphWithName:](self, "configuredGlyphWithName:", v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setTitle:image:", v23, v27);

        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "isUsingDictationLayout");

        if (v62)
        {
          -[UISystemKeyboardDockController updateRightButtonItemWithCustomAction:](self, "updateRightButtonItemWithCustomAction:");
LABEL_41:

          goto LABEL_42;
        }
        if (v29)
        {
          +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "enabledDictationLanguages");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (unint64_t)objc_msgSend(v31, "count") > 1;

          -[UIKeyboardDockItem setEnabled:](self->_globeDockItem, "setEnabled:", v32);
          -[UISystemKeyboardDockController setKeyboardDockItem](self, "setKeyboardDockItem");
          -[UIKeyboardDockItem setEnabled:](self->_keyboardDockItem, "setEnabled:", 1);
          -[UIKeyboardDockItem setActive:](self->_dictationDockItem, "setActive:", 1);
          goto LABEL_41;
        }
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "shouldShowInternationalKey");

        -[UIKeyboardDockItem setEnabled:](self->_globeDockItem, "setEnabled:", v37);
        LODWORD(v37) = +[UIDictationController isRunning](UIDictationController, "isRunning");
        +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "isCurrentDictationLanguageOnDevice");

        if ((_DWORD)v37)
        {
          v40 = 3;
          if (v39)
            v40 = 2;
          v41 = *(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___UISystemKeyboardDockController__globeDockItem[v40]);
          -[UISystemKeyboardDockController dockView](self, "dockView");
          v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[__CFString setRightDockItem:](v42, "setRightDockItem:", v41);
LABEL_31:

          +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "currentInputMode");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v51, "isExtensionInputMode") & 1) != 0)
          {
            +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "currentInputMode");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v53, "extensionInputModeHasDictation");

            if ((v54 & 1) != 0)
            {
              v55 = 0;
              v56 = &off_1E167A000;
LABEL_40:
              -[UIKeyboardDockItem setEnabled:](self->_dictationDockItem, "setEnabled:", v55);
              -[UIKeyboardDockItem setActive:](self->_dictationDockItem, "setActive:", v55 & objc_msgSend(v56[205], "dictationIsFunctional"));
              -[UISystemKeyboardDockController dockView](self, "dockView");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "setCenterDockItem:", 0);

              -[UIView removeFromSuperview](self->_stopDictationButton, "removeFromSuperview");
              goto LABEL_41;
            }
          }
          else
          {

          }
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v58, "shouldShowDictationKey"))
          {
            +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "enabledDictationLanguages");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v60, "count") != 0;

          }
          else
          {
            v55 = 0;
          }
          v56 = &off_1E167A000;

          goto LABEL_40;
        }
        v42 = CFSTR("mic");
        +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v43, "_lightStyleRenderConfig") & 1) == 0)
        {

          if ((v19 | v24) != 1)
          {
LABEL_30:
            dictationDockItem = self->_dictationDockItem;
            -[UISystemKeyboardDockController configuredGlyphWithName:](self, "configuredGlyphWithName:", v42);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIKeyboardDockItem setTitle:image:](dictationDockItem, "setTitle:image:", v42, v45);

            dictationRunningDockItem = self->_dictationRunningDockItem;
            -[UISystemKeyboardDockController configuredGlyphWithName:](self, "configuredGlyphWithName:", v42);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIKeyboardDockItem setTitle:image:](dictationRunningDockItem, "setTitle:image:", v42, v47);

            v48 = self->_dictationDockItem;
            -[UISystemKeyboardDockController dockView](self, "dockView");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "setRightDockItem:", v48);

            goto LABEL_31;
          }
          v43 = v42;
          v42 = CFSTR("mic.fill");
        }

        goto LABEL_30;
      }
      v22 = UIKeyboardGlobeWithBackChevronIconImageName;
    }
    v23 = *v22;
    v24 = 0;
    goto LABEL_13;
  }
LABEL_42:

}

- (id)imageConfig
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_lightStyleRenderConfig"))
    v3 = 1;
  else
    v3 = 2;

  +[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, 3, 21.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationWithTraitCollection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setDockView:(id)a3
{
  objc_storeStrong((id *)&self->_dockView, a3);
}

@end
