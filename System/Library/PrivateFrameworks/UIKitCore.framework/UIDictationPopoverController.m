@implementation UIDictationPopoverController

- (UIDictationPopoverController)initWithContentView:(id)a3 contentSize:(CGSize)a4 inputDelegate:(id)a5
{
  double height;
  double width;
  id v10;
  id v11;
  UIDictationPopoverController *v12;
  UIDictationPopoverController *v13;
  void *v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSMutableArray *scrollViews;
  uint64_t v27;
  void *v28;
  NSMutableArray *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  UIView *bottomEdgeView;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  uint64_t v40;
  UIView *inputAccessoryView;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v49;
  CGRect v50;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = a5;
  v49.receiver = self;
  v49.super_class = (Class)UIDictationPopoverController;
  v12 = -[UIKeyboardPopoverController init](&v49, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dictationView, a3);
    -[UIViewController setPreferredContentSize:](v13, "setPreferredContentSize:", width, height);
    objc_storeStrong((id *)&v13->_inputDelegate, a5);
    objc_msgSend(v11, "selectedTextRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "start");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "caretRectForPosition:", v15);
    v13->_initCaretRectInView.origin.x = v16;
    v13->_initCaretRectInView.origin.y = v17;
    v13->_initCaretRectInView.size.width = v18;
    v13->_initCaretRectInView.size.height = v19;

    if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      -[UITextInput textInputView](v13->_inputDelegate, "textInputView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "keyboardSceneDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        v23 = v21;
      }
      else
      {
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      v24 = v23;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v25 = objc_claimAutoreleasedReturnValue();
      scrollViews = v13->_scrollViews;
      v13->_scrollViews = (NSMutableArray *)v25;

      objc_msgSend(v11, "textInputView");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v28 = (void *)v27;
        do
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v29 = v13->_scrollViews;
            v30 = v28;
            -[NSMutableArray addObject:](v29, "addObject:", v30);
            objc_msgSend(v30, "_addScrollViewScrollObserver:", v13);

          }
          objc_msgSend(v28, "superview");
          v31 = objc_claimAutoreleasedReturnValue();

          v28 = (void *)v31;
        }
        while (v31);
      }
      objc_msgSend(v24, "containerRootController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "bottomEdgeView");
      v33 = objc_claimAutoreleasedReturnValue();
      bottomEdgeView = v13->_bottomEdgeView;
      v13->_bottomEdgeView = (UIView *)v33;

      objc_msgSend(v24, "containerRootController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "inputViewSet");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView _addGeometryChangeObserver:](&v13->_bottomEdgeView->super.super.isa, v13);
      -[UIView frame](v13->_bottomEdgeView, "frame");
      v13->_bottomMargin = CGRectGetMinY(v50);
      objc_msgSend(v11, "textInputView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "inputAccessoryView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "isDescendantOfView:", v38);

      if ((v39 & 1) != 0)
      {
        objc_msgSend(v36, "inputAccessoryView");
        v40 = objc_claimAutoreleasedReturnValue();
        inputAccessoryView = v13->_inputAccessoryView;
        v13->_inputAccessoryView = (UIView *)v40;

      }
      objc_msgSend(v11, "selectedTextRange");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "selectionRectsForRange:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "firstObject");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v13->_isVerticalText = objc_msgSend(v44, "isVertical");

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addObserver:selector:name:object:", v13, sel_keyboardDidChange_, CFSTR("UIKeyboardDidShowNotification"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addObserver:selector:name:object:", v13, sel_keyboardDidChange_, CFSTR("UIKeyboardDidHideNotification"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObserver:selector:name:object:", v13, sel_textDidChange_, *(_QWORD *)off_1E16791A8, 0);

    }
  }

  return v13;
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *scrollViews;
  void *v9;
  void *v10;
  UITextInput *inputDelegate;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[3];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = self->_scrollViews;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7++), "_removeScrollViewScrollObserver:", self);
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v5);
    }

    scrollViews = self->_scrollViews;
    self->_scrollViews = 0;

    -[UIView _removeGeometryChangeObserver:](&self->_bottomEdgeView->super.super.isa, self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = CFSTR("UIKeyboardDidShowNotification");
    v17[1] = CFSTR("UIKeyboardDidHideNotification");
    v17[2] = *(_QWORD *)off_1E16791A8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNotificationCenter _uiRemoveObserver:names:](v9, self, v10);

  }
  inputDelegate = self->_inputDelegate;
  self->_inputDelegate = 0;

  v12.receiver = self;
  v12.super_class = (Class)UIDictationPopoverController;
  -[UIViewController dealloc](&v12, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *dictationViewTopConstraint;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *dictationViewBottomConstraint;
  NSLayoutConstraint *v18;
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
  objc_super v31;
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)UIDictationPopoverController;
  -[UIKeyboardPopoverController viewDidLoad](&v31, sel_viewDidLoad);
  +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_dictationView);

  -[UIView setNeedsLayout](self->_dictationView, "setNeedsLayout");
  -[UIView topAnchor](self->_dictationView, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v9);
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  dictationViewTopConstraint = self->_dictationViewTopConstraint;
  self->_dictationViewTopConstraint = v10;

  -[UIView bottomAnchor](self->_dictationView, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeAreaLayoutGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v15);
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  dictationViewBottomConstraint = self->_dictationViewBottomConstraint;
  self->_dictationViewBottomConstraint = v16;

  v29 = (void *)MEMORY[0x1E0D156E0];
  v18 = self->_dictationViewBottomConstraint;
  v32[0] = self->_dictationViewTopConstraint;
  v32[1] = v18;
  -[UIView leadingAnchor](self->_dictationView, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeAreaLayoutGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v22;
  -[UIView trailingAnchor](self->_dictationView, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "safeAreaLayoutGuide");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "activateConstraints:", v28);

}

