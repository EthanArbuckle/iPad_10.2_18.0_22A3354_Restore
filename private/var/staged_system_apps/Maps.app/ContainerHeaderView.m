@implementation ContainerHeaderView

- (void)updateTheme
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView theme](self, "theme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hairlineColor"));
  -[HairlineView setBackgroundColor:](self->_hairLineView, "setBackgroundColor:", v3);

}

- (ContainerHeaderView)initWithHairlineMargin:(double)a3
{
  ContainerHeaderView *v4;
  ContainerHeaderView *v5;
  CardButton *v6;
  void *v7;
  CardButton *v8;
  CardButton *buttonView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ContainerHeaderView;
  v4 = -[ContainerHeaderView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_hairlineMargin = a3;
    v6 = [CardButton alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CardButtonConfiguration close](CardButtonConfiguration, "close"));
    v8 = -[CardButton initWithConfiguration:](v6, "initWithConfiguration:", v7);
    buttonView = v5->_buttonView;
    v5->_buttonView = v8;

    -[ContainerHeaderView _customInit](v5, "_customInit");
  }
  return v5;
}

- (ContainerHeaderView)initWithRespectSafeArea:(BOOL)a3
{
  ContainerHeaderView *v4;
  ContainerHeaderView *v5;
  CardButton *v6;
  void *v7;
  CardButton *v8;
  CardButton *buttonView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ContainerHeaderView;
  v4 = -[ContainerHeaderView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_respectSafeArea = a3;
    v6 = [CardButton alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CardButtonConfiguration close](CardButtonConfiguration, "close"));
    v8 = -[CardButton initWithConfiguration:](v6, "initWithConfiguration:", v7);
    buttonView = v5->_buttonView;
    v5->_buttonView = v8;

    -[ContainerHeaderView _customInit](v5, "_customInit");
  }
  return v5;
}

- (ContainerHeaderView)initWithFrame:(CGRect)a3
{
  return -[ContainerHeaderView initWithHairlineMargin:](self, "initWithHairlineMargin:", 0.0, a3.origin.y, a3.size.width, a3.size.height);
}

- (ContainerHeaderView)init
{
  return -[ContainerHeaderView initWithHairlineMargin:](self, "initWithHairlineMargin:", 0.0);
}

- (ContainerHeaderView)initWithCardButtonType:(unint64_t)a3
{
  ContainerHeaderView *v4;
  CardButtonConfiguration *v5;
  CardButton *v6;
  CardButton *buttonView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ContainerHeaderView;
  v4 = -[ContainerHeaderView initWithFrame:](&v9, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v4)
  {
    v5 = objc_opt_new(CardButtonConfiguration);
    -[CardButtonConfiguration setType:](v5, "setType:", a3);
    v6 = -[CardButton initWithConfiguration:]([CardButton alloc], "initWithConfiguration:", v5);
    buttonView = v4->_buttonView;
    v4->_buttonView = v6;

    -[ContainerHeaderView _customInit](v4, "_customInit");
  }
  return v4;
}

- (ContainerHeaderView)initWithCardButtonType:(unint64_t)a3 cardButtonBlurred:(BOOL)a4
{
  _BOOL8 v4;
  ContainerHeaderView *v6;
  CardButtonConfiguration *v7;
  CardButton *v8;
  CardButton *buttonView;
  objc_super v11;

  v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ContainerHeaderView;
  v6 = -[ContainerHeaderView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v6)
  {
    v7 = objc_opt_new(CardButtonConfiguration);
    -[CardButtonConfiguration setType:](v7, "setType:", a3);
    -[CardButtonConfiguration setBlurred:](v7, "setBlurred:", v4);
    v8 = -[CardButton initWithConfiguration:]([CardButton alloc], "initWithConfiguration:", v7);
    buttonView = v6->_buttonView;
    v6->_buttonView = v8;

    -[ContainerHeaderView _customInit](v6, "_customInit");
  }
  return v6;
}

- (ContainerHeaderView)initWithCardButtonType:(unint64_t)a3 cardButtonTintColor:(id)a4
{
  id v6;
  ContainerHeaderView *v7;
  CardButtonConfiguration *v8;
  CardButton *v9;
  CardButton *buttonView;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ContainerHeaderView;
  v7 = -[ContainerHeaderView initWithFrame:](&v12, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v7)
  {
    v8 = objc_opt_new(CardButtonConfiguration);
    -[CardButtonConfiguration setType:](v8, "setType:", a3);
    -[CardButtonConfiguration setTintColor:](v8, "setTintColor:", v6);
    v9 = -[CardButton initWithConfiguration:]([CardButton alloc], "initWithConfiguration:", v8);
    buttonView = v7->_buttonView;
    v7->_buttonView = v9;

    -[ContainerHeaderView _customInit](v7, "_customInit");
  }

  return v7;
}

- (ContainerHeaderView)initWithCardButton:(id)a3 trailingCardButtons:(id)a4
{
  id v7;
  id v8;
  ContainerHeaderView *v9;
  ContainerHeaderView *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ContainerHeaderView;
  v9 = -[ContainerHeaderView initWithFrame:](&v12, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_buttonView, a3);
    objc_storeStrong((id *)&v10->_trailingCardButtons, a4);
    -[ContainerHeaderView _customInit](v10, "_customInit");
  }

  return v10;
}

