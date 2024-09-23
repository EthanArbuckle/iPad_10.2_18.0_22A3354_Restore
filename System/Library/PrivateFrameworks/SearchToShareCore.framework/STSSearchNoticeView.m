@implementation STSSearchNoticeView

- (STSSearchNoticeView)init
{
  STSSearchNoticeView *v2;
  void *v3;
  UILabel *v4;
  UILabel *textLabel;
  UILabel *v6;
  void *v7;
  uint64_t v8;
  NSMutableArray *constraints;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)STSSearchNoticeView;
  v2 = -[STSSearchNoticeView init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "sts_defaultBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSSearchNoticeView setBackgroundColor:](v2, "setBackgroundColor:", v3);

    -[STSSearchNoticeView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    textLabel = v2->_textLabel;
    v2->_textLabel = v4;

    v6 = v2->_textLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6, "setFont:", v7);

    -[UILabel setTextAlignment:](v2->_textLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v2->_textLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[STSSearchNoticeView addSubview:](v2, "addSubview:", v2->_textLabel);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    constraints = v2->_constraints;
    v2->_constraints = (NSMutableArray *)v8;

  }
  return v2;
}

- (void)layoutSubviews
{
  NSMutableArray *constraints;
  void *v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  void *v16;
  void *v17;
  void *v18;
  UIButton *continueButton;
  NSMutableArray *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableArray *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_constraints);
  -[NSMutableArray removeAllObjects](self->_constraints, "removeAllObjects");
  -[STSSearchNoticeView readableContentGuide](self, "readableContentGuide");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  constraints = self->_constraints;
  -[UILabel leadingAnchor](self->_textLabel, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](constraints, "addObject:", v6);

  v7 = self->_constraints;
  -[UILabel trailingAnchor](self->_textLabel, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v7, "addObject:", v10);

  v11 = self->_constraints;
  -[UILabel centerXAnchor](self->_textLabel, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSSearchNoticeView centerXAnchor](self, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v11, "addObject:", v14);

  v15 = self->_constraints;
  -[UILabel topAnchor](self->_textLabel, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSSearchNoticeView topAnchor](self, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 16.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v15, "addObject:", v18);

  continueButton = self->_continueButton;
  if (continueButton)
  {
    v20 = self->_constraints;
    -[UIButton centerXAnchor](continueButton, "centerXAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSSearchNoticeView centerXAnchor](self, "centerXAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v20, "addObject:", v23);

    v24 = self->_constraints;
    -[UIButton topAnchor](self->_continueButton, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_textLabel, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 16.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v24, "addObject:", v27);

  }
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_constraints);

}

- (void)_continuePressed:(id)a3
{
  void (**continueButtonAction)(void);

  continueButtonAction = (void (**)(void))self->_continueButtonAction;
  if (continueButtonAction)
    continueButtonAction[2]();
}

- (void)setText:(id)a3
{
  NSString **p_text;
  id v6;

  p_text = &self->_text;
  v6 = a3;
  if (!-[NSString isEqualToString:](*p_text, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_text, a3);
    -[UILabel setText:](self->_textLabel, "setText:", *p_text);
    -[STSSearchNoticeView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIColor)textColor
{
  return -[UILabel textColor](self->_textLabel, "textColor");
}

- (void)setTextColor:(id)a3
{
  -[UILabel setTextColor:](self->_textLabel, "setTextColor:", a3);
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    -[STSSearchNoticeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentCentered:(BOOL)a3
{
  if (self->_contentCentered != a3)
  {
    self->_contentCentered = a3;
    -[STSSearchNoticeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContinueButtonAction:(id)a3
{
  UIButton *continueButton;
  id v5;
  void *v6;
  id continueButtonAction;
  UIButton *v8;
  UIButton *v9;
  UIButton *v10;
  void *v11;
  void *v12;
  void *v13;

  if (self->_continueButtonAction != a3)
  {
    continueButton = self->_continueButton;
    v5 = a3;
    -[UIButton removeFromSuperview](continueButton, "removeFromSuperview");
    v6 = (void *)MEMORY[0x227672A18](v5);

    continueButtonAction = self->_continueButtonAction;
    self->_continueButtonAction = v6;

    if (self->_continueButtonAction)
    {
      objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
      v8 = (UIButton *)objc_claimAutoreleasedReturnValue();
      v9 = self->_continueButton;
      self->_continueButton = v8;

      v10 = self->_continueButton;
      STSLocalizedString(CFSTR("NOTICE_CONTINUE_BUTTON_TITLE"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitle:forState:](v10, "setTitle:forState:", v11, 0);

      -[UIButton titleLabel](self->_continueButton, "titleLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFont:", v13);

      -[UIButton addTarget:action:forControlEvents:](self->_continueButton, "addTarget:action:forControlEvents:", self, sel__continuePressed_, 64);
      -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_continueButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[STSSearchNoticeView addSubview:](self, "addSubview:", self->_continueButton);
    }
    -[STSSearchNoticeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)text
{
  return self->_text;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)isContentCentered
{
  return self->_contentCentered;
}

- (id)continueButtonAction
{
  return self->_continueButtonAction;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_continueButtonAction, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
