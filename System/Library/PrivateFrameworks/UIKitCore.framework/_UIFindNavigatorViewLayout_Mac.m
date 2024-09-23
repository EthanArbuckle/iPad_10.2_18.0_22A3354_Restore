@implementation _UIFindNavigatorViewLayout_Mac

- (_UIFindNavigatorViewLayout_Mac)initWithFrame:(CGRect)a3
{
  _UIFindNavigatorViewLayout_Mac *v3;
  UIStackView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIStackView *verticalStackView;
  UIStackView *v11;
  UIStackView *findStackView;
  UIStackView *v13;
  UIStackView *replaceStackView;
  UIStackView *v15;
  UIStackView *firstLineControlsStackView;
  UIStackView *v17;
  UIStackView *secondLineControlsStackView;
  uint64_t v19;
  UIView *doneButtonSpacer;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)_UIFindNavigatorViewLayout_Mac;
  v3 = -[UIView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIStackView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[UIStackView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    verticalStackView = v3->_verticalStackView;
    v3->_verticalStackView = (UIStackView *)v9;

    -[UIStackView setSpacing:](v3->_verticalStackView, "setSpacing:", 12.0);
    -[UIStackView setAxis:](v3->_verticalStackView, "setAxis:", 1);
    -[UIStackView setDistribution:](v3->_verticalStackView, "setDistribution:", 1);
    -[UIView addSubview:](v3, "addSubview:", v3->_verticalStackView);
    v11 = -[UIStackView initWithFrame:]([UIStackView alloc], "initWithFrame:", v5, v6, v7, v8);
    findStackView = v3->_findStackView;
    v3->_findStackView = v11;

    -[UIStackView setSpacing:](v3->_findStackView, "setSpacing:", 12.0);
    -[UIStackView setAxis:](v3->_findStackView, "setAxis:", 0);
    -[UIStackView setAlignment:](v3->_findStackView, "setAlignment:", 3);
    -[UIStackView addArrangedSubview:](v3->_verticalStackView, "addArrangedSubview:", v3->_findStackView);
    v13 = -[UIStackView initWithFrame:]([UIStackView alloc], "initWithFrame:", v5, v6, v7, v8);
    replaceStackView = v3->_replaceStackView;
    v3->_replaceStackView = v13;

    -[UIStackView setSpacing:](v3->_replaceStackView, "setSpacing:", 12.0);
    -[UIStackView setAxis:](v3->_replaceStackView, "setAxis:", 0);
    -[UIStackView addArrangedSubview:](v3->_verticalStackView, "addArrangedSubview:", v3->_replaceStackView);
    v15 = -[UIStackView initWithFrame:]([UIStackView alloc], "initWithFrame:", v5, v6, v7, v8);
    firstLineControlsStackView = v3->_firstLineControlsStackView;
    v3->_firstLineControlsStackView = v15;

    -[UIStackView setSpacing:](v3->_firstLineControlsStackView, "setSpacing:", 12.0);
    v17 = -[UIStackView initWithFrame:]([UIStackView alloc], "initWithFrame:", v5, v6, v7, v8);
    secondLineControlsStackView = v3->_secondLineControlsStackView;
    v3->_secondLineControlsStackView = v17;

    -[UIStackView setSpacing:](v3->_secondLineControlsStackView, "setSpacing:", 12.0);
    makeSpacerView();
    v19 = objc_claimAutoreleasedReturnValue();
    doneButtonSpacer = v3->_doneButtonSpacer;
    v3->_doneButtonSpacer = (UIView *)v19;

  }
  return v3;
}

