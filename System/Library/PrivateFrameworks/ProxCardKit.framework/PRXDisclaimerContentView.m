@implementation PRXDisclaimerContentView

- (PRXDisclaimerContentView)initWithCardStyle:(int64_t)a3
{
  PRXDisclaimerContentView *v3;
  UIView *v4;
  UIView *disclaimerContainerView;
  void *v6;
  uint64_t v7;
  PRXLabel *disclaimerLabel;
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
  PRXDisclaimerContentView *v22;
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
  objc_super v43;
  _QWORD v44[10];

  v44[8] = *MEMORY[0x24BDAC8D0];
  v43.receiver = self;
  v43.super_class = (Class)PRXDisclaimerContentView;
  v3 = -[PRXScrollableContentView initWithCardStyle:](&v43, sel_initWithCardStyle_, a3);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    disclaimerContainerView = v3->_disclaimerContainerView;
    v3->_disclaimerContainerView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_disclaimerContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRXScrollableContentView scrollView](v3, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_disclaimerContainerView);

    +[PRXLabel labelWithStyle:](PRXLabel, "labelWithStyle:", 3);
    v7 = objc_claimAutoreleasedReturnValue();
    disclaimerLabel = v3->_disclaimerLabel;
    v3->_disclaimerLabel = (PRXLabel *)v7;

    -[PRXLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_disclaimerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v3->_disclaimerContainerView, "addSubview:", v3->_disclaimerLabel);
    -[PRXScrollableContentView scrollView](v3, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentLayoutGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PRXDisclaimerContentView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x24BDD1628];
    -[PRXLabel topAnchor](v3->_disclaimerLabel, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v3->_disclaimerContainerView, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v40;
    -[PRXLabel leadingAnchor](v3->_disclaimerLabel, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v3->_disclaimerContainerView, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v37;
    -[PRXLabel trailingAnchor](v3->_disclaimerLabel, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3->_disclaimerContainerView, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v33;
    -[UIView topAnchor](v3->_disclaimerContainerView, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v44[3] = v29;
    -[UIView centerYAnchor](v3->_disclaimerContainerView, "centerYAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v10;
    objc_msgSend(v10, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v44[4] = v25;
    -[UIView bottomAnchor](v3->_disclaimerContainerView, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v44[5] = v13;
    -[UIView leadingAnchor](v3->_disclaimerContainerView, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    v28 = v11;
    objc_msgSend(v11, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v44[6] = v17;
    -[UIView trailingAnchor](v3->_disclaimerContainerView, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v44[7] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v21);

    v22 = v3;
  }

  return v3;
}

- (void)updateConstraints
{
  PRXButton *moreInfoButton;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *contentConstraints;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSArray *v24;
  void *v25;
  objc_super v26;
  void *v27;
  _QWORD v28[6];

  v28[5] = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)PRXDisclaimerContentView;
  -[PRXCardContentView updateConstraints](&v26, sel_updateConstraints);
  if (!self->_contentConstraints)
  {
    moreInfoButton = self->_moreInfoButton;
    if (moreInfoButton)
    {
      -[PRXButton topAnchor](moreInfoButton, "topAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXLabel bottomAnchor](self->_disclaimerLabel, "bottomAnchor");
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:", v22);
      v20 = objc_claimAutoreleasedReturnValue();
      v28[0] = v20;
      -[PRXButton leadingAnchor](self->_moreInfoButton, "leadingAnchor");
      v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self->_disclaimerContainerView, "leadingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray constraintGreaterThanOrEqualToAnchor:](v24, "constraintGreaterThanOrEqualToAnchor:", v23);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v21;
      -[PRXButton trailingAnchor](self->_moreInfoButton, "trailingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_disclaimerContainerView, "trailingAnchor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v28[2] = v5;
      -[PRXButton centerXAnchor](self->_moreInfoButton, "centerXAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerXAnchor](self->_disclaimerContainerView, "centerXAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "constraintEqualToAnchor:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v28[3] = v8;
      -[PRXButton bottomAnchor](self->_moreInfoButton, "bottomAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_disclaimerContainerView, "bottomAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v28[4] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 5);
      v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
      contentConstraints = self->_contentConstraints;
      self->_contentConstraints = v12;

      v14 = (void *)v20;
      v15 = (void *)v22;

      v16 = v25;
      v17 = v24;
    }
    else
    {
      -[PRXLabel bottomAnchor](self->_disclaimerLabel, "bottomAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_disclaimerContainerView, "bottomAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
      v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v17 = self->_contentConstraints;
      self->_contentConstraints = v18;
    }

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_contentConstraints);
  }
}

- (void)setMoreInfoButton:(id)a3
{
  PRXButton *v5;
  PRXButton **p_moreInfoButton;
  PRXButton *moreInfoButton;
  NSArray *contentConstraints;
  PRXButton *v9;

  v5 = (PRXButton *)a3;
  p_moreInfoButton = &self->_moreInfoButton;
  moreInfoButton = self->_moreInfoButton;
  v9 = v5;
  if (moreInfoButton != v5)
  {
    -[PRXButton removeFromSuperview](moreInfoButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_moreInfoButton, a3);
    if (*p_moreInfoButton)
    {
      -[PRXButton setTranslatesAutoresizingMaskIntoConstraints:](*p_moreInfoButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](self->_disclaimerContainerView, "addSubview:", *p_moreInfoButton);
    }
    if (self->_contentConstraints)
    {
      objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:");
      contentConstraints = self->_contentConstraints;
      self->_contentConstraints = 0;

      -[PRXDisclaimerContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    }
  }

}

- (PRXLabel)disclaimerLabel
{
  return self->_disclaimerLabel;
}

- (PRXButton)moreInfoButton
{
  return self->_moreInfoButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreInfoButton, 0);
  objc_storeStrong((id *)&self->_disclaimerLabel, 0);
  objc_storeStrong((id *)&self->_contentConstraints, 0);
  objc_storeStrong((id *)&self->_disclaimerContainerView, 0);
}

@end
