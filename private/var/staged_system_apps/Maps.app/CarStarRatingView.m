@implementation CarStarRatingView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarStarRatingView)init
{
  double y;
  double width;
  double height;
  id v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CarStarRatingView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v5 = -[CarStarRatingView initWithFrame:](&v20, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:pointSize:weight:](UIImage, "_mapsCar_systemImageNamed:pointSize:weight:", CFSTR("star.fill"), 6, 8.5));
    v7 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v6);
    v8 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v7;

    objc_msgSend(*((id *)v5 + 1), "setAccessibilityIdentifier:", CFSTR("StarImageView"));
    objc_msgSend(*((id *)v5 + 1), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v9) = 1148846080;
    objc_msgSend(*((id *)v5 + 1), "setContentCompressionResistancePriority:forAxis:", 1, v9);
    LODWORD(v10) = 1148846080;
    objc_msgSend(*((id *)v5 + 1), "setContentCompressionResistancePriority:forAxis:", 0, v10);
    v11 = sub_100984FC0(*((_QWORD *)v5 + 3));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(*((id *)v5 + 1), "setTintColor:", v12);

    objc_msgSend(v5, "addSubview:", *((_QWORD *)v5 + 1));
    v13 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    v14 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v13;

    objc_msgSend(*((id *)v5 + 2), "setAccessibilityIdentifier:", CFSTR("ProviderInfoLabel"));
    objc_msgSend(*((id *)v5 + 2), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v15) = 1144750080;
    objc_msgSend(*((id *)v5 + 2), "setContentHuggingPriority:forAxis:", 1, v15);
    LODWORD(v16) = 1144750080;
    objc_msgSend(*((id *)v5 + 2), "setContentHuggingPriority:forAxis:", 0, v16);
    LODWORD(v17) = 1148846080;
    objc_msgSend(*((id *)v5 + 2), "setContentCompressionResistancePriority:forAxis:", 1, v17);
    objc_msgSend(*((id *)v5 + 2), "setLineBreakMode:", 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption2, UIFontWeightRegular));
    objc_msgSend(*((id *)v5 + 2), "setFont:", v18);

    objc_msgSend(v5, "addSubview:", *((_QWORD *)v5 + 2));
    objc_msgSend(v5, "_setupConstraints");

  }
  return (CarStarRatingView *)v5;
}

- (id)viewForLastBaselineLayout
{
  return self->_providerInfoLabel;
}

- (id)viewForFirstBaselineLayout
{
  return self->_providerInfoLabel;
}

- (void)_setupConstraints
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
  _QWORD v32[9];

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_starImageView, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarStarRatingView topAnchor](self, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintGreaterThanOrEqualToAnchor:", v29));
  v32[0] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_starImageView, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarStarRatingView leadingAnchor](self, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v32[1] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_starImageView, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarStarRatingView trailingAnchor](self, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:", v23));
  v32[2] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_starImageView, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarStarRatingView bottomAnchor](self, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:", v20));
  v32[3] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_providerInfoLabel, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_starImageView, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, 2.0));
  v32[4] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_providerInfoLabel, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarStarRatingView topAnchor](self, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintGreaterThanOrEqualToAnchor:", v14));
  v32[5] = v13;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_providerInfoLabel, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarStarRatingView trailingAnchor](self, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v4));
  v32[6] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_providerInfoLabel, "firstBaselineAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView firstBaselineAnchor](self->_starImageView, "firstBaselineAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 1.0));
  v32[7] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_providerInfoLabel, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarStarRatingView bottomAnchor](self, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintLessThanOrEqualToAnchor:", v10));
  v32[8] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 9));
  objc_msgSend(v31, "addObjectsFromArray:", v12);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);
}

- (void)setHighlighted:(BOOL)a3
{
  void *v4;
  id v5;
  id v6;

  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    if (-[CarStarRatingView isHighlighted](self, "isHighlighted"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
    }
    else
    {
      v5 = sub_100984FC0((uint64_t)self->_mapItem);
      v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
    }
    -[UIImageView setTintColor:](self->_starImageView, "setTintColor:", v4);

    v6 = (id)objc_claimAutoreleasedReturnValue(-[CarStarRatingView _providerNameAndPriceAttributedStringForMapItem:](self, "_providerNameAndPriceAttributedStringForMapItem:", self->_mapItem));
    -[UILabel setAttributedText:](self->_providerInfoLabel, "setAttributedText:", v6);

  }
}

- (id)_providerNameAndPriceAttributedStringForMapItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "_hasUserRatingScore"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKRatingStringBuilder carPlayHeaderStringForMapItem:isHighlighted:](MKRatingStringBuilder, "carPlayHeaderStringForMapItem:isHighlighted:", v4, -[CarStarRatingView isHighlighted](self, "isHighlighted")));
  else
    v5 = 0;

  return v5;
}

- (void)setupWithMapItem:(id)a3
{
  MKMapItem *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  MKMapItem *mapItem;
  id v10;

  v4 = (MKMapItem *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarStarRatingView _providerNameAndPriceAttributedStringForMapItem:](self, "_providerNameAndPriceAttributedStringForMapItem:", v4));
  -[UILabel setAttributedText:](self->_providerInfoLabel, "setAttributedText:", v5);

  v6 = sub_100984F68((uint64_t)v4);
  v10 = (id)objc_claimAutoreleasedReturnValue(v6);
  v7 = sub_100984FC0((uint64_t)v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[UIImageView setTintColor:](self->_starImageView, "setTintColor:", v8);

  -[UIImageView setImage:](self->_starImageView, "setImage:", v10);
  mapItem = self->_mapItem;
  self->_mapItem = v4;

}

- (id)accessibilityIdentifier
{
  return CFSTR("CarStarRatingView");
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_providerInfoLabel, 0);
  objc_storeStrong((id *)&self->_starImageView, 0);
}

@end