- (UIView)buttonView
{
  return (UIView *)self->_buttonView;
}

- (UIView)buttonViewForVisualAlignment
{
  return -[CardButton viewForVisualAlignment](self->_buttonView, "viewForVisualAlignment");
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  void *v5;
  unint64_t v6;
  double v7;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView titleView](self, "titleView"));
  if (v3)
  {

    v4 = UIViewNoIntrinsicMetric;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView accessoryView](self, "accessoryView"));

    v4 = UIViewNoIntrinsicMetric;
    if (!v5)
    {
      v6 = -[ContainerHeaderView headerSize](self, "headerSize");
      v4 = 54.0;
      if (v6)
        v4 = 68.0;
    }
  }
  v7 = UIViewNoIntrinsicMetric;
  result.height = v4;
  result.width = v7;
  return result;
}

- (void)setHeaderSize:(unint64_t)a3
{
  if (self->_headerSize != a3)
  {
    self->_headerSize = a3;
    -[ContainerHeaderView _updateTitleFontForHeaderSize](self, "_updateTitleFontForHeaderSize");
    -[ContainerHeaderView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setHairLineAlpha:(double)a3
{
  -[HairlineView setAlpha:](self->_hairLineView, "setAlpha:", a3);
}

- (double)hairLineAlpha
{
  double result;

  -[HairlineView alpha](self->_hairLineView, "alpha");
  return result;
}

- (BOOL)shouldCenterButtonVertically
{
  return -[NSLayoutConstraint isActive](self->_buttonCenterVerticallyConstraint, "isActive");
}

- (void)setShouldCenterButtonVertically:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[NSLayoutConstraint setActive:](self->_buttonAlignToTopConstraint, "setActive:", !a3);
  -[NSLayoutConstraint setActive:](self->_buttonCenterVerticallyConstraint, "setActive:", v3);
}

- (BOOL)isButtonHidden
{
  return -[CardButton isHidden](self->_buttonView, "isHidden");
}

- (void)setButtonHidden:(BOOL)a3
{
  -[CardButton setHidden:](self->_buttonView, "setHidden:", a3);
}

- (BOOL)areTrailingButtonsHidden
{
  return -[UIStackView isHidden](self->_trailingButtonsStackView, "isHidden");
}

- (void)setTrailingButtonsHidden:(BOOL)a3
{
  -[UIStackView setHidden:](self->_trailingButtonsStackView, "setHidden:", a3);
}

- (void)setVerticalAlignmentOffset:(double)a3
{
  if (vabdd_f64(self->_verticalAlignmentOffset, a3) > 2.22044605e-16)
  {
    self->_verticalAlignmentOffset = a3;
    -[NSLayoutConstraint setConstant:](self->_defaultTitleLabelCenterYConstraint, "setConstant:", a3);
    -[NSLayoutConstraint setConstant:](self->_buttonAlignToTopConstraint, "setConstant:", a3);
    -[NSLayoutConstraint setConstant:](self->_buttonCenterVerticallyConstraint, "setConstant:", a3);
  }
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_defaultTitleLabel, "setText:", a3);
}

- (NSString)title
{
  return -[UILabel text](self->_defaultTitleLabel, "text");
}

- (void)setTitleView:(id)a3
{
  UIView **p_titleView;
  ContainerHeaderView *v6;
  UIView *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  p_titleView = &self->_titleView;
  v6 = (ContainerHeaderView *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_titleView, "superview"));

  if (v6 == self)
    -[UIView removeFromSuperview](*p_titleView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_titleView, a3);
  if (*p_titleView)
  {
    -[UILabel removeFromSuperview](self->_defaultTitleLabel, "removeFromSuperview");
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_titleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ContainerHeaderView addSubview:](self, "addSubview:", *p_titleView);
    v7 = *p_titleView;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView titleViewLayoutGuide](self, "titleViewLayoutGuide"));
    LODWORD(v9) = 1148846080;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _maps_constraintsEqualToEdgesOfLayoutGuide:priority:](v7, "_maps_constraintsEqualToEdgesOfLayoutGuide:priority:", v8, v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);

  }
  else
  {
    -[ContainerHeaderView _attachDefaultTitleView](self, "_attachDefaultTitleView");
  }
  -[ContainerHeaderView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (void)setTitleView:(id)a3 subtitleView:(id)a4
{
  -[ContainerHeaderView setTitleView:subtitleView:verticalSpaceBetweenViews:](self, "setTitleView:subtitleView:verticalSpaceBetweenViews:", a3, a4, 0.0);
}

- (void)setTitleView:(id)a3 subtitleView:(id)a4 verticalSpaceBetweenViews:(double)a5
{
  -[ContainerHeaderView setTitleView:subtitleView:verticalSpaceBetweenViews:padding:](self, "setTitleView:subtitleView:verticalSpaceBetweenViews:padding:", a3, a4, a5, NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing);
}

- (void)setTitleView:(id)a3 subtitleView:(id)a4 verticalSpaceBetweenViews:(double)a5 padding:(NSDirectionalEdgeInsets)a6
{
  double trailing;
  double bottom;
  double leading;
  double top;
  id v14;
  id v15;
  UIView **p_titleView;
  ContainerHeaderView *v17;
  UIView **p_subtitleView;
  ContainerHeaderView *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  double v23;
  uint64_t v24;
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
  id v47;
  _QWORD v48[7];

  trailing = a6.trailing;
  bottom = a6.bottom;
  leading = a6.leading;
  top = a6.top;
  v14 = a3;
  v15 = a4;
  p_titleView = &self->_titleView;
  v17 = (ContainerHeaderView *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_titleView, "superview"));

  if (v17 == self)
    -[UIView removeFromSuperview](*p_titleView, "removeFromSuperview");
  p_subtitleView = &self->_subtitleView;
  v19 = (ContainerHeaderView *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_subtitleView, "superview"));

  if (v19 == self)
    -[UIView removeFromSuperview](*p_subtitleView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_titleView, a3);
  objc_storeStrong((id *)&self->_subtitleView, a4);
  if (*p_titleView)
  {
    -[UILabel removeFromSuperview](self->_defaultTitleLabel, "removeFromSuperview");
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_titleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ContainerHeaderView addSubview:](self, "addSubview:", *p_titleView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_subtitleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ContainerHeaderView addSubview:](self, "addSubview:", *p_subtitleView);
    v20 = -[ContainerHeaderView positionButtonAboveTitle](self, "positionButtonAboveTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](*p_titleView, "trailingAnchor"));
    v46 = v15;
    v47 = v14;
    if ((v20 & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self, "trailingAnchor"));
      v23 = -trailing;
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, v23));

    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton leadingAnchor](self->_buttonView, "leadingAnchor"));
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v25));

      v23 = -trailing;
    }
    v37 = (void *)v24;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](*p_titleView, "topAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self, "topAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, top));
    v48[0] = v43;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](*p_titleView, "leadingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self, "leadingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, leading));
    v48[1] = v40;
    v48[2] = v24;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](*p_subtitleView, "topAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](*p_titleView, "bottomAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, a5));
    v48[3] = v36;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](*p_subtitleView, "leadingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self, "leadingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v26, leading));
    v48[4] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](*p_subtitleView, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self, "trailingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, v23));
    v48[5] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](*p_subtitleView, "bottomAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, -bottom));
    v48[6] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 7));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);

    v15 = v46;
    v14 = v47;
  }
  else
  {
    -[ContainerHeaderView _attachDefaultTitleView](self, "_attachDefaultTitleView");
  }
  -[ContainerHeaderView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (UILayoutGuide)titleViewLayoutGuide
{
  -[ContainerHeaderView _createLayoutGuidesIfNeeded](self, "_createLayoutGuidesIfNeeded");
  return self->_titleViewLayoutGuide;
}

- (void)setTitleViewInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[ContainerHeaderView _createLayoutGuidesIfNeeded](self, "_createLayoutGuidesIfNeeded");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints topConstraint](self->_titleLayoutGuideEdgeConstraints, "topConstraint"));
  objc_msgSend(v8, "setConstant:", top);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints leadingConstraint](self->_titleLayoutGuideEdgeConstraints, "leadingConstraint"));
  objc_msgSend(v9, "setConstant:", left);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints bottomConstraint](self->_titleLayoutGuideEdgeConstraints, "bottomConstraint"));
  objc_msgSend(v10, "setConstant:", bottom);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints trailingConstraint](self->_titleLayoutGuideEdgeConstraints, "trailingConstraint"));
  objc_msgSend(v11, "setConstant:", right);

}

