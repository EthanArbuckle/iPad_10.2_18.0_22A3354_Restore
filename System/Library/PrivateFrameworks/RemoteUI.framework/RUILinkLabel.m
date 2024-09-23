@implementation RUILinkLabel

- (RUILinkLabel)initWithFrame:(CGRect)a3
{
  RUILinkLabel *v3;
  uint64_t v4;
  UILabel *textLabel;
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
  uint64_t v16;
  NSArray *textLabelContraints;
  NSArray *linkButtonContraints;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)RUILinkLabel;
  v3 = -[RUILinkLabel initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v3)
  {
    v4 = objc_opt_new();
    textLabel = v3->_textLabel;
    v3->_textLabel = (UILabel *)v4;

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v3->_textLabel, "setBackgroundColor:", v6);

    -[UILabel setNumberOfLines:](v3->_textLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RUILinkLabel addSubview:](v3, "addSubview:", v3->_textLabel);
    -[UILabel topAnchor](v3->_textLabel, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUILinkLabel topAnchor](v3, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    -[UILabel bottomAnchor](v3->_textLabel, "bottomAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUILinkLabel bottomAnchor](v3, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v9;
    -[UILabel leadingAnchor](v3->_textLabel, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUILinkLabel leadingAnchor](v3, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v12;
    -[UILabel trailingAnchor](v3->_textLabel, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUILinkLabel trailingAnchor](v3, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 4);
    v16 = objc_claimAutoreleasedReturnValue();
    textLabelContraints = v3->_textLabelContraints;
    v3->_textLabelContraints = (NSArray *)v16;

    linkButtonContraints = v3->_linkButtonContraints;
    v3->_linkButtonContraints = (NSArray *)MEMORY[0x24BDBD1A8];

    v3->_enabled = 1;
  }
  return v3;
}

- (void)setButtonConfiguration:(id)a3
{
  id v5;
  UIButton *linkButton;
  void *v7;
  id v8;

  objc_storeStrong((id *)&self->_buttonConfiguration, a3);
  v5 = a3;
  -[UIButton setConfiguration:](self->_linkButton, "setConfiguration:", v5);
  linkButton = self->_linkButton;
  -[UIButton configuration](linkButton, "configuration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "baseForegroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](linkButton, "setTitleColor:forState:", v7, 0);

}

- (void)updateConstraints
{
  id action;
  UILabel *v4;
  UILabel *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UILabel *textLabel;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  UILabel *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)RUILinkLabel;
  -[RUILinkLabel updateConstraints](&v16, sel_updateConstraints);
  action = self->_action;
  if (action)
  {
    -[RUILinkLabel linkButton](self, "linkButton");
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_textLabel;
  }
  v5 = v4;
  -[UILabel setNeedsLayout](v4, "setNeedsLayout");
  LODWORD(v6) = 1144750080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_textLabel, "setContentHuggingPriority:forAxis:", 0, v6);
  LODWORD(v7) = 1144750080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_textLabel, "setContentHuggingPriority:forAxis:", 1, v7);
  LODWORD(v8) = 1144750080;
  -[UIButton setContentHuggingPriority:forAxis:](self->_linkButton, "setContentHuggingPriority:forAxis:", 0, v8);
  LODWORD(v9) = 1144750080;
  -[UIButton setContentHuggingPriority:forAxis:](self->_linkButton, "setContentHuggingPriority:forAxis:", 1, v9);
  textLabel = self->_textLabel;
  if (action)
  {
    -[UILabel setHidden:](textLabel, "setHidden:", 1);
    -[UIButton setHidden:](self->_linkButton, "setHidden:", 0);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_linkButtonContraints);
    v11 = (void *)MEMORY[0x24BDD1628];
    v12 = 432;
  }
  else
  {
    -[UILabel text](textLabel, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    v15 = self->_textLabel;
    if (!v14)
    {
      -[UILabel setHidden:](v15, "setHidden:", 1);
      -[UIButton setHidden:](self->_linkButton, "setHidden:", 1);
      goto LABEL_9;
    }
    -[UILabel setHidden:](v15, "setHidden:", 0);
    -[UIButton setHidden:](self->_linkButton, "setHidden:", 1);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_textLabelContraints);
    v11 = (void *)MEMORY[0x24BDD1628];
    v12 = 440;
  }
  objc_msgSend(v11, "deactivateConstraints:", *(Class *)((char *)&self->super.super.super.isa + v12));
LABEL_9:

}

