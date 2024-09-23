@implementation SBUIActionPlatterViewController

- (SBUIActionPlatterViewController)initWithActions:(id)a3 gestureRecognizer:(id)a4
{
  id v6;
  id v7;
  SBUIActionPlatterViewController *v8;
  uint64_t v9;
  NSArray *actions;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBUIActionPlatterViewController;
  v8 = -[SBUIActionPlatterViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    actions = v8->_actions;
    v8->_actions = (NSArray *)v9;

    objc_storeWeak((id *)&v8->_gestureRecognizer, v7);
    v8->_reversesActions = 0;
    v8->_imagePosition = 0;
    v8->_systemInteractionStartIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (SBUIActionPlatterViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCA98];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("%s is not a valid initializer. You must call -[%@ initWithActions:gestureRecognizer:]."), "-[SBUIActionPlatterViewController initWithNibName:bundle:]", v8);

  return -[SBUIActionPlatterViewController initWithActions:gestureRecognizer:](self, "initWithActions:gestureRecognizer:", 0, 0);
}

- (SBUIActionPlatterViewController)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  objc_class *v7;
  void *v8;
  SBUIActionPlatterViewController *v9;
  objc_super v11;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("%@ does not support unarchiving from a nib."), v8);

  v11.receiver = self;
  v11.super_class = (Class)SBUIActionPlatterViewController;
  v9 = -[SBUIActionPlatterViewController initWithCoder:](&v11, sel_initWithCoder_, v6);

  return v9;
}