- (UIEdgeInsets)titleViewInsets
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  -[ContainerHeaderView _createLayoutGuidesIfNeeded](self, "_createLayoutGuidesIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints topConstraint](self->_titleLayoutGuideEdgeConstraints, "topConstraint"));
  objc_msgSend(v3, "constant");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints leadingConstraint](self->_titleLayoutGuideEdgeConstraints, "leadingConstraint"));
  objc_msgSend(v6, "constant");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints bottomConstraint](self->_titleLayoutGuideEdgeConstraints, "bottomConstraint"));
  objc_msgSend(v9, "constant");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints trailingConstraint](self->_titleLayoutGuideEdgeConstraints, "trailingConstraint"));
  objc_msgSend(v12, "constant");
  v14 = v13;

  v15 = v5;
  v16 = v8;
  v17 = v11;
  v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (UIFont)titleFont
{
  unint64_t headerSize;

  if (self->_customTitleFont)
  {
    self = (ContainerHeaderView *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView customTitleFont](self, "customTitleFont"));
  }
  else
  {
    headerSize = self->_headerSize;
    if (headerSize == 1)
    {
      self = (ContainerHeaderView *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_boldSystemFontWithSize:](UIFont, "_maps_boldSystemFontWithSize:", 27.0));
    }
    else if (!headerSize)
    {
      self = (ContainerHeaderView *)objc_claimAutoreleasedReturnValue(+[UIFont system22AdaptiveSemibold](UIFont, "system22AdaptiveSemibold"));
    }
  }
  return (UIFont *)self;
}

- (void)setCustomTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_customTitleFont, a3);
  -[ContainerHeaderView _updateTitleFontForHeaderSize](self, "_updateTitleFontForHeaderSize");
}

