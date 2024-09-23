@implementation CollectionsFilterCell

- (CollectionsFilterCell)initWithFrame:(CGRect)a3
{
  CollectionsFilterCell *v3;
  CollectionsFilterCell *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CollectionsFilterCell;
  v3 = -[CollectionsFilterCell initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[CollectionsFilterCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    -[CollectionsFilterCell setupSubviews](v4, "setupSubviews");
    -[CollectionsFilterCell setupConstraints](v4, "setupConstraints");
    -[CollectionsFilterCell setUpCornerRadius](v4, "setUpCornerRadius");
  }
  return v4;
}

- (void)configureWithModel:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CollectionsFilterCell setViewModel:](self, "setViewModel:", a3);
  -[CollectionsFilterCell updateUI](self, "updateUI");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell selectedBackgroundView](self, "selectedBackgroundView"));
  objc_msgSend(v4, "setAlpha:", 0.0);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell selectedBackgroundView](self, "selectedBackgroundView"));
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CollectionsFilterCell;
  -[CollectionsFilterCell prepareForReuse](&v7, "prepareForReuse");
  -[CollectionsFilterCell setViewModel:](self, "setViewModel:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell filterLabel](self, "filterLabel"));
  objc_msgSend(v3, "setText:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell filterLabel](self, "filterLabel"));
  objc_msgSend(v4, "setTextColor:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell contentView](self, "contentView"));
  objc_msgSend(v5, "setBackgroundColor:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell selectedBackgroundView](self, "selectedBackgroundView"));
  objc_msgSend(v6, "setBackgroundColor:", 0);

}

- (void)setupSubviews
{
  if (MapsFeature_IsEnabled_Maps269(self, a2))
    -[CollectionsFilterCell setupSelectedBackgroundView](self, "setupSelectedBackgroundView");
  -[CollectionsFilterCell setFilterLabel](self, "setFilterLabel");
}

- (void)setupSelectedBackgroundView
{
  id v3;

  v3 = objc_alloc_init((Class)UIView);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "_setContinuousCornerRadius:", 16.0);
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CollectionsFilterCellBackground"));
  -[CollectionsFilterCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v3);

}

- (void)setFilterLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[CollectionsFilterCell setFilterLabel:](self, "setFilterLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell filterLabel](self, "filterLabel"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell filterLabel](self, "filterLabel"));
  objc_msgSend(v5, "setTextAlignment:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell filterLabel](self, "filterLabel"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell filterLabel](self, "filterLabel"));
  objc_msgSend(v8, "setNumberOfLines:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell filterLabel](self, "filterLabel"));
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("CollectionsFilterCellLabel"));

  v11 = (id)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell filterLabel](self, "filterLabel"));
  objc_msgSend(v11, "addSubview:", v10);

}

- (void)setupConstraints
{
  uint64_t v3;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  _QWORD v47[4];
  _QWORD v48[4];

  v46 = objc_alloc_init((Class)NSMutableArray);
  if (MapsFeature_IsEnabled_Maps269(v46, v3))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell selectedBackgroundView](self, "selectedBackgroundView"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell contentView](self, "contentView"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "leadingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v38));
    v48[0] = v36;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell selectedBackgroundView](self, "selectedBackgroundView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell contentView](self, "contentView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v28));
    v48[1] = v26;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell selectedBackgroundView](self, "selectedBackgroundView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell contentView](self, "contentView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v4));
    v48[2] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell selectedBackgroundView](self, "selectedBackgroundView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell contentView](self, "contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v9));
    v48[3] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 4));
    objc_msgSend(v46, "addObjectsFromArray:", v11);

  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell filterLabel](self, "filterLabel"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell contentView](self, "contentView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v39));
  v47[0] = v37;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell filterLabel](self, "filterLabel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell contentView](self, "contentView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v29));
  v47[1] = v27;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell filterLabel](self, "filterLabel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v13));
  v47[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell filterLabel](self, "filterLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  v47[3] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 4));
  objc_msgSend(v46, "addObjectsFromArray:", v20);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v46);
}

- (void)setUpSelectedShadows
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell layer](self, "layer"));
  objc_msgSend(v3, "setMasksToBounds:", 0);

  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  v5 = objc_msgSend(v4, "CGColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell layer](self, "layer"));
  objc_msgSend(v6, "setShadowColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell layer](self, "layer"));
  LODWORD(v8) = 1036831949;
  objc_msgSend(v7, "setShadowOpacity:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell layer](self, "layer"));
  objc_msgSend(v9, "setShadowOffset:", 0.0, 1.0);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell layer](self, "layer"));
  objc_msgSend(v10, "setShadowRadius:", 4.0);

}