- (void)loadView
{
  unint64_t v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  SBUIActionView *v20;
  SBUIActionView *v21;
  void *v22;
  UIStackView *v23;
  UIStackView *stackView;
  UIView *v25;
  UIView *keylinesContainerView;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  UISelectionFeedbackGenerator *v54;
  UISelectionFeedbackGenerator *feedbackRetargetBehavior;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v3 = 0x24BDF6000uLL;
  v4 = objc_alloc(MEMORY[0x24BDF6F90]);
  v5 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v9 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], v6, v7, v8);
  -[SBUIActionPlatterViewController actions](self, "actions");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (-[SBUIActionPlatterViewController reversesActions](self, "reversesActions"))
    {
      objc_msgSend(v10, "reverseObjectEnumerator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allObjects");
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v13;
    }
    v14 = -[SBUIActionPlatterViewController imagePosition](self, "imagePosition");
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v10 = v10;
    v15 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v57 != v17)
            objc_enumerationMutation(v10);
          v19 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
          v20 = [SBUIActionView alloc];
          v21 = -[SBUIActionView initWithAction:](v20, "initWithAction:", v19, (_QWORD)v56);
          -[SBUIActionView setImagePosition:](v21, "setImagePosition:", v14);
          -[SBUIActionView setTranslatesAutoresizingMaskIntoConstraints:](v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          objc_msgSend(v11, "addObject:", v21);

        }
        v16 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      }
      while (v16);
    }

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = 0x24BDF6000;
  }
  else
  {
    v22 = 0;
  }
  v23 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6DD0]), "initWithArrangedSubviews:", v22);
  stackView = self->_stackView;
  self->_stackView = v23;

  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "addSubview:", self->_stackView);
  v25 = (UIView *)objc_msgSend(objc_alloc(*(Class *)(v3 + 3984)), "initWithFrame:", v5, v6, v7, v8);
  keylinesContainerView = self->_keylinesContainerView;
  self->_keylinesContainerView = v25;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_keylinesContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "addSubview:", self->_keylinesContainerView);
  -[SBUIActionPlatterViewController _updateKeylineViews](self, "_updateKeylineViews");
  -[UIStackView leftAnchor](self->_stackView, "leftAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leftAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setActive:", 1);

  -[UIStackView rightAnchor](self->_stackView, "rightAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rightAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setActive:", 1);

  -[UIStackView topAnchor](self->_stackView, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

  -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setActive:", 1);

  -[UIView leftAnchor](self->_keylinesContainerView, "leftAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leftAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setActive:", 1);

  -[UIView rightAnchor](self->_keylinesContainerView, "rightAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rightAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", 1);

  -[UIView topAnchor](self->_keylinesContainerView, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setActive:", 1);

  -[UIView bottomAnchor](self->_keylinesContainerView, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setActive:", 1);

  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel__handleLongPressGestureRecognizer_);
  objc_msgSend(v51, "setDelegate:", self);
  objc_msgSend(v51, "setMinimumPressDuration:", 0.0);
  objc_msgSend(v9, "addGestureRecognizer:", v51);
  v52 = objc_alloc(MEMORY[0x24BDF6D80]);
  objc_msgSend(MEMORY[0x24BDF7148], "defaultConfiguration");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (UISelectionFeedbackGenerator *)objc_msgSend(v52, "initWithConfiguration:coordinateSpace:", v53, v9);
  feedbackRetargetBehavior = self->_feedbackRetargetBehavior;
  self->_feedbackRetargetBehavior = v54;

  -[SBUIActionPlatterViewController setView:](self, "setView:", v9);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBUIActionPlatterViewController;
  -[SBUIActionPlatterViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[SBUIActionPlatterViewController gestureRecognizer](self, "gestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:", self, sel__handleLongPressGestureRecognizer_);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBUIActionPlatterViewController;
  -[SBUIActionPlatterViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[SBUIActionPlatterViewController gestureRecognizer](self, "gestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:action:", self, sel__handleLongPressGestureRecognizer_);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setSystemInteractionStartIndex:(unint64_t)a3
{
  if (self->_systemInteractionStartIndex != a3)
  {
    self->_systemInteractionStartIndex = a3;
    -[SBUIActionPlatterViewController _updateKeylineViews](self, "_updateKeylineViews");
  }
}

- (void)setReversesActions:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_reversesActions != a3)
  {
    self->_reversesActions = a3;
    if (-[SBUIActionPlatterViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0u;
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      objc_msgSend(v4, "reverseObjectEnumerator", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

      -[SBUIActionPlatterViewController _updateKeylineViews](self, "_updateKeylineViews");
    }
  }
}

- (void)setImagePosition:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_imagePosition != a3)
  {
    self->_imagePosition = a3;
    if (-[SBUIActionPlatterViewController isViewLoaded](self, "isViewLoaded"))
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "setImagePosition:", a3);
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

    }
  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v5)
      *(_BYTE *)&self->_delegateRespondsTo &= ~1u;
    v6 = objc_storeWeak((id *)&self->_delegate, obj);

    if (obj)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;

    }
  }

}

- (void)_updateKeylineViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  void *v14;
  SBUIActionKeylineView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[UIView subviews](self->_keylinesContainerView, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v27;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v7++), "removeFromSuperview");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v5);
  }

  -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    v9 = *MEMORY[0x24BDBF090];
    v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v12 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v13 = 1;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SBUIActionKeylineView initWithFrame:]([SBUIActionKeylineView alloc], "initWithFrame:", v9, v10, v11, v12);
      -[SBUIActionKeylineView setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](self->_keylinesContainerView, "addSubview:", v15);
      -[SBUIActionKeylineView leadingAnchor](v15, "leadingAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "leadingAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "leadingContentMargin");
      objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setActive:", 1);

      -[SBUIActionKeylineView trailingAnchor](v15, "trailingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "trailingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setActive:", 1);

      -[SBUIActionKeylineView topAnchor](v15, "topAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "topAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setActive:", 1);

      if (v13 == self->_systemInteractionStartIndex)
        v25 = 3.0;
      else
        v25 = 1.0;
      -[SBUIActionKeylineView setHeight:](v15, "setHeight:", v25);

      ++v13;
    }
    while (v13 < objc_msgSend(v8, "count"));
  }

}

