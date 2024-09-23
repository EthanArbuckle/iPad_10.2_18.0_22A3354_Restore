@implementation WFAutomationTypeExplanationPlatterView

- (WFAutomationTypeExplanationPlatterView)initWithFrame:(CGRect)a3
{
  WFAutomationTypeExplanationPlatterView *v3;
  WFAutomationTypeExplanationPlatterView *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  UIStackView *stackView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  UIImageView *iconView;
  double v28;
  uint64_t v29;
  UILabel *explanationTextLabel;
  double v31;
  uint64_t v32;
  UIButton *button;
  WFAutomationTypeExplanationPlatterView *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v42;
  _QWORD v43[6];

  v43[4] = *MEMORY[0x24BDAC8D0];
  v42.receiver = self;
  v42.super_class = (Class)WFAutomationTypeExplanationPlatterView;
  v3 = -[WFAutomationTypeExplanationPlatterView initWithFrame:](&v42, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[WFAutomationTypeExplanationPlatterView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v5) = 1148846080;
    -[WFAutomationTypeExplanationPlatterView setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 0, v5);
    LODWORD(v6) = 1148846080;
    -[WFAutomationTypeExplanationPlatterView setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 1, v6);
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemGroupedBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationTypeExplanationPlatterView setBackgroundColor:](v4, "setBackgroundColor:", v7);

    -[WFAutomationTypeExplanationPlatterView layer](v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", 16.0);

    v9 = *MEMORY[0x24BDE58E8];
    -[WFAutomationTypeExplanationPlatterView layer](v4, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerCurve:", v9);

    v11 = objc_alloc(MEMORY[0x24BEBD978]);
    v12 = *MEMORY[0x24BDBF090];
    v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v16 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x24BDBF090], v13, v14, v15);
    stackView = v4->_stackView;
    v4->_stackView = (UIStackView *)v16;

    -[UIStackView setAxis:](v4->_stackView, "setAxis:", 1);
    -[UIStackView setAlignment:](v4->_stackView, "setAlignment:", 0);
    -[UIStackView setDistribution:](v4->_stackView, "setDistribution:", 3);
    -[UIStackView setSpacing:](v4->_stackView, "setSpacing:", 18.0);
    -[UIStackView setLayoutMarginsRelativeArrangement:](v4->_stackView, "setLayoutMarginsRelativeArrangement:", 1);
    -[UIStackView setLayoutMargins:](v4->_stackView, "setLayoutMargins:", 18.0, 8.0, 8.0, 8.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFAutomationTypeExplanationPlatterView addSubview:](v4, "addSubview:", v4->_stackView);
    v36 = (void *)MEMORY[0x24BDD1628];
    -[UIStackView topAnchor](v4->_stackView, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationTypeExplanationPlatterView topAnchor](v4, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v39;
    -[UIStackView bottomAnchor](v4->_stackView, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationTypeExplanationPlatterView bottomAnchor](v4, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v18;
    -[UIStackView leadingAnchor](v4->_stackView, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationTypeExplanationPlatterView leadingAnchor](v4, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v21;
    -[UIStackView trailingAnchor](v4->_stackView, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationTypeExplanationPlatterView trailingAnchor](v4, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activateConstraints:", v25);

    v26 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", 0);
    iconView = v4->_iconView;
    v4->_iconView = (UIImageView *)v26;

    -[UIImageView setContentMode:](v4->_iconView, "setContentMode:", 4);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v28) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v4->_iconView, "setContentCompressionResistancePriority:forAxis:", 1, v28);
    -[UIStackView addArrangedSubview:](v4->_stackView, "addArrangedSubview:", v4->_iconView);
    v29 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v12, v13, v14, v15);
    explanationTextLabel = v4->_explanationTextLabel;
    v4->_explanationTextLabel = (UILabel *)v29;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_explanationTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_explanationTextLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v4->_explanationTextLabel, "setTextAlignment:", 1);
    LODWORD(v31) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_explanationTextLabel, "setContentCompressionResistancePriority:forAxis:", 1, v31);
    -[UIStackView addArrangedSubview:](v4->_stackView, "addArrangedSubview:", v4->_explanationTextLabel);
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v32 = objc_claimAutoreleasedReturnValue();
    button = v4->_button;
    v4->_button = (UIButton *)v32;

    -[UIButton setRole:](v4->_button, "setRole:", 1);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView addArrangedSubview:](v4->_stackView, "addArrangedSubview:", v4->_button);
    v34 = v4;
  }

  return v4;
}

