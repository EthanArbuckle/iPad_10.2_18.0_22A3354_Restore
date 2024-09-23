@implementation BESearchResultTableViewCell

- (BESearchResultTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  BESearchResultTableViewCell *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  BKShapeView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  UILabel *titleLabel;
  UILabel *v21;
  BESearchResultLabel *v22;
  void *v23;
  uint64_t v24;
  BESearchResultLabel *resultLabel;
  BESearchResultLabel *v26;
  BETableViewCellPageNumberLabel *v27;
  BETableViewCellPageNumberLabel *pageNumberLabel;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  _QWORD v37[4];

  v36.receiver = self;
  v36.super_class = (Class)BESearchResultTableViewCell;
  v4 = -[BESearchResultTableViewCell initWithStyle:reuseIdentifier:](&v36, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc((Class)UIView);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v6, "bounds");
    v7 = objc_msgSend(v5, "initWithFrame:");
    -[BESearchResultTableViewCell setSelectedBackgroundView:](v4, "setSelectedBackgroundView:", v7);

    -[BESearchResultTableViewCell setFocusEffect:](v4, "setFocusEffect:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v8, "setAutoresizingMask:", 18);
    v9 = objc_opt_new(BKShapeView);
    -[BKShapeView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
    -[BKShapeView setFillColor:](v9, "setFillColor:", v10);

    objc_msgSend(v8, "addSubview:", v9);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKShapeView leftAnchor](v9, "leftAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leftAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, 5.0));
    v37[0] = v33;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKShapeView rightAnchor](v9, "rightAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rightAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, -5.0));
    v37[1] = v30;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKShapeView topAnchor](v9, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 5.0));
    v37[2] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKShapeView bottomAnchor](v9, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, -5.0));
    v37[3] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

    -[BESearchResultTableViewCell _updateFocusShapePath](v4, "_updateFocusShapePath");
    -[BKShapeView setAlpha:](v9, "setAlpha:", 0.0);
    -[BESearchResultTableViewCell setFocusShapeView:](v4, "setFocusShapeView:", v9);
    v18 = (UILabel *)objc_alloc_init((Class)UILabel);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 17.0));
    -[UILabel setFont:](v18, "setFont:", v19);

    -[UILabel setLineBreakMode:](v18, "setLineBreakMode:", 5);
    -[UILabel setHighlightedTextColor:](v18, "setHighlightedTextColor:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "addSubview:", v18);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v18;
    v21 = v18;

    v22 = objc_alloc_init(BESearchResultLabel);
    -[BESearchResultLabel setOpaque:](v22, "setOpaque:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
    -[BESearchResultLabel setFont:](v22, "setFont:", v23);

    if (isPad())
      v24 = 3;
    else
      v24 = 2;
    -[BESearchResultLabel setNumberOfLines:](v22, "setNumberOfLines:", v24);
    -[BESearchResultLabel setHighlightedTextColor:](v22, "setHighlightedTextColor:", 0);
    -[BESearchResultLabel setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "addSubview:", v22);
    resultLabel = v4->_resultLabel;
    v4->_resultLabel = v22;
    v26 = v22;

    v27 = objc_alloc_init(BETableViewCellPageNumberLabel);
    -[BETableViewCellPageNumberLabel setTranslatesAutoresizingMaskIntoConstraints:](v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "addSubview:", v27);
    pageNumberLabel = v4->_pageNumberLabel;
    v4->_pageNumberLabel = v27;

    -[BESearchResultTableViewCell applyLabelFonts](v4, "applyLabelFonts");
  }
  return v4;
}