- (void)setAccessoryView:(id)a3
{
  UIView **p_accessoryView;
  ContainerHeaderView *v6;
  uint64_t v7;
  UIView *v8;
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
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  p_accessoryView = &self->_accessoryView;
  v6 = (ContainerHeaderView *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_accessoryView, "superview"));

  if (v6 == self)
    -[UIView removeFromSuperview](*p_accessoryView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_accessoryView, a3);
  if (*p_accessoryView)
  {
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_accessoryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ContainerHeaderView addSubview:](self, "addSubview:", *p_accessoryView);
    v7 = sub_1002A8AA0(self);
    v8 = *p_accessoryView;
    if (v7 == 5)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v8, "topAnchor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView accessoryViewLayoutGuide](self, "accessoryViewLayoutGuide"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](*p_accessoryView, "leadingAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView accessoryViewLayoutGuide](self, "accessoryViewLayoutGuide"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:", v23));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView accessoryViewLayoutGuide](self, "accessoryViewLayoutGuide"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](*p_accessoryView, "bottomAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintGreaterThanOrEqualToAnchor:", v12));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView accessoryViewLayoutGuide](self, "accessoryViewLayoutGuide"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](*p_accessoryView, "trailingAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[MapsEdgeConstraints edgeConstraintsWithTop:leading:bottom:trailing:](MapsEdgeConstraints, "edgeConstraintsWithTop:leading:bottom:trailing:", v9, v10, v13, v17));

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allConstraints"));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView accessoryViewLayoutGuide](self, "accessoryViewLayoutGuide"));
      LODWORD(v20) = 1148846080;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _maps_constraintsEqualToEdgesOfLayoutGuide:priority:](v8, "_maps_constraintsEqualToEdgesOfLayoutGuide:priority:", v18, v20));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allConstraints"));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

    }
  }

}

- (void)setAccessoryViewInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[ContainerHeaderView _createLayoutGuidesIfNeeded](self, "_createLayoutGuidesIfNeeded");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints topConstraint](self->_accessoryLayoutGuideEdgeConstraints, "topConstraint"));
  objc_msgSend(v8, "setConstant:", top);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints leadingConstraint](self->_accessoryLayoutGuideEdgeConstraints, "leadingConstraint"));
  objc_msgSend(v9, "setConstant:", left);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints bottomConstraint](self->_accessoryLayoutGuideEdgeConstraints, "bottomConstraint"));
  objc_msgSend(v10, "setConstant:", bottom);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints trailingConstraint](self->_accessoryLayoutGuideEdgeConstraints, "trailingConstraint"));
  objc_msgSend(v11, "setConstant:", right);

}

- (UIEdgeInsets)accessoryViewInsets
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  -[ContainerHeaderView _createLayoutGuidesIfNeeded](self, "_createLayoutGuidesIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints topConstraint](self->_accessoryLayoutGuideEdgeConstraints, "topConstraint"));
  objc_msgSend(v3, "constant");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints leadingConstraint](self->_accessoryLayoutGuideEdgeConstraints, "leadingConstraint"));
  objc_msgSend(v6, "constant");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints bottomConstraint](self->_accessoryLayoutGuideEdgeConstraints, "bottomConstraint"));
  objc_msgSend(v9, "constant");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints trailingConstraint](self->_accessoryLayoutGuideEdgeConstraints, "trailingConstraint"));
  objc_msgSend(v12, "constant");
  v14 = v13;

  v15 = v5;
  v16 = v8;
  v17 = v11;
  v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (double)heightWithoutAccessoryView
{
  uint64_t v3;
  void *v4;
  ContainerHeaderView *v5;
  ContainerHeaderView *v6;
  double height;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v3 = objc_claimAutoreleasedReturnValue(-[ContainerHeaderView superview](self, "superview"));
  v4 = (void *)v3;
  if (v3)
    v5 = (ContainerHeaderView *)v3;
  else
    v5 = self;
  v6 = v5;

  height = UILayoutFittingCompressedSize.height;
  -[ContainerHeaderView systemLayoutSizeFittingSize:](v6, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, height);
  if (v8 == 0.0)
    -[ContainerHeaderView intrinsicContentSize](v6, "intrinsicContentSize");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView accessoryView](self, "accessoryView"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView accessoryView](self, "accessoryView"));
    objc_msgSend(v11, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, height);
    v13 = v12;

    if (v13 == 0.0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView accessoryView](self, "accessoryView"));
      objc_msgSend(v14, "intrinsicContentSize");
      v13 = v15;

    }
    v16 = v9 - v13;
    -[ContainerHeaderView accessoryViewInsets](self, "accessoryViewInsets");
    v18 = v17;
    -[ContainerHeaderView accessoryViewInsets](self, "accessoryViewInsets");
    v9 = v16 - (v18 + v19);
  }

  return v9;
}

- (UIMenu)buttonMenu
{
  return -[CardButton menu](self->_buttonView, "menu");
}

- (void)setButtonMenu:(id)a3
{
  -[CardButton setMenu:](self->_buttonView, "setMenu:", a3);
}

- (double)customButtonBottomMargin
{
  double result;

  -[CardButton bottomMargin](self->_buttonView, "bottomMargin");
  return result;
}