- (void)viewDidAppear:(BOOL)a3
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIDictationPopoverController;
  -[UIViewController viewDidAppear:](&v12, sel_viewDidAppear_, a3);
  -[UIDictationPopoverController forwardRemoteDictationPopover:](self, "forwardRemoteDictationPopover:", 1);
  -[UIDictationPopoverController rectInWindow:](self, "rectInWindow:", self->_initCaretRectInView.origin.x, self->_initCaretRectInView.origin.y, self->_initCaretRectInView.size.width, self->_initCaretRectInView.size.height);
  self->_sourceRect.origin.x = v4;
  self->_sourceRect.origin.y = v5;
  self->_sourceRect.size.width = v6;
  self->_sourceRect.size.height = v7;
  -[UIDictationPopoverController clipBounds](self, "clipBounds");
  self->_clipBounds.origin.x = v8;
  self->_clipBounds.origin.y = v9;
  self->_clipBounds.size.width = v10;
  self->_clipBounds.size.height = v11;
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIDictationPopoverController;
  -[UIViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[UIDictationPopoverController forwardRemoteDictationPopover:](self, "forwardRemoteDictationPopover:", 0);
}

- (void)forwardRemoteDictationPopover:(BOOL)a3
{
  _BOOL8 v3;
  CGRect *p_popoverFrame;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
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
  _QWORD v22[4];
  _QWORD v23[5];

  v3 = a3;
  v23[4] = *MEMORY[0x1E0C80C00];
  p_popoverFrame = &self->_popoverFrame;
  -[UIViewController popoverPresentationController](self, "popoverPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "popoverView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  p_popoverFrame->origin.x = v8;
  p_popoverFrame->origin.y = v9;
  p_popoverFrame->size.width = v10;
  p_popoverFrame->size.height = v11;

  -[UIViewController popoverPresentationController](self, "popoverPresentationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_arrowDirection = objc_msgSend(v12, "arrowDirection");

  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "inputDelegateManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inputSystemSourceSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "textOperations");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setCustomInfoType:", 0x1E1750220);
      v22[0] = CFSTR("selector");
      NSStringFromSelector(sel_setRemoteDictationPopover_);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v17;
      v22[1] = CFSTR("appear");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v18;
      v22[2] = CFSTR("arrowDirection");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_arrowDirection);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[2] = v19;
      v22[3] = CFSTR("popoverFrame");
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", p_popoverFrame->origin.x, p_popoverFrame->origin.y, p_popoverFrame->size.width, p_popoverFrame->size.height);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23[3] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setCustomInfo:", v21);

      objc_msgSend(v15, "flushOperations");
    }

  }
}