- (void)setUpUnselectedShadows
{
  void *v3;
  double v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell layer](self, "layer"));
  LODWORD(v4) = 0;
  objc_msgSend(v3, "setShadowOpacity:", v4);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell layer](self, "layer"));
  objc_msgSend(v5, "setShadowRadius:", 0.0);

}

- (void)setUpCornerRadius
{
  int IsEnabled_Maps269;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  IsEnabled_Maps269 = MapsFeature_IsEnabled_Maps269(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell contentView](self, "contentView"));
  v5 = v4;
  if (IsEnabled_Maps269)
  {
    objc_msgSend(v4, "_setContinuousCornerRadius:", 16.0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell contentView](self, "contentView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
    objc_msgSend(v7, "setMasksToBounds:", 1);

    if (MapsFeature_IsEnabled_Maps269(v8, v9))
      v10 = 0.5;
    else
      v10 = 1.0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell contentView](self, "contentView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
    objc_msgSend(v12, "setBorderWidth:", v10);

    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor")));
    v13 = objc_msgSend(v16, "CGColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell contentView](self, "contentView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layer"));
    objc_msgSend(v15, "setBorderColor:", v13);

  }
  else
  {
    objc_msgSend(v4, "_setContinuousCornerRadius:", 8.0);

    v16 = (id)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell contentView](self, "contentView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layer"));
    objc_msgSend(v14, "setMasksToBounds:", 1);
  }

}

- (void)setUpSelectedBorder
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
  v3 = objc_msgSend(v6, "CGColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  objc_msgSend(v5, "setBorderColor:", v3);

}

- (void)setUpUnselectedBorder
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (MapsFeature_IsEnabled_Maps269(self, a2))
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray3Color](UIColor, "systemGray3Color"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor"));
  v7 = objc_retainAutorelease(v3);
  v4 = objc_msgSend(v7, "CGColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
  objc_msgSend(v6, "setBorderColor:", v4);

}

- (void)updateUI
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
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell viewModel](self, "viewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filterTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell filterLabel](self, "filterLabel"));
  objc_msgSend(v5, "setText:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell viewModel](self, "viewModel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell filterLabel](self, "filterLabel"));
  objc_msgSend(v8, "setTextColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell viewModel](self, "viewModel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filterFont"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell filterLabel](self, "filterLabel"));
  objc_msgSend(v11, "setFont:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell viewModel](self, "viewModel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "backgroundColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell contentView](self, "contentView"));
  objc_msgSend(v14, "setBackgroundColor:", v13);

  LODWORD(v12) = MapsFeature_IsEnabled_Maps269(v15, v16);
  v18 = (id)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell viewModel](self, "viewModel"));
  v17 = objc_msgSend(v18, "isSelected");
  if ((_DWORD)v12)
  {
    if (v17)
      -[CollectionsFilterCell setUpSelectedBorder](self, "setUpSelectedBorder");
    else
      -[CollectionsFilterCell setUpUnselectedBorder](self, "setUpUnselectedBorder");
  }
  else if (v17)
  {
    -[CollectionsFilterCell setUpSelectedShadows](self, "setUpSelectedShadows");
  }
  else
  {
    -[CollectionsFilterCell setUpUnselectedShadows](self, "setUpUnselectedShadows");
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CollectionsFilterCell;
  v4 = a3;
  -[CollectionsFilterCell traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell traitCollection](self, "traitCollection", v10.receiver, v10.super_class));
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  v7 = objc_msgSend(v4, "userInterfaceStyle");
  if (v6 != v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell viewModel](self, "viewModel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterCell viewModel](self, "viewModel"));
    objc_msgSend(v8, "modelSelected:isDarkMode:", objc_msgSend(v9, "isSelected"), v6 == (id)2);

    -[CollectionsFilterCell updateUI](self, "updateUI");
  }
}

- (UILabel)filterLabel
{
  return self->_filterLabel;
}

- (void)setFilterLabel:(id)a3
{
  objc_storeStrong((id *)&self->_filterLabel, a3);
}

- (CollectionsFilterViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_filterLabel, 0);
}

@end
