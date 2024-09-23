@implementation UIKeyboardEmojiPopoverController

- (UIKeyboardEmojiPopoverController)initWithTextInputTraits:(id)a3
{
  id v4;
  UIKeyboardTaskQueue *v5;
  UIKeyboardEmojiPopoverController *v6;

  v4 = a3;
  v5 = objc_alloc_init(UIKeyboardTaskQueue);
  v6 = -[UIKeyboardEmojiPopoverController initWithTextInputTraits:taskQueue:](self, "initWithTextInputTraits:taskQueue:", v4, v5);

  return v6;
}

- (UIKeyboardEmojiPopoverController)initWithTextInputTraits:(id)a3 taskQueue:(id)a4
{
  return -[UIKeyboardEmojiPopoverController initWithTextInputTraits:taskQueue:scrollingDirection:](self, "initWithTextInputTraits:taskQueue:scrollingDirection:", a3, a4, 0);
}

- (UIKeyboardEmojiPopoverController)initWithTextInputTraits:(id)a3 taskQueue:(id)a4 window:(id)a5
{
  return -[UIKeyboardEmojiPopoverController initWithTextInputTraits:taskQueue:scrollingDirection:window:caretRect:](self, "initWithTextInputTraits:taskQueue:scrollingDirection:window:caretRect:", a3, a4, 0, a5, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

- (UIKeyboardEmojiPopoverController)initWithTextInputTraits:(id)a3 hasVerticalScrolling:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  UIKeyboardTaskQueue *v7;
  UIKeyboardEmojiPopoverController *v8;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(UIKeyboardTaskQueue);
  v8 = -[UIKeyboardEmojiPopoverController initWithTextInputTraits:taskQueue:scrollingDirection:](self, "initWithTextInputTraits:taskQueue:scrollingDirection:", v6, v7, v4);

  return v8;
}

- (UIKeyboardEmojiPopoverController)initWithTextInputTraits:(id)a3 taskQueue:(id)a4 scrollingDirection:(int64_t)a5
{
  return -[UIKeyboardEmojiPopoverController initWithTextInputTraits:taskQueue:scrollingDirection:window:caretRect:](self, "initWithTextInputTraits:taskQueue:scrollingDirection:window:caretRect:", a3, a4, a5, 0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

- (UIKeyboardEmojiPopoverController)initWithTextInputTraits:(id)a3 taskQueue:(id)a4 scrollingDirection:(int64_t)a5 window:(id)a6 caretRect:(CGRect)a7
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  id v17;
  id v18;
  UIKeyboardEmojiPopoverController *v19;
  void *v20;
  double v21;
  uint64_t v22;
  UIKBScreenTraits *screenTraits;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  UIKBTree *keyboard;
  objc_super v30;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v30.receiver = self;
  v30.super_class = (Class)UIKeyboardEmojiPopoverController;
  v19 = -[UIKeyboardPopoverController init](&v30, sel_init);
  if (v19)
  {
    objc_msgSend(v18, "traitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "horizontalSizeClass") == 1)
      v21 = 320.0;
    else
      v21 = 375.0;

    +[UIKBScreenTraits traitsForPopoverEmulatingWidth:minorEdge:orientation:idiom:](UIKBScreenTraits, "traitsForPopoverEmulatingWidth:minorEdge:orientation:idiom:", 1, 1, 0, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    screenTraits = v19->_screenTraits;
    v19->_screenTraits = (UIKBScreenTraits *)v22;

    if (a5 == 1)
    {
      -[UIKBScreenTraits setResizeKeyboardHeight:](v19->_screenTraits, "setResizeKeyboardHeight:", 1);
      objc_msgSend(v18, "bounds");
      -[UIKeyboardEmojiPopoverController keyboardHeightAdjustmentForCaretRect:windowSize:](v19, "keyboardHeightAdjustmentForCaretRect:windowSize:", x, y, width, height, v24, v25);
      -[UIKBScreenTraits setKeyboardHeightAdjustment:](v19->_screenTraits, "setKeyboardHeightAdjustment:");
    }
    -[UIKBScreenTraits setPreferredEmojiScrollingDirection:](v19->_screenTraits, "setPreferredEmojiScrollingDirection:", a5);
    objc_storeStrong((id *)&v19->_textInputTraits, a3);
    objc_storeStrong((id *)&v19->_taskQueue, a4);
    UIKeyboardGetKBStarName(CFSTR("emoji"), v19->_screenTraits, 0, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardLayoutStar keyboardWithName:screenTraits:](UIKeyboardLayoutStar, "keyboardWithName:screenTraits:", v26, v19->_screenTraits);
    v27 = objc_claimAutoreleasedReturnValue();
    keyboard = v19->_keyboard;
    v19->_keyboard = (UIKBTree *)v27;

  }
  return v19;
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_hiddenKeys;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "setVisible:", 1);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[UIKeyboardLayoutStar setDelegate:](self->_layout, "setDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardEmojiPopoverController;
  -[UIViewController dealloc](&v9, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  UIKeyboardLayoutStar *v4;
  UIKeyboardLayoutStar *layout;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  objc_class *v13;
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
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
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
  objc_super v67;
  _QWORD v68[5];
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[3];
  void *v74;
  _QWORD v75[7];

  v75[5] = *MEMORY[0x1E0C80C00];
  v67.receiver = self;
  v67.super_class = (Class)UIKeyboardEmojiPopoverController;
  -[UIKeyboardPopoverController viewDidLoad](&v67, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_shouldDismissNotification_, CFSTR("UIKeyboardEmojiPopoverControllerShouldDismiss"), 0);

  v4 = objc_alloc_init(UIKeyboardLayoutStar);
  layout = self->_layout;
  self->_layout = v4;

  -[UIKeyboardLayoutStar setDelegate:](self->_layout, "setDelegate:", self);
  -[UIKeyboardLayoutStar setPreventPaddlesForPointerTouches:](self->_layout, "setPreventPaddlesForPointerTouches:", 1);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_layout, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIKeyboardLayout setTaskQueue:](self->_layout, "setTaskQueue:", self->_taskQueue);
  if (!+[UIKeyboard isRemoteEmojiCollectionViewEnabled](UIKeyboard, "isRemoteEmojiCollectionViewEnabled"))
    -[UIKeyboardEmojiPopoverController showKeyboardLayout](self, "showKeyboardLayout");
  -[UIViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_layout);

  if (-[UIKeyboardEmojiPopoverController isPhone](self, "isPhone"))
    v7 = -2.0;
  else
    v7 = 0.0;
  -[UIKeyboardLayoutStar emojiKeyManager](self->_layout, "emojiKeyManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_18;
  -[UIKeyboardLayoutStar emojiKeyManager](self->_layout, "emojiKeyManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    goto LABEL_10;
  }
  v11 = +[UIKeyboard isRemoteEmojiCollectionViewEnabled](UIKeyboard, "isRemoteEmojiCollectionViewEnabled");

  if (!v11)
  {
LABEL_18:
    v29 = -[UIKeyboardEmojiPopoverController isPhone](self, "isPhone");
LABEL_19:
    -[UIView topAnchor](self->_layout, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "safeAreaLayoutGuide");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }
LABEL_10:
  v69 = 0;
  v70 = &v69;
  v71 = 0x2050000000;
  v12 = (void *)getTUIEmojiSearchInputViewControllerClass_softClass;
  v72 = getTUIEmojiSearchInputViewControllerClass_softClass;
  if (!getTUIEmojiSearchInputViewControllerClass_softClass)
  {
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __getTUIEmojiSearchInputViewControllerClass_block_invoke;
    v68[3] = &unk_1E16B14C0;
    v68[4] = &v69;
    __getTUIEmojiSearchInputViewControllerClass_block_invoke((uint64_t)v68);
    v12 = (void *)v70[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v69, 8);
  v14 = (void *)objc_msgSend([v13 alloc], "initWithNibName:bundle:", 0, 0);
  objc_storeStrong((id *)&self->_emojiSearchInputViewController, v14);
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIViewController addChildViewController:](self, "addChildViewController:", v14);
  -[UIViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  objc_msgSend(v14, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "safeAreaLayoutGuide");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "topAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:constant:", v57, 8.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v53;
  -[UIView topAnchor](self->_layout, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v75[1] = v49;
  objc_msgSend(v14, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_layout, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v75[2] = v18;
  -[UIView trailingAnchor](self->_layout, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v75[3] = v22;
  objc_msgSend(v14, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiPopoverController preferredTextFieldHeight](self, "preferredTextFieldHeight");
  objc_msgSend(v24, "constraintEqualToConstant:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v75[4] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 5);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "emojiSearchView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setPredictionViewVisible:", 0);
  objc_msgSend(v26, "setCollapsed:", 0);
  objc_msgSend(v26, "searchTextField");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setKeyboardType:", 122);

  objc_msgSend(v26, "searchTextField");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setReturnKeyType:", 9);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v26, "setResultsViewVisible:", 0);
  if (!+[UIKeyboard isRemoteEmojiCollectionViewEnabled](UIKeyboard, "isRemoteEmojiCollectionViewEnabled"))
    -[UIKeyboardEmojiPopoverController associateEmojiSearchViewWithEmojiInputView](self, "associateEmojiSearchViewWithEmojiInputView");

  v29 = -[UIKeyboardEmojiPopoverController isPhone](self, "isPhone");
  if (!v65)
    goto LABEL_19;
LABEL_20:
  if (v29)
    v35 = 8.0;
  else
    v35 = 0.0;
  -[UIView leadingAnchor](self->_layout, "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "safeAreaLayoutGuide");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:constant:", v60, v35);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v58;
  -[UIView trailingAnchor](self->_layout, "trailingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "safeAreaLayoutGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:constant:", v37, -v35);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v38;
  -[UIView bottomAnchor](self->_layout, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "safeAreaLayoutGuide");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v73[2] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "arrayByAddingObjectsFromArray:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v45);
}

- (void)shouldDismissNotification:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v6 = v13;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v13, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController popoverPresentationController](self, "popoverPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[UIView _containsView:]((uint64_t)v9, (uint64_t)v10);

    if (v11)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dismissEmojiPopoverIfNecessaryWithCompletion:", 0);

    }
    v6 = v13;
  }

}

- (void)showKeyboardLayout
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  -[UIView _inheritedRenderConfig](self->_layout, "_inheritedRenderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[UIKBRenderConfig defaultConfig](UIKBRenderConfig, "defaultConfig");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = (id)objc_msgSend(v6, "copy");
  objc_msgSend(v7, "setIsFloating:", 1);
  -[UIKeyboardLayoutStar showKeyboardWithInputMode:renderConfig:inputTraits:screenTraits:splitTraits:](self->_layout, "showKeyboardWithInputMode:renderConfig:inputTraits:screenTraits:splitTraits:", CFSTR("emoji"), v7, self->_textInputTraits, self->_screenTraits, 0);

}

- (void)associateEmojiSearchViewWithEmojiInputView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UIKeyboardLayoutStar emojiKeyManager](self->_layout, "emojiKeyManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TUIEmojiSearchInputViewController setDelegate:](self->_emojiSearchInputViewController, "setDelegate:", v7);
    objc_msgSend(v7, "setEmojiSearchInputViewController:", self->_emojiSearchInputViewController);
    -[TUIEmojiSearchInputViewController emojiSearchView](self->_emojiSearchInputViewController, "emojiSearchView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEmojiSearchField:", v5);

    objc_msgSend(v4, "searchTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "becomeFirstResponder");

  }
}

- (void)configurePopoverPresentationController:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setPopoverBackgroundViewClass:", objc_opt_class());

}

- (double)preferredTextFieldHeight
{
  void *v2;
  id v3;
  double result;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getTUIEmojiSearchTextFieldClass_softClass;
  v9 = getTUIEmojiSearchTextFieldClass_softClass;
  if (!getTUIEmojiSearchTextFieldClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getTUIEmojiSearchTextFieldClass_block_invoke;
    v5[3] = &unk_1E16B14C0;
    v5[4] = &v6;
    __getTUIEmojiSearchTextFieldClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "preferredHeight");
  return result;
}

- (CGSize)preferredContentSize
{
  UIKBTree *keyboard;
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
  CGSize result;

  keyboard = self->_keyboard;
  if (keyboard)
  {
    -[UIKBTree frame](keyboard, "frame");
    v5 = v4;
    v7 = v6;
  }
  else
  {
    +[UIKeyboardLayoutStar keyboardSizeForInputMode:screenTraits:keyboardType:](UIKeyboardLayoutStar, "keyboardSizeForInputMode:screenTraits:keyboardType:", CFSTR("emoji"), self->_screenTraits, 124);
    v5 = v8;
    v7 = v9;
  }
  if (-[UIKBScreenTraits resizeKeyboardHeight](self->_screenTraits, "resizeKeyboardHeight"))
  {
    -[UIKBScreenTraits keyboardHeightAdjustment](self->_screenTraits, "keyboardHeightAdjustment");
    v7 = v7 + v10;
  }
  -[UIKeyboardEmojiPopoverController preferredTextFieldHeight](self, "preferredTextFieldHeight");
  v12 = v11;
  if (-[UIKeyboardEmojiPopoverController isPhone](self, "isPhone"))
  {
    -[UIKeyboardEmojiPopoverController preferredContentSizeForPhone](self, "preferredContentSizeForPhone");
    v5 = v14;
  }
  else
  {
    v13 = v7 + v12 + 8.0;
  }
  v15 = v5;
  result.height = v13;
  result.width = v15;
  return result;
}

- (BOOL)isPhone
{
  void *v2;
  BOOL v3;

  -[UIViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 0;

  return v3;
}

- (CGSize)preferredContentSizeForPhone
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  double v27;
  CGSize result;

  -[UIKBScreenTraits screen](self->_screenTraits, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[UIViewController viewIfLoaded](self, "viewIfLoaded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIViewController traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "verticalSizeClass");

  objc_msgSend(v9, "safeAreaInsets");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v9, "safeAreaInsets");
  if (v11 == 1)
  {
    v18 = (v5 - (v13 + v16)) * 0.5 + -32.0;
    objc_msgSend(v9, "safeAreaInsets");
    v20 = v19;
    objc_msgSend(v9, "safeAreaInsets");
    v22 = v7 - (v20 + v21);
  }
  else
  {
    v18 = v5 - (v15 + v17);
    objc_msgSend(v9, "safeAreaInsets");
    v24 = v23;
    objc_msgSend(v9, "safeAreaInsets");
    v22 = (v7 - (v24 + v25)) * 0.5 + -32.0;
  }

  v26 = v18;
  v27 = v22;
  result.height = v27;
  result.width = v26;
  return result;
}

- (double)keyboardHeightAdjustmentForCaretRect:(CGRect)a3 windowSize:(CGSize)a4
{
  double height;
  CGFloat v5;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  BOOL IsNull;
  double result;
  double MinY;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;

  height = a4.height;
  v5 = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  IsNull = CGRectIsNull(a3);
  result = 100.0;
  if (!IsNull && height != 0.0)
  {
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = v5;
    MinY = CGRectGetMinY(v17);
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = v5;
    v13 = height - CGRectGetMaxY(v18);
    if (MinY >= v13)
      v13 = MinY;
    v14 = v13 + -66.0;
    if (v14 >= 0.0)
      v15 = v14;
    else
      v15 = 0.0;
    -[UIKeyboardEmojiPopoverController preferredContentSize](self, "preferredContentSize");
    result = v15 - v16;
    if (v15 - v16 > 100.0)
      result = 100.0;
    if (result < 0.0)
      return 0.0;
  }
  return result;
}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  void *v5;
  UIKBViewForResponderForwarding *v6;
  UIKBViewForResponderForwarding *v7;
  UIKBViewForResponderForwarding *containerForActiveKeys;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardEmojiPopoverController;
  -[UIViewController viewIsAppearing:](&v10, sel_viewIsAppearing_, a3);
  -[UIViewController presentationController](self, "presentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [UIKBViewForResponderForwarding alloc];
  objc_msgSend(v5, "bounds");
  v7 = -[UIView initWithFrame:](v6, "initWithFrame:");
  containerForActiveKeys = self->_containerForActiveKeys;
  self->_containerForActiveKeys = v7;

  -[UIKBViewForResponderForwarding setResponderForForwarding:](self->_containerForActiveKeys, "setResponderForForwarding:", self->_layout);
  objc_msgSend(v5, "addSubview:", self->_containerForActiveKeys);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_postInputResponderCapabilitiesChangedNotificationWithOutput:selectionChanged:", 0, 0);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UIKeyboardEmojiPopoverController;
  -[UIViewController viewDidLayoutSubviews](&v14, sel_viewDidLayoutSubviews);
  if (!self->_shownKeyboardLayout)
  {
    self->_shownKeyboardLayout = 1;
    if (+[UIKeyboard isRemoteEmojiCollectionViewEnabled](UIKeyboard, "isRemoteEmojiCollectionViewEnabled"))
    {
      if (!-[UIKeyboardEmojiPopoverController isPhone](self, "isPhone"))
      {
LABEL_9:
        -[UIKeyboardEmojiPopoverController showKeyboardLayout](self, "showKeyboardLayout");
        -[UIKeyboardEmojiPopoverController associateEmojiSearchViewWithEmojiInputView](self, "associateEmojiSearchViewWithEmojiInputView");
        return;
      }
      -[UIKBScreenTraits setResizeKeyboardHeight:](self->_screenTraits, "setResizeKeyboardHeight:", 0);
      -[UIViewController view](self, "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bounds");
      v5 = v4;
      v7 = v6;

      -[UIViewController popoverPresentationController](self, "popoverPresentationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "arrowDirection") == 2)
      {

      }
      else
      {
        -[UIViewController popoverPresentationController](self, "popoverPresentationController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "arrowDirection");

        if (v10 != 1)
        {
LABEL_8:
          -[TUIEmojiSearchInputViewController emojiSearchView](self->_emojiSearchInputViewController, "emojiSearchView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "bounds");
          v13 = v7 - v12;

          -[UIKBScreenTraits setPreferredContentSizeInPopover:](self->_screenTraits, "setPreferredContentSizeInPopover:", v5 + -12.0, v13);
          goto LABEL_9;
        }
      }
      v7 = v7 + -13.0;
      goto LABEL_8;
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v4;
  UIKeyboardLayoutStar *layout;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIKeyboardEmojiPopoverController;
  -[UIViewController viewWillDisappear:](&v12, sel_viewWillDisappear_, a3);
  v4 = +[UIKeyboard isRemoteEmojiCollectionViewEnabled](UIKeyboard, "isRemoteEmojiCollectionViewEnabled");
  layout = self->_layout;
  if (v4)
  {
    -[UIKeyboardLayoutStar keyplane](layout, "keyplane");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstCachedKeyWithName:", CFSTR("Emoji-InputView-Key"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKeyboardLayoutStar currentKeyplaneView](self->_layout, "currentKeyplaneView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "frame");
    objc_msgSend(v9, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    -[UIView addSubview:](self->_layout, "addSubview:", v9);

  }
  else
  {
    -[UIKeyboardLayoutStar deactivateActiveKeys](layout, "deactivateActiveKeys");
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clearForwardingInputDelegateAndResign:", 0);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_postInputResponderCapabilitiesChangedNotificationWithOutput:selectionChanged:", 0, 0);

}

- (UIKeyboardLayoutStar)layout
{
  return self->_layout;
}

- (BOOL)handleHardwareKeyboardEvent:(id)a3
{
  id v4;
  UIKey *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[UIKey initWithKeyboardEvent:]([UIKey alloc], "initWithKeyboardEvent:", v4);

  -[UIKeyboardLayoutStar emojiKeyManager](self->_layout, "emojiKeyManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "handleKeyEvent:", v5);
  return (char)v6;
}

- (int64_t)overrideUserInterfaceStyle
{
  void *v2;
  int64_t v3;

  -[UIKeyboardLayoutStar renderConfig](self->_layout, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "lightKeyboard"))
    v3 = 1;
  else
    v3 = 2;

  return v3;
}

- (BOOL)wantsDimmingView
{
  return 1;
}

- (void)keyboardLayout:(id)a3 didSwitchToKeyplane:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  NSMutableArray *hiddenKeys;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_hiddenKeys)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    hiddenKeys = self->_hiddenKeys;
    self->_hiddenKeys = v8;

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v7, "cachedKeysByKeyName:", CFSTR("Emoji-International-Key"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v15, "setVisible:", 0);
        -[NSMutableArray addObject:](self->_hiddenKeys, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v12);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v7, "cachedKeysByKeyName:", CFSTR("Delete-Key"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
        if (-[UITextInputTraits keyboardType](self->_textInputTraits, "keyboardType") != 124)
        {
          objc_msgSend(v21, "setVisible:", 0);
          -[NSMutableArray addObject:](self->_hiddenKeys, "addObject:", v21);
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v18);
  }

}

- (id)keyboardLayout:(id)a3 containingViewForActiveKey:(id)a4 inKeyplaneView:(id)a5
{
  return self->_containerForActiveKeys;
}

- (id)_containerForContainerWindowPortalInteraction
{
  return self->_containerForActiveKeys;
}

- (id)keyboardLayout:(id)a3 willChangeRenderConfig:(id)a4
{
  id v4;
  void *v5;

  v4 = a4;
  if ((objc_msgSend(v4, "isFloating") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(v4, "copy");

    objc_msgSend(v5, "setIsFloating:", 1);
    v4 = v5;
  }
  return v4;
}

+ (id)visualEffectGroupName
{
  return CFSTR("UIKeyboardEmojiPopoverController");
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiSearchInputViewController, 0);
  objc_storeStrong((id *)&self->_containerForActiveKeys, 0);
  objc_storeStrong((id *)&self->_hiddenKeys, 0);
  objc_storeStrong((id *)&self->_keyboard, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_textInputTraits, 0);
  objc_storeStrong((id *)&self->_screenTraits, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