- (void)setRemoteDictationPopover:(id)a3
{
  CGRect *p_popoverFrame;
  id v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  int v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;

  p_popoverFrame = &self->_popoverFrame;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("popoverFrame"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGRectValue");
  p_popoverFrame->origin.x = v7;
  p_popoverFrame->origin.y = v8;
  p_popoverFrame->size.width = v9;
  p_popoverFrame->size.height = v10;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arrowDirection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "intValue");
  if (self->_arrowDirection != v12)
  {
    self->_arrowDirection = v12;
    -[UIDictationPopoverController clipBounds](self, "clipBounds");
    self->_clipBounds.origin.x = v13;
    self->_clipBounds.origin.y = v14;
    self->_clipBounds.size.width = v15;
    self->_clipBounds.size.height = v16;
    -[UIDictationPopoverController rectInWindow:](self, "rectInWindow:", self->_initCaretRectInView.origin.x, self->_initCaretRectInView.origin.y, self->_initCaretRectInView.size.width, self->_initCaretRectInView.size.height);
    self->_sourceRect.origin.x = v17;
    self->_sourceRect.origin.y = v18;
    self->_sourceRect.size.width = v19;
    self->_sourceRect.size.height = v20;
  }
}

- (CGRect)clipBounds
{
  unint64_t arrowDirection;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double height;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGRect result;

  arrowDirection = self->_arrowDirection;
  -[UITextInput textInputView](self->_inputDelegate, "textInputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v8, "containerRootController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v8, "containerRootController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "safeAreaInsets");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  height = self->_popoverFrame.size.height;
  if (arrowDirection == 2)
    v30 = self->_popoverFrame.size.height;
  else
    v30 = 0.0;
  if (arrowDirection == 2)
    height = 0.0;
  v31 = v12 + v24;
  v32 = v14 + v22;
  v33 = v16 - (v24 + v28);
  v34 = v31 + 0.0;
  v35 = v32 + v30;
  v36 = v18 - (v22 + v26) - (v30 + height);

  v37 = v34;
  v38 = v35;
  v39 = v33;
  v40 = v36;
  result.size.height = v40;
  result.size.width = v39;
  result.origin.y = v38;
  result.origin.x = v37;
  return result;
}

- (int64_t)overrideUserInterfaceStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_inheritedRenderConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "lightKeyboard"))
      v7 = 1;
    else
      v7 = 2;

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)textDidChange:(id)a3
{
  _QWORD block[5];
  id v5;
  id location;

  if (self->_arrowDirection == 1 && CGRectIsEmpty(self->_editMenuFrame))
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__UIDictationPopoverController_textDidChange___block_invoke;
    block[3] = &unk_1E16B1500;
    objc_copyWeak(&v5, &location);
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __46__UIDictationPopoverController_textDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double MinX;
  double MinY;
  double x;
  double y;
  double width;
  double height;
  double MaxY;
  double v20;
  CGFloat v21;
  uint64_t v22;
  double *v23;
  double v24;
  id WeakRetained;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 976);
  objc_msgSend(v2, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "caretRectForPosition:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  MinX = CGRectGetMinX(*(CGRect *)(*(_QWORD *)(a1 + 32) + 992));
  v26.origin.x = v6;
  v26.origin.y = v8;
  v26.size.width = v10;
  v26.size.height = v12;
  MinY = CGRectGetMinY(v26);
  v24 = MinX;
  objc_msgSend(*(id *)(a1 + 32), "rectInWindow:", MinX, MinY, v10, v12);
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  if (!CGRectIsNull(v27))
  {
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    MaxY = CGRectGetMaxY(v28);
    if (MaxY > CGRectGetMinY(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1184)))
    {
      v29.origin.x = x;
      v29.origin.y = y;
      v29.size.width = width;
      v29.size.height = height;
      v20 = CGRectGetMaxY(v29);
      v21 = CGRectGetHeight(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1184));
      v22 = *(_QWORD *)(a1 + 32);
      if (v20 + v21 < *(double *)(v22 + 1216))
      {
        v23 = (double *)(v22 + 992);
        *v23 = v24;
        v23[1] = MinY;
        v23[2] = v10;
        v23[3] = v12;
        objc_msgSend(WeakRetained, "movePopoverView:", x, y, width, height);
      }
    }
  }

}