- (void)_handleLongPressGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  id v27;
  UISelectionFeedbackGenerator *feedbackRetargetBehavior;
  void *v29;
  void *v30;
  void (**v31)(void);
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;
  CGPoint v48;
  CGRect v49;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    if ((*(_BYTE *)&self->_delegateRespondsTo & 1) != 0)
    {
      -[SBUIActionPlatterViewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "actionPlatterViewControllerShouldRespondToTouches:", self);

    }
    else
    {
      v6 = 1;
    }
    v8 = objc_msgSend(v4, "state");
    if ((unint64_t)(v8 - 3) < 2)
    {
      if (-[UISelectionFeedbackGenerator isActive](self->_feedbackRetargetBehavior, "isActive"))
        -[UISelectionFeedbackGenerator deactivate](self->_feedbackRetargetBehavior, "deactivate");
    }
    else if ((unint64_t)(v8 - 1) <= 1
           && (-[UISelectionFeedbackGenerator isActive](self->_feedbackRetargetBehavior, "isActive") & 1) == 0)
    {
      -[UISelectionFeedbackGenerator activateWithCompletionBlock:](self->_feedbackRetargetBehavior, "activateWithCompletionBlock:", 0);
    }
    if (v6)
    {
      v42 = 0uLL;
      v43 = 0uLL;
      v40 = 0uLL;
      v41 = 0uLL;
      v9 = v5;
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v41;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v41 != v11)
              objc_enumerationMutation(v9);
            v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v4, "locationInView:", v13);
            v15 = v14;
            v17 = v16;
            objc_msgSend(v13, "bounds");
            v48.x = v15;
            v48.y = v17;
            if (CGRectContainsPoint(v49, v48))
            {
              v10 = v13;
              goto LABEL_30;
            }
          }
          v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
          if (v10)
            continue;
          break;
        }
      }
LABEL_30:

      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v22 = v9;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v37;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v37 != v25)
              objc_enumerationMutation(v22);
            v27 = *(id *)(*((_QWORD *)&v36 + 1) + 8 * j);
            if (objc_msgSend(v4, "state") == 2)
              feedbackRetargetBehavior = self->_feedbackRetargetBehavior;
            else
              feedbackRetargetBehavior = 0;
            objc_msgSend(v27, "setHighlighted:withFeedbackRetargetBehavior:", v27 == v10, feedbackRetargetBehavior);
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        }
        while (v24);
      }

      if (objc_msgSend(v4, "state") == 3)
      {
        objc_msgSend(v10, "action");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29)
        {
          objc_msgSend(v29, "handler");
          v31 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v31[2]();

        }
      }
    }
    else
    {
      v34 = 0uLL;
      v35 = 0uLL;
      v32 = 0uLL;
      v33 = 0uLL;
      v10 = v5;
      v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v33;
        do
        {
          for (k = 0; k != v19; ++k)
          {
            if (*(_QWORD *)v33 != v20)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * k), "setHighlighted:", 0, (_QWORD)v32);
          }
          v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
        }
        while (v19);
      }
    }

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  if ((*(_BYTE *)&self->_delegateRespondsTo & 1) != 0
    && (-[SBUIActionPlatterViewController delegate](self, "delegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "actionPlatterViewControllerShouldRespondToTouches:", self),
        v5,
        !v6))
  {
    v9 = 0;
  }
  else
  {
    -[SBUIActionPlatterViewController gestureRecognizer](self, "gestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = objc_msgSend(v7, "state") == 0;
    else
      v9 = 1;

  }
  return v9;
}

- (NSArray)actions
{
  return self->_actions;
}

- (unint64_t)systemInteractionStartIndex
{
  return self->_systemInteractionStartIndex;
}

- (UILongPressGestureRecognizer)gestureRecognizer
{
  return (UILongPressGestureRecognizer *)objc_loadWeakRetained((id *)&self->_gestureRecognizer);
}

- (BOOL)reversesActions
{
  return self->_reversesActions;
}

- (int64_t)imagePosition
{
  return self->_imagePosition;
}

- (SBUIActionPlatterViewControllerDelegate)delegate
{
  return (SBUIActionPlatterViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_gestureRecognizer);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_feedbackRetargetBehavior, 0);
  objc_storeStrong((id *)&self->_keylinesContainerView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