- (CGSize)preferredContentSize
{
  void *v3;
  double v4;
  double v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[_UIFindNavigatorViewLayout searchTextField](self, "searchTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;

  v6 = -[_UIFindNavigatorViewLayout replaceFieldVisible](self, "replaceFieldVisible");
  v7 = v5 + 12.0;
  if (!v6)
    v7 = -0.0;
  v8 = v5 + v7 + 8.0;
  v9 = -1.0;
  result.height = v8;
  result.width = v9;
  return result;
}

- (BOOL)showsReplaceInOptionsMenu
{
  return 0;
}

- (void)prepareForLayout
{
  UIStackView *findStackView;
  void *v4;
  UIStackView *firstLineControlsStackView;
  void *v6;
  UIStackView *v7;
  void *v8;
  UIStackView *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  UIView *v17;
  UIStackView *replaceStackView;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  UIStackView *secondLineControlsStackView;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *lineEqualWidthsConstraint;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  findStackView = self->_findStackView;
  -[_UIFindNavigatorViewLayout searchTextField](self, "searchTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addArrangedSubview:](findStackView, "addArrangedSubview:", v4);

  -[UIStackView addArrangedSubview:](self->_findStackView, "addArrangedSubview:", self->_firstLineControlsStackView);
  -[UIView setHidden:](self->_doneButtonSpacer, "setHidden:", 1);
  firstLineControlsStackView = self->_firstLineControlsStackView;
  -[_UIFindNavigatorViewLayout_Mac nextPreviousSegmentedControl](self, "nextPreviousSegmentedControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addArrangedSubview:](firstLineControlsStackView, "addArrangedSubview:", v6);

  v7 = self->_firstLineControlsStackView;
  -[_UIFindNavigatorViewLayout doneButton](self, "doneButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addArrangedSubview:](v7, "addArrangedSubview:", v8);

  -[UIStackView addArrangedSubview:](self->_firstLineControlsStackView, "addArrangedSubview:", self->_doneButtonSpacer);
  v9 = self->_firstLineControlsStackView;
  -[_UIFindNavigatorViewLayout_Mac replaceToggleSwitch](self, "replaceToggleSwitch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addArrangedSubview:](v9, "addArrangedSubview:", v10);

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[UIStackView arrangedSubviews](self->_firstLineControlsStackView, "arrangedSubviews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v42 != v15)
          objc_enumerationMutation(v11);
        v17 = *(UIView **)(*((_QWORD *)&v41 + 1) + 8 * i);
        if (v17 != self->_doneButtonSpacer)
        {
          LODWORD(v13) = 1148846080;
          -[UIView setContentHuggingPriority:forAxis:](v17, "setContentHuggingPriority:forAxis:", 0, v13);
        }
      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v14);
  }

  replaceStackView = self->_replaceStackView;
  -[_UIFindNavigatorViewLayout replaceTextField](self, "replaceTextField");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addArrangedSubview:](replaceStackView, "addArrangedSubview:", v19);

  -[UIStackView addArrangedSubview:](self->_replaceStackView, "addArrangedSubview:", self->_secondLineControlsStackView);
  -[_UIFindNavigatorViewLayout doneButton](self, "doneButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = 1148846080;
  objc_msgSend(v20, "setContentCompressionResistancePriority:forAxis:", 0, v21);

  -[_UIFindNavigatorViewLayout_Mac replaceReplaceAllSegmentedControl](self, "replaceReplaceAllSegmentedControl");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = 1148846080;
  objc_msgSend(v22, "setContentCompressionResistancePriority:forAxis:", 0, v23);

  secondLineControlsStackView = self->_secondLineControlsStackView;
  -[_UIFindNavigatorViewLayout_Mac replaceReplaceAllSegmentedControl](self, "replaceReplaceAllSegmentedControl");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addArrangedSubview:](secondLineControlsStackView, "addArrangedSubview:", v25);

  LODWORD(v26) = 1148846080;
  -[UIView setContentHuggingPriority:forAxis:](self->_secondLineControlsStackView, "setContentHuggingPriority:forAxis:", 0, v26);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[UIStackView arrangedSubviews](self->_secondLineControlsStackView, "arrangedSubviews", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v28)
  {
    v30 = v28;
    v31 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v38 != v31)
          objc_enumerationMutation(v27);
        LODWORD(v29) = 1148846080;
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "setContentHuggingPriority:forAxis:", 0, v29);
      }
      v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v30);
  }

  -[UIView widthAnchor](self->_secondLineControlsStackView, "widthAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_firstLineControlsStackView, "widthAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v34);
  v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  lineEqualWidthsConstraint = self->_lineEqualWidthsConstraint;
  self->_lineEqualWidthsConstraint = v35;

}

- (void)setReplaceFieldVisible:(BOOL)a3
{
  _BOOL8 v3;
  UIStackView *secondLineControlsStackView;
  void *v6;
  void *v7;
  uint64_t v8;
  UIStackView *firstLineControlsStackView;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFindNavigatorViewLayout_Mac;
  -[_UIFindNavigatorViewLayout setReplaceFieldVisible:](&v10, sel_setReplaceFieldVisible_);
  -[UIView setHidden:](self->_replaceStackView, "setHidden:", v3 ^ 1);
  -[UIView setHidden:](self->_doneButtonSpacer, "setHidden:", v3 ^ 1);
  -[NSLayoutConstraint setActive:](self->_lineEqualWidthsConstraint, "setActive:", v3);
  -[UISwitch setOn:](self->_replaceToggleSwitch, "setOn:", v3);
  if (!v3)
  {
    -[UIStackView arrangedSubviews](self->_firstLineControlsStackView, "arrangedSubviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexOfObject:", self->_doneButtonSpacer);

    firstLineControlsStackView = self->_firstLineControlsStackView;
    -[_UIFindNavigatorViewLayout doneButton](self, "doneButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView insertArrangedSubview:atIndex:](firstLineControlsStackView, "insertArrangedSubview:atIndex:", v6, v8 - 1);
  }
  else
  {
    secondLineControlsStackView = self->_secondLineControlsStackView;
    -[_UIFindNavigatorViewLayout doneButton](self, "doneButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](secondLineControlsStackView, "addArrangedSubview:", v6);
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFindNavigatorViewLayout_Mac;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_verticalStackView, "setFrame:");
}

- (UISwitch)replaceToggleSwitch
{
  return self->_replaceToggleSwitch;
}

- (void)setReplaceToggleSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_replaceToggleSwitch, a3);
}

- (UISegmentedControl)nextPreviousSegmentedControl
{
  return self->_nextPreviousSegmentedControl;
}

- (void)setNextPreviousSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_nextPreviousSegmentedControl, a3);
}

- (UISegmentedControl)replaceReplaceAllSegmentedControl
{
  return self->_replaceReplaceAllSegmentedControl;
}

- (void)setReplaceReplaceAllSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_replaceReplaceAllSegmentedControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceReplaceAllSegmentedControl, 0);
  objc_storeStrong((id *)&self->_nextPreviousSegmentedControl, 0);
  objc_storeStrong((id *)&self->_replaceToggleSwitch, 0);
  objc_storeStrong((id *)&self->_lineEqualWidthsConstraint, 0);
  objc_storeStrong((id *)&self->_doneButtonSpacer, 0);
  objc_storeStrong((id *)&self->_secondLineControlsStackView, 0);
  objc_storeStrong((id *)&self->_firstLineControlsStackView, 0);
  objc_storeStrong((id *)&self->_replaceStackView, 0);
  objc_storeStrong((id *)&self->_findStackView, 0);
  objc_storeStrong((id *)&self->_verticalStackView, 0);
}

@end