- (void)setCustomButtonBottomMargin:(double)a3
{
  -[CardButton setBottomMargin:](self->_buttonView, "setBottomMargin:", a3);
}

- (void)tapAction:(id)a3
{
  HeaderViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "headerViewTapped:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "headerViewTapped:", self);

  }
}

- (void)buttonAction:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView _cardButtonForActionButton:](self, "_cardButtonForActionButton:", a3));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "headerViewButtonTapped:buttonType:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "headerViewButtonTapped:buttonType:", self, objc_msgSend(v7, "type"));

  }
}

- (id)_cardButtonForActionButton:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  CardButton *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CardButton underlyingButton](self->_buttonView, "underlyingButton"));

  if (v5 == v4)
  {
    v13 = self->_buttonView;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = self->_trailingCardButtons;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "underlyingButton", (_QWORD)v15));

          if (v12 == v4)
          {
            v13 = v11;

            goto LABEL_13;
          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }

    v13 = 0;
  }
LABEL_13:

  return v13;
}

- (void)_setMask:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;
  id v19;

  v4 = a3;
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "capInsets");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[ContainerHeaderView _setCornerRadius:](self, "_setCornerRadius:");
  -[ContainerHeaderView setClipsToBounds:](self, "setClipsToBounds:", 1);
  v19 = (id)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView layer](self, "layer"));
  v17 = objc_retainAutorelease(v4);
  v18 = objc_msgSend(v17, "CGImage");

  objc_msgSend(v19, "setCornerContents:", v18);
  objc_msgSend(v19, "setCornerContentsCenter:", v12 / v6, v10 / v8, (v6 - v12 - v16) / v6, (v8 - v10 - v14) / v8);

}

- (void)_customInit
{
  double v3;
  void *v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  UIStackView *v10;
  UIStackView *trailingButtonsStackView;
  double v12;
  UILabel *v13;
  UILabel *defaultTitleLabel;
  double v15;
  double v16;
  void *v17;
  void *v18;
  HairlineView *v19;
  HairlineView *hairLineView;
  UITapGestureRecognizer *v21;
  UITapGestureRecognizer *tapGesture;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  -[ContainerHeaderView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("ContainerHeaderView"));
  LODWORD(v3) = 1144750080;
  -[ContainerHeaderView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 1, v3);
  self->_headerSize = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[ContainerHeaderView setBackgroundColor:](self, "setBackgroundColor:", v4);

  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CardButton setTranslatesAutoresizingMaskIntoConstraints:](self->_buttonView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CardButton addTarget:action:forControlEvents:](self->_buttonView, "addTarget:action:forControlEvents:", self, "buttonAction:", 64);
  -[ContainerHeaderView addSubview:](self, "addSubview:", self->_buttonView);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->_trailingCardButtons;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "addTarget:action:forControlEvents:", self, "buttonAction:", 64, (_QWORD)v24);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  v10 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithArrangedSubviews:", self->_trailingCardButtons);
  trailingButtonsStackView = self->_trailingButtonsStackView;
  self->_trailingButtonsStackView = v10;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_trailingButtonsStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v12) = 1148846080;
  -[UIStackView setContentHuggingPriority:forAxis:](self->_trailingButtonsStackView, "setContentHuggingPriority:forAxis:", 0, v12);
  -[UIStackView setAxis:](self->_trailingButtonsStackView, "setAxis:", 0);
  -[UIStackView setSpacing:](self->_trailingButtonsStackView, "setSpacing:", 8.0);
  -[ContainerHeaderView addSubview:](self, "addSubview:", self->_trailingButtonsStackView);
  v13 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  defaultTitleLabel = self->_defaultTitleLabel;
  self->_defaultTitleLabel = v13;

  LODWORD(v15) = 1132068864;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_defaultTitleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v15);
  LODWORD(v16) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_defaultTitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v16);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_defaultTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](self->_defaultTitleLabel, "setBackgroundColor:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_defaultTitleLabel, "setTextColor:", v18);

  -[UILabel setAccessibilityIdentifier:](self->_defaultTitleLabel, "setAccessibilityIdentifier:", CFSTR("ContainerHeaderTitle"));
  v19 = (HairlineView *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView _maps_addHairlineAtBottomWithMargin:](self, "_maps_addHairlineAtBottomWithMargin:", self->_hairlineMargin));
  hairLineView = self->_hairLineView;
  self->_hairLineView = v19;

  -[HairlineView setAutoUpdateTheme:](self->_hairLineView, "setAutoUpdateTheme:", 0);
  v21 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "tapAction:");
  tapGesture = self->_tapGesture;
  self->_tapGesture = v21;

  -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_tapGesture, "setNumberOfTapsRequired:", 1);
  -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->_tapGesture, "setNumberOfTouchesRequired:", 1);
  -[UITapGestureRecognizer setDelegate:](self->_tapGesture, "setDelegate:", self);
  -[ContainerHeaderView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapGesture);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView _initialConstraints](self, "_initialConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

  -[ContainerHeaderView _attachDefaultTitleView](self, "_attachDefaultTitleView");
  -[ContainerHeaderView updateBaseMargins](self, "updateBaseMargins");
  -[ContainerHeaderView _updateTitleFontForHeaderSize](self, "_updateTitleFontForHeaderSize");
}

