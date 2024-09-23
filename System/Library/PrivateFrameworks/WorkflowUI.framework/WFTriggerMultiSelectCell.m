@implementation WFTriggerMultiSelectCell

- (WFTriggerMultiSelectCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFTriggerMultiSelectCell *v4;
  WFTriggerOptionSelectionViewContainer *v5;
  WFTriggerOptionSelectionViewContainer *containerTop;
  WFTriggerOptionSelectionViewContainer *v7;
  WFTriggerOptionSelectionViewContainer *containerMiddle;
  WFTriggerOptionSelectionViewContainer *v9;
  WFTriggerOptionSelectionViewContainer *containerBottom;
  UIStackView *v11;
  UIStackView *stackView;
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
  WFTriggerMultiSelectCell *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;
  _QWORD v35[5];

  v35[4] = *MEMORY[0x24BDAC8D0];
  v34.receiver = self;
  v34.super_class = (Class)WFTriggerMultiSelectCell;
  v4 = -[WFTriggerMultiSelectCell initWithStyle:reuseIdentifier:](&v34, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v4)
  {
    v5 = objc_alloc_init(WFTriggerOptionSelectionViewContainer);
    containerTop = v4->_containerTop;
    v4->_containerTop = v5;

    -[WFTriggerOptionSelectionViewContainer setDelegate:](v4->_containerTop, "setDelegate:", v4);
    v7 = objc_alloc_init(WFTriggerOptionSelectionViewContainer);
    containerMiddle = v4->_containerMiddle;
    v4->_containerMiddle = v7;

    -[WFTriggerOptionSelectionViewContainer setDelegate:](v4->_containerMiddle, "setDelegate:", v4);
    v9 = objc_alloc_init(WFTriggerOptionSelectionViewContainer);
    containerBottom = v4->_containerBottom;
    v4->_containerBottom = v9;

    -[WFTriggerOptionSelectionViewContainer setDelegate:](v4->_containerBottom, "setDelegate:", v4);
    -[WFTriggerOptionSelectionViewContainer setHidden:](v4->_containerBottom, "setHidden:", 1);
    v11 = (UIStackView *)objc_alloc_init(MEMORY[0x24BEBD978]);
    stackView = v4->_stackView;
    v4->_stackView = v11;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setDistribution:](v4->_stackView, "setDistribution:", 1);
    -[UIStackView setAxis:](v4->_stackView, "setAxis:", 1);
    -[WFTriggerMultiSelectCell contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v4->_stackView);

    -[UIStackView addArrangedSubview:](v4->_stackView, "addArrangedSubview:", v4->_containerTop);
    -[UIStackView addArrangedSubview:](v4->_stackView, "addArrangedSubview:", v4->_containerMiddle);
    -[UIStackView addArrangedSubview:](v4->_stackView, "addArrangedSubview:", v4->_containerBottom);
    v26 = (void *)MEMORY[0x24BDD1628];
    -[UIStackView topAnchor](v4->_stackView, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerMultiSelectCell contentView](v4, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v30;
    -[UIStackView bottomAnchor](v4->_stackView, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerMultiSelectCell contentView](v4, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v25;
    -[UIStackView leadingAnchor](v4->_stackView, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerMultiSelectCell contentView](v4, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v17;
    -[UIStackView trailingAnchor](v4->_stackView, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerMultiSelectCell contentView](v4, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v22);

    v23 = v4;
  }

  return v4;
}

- (NSArray)optionContainers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[WFTriggerMultiSelectCell containerTop](self, "containerTop");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_addObjectIfNonNil:", v4);

  -[WFTriggerMultiSelectCell containerMiddle](self, "containerMiddle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_addObjectIfNonNil:", v5);

  -[WFTriggerMultiSelectCell containerBottom](self, "containerBottom");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_addObjectIfNonNil:", v6);

  return (NSArray *)v3;
}

- (void)view:(id)a3 didSelectOptionWithLeftViewCurrentlySelected:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  id v17;

  v4 = a4;
  v17 = a3;
  if (-[WFTriggerMultiSelectCell singleSelection](self, "singleSelection"))
  {
    if (objc_msgSend(v17, "leftViewSelected") && v4)
      goto LABEL_11;
    -[WFTriggerMultiSelectCell containerTop](self, "containerTop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLeftViewSelected:", 0);

    -[WFTriggerMultiSelectCell containerTop](self, "containerTop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightViewSelected:", 0);

    -[WFTriggerMultiSelectCell containerMiddle](self, "containerMiddle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeftViewSelected:", 0);

    -[WFTriggerMultiSelectCell containerMiddle](self, "containerMiddle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightViewSelected:", 0);

    -[WFTriggerMultiSelectCell containerBottom](self, "containerBottom");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLeftViewSelected:", 0);

    -[WFTriggerMultiSelectCell containerBottom](self, "containerBottom");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRightViewSelected:", 0);

    objc_msgSend(v17, "setLeftViewSelected:", v4 ^ 1);
    objc_msgSend(v17, "setRightViewSelected:", v4);
  }
  else
  {
    objc_msgSend(v17, "setLeftViewSelected:", v4 ^ 1);
  }
  -[WFTriggerMultiSelectCell delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  -[WFTriggerMultiSelectCell delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v13 & 1) != 0)
  {
    objc_msgSend(v14, "cell:didSelectOptionWithLeftViewSelected:rightViewSelected:", self, objc_msgSend(v17, "leftViewSelected"), objc_msgSend(v17, "rightViewSelected"));
LABEL_10:

    goto LABEL_11;
  }
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[WFTriggerMultiSelectCell delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerMultiSelectCell selectedCellViews](self, "selectedCellViews");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cell:didSelectOptions:", self, v16);

    goto LABEL_10;
  }