- (void)applyLabelFonts
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
  objc_msgSend(v3, "_scaledValueForValue:", 17.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v4);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
  -[BESearchResultLabel setFont:](self->_resultLabel, "setFont:", v5);
  -[BETableViewCellPageNumberLabel setFont:](self->_pageNumberLabel, "setFont:", v5);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BESearchResultTableViewCell;
  -[BESearchResultTableViewCell prepareForReuse](&v3, "prepareForReuse");
  -[UILabel setText:](self->_titleLabel, "setText:", 0);
  -[BESearchResultLabel setText:](self->_resultLabel, "setText:", 0);
  -[BETableViewCellPageNumberLabel setText:](self->_pageNumberLabel, "setText:", 0);
  -[BESearchResultLabel setBoldRange:](self->_resultLabel, "setBoldRange:", 0, 0);
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
  -[BESearchResultTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (id)regularTextConstraints
{
  UILabel *titleLabel;
  BESearchResultLabel *resultLabel;
  BETableViewCellPageNumberLabel *v5;
  UILabel *v6;
  void *v7;
  UILabel *v8;
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
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  id v39;
  id v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  UILabel *v49;
  BETableViewCellPageNumberLabel *v50;
  void *v51;
  BESearchResultLabel *v52;
  _QWORD v53[3];
  _QWORD v54[4];
  _QWORD v55[3];

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultTableViewCell contentView](self, "contentView"));
  titleLabel = self->_titleLabel;
  resultLabel = self->_resultLabel;
  v5 = self->_pageNumberLabel;
  v52 = resultLabel;
  v6 = titleLabel;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "layoutMarginsGuide"));
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v6, "topAnchor"));
  v51 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v55[0] = v11;
  v49 = v6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v6, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  v55[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v8, "trailingAnchor"));
  v50 = v5;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BETableViewCellPageNumberLabel leadingAnchor](v5, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:constant:", v16, -15.0));
  v55[2] = v17;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v55, 3));

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[BETableViewCellPageNumberLabel leadingAnchor](v5, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel leadingAnchor](v52, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v49, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
  v54[0] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel trailingAnchor](v52, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v46, -4.0));
  v54[1] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel topAnchor](v52, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v49, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
  v54[2] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel bottomAnchor](v52, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
  v54[3] = v26;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v54, 4));

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BETableViewCellPageNumberLabel trailingAnchor](v50, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
  v53[0] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BETableViewCellPageNumberLabel centerYAnchor](v50, "centerYAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v49, "centerYAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintGreaterThanOrEqualToAnchor:", v31));
  v53[1] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[BETableViewCellPageNumberLabel topAnchor](v50, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintGreaterThanOrEqualToAnchor:constant:", v34, 4.0));
  v53[2] = v35;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, 3));

  LODWORD(v36) = 1132068864;
  -[UILabel setContentCompressionResistancePriority:forAxis:](v49, "setContentCompressionResistancePriority:forAxis:", 0, v36);
  LODWORD(v37) = 1132068864;
  -[BESearchResultLabel setContentCompressionResistancePriority:forAxis:](v52, "setContentCompressionResistancePriority:forAxis:", 0, v37);
  LODWORD(v38) = 1144750080;
  -[BETableViewCellPageNumberLabel setContentCompressionResistancePriority:forAxis:](v50, "setContentCompressionResistancePriority:forAxis:", 0, v38);

  v39 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v39, "addObjectsFromArray:", v47);
  objc_msgSend(v39, "addObjectsFromArray:", v45);
  objc_msgSend(v39, "addObjectsFromArray:", v44);
  v40 = objc_msgSend(v39, "copy");

  return v40;
}