- (UITapGestureRecognizer)_headerTapGesture
{
  return self->_tapGesture;
}

- (id)_initialConstraints
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *buttonAlignToTopConstraint;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *buttonCenterVerticallyConstraint;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *buttonEdgeConstraint;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *trailingButtonEdgeConstraint;
  NSLayoutConstraint *v19;
  NSLayoutConstraint **v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *v25;
  NSLayoutConstraint *v26;
  NSLayoutConstraint *v28;
  NSLayoutConstraint *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton topAnchor](self->_buttonView, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self, "topAnchor"));
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v4));
  buttonAlignToTopConstraint = self->_buttonAlignToTopConstraint;
  self->_buttonAlignToTopConstraint = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton centerYAnchor](self->_buttonView, "centerYAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView centerYAnchor](self, "centerYAnchor"));
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
  buttonCenterVerticallyConstraint = self->_buttonCenterVerticallyConstraint;
  self->_buttonCenterVerticallyConstraint = v9;

  if (-[ContainerHeaderView positionButtonAboveTitle](self, "positionButtonAboveTitle"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self, "leadingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton leadingAnchor](self->_buttonView, "leadingAnchor"));
    v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
    buttonEdgeConstraint = self->_buttonEdgeConstraint;
    self->_buttonEdgeConstraint = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_trailingButtonsStackView, "trailingAnchor"));
    v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
    trailingButtonEdgeConstraint = self->_trailingButtonEdgeConstraint;
    self->_trailingButtonEdgeConstraint = v17;

    v19 = self->_buttonEdgeConstraint;
    v30 = self->_buttonAlignToTopConstraint;
    v31 = v19;
    v32 = self->_trailingButtonEdgeConstraint;
    v20 = &v30;
    v21 = 3;
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton trailingAnchor](self->_buttonView, "trailingAnchor"));
    v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
    v25 = self->_buttonEdgeConstraint;
    self->_buttonEdgeConstraint = v24;

    v26 = self->_buttonEdgeConstraint;
    v28 = self->_buttonAlignToTopConstraint;
    v29 = v26;
    v20 = &v28;
    v21 = 2;
  }
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, v21, v28, v29, v30, v31, v32));
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ContainerHeaderView;
  -[ContainerHeaderView layoutMarginsDidChange](&v3, "layoutMarginsDidChange");
  -[ContainerHeaderView updateBaseMargins](self, "updateBaseMargins");
}

- (void)updateBaseMargins
{
  id v3;
  unsigned int v4;
  double v5;
  double v6;
  NSLayoutConstraint *buttonEdgeConstraint;
  double v8;
  double v9;
  double v10;
  int *v11;
  double v12;
  double v13;
  double v14;
  double v15;

  if (self->_respectSafeArea)
  {
    v3 = -[ContainerHeaderView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    v4 = -[ContainerHeaderView positionButtonAboveTitle](self, "positionButtonAboveTitle");
    -[ContainerHeaderView safeAreaInsets](self, "safeAreaInsets");
    if (v4)
    {
      buttonEdgeConstraint = self->_buttonEdgeConstraint;
      if (v3 == (id)1)
      {
        -[NSLayoutConstraint setConstant:](buttonEdgeConstraint, "setConstant:", v6);
        -[ContainerHeaderView safeAreaInsets](self, "safeAreaInsets");
        v9 = v8;
      }
      else
      {
        -[NSLayoutConstraint setConstant:](buttonEdgeConstraint, "setConstant:", v5);
        -[ContainerHeaderView safeAreaInsets](self, "safeAreaInsets");
        v9 = v12;
      }
      v11 = &OBJC_IVAR___ContainerHeaderView__trailingButtonEdgeConstraint;
    }
    else
    {
      if (v3 == (id)1)
        v9 = v5;
      else
        v9 = v6;
      v11 = &OBJC_IVAR___ContainerHeaderView__buttonEdgeConstraint;
    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v11), "setConstant:", v9);
    -[ContainerHeaderView safeAreaInsets](self, "safeAreaInsets");
    if (v3 == (id)1)
      v15 = v14;
    else
      v15 = v13;
    v10 = v15 + 16.0;
  }
  else
  {
    -[NSLayoutConstraint setConstant:](self->_buttonEdgeConstraint, "setConstant:", 0.0);
    -[NSLayoutConstraint setConstant:](self->_trailingButtonEdgeConstraint, "setConstant:", 0.0);
    v10 = 16.0;
  }
  -[NSLayoutConstraint setConstant:](self->_titleLeadingConstraint, "setConstant:", v10);
}

- (void)_attachDefaultTitleView
{
  id v3;

  -[ContainerHeaderView addSubview:](self, "addSubview:", self->_defaultTitleLabel);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView _defaultTitleViewConstraints](self, "_defaultTitleViewConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v3);

}