LABEL_11:

}

- (void)view:(id)a3 didSelectOptionWithRightViewCurrentlySelected:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  id v19;

  v4 = a4;
  v19 = a3;
  v6 = -[WFTriggerMultiSelectCell singleSelection](self, "singleSelection");
  v7 = v19;
  if (v6)
  {
    if (objc_msgSend(v19, "rightViewSelected") && v4)
      goto LABEL_10;
    -[WFTriggerMultiSelectCell containerTop](self, "containerTop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeftViewSelected:", 0);

    -[WFTriggerMultiSelectCell containerTop](self, "containerTop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightViewSelected:", 0);

    -[WFTriggerMultiSelectCell containerMiddle](self, "containerMiddle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLeftViewSelected:", 0);

    -[WFTriggerMultiSelectCell containerMiddle](self, "containerMiddle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRightViewSelected:", 0);

    -[WFTriggerMultiSelectCell containerBottom](self, "containerBottom");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLeftViewSelected:", 0);

    -[WFTriggerMultiSelectCell containerBottom](self, "containerBottom");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRightViewSelected:", 0);

    objc_msgSend(v19, "setLeftViewSelected:", v4);
    v7 = v19;
  }
  objc_msgSend(v7, "setRightViewSelected:", v4 ^ 1);
  -[WFTriggerMultiSelectCell delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  -[WFTriggerMultiSelectCell delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v15 & 1) != 0)
  {
    objc_msgSend(v16, "cell:didSelectOptionWithLeftViewSelected:rightViewSelected:", self, objc_msgSend(v19, "leftViewSelected"), objc_msgSend(v19, "rightViewSelected"));
LABEL_9:

    goto LABEL_10;
  }
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    -[WFTriggerMultiSelectCell delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerMultiSelectCell selectedCellViews](self, "selectedCellViews");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cell:didSelectOptions:", self, v18);

    goto LABEL_9;
  }
LABEL_10:

}

