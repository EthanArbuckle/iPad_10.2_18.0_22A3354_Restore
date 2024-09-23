@implementation WFParameterValuePickerTableViewCellContentView

- (void)setConfiguration:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[WFParameterValuePickerTableViewCellContentView applyConfiguration:](self, "applyConfiguration:", v4);
  }

}

- (WFParameterValuePickerTableViewCellContentView)initWithConfiguration:(id)a3
{
  id v4;
  WFParameterValuePickerTableViewCellContentView *v5;
  WFParameterValuePickerTableViewCellContentView *v6;
  UILabel *v7;
  UILabel *titleLabel;
  UILabel *v9;
  UILabel *subtitleLabel;
  UIImageView *v11;
  UIImageView *iconImageView;
  id v13;
  void *v14;
  void *v15;
  double v16;
  WFIconHostingView *iconView;
  UISwitch *v18;
  UISwitch *selectedSwitch;
  id v20;
  void *v21;
  uint64_t v22;
  UIStackView *labelsStackView;
  double v24;
  id v25;
  void *v26;
  uint64_t v27;
  UIStackView *contentStackView;
  int v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  UISwitch *v62;
  id v63;
  UIImageView *v64;
  void *v65;
  UILabel *v66;
  UILabel *v67;
  id v68;
  objc_super v69;
  _QWORD v70[7];
  _QWORD v71[4];
  _QWORD v72[4];

  v72[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)WFParameterValuePickerTableViewCellContentView;
  v5 = -[WFParameterValuePickerTableViewCellContentView initWithFrame:](&v69, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v6 = v5;
  if (v5)
  {
    -[WFParameterValuePickerTableViewCellContentView setPreservesSuperviewLayoutMargins:](v5, "setPreservesSuperviewLayoutMargins:", 1);
    v7 = (UILabel *)objc_opt_new();
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v7, "setNumberOfLines:", 2);
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = v7;
    v67 = v7;

    v9 = (UILabel *)objc_opt_new();
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v9, "setNumberOfLines:", 2);
    subtitleLabel = v6->_subtitleLabel;
    v6->_subtitleLabel = v9;
    v66 = v9;

    v11 = (UIImageView *)objc_opt_new();
    -[UIImageView setClipsToBounds:](v11, "setClipsToBounds:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    iconImageView = v6->_iconImageView;
    v6->_iconImageView = v11;
    v64 = v11;

    v13 = objc_alloc(MEMORY[0x24BEC5168]);
    objc_msgSend(v4, "icon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithIcon:size:", v14, 29.0, 29.0);

    objc_msgSend(v15, "setUseAccentColor:", 1);
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v16) = 1132396544;
    objc_msgSend(v15, "setContentHuggingPriority:forAxis:", 0, v16);
    iconView = v6->_iconView;
    v6->_iconView = (WFIconHostingView *)v15;
    v63 = v15;

    v18 = (UISwitch *)objc_opt_new();
    -[UISwitch addTarget:action:forControlEvents:](v18, "addTarget:action:forControlEvents:", v6, sel_selectedSwitchDidToggle_, 4096);
    selectedSwitch = v6->_selectedSwitch;
    v6->_selectedSwitch = v18;
    v62 = v18;

    v20 = objc_alloc(MEMORY[0x24BEBD978]);
    v72[0] = v67;
    v72[1] = v66;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "initWithArrangedSubviews:", v21);
    v68 = v4;
    labelsStackView = v6->_labelsStackView;
    v6->_labelsStackView = (UIStackView *)v22;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v6->_labelsStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v6->_labelsStackView, "setAxis:", 1);
    -[UIStackView setDistribution:](v6->_labelsStackView, "setDistribution:", 0);
    -[UIStackView setAlignment:](v6->_labelsStackView, "setAlignment:", 0);
    -[UIStackView setLayoutMarginsRelativeArrangement:](v6->_labelsStackView, "setLayoutMarginsRelativeArrangement:", 1);
    -[UIStackView setSpacing:](v6->_labelsStackView, "setSpacing:", 2.0);
    v24 = 0.0;
    -[UIStackView setDirectionalLayoutMargins:](v6->_labelsStackView, "setDirectionalLayoutMargins:", 8.0, 0.0, 8.0, 0.0);
    v25 = objc_alloc(MEMORY[0x24BEBD978]);
    v71[0] = v64;
    v71[1] = v63;
    v71[2] = v6->_labelsStackView;
    v71[3] = v62;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "initWithArrangedSubviews:", v26);
    contentStackView = v6->_contentStackView;
    v6->_contentStackView = (UIStackView *)v27;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v6->_contentStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v6->_contentStackView, "setAxis:", 0);
    -[UIStackView setDistribution:](v6->_contentStackView, "setDistribution:", 0);
    -[UIStackView setAlignment:](v6->_contentStackView, "setAlignment:", 3);
    v29 = objc_msgSend(v4, "usesInsetGroupedTableStyle");
    v30 = 12.0;
    if (v29)
      v30 = 8.0;
    -[UIStackView setSpacing:](v6->_contentStackView, "setSpacing:", v30);
    -[UIStackView setDirectionalLayoutMargins:](v6->_contentStackView, "setDirectionalLayoutMargins:", 8.0, 0.0, 8.0, 0.0);
    -[WFParameterValuePickerTableViewCellContentView contentStackView](v6, "contentStackView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerTableViewCellContentView addSubview:](v6, "addSubview:", v31);

    if (objc_msgSend(v4, "usesInsetGroupedTableStyle"))
      v24 = -4.0;
    v48 = (void *)MEMORY[0x24BDD1628];
    -[WFParameterValuePickerTableViewCellContentView contentStackView](v6, "contentStackView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerTableViewCellContentView layoutMarginsGuide](v6, "layoutMarginsGuide");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, v24);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v58;
    -[WFParameterValuePickerTableViewCellContentView contentStackView](v6, "contentStackView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "trailingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerTableViewCellContentView layoutMarginsGuide](v6, "layoutMarginsGuide");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v54);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v70[1] = v53;
    -[WFParameterValuePickerTableViewCellContentView contentStackView](v6, "contentStackView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "topAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerTableViewCellContentView topAnchor](v6, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v70[2] = v49;
    -[WFParameterValuePickerTableViewCellContentView contentStackView](v6, "contentStackView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerTableViewCellContentView bottomAnchor](v6, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v70[3] = v44;
    -[WFParameterValuePickerTableViewCellContentView heightAnchor](v6, "heightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintGreaterThanOrEqualToConstant:", 44.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v70[4] = v33;
    -[UIImageView widthAnchor](v6->_iconImageView, "widthAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToConstant:", 29.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v36) = 1148026880;
    objc_msgSend(v35, "wf_withPriority:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v70[5] = v37;
    -[UIImageView heightAnchor](v6->_iconImageView, "heightAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToConstant:", 29.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v40) = 1148026880;
    objc_msgSend(v39, "wf_withPriority:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v70[6] = v41;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 7);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "activateConstraints:", v42);

    v4 = v68;
    -[WFParameterValuePickerTableViewCellContentView applyConfiguration:](v6, "applyConfiguration:", v68);
  }

  return v6;
}

- (void)applyConfiguration:(id)a3
{
  void *v3;
  id v6;
  id v7;
  id v8;
  char v9;
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
  void *v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  char v40;
  int v41;
  uint64_t v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _BOOL8 v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id v54;

  v6 = a3;
  -[WFParameterValuePickerTableViewCellContentView configuration](self, "configuration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v54 = v8;
  if (v7 == v8)
  {

    v11 = v54;
  }
  else
  {
    if (v8 && v7)
    {
      v9 = objc_msgSend(v7, "isEqual:", v8);

      v10 = v54;
      if ((v9 & 1) != 0)
        goto LABEL_27;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_configuration, a3);
    objc_msgSend(v54, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerTableViewCellContentView titleLabel](self, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

    objc_msgSend(v54, "textColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerTableViewCellContentView titleLabel](self, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v14);

    objc_msgSend(v54, "textFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerTableViewCellContentView titleLabel](self, "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFont:", v16);

    objc_msgSend(v54, "secondaryText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerTableViewCellContentView subtitleLabel](self, "subtitleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v18);

    objc_msgSend(v54, "secondaryTextColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerTableViewCellContentView subtitleLabel](self, "subtitleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTextColor:", v20);

    objc_msgSend(v54, "secondaryTextFont");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerTableViewCellContentView subtitleLabel](self, "subtitleLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFont:", v22);

    objc_msgSend(v54, "secondaryText");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length") == 0;
    -[WFParameterValuePickerTableViewCellContentView subtitleLabel](self, "subtitleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setHidden:", v25);

    objc_msgSend(v54, "image");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "untintedUIImage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerTableViewCellContentView iconImageView](self, "iconImageView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setImage:", v28);

    objc_msgSend(v54, "image");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "tintColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "platformColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerTableViewCellContentView iconImageView](self, "iconImageView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTintColor:", v32);

    objc_msgSend(v54, "cornerRadius");
    v35 = v34;
    -[WFParameterValuePickerTableViewCellContentView iconImageView](self, "iconImageView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "_setContinuousCornerRadius:", v35);

    objc_msgSend(v54, "image");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37 == 0;
    -[WFParameterValuePickerTableViewCellContentView iconImageView](self, "iconImageView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setHidden:", v38);

    v40 = objc_msgSend(v54, "forceImageScaling");
    if ((v40 & 1) != 0)
    {
      v41 = 0;
      v42 = 1;
    }
    else
    {
      objc_msgSend(v54, "image");
      v38 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v38, "platformImage");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "size");
      if (v43 <= 29.0)
      {
        objc_msgSend(v54, "image");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "platformImage");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "size");
        if (v44 > 29.0)
          v42 = 1;
        else
          v42 = 4;
        v41 = 1;
      }
      else
      {
        v41 = 0;
        v42 = 1;
      }
    }
    -[WFParameterValuePickerTableViewCellContentView iconImageView](self, "iconImageView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setContentMode:", v42);

    if (v41)
    {

    }
    if ((v40 & 1) == 0)
    {

    }
    objc_msgSend(v54, "icon");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerTableViewCellContentView iconView](self, "iconView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setIcon:", v46);

    objc_msgSend(v54, "image");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      v49 = 1;
    }
    else
    {
      objc_msgSend(v54, "icon");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v47 == 0;
    }
    -[WFParameterValuePickerTableViewCellContentView iconView](self, "iconView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setHidden:", v49);

    if (!v48)
    v51 = objc_msgSend(v54, "isContainedInState");
    -[WFParameterValuePickerTableViewCellContentView selectedSwitch](self, "selectedSwitch");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setOn:", v51);

    v53 = objc_msgSend(v54, "usesToggleForSelection") ^ 1;
    -[WFParameterValuePickerTableViewCellContentView selectedSwitch](self, "selectedSwitch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", v53);
  }

  v10 = v54;
LABEL_27:

}

- (void)selectedSwitchDidToggle:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  -[WFParameterValuePickerTableViewCellContentView superview](self, "superview", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  -[WFParameterValuePickerTableViewCellContentView configuration](self, "configuration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterValuePickerTableViewCellContentView selectedSwitch](self, "selectedSwitch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parameterValuePickerTableViewCell:didToggleSelection:", v6, objc_msgSend(v8, "isOn"));

}

- (WFParameterValuePickerTableViewCellConfiguration)configuration
{
  return self->_configuration;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (WFIconHostingView)iconView
{
  return self->_iconView;
}

- (UISwitch)selectedSwitch
{
  return self->_selectedSwitch;
}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (UIStackView)labelsStackView
{
  return self->_labelsStackView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_selectedSwitch, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
