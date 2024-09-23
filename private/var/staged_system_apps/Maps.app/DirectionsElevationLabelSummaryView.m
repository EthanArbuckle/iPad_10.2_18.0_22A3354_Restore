@implementation DirectionsElevationLabelSummaryView

- (DirectionsElevationLabelSummaryView)initWithFrame:(CGRect)a3
{
  DirectionsElevationLabelSummaryView *v3;
  DirectionsElevationLabelView *v4;
  DirectionsElevationLabelView *ascentLabel;
  DirectionsElevationLabelView *v6;
  DirectionsElevationLabelView *descentLabel;
  id v8;
  void *v9;
  UIStackView *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIStackView *labelStack;
  UIStackView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;
  _QWORD v32[4];
  _QWORD v33[2];

  v31.receiver = self;
  v31.super_class = (Class)DirectionsElevationLabelSummaryView;
  v3 = -[DirectionsElevationLabelSummaryView initWithFrame:](&v31, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[DirectionsElevationLabelView initWithStyle:]([DirectionsElevationLabelView alloc], "initWithStyle:", 0);
    ascentLabel = v3->_ascentLabel;
    v3->_ascentLabel = v4;

    v6 = -[DirectionsElevationLabelView initWithStyle:]([DirectionsElevationLabelView alloc], "initWithStyle:", 1);
    descentLabel = v3->_descentLabel;
    v3->_descentLabel = v6;

    v8 = objc_alloc((Class)UIStackView);
    v33[0] = v3->_ascentLabel;
    v33[1] = v3->_descentLabel;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2));
    v10 = (UIStackView *)objc_msgSend(v8, "initWithArrangedSubviews:", v9);

    -[UIStackView setAccessibilityIdentifier:](v10, "setAccessibilityIdentifier:", CFSTR("DirectionsElevationLabelStack"));
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setDistribution:](v10, "setDistribution:", 2);
    -[UIStackView setAlignment:](v10, "setAlignment:", 0);
    LODWORD(v11) = 1132068864;
    -[UIStackView setContentHuggingPriority:forAxis:](v10, "setContentHuggingPriority:forAxis:", 0, v11);
    LODWORD(v12) = 1148846080;
    -[UIStackView setContentHuggingPriority:forAxis:](v10, "setContentHuggingPriority:forAxis:", 1, v12);
    LODWORD(v13) = 1148829696;
    -[UIStackView setContentCompressionResistancePriority:forAxis:](v10, "setContentCompressionResistancePriority:forAxis:", 0, v13);
    LODWORD(v14) = 1148846080;
    -[UIStackView setContentCompressionResistancePriority:forAxis:](v10, "setContentCompressionResistancePriority:forAxis:", 1, v14);
    -[DirectionsElevationLabelSummaryView addSubview:](v3, "addSubview:", v10);
    labelStack = v3->_labelStack;
    v3->_labelStack = v10;
    v16 = v10;

    v3->_stackVertically = -[DirectionsElevationLabelSummaryView _shouldStackVertically](v3, "_shouldStackVertically");
    -[DirectionsElevationLabelSummaryView _updateStackViewMetrics](v3, "_updateStackViewMetrics");
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v16, "topAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationLabelSummaryView topAnchor](v3, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
    v32[0] = v28;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v16, "leadingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationLabelSummaryView leadingAnchor](v3, "leadingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
    v32[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationLabelSummaryView bottomAnchor](v3, "bottomAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v16, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    v32[2] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationLabelSummaryView trailingAnchor](v3, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v16, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:", v22));
    v32[3] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

    +[DynamicTypeWizard makeObject:performSelector:whenSizeCategoryChangesWithOrder:](DynamicTypeWizard, "makeObject:performSelector:whenSizeCategoryChangesWithOrder:", v3, "_contentSizeCategoryDidChange", 0);
  }
  return v3;
}

- (void)setAscent:(id)a3 descent:(id)a4
{
  DirectionsElevationLabelView *ascentLabel;
  id v7;

  ascentLabel = self->_ascentLabel;
  v7 = a4;
  -[DirectionsElevationLabelView setElevation:](ascentLabel, "setElevation:", a3);
  -[DirectionsElevationLabelView setElevation:](self->_descentLabel, "setElevation:", v7);

}

- (void)setFont:(id)a3
{
  DirectionsElevationLabelView *ascentLabel;
  id v5;

  ascentLabel = self->_ascentLabel;
  v5 = a3;
  -[DirectionsElevationLabelView setFont:](ascentLabel, "setFont:", v5);
  -[DirectionsElevationLabelView setFont:](self->_descentLabel, "setFont:", v5);

}

- (void)setFont:(id)a3 color:(id)a4
{
  DirectionsElevationLabelView *ascentLabel;
  id v7;
  id v8;

  ascentLabel = self->_ascentLabel;
  v7 = a4;
  v8 = a3;
  -[DirectionsElevationLabelView setFont:color:](ascentLabel, "setFont:color:", v8, v7);
  -[DirectionsElevationLabelView setFont:color:](self->_descentLabel, "setFont:color:", v8, v7);

}

- (void)_contentSizeCategoryDidChange
{
  -[DirectionsElevationLabelSummaryView _updateShouldStackVertically](self, "_updateShouldStackVertically");
}

- (void)_updateShouldStackVertically
{
  _BOOL4 v3;

  v3 = -[DirectionsElevationLabelSummaryView _shouldStackVertically](self, "_shouldStackVertically");
  if (self->_stackVertically != v3)
  {
    self->_stackVertically = v3;
    -[DirectionsElevationLabelSummaryView _updateStackViewMetrics](self, "_updateStackViewMetrics");
    -[DirectionsElevationLabelSummaryView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (BOOL)_shouldStackVertically
{
  void *v2;
  NSString *v3;
  BOOL IsAccessibilityCategory;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationLabelSummaryView traitCollection](self, "traitCollection"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (void)_updateStackViewMetrics
{
  _BOOL4 stackVertically;
  UIStackView *labelStack;
  double v5;

  stackVertically = self->_stackVertically;
  labelStack = self->_labelStack;
  if (stackVertically)
    v5 = 2.0;
  else
    v5 = 8.0;
  -[UIStackView setAxis:](labelStack, "setAxis:");
  -[UIStackView setSpacing:](self->_labelStack, "setSpacing:", v5);
}

- (id)viewForFirstBaselineLayout
{
  return -[UIStackView viewForFirstBaselineLayout](self->_labelStack, "viewForFirstBaselineLayout");
}

- (id)viewForLastBaselineLayout
{
  return -[UIStackView viewForLastBaselineLayout](self->_labelStack, "viewForLastBaselineLayout");
}

- (id)accessibilityIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (DirectionsElevationLabelView)ascentLabel
{
  return self->_ascentLabel;
}

- (DirectionsElevationLabelView)descentLabel
{
  return self->_descentLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descentLabel, 0);
  objc_storeStrong((id *)&self->_ascentLabel, 0);
  objc_storeStrong((id *)&self->_labelStack, 0);
}

@end