- (void)configureForAutomationType:(unint64_t)a3
{
  const __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v4 = CFSTR("automations.add-home");
  v5 = CFSTR("Create Home Automation");
  switch(a3)
  {
    case 0uLL:
      -[WFAutomationTypeExplanationPlatterView personalAutomationIcon](self, "personalAutomationIcon");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      WFLocalizedString(CFSTR("Create an automation that runs on a personal iPhone or iPad."));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      WFLocalizedString(CFSTR("Create Personal Automation"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v14;
      v10 = (void *)v8;
      v4 = CFSTR("automations.add-personal");
      goto LABEL_4;
    case 1uLL:
      goto LABEL_7;
    case 2uLL:
      v4 = CFSTR("automations.setup-home");
      v5 = CFSTR("Set Up Your Home");
      goto LABEL_7;
    case 3uLL:
      v4 = CFSTR("automations.setup-homehub");
      v5 = CFSTR("Set Up Home Hub");
LABEL_7:
      -[WFAutomationTypeExplanationPlatterView homeAutomationIcon](self, "homeAutomationIcon");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[WFAutomationTypeExplanationPlatterView homeButtonColor](self, "homeButtonColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAutomationTypeExplanationPlatterView homeExplanatoryText](self, "homeExplanatoryText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAutomationTypeExplanationPlatterView homeButtonColor](self, "homeButtonColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      WFLocalizedString(v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAutomationTypeExplanationPlatterView setIcon:](self, "setIcon:", v15);
      if (v11)
      {
        -[WFAutomationTypeExplanationPlatterView iconView](self, "iconView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTintColor:", v11);

      }
      break;
    default:
      v9 = 0;
      v6 = 0;
      v7 = 0;
      v10 = 0;
      v4 = 0;
LABEL_4:
      v15 = v9;
      -[WFAutomationTypeExplanationPlatterView setIcon:](self, "setIcon:", v9);
      break;
  }
  -[WFAutomationTypeExplanationPlatterView setExplanatoryText:](self, "setExplanatoryText:", v6);
  -[WFAutomationTypeExplanationPlatterView setButtonTitle:color:](self, "setButtonTitle:color:", v10, v7);
  -[WFAutomationTypeExplanationPlatterView button](self, "button");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccessibilityIdentifier:", v4);

}

- (void)setIcon:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFAutomationTypeExplanationPlatterView iconView](self, "iconView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (void)setExplanatoryText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFAutomationTypeExplanationPlatterView explanationTextLabel](self, "explanationTextLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)setButtonTitle:(id)a3 color:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (void *)MEMORY[0x24BEBD438];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "filledButtonConfiguration");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v8);

  objc_msgSend(v11, "setButtonSize:", 3);
  objc_msgSend(v11, "background");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v7);

  -[WFAutomationTypeExplanationPlatterView button](self, "button");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConfiguration:", v11);

}

- (void)setButtonTarget:(id)a3 action:(SEL)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[WFAutomationTypeExplanationPlatterView button](self, "button");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forControlEvents:", v6, a4, 64);

}

- (id)personalAutomationIcon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 60.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_configurationWithHierarchicalColors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationByApplyingConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("ipad.and.iphone"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)homeAutomationIcon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 60.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "wf_homeTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_configurationWithHierarchicalColors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationByApplyingConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("homekit"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)homeExplanatoryText
{
  return WFLocalizedString(CFSTR("Create an automation that works for everyone in the home."));
}

- (id)homeButtonColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "wf_homeTintColor");
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  id v5;

  -[WFAutomationTypeExplanationPlatterView button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", 0, 0, 64);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFAutomationTypeExplanationPlatterView iconView](self, "iconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (UILabel)explanationTextLabel
{
  return self->_explanationTextLabel;
}

- (UIButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_explanationTextLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
