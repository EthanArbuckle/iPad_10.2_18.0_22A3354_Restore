@implementation WFAutomationNotificationContentView

- (WFAutomationNotificationContentView)initWithFrame:(CGRect)a3
{
  WFAutomationNotificationContentView *v3;
  UIStackView *v4;
  UIStackView *stackView;
  UIStackView *v6;
  void *v7;
  id v8;
  WFRowOfIconsView *v9;
  WFRowOfIconsView *actionIconsView;
  double v11;
  UILabel *v12;
  UILabel *titleLabel;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  UILabel *v19;
  UILabel *descriptionLabel;
  void *v21;
  void *v22;
  double v23;
  WFAutomationNotificationContentView *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)WFAutomationNotificationContentView;
  v3 = -[WFAutomationNotificationContentView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIStackView *)objc_alloc_init(MEMORY[0x24BEBD978]);
    stackView = v3->_stackView;
    v3->_stackView = v4;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v3->_stackView, "setAxis:", 1);
    -[UIStackView setAlignment:](v3->_stackView, "setAlignment:", 0);
    -[UIStackView setDistribution:](v3->_stackView, "setDistribution:", 0);
    -[UIStackView setSpacing:](v3->_stackView, "setSpacing:", 5.0);
    -[UIStackView setLayoutMargins:](v3->_stackView, "setLayoutMargins:", 6.0, 10.0, 6.0, 10.0);
    -[UIStackView setLayoutMarginsRelativeArrangement:](v3->_stackView, "setLayoutMarginsRelativeArrangement:", 1);
    -[WFAutomationNotificationContentView addSubview:](v3, "addSubview:", v3->_stackView);
    v6 = v3->_stackView;
    -[WFAutomationNotificationContentView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)-[UIStackView wf_addConstraintsToFillLayoutGuide:](v6, "wf_addConstraintsToFillLayoutGuide:", v7);

    v9 = -[WFRowOfIconsView initWithMaxNumberOfIcons:height:]([WFRowOfIconsView alloc], "initWithMaxNumberOfIcons:height:", 8, 30.0);
    actionIconsView = v3->_actionIconsView;
    v3->_actionIconsView = v9;

    -[WFRowOfIconsView setTranslatesAutoresizingMaskIntoConstraints:](v3->_actionIconsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v11) = 1148846080;
    -[WFRowOfIconsView setContentCompressionResistancePriority:forAxis:](v3->_actionIconsView, "setContentCompressionResistancePriority:forAxis:", 1, v11);
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_actionIconsView);
    -[UIStackView setCustomSpacing:afterView:](v3->_stackView, "setCustomSpacing:afterView:", v3->_actionIconsView, 10.0);
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v12;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 2);
    v14 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE220]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fontDescriptorWithSymbolicTraits:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fontWithDescriptor:size:", v16, 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v17);

    -[UILabel setText:](v3->_titleLabel, "setText:", CFSTR(" "));
    LODWORD(v18) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v18);
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_titleLabel);
    v19 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = v19;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_descriptionLabel, "setNumberOfLines:", 3);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_descriptionLabel, "setFont:", v21);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_descriptionLabel, "setTextColor:", v22);

    LODWORD(v23) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_descriptionLabel, "setContentCompressionResistancePriority:forAxis:", 1, v23);
    -[UILabel setText:](v3->_descriptionLabel, "setText:", CFSTR(" "));
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_descriptionLabel);
    v24 = v3;
  }

  return v3;
}

- (void)updateUIFromNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(a3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutomationNotificationContentView titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(v14, "body");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutomationNotificationContentView descriptionLabel](self, "descriptionLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  objc_msgSend(v14, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WFActionIconsFromNotificationUserInfo();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = v10;
  else
    v12 = MEMORY[0x24BDBD1A8];
  -[WFAutomationNotificationContentView actionIconsView](self, "actionIconsView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIcons:", v12);

}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (WFRowOfIconsView)actionIconsView
{
  return self->_actionIconsView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_actionIconsView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