- (void)keyboardDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  UIView *v9;
  UIView *bottomEdgeView;
  id v11;
  CGRect v12;

  -[UITextInput textInputView](self->_inputDelegate, "textInputView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v7;

  objc_msgSend(v11, "containerRootController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomEdgeView");
  v9 = (UIView *)objc_claimAutoreleasedReturnValue();

  -[UIView frame](v9, "frame");
  self->_bottomMargin = CGRectGetMinY(v12);
  bottomEdgeView = self->_bottomEdgeView;
  if (v9 != bottomEdgeView)
  {
    -[UIView _removeGeometryChangeObserver:](bottomEdgeView, self);
    objc_storeStrong((id *)&self->_bottomEdgeView, v9);
    -[UIView _addGeometryChangeObserver:](&self->_bottomEdgeView->super.super.isa, self);
  }
  -[UIDictationPopoverController _observeScrollViewDidScroll:](self, "_observeScrollViewDidScroll:", 0);

}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  id v6;
  double Width;
  void *v8;
  double v9;
  double MaxY;
  double bottomMargin;
  double v12;
  double MinX;
  double v14;
  double v15;
  id v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v6 = a4;
  if ((a3->var0 & 2) != 0)
  {
    v16 = v6;
    objc_msgSend(v6, "frame");
    Width = CGRectGetWidth(v17);
    objc_msgSend(v16, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v9 = vabdd_f64(Width, CGRectGetWidth(v18));

    v6 = v16;
    if (v9 < 1.0)
    {
      objc_msgSend(v16, "frame");
      self->_bottomMargin = CGRectGetMinY(v19);
      MaxY = CGRectGetMaxY(self->_popoverFrame);
      bottomMargin = self->_bottomMargin;
      -[UIView frame](self->_inputAccessoryView, "frame");
      if (MaxY > bottomMargin + v12)
      {
        MinX = CGRectGetMinX(self->_sourceRect);
        -[UIDictationPopoverController movePopoverView:](self, "movePopoverView:", MinX, self->_bottomMargin - CGRectGetHeight(self->_sourceRect), v14, v15);
      }
      -[UIDictationPopoverController _observeScrollViewDidScroll:](self, "_observeScrollViewDidScroll:", 0);
      v6 = v16;
    }
  }

}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 IsEmpty;
  char isKindOfClass;
  UITextInput *inputDelegate;
  UITextInput *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  _BOOL4 isVerticalText;
  double MinX;
  double v28;
  double MinY;
  double v30;
  double v31;
  double MaxY;
  double bottomMargin;
  double v34;
  CGFloat height;
  id v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v4 = a3;
  v5 = v4;
  if (self->_arrowDirection != 1)
  {
    v37 = v4;
    IsEmpty = CGRectIsEmpty(self->_editMenuFrame);
    v5 = v37;
    if (IsEmpty)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      inputDelegate = self->_inputDelegate;
      if ((isKindOfClass & 1) != 0)
      {
        v9 = inputDelegate;
      }
      else
      {
        -[UITextInput textInputView](inputDelegate, "textInputView");
        v9 = (UITextInput *)objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;
      if (v9)
      {
        do
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          objc_msgSend(v10, "size");
          v12 = v11;
          objc_msgSend(v10, "contentSize");
          if (v12 < v13)
            break;
          objc_msgSend(v10, "superview");
          v14 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v14;
        }
        while (v14);
      }
      objc_msgSend(v10, "bounds");
      objc_msgSend(v10, "convertRect:toView:", 0);
      v46.origin.x = v15;
      v46.origin.y = v16;
      v46.size.width = v17;
      v46.size.height = v18;
      v38 = CGRectIntersection(self->_clipBounds, v46);
      x = v38.origin.x;
      y = v38.origin.y;
      width = v38.size.width;
      height = v38.size.height;
      -[UIDictationPopoverController rectInWindow:](self, "rectInWindow:", self->_initCaretRectInView.origin.x, self->_initCaretRectInView.origin.y, self->_initCaretRectInView.size.width, self->_initCaretRectInView.size.height);
      v22 = v39.origin.x;
      v23 = v39.origin.y;
      v24 = v39.size.width;
      v25 = v39.size.height;
      isVerticalText = self->_isVerticalText;
      MinX = CGRectGetMinX(v39);
      if (isVerticalText)
      {
        v40.origin.x = x;
        v40.origin.y = y;
        v40.size.width = width;
        v40.size.height = height;
        v28 = fmax(MinX, CGRectGetMinX(v40));
        v41.origin.x = x;
        v41.origin.y = y;
        v41.size.width = width;
        v41.size.height = height;
        MinX = fmin(v28, CGRectGetMaxX(v41));
        v42.origin.x = v22;
        v42.origin.y = v23;
        v42.size.width = v24;
        v42.size.height = v25;
        MinY = CGRectGetMinY(v42);
      }
      else
      {
        v43.origin.x = v22;
        v43.origin.y = v23;
        v43.size.width = v24;
        v43.size.height = v25;
        v30 = CGRectGetMinY(v43);
        v44.origin.x = x;
        v44.origin.y = y;
        v44.size.width = width;
        v44.size.height = height;
        v31 = fmax(v30, CGRectGetMinY(v44));
        v45.origin.x = x;
        v45.origin.y = y;
        v45.size.width = width;
        v45.size.height = height;
        MaxY = CGRectGetMaxY(v45);
        bottomMargin = self->_bottomMargin;
        -[UIView frame](self->_inputAccessoryView, "frame");
        MinY = fmin(v31, fmin(MaxY, bottomMargin + v34));
      }
      if (MinX != self->_sourceRect.origin.x || MinY != self->_sourceRect.origin.y)
        -[UIDictationPopoverController movePopoverView:](self, "movePopoverView:", MinX, MinY, self->_sourceRect.size.width, self->_sourceRect.size.height);

      v5 = v37;
    }
  }

}