- (BOOL)positionButtonAboveTitle
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v3, "userInterfaceIdiom") == (id)5 && !-[CardButton type](self->_buttonView, "type"))
    v4 = !-[ContainerHeaderView isButtonHidden](self, "isButtonHidden");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (id)_defaultTitleViewConstraints
{
  unsigned int v3;
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *titleLeadingConstraint;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *v21;
  void *v22;
  void *v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *defaultTitleLabelCenterYConstraint;
  void *v26;
  _QWORD v28[5];
  _QWORD v29[4];

  v3 = -[ContainerHeaderView positionButtonAboveTitle](self, "positionButtonAboveTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_defaultTitleLabel, "leadingAnchor"));
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton leadingAnchor](self->_buttonView, "leadingAnchor"));
    v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));
    titleLeadingConstraint = self->_titleLeadingConstraint;
    self->_titleLeadingConstraint = v6;

    v29[0] = self->_titleLeadingConstraint;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_defaultTitleLabel, "trailingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self, "trailingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
    v29[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_defaultTitleLabel, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton bottomAnchor](self->_buttonView, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
    v29[2] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_defaultTitleLabel, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 10.0));
    v29[3] = v16;
    v17 = v29;
    v18 = 4;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self, "leadingAnchor"));
    v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v19));
    v21 = self->_titleLeadingConstraint;
    self->_titleLeadingConstraint = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_defaultTitleLabel, "centerYAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView centerYAnchor](self, "centerYAnchor"));
    v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, self->_verticalAlignmentOffset));
    defaultTitleLabelCenterYConstraint = self->_defaultTitleLabelCenterYConstraint;
    self->_defaultTitleLabelCenterYConstraint = v24;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton leadingAnchor](self->_buttonView, "leadingAnchor", self->_titleLeadingConstraint, self->_defaultTitleLabelCenterYConstraint));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_defaultTitleLabel, "trailingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
    v28[2] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_defaultTitleLabel, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self, "topAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintGreaterThanOrEqualToAnchor:", v12));
    v28[3] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_defaultTitleLabel, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:", v15));
    v28[4] = v16;
    v17 = v28;
    v18 = 5;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, v18));

  return v26;
}

- (void)_createLayoutGuidesIfNeeded
{
  UILayoutGuide *v3;
  UILayoutGuide *titleViewLayoutGuide;
  UILayoutGuide *v5;
  UILayoutGuide *accessoryViewLayoutGuide;
  ContainerHeaderView *v7;
  void *defaultTitleLabel;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  MapsEdgeConstraints *v25;
  MapsEdgeConstraints *titleLayoutGuideEdgeConstraints;
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
  uint64_t v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  MapsEdgeConstraints *v46;
  MapsEdgeConstraints *accessoryLayoutGuideEdgeConstraints;
  void *v48;
  id v49;

  if (self->_titleViewLayoutGuide || self->_accessoryViewLayoutGuide)
    return;
  v3 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  titleViewLayoutGuide = self->_titleViewLayoutGuide;
  self->_titleViewLayoutGuide = v3;

  -[ContainerHeaderView addLayoutGuide:](self, "addLayoutGuide:", self->_titleViewLayoutGuide);
  v5 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  accessoryViewLayoutGuide = self->_accessoryViewLayoutGuide;
  self->_accessoryViewLayoutGuide = v5;

  -[ContainerHeaderView addLayoutGuide:](self, "addLayoutGuide:", self->_accessoryViewLayoutGuide);
  v7 = (ContainerHeaderView *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_defaultTitleLabel, "superview"));

  if (v7 == self)
    defaultTitleLabel = self->_defaultTitleLabel;
  else
    defaultTitleLabel = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(defaultTitleLabel, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_titleViewLayoutGuide, "bottomAnchor"));
  v49 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_titleViewLayoutGuide, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));

  if (-[ContainerHeaderView positionButtonAboveTitle](self, "positionButtonAboveTitle"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_titleViewLayoutGuide, "topAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton bottomAnchor](self->_buttonView, "bottomAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));

    LODWORD(v18) = 1148829696;
    objc_msgSend(v17, "setPriority:", v18);
  }
  else
  {
    LODWORD(v14) = 1148829696;
    objc_msgSend(v49, "setPriority:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_titleViewLayoutGuide, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self, "topAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));

    if (!-[ContainerHeaderView titleViewIgnoresButton](self, "titleViewIgnoresButton"))
    {
      v21 = objc_claimAutoreleasedReturnValue(-[CardButton leadingAnchor](self->_buttonView, "leadingAnchor"));
      goto LABEL_12;
    }
  }
  v21 = objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self, "trailingAnchor"));