- (id)largerTextConstraints
{
  UILabel *titleLabel;
  BESearchResultLabel *resultLabel;
  UILabel *v5;
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
  id v34;
  id v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  BETableViewCellPageNumberLabel *v43;
  void *v44;
  void *v45;
  UILabel *v46;
  BESearchResultLabel *v47;
  _QWORD v48[4];
  _QWORD v49[3];
  _QWORD v50[3];

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultTableViewCell contentView](self, "contentView"));
  titleLabel = self->_titleLabel;
  resultLabel = self->_resultLabel;
  v43 = self->_pageNumberLabel;
  v47 = resultLabel;
  v5 = titleLabel;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "layoutMarginsGuide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v5, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
  v50[0] = v9;
  v46 = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v50[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v50[2] = v15;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 3));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel leadingAnchor](v47, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v46, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
  v49[0] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel trailingAnchor](v47, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
  v49[1] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel topAnchor](v47, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v46, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
  v49[2] = v24;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 3));

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[BETableViewCellPageNumberLabel leadingAnchor](v43, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
  v48[0] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[BETableViewCellPageNumberLabel trailingAnchor](v43, "trailingAnchor"));
  v41 = v6;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v25));
  v48[1] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BETableViewCellPageNumberLabel topAnchor](v43, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel bottomAnchor](v47, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
  v48[2] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BETableViewCellPageNumberLabel bottomAnchor](v43, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v31));
  v48[3] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 4));

  v34 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v34, "addObjectsFromArray:", v44);
  objc_msgSend(v34, "addObjectsFromArray:", v42);
  objc_msgSend(v34, "addObjectsFromArray:", v33);
  v35 = objc_msgSend(v34, "copy");

  return v35;
}

- (BOOL)_pageNumberLabelOnOwnLine
{
  return +[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BESearchResultTableViewCell;
  -[BESearchResultTableViewCell layoutSubviews](&v3, "layoutSubviews");
  -[BESearchResultTableViewCell _updateResultLabelMaxWidth](self, "_updateResultLabelMaxWidth");
  -[BESearchResultTableViewCell _updateFocusShapePath](self, "_updateFocusShapePath");
}

- (void)updateConstraints
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  if (-[BESearchResultTableViewCell _pageNumberLabelOnOwnLine](self, "_pageNumberLabelOnOwnLine"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultTableViewCell regularTextConstraints](self, "regularTextConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v3);

    v4 = objc_claimAutoreleasedReturnValue(-[BESearchResultTableViewCell largerTextConstraints](self, "largerTextConstraints"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultTableViewCell largerTextConstraints](self, "largerTextConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v5);

    v4 = objc_claimAutoreleasedReturnValue(-[BESearchResultTableViewCell regularTextConstraints](self, "regularTextConstraints"));
  }
  v6 = (void *)v4;
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v4);

  -[BESearchResultTableViewCell _updateResultLabelMaxWidth](self, "_updateResultLabelMaxWidth");
  v7.receiver = self;
  v7.super_class = (Class)BESearchResultTableViewCell;
  -[BESearchResultTableViewCell updateConstraints](&v7, "updateConstraints");
}

- (void)_updateResultLabelMaxWidth
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  CGRect v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultTableViewCell readableContentGuide](self, "readableContentGuide"));
  objc_msgSend(v3, "layoutFrame");
  v4 = CGRectGetWidth(v13) + -30.0;

  -[BESearchResultTableViewCell maxWidth](self, "maxWidth");
  v6 = v5 + -60.0;
  -[BESearchResultTableViewCell safeAreaInsets](self, "safeAreaInsets");
  v8 = v7;
  -[BESearchResultTableViewCell safeAreaInsets](self, "safeAreaInsets");
  if (v4 >= v6 - (v8 + v9))
    v4 = v6 - (v8 + v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultTableViewCell pageNumberLabel](self, "pageNumberLabel"));
  objc_msgSend(v10, "intrinsicContentSize");
  v12 = v11;

  -[BESearchResultLabel setPreferredMaxLayoutWidth:](self->_resultLabel, "setPreferredMaxLayoutWidth:", v4 - (v12 + 4.0));
}

- (void)_updateFocusShapePath
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BESearchResultTableViewCell focusShapeView](self, "focusShapeView"));
  objc_msgSend(v5, "bounds");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultTableViewCell focusShapeView](self, "focusShapeView"));
  objc_msgSend(v4, "setPath:", v3);

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultTableViewCell contentView](self, "contentView"));
  objc_msgSend(v2, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  BESearchResultTableViewCell *v17;
  id v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "type") != &dword_4)
    goto LABEL_14;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v9)
  {

LABEL_14:
    v19.receiver = self;
    v19.super_class = (Class)BESearchResultTableViewCell;
    -[BESearchResultTableViewCell pressesBegan:withEvent:](&v19, "pressesBegan:withEvent:", v6, v7);
    goto LABEL_15;
  }
  v10 = v9;
  v17 = self;
  v18 = v6;
  v11 = 0;
  v12 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v21 != v12)
        objc_enumerationMutation(v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "key", v17, v18));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "characters"));
      v16 = objc_msgSend(v15, "isEqual:", CFSTR("\r"));

      if (v16)
        v11 = 1;
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  }
  while (v10);

  self = v17;
  v6 = v18;
  if ((v11 & 1) == 0)
    goto LABEL_14;