- (NSArray)selectedCellViews
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;

  v3 = (void *)objc_opt_new();
  -[WFTriggerMultiSelectCell containerTop](self, "containerTop");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "leftViewSelected");

  if (v5)
    objc_msgSend(v3, "addObject:", &unk_24E631098);
  -[WFTriggerMultiSelectCell containerTop](self, "containerTop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rightViewSelected");

  if (v7)
    objc_msgSend(v3, "addObject:", &unk_24E6310B0);
  -[WFTriggerMultiSelectCell containerMiddle](self, "containerMiddle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "leftViewSelected");

  if (v9)
    objc_msgSend(v3, "addObject:", &unk_24E6310C8);
  -[WFTriggerMultiSelectCell containerMiddle](self, "containerMiddle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "rightViewSelected");

  if (v11)
    objc_msgSend(v3, "addObject:", &unk_24E6310E0);
  -[WFTriggerMultiSelectCell containerBottom](self, "containerBottom");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "leftViewSelected");

  if (v13)
    objc_msgSend(v3, "addObject:", &unk_24E6310F8);
  -[WFTriggerMultiSelectCell containerBottom](self, "containerBottom");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "rightViewSelected");

  if (v15)
    objc_msgSend(v3, "addObject:", &unk_24E631110);
  return (NSArray *)v3;
}

- (BOOL)isLeftViewSelected
{
  void *v2;
  char v3;

  -[WFTriggerMultiSelectCell containerTop](self, "containerTop");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "leftViewSelected");

  return v3;
}

- (void)setLeftViewSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WFTriggerMultiSelectCell containerTop](self, "containerTop");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftViewSelected:", v3);

}

- (BOOL)isRightViewSelected
{
  void *v2;
  char v3;

  -[WFTriggerMultiSelectCell containerTop](self, "containerTop");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rightViewSelected");

  return v3;
}

- (void)setRightViewSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WFTriggerMultiSelectCell containerTop](self, "containerTop");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightViewSelected:", v3);

}

- (void)prepareForReuse
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WFTriggerMultiSelectCell;
  -[WFTriggerMultiSelectCell prepareForReuse](&v2, sel_prepareForReuse);
}