- (void)movePopoverView:(CGRect)a3
{
  -[UIDictationPopoverController movePopoverView:editMenuFrame:](self, "movePopoverView:editMenuFrame:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)movePopoverView:(CGRect)a3 editMenuFrame:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void **v13;
  const __CFString **v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22[2] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  self->_sourceRect.origin.x = x;
  self->_sourceRect.origin.y = y;
  self->_sourceRect.size.width = width;
  self->_sourceRect.size.height = height;
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v21[0] = CFSTR("sourceRect");
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", x, y, width, height);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = CFSTR("editMenuFrame");
      v22[0] = v11;
      v22[1] = v9;
      v12 = (void *)MEMORY[0x1E0C99D80];
      v13 = (void **)v22;
      v14 = (const __CFString **)v21;
      v15 = 2;
    }
    else
    {
      v19 = CFSTR("sourceRect");
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", x, y, width, height);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v11;
      v12 = (void *)MEMORY[0x1E0C99D80];
      v13 = &v20;
      v14 = &v19;
      v15 = 1;
    }
    objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "forwardDictationEvent_movePopoverView:", v18);

  }
  else
  {
    -[UIViewController popoverPresentationController](self, "popoverPresentationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_sendDelegateWillRepositionToRect");

    -[UIViewController popoverPresentationController](self, "popoverPresentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController preferredContentSize](self, "preferredContentSize");
    objc_msgSend(v17, "setPopoverContentSize:");

    -[UIDictationPopoverController forwardRemoteDictationPopover:](self, "forwardRemoteDictationPopover:", 1);
  }

}