- (void)setText:(id)a3
{
  UILabel *textLabel;
  id v5;

  textLabel = self->_textLabel;
  v5 = a3;
  -[UILabel setText:](textLabel, "setText:", v5);
  -[UIButton setTitle:forState:](self->_linkButton, "setTitle:forState:", v5, 0);

  -[RUILinkLabel setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (NSString)text
{
  return -[UILabel text](self->_textLabel, "text");
}

- (void)setFont:(id)a3
{
  UILabel *textLabel;
  id v5;
  id v6;

  textLabel = self->_textLabel;
  v5 = a3;
  -[UILabel setFont:](textLabel, "setFont:", v5);
  -[UIButton titleLabel](self->_linkButton, "titleLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

}

- (UIFont)font
{
  return -[UILabel font](self->_textLabel, "font");
}

- (void)setNumberOfLines:(int64_t)a3
{
  id v5;

  if (-[UILabel numberOfLines](self->_textLabel, "numberOfLines") != a3)
  {
    -[UILabel setNumberOfLines:](self->_textLabel, "setNumberOfLines:", a3);
    -[UIButton titleLabel](self->_linkButton, "titleLabel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNumberOfLines:", a3);

  }
}

- (int64_t)numberOfLines
{
  return -[UILabel numberOfLines](self->_textLabel, "numberOfLines");
}

- (void)setLineBreakMode:(int64_t)a3
{
  id v5;

  if (-[UILabel lineBreakMode](self->_textLabel, "lineBreakMode") != a3)
  {
    -[UILabel setLineBreakMode:](self->_textLabel, "setLineBreakMode:", a3);
    -[UIButton titleLabel](self->_linkButton, "titleLabel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLineBreakMode:", a3);

  }
}

- (int64_t)lineBreakMode
{
  return -[UILabel lineBreakMode](self->_textLabel, "lineBreakMode");
}

- (void)setAction:(id)a3
{
  void *v5;
  id action;
  void *v7;

  if (self->_action != a3)
  {
    v5 = (void *)objc_msgSend(a3, "copy");
    action = self->_action;
    self->_action = v5;

    -[RUILinkLabel linkButton](self, "linkButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", a3 == 0);

    -[UILabel setHidden:](self->_textLabel, "setHidden:", a3 != 0);
    -[RUILinkLabel setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[UIButton setEnabled:](self->_linkButton, "setEnabled:");
  }
}

- (UIButton)linkButton
{
  UIButton *linkButton;
  UIButton *v4;
  UIButton *v5;
  void *v6;
  void *v7;
  void *v8;
  UIButton *v9;
  void *v10;
  UIButton *v11;
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
  NSArray *v22;
  NSArray *linkButtonContraints;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x24BDAC8D0];
  linkButton = self->_linkButton;
  if (!linkButton)
  {
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_linkButton;
    self->_linkButton = v4;

    -[RUILinkLabel buttonConfiguration](self, "buttonConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[RUILinkLabel buttonConfiguration](self, "buttonConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setConfiguration:](self->_linkButton, "setConfiguration:", v7);

    }
    -[UIButton setExclusiveTouch:](self->_linkButton, "setExclusiveTouch:", 1);
    -[UIButton addTarget:action:forControlEvents:](self->_linkButton, "addTarget:action:forControlEvents:", self, sel__linkPressed, 0x2000);
    -[UIButton setHidden:](self->_linkButton, "setHidden:", self->_action == 0);
    -[UIButton setEnabled:](self->_linkButton, "setEnabled:", self->_enabled);
    -[UIButton titleLabel](self->_linkButton, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_linkButton;
    -[UILabel text](self->_textLabel, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v9, "setTitle:forState:", v10, 0);

    v11 = self->_linkButton;
    objc_msgSend(MEMORY[0x24BEBD4B8], "linkColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v11, "setTitleColor:forState:", v12, 0);

    objc_msgSend(v8, "setLineBreakMode:", -[UILabel lineBreakMode](self->_textLabel, "lineBreakMode"));
    objc_msgSend(v8, "setNumberOfLines:", -[UILabel numberOfLines](self->_textLabel, "numberOfLines"));
    -[UILabel font](self->_textLabel, "font");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v8;
    objc_msgSend(v8, "setFont:", v13);

    objc_msgSend(v8, "setTextAlignment:", -[UILabel textAlignment](self->_textLabel, "textAlignment"));
    -[RUILinkLabel addSubview:](self, "addSubview:", self->_linkButton);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_linkButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton topAnchor](self->_linkButton, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUILinkLabel topAnchor](self, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v26;
    -[UIButton bottomAnchor](self->_linkButton, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUILinkLabel bottomAnchor](self, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v15;
    -[UIButton leadingAnchor](self->_linkButton, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUILinkLabel leadingAnchor](self, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v18;
    -[UIButton trailingAnchor](self->_linkButton, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUILinkLabel trailingAnchor](self, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 4);
    v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
    linkButtonContraints = self->_linkButtonContraints;
    self->_linkButtonContraints = v22;

    linkButton = self->_linkButton;
  }
  return linkButton;
}

- (void)setTextAlignment:(int64_t)a3
{
  void *v5;

  if (-[UILabel textAlignment](self->_textLabel, "textAlignment") != a3)
  {
    -[UILabel setTextAlignment:](self->_textLabel, "setTextAlignment:", a3);
    -[UIButton titleLabel](self->_linkButton, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextAlignment:", a3);

    if ((unint64_t)a3 <= 4)
      -[UIButton setContentHorizontalAlignment:](self->_linkButton, "setContentHorizontalAlignment:", qword_209F75FC0[a3]);
    -[RUILinkLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (int64_t)textAlignment
{
  return -[UILabel textAlignment](self->_textLabel, "textAlignment");
}

- (void)_linkPressed
{
  void (**action)(void);

  action = (void (**)(void))self->_action;
  if (action)
    action[2]();
}

- (UIButtonConfiguration)buttonConfiguration
{
  return self->_buttonConfiguration;
}

- (id)action
{
  return self->_action;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_buttonConfiguration, 0);
  objc_storeStrong((id *)&self->_linkButtonContraints, 0);
  objc_storeStrong((id *)&self->_textLabelContraints, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
}

@end
