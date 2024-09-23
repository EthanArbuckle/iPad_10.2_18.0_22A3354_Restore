@implementation PRXCardContentView

- (PRXCardContentView)init
{
  return -[PRXCardContentView initWithCardStyle:](self, "initWithCardStyle:", 0);
}

- (PRXCardContentView)initWithCardStyle:(int64_t)a3
{
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v10 = PRXCardPreferredSizeClassForContainerBounds(v6, v7, v8, v9);

  v11 = *MEMORY[0x24BDBF090];
  v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v13 = PRXCardPreferredSize(0, v10);
  return -[PRXCardContentView initWithFrame:cardStyle:](self, "initWithFrame:cardStyle:", a3, v11, v12, v13, v14);
}

- (PRXCardContentView)initWithFrame:(CGRect)a3 cardStyle:(int64_t)a4
{
  PRXCardContentView *v5;
  UILayoutGuide *v6;
  UILayoutGuide *mainContentGuide;
  UILayoutGuide *v8;
  UILayoutGuide *internalContentGuide;
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
  PRXCardContentView *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int64_t v28;
  objc_super v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)PRXCardContentView;
  v5 = -[PRXCardContentView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BDF6B78]);
    v28 = a4;
    mainContentGuide = v5->_mainContentGuide;
    v5->_mainContentGuide = v6;

    -[UILayoutGuide setIdentifier:](v5->_mainContentGuide, "setIdentifier:", CFSTR("PRXCardMainContent"));
    -[PRXCardContentView addLayoutGuide:](v5, "addLayoutGuide:", v5->_mainContentGuide);
    v8 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BDF6B78]);
    internalContentGuide = v5->_internalContentGuide;
    v5->_internalContentGuide = v8;

    -[UILayoutGuide setIdentifier:](v5->_internalContentGuide, "setIdentifier:", CFSTR("PRXCardInternalContent"));
    -[PRXCardContentView addLayoutGuide:](v5, "addLayoutGuide:", v5->_internalContentGuide);
    -[PRXCardContentView layoutMarginsGuide](v5, "layoutMarginsGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BDD1628];
    -[UILayoutGuide leadingAnchor](v5->_mainContentGuide, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v25;
    -[UILayoutGuide trailingAnchor](v5->_mainContentGuide, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v11;
    -[UILayoutGuide leadingAnchor](v5->_internalContentGuide, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v14;
    -[UILayoutGuide trailingAnchor](v5->_internalContentGuide, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v18);

    v5->_cardStyle = v28;
    -[PRXCardContentView setDirectionalLayoutMargins:](v5, "setDirectionalLayoutMargins:", *MEMORY[0x24BDF65E8], *(double *)(MEMORY[0x24BDF65E8] + 8), *(double *)(MEMORY[0x24BDF65E8] + 16), *(double *)(MEMORY[0x24BDF65E8] + 24));
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentView setBackgroundColor:](v5, "setBackgroundColor:", v19);

    v20 = v5;
  }

  return v5;
}

- (PRXCardContentView)initWithFrame:(CGRect)a3
{
  return -[PRXCardContentView initWithFrame:cardStyle:](self, "initWithFrame:cardStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double *v8;
  double *v9;
  double v10;
  double *v11;
  double v12;
  double *v13;
  double v14;
  NSArray *titleViewConstraints;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PRXCardContentView;
  v4 = a3;
  -[PRXCardContentView traitCollectionDidChange:](&v20, sel_traitCollectionDidChange_, v4);
  -[PRXCardContentView traitCollection](self, "traitCollection", v20.receiver, v20.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "prx_cardSizeClass");

  v7 = objc_msgSend(v4, "prx_cardSizeClass");
  if (v6 != v7)
  {
    v8 = (double *)&PRXCardCompactLayoutMargins;
    v9 = (double *)&unk_211637788;
    if (v6 != 1)
      v9 = (double *)&unk_211637768;
    v10 = *v9;
    v11 = (double *)&unk_211637780;
    if (v6 != 1)
      v11 = (double *)&unk_211637760;
    v12 = *v11;
    v13 = (double *)&unk_211637778;
    if (v6 != 1)
    {
      v13 = (double *)&unk_211637758;
      v8 = (double *)&PRXCardDefaultLayoutMargins;
    }
    -[PRXCardContentView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", *v8, *v13, v12, v10);
    -[PRXCardContentView bounds](self, "bounds");
    -[PRXCardContentView updateTitleTextViewExclusionPathsForCardWidth:](self, "updateTitleTextViewExclusionPathsForCardWidth:", v14);
    -[PRXCardContentView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
  if (self->_titleViewConstraints)
  {
    objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:");
    titleViewConstraints = self->_titleViewConstraints;
    self->_titleViewConstraints = 0;

    -[PRXCardContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
  -[PRXCardContentView traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "customBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[PRXCardContentView traitCollection](self, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "customBackgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentView setBackgroundColor:](self, "setBackgroundColor:", v19);

  }
}

- (void)updateConstraints
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *titleViewHeightConstraint;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  NSArray *v22;
  NSArray *titleViewConstraints;
  PRXLabel *subtitleLabel;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSArray *v32;
  PRXTextContainer *titleView;
  void *v34;
  void *v35;
  void *v36;
  NSArray *subtitleLabelConstraints;
  NSArray *v38;
  double v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSArray *v50;
  NSArray *mainContentConstraints;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  objc_super v59;
  _QWORD v60[3];
  _QWORD v61[2];
  _QWORD v62[5];

  v62[4] = *MEMORY[0x24BDAC8D0];
  v59.receiver = self;
  v59.super_class = (Class)PRXCardContentView;
  -[PRXCardContentView updateConstraints](&v59, sel_updateConstraints);
  -[PRXCardContentView layoutMarginsGuide](self, "layoutMarginsGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_titleViewConstraints && self->_titleView)
  {
    -[PRXCardContentView frame](self, "frame");
    v5 = v4;
    -[PRXCardContentView layoutMargins](self, "layoutMargins");
    v7 = v6;
    -[PRXCardContentView layoutMargins](self, "layoutMargins");
    -[PRXTextContainer sizeThatFits:](self->_titleView, "sizeThatFits:", v5 - (v7 + v8), 1.79769313e308);
    v10 = v9;
    -[PRXTextContainer heightAnchor](self->_titleView, "heightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToConstant:", v10);
    v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    titleViewHeightConstraint = self->_titleViewHeightConstraint;
    self->_titleViewHeightConstraint = v12;

    -[PRXTextContainer leadingAnchor](self->_titleView, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v52;
    -[PRXTextContainer trailingAnchor](self->_titleView, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v16;
    -[PRXTextContainer topAnchor](self->_titleView, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topAnchor");
    v18 = v3;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = self->_titleViewHeightConstraint;
    v62[2] = v20;
    v62[3] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 4);
    v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
    titleViewConstraints = self->_titleViewConstraints;
    self->_titleViewConstraints = v22;

    v3 = v18;
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_titleViewConstraints);
  }
  if (!self->_subtitleLabelConstraints)
  {
    subtitleLabel = self->_subtitleLabel;
    if (subtitleLabel)
    {
      v25 = (void *)MEMORY[0x24BDBCEB8];
      -[PRXLabel leadingAnchor](subtitleLabel, "leadingAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "leadingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "constraintEqualToAnchor:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v27;
      -[PRXLabel trailingAnchor](self->_subtitleLabel, "trailingAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "trailingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v61[1] = v30;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 2);
      v57 = v3;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "arrayWithArray:", v31);
      v32 = (NSArray *)objc_claimAutoreleasedReturnValue();

      titleView = self->_titleView;
      -[PRXLabel topAnchor](self->_subtitleLabel, "topAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (titleView)
      {
        -[PRXTextContainer bottomAnchor](self->_titleView, "bottomAnchor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, 4.0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = v57;
      }
      else
      {
        v3 = v57;
        objc_msgSend(v57, "topAnchor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "constraintEqualToAnchor:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[NSArray addObject:](v32, "addObject:", v36);

      subtitleLabelConstraints = self->_subtitleLabelConstraints;
      self->_subtitleLabelConstraints = v32;
      v38 = v32;

      objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_subtitleLabelConstraints);
    }
  }
  if (!self->_mainContentConstraints)
  {
    v39 = 20.0;
    v40 = self->_subtitleLabel;
    if (v40 || (v40 = self->_titleView) != 0)
    {
      objc_msgSend(v40, "bottomAnchor");
      v41 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "topAnchor");
      v41 = objc_claimAutoreleasedReturnValue();
      v39 = 0.0;
    }
    v55 = (void *)v41;
    -[UILayoutGuide topAnchor](self->_mainContentGuide, "topAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:constant:", v41, v39);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v42;
    -[UILayoutGuide topAnchor](self->_internalContentGuide, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self->_mainContentGuide, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v45;
    -[UILayoutGuide bottomAnchor](self->_internalContentGuide, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bottomAnchor");
    v47 = v3;
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v60[2] = v49;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 3);
    v50 = (NSArray *)objc_claimAutoreleasedReturnValue();
    mainContentConstraints = self->_mainContentConstraints;
    self->_mainContentConstraints = v50;

    v3 = v47;
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_mainContentConstraints);

  }
}

- (PRXButton)dismissButton
{
  void *v2;
  void *v3;

  -[PRXCardContentView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PRXButton *)v3;
}

- (void)setDismissButton:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PRXCardContentView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDismissButton:", v4);

}

- (void)setTitleView:(id)a3
{
  PRXTextContainer *v5;
  PRXTextContainer **p_titleView;
  NSArray *titleViewConstraints;
  PRXTextContainer *v8;

  v5 = (PRXTextContainer *)a3;
  p_titleView = &self->_titleView;
  if (self->_titleView != v5)
  {
    v8 = v5;
    titleViewConstraints = self->_titleViewConstraints;
    self->_titleViewConstraints = 0;

    -[PRXTextContainer removeFromSuperview](*p_titleView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_titleView, a3);
    if (*p_titleView)
    {
      -[PRXTextContainer setTranslatesAutoresizingMaskIntoConstraints:](*p_titleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PRXCardContentView addSubview:](self, "addSubview:", *p_titleView);
    }
    -[PRXCardContentView _invalidateMainContentConstraints](self, "_invalidateMainContentConstraints");
    v5 = v8;
  }

}

- (void)setSubtitleLabel:(id)a3
{
  PRXLabel *v5;
  PRXLabel **p_subtitleLabel;
  NSArray *subtitleLabelConstraints;
  PRXLabel *v8;

  v5 = (PRXLabel *)a3;
  p_subtitleLabel = &self->_subtitleLabel;
  if (self->_subtitleLabel != v5)
  {
    v8 = v5;
    subtitleLabelConstraints = self->_subtitleLabelConstraints;
    self->_subtitleLabelConstraints = 0;

    -[PRXLabel removeFromSuperview](*p_subtitleLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_subtitleLabel, a3);
    if (*p_subtitleLabel)
    {
      -[PRXLabel setTranslatesAutoresizingMaskIntoConstraints:](*p_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PRXCardContentView addSubview:](self, "addSubview:", *p_subtitleLabel);
    }
    -[PRXCardContentView _invalidateMainContentConstraints](self, "_invalidateMainContentConstraints");
    v5 = v8;
  }

}

- (PRXLabel)titleLabel
{
  PRXTextContainer *titleView;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    titleView = self->_titleView;
  else
    titleView = 0;
  return (PRXLabel *)titleView;
}

- (PRXTextView)titleTextView
{
  PRXTextContainer *titleView;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    titleView = self->_titleView;
  else
    titleView = 0;
  return (PRXTextView *)titleView;
}

- (NSArray)actionButtons
{
  void *v2;
  void *v3;

  -[PRXCardContentView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setActionButtons:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PRXCardContentView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActionButtons:", v4);

}

- (void)_invalidateMainContentConstraints
{
  NSArray *mainContentConstraints;

  if (self->_mainContentConstraints)
  {
    objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:");
    mainContentConstraints = self->_mainContentConstraints;
    self->_mainContentConstraints = 0;

    -[PRXCardContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)updateTitleTextViewExclusionPathsForCardWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double *v18;
  double v19;
  double *v20;
  double *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _BOOL4 v26;
  uint64_t *v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  _QWORD v36[3];
  CGRect v37;

  v36[2] = *MEMORY[0x24BDAC8D0];
  -[PRXCardContentView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRXCardContentView titleTextView](self, "titleTextView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6 && v7)
  {
    if (a3 == 0.0)
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      v11 = PRXCardPreferredSizeClassForContainerBounds(v13, v14, v15, v16);

      PRXExpectedCardWidthForStyle(-[PRXCardContentView cardStyle](self, "cardStyle"));
      a3 = v17;
    }
    else
    {
      -[PRXCardContentView traitCollection](self, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "prx_cardSizeClass");

    }
    if (v11 == 1)
      v18 = (double *)&PRXCardCompactLayoutMargins;
    else
      v18 = (double *)&PRXCardDefaultLayoutMargins;
    v19 = *v18;
    v20 = (double *)&unk_211637778;
    if (v11 != 1)
      v20 = (double *)&unk_211637758;
    v21 = (double *)&unk_211637788;
    if (v11 != 1)
      v21 = (double *)&unk_211637768;
    v22 = *v21;
    v23 = a3 - (*v20 + *v21);
    v24 = *MEMORY[0x24BDBF090];
    v25 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v26 = PRXIsEdgeToEdgePhone();
    v27 = &PRXDismissButtonEdgeToEdgeMargin;
    if (!v26)
      v27 = &PRXDismissButtonDefaultMargin;
    v28 = *(double *)v27 + 24.0 - v22;
    v29 = *(double *)v27 + 12.0 - v19;
    v37.origin.x = v24;
    v37.origin.y = v25;
    v37.size.width = v28;
    v37.size.height = v29;
    v30 = v23 - CGRectGetWidth(v37);
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRect:", v24, v25, v28, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v31;
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRect:", v30, v25, v28, v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v32;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExclusionPaths:", v33);

    -[PRXCardContentView titleTextView](self, "titleTextView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "sizeThatFits:", v23, 1.79769313e308);
    -[NSLayoutConstraint setConstant:](self->_titleViewHeightConstraint, "setConstant:", v35);

  }
  else
  {
    objc_msgSend(v8, "setExclusionPaths:", MEMORY[0x24BDBD1A8]);
  }

}

- (id)auxiliaryViews
{
  void *v2;
  void *v3;

  -[PRXCardContentView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "auxiliaryViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)cardStyle
{
  return self->_cardStyle;
}

- (PRXTextContainer)titleView
{
  return self->_titleView;
}

- (PRXLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UIView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (UILayoutGuide)mainContentGuide
{
  return self->_mainContentGuide;
}

- (PRXCardContentViewDelegate)delegate
{
  return (PRXCardContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILayoutGuide)internalContentGuide
{
  return self->_internalContentGuide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalContentGuide, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mainContentGuide, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_titleViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_mainContentConstraints, 0);
  objc_storeStrong((id *)&self->_actionButtonConstraints, 0);
  objc_storeStrong((id *)&self->_subtitleLabelConstraints, 0);
  objc_storeStrong((id *)&self->_titleViewConstraints, 0);
}

@end