- (void)movePopoverViewToCurrentCareLocation
{
  CGRect *p_initCaretRectInView;
  UITextInput *inputDelegate;
  void *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  p_initCaretRectInView = &self->_initCaretRectInView;
  inputDelegate = self->_inputDelegate;
  -[UITextInput selectedTextRange](inputDelegate, "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInput caretRectForPosition:](inputDelegate, "caretRectForPosition:", v6);
  p_initCaretRectInView->origin.x = v7;
  p_initCaretRectInView->origin.y = v8;
  p_initCaretRectInView->size.width = v9;
  p_initCaretRectInView->size.height = v10;

  -[UIDictationPopoverController rectInWindow:](self, "rectInWindow:", p_initCaretRectInView->origin.x, p_initCaretRectInView->origin.y, p_initCaretRectInView->size.width, p_initCaretRectInView->size.height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", self->_editMenuFrame.origin.x, self->_editMenuFrame.origin.y, self->_editMenuFrame.size.width, self->_editMenuFrame.size.height);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[UIDictationPopoverController movePopoverView:editMenuFrame:](self, "movePopoverView:editMenuFrame:", v19, v12, v14, v16, v18);

}

- (void)movePopoverViewForEditMenuFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CGRect *p_popoverFrame;
  CGRect *p_editMenuFrame;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double MaxY;
  double MinY;
  void *v22;
  void *v23;
  CGSize v24;
  double MinX;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  CGPoint v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIViewController popoverPresentationController](self, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "popoverView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "arrowDirection");

  -[UIViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    if (CGRectIsEmpty(v36) || self->_needsRestoreArrowDirction)
      goto LABEL_24;
    p_popoverFrame = &self->_popoverFrame;
    p_editMenuFrame = &self->_editMenuFrame;
    v15 = v10 == 1 ? -self->_editMenuFrame.size.height : self->_editMenuFrame.size.height;
    v37.origin.x = p_popoverFrame->origin.x;
    v37.origin.y = self->_popoverFrame.origin.y;
    v37.size.width = self->_popoverFrame.size.width;
    v37.size.height = self->_popoverFrame.size.height;
    v41 = CGRectOffset(v37, 0.0, v15);
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    if (!CGRectIntersectsRect(v38, v41))
    {
LABEL_24:
      if (!CGRectIsEmpty(self->_editMenuFrame))
      {
        v39.origin.x = x;
        v39.origin.y = y;
        v39.size.width = width;
        v39.size.height = height;
        if (CGRectIsEmpty(v39))
        {
          if (self->_needsRestoreArrowDirction)
          {
            -[UIViewController popoverPresentationController](self, "popoverPresentationController");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "popoverView");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setArrowDirection:", 2);

            -[UIViewController _updateContentOverlayInsetsFromParentIfNecessary](self, "_updateContentOverlayInsetsFromParentIfNecessary");
            self->_needsRestoreArrowDirction = 0;
          }
          v24 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
          self->_editMenuFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
          self->_editMenuFrame.size = v24;
          -[UIDictationPopoverController rectInWindow:](self, "rectInWindow:", self->_initCaretRectInView.origin.x, self->_initCaretRectInView.origin.y, self->_initCaretRectInView.size.width, self->_initCaretRectInView.size.height);
          -[UIDictationPopoverController movePopoverView:](self, "movePopoverView:");
        }
      }
    }
    else
    {
      v16 = x;
      v17 = y;
      v18 = width;
      v19 = height;
      if (v10 == 1)
      {
        MaxY = CGRectGetMaxY(*(CGRect *)&v16);
        MinY = MaxY + CGRectGetHeight(self->_sourceRect);
      }
      else
      {
        MinY = CGRectGetMinY(*(CGRect *)&v16);
      }
      MinX = CGRectGetMinX(self->_sourceRect);
      v26 = CGRectGetWidth(self->_sourceRect);
      v27 = CGRectGetHeight(self->_sourceRect);
      v35.x = MinX;
      v35.y = MinY;
      if (CGRectContainsPoint(self->_clipBounds, v35))
      {
        -[UIDictationPopoverController movePopoverView:](self, "movePopoverView:", MinX, MinY, v26, v27);
      }
      else
      {
        -[UIViewController popoverPresentationController](self, "popoverPresentationController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "popoverView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setArrowDirection:", 1);

        -[UIViewController _updateContentOverlayInsetsFromParentIfNecessary](self, "_updateContentOverlayInsetsFromParentIfNecessary");
        self->_needsRestoreArrowDirction = 1;
        v40.origin.x = p_popoverFrame->origin.x;
        v40.origin.y = self->_popoverFrame.origin.y;
        v40.size.width = self->_popoverFrame.size.width;
        v40.size.height = self->_popoverFrame.size.height;
        v30 = CGRectGetMinX(v40);
        v31 = CGRectGetMaxY(self->_sourceRect);
        v32 = self->_popoverFrame.size.width;
        v33 = self->_popoverFrame.size.height;
        -[UIViewController popoverPresentationController](self, "popoverPresentationController");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setPopoverFrame:animated:", 1, v30, v31, v32, v33);

      }
      p_editMenuFrame->origin.x = x;
      p_editMenuFrame->origin.y = y;
      p_editMenuFrame->size.width = width;
      p_editMenuFrame->size.height = height;
    }
  }
  else
  {
    self->_editMenuFrame.origin.x = x;
    self->_editMenuFrame.origin.y = y;
    self->_editMenuFrame.size.width = width;
    self->_editMenuFrame.size.height = height;
  }
}

- (CGRect)rectInWindow:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UITextInput textInputView](self->_inputDelegate, "textInputView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyboardSceneDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[UITextInput textInputView](self->_inputDelegate, "textInputView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "keyboardSceneDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "containerWindow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "containerWindow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[UITextInput textInputView](self->_inputDelegate, "textInputView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertRect:fromView:", v13, x, y, width, height);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[UIViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "window");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[UIViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "window");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertRect:toView:", v25, v15, v17, v19, v21);
    v15 = v26;
    v17 = v27;
    v19 = v28;
    v21 = v29;

  }
  v30 = v15;
  v31 = v17;
  v32 = v19;
  v33 = v21;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)canPresentTip
{
  void *v3;
  void *v4;
  void *v5;
  CGRect *p_popoverFrame;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v11;
  void *v12;
  uint64_t v13;
  CGFloat v14;
  CGFloat v15;
  BOOL v16;
  void *v17;
  void *v18;
  uint64_t v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "containerWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIViewController popoverPresentationController](self, "popoverPresentationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "popoverView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  p_popoverFrame = &self->_popoverFrame;
  if (self->_isVerticalText)
  {
    x = p_popoverFrame->origin.x;
    y = self->_popoverFrame.origin.y;
    width = self->_popoverFrame.size.width;
    height = self->_popoverFrame.size.height;
  }
  else
  {
    v21.origin.x = p_popoverFrame->origin.x;
    v21.origin.y = self->_popoverFrame.origin.y;
    v21.size.width = self->_popoverFrame.size.width;
    v21.size.height = self->_popoverFrame.size.height;
    v22 = CGRectOffset(v21, 0.0, self->_sourceRect.origin.y);
    x = v22.origin.x;
    y = v22.origin.y;
    width = v22.size.width;
    height = v22.size.height;
  }
  -[UIViewController popoverPresentationController](self, "popoverPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "popoverView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "arrowDirection");

  if (v13 == 2)
  {
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    v14 = CGRectGetMinY(v23) + -135.5;
    objc_msgSend(v4, "safeAreaInsets");
    v16 = v14 >= v15;
  }
  else
  {
    -[UIViewController popoverPresentationController](self, "popoverPresentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "popoverView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "arrowDirection");

    if (v19 == 1)
    {
      v24.origin.x = x;
      v24.origin.y = y;
      v24.size.width = width;
      v24.size.height = height;
      v16 = CGRectGetMaxY(v24) + 135.5 < self->_bottomMargin;
    }
    else
    {
      v16 = 1;
    }
  }

  return v16;
}

