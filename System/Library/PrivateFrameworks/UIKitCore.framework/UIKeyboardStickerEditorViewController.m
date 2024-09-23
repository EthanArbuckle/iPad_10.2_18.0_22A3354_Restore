@implementation UIKeyboardStickerEditorViewController

- (UIKeyboardStickerEditorViewController)initWithStickerIdentifier:(id)a3 sourceRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  UIKeyboardStickerEditorViewController *v11;
  UIKeyboardStickerEditorViewController *v12;
  objc_super v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIKeyboardStickerEditorViewController;
  v11 = -[UIViewController init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_stickerIdentifier, a3);
    v12->_sourceRect.origin.x = x;
    v12->_sourceRect.origin.y = y;
    v12->_sourceRect.size.width = width;
    v12->_sourceRect.size.height = height;
  }

  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardStickerEditorViewController;
  -[UIViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (void)configureBackdropView
{
  UIKBBackdropView *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  UIKBBackdropView *v15;
  UIKBBackdropView *backdropView;
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
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  v3 = [UIKBBackdropView alloc];
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_inheritedRenderConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[UIKBBackdropView initWithFrame:style:](v3, "initWithFrame:style:", objc_msgSend(v14, "backdropStyle"), v6, v8, v10, v12);
  backdropView = self->_backdropView;
  self->_backdropView = v15;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_backdropView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", self->_backdropView);
  -[UIView topAnchor](self->_backdropView, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v28;
  -[UIView bottomAnchor](self->_backdropView, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v19;
  -[UIView leftAnchor](self->_backdropView, "leftAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leftAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v22;
  -[UIView rightAnchor](self->_backdropView, "rightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v26);
}

- (void)configureVisualEffectView
{
  UIVisualEffectView *v3;
  void *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *visualEffectView;
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
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v3 = [UIVisualEffectView alloc];
  +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1200);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIVisualEffectView initWithEffect:](v3, "initWithEffect:", v4);
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v5;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_visualEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[UIKeyboardEmojiPopoverController visualEffectGroupName](UIKeyboardEmojiPopoverController, "visualEffectGroupName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView _setGroupName:](self->_visualEffectView, "_setGroupName:", v7);

  -[UIVisualEffectView _setCornerRadius:](self->_visualEffectView, "_setCornerRadius:", 13.0);
  -[UIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_visualEffectView);
  -[UIView topAnchor](self->_visualEffectView, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v19;
  -[UIView bottomAnchor](self->_visualEffectView, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v10;
  -[UIView leftAnchor](self->_visualEffectView, "leftAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leftAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v13;
  -[UIView rightAnchor](self->_visualEffectView, "rightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v17);
}

- (void)showInKeyboard
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
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
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
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
  _QWORD v59[5];
  _QWORD v60[6];

  v60[4] = *MEMORY[0x1E0C80C00];
  if (!self->_shown)
  {
    self->_shown = 1;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_rootInputWindowController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomEdgeView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v3, "isEmojiPopoverPresented");
    if (v6)
    {
      objc_msgSend(v3, "emojiPopoverController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "view");
      v8 = objc_claimAutoreleasedReturnValue();

      -[UIKeyboardStickerEditorViewController configureVisualEffectView](self, "configureVisualEffectView");
      v5 = (void *)v8;
    }
    else
    {
      -[UIKeyboardStickerEditorViewController configureBackdropView](self, "configureBackdropView");
    }
    objc_msgSend(v5, "_viewControllerForAncestor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_rootInputWindowController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_27;
    v12 = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
    if (v12)
      objc_msgSend(v10, "_inputView");
    else
      objc_msgSend(v10, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v11;
    v58 = v10;
    v56 = v3;
    if (v6)
    {
      objc_msgSend(v3, "emojiPopoverController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "emojiPopoverController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "topAnchor");
      v18 = objc_claimAutoreleasedReturnValue();

LABEL_24:
      objc_msgSend(v9, "addChildViewController:", self);
      objc_msgSend(v5, "addSubview:", v11);
      objc_msgSend(v11, "topAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)v18;
      objc_msgSend(v53, "constraintEqualToAnchor:", v18);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v52;
      objc_msgSend(v11, "bottomAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bottomAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "constraintEqualToAnchor:", v50);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v60[1] = v49;
      objc_msgSend(v11, "leftAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "leftAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v60[2] = v30;
      objc_msgSend(v11, "rightAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v15;
      objc_msgSend(v15, "rightAnchor");
      v32 = v9;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v33);
      v34 = v5;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v60[3] = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 4);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v34;
      v9 = v32;

      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v36);
      -[UIViewController didMoveToParentViewController:](self, "didMoveToParentViewController:", v32);
      -[UIKeyboardStickerEditorViewController configureEditorViewController](self, "configureEditorViewController");
      -[UIViewController view](self, "view");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setAlpha:", 1.0);

      -[UIView setAlpha:](self->_backdropView, "setAlpha:", 0.0);
      -[UIView setAlpha:](self->_visualEffectView, "setAlpha:", 0.0);
      objc_msgSend(v34, "layoutIfNeeded");
      -[UIViewController view](self, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "window");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[STKRemoteStickerEffectEditorViewController view](self->_editorViewController, "view");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "convertRect:toView:", v40, self->_sourceRect.origin.x, self->_sourceRect.origin.y, self->_sourceRect.size.width, self->_sourceRect.size.height);
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v48 = v47;

      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[STKRemoteStickerEffectEditorViewController showStickerEffectViewWithSourceRect:showing:](self->_editorViewController, "showStickerEffectViewWithSourceRect:showing:", 1, v42, v44, v46, v48);
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __55__UIKeyboardStickerEditorViewController_showInKeyboard__block_invoke;
      v59[3] = &unk_1E16B1B28;
      v59[4] = self;
      +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v59, &__block_literal_global_507, 0.5, 0.0, 1.0, 1.0);

      v3 = v56;
      v11 = v57;
      v10 = v58;
LABEL_27:

      return;
    }
    objc_msgSend(v10, "_inputAccessoryView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v10, "_inputAccessoryView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13;
      goto LABEL_22;
    }
    objc_msgSend(v10, "_inputAssistantView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "superview");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "_showsScribbleIconsInAssistantView");

      v15 = v13;
      if ((v25 & 1) == 0)
      {
        objc_msgSend(v58, "_inputAssistantView");
        v26 = objc_claimAutoreleasedReturnValue();
LABEL_21:
        v20 = (void *)v26;
        v11 = v57;
LABEL_22:
        objc_msgSend(v20, "topAnchor");
        v18 = objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          +[UIKeyboardPopoverContainer contentInsets](UIKeyboardPopoverContainer, "contentInsets");
          +[UIKeyboardPopoverContainer contentInsets](UIKeyboardPopoverContainer, "contentInsets");
          +[UIKeyboardPopoverContainer contentInsets](UIKeyboardPopoverContainer, "contentInsets");
          +[UIKeyboardPopoverContainer contentInsets](UIKeyboardPopoverContainer, "contentInsets");
        }
        goto LABEL_24;
      }
    }
    else
    {

      v15 = v13;
    }
    objc_msgSend(v58, "_inputView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
      objc_msgSend(v58, "_inputView");
    else
      objc_msgSend(v58, "view");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
}

void __55__UIKeyboardStickerEditorViewController_showInKeyboard__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setAlpha:", 1.0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", 0x1E174CC00, *(_QWORD *)(a1 + 32));

}

- (void)configureEditorViewController
{
  void *v3;
  objc_class *v4;
  STKRemoteStickerEffectEditorViewController *v5;
  STKRemoteStickerEffectEditorViewController *editorViewController;
  STKRemoteStickerEffectEditorViewController *v7;
  void *v8;
  int v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t i;
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
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[5];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[3];
  _BYTE v50[128];
  _QWORD v51[4];

  v51[2] = *MEMORY[0x1E0C80C00];
  if (!self->_editorViewController)
  {
    v45 = 0;
    v46 = &v45;
    v47 = 0x2050000000;
    v3 = (void *)_MergedGlobals_3_22;
    v48 = _MergedGlobals_3_22;
    if (!_MergedGlobals_3_22)
    {
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __getSTKRemoteStickerEffectEditorViewControllerClass_block_invoke;
      v44[3] = &unk_1E16B14C0;
      v44[4] = &v45;
      __getSTKRemoteStickerEffectEditorViewControllerClass_block_invoke((uint64_t)v44);
      v3 = (void *)v46[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v45, 8);
    v5 = (STKRemoteStickerEffectEditorViewController *)objc_msgSend([v4 alloc], "initWithStickerIdentifier:", self->_stickerIdentifier);
    editorViewController = self->_editorViewController;
    self->_editorViewController = v5;

    v7 = self->_editorViewController;
    if (v7)
    {
      -[STKRemoteStickerEffectEditorViewController setDelegate:](v7, "setDelegate:", self);
      -[UIViewController addChildViewController:](self, "addChildViewController:", self->_editorViewController);
      -[UIViewController view](self, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[STKRemoteStickerEffectEditorViewController view](self->_editorViewController, "view");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addSubview:", v39);
      objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEmojiPopoverPresented");

      if (v9)
        v10 = 10.0;
      else
        v10 = 0.0;
      if (v9)
        v11 = 15.0;
      else
        v11 = 0.0;
      objc_msgSend(v39, "leftAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "leftAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v14;
      objc_msgSend(v39, "rightAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "rightAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, -v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v51[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "mutableCopy");

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v20 = v19;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
      if (v21)
      {
        v23 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v41 != v23)
              objc_enumerationMutation(v20);
            LODWORD(v22) = 1132068864;
            objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "setPriority:", v22);
          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        }
        while (v21);
      }

      objc_msgSend(v39, "centerXAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "centerXAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintEqualToAnchor:", v36);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v25;
      objc_msgSend(v39, "topAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "topAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, v11);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v49[1] = v28;
      objc_msgSend(v39, "bottomAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "bottomAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, -v11);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v49[2] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObjectsFromArray:", v32);

      objc_msgSend(v39, "widthAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintLessThanOrEqualToConstant:", 430.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v35) = 1144750080;
      objc_msgSend(v34, "setPriority:", v35);
      objc_msgSend(v20, "addObject:", v34);
      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v20);
      -[STKRemoteStickerEffectEditorViewController didMoveToParentViewController:](self->_editorViewController, "didMoveToParentViewController:", self);

    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;

  -[UIViewController traitCollection](self, "traitCollection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceStyle") == 2)
    +[UIKBRenderConfig darkConfig](UIKBRenderConfig, "darkConfig");
  else
    +[UIKBRenderConfig defaultEmojiConfig](UIKBRenderConfig, "defaultEmojiConfig");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[UIKBBackdropView transitionToStyle:](self->_backdropView, "transitionToStyle:", objc_msgSend(v5, "backdropStyle"));
}

- (void)stickerEffectEditorViewControllerControllerDidTapDone
{
  -[UIKeyboardStickerEditorViewController dismissAnimated:](self, "dismissAnimated:", 1);
}

- (void)dismiss
{
  void *v3;

  -[UIViewController willMoveToParentViewController:](self, "willMoveToParentViewController:", 0);
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[UIViewController removeFromParentViewController](self, "removeFromParentViewController");
}

- (void)dismissAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];

  if (self->_shown)
  {
    if (a3)
    {
      -[UIViewController view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[STKRemoteStickerEffectEditorViewController view](self->_editorViewController, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "convertRect:toView:", v6, self->_sourceRect.origin.x, self->_sourceRect.origin.y, self->_sourceRect.size.width, self->_sourceRect.size.height);
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[STKRemoteStickerEffectEditorViewController showStickerEffectViewWithSourceRect:showing:](self->_editorViewController, "showStickerEffectViewWithSourceRect:showing:", 0, v8, v10, v12, v14);
      v16[4] = self;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __57__UIKeyboardStickerEditorViewController_dismissAnimated___block_invoke;
      v17[3] = &unk_1E16B1B28;
      v17[4] = self;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __57__UIKeyboardStickerEditorViewController_dismissAnimated___block_invoke_2;
      v16[3] = &unk_1E16B3FD8;
      +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v17, v16, 0.5, 0.0, 1.0, 1.0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "postNotificationName:object:", 0x1E174CC20, self);

      -[UIKeyboardStickerEditorViewController dismiss](self, "dismiss");
    }
  }
}

void __57__UIKeyboardStickerEditorViewController_dismissAnimated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setAlpha:", 0.0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", 0x1E174CC20, *(_QWORD *)(a1 + 32));

}

uint64_t __57__UIKeyboardStickerEditorViewController_dismissAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismiss");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_editorViewController, 0);
  objc_storeStrong((id *)&self->_stickerIdentifier, 0);
}

@end
