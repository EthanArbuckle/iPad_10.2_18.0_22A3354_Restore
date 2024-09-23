@implementation CarAdvisoryView

- (CarAdvisoryView)init
{
  CarAdvisoryView *v2;
  CarAdvisoryView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarAdvisoryView;
  v2 = -[CarAdvisoryView initWithFrame:](&v5, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = v2;
  if (v2)
    -[CarAdvisoryView _setupViews](v2, "_setupViews");
  return v3;
}

- (CarAdvisoryView)initWithAdvisory:(id)a3
{
  id v5;
  CarAdvisoryView *v6;
  CarAdvisoryView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarAdvisoryView;
  v6 = -[CarAdvisoryView initWithFrame:](&v9, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_advisory, a3);
    -[CarAdvisoryView setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("CarAdvisoryView"));
    -[CarAdvisoryView _setupViews](v7, "_setupViews");
    -[CarAdvisoryView _updateContent](v7, "_updateContent");
  }

  return v7;
}

- (void)_setupViews
{
  id v3;
  double y;
  double width;
  double height;
  UILabel *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  UILabel *advisoryLabel;
  UIImageView *v13;
  UIImageView *advisoryImage;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
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
  UILabel *v46;
  _QWORD v47[9];

  v3 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UILabel *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](v7, "setNumberOfLines:", 2);
  LODWORD(v8) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](v7, "setContentCompressionResistancePriority:forAxis:", 1, v8);
  LODWORD(v9) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](v7, "setContentHuggingPriority:forAxis:", 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:traits:](UIFont, "_mapsCar_fontForTextStyle:traits:", UIFontTextStyleCaption1, 0x8000));
  -[UILabel setFont:](v7, "setFont:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor"));
  -[UILabel setTextColor:](v7, "setTextColor:", v11);

  -[UILabel setLineBreakMode:](v7, "setLineBreakMode:", 4);
  advisoryLabel = self->_advisoryLabel;
  self->_advisoryLabel = v7;
  v46 = v7;

  -[UILabel setAccessibilityIdentifier:](self->_advisoryLabel, "setAccessibilityIdentifier:", CFSTR("AdvisoryLabel"));
  -[CarAdvisoryView addSubview:](self, "addSubview:", self->_advisoryLabel);
  v13 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  advisoryImage = self->_advisoryImage;
  self->_advisoryImage = v13;

  -[UIImageView setAccessibilityIdentifier:](self->_advisoryImage, "setAccessibilityIdentifier:", CFSTR("AdvisoryImage"));
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_advisoryImage, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setContentMode:](self->_advisoryImage, "setContentMode:", 1);
  -[UIImageView setClipsToBounds:](self->_advisoryImage, "setClipsToBounds:", 1);
  -[CarAdvisoryView addSubview:](self, "addSubview:", self->_advisoryImage);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage warningImageOfSize:](UIImage, "warningImageOfSize:", 13.0));
  -[UIImageView setImage:](self->_advisoryImage, "setImage:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_advisoryLabel, "font"));
  objc_msgSend(v16, "lineHeight");
  v18 = v17;

  v19 = fmin(v18, 13.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_advisoryImage, "leadingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryView leadingAnchor](self, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
  v47[0] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_advisoryImage, "widthAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToConstant:", v19));
  v47[1] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_advisoryImage, "heightAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToConstant:", v19));
  v47[2] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_advisoryImage, "centerYAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_advisoryLabel, "firstBaselineAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, -3.0));
  v47[3] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_advisoryImage, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryView bottomAnchor](self, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintLessThanOrEqualToAnchor:", v34));
  v47[4] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_advisoryLabel, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryView topAnchor](self, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
  v47[5] = v30;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_advisoryLabel, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryView trailingAnchor](self, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
  v47[6] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_advisoryLabel, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_advisoryImage, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, 3.0));
  v47[7] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_advisoryLabel, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryView bottomAnchor](self, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
  v47[8] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 9));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

}

- (void)_updateContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteAdvisory titleString](self->_advisory, "titleString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringWithDefaultOptions"));
  -[UILabel setText:](self->_advisoryLabel, "setText:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteAdvisory artwork](self->_advisory, "artwork"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryView traitCollection](self, "traitCollection"));
  v7 = ImageForArtwork(v5, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue(v7);

  if (v9)
  {
    -[UIImageView setImage:](self->_advisoryImage, "setImage:", v9);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage warningImageOfSize:](UIImage, "warningImageOfSize:", 13.0));
    -[UIImageView setImage:](self->_advisoryImage, "setImage:", v8);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarAdvisoryView;
  v4 = a3;
  -[CarAdvisoryView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryView traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[CarAdvisoryView _updateContent](self, "_updateContent");
}

- (UILabel)advisoryLabel
{
  return self->_advisoryLabel;
}

- (void)setAdvisoryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_advisoryLabel, a3);
}

- (UIImageView)advisoryImage
{
  return self->_advisoryImage;
}

- (void)setAdvisoryImage:(id)a3
{
  objc_storeStrong((id *)&self->_advisoryImage, a3);
}

- (GEOComposedRouteAdvisory)advisory
{
  return self->_advisory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advisory, 0);
  objc_storeStrong((id *)&self->_advisoryImage, 0);
  objc_storeStrong((id *)&self->_advisoryLabel, 0);
}

@end
