@implementation TPPillView

- (TPPillView)initWithTitle:(id)a3 frame:(CGRect)a4
{
  return -[TPPillView initWithTitle:frame:theme:](self, "initWithTitle:frame:theme:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (TPPillView)initWithTitle:(id)a3 frame:(CGRect)a4 theme:(unint64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  TPPillView *v12;
  TPPillView *v13;
  objc_super v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPPillView;
  v12 = -[TPControl initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    v12->_theme = a5;
    -[UILabel setText:](v12->_textLabel, "setText:", v11);
    -[TPPillView updateTheme](v13, "updateTheme");
  }

  return v13;
}

- (void)commonInit
{
  void *v3;
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *gestureRecognizer;
  TPBadgeView *v6;
  TPBadgeView *badgeView;
  UILabel *v8;
  UILabel *textLabel;
  id v10;
  UILabel *v11;
  void *v12;
  UIStackView *v13;
  UIStackView *stackView;
  objc_super v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)TPPillView;
  -[TPControl commonInit](&v15, sel_commonInit);
  -[TPPillView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCornerRadius:", 12.5);

  v4 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_handleTap_);
  gestureRecognizer = self->_gestureRecognizer;
  self->_gestureRecognizer = v4;

  -[TPPillView addGestureRecognizer:](self, "addGestureRecognizer:", self->_gestureRecognizer);
  v6 = -[TPBadgeView initWithTitle:]([TPBadgeView alloc], "initWithTitle:", &stru_1E75FDD38);
  badgeView = self->_badgeView;
  self->_badgeView = v6;

  -[TPBadgeView setSizeCategory:](self->_badgeView, "setSizeCategory:", 1);
  v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  textLabel = self->_textLabel;
  self->_textLabel = v8;

  v10 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v11 = self->_textLabel;
  v16[0] = self->_badgeView;
  v16[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (UIStackView *)objc_msgSend(v10, "initWithArrangedSubviews:", v12);
  stackView = self->_stackView;
  self->_stackView = v13;

  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 3);
  -[UIStackView setAxis:](self->_stackView, "setAxis:", 0);
  -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 3);
  -[UIStackView setLayoutMargins:](self->_stackView, "setLayoutMargins:", 4.0, 13.0, 4.0, 13.0);
  -[UIStackView setLayoutMarginsRelativeArrangement:](self->_stackView, "setLayoutMarginsRelativeArrangement:", 1);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 6.0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TPPillView addSubview:](self, "addSubview:", self->_stackView);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  char v5;
  void *v6;
  uint64_t v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v5 = objc_opt_respondsToSelector();
    -[TPPillView gestureRecognizer](self, "gestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", (v5 & 1) == 0);

    v7 = v5 & 1;
    -[TPPillView setContextMenuEnabled:](self, "setContextMenuEnabled:", v7);
    -[TPPillView setContextMenuIsPrimary:](self, "setContextMenuIsPrimary:", v7);
  }

}

- (void)loadConstraints
{
  void *v3;
  void *v4;
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
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)TPPillView;
  -[TPControl loadConstraints](&v23, sel_loadConstraints);
  -[TPPillView stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leftAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPillView leftAnchor](self, "leftAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setActive:", 1);
  NSStringFromSelector(sel_stackViewLeftAnchorLayoutConstraint);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", v7);

  -[TPPillView setStackViewLeftAnchorLayoutConstraint:](self, "setStackViewLeftAnchorLayoutConstraint:", v6);
  -[TPPillView rightAnchor](self, "rightAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPillView stackView](self, "stackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setActive:", 1);
  NSStringFromSelector(sel_stackViewRightAnchorLayoutConstraint);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIdentifier:", v12);

  -[TPPillView setStackViewRightAnchorLayoutConstraint:](self, "setStackViewRightAnchorLayoutConstraint:", v11);
  -[TPPillView stackView](self, "stackView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPillView topAnchor](self, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setActive:", 1);
  NSStringFromSelector(sel_stackViewTopAnchorLayoutConstraint);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setIdentifier:", v17);

  -[TPPillView setStackViewTopAnchorLayoutConstraint:](self, "setStackViewTopAnchorLayoutConstraint:", v16);
  -[TPPillView stackView](self, "stackView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPillView bottomAnchor](self, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setActive:", 1);
  NSStringFromSelector(sel_stackViewBottomAnchorLayoutConstraint);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setIdentifier:", v22);

  -[TPPillView setStackViewBottomAnchorLayoutConstraint:](self, "setStackViewBottomAnchorLayoutConstraint:", v21);
}