- (void)presentTip:(id)a3 tipDescription:(id)a4
{
  id v6;
  id v7;
  void *v8;
  UILabel *title;
  UILabel *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UILabel *v15;
  UILabel *v16;
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
  UITextView *v27;
  UITextView *textView;
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
  UIView *v41;
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
  UIView *v57;
  void *v58;
  void *v59;
  void *v60;
  CGFloat v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  uint64_t v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _QWORD *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  id v107;
  void *v108;
  void *v109;
  UIView *v110;
  void *v111;
  void *v112;
  void *v113;
  _QWORD v114[4];
  _QWORD v115[4];
  _QWORD v116[3];
  _QWORD v117[3];
  _QWORD v118[5];
  CGRect v119;

  v118[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    title = self->_title;
    if (title)
    {
LABEL_12:
      -[UILabel setText:](title, "setText:", v6);
      -[UITextView setText:](self->_textView, "setText:", v7);

      -[UIViewController popoverPresentationController](self, "popoverPresentationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController preferredContentSize](self, "preferredContentSize");
      v85 = v84;
      -[UIViewController preferredContentSize](self, "preferredContentSize");
      objc_msgSend(v8, "setPopoverContentSize:", v85, v86 + 135.5);
      goto LABEL_13;
    }
    v106 = v7;
    v107 = v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [UILabel alloc];
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v15 = -[UILabel initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], v12, v13, v14);
    v16 = self->_title;
    self->_title = v15;

    objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 15.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_title, "setFont:", v17);

    -[UILabel setTextAlignment:](self->_title, "setTextAlignment:", 1);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_title, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "insertSubview:below:", self->_title, self->_dictationView);

    -[UIView heightAnchor](self->_title, "heightAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "constraintEqualToConstant:", 20.0);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v118[0] = v108;
    -[UIView leadingAnchor](self->_title, "leadingAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "safeAreaLayoutGuide");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v118[1] = v20;
    -[UIView trailingAnchor](self->_title, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "safeAreaLayoutGuide");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v118[2] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "addObjectsFromArray:", v26);

    v27 = -[UITextView initWithFrame:textContainer:]([UITextView alloc], "initWithFrame:textContainer:", 0, v11, v12, v13, v14);
    textView = self->_textView;
    self->_textView = v27;

    -[UITextView setEditable:](self->_textView, "setEditable:", 0);
    -[UITextView setSelectable:](self->_textView, "setSelectable:", 0);
    objc_msgSend(off_1E167A828, "systemFontOfSize:", 14.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](self->_textView, "setFont:", v29);

    +[UIColor lightGrayColor](UIColor, "lightGrayColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](self->_textView, "setTextColor:", v30);

    -[UITextView setTextAlignment:](self->_textView, "setTextAlignment:", 1);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIViewController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "insertSubview:below:", self->_textView, self->_dictationView);

    -[UIView topAnchor](self->_textView, "topAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_title, "bottomAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "constraintEqualToAnchor:", v101);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v117[0] = v97;
    -[UIView leadingAnchor](self->_textView, "leadingAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "safeAreaLayoutGuide");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:constant:", v33, 8.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v117[1] = v34;
    -[UIView trailingAnchor](self->_textView, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "safeAreaLayoutGuide");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v38, -8.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v117[2] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "addObjectsFromArray:", v40);

    v41 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v11, v12, v13, v14);
    +[UIColor lightGrayColor](UIColor, "lightGrayColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v41, "setBackgroundColor:", v42);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIViewController view](self, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "insertSubview:below:", v41, self->_dictationView);

    -[UIView heightAnchor](v41, "heightAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "constraintEqualToConstant:", 0.5);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v116[0] = v98;
    -[UIView leadingAnchor](v41, "leadingAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "safeAreaLayoutGuide");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v116[1] = v46;
    v110 = v41;
    -[UIView trailingAnchor](v41, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "safeAreaLayoutGuide");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v116[2] = v51;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 3);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "addObjectsFromArray:", v52);

    -[UIViewController view](self, "view");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "backgroundColor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_dictationView, "setBackgroundColor:", v54);

    -[UIViewController popoverPresentationController](self, "popoverPresentationController");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "popoverView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v56, "arrowDirection") == 2)
    {

      v57 = v110;
LABEL_10:
      -[NSLayoutConstraint setActive:](self->_dictationViewTopConstraint, "setActive:", 0);
      -[UIView topAnchor](self->_dictationView, "topAnchor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](v57, "bottomAnchor");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = v79;
      objc_msgSend(v79, "constraintEqualToAnchor:", v99);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v115[0] = v95;
      -[UIView topAnchor](self->_dictationView, "topAnchor");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self, "view");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "safeAreaLayoutGuide");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "bottomAnchor");
      v81 = objc_claimAutoreleasedReturnValue();
      -[UIViewController preferredContentSize](self, "preferredContentSize");
      v112 = v80;
      v88 = (void *)v81;
      objc_msgSend(v80, "constraintEqualToAnchor:constant:", v81, -v82);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v115[1] = v87;
      -[UIView bottomAnchor](self->_textView, "bottomAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](v57, "bottomAnchor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "constraintEqualToAnchor:", v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v115[2] = v73;
      -[UIView topAnchor](self->_title, "topAnchor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self, "view");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "topAnchor");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "constraintEqualToAnchor:constant:", v76, 15.0);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v115[3] = v77;
      v78 = v115;
      goto LABEL_11;
    }
    -[UIViewController popoverPresentationController](self, "popoverPresentationController");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "popoverView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v59, "arrowDirection") == 1)
    {

      v57 = v110;
    }
    else
    {
      -[UIViewController popoverPresentationController](self, "popoverPresentationController");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "popoverView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "frame");
      v61 = CGRectGetMinY(v119) + -135.5;
      -[UIViewController popoverPresentationController](self, "popoverPresentationController");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "popoverView");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "superview");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "safeAreaInsets");
      v66 = v65;

      v57 = v110;
      if (v61 >= v66)
        goto LABEL_10;
    }
    -[NSLayoutConstraint setActive:](self->_dictationViewBottomConstraint, "setActive:", 0);
    -[UIView bottomAnchor](self->_dictationView, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v57, "topAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v67;
    objc_msgSend(v67, "constraintEqualToAnchor:", v99);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v114[0] = v95;
    -[UIView bottomAnchor](self->_dictationView, "bottomAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "safeAreaLayoutGuide");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "topAnchor");
    v69 = objc_claimAutoreleasedReturnValue();
    -[UIViewController preferredContentSize](self, "preferredContentSize");
    v112 = v68;
    v88 = (void *)v69;
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v69, v70);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v114[1] = v87;
    -[UIView bottomAnchor](self->_textView, "bottomAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "bottomAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v114[2] = v74;
    -[UIView topAnchor](self->_title, "topAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v57, "bottomAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:constant:", v76, 15.0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v114[3] = v77;
    v78 = v114;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 4);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "addObjectsFromArray:", v83);

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v113);
    title = self->_title;
    v7 = v106;
    v6 = v107;
    goto LABEL_12;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "forwardDictationEvent_handleTip:title:", v6, v7);

LABEL_13:
}

- (void)dismissTip
{
  id v3;

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "forwardDictationEvent_handleTip:title:", 0, 0);
  }
  else
  {
    -[UIViewController popoverPresentationController](self, "popoverPresentationController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UIViewController preferredContentSize](self, "preferredContentSize");
    objc_msgSend(v3, "setPopoverContentSize:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomEdgeView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_dictationViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_dictationViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_dictationView, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_scrollViews, 0);
  objc_storeStrong((id *)&self->_inputDelegate, 0);
}

@end
