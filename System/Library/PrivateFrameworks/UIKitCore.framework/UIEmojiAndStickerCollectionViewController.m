@implementation UIEmojiAndStickerCollectionViewController

- (UIEmojiAndStickerCollectionViewController)initWithConfiguration:(id)a3
{
  id v5;
  UIEmojiAndStickerCollectionViewController *v6;
  UIEmojiAndStickerCollectionViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIEmojiAndStickerCollectionViewController;
  v6 = -[UIViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configuration, a3);

  return v7;
}

- (UIEmojiAndStickerCollectionViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIEmojiAndStickerCollectionViewController;
  return -[UIViewController init](&v3, sel_init);
}

- (id)emojiKeyManager
{
  return -[UIKeyboardLayoutStar emojiKeyManager](self->_layout, "emojiKeyManager");
}

- (void)viewDidLoad
{
  UIKeyboardLayoutStar *v3;
  void *v4;
  UIKeyboardLayoutStar *v5;
  UIKeyboardLayoutStar *layout;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIEmojiAndStickerBackgroundView *v16;
  void *v17;
  UIEmojiAndStickerBackgroundView *v18;
  UIEmojiAndStickerBackgroundView *backgroundView;
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
  void *v45;
  void *v46;
  void *v47;
  objc_super v48;
  _QWORD v49[4];
  _QWORD v50[6];

  v50[4] = *MEMORY[0x1E0C80C00];
  v48.receiver = self;
  v48.super_class = (Class)UIEmojiAndStickerCollectionViewController;
  -[UIViewController viewDidLoad](&v48, sel_viewDidLoad);
  v3 = [UIKeyboardLayoutStar alloc];
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[UIKeyboardLayoutStar initWithFrame:](v3, "initWithFrame:");
  layout = self->_layout;
  self->_layout = v5;

  -[UIKeyboardLayoutStar setPreventPaddlesForPointerTouches:](self->_layout, "setPreventPaddlesForPointerTouches:", 1);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_layout, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIKeyboardLayoutStar setDelegate:](self->_layout, "setDelegate:", self);
  -[UIViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_layout);

  -[UIView topAnchor](self->_layout, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "safeAreaLayoutGuide");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v39);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v37;
  -[UIView leadingAnchor](self->_layout, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "safeAreaLayoutGuide");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v32;
  -[UIView trailingAnchor](self->_layout, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "safeAreaLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v10;
  -[UIView bottomAnchor](self->_layout, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeAreaLayoutGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v47);
  v16 = [UIEmojiAndStickerBackgroundView alloc];
  -[UIViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v18 = -[UIEmojiAndStickerBackgroundView initWithFrame:](v16, "initWithFrame:");
  backgroundView = self->_backgroundView;
  self->_backgroundView = v18;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "insertSubview:belowSubview:", self->_backgroundView, self->_layout);

  v38 = (void *)MEMORY[0x1E0D156E0];
  -[UIView topAnchor](self->_backgroundView, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_layout, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v44);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v42;
  -[UIView leadingAnchor](self->_backgroundView, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_layout, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v22;
  -[UIView trailingAnchor](self->_backgroundView, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_layout, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v25;
  -[UIView bottomAnchor](self->_backgroundView, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_layout, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "activateConstraints:", v29);

}

- (void)viewIsAppearing:(BOOL)a3
{
  UIKeyboardLayoutStar *layout;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  STKEmojiAndStickerCollectionViewConfiguration *configuration;
  double v14;
  double v15;
  void *v16;
  double v17;
  UIKBScreenTraits *v18;
  UIKBScreenTraits *screenTraits;
  double v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)UIEmojiAndStickerCollectionViewController;
  -[UIViewController viewIsAppearing:](&v26, sel_viewIsAppearing_, a3);
  layout = self->_layout;
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveLayout:", layout);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "taskQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayout setTaskQueue:](self->_layout, "setTaskQueue:", v7);

  -[UIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[UIViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "interfaceOrientation");

  }
  else
  {
    v12 = 1;
  }

  configuration = self->_configuration;
  if (configuration)
  {
    -[STKEmojiAndStickerCollectionViewConfiguration keyboardWidth](configuration, "keyboardWidth");
    v15 = v14;
    -[UIViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    +[UIKBScreenTraits traitsForRemoteEmojiKeyboardForHostWidth:clientWidth:minorEdge:orientation:idiom:isPopover:](UIKBScreenTraits, "traitsForRemoteEmojiKeyboardForHostWidth:clientWidth:minorEdge:orientation:idiom:isPopover:", -[STKEmojiAndStickerCollectionViewConfiguration isKeyboardMinorEdgeWidth](self->_configuration, "isKeyboardMinorEdgeWidth"), v12, -[STKEmojiAndStickerCollectionViewConfiguration userInterfaceIdiom](self->_configuration, "userInterfaceIdiom"), -[STKEmojiAndStickerCollectionViewConfiguration isInPopover](self->_configuration, "isInPopover"), v15, v17);
  }
  else
  {
    -[UIViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    +[UIKBScreenTraits traitsForPopoverEmulatingWidth:minorEdge:orientation:idiom:](UIKBScreenTraits, "traitsForPopoverEmulatingWidth:minorEdge:orientation:idiom:", 1, v12, 0, v20);
  }
  v18 = (UIKBScreenTraits *)objc_claimAutoreleasedReturnValue();
  screenTraits = self->_screenTraits;
  self->_screenTraits = v18;

  -[UIView _inheritedRenderConfig](self->_layout, "_inheritedRenderConfig");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    v23 = v21;
  }
  else
  {
    +[UIKBRenderConfig defaultConfig](UIKBRenderConfig, "defaultConfig");
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = v23;

  v25 = (void *)objc_msgSend(v24, "copy");
  objc_msgSend(v25, "setIsFloating:", 0);
  -[UIKeyboardLayoutStar showKeyboardWithInputMode:renderConfig:inputTraits:screenTraits:splitTraits:](self->_layout, "showKeyboardWithInputMode:renderConfig:inputTraits:screenTraits:splitTraits:", CFSTR("emoji"), v25, 0, self->_screenTraits, 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  UIKeyboardLayoutStar *v5;
  UIKeyboardLayoutStar *layout;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIEmojiAndStickerCollectionViewController;
  -[UIViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  -[UIKeyboardLayoutStar deactivateActiveKeys](self->_layout, "deactivateActiveKeys");
  -[UIKeyboardLayout setTaskQueue:](self->_layout, "setTaskQueue:", 0);
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeLayout");
  v5 = (UIKeyboardLayoutStar *)objc_claimAutoreleasedReturnValue();
  layout = self->_layout;

  if (v5 == layout)
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActiveLayout:", 0);

    +[UIKeyboardImpl releaseSharedInstance](UIKeyboardImpl, "releaseSharedInstance");
  }
}

- (void)viewWillLayoutSubviews
{
  double v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  double v8;
  objc_super v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v9.receiver = self;
  v9.super_class = (Class)UIEmojiAndStickerCollectionViewController;
  -[UIViewController viewWillLayoutSubviews](&v9, sel_viewWillLayoutSubviews);
  v3 = 0.0;
  if (-[STKEmojiAndStickerCollectionViewConfiguration userInterfaceIdiom](self->_configuration, "userInterfaceIdiom") == 1
    && (-[STKEmojiAndStickerCollectionViewConfiguration isInPopover](self->_configuration, "isInPopover") & 1) == 0)
  {
    -[UIViewController traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "horizontalSizeClass");

    if (v5 == 2)
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x2050000000;
      v6 = (void *)_MergedGlobals_1_28;
      v14 = _MergedGlobals_1_28;
      if (!_MergedGlobals_1_28)
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __getTUIEmojiSearchTextFieldClass_block_invoke_1;
        v10[3] = &unk_1E16B14C0;
        v10[4] = &v11;
        __getTUIEmojiSearchTextFieldClass_block_invoke_1((uint64_t)v10);
        v6 = (void *)v12[3];
      }
      v7 = objc_retainAutorelease(v6);
      _Block_object_dispose(&v11, 8);
      objc_msgSend(v7, "preferredHeight");
      v3 = v8;
    }
  }
  -[UIEmojiAndStickerBackgroundView setCutoutHeight:](self->_backgroundView, "setCutoutHeight:", v3);
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

- (BOOL)handleKeyEvent:(id)a3
{
  UIKeyboardLayoutStar *layout;
  id v4;
  void *v5;
  void *v6;

  layout = self->_layout;
  v4 = a3;
  -[UIKeyboardLayoutStar emojiKeyManager](layout, "emojiKeyManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "handleKeyEvent:", v4);
  return (char)v5;
}

- (void)handleKeyUIEvent:(id)a3 dismiss:(BOOL)a4
{
  _BOOL8 v4;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  v13 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v13;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v13, "_modifiedInput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[UIEmojiAndStickerCollectionViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      -[UIEmojiAndStickerCollectionViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v10 & 1) != 0)
        objc_msgSend(v11, "didSelectEmoji:dismiss:", v8, v4);
      else
        objc_msgSend(v11, "didSelectEmoji:", v8);

    }
    v7 = v13;
  }

}

- (void)addNoResultsViewIfNeeded
{
  UIEmojiNoResultsView *v3;
  UIEmojiNoResultsView *noResultsView;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  if (!self->_noResultsView)
  {
    v3 = objc_alloc_init(UIEmojiNoResultsView);
    noResultsView = self->_noResultsView;
    self->_noResultsView = v3;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_noResultsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", self->_noResultsView);

    v16 = (void *)MEMORY[0x1E0D156E0];
    -[UIView topAnchor](self->_noResultsView, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    -[UIView bottomAnchor](self->_noResultsView, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v6;
    -[UIView leadingAnchor](self->_noResultsView, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v10;
    -[UIView trailingAnchor](self->_noResultsView, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v15);

  }
}

- (void)setSearchResults:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4 && !objc_msgSend(v4, "count"))
  {
    -[UIEmojiAndStickerCollectionViewController addNoResultsViewIfNeeded](self, "addNoResultsViewIfNeeded");
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  -[UIView setHidden:](self->_noResultsView, "setHidden:", v5 ^ 1);
  -[UIView setHidden:](self->_layout, "setHidden:", v5);
  -[UIEmojiNoResultsView setSupportsGenmoji:](self->_noResultsView, "setSupportsGenmoji:", -[STKEmojiAndStickerCollectionViewConfiguration doesSupportGenmoji](self->_configuration, "doesSupportGenmoji"));
  -[UIKeyboardLayoutStar emojiKeyManager](self->_layout, "emojiKeyManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setSearchResults:", v8);
}

- (NSArray)searchResults
{
  void *v2;
  void *v3;
  void *v4;

  -[UIKeyboardLayoutStar emojiKeyManager](self->_layout, "emojiKeyManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "searchResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (STKEmojiAndStickerCollectionViewConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (UIEmojiAndStickerCollectionViewControllerDelegate)delegate
{
  return (UIEmojiAndStickerCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_noResultsView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_screenTraits, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