LABEL_12:
  v22 = (void *)v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_titleViewLayoutGuide, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));

  v25 = (MapsEdgeConstraints *)objc_claimAutoreleasedReturnValue(+[MapsEdgeConstraints edgeConstraintsWithTop:leading:bottom:trailing:](MapsEdgeConstraints, "edgeConstraintsWithTop:leading:bottom:trailing:", v17, v13, v49, v24));
  titleLayoutGuideEdgeConstraints = self->_titleLayoutGuideEdgeConstraints;
  self->_titleLayoutGuideEdgeConstraints = v25;

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints allConstraints](self->_titleLayoutGuideEdgeConstraints, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_accessoryViewLayoutGuide, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));

  LODWORD(v28) = -[ContainerHeaderView positionButtonAboveTitle](self, "positionButtonAboveTitle");
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_accessoryViewLayoutGuide, "topAnchor"));
  if ((_DWORD)v28)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton viewForVisualAlignment](self->_buttonView, "viewForVisualAlignment"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v33));

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_accessoryViewLayoutGuide, "leadingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton trailingAnchor](self->_buttonView, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v36));

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_titleViewLayoutGuide, "topAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_accessoryViewLayoutGuide, "bottomAnchor"));
    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintGreaterThanOrEqualToAnchor:", v39));
  }
  else
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_titleViewLayoutGuide, "bottomAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v41));

    LODWORD(v42) = 1148829696;
    objc_msgSend(v34, "setPriority:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_accessoryViewLayoutGuide, "leadingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self, "leadingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v44));

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self, "bottomAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_accessoryViewLayoutGuide, "bottomAnchor"));
    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));
  }
  v45 = (void *)v40;

  v46 = (MapsEdgeConstraints *)objc_claimAutoreleasedReturnValue(+[MapsEdgeConstraints edgeConstraintsWithTop:leading:bottom:trailing:](MapsEdgeConstraints, "edgeConstraintsWithTop:leading:bottom:trailing:", v34, v37, v45, v30));
  accessoryLayoutGuideEdgeConstraints = self->_accessoryLayoutGuideEdgeConstraints;
  self->_accessoryLayoutGuideEdgeConstraints = v46;

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints allConstraints](self->_accessoryLayoutGuideEdgeConstraints, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v48);

}

- (void)_updateTitleFontForHeaderSize
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView titleFont](self, "titleFont"));
  -[UILabel setFont:](self->_defaultTitleLabel, "setFont:", v3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ContainerHeaderView;
  v4 = a3;
  -[MapsThemeView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView traitCollection](self, "traitCollection", v9.receiver, v9.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v8 = sub_1002A8950(v6, v7);
  if (v8)
    -[ContainerHeaderView _updateTitleFontForHeaderSize](self, "_updateTitleFontForHeaderSize");
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CardButton *v10;
  void *v11;
  char v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  CardButton *buttonView;
  BOOL v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v4, "locationInView:", self);
  v7 = v6;
  v9 = v8;

  v10 = (CardButton *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hitTest:withEvent:", 0, v7, v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView delegate](self, "delegate"));
  v12 = objc_opt_respondsToSelector(v11, "shouldIgnoreTapOnView:headerView:");

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView delegate](self, "delegate"));
    v14 = objc_msgSend(v13, "shouldIgnoreTapOnView:headerView:", v10, self);

    if ((v14 & 1) != 0)
      goto LABEL_12;
  }
  v15 = objc_claimAutoreleasedReturnValue(-[ContainerHeaderView accessoryView](self, "accessoryView"));
  if (v15)
  {
    v16 = (void *)v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView accessoryView](self, "accessoryView"));
    v18 = objc_msgSend(v17, "isUserInteractionEnabled");

    if (v18)
    {
      v19 = objc_claimAutoreleasedReturnValue(-[ContainerHeaderView accessoryView](self, "accessoryView"));
      if (v10 == (CardButton *)v19)
      {

      }
      else
      {
        v20 = (void *)v19;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView accessoryView](self, "accessoryView"));
        v22 = -[CardButton isDescendantOfView:](v10, "isDescendantOfView:", v21);

        if ((v22 & 1) == 0)
          goto LABEL_7;
      }
LABEL_12:
      v24 = 0;
      goto LABEL_13;
    }
  }
LABEL_7:
  buttonView = self->_buttonView;
  if (buttonView
    && (v10 == buttonView || (-[CardButton isDescendantOfView:](v10, "isDescendantOfView:") & 1) != 0))
  {
    goto LABEL_12;
  }
  v24 = 1;
LABEL_13:

  return v24;
}

- (HeaderViewDelegate)delegate
{
  return (HeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)headerSize
{
  return self->_headerSize;
}

- (UIView)titleView
{
  return self->_titleView;
}

- (BOOL)titleViewIgnoresButton
{
  return self->_titleViewIgnoresButton;
}

- (void)setTitleViewIgnoresButton:(BOOL)a3
{
  self->_titleViewIgnoresButton = a3;
}

- (void)setTitleViewLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_titleViewLayoutGuide, a3);
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (double)verticalAlignmentOffset
{
  return self->_verticalAlignmentOffset;
}

- (UIFont)customTitleFont
{
  return self->_customTitleFont;
}

- (UILayoutGuide)accessoryViewLayoutGuide
{
  return self->_accessoryViewLayoutGuide;
}

- (void)setAccessoryViewLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViewLayoutGuide, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_customTitleFont, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_titleViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buttonCenterVerticallyConstraint, 0);
  objc_storeStrong((id *)&self->_buttonAlignToTopConstraint, 0);
  objc_storeStrong((id *)&self->_defaultTitleLabelCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryLayoutGuideEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_titleLayoutGuideEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_trailingButtonEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_buttonEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_titleLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleView, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_trailingButtonsStackView, 0);
  objc_storeStrong((id *)&self->_trailingCardButtons, 0);
  objc_storeStrong((id *)&self->_buttonView, 0);
  objc_storeStrong((id *)&self->_defaultTitleLabel, 0);
  objc_storeStrong((id *)&self->_hairLineView, 0);
}

@end