- (void)unloadConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[TPPillView stackViewLeftAnchorLayoutConstraint](self, "stackViewLeftAnchorLayoutConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActive:", 0);

  -[TPPillView setStackViewLeftAnchorLayoutConstraint:](self, "setStackViewLeftAnchorLayoutConstraint:", 0);
  -[TPPillView stackViewRightAnchorLayoutConstraint](self, "stackViewRightAnchorLayoutConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 0);

  -[TPPillView setStackViewRightAnchorLayoutConstraint:](self, "setStackViewRightAnchorLayoutConstraint:", 0);
  -[TPPillView stackViewTopAnchorLayoutConstraint](self, "stackViewTopAnchorLayoutConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 0);

  -[TPPillView setStackViewTopAnchorLayoutConstraint:](self, "setStackViewTopAnchorLayoutConstraint:", 0);
  -[TPPillView stackViewBottomAnchorLayoutConstraint](self, "stackViewBottomAnchorLayoutConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 0);

  -[TPPillView setStackViewBottomAnchorLayoutConstraint:](self, "setStackViewBottomAnchorLayoutConstraint:", 0);
  v7.receiver = self;
  v7.super_class = (Class)TPPillView;
  -[TPControl unloadConstraints](&v7, sel_unloadConstraints);
}

- (void)updateFonts
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPPillView;
  -[TPControl updateFonts](&v5, sel_updateFonts);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPillView textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

}

- (void)updateTheme
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v3 = -[TPPillView theme](self, "theme");
  if (v3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "_tp_greenPillColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPPillView setBackgroundColor:](self, "setBackgroundColor:", v7);

    -[TPPillView badgeView](self, "badgeView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 4;
LABEL_7:
    objc_msgSend(v8, "setTheme:", v10);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "_tp_bluePillColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPPillView setBackgroundColor:](self, "setBackgroundColor:", v11);

    -[TPPillView badgeView](self, "badgeView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 3;
    goto LABEL_7;
  }
  if (v3)
    return;
  objc_msgSend(MEMORY[0x1E0DC3658], "_tp_defaultPillColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPillView setBackgroundColor:](self, "setBackgroundColor:", v4);

  -[TPPillView badgeView](self, "badgeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTheme:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "dynamicLabelColor");
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v13 = (id)v6;
  -[TPPillView textLabel](self, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v13);

}

- (void)handleTap:(id)a3
{
  void *v4;
  char v5;
  id v6;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[TPPillView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[TPPillView delegate](self, "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pillViewWasTapped:", self);

    }
  }
}

- (NSString)badgeText
{
  void *v2;
  void *v3;

  -[TPPillView badgeView](self, "badgeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setBadgeText:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[TPPillView badgeView](self, "badgeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    -[TPPillView badgeView](self, "badgeView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v7);

  }
}

- (void)setTheme:(unint64_t)a3
{
  if (self->_theme != a3)
  {
    self->_theme = a3;
    -[TPPillView updateTheme](self, "updateTheme");
  }
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[TPPillView textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[TPPillView textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v9);

  if ((v6 & 1) == 0)
  {
    -[TPPillView textLabel](self, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v9);

    -[TPPillView textLabel](self, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeToFit");

  }
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__TPPillView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v5[3] = &unk_1E75FD408;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC36B8], "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __68__TPPillView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0
    || (objc_msgSend(*(id *)(a1 + 32), "delegate"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "menuForPillView:", *(_QWORD *)(a1 + 32)),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E75FDD38, MEMORY[0x1E0C9AA60]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (TPPillViewDelegate)delegate
{
  return (TPPillViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)theme
{
  return self->_theme;
}

- (TPBadgeView)badgeView
{
  return self->_badgeView;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UITapGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (NSLayoutConstraint)stackViewBottomAnchorLayoutConstraint
{
  return self->_stackViewBottomAnchorLayoutConstraint;
}

- (void)setStackViewBottomAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewBottomAnchorLayoutConstraint, a3);
}

- (NSLayoutConstraint)stackViewLeftAnchorLayoutConstraint
{
  return self->_stackViewLeftAnchorLayoutConstraint;
}

- (void)setStackViewLeftAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewLeftAnchorLayoutConstraint, a3);
}

- (NSLayoutConstraint)stackViewRightAnchorLayoutConstraint
{
  return self->_stackViewRightAnchorLayoutConstraint;
}

- (void)setStackViewRightAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewRightAnchorLayoutConstraint, a3);
}

- (NSLayoutConstraint)stackViewTopAnchorLayoutConstraint
{
  return self->_stackViewTopAnchorLayoutConstraint;
}

- (void)setStackViewTopAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewTopAnchorLayoutConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackViewTopAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewRightAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewLeftAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewBottomAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
