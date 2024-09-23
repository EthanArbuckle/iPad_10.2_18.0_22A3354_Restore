@implementation _UIInterfaceActionLabelsPropertyView

- (_UIInterfaceActionLabelsPropertyView)initWithAction:(id)a3
{
  id v5;
  _UIInterfaceActionLabelsPropertyView *v6;
  _UIInterfaceActionLabelsPropertyView *v7;
  id *p_action;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIInterfaceActionLabelsPropertyView;
  v6 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    p_action = (id *)&v6->_action;
    objc_storeStrong((id *)&v6->_action, a3);
    objc_msgSend(*p_action, "_addActionDisplayPropertyObserver:", v7);
    -[_UIInterfaceActionLabelsPropertyView interfaceAction:reloadDisplayedContentActionProperties:](v7, "interfaceAction:reloadDisplayedContentActionProperties:", *p_action, 0);
    v9 = *p_action;
    objc_msgSend(*p_action, "_visualStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIInterfaceActionLabelsPropertyView interfaceAction:reloadDisplayedContentVisualStyle:](v7, "interfaceAction:reloadDisplayedContentVisualStyle:", v9, v10);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__contentSizeCategoryDidChangeNotification_, CFSTR("UIContentSizeCategoryDidChangeNotification"), 0);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[UIInterfaceAction _removeActionDisplayPropertyObserver:](self->_action, "_removeActionDisplayPropertyObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionLabelsPropertyView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (id)_visualStyle
{
  return -[UIInterfaceAction _visualStyle](self->_action, "_visualStyle");
}

- (void)interfaceAction:(id)a3 reloadDisplayedContentActionProperties:(id)a4
{
  id v5;
  void *v6;
  _BOOL4 v7;
  UILabel *v8;
  UILabel *titleLabel;
  UILabel *v10;
  UILabel *v11;
  NSArray *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *leadingLabelLeadingConstraint;
  void *v23;
  void *v24;
  NSLayoutConstraint *v25;
  NSLayoutConstraint *leadingLabelVerticalPositionConstraint;
  __CFString *v27;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *trailingLabelTrailingConstraint;
  void *v32;
  void *v33;
  NSLayoutConstraint *v34;
  NSLayoutConstraint *v35;
  id v36;
  NSArray *labelConstraints;
  NSArray *v38;
  id v39;

  v5 = a4;
  -[_UIInterfaceActionLabelsPropertyView _reloadContentForTitleDisplayProperties](self, "_reloadContentForTitleDisplayProperties");
  -[_UIInterfaceActionLabelsPropertyView _reloadContentClassificationLabelDisplayProperties](self, "_reloadContentClassificationLabelDisplayProperties");
  -[_UIInterfaceActionLabelsPropertyView _visualStyle](self, "_visualStyle");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "actionPropertiesAffectingLabelStyling");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[UIInterfaceAction changedProperties:containsAny:](UIInterfaceAction, "changedProperties:containsAny:", v5, v6);

  if (v7)
    -[_UIInterfaceActionLabelsPropertyView _applyVisualStyleToLabels](self, "_applyVisualStyleToLabels");
  -[_UIInterfaceActionLabelsPropertyView _classificationLabelIfVisible](self, "_classificationLabelIfVisible");
  v8 = (UILabel *)objc_claimAutoreleasedReturnValue();
  titleLabel = v8;
  if (!v8)
    titleLabel = self->_titleLabel;
  v10 = titleLabel;

  v11 = self->_titleLabel;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](self, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](self->_titleLabel, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 4.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v12, "addObject:", v15);

  -[NSArray lastObject](v12, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 1148837888;
  objc_msgSend(v16, "setPriority:", v17);

  -[NSArray lastObject](v12, "lastObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setIdentifier:", CFSTR("labelsView-heightPlusMargin"));

  -[UIView leadingAnchor](v10, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (NSLayoutConstraint *)(id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v12, "addObject:", v21);
  leadingLabelLeadingConstraint = self->_leadingLabelLeadingConstraint;
  self->_leadingLabelLeadingConstraint = v21;

  -[NSLayoutConstraint setIdentifier:](self->_leadingLabelLeadingConstraint, "setIdentifier:", CFSTR("labelsView-leadingLabel-leading"));
  -[UIView centerYAnchor](v10, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (NSLayoutConstraint *)(id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v12, "addObject:", v25);
  leadingLabelVerticalPositionConstraint = self->_leadingLabelVerticalPositionConstraint;
  self->_leadingLabelVerticalPositionConstraint = v25;

  v27 = CFSTR("labelsView-leadingLabel-verticalPosition");
  -[NSLayoutConstraint setIdentifier:](self->_leadingLabelVerticalPositionConstraint, "setIdentifier:", CFSTR("labelsView-leadingLabel-verticalPosition"));
  -[UIView trailingAnchor](v11, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (NSLayoutConstraint *)(id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v12, "addObject:", v30);
  trailingLabelTrailingConstraint = self->_trailingLabelTrailingConstraint;
  self->_trailingLabelTrailingConstraint = v30;

  -[NSLayoutConstraint setIdentifier:](self->_trailingLabelTrailingConstraint, "setIdentifier:", CFSTR("labelsView-trailingLabel-trailing"));
  -[UIView centerYAnchor](v11, "centerYAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self, "centerYAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (NSLayoutConstraint *)(id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v12, "addObject:", v34);
  v35 = self->_leadingLabelVerticalPositionConstraint;
  self->_leadingLabelVerticalPositionConstraint = v34;

  -[NSLayoutConstraint setIdentifier:](self->_leadingLabelVerticalPositionConstraint, "setIdentifier:", CFSTR("labelsView-leadingLabel-verticalPosition"));
  if (v10 == v11)
  {
    v36 = 0;
  }
  else
  {
    -[UIView trailingAnchor](v10, "trailingAnchor");
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v11, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString constraintEqualToAnchor:](v27, "constraintEqualToAnchor:", v32);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v12, "addObject:", v36);
  }
  objc_storeStrong((id *)&self->_interLabelSpacingConstraint, v36);
  if (v10 != v11)
  {

  }
  -[NSLayoutConstraint setIdentifier:](self->_interLabelSpacingConstraint, "setIdentifier:", CFSTR("labelsView-inter-label-spacing"));
  objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->_labelConstraints);
  labelConstraints = self->_labelConstraints;
  self->_labelConstraints = v12;
  v38 = v12;

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_labelConstraints);
}

- (id)viewForFirstBaselineLayout
{
  return self->_titleLabel;
}

- (id)viewForLastBaselineLayout
{
  return self->_titleLabel;
}

- (void)_applyVisualStyle
{
  void *v3;
  id v4;

  -[_UIInterfaceActionLabelsPropertyView _visualStyle](self, "_visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[_UIInterfaceActionLabelsPropertyView _applyVisualStyleToLabels](self, "_applyVisualStyleToLabels");
    v3 = v4;
  }

}

- (void)_applyVisualStyleToLabels
{
  UILabel *classificationLabel;
  UILabel *v4;
  UILabel *titleLabel;
  void *v6;
  id v7;

  if (-[UIView isHidden](self->_classificationLabel, "isHidden"))
    classificationLabel = 0;
  else
    classificationLabel = self->_classificationLabel;
  v4 = classificationLabel;
  -[_UIInterfaceActionLabelsPropertyView _visualStyle](self, "_visualStyle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  -[_UIInterfaceActionLabelsPropertyView _interfaceActionViewState](self, "_interfaceActionViewState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configureAttributesForTitleLabel:classificationLabel:actionViewState:", titleLabel, v4, v6);

}

- (id)_interfaceActionViewState
{
  void *v3;
  void *v4;

  -[_UIInterfaceActionLabelsPropertyView action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIInterfaceActionViewState viewStateForActionRepresentationViewDescendantView:action:](UIInterfaceActionViewState, "viewStateForActionRepresentationViewDescendantView:action:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_reloadContentForTitleDisplayProperties
{
  UILabel *titleLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  UILabel *v8;
  id v9;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = -[_UIInterfaceActionLabelsPropertyView _newLabel](self, "_newLabel");
    v5 = self->_titleLabel;
    self->_titleLabel = v4;

    -[UIView _setLayoutDebuggingIdentifier:](self->_titleLabel, "_setLayoutDebuggingIdentifier:", CFSTR("titleLabel"));
    titleLabel = self->_titleLabel;
  }
  -[_UIInterfaceActionLabelsPropertyView action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](titleLabel, "setText:", v7);

  v8 = self->_titleLabel;
  -[_UIInterfaceActionLabelsPropertyView action](self, "action");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextAlignment:](v8, "setTextAlignment:", objc_msgSend(v9, "titleAlignment"));

}

- (void)_reloadContentClassificationLabelDisplayProperties
{
  void *v3;
  UILabel *classificationLabel;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  UILabel *v9;
  uint64_t v10;

  -[_UIInterfaceActionLabelsPropertyView _classificationLabelIfVisible](self, "_classificationLabelIfVisible");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  classificationLabel = self->_classificationLabel;
  if (v3)
  {
    if (!classificationLabel)
    {
      v5 = -[_UIInterfaceActionLabelsPropertyView _newLabel](self, "_newLabel");
      v6 = self->_classificationLabel;
      self->_classificationLabel = v5;

      -[UIView _setLayoutDebuggingIdentifier:](self->_titleLabel, "_setLayoutDebuggingIdentifier:", CFSTR("classificationLabel"));
      classificationLabel = self->_classificationLabel;
    }
    -[_UIInterfaceActionLabelsPropertyView action](self, "action");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "classificationTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](classificationLabel, "setText:", v8);

    v9 = self->_classificationLabel;
    v10 = 0;
  }
  else
  {
    v9 = self->_classificationLabel;
    v10 = 1;
  }
  -[UIView setHidden:](v9, "setHidden:", v10);
}

- (id)_classificationLabelIfVisible
{
  UILabel *classificationLabel;

  classificationLabel = self->_classificationLabel;
  if (classificationLabel)
  {
    if (-[UIView isHidden](classificationLabel, "isHidden"))
      classificationLabel = self->_classificationLabel;
    else
      classificationLabel = 0;
  }
  return classificationLabel;
}

- (id)_newLabel
{
  UILabel *v3;
  UILabel *v4;
  void *v5;
  double v6;

  v3 = [UILabel alloc];
  v4 = -[UILabel initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  +[UIColor clearColor](UIColor, "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  -[UILabel setTextAlignment:](v4, "setTextAlignment:", 1);
  LODWORD(v6) = 1148846080;
  -[UIView setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self, "addSubview:", v4);
  return v4;
}

- (UIInterfaceAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_labelConstraints, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_classificationLabel, 0);
  objc_storeStrong((id *)&self->_interLabelSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_trailingLabelVerticalPositionConstraint, 0);
  objc_storeStrong((id *)&self->_trailingLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingLabelVerticalPositionConstraint, 0);
  objc_storeStrong((id *)&self->_leadingLabelLeadingConstraint, 0);
}

@end