- (void)setMultiSelectCellOptionConfigurations:(id)a3
{
  void *v5;
  id v6;
  _QWORD v7[5];

  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "count") >= 7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerMultiSelectCell.m"), 199, CFSTR("A maximum of 6 configurations are supported!"));

  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__WFTriggerMultiSelectCell_setMultiSelectCellOptionConfigurations___block_invoke;
  v7[3] = &unk_24E6031D0;
  v7[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

- (void)configureWithLeftGlyph:(id)a3 leftTitle:(id)a4 leftTintColor:(id)a5 rightGlyph:(id)a6 rightTitle:(id)a7 rightTintColor:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
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
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_opt_class();
  objc_msgSend(v19, "platformImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "platformColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "multiSelectCellOptionConfigurationWithImage:title:tintColor:selected:", v21, v18, v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = v23;
  v24 = (void *)objc_opt_class();
  objc_msgSend(v16, "platformImage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "platformColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "multiSelectCellOptionConfigurationWithImage:title:tintColor:selected:", v25, v15, v26, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v31[1] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerMultiSelectCell setMultiSelectCellOptionConfigurations:](self, "setMultiSelectCellOptionConfigurations:", v28);

  -[WFTriggerMultiSelectCell containerMiddle](self, "containerMiddle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setHidden:", 1);

  -[WFTriggerMultiSelectCell containerBottom](self, "containerBottom");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setHidden:", 1);

  -[WFTriggerMultiSelectCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSelectedViewTintColor:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_storeStrong((id *)&self->_selectedViewTintColor, a3);
  v5 = a3;
  -[WFTriggerMultiSelectCell containerTop](self, "containerTop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectedImageTintColor:", v5);

  -[WFTriggerMultiSelectCell containerMiddle](self, "containerMiddle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelectedImageTintColor:", v5);

  -[WFTriggerMultiSelectCell containerBottom](self, "containerBottom");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelectedImageTintColor:", v5);

}

- (WFTriggerMultiSelectCellDelegate)delegate
{
  return (WFTriggerMultiSelectCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)singleSelection
{
  return self->_singleSelection;
}

- (void)setSingleSelection:(BOOL)a3
{
  self->_singleSelection = a3;
}

- (UIColor)selectedViewTintColor
{
  return self->_selectedViewTintColor;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (WFTriggerOptionSelectionViewContainer)containerTop
{
  return self->_containerTop;
}

- (WFTriggerOptionSelectionViewContainer)containerMiddle
{
  return self->_containerMiddle;
}

- (WFTriggerOptionSelectionViewContainer)containerBottom
{
  return self->_containerBottom;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerBottom, 0);
  objc_storeStrong((id *)&self->_containerMiddle, 0);
  objc_storeStrong((id *)&self->_containerTop, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_selectedViewTintColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __67__WFTriggerMultiSelectCell_setMultiSelectCellOptionConfigurations___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;

  v5 = a2;
  v48 = v5;
  switch(a3)
  {
    case 0:
      objc_msgSend(*(id *)(a1 + 32), "containerTop");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("image"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("selectedImage"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("color"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("selected"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("tintColor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLeftOptionImage:selectedImage:label:selected:tintColor:", v7, v8, v9, v11, v12);

      goto LABEL_3;
    case 1:
LABEL_3:
      objc_msgSend(*(id *)(a1 + 32), "containerTop");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("image"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("selectedImage"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("color"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("selected"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "BOOLValue");
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("tintColor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setRightOptionImage:selectedImage:label:selected:tintColor:", v14, v15, v16, v18, v19);

      goto LABEL_4;
    case 2:
LABEL_4:
      objc_msgSend(*(id *)(a1 + 32), "containerMiddle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("image"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("selectedImage"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("color"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("selected"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "BOOLValue");
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("tintColor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setLeftOptionImage:selectedImage:label:selected:tintColor:", v21, v22, v23, v25, v26);

      goto LABEL_5;
    case 3:
LABEL_5:
      objc_msgSend(*(id *)(a1 + 32), "containerMiddle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("image"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("selectedImage"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("color"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("selected"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "BOOLValue");
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("tintColor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setRightOptionImage:selectedImage:label:selected:tintColor:", v28, v29, v30, v32, v33);

      goto LABEL_6;
    case 4:
LABEL_6:
      objc_msgSend(*(id *)(a1 + 32), "containerBottom");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("image"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("selectedImage"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("color"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("selected"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "BOOLValue");
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("tintColor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setLeftOptionImage:selectedImage:label:selected:tintColor:", v35, v36, v37, v39, v40);

      goto LABEL_7;
    case 5:
LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "containerBottom");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("image"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("selectedImage"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("color"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("selected"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "BOOLValue");
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("tintColor"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setRightOptionImage:selectedImage:label:selected:tintColor:", v42, v43, v44, v46, v47);

      v5 = v48;
      break;
    default:
      break;
  }

}

+ (id)multiSelectCellOptionConfigurationWithImage:(id)a3 title:(id)a4 tintColor:(id)a5 selected:(BOOL)a6
{
  _BOOL8 v6;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[4];

  v6 = a6;
  v19[3] = *MEMORY[0x24BDAC8D0];
  v9 = (void *)MEMORY[0x24BDBCED8];
  v18[0] = CFSTR("image");
  v18[1] = CFSTR("color");
  v19[0] = a3;
  v19[1] = a4;
  v18[2] = CFSTR("selected");
  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "numberWithBool:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "if_setObjectIfNonNil:forKey:", v11, CFSTR("tintColor"));
  return v16;
}

+ (id)multiSelectCellOptionConfigurationWithImage:(id)a3 selectedImage:(id)a4 title:(id)a5 tintColor:(id)a6 selected:(BOOL)a7
{
  _BOOL8 v7;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  _QWORD v22[5];

  v7 = a7;
  v22[4] = *MEMORY[0x24BDAC8D0];
  v11 = (void *)MEMORY[0x24BDBCED8];
  v21[0] = CFSTR("image");
  v21[1] = CFSTR("color");
  v22[0] = a3;
  v22[1] = a5;
  v21[2] = CFSTR("selected");
  v12 = (void *)MEMORY[0x24BDD16E0];
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v12, "numberWithBool:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = CFSTR("selectedImage");
  v22[2] = v17;
  v22[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithDictionary:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "if_setObjectIfNonNil:forKey:", v13, CFSTR("tintColor"));
  return v19;
}

@end
