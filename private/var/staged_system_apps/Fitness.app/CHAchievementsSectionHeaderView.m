@implementation CHAchievementsSectionHeaderView

- (CHAchievementsSectionHeaderView)initWithFrame:(CGRect)a3
{
  CHAchievementsSectionHeaderView *v3;
  UIView *v4;
  UIView *keyLineView;
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
  uint64_t v17;
  NSLayoutConstraint *keyLineLeadingConstraint;
  UILabel *v19;
  UILabel *label;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSLayoutConstraint *labelLeadingConstraint;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  NSLayoutConstraint *labelTrailingConstraint;
  void *v31;
  objc_super v33;
  CGRect v34;

  v33.receiver = self;
  v33.super_class = (Class)CHAchievementsSectionHeaderView;
  v3 = -[CHAchievementsSectionHeaderView initWithFrame:](&v33, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init((Class)UIView);
    keyLineView = v3->_keyLineView;
    v3->_keyLineView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
    -[UIView setBackgroundColor:](v3->_keyLineView, "setBackgroundColor:", v6);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_keyLineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CHAchievementsSectionHeaderView addSubview:](v3, "addSubview:", v3->_keyLineView);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v3->_keyLineView, "topAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsSectionHeaderView topAnchor](v3, "topAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 0.0));
    objc_msgSend(v9, "setActive:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v3->_keyLineView, "widthAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsSectionHeaderView widthAnchor](v3, "widthAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
    objc_msgSend(v12, "setActive:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v3->_keyLineView, "heightAnchor"));
    if (qword_10083DF88 != -1)
      dispatch_once(&qword_10083DF88, &stru_1007790D8);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToConstant:", *(double *)&qword_10083DF80));
    objc_msgSend(v14, "setActive:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v3->_keyLineView, "leadingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsSectionHeaderView leadingAnchor](v3, "leadingAnchor"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 16.0));
    keyLineLeadingConstraint = v3->_keyLineLeadingConstraint;
    v3->_keyLineLeadingConstraint = (NSLayoutConstraint *)v17;

    -[NSLayoutConstraint setActive:](v3->_keyLineLeadingConstraint, "setActive:", 1);
    v19 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    label = v3->_label;
    v3->_label = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v21);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v3->_label, "setLineBreakMode:", 0);
    -[CHAchievementsSectionHeaderView addSubview:](v3, "addSubview:", v3->_label);
    -[CHAchievementsSectionHeaderView setupLabelFont](v3, "setupLabelFont");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_label, "leadingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsSectionHeaderView leadingAnchor](v3, "leadingAnchor"));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, 16.0));
    labelLeadingConstraint = v3->_labelLeadingConstraint;
    v3->_labelLeadingConstraint = (NSLayoutConstraint *)v24;

    -[NSLayoutConstraint setActive:](v3->_labelLeadingConstraint, "setActive:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v3->_label, "widthAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v27, "bounds");
    v28 = objc_msgSend(v26, "constraintEqualToConstant:", CGRectGetWidth(v34) - 16.0);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    labelTrailingConstraint = v3->_labelTrailingConstraint;
    v3->_labelTrailingConstraint = (NSLayoutConstraint *)v29;

    -[NSLayoutConstraint setActive:](v3->_labelTrailingConstraint, "setActive:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v31, "addObserver:selector:name:object:", v3, "setupLabelFont", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v3;
}

- (void)setHidesKeyLine:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_hidesKeyLine = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CHAchievementsSectionHeaderView keyLineView](self, "keyLineView"));
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)setupLabelFont
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
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(+[CHAchievementsSectionHeaderView _headerConfiguration](CHAchievementsSectionHeaderView, "_headerConfiguration"));
  objc_msgSend(v14, "directionalLayoutMargins");
  -[CHAchievementsSectionHeaderView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "textProperties"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "font"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsSectionHeaderView label](self, "label"));
  objc_msgSend(v5, "setFont:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsSectionHeaderView labelBaselineConstraint](self, "labelBaselineConstraint"));
  objc_msgSend(v6, "setActive:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsSectionHeaderView label](self, "label"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstBaselineAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsSectionHeaderView topAnchor](self, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsSectionHeaderView label](self, "label"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "font"));
  objc_msgSend(v11, "_scaledValueForValue:", 30.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9));
  -[CHAchievementsSectionHeaderView setLabelBaselineConstraint:](self, "setLabelBaselineConstraint:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsSectionHeaderView labelBaselineConstraint](self, "labelBaselineConstraint"));
  objc_msgSend(v13, "setActive:", 1);

}

+ (CGSize)preferredSizeForSectionName:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;
  CGRect v13;

  v3 = a3;
  v4 = objc_alloc_init((Class)UILabel);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CHAchievementsSectionHeaderView headerFont](CHAchievementsSectionHeaderView, "headerFont"));
  objc_msgSend(v4, "setFont:", v5);

  objc_msgSend(v4, "setNumberOfLines:", 0);
  objc_msgSend(v4, "setLineBreakMode:", 0);
  objc_msgSend(v4, "setText:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v6, "bounds");
  v7 = CGRectGetWidth(v13) - 16.0;

  objc_msgSend(v4, "systemLayoutSizeFittingSize:", v7, 1.79769313e308);
  v9 = v8 + 27.5;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (id)headerFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CHAchievementsSectionHeaderView _headerConfiguration](CHAchievementsSectionHeaderView, "_headerConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textProperties"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "font"));

  return v4;
}

- (void)configureWithSectionName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CHAchievementsSectionHeaderView label](self, "label"));
  objc_msgSend(v5, "setText:", v4);

}

+ (id)_headerConfiguration
{
  return +[UIListContentConfiguration extraProminentInsetGroupedHeaderConfiguration](UIListContentConfiguration, "extraProminentInsetGroupedHeaderConfiguration");
}

- (BOOL)hidesKeyLine
{
  return self->_hidesKeyLine;
}

- (UIView)keyLineView
{
  return self->_keyLineView;
}

- (void)setKeyLineView:(id)a3
{
  objc_storeStrong((id *)&self->_keyLineView, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSLayoutConstraint)labelBaselineConstraint
{
  return self->_labelBaselineConstraint;
}

- (void)setLabelBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_labelBaselineConstraint, a3);
}

- (NSLayoutConstraint)labelLeadingConstraint
{
  return self->_labelLeadingConstraint;
}

- (void)setLabelLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_labelLeadingConstraint, a3);
}

- (NSLayoutConstraint)labelTrailingConstraint
{
  return self->_labelTrailingConstraint;
}

- (void)setLabelTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_labelTrailingConstraint, a3);
}

- (NSLayoutConstraint)keyLineLeadingConstraint
{
  return self->_keyLineLeadingConstraint;
}

- (void)setKeyLineLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_keyLineLeadingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyLineLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_labelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_labelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_labelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_keyLineView, 0);
}

@end
