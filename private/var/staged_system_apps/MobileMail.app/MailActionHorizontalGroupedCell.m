@implementation MailActionHorizontalGroupedCell

+ (id)reusableIdentifier
{
  return CFSTR("MailActionHorizontalGroupedCellIdentifier");
}

- (void)configureConstraints
{
  MFMessageDisplayMetrics *v3;
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
  id v24;

  v24 = (id)objc_claimAutoreleasedReturnValue(-[MailActionHorizontalGroupedCell contentView](self, "contentView"));
  v3 = objc_opt_new(MFMessageDisplayMetrics);
  -[MailActionHorizontalGroupedCell setDisplayMetrics:](self, "setDisplayMetrics:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell imageView](self, "imageView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "centerXAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  objc_msgSend(v4, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstBaselineAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
  -[MFMessageDisplayMetrics topToGlyphBaselineInMailActionCardHorizontalGroup](v3, "topToGlyphBaselineInMailActionCardHorizontalGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10));
  -[MailActionHorizontalGroupedCell setTopToBaselineConstraint:](self, "setTopToBaselineConstraint:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionHorizontalGroupedCell topToBaselineConstraint](self, "topToBaselineConstraint"));
  objc_msgSend(v4, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell titleLabel](self, "titleLabel"));
  objc_msgSend(v13, "setTextAlignment:", 1);
  objc_msgSend(v13, "setLineBreakMode:", 0);
  objc_msgSend(v13, "setAllowsDefaultTighteningForTruncation:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 5.0));
  objc_msgSend(v4, "addObject:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -5.0));
  objc_msgSend(v4, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstBaselineAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstBaselineAnchor"));
  -[MFMessageDisplayMetrics baselineToBaselineSpacingInMailActionCardHorizontalGroup](v3, "baselineToBaselineSpacingInMailActionCardHorizontalGroup");
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21));
  -[MailActionHorizontalGroupedCell setBaselineToBaselineConstraint:](self, "setBaselineToBaselineConstraint:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionHorizontalGroupedCell baselineToBaselineConstraint](self, "baselineToBaselineConstraint"));
  objc_msgSend(v4, "addObject:", v23);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v4);
}

- (void)updateConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MailActionHorizontalGroupedCell;
  -[MailActionHorizontalGroupedCell updateConstraints](&v10, "updateConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionHorizontalGroupedCell displayMetrics](self, "displayMetrics"));
  objc_msgSend(v3, "topToGlyphBaselineInMailActionCardHorizontalGroup");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionHorizontalGroupedCell topToBaselineConstraint](self, "topToBaselineConstraint"));
  objc_msgSend(v6, "setConstant:", v5);

  objc_msgSend(v3, "baselineToBaselineSpacingInMailActionCardHorizontalGroup");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionHorizontalGroupedCell baselineToBaselineConstraint](self, "baselineToBaselineConstraint"));
  objc_msgSend(v9, "setConstant:", v8);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MailActionHorizontalGroupedCell;
  -[MailActionCell traitCollectionDidChange:](&v5, "traitCollectionDidChange:", v4);
  -[MailActionHorizontalGroupedCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (BOOL)isHorizontalActionCell
{
  return 1;
}

- (MFMessageDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (void)setDisplayMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_displayMetrics, a3);
}

- (NSLayoutConstraint)topToBaselineConstraint
{
  return self->_topToBaselineConstraint;
}

- (void)setTopToBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topToBaselineConstraint, a3);
}

- (NSLayoutConstraint)baselineToBaselineConstraint
{
  return self->_baselineToBaselineConstraint;
}

- (void)setBaselineToBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_baselineToBaselineConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baselineToBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_topToBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
}

@end
