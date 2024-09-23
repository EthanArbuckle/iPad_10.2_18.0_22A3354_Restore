@implementation WFParameterValuePickerVariableTableViewCell

- (WFParameterValuePickerVariableTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFParameterValuePickerVariableTableViewCell *v4;
  id v5;
  void *v6;
  UILabel *v7;
  UILabel *nameLabel;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  WFIconHostingView *iconView;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  WFParameterValuePickerVariableTableViewCell *v24;
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
  objc_super v37;
  _QWORD v38[6];

  v38[4] = *MEMORY[0x24BDAC8D0];
  v37.receiver = self;
  v37.super_class = (Class)WFParameterValuePickerVariableTableViewCell;
  v4 = -[WFParameterValuePickerVariableTableViewCell initWithStyle:reuseIdentifier:](&v37, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BEBD978]);
    objc_msgSend(v5, "setAxis:", 0);
    objc_msgSend(v5, "setSpacing:", 8.0);
    objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = v7;

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v6;
    objc_msgSend(v6, "scaledFontForFont:maximumPointSize:", v9, 36.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_nameLabel, "setFont:", v10);

    -[WFParameterValuePickerVariableTableViewCell tintColor](v4, "tintColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_nameLabel, "setTextColor:", v11);

    objc_msgSend(v5, "addArrangedSubview:", v4->_nameLabel);
    objc_msgSend(v6, "scaledValueForValue:", 25.0);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BEC5168]), "initWithIcon:size:", 0, v12, v12);
    iconView = v4->_iconView;
    v4->_iconView = (WFIconHostingView *)v13;

    objc_msgSend(v5, "addArrangedSubview:", v4->_iconView);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFParameterValuePickerVariableTableViewCell contentView](v4, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v5);

    v28 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v5, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerVariableTableViewCell contentView](v4, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, 10.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v32;
    objc_msgSend(v5, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerVariableTableViewCell contentView](v4, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, -10.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v27;
    objc_msgSend(v5, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerVariableTableViewCell contentView](v4, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v17, 20.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v18;
    objc_msgSend(v5, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerVariableTableViewCell contentView](v4, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, -20.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v23);

    v24 = v4;
  }

  return v4;
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFParameterValuePickerVariableTableViewCell;
  -[WFParameterValuePickerVariableTableViewCell tintColorDidChange](&v4, sel_tintColorDidChange);
  -[WFParameterValuePickerVariableTableViewCell tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_nameLabel, "setTextColor:", v3);

}

- (void)updateWithName:(id)a3 icon:(id)a4
{
  id v6;
  UILabel *nameLabel;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  nameLabel = self->_nameLabel;
  v8 = a3;
  -[UILabel setText:](nameLabel, "setText:", v8);
  v9 = v6;
  if (v9)
  {
    objc_opt_class();
    v14 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_alloc(MEMORY[0x24BEC1398]);
      -[WFParameterValuePickerVariableTableViewCell tintColor](self, "tintColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithPlatformColor:", v11);
      objc_msgSend(MEMORY[0x24BEC14D0], "clearBackground");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "iconWithSymbolColor:background:", v12, v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v14 = 0;
  }

  -[WFIconHostingView setIcon:](self->_iconView, "setIcon:", v14);
  -[WFParameterValuePickerVariableTableViewCell setIsAccessibilityElement:](self, "setIsAccessibilityElement:", 1);
  -[WFParameterValuePickerVariableTableViewCell setAccessibilityLabel:](self, "setAccessibilityLabel:", v8);

}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (WFIconHostingView)iconView
{
  return self->_iconView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end