LABEL_15:

}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BESearchResultTableViewCell;
  -[BESearchResultTableViewCell pressesChanged:withEvent:](&v4, "pressesChanged:withEvent:", a3, a4);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BESearchResultTableViewCell;
  -[BESearchResultTableViewCell pressesCancelled:withEvent:](&v4, "pressesCancelled:withEvent:", a3, a4);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  BESearchResultTableViewCell *v23;
  id v24;
  objc_super v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "type") != &dword_4)
    goto LABEL_18;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v9)
  {

LABEL_18:
    v25.receiver = self;
    v25.super_class = (Class)BESearchResultTableViewCell;
    -[BESearchResultTableViewCell pressesEnded:withEvent:](&v25, "pressesEnded:withEvent:", v6, v7);
    goto LABEL_19;
  }
  v10 = v9;
  v23 = self;
  v24 = v6;
  v11 = 0;
  v12 = *(_QWORD *)v27;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v27 != v12)
        objc_enumerationMutation(v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "key", v23));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "characters"));
      v16 = objc_msgSend(v15, "isEqual:", CFSTR("\r"));

      if (v16)
        v11 = 1;
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  }
  while (v10);

  self = v23;
  v6 = v24;
  if ((v11 & 1) == 0)
    goto LABEL_18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultTableViewCell _tableView](v23, "_tableView"));
  v18 = v17;
  if (v17)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "indexPathForCell:", v23));
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "delegate"));
      v21 = objc_msgSend(v20, "tableView:willSelectRowAtIndexPath:", v18, v19);

      objc_msgSend(v18, "selectRowAtIndexPath:animated:scrollPosition:", v19, 1, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "delegate"));
      objc_msgSend(v22, "tableView:didSelectRowAtIndexPath:", v18, v19);

    }
  }

LABEL_19:
}

- (id)accessibilityLabel
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_titleLabel, "text"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_titleLabel, "text"));
    objc_msgSend(v3, "addObject:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel text](self->_resultLabel, "text"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BESearchResultLabel text](self->_resultLabel, "text"));
    objc_msgSend(v3, "addObject:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BETableViewCellPageNumberLabel text](self->_pageNumberLabel, "text"));
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    v12 = IMCommonCoreBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Page %@"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BETableViewCellPageNumberLabel text](self->_pageNumberLabel, "text"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15));
    objc_msgSend(v3, "addObject:", v16);

  }
  v17 = IMCommonCoreBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR(", "), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", v19));

  return v20;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (BESearchResultLabel)resultLabel
{
  return self->_resultLabel;
}

- (void)setResultLabel:(id)a3
{
  objc_storeStrong((id *)&self->_resultLabel, a3);
}

- (BETableViewCellPageNumberLabel)pageNumberLabel
{
  return self->_pageNumberLabel;
}

- (void)setPageNumberLabel:(id)a3
{
  objc_storeStrong((id *)&self->_pageNumberLabel, a3);
}

- (BKShapeView)focusShapeView
{
  return self->_focusShapeView;
}

- (void)setFocusShapeView:(id)a3
{
  objc_storeStrong((id *)&self->_focusShapeView, a3);
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (BOOL)_constrainResultLabelForPageNumber
{
  return self->__constrainResultLabelForPageNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusShapeView, 0);
  objc_storeStrong((id *)&self->_pageNumberLabel, 0);
  objc_storeStrong((id *)&self->_resultLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
