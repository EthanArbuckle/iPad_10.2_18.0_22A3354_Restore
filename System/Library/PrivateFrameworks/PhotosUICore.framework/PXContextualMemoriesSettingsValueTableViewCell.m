@implementation PXContextualMemoriesSettingsValueTableViewCell

- (PXContextualMemoriesSettingsValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PXContextualMemoriesSettingsValueTableViewCell *v4;
  PXContextualMemoriesSettingsValueTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXContextualMemoriesSettingsValueTableViewCell;
  v4 = -[PXContextualMemoriesSettingsValueTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v5 = v4;
  if (v4)
    -[PXContextualMemoriesSettingsValueTableViewCell _setUpConstraints](v4, "_setUpConstraints");
  return v5;
}

- (void)_setUpConstraints
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
  void *v23;
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
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
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
  double v57;
  _QWORD v58[3];
  _QWORD v59[4];

  v59[3] = *MEMORY[0x1E0C80C00];
  v58[0] = CFSTR("label");
  -[PXContextualMemoriesSettingsValueTableViewCell valueLabel](self, "valueLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v3;
  v58[1] = CFSTR("reset");
  -[PXContextualMemoriesSettingsValueTableViewCell resetButton](self, "resetButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v4;
  v58[2] = CFSTR("containerView");
  -[PXContextualMemoriesSettingsValueTableViewCell containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXContextualMemoriesSettingsValueTableViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[containerView]|"), 0, 0, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addConstraints:", v8);

  -[PXContextualMemoriesSettingsValueTableViewCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-4-[containerView]-4-|"), 0, 0, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addConstraints:", v10);

  -[PXContextualMemoriesSettingsValueTableViewCell containerView](self, "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[label]-(>=4)-[reset]"), 0, 0, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addConstraints:", v12);

  -[PXContextualMemoriesSettingsValueTableViewCell containerView](self, "containerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsValueTableViewCell containerView](self, "containerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsValueTableViewCell resetButton](self, "resetButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addConstraint:", v18);

  -[PXContextualMemoriesSettingsValueTableViewCell containerView](self, "containerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsValueTableViewCell containerView](self, "containerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsValueTableViewCell valueLabel](self, "valueLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addConstraint:", v24);

  -[PXContextualMemoriesSettingsValueTableViewCell valueLabel](self, "valueLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsValueTableViewCell containerView](self, "containerView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsValueTableViewCell layoutMargins](self, "layoutMargins");
  objc_msgSend(v26, "constraintGreaterThanOrEqualToAnchor:constant:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsValueTableViewCell setTopLayoutMarginConstraint:](self, "setTopLayoutMarginConstraint:", v29);

  -[PXContextualMemoriesSettingsValueTableViewCell containerView](self, "containerView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsValueTableViewCell valueLabel](self, "valueLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsValueTableViewCell layoutMargins](self, "layoutMargins");
  objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:constant:", v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsValueTableViewCell setBottomLayoutMarginConstraint:](self, "setBottomLayoutMarginConstraint:", v35);

  -[PXContextualMemoriesSettingsValueTableViewCell valueLabel](self, "valueLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsValueTableViewCell containerView](self, "containerView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsValueTableViewCell layoutMargins](self, "layoutMargins");
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsValueTableViewCell setLeftLayoutMarginConstraint:](self, "setLeftLayoutMarginConstraint:", v41);

  -[PXContextualMemoriesSettingsValueTableViewCell containerView](self, "containerView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsValueTableViewCell resetButton](self, "resetButton");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsValueTableViewCell layoutMargins](self, "layoutMargins");
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsValueTableViewCell setRightLayoutMarginConstraint:](self, "setRightLayoutMarginConstraint:", v47);

  -[PXContextualMemoriesSettingsValueTableViewCell containerView](self, "containerView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsValueTableViewCell topLayoutMarginConstraint](self, "topLayoutMarginConstraint");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addConstraint:", v49);

  -[PXContextualMemoriesSettingsValueTableViewCell containerView](self, "containerView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsValueTableViewCell bottomLayoutMarginConstraint](self, "bottomLayoutMarginConstraint");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addConstraint:", v51);

  -[PXContextualMemoriesSettingsValueTableViewCell containerView](self, "containerView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsValueTableViewCell leftLayoutMarginConstraint](self, "leftLayoutMarginConstraint");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addConstraint:", v53);

  -[PXContextualMemoriesSettingsValueTableViewCell containerView](self, "containerView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContextualMemoriesSettingsValueTableViewCell rightLayoutMarginConstraint](self, "rightLayoutMarginConstraint");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addConstraint:", v55);

  -[PXContextualMemoriesSettingsValueTableViewCell resetButton](self, "resetButton");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v57) = 1144766464;
  objc_msgSend(v56, "setContentHuggingPriority:forAxis:", 0, v57);

}

- (void)_didPressReset:(id)a3
{
  void (**resetHandler)(id, PXContextualMemoriesSettingsValueTableViewCell *);

  resetHandler = (void (**)(id, PXContextualMemoriesSettingsValueTableViewCell *))self->_resetHandler;
  if (resetHandler)
    resetHandler[2](resetHandler, self);
}

- (UIButton)resetButton
{
  UIButton *resetButton;
  UIButton *v4;
  UIButton *v5;
  void *v6;
  UIButton *v7;
  void *v8;
  void *v9;

  resetButton = self->_resetButton;
  if (!resetButton)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_resetButton;
    self->_resetButton = v4;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_resetButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXContextualMemoriesSettingsValueTableViewCell containerView](self, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_resetButton);

    v7 = self->_resetButton;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Reset"), &stru_1E5149688, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v7, "setTitle:forState:", v9, 0);

    -[UIButton addTarget:action:forControlEvents:](self->_resetButton, "addTarget:action:forControlEvents:", self, sel__didPressReset_, 64);
    resetButton = self->_resetButton;
  }
  return resetButton;
}

