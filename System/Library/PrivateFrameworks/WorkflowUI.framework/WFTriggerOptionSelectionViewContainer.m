@implementation WFTriggerOptionSelectionViewContainer

- (WFTriggerOptionSelectionViewContainer)init
{
  WFTriggerOptionSelectionViewContainer *v2;
  UIStackView *v3;
  UIStackView *stackView;
  WFTriggerOptionSelectionView *v5;
  WFTriggerOptionSelectionView *leftView;
  WFTriggerOptionSelectionView *v7;
  WFTriggerOptionSelectionView *rightView;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  WFTriggerOptionSelectionViewContainer *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _QWORD v40[6];

  v40[4] = *MEMORY[0x24BDAC8D0];
  v38.receiver = self;
  v38.super_class = (Class)WFTriggerOptionSelectionViewContainer;
  v2 = -[WFTriggerOptionSelectionViewContainer init](&v38, sel_init);
  if (v2)
  {
    v3 = (UIStackView *)objc_alloc_init(MEMORY[0x24BEBD978]);
    stackView = v2->_stackView;
    v2->_stackView = v3;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v2->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setDistribution:](v2->_stackView, "setDistribution:", 1);
    -[UIStackView setAxis:](v2->_stackView, "setAxis:", 0);
    v5 = objc_alloc_init(WFTriggerOptionSelectionView);
    leftView = v2->_leftView;
    v2->_leftView = v5;

    v7 = objc_alloc_init(WFTriggerOptionSelectionView);
    rightView = v2->_rightView;
    v2->_rightView = v7;

    -[WFTriggerOptionSelectionViewContainer addSubview:](v2, "addSubview:", v2->_stackView);
    v28 = (void *)MEMORY[0x24BDD1628];
    -[UIStackView topAnchor](v2->_stackView, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerOptionSelectionViewContainer topAnchor](v2, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v31;
    -[UIStackView bottomAnchor](v2->_stackView, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerOptionSelectionViewContainer bottomAnchor](v2, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v9;
    -[UIStackView leadingAnchor](v2->_stackView, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerOptionSelectionViewContainer leadingAnchor](v2, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v12;
    -[UIStackView trailingAnchor](v2->_stackView, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerOptionSelectionViewContainer trailingAnchor](v2, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v16);

    -[WFTriggerOptionSelectionViewContainer stackView](v2, "stackView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addArrangedSubview:", v2->_leftView);

    -[WFTriggerOptionSelectionViewContainer stackView](v2, "stackView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addArrangedSubview:", v2->_rightView);

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[UIStackView arrangedSubviews](v2->_stackView, "arrangedSubviews");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v35 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", v2, sel_handleMultiSelectViewPressWithRecognizer_);
          objc_msgSend(v25, "setMinimumPressDuration:", 0.0);
          objc_msgSend(v25, "setCancelPastAllowableMovement:", 1);
          objc_msgSend(v25, "setDelegate:", v2);
          objc_msgSend(v24, "addGestureRecognizer:", v25);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v21);
    }

    v26 = v2;
  }

  return v2;
}

- (void)handleMultiSelectViewPressWithRecognizer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  if (v5 == 1)
  {
    -[WFTriggerOptionSelectionViewContainer feedbackGenerator](self, "feedbackGenerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prepare");

  }
  objc_msgSend(v4, "view");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v17);
  v8 = v7;
  v10 = v9;

  v11 = objc_msgSend(v17, "pointInside:withEvent:", 0, v8, v10);
  v12 = v11;
  if ((unint64_t)(v5 - 1) < 2)
    v13 = v11;
  else
    v13 = 0;
  objc_msgSend(v17, "setHighlighted:", v13);
  if (v5 == 3 && v12)
  {
    -[UIImpactFeedbackGenerator impactOccurred](self->_feedbackGenerator, "impactOccurred");
    -[WFTriggerOptionSelectionViewContainer leftView](self, "leftView");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    -[WFTriggerOptionSelectionViewContainer delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 == v14)
    {
      objc_msgSend(v15, "view:didSelectOptionWithLeftViewCurrentlySelected:", self, -[WFTriggerOptionSelectionViewContainer leftViewSelected](self, "leftViewSelected"));
    }
    else
    {
      -[WFTriggerOptionSelectionViewContainer rightView](self, "rightView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "view:didSelectOptionWithRightViewCurrentlySelected:", self, objc_msgSend(v16, "selected"));

    }
  }

}

- (BOOL)leftViewSelected
{
  void *v2;
  char v3;

  -[WFTriggerOptionSelectionViewContainer leftView](self, "leftView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selected");

  return v3;
}

- (void)setLeftViewSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WFTriggerOptionSelectionViewContainer leftView](self, "leftView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelected:", v3);

}

- (BOOL)rightViewSelected
{
  void *v2;
  char v3;

  -[WFTriggerOptionSelectionViewContainer rightView](self, "rightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selected");

  return v3;
}

- (void)setRightViewSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WFTriggerOptionSelectionViewContainer rightView](self, "rightView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelected:", v3);

}

- (void)setSelectedImageTintColor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFTriggerOptionSelectionViewContainer leftView](self, "leftView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedStateImageTintColor:", v4);

  -[WFTriggerOptionSelectionViewContainer rightView](self, "rightView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectedStateImageTintColor:", v4);

}

- (void)setLeftOptionImage:(id)a3 selectedImage:(id)a4 label:(id)a5 selected:(BOOL)a6 tintColor:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[WFTriggerOptionSelectionViewContainer leftView](self, "leftView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDefaultImage:", v15);

  -[WFTriggerOptionSelectionViewContainer leftView](self, "leftView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSelectedImage:", v14);

  -[WFTriggerOptionSelectionViewContainer leftView](self, "leftView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDefaultImageTintColor:", v12);

  -[WFTriggerOptionSelectionViewContainer leftView](self, "leftView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "label");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v13);

  -[WFTriggerOptionSelectionViewContainer leftView](self, "leftView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSelected:", v7);

  -[WFTriggerOptionSelectionViewContainer setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setRightOptionImage:(id)a3 selectedImage:(id)a4 label:(id)a5 selected:(BOOL)a6 tintColor:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[WFTriggerOptionSelectionViewContainer rightView](self, "rightView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDefaultImage:", v15);

  -[WFTriggerOptionSelectionViewContainer rightView](self, "rightView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSelectedImage:", v14);

  -[WFTriggerOptionSelectionViewContainer rightView](self, "rightView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDefaultImageTintColor:", v12);

  -[WFTriggerOptionSelectionViewContainer rightView](self, "rightView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "label");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v13);

  -[WFTriggerOptionSelectionViewContainer rightView](self, "rightView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSelected:", v7);

  -[WFTriggerOptionSelectionViewContainer setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (WFTriggerOptionSelectionViewContainerDelegate)delegate
{
  return (WFTriggerOptionSelectionViewContainerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (WFTriggerOptionSelectionView)leftView
{
  return self->_leftView;
}

- (WFTriggerOptionSelectionView)rightView
{
  return self->_rightView;
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_rightView, 0);
  objc_storeStrong((id *)&self->_leftView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
