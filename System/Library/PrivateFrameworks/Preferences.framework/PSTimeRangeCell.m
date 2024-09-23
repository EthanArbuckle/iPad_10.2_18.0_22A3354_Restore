@implementation PSTimeRangeCell

- (PSTimeRangeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  PSTimeRangeCell *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UILabel *fromTitle;
  void *v17;
  uint64_t v18;
  UILabel *toTitle;
  void *v20;
  uint64_t v21;
  UILabel *fromTime;
  uint64_t v23;
  UILabel *toTime;
  void *v25;
  objc_super v27;

  v8 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PSTimeRangeCell;
  v9 = -[PSTimeRangeCell initWithStyle:reuseIdentifier:](&v27, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v9)
  {
    objc_msgSend(v8, "target");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "conformsToProtocol:", &unk_1EE72CF18);

    if (v11)
    {
      objc_msgSend(v8, "target");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v9->_delegate, v12);

    }
    -[PSTableCell titleLabel](v9, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "font");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    CreateRangeTitleLabel();
    v15 = objc_claimAutoreleasedReturnValue();
    fromTitle = v9->_fromTitle;
    v9->_fromTitle = (UILabel *)v15;

    PS_LocalizedString(CFSTR("FROM"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v9->_fromTitle, "setText:", v17);

    -[UILabel setFont:](v9->_fromTitle, "setFont:", v14);
    CreateRangeTitleLabel();
    v18 = objc_claimAutoreleasedReturnValue();
    toTitle = v9->_toTitle;
    v9->_toTitle = (UILabel *)v18;

    PS_LocalizedString(CFSTR("TO"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v9->_toTitle, "setText:", v20);

    -[UILabel setFont:](v9->_toTitle, "setFont:", v14);
    CreateRangeTimeLabel();
    v21 = objc_claimAutoreleasedReturnValue();
    fromTime = v9->_fromTime;
    v9->_fromTime = (UILabel *)v21;

    -[UILabel setFont:](v9->_fromTime, "setFont:", v14);
    CreateRangeTimeLabel();
    v23 = objc_claimAutoreleasedReturnValue();
    toTime = v9->_toTime;
    v9->_toTime = (UILabel *)v23;

    -[UILabel setFont:](v9->_toTime, "setFont:", v14);
    -[PSTimeRangeCell contentView](v9, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v9->_fromTitle);
    objc_msgSend(v25, "addSubview:", v9->_toTitle);
    objc_msgSend(v25, "addSubview:", v9->_fromTime);
    objc_msgSend(v25, "addSubview:", v9->_toTime);
    -[PSTimeRangeCell layoutSubviews](v9, "layoutSubviews");

  }
  return v9;
}

- (void)layoutSubviews
{
  PSTimeRangeCellDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "fromDetailForCell:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v6, "toDetailForCell:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setText:](self->_fromTime, "setText:", v5);
  -[UILabel setText:](self->_toTime, "setText:", v7);
  v8.receiver = self;
  v8.super_class = (Class)PSTimeRangeCell;
  -[PSTableCell layoutSubviews](&v8, sel_layoutSubviews);
  -[PSTimeRangeCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (void)updateConstraints
{
  char v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  _BOOL4 IsAccessibilityCategory;
  NSArray *v16;
  NSArray *constraints;
  objc_super v18;

  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_constraints);
  v3 = -[PSTimeRangeCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PSTimeRangeCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  if ((v3 & 1) != 0)
  {
    -[PSTimeRangeCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    objc_msgSend(v7, "numberWithDouble:", v9 - v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _NSDictionaryOfVariableBindings(CFSTR("_fromTitle, _toTitle, _fromTime, _toTime"), self->_fromTitle, self->_toTitle, self->_fromTime, self->_toTime, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("margin"), v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTimeRangeCell traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferredContentSizeCategory");
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v14);

  if (IsAccessibilityCategory)
    -[PSTimeRangeCell accessibilityConstraintsWithVariableBindings:metrics:](self, "accessibilityConstraintsWithVariableBindings:metrics:", v11, v12);
  else
    -[PSTimeRangeCell regularConstraintsWithVariableBindings:metrics:](self, "regularConstraintsWithVariableBindings:metrics:", v11, v12);
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  constraints = self->_constraints;
  self->_constraints = v16;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constraints);
  v18.receiver = self;
  v18.super_class = (Class)PSTimeRangeCell;
  -[PSTimeRangeCell updateConstraints](&v18, sel_updateConstraints);

}

- (id)regularConstraintsWithVariableBindings:(id)a3 metrics:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0CB3718];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-margin-[_fromTitle]-(>=2.0)-[_fromTime]-|"), 0, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-margin-[_toTitle]-(>=2.0)-[_toTime]-|"), 0, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[_fromTitle]-(>=2.0)-[_toTitle]-|"), 0, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[_fromTime]-(>=2.0)-[_toTime]-|"), 0, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)accessibilityConstraintsWithVariableBindings:(id)a3 metrics:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = (void *)MEMORY[0x1E0CB3718];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-margin-[_fromTitle]-|"), 0, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-margin-[_fromTime]-|"), 0, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-margin-[_toTitle]-|"), 0, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-margin-[_toTime]-|"), 0, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[_fromTitle]-[_fromTime]-[_toTitle]-[_toTime]-|"), 0, v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_toTime, 0);
  objc_storeStrong((id *)&self->_fromTime, 0);
  objc_storeStrong((id *)&self->_toTitle, 0);
  objc_storeStrong((id *)&self->_fromTitle, 0);
}

@end