- (UILabel)valueLabel
{
  UILabel *valueLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;

  valueLabel = self->_valueLabel;
  if (!valueLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_valueLabel;
    self->_valueLabel = v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_valueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXContextualMemoriesSettingsValueTableViewCell containerView](self, "containerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_valueLabel);

    -[UILabel setNumberOfLines:](self->_valueLabel, "setNumberOfLines:", 0);
    valueLabel = self->_valueLabel;
  }
  return valueLabel;
}

- (UIView)containerView
{
  UIView *containerView;
  id v4;
  UIView *v5;
  UIView *v6;
  void *v7;
  UIView *v8;
  void *v9;

  containerView = self->_containerView;
  if (!containerView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_containerView;
    self->_containerView = v5;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXContextualMemoriesSettingsValueTableViewCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_containerView;
    -[PXContextualMemoriesSettingsValueTableViewCell textLabel](self, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertSubview:aboveSubview:", v8, v9);

    containerView = self->_containerView;
  }
  return containerView;
}

- (void)layoutMarginsDidChange
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PXContextualMemoriesSettingsValueTableViewCell;
  -[PXContextualMemoriesSettingsValueTableViewCell layoutMarginsDidChange](&v15, sel_layoutMarginsDidChange);
  -[PXContextualMemoriesSettingsValueTableViewCell layoutMargins](self, "layoutMargins");
  v4 = v3;
  -[PXContextualMemoriesSettingsValueTableViewCell topLayoutMarginConstraint](self, "topLayoutMarginConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v4);

  -[PXContextualMemoriesSettingsValueTableViewCell layoutMargins](self, "layoutMargins");
  v7 = v6;
  -[PXContextualMemoriesSettingsValueTableViewCell bottomLayoutMarginConstraint](self, "bottomLayoutMarginConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", v7);

  -[PXContextualMemoriesSettingsValueTableViewCell layoutMargins](self, "layoutMargins");
  v10 = v9;
  -[PXContextualMemoriesSettingsValueTableViewCell leftLayoutMarginConstraint](self, "leftLayoutMarginConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConstant:", v10);

  -[PXContextualMemoriesSettingsValueTableViewCell layoutMargins](self, "layoutMargins");
  v13 = v12;
  -[PXContextualMemoriesSettingsValueTableViewCell rightLayoutMarginConstraint](self, "rightLayoutMarginConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setConstant:", v13);

}

- (id)resetHandler
{
  return self->_resetHandler;
}

- (void)setResetHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (void)setResetButton:(id)a3
{
  objc_storeStrong((id *)&self->_resetButton, a3);
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (NSLayoutConstraint)topLayoutMarginConstraint
{
  return self->_topLayoutMarginConstraint;
}

- (void)setTopLayoutMarginConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topLayoutMarginConstraint, a3);
}

- (NSLayoutConstraint)bottomLayoutMarginConstraint
{
  return self->_bottomLayoutMarginConstraint;
}

- (void)setBottomLayoutMarginConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLayoutMarginConstraint, a3);
}

- (NSLayoutConstraint)leftLayoutMarginConstraint
{
  return self->_leftLayoutMarginConstraint;
}

- (void)setLeftLayoutMarginConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leftLayoutMarginConstraint, a3);
}

- (NSLayoutConstraint)rightLayoutMarginConstraint
{
  return self->_rightLayoutMarginConstraint;
}

- (void)setRightLayoutMarginConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_rightLayoutMarginConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightLayoutMarginConstraint, 0);
  objc_storeStrong((id *)&self->_leftLayoutMarginConstraint, 0);
  objc_storeStrong((id *)&self->_bottomLayoutMarginConstraint, 0);
  objc_storeStrong((id *)&self->_topLayoutMarginConstraint, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_resetButton, 0);
  objc_storeStrong(&self->_resetHandler, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
}

@end
