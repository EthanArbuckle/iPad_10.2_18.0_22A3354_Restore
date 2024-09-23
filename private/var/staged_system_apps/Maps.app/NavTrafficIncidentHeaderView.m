@implementation NavTrafficIncidentHeaderView

- (NavTrafficIncidentHeaderView)initWithFrame:(CGRect)a3
{
  NavTrafficIncidentHeaderView *v3;
  NavTrafficIncidentHeaderView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NavTrafficIncidentHeaderView;
  v3 = -[NavTrafficIncidentHeaderView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NavTrafficIncidentHeaderView _setupViews](v3, "_setupViews");
    -[NavTrafficIncidentHeaderView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("NavTrafficIncidentHeaderView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentHeaderView _initialConstraints](v4, "_initialConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v5);

  }
  return v4;
}

- (void)_setupViews
{
  MapsThemeLabel *v3;
  double y;
  double width;
  double height;
  UILabel *v7;
  UILabel *primaryLabel;
  void *v9;
  double v10;
  void *v11;
  MapsThemeLabel *v12;
  UILabel *secondaryLabel;
  void *v14;
  double v15;
  void *v16;
  MKArtworkImageView *v17;
  MKArtworkImageView *artworkImageView;

  v3 = [MapsThemeLabel alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = -[MapsThemeLabel initWithFrame:](v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_boldSystemFontWithFixedSize:](UIFont, "_maps_boldSystemFontWithFixedSize:", 23.0));
  -[UILabel setFont:](self->_primaryLabel, "setFont:", v9);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_primaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_primaryLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakStrategy:](self->_primaryLabel, "setLineBreakStrategy:", 0);
  LODWORD(v10) = 1148829696;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_primaryLabel, "setContentCompressionResistancePriority:forAxis:", 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_primaryLabel, "setTextColor:", v11);

  -[UILabel setAccessibilityIdentifier:](self->_primaryLabel, "setAccessibilityIdentifier:", CFSTR("PrimaryLabel"));
  -[NavTrafficIncidentHeaderView addSubview:](self, "addSubview:", self->_primaryLabel);
  v12 = -[MapsThemeLabel initWithFrame:]([MapsThemeLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = &v12->super;

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_systemFontWithFixedSize:](UIFont, "_maps_systemFontWithFixedSize:", 20.0));
  -[UILabel setFont:](self->_secondaryLabel, "setFont:", v14);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_secondaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakStrategy:](self->_secondaryLabel, "setLineBreakStrategy:", 0);
  LODWORD(v15) = 1148829696;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_secondaryLabel, "setContentCompressionResistancePriority:forAxis:", 1, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_secondaryLabel, "setTextColor:", v16);

  -[UILabel setAccessibilityIdentifier:](self->_secondaryLabel, "setAccessibilityIdentifier:", CFSTR("SecondaryLabel"));
  -[NavTrafficIncidentHeaderView addSubview:](self, "addSubview:", self->_secondaryLabel);
  v17 = (MKArtworkImageView *)objc_msgSend(objc_alloc((Class)MKArtworkImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  artworkImageView = self->_artworkImageView;
  self->_artworkImageView = v17;

  -[MKArtworkImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_artworkImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKArtworkImageView setContentMode:](self->_artworkImageView, "setContentMode:", 1);
  -[MKArtworkImageView setAccessibilityIdentifier:](self->_artworkImageView, "setAccessibilityIdentifier:", CFSTR("ArtworkImageView"));
  -[NavTrafficIncidentHeaderView addSubview:](self, "addSubview:", self->_artworkImageView);
}

- (id)_initialConstraints
{
  void *v3;
  NSLayoutConstraint *v4;
  NSLayoutConstraint *imageViewWidthConstraint;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *imageViewToPrimaryLabelHorizontalConstraint;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *primaryToSecondaryLabelBaselineConstraint;
  NSLayoutConstraint *v14;
  void *v15;
  void *v16;
  void *v17;
  NSLayoutConstraint *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
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
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[13];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView widthAnchor](self->_artworkImageView, "widthAnchor"));
  v4 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToConstant:", 0.0));
  imageViewWidthConstraint = self->_imageViewWidthConstraint;
  self->_imageViewWidthConstraint = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_primaryLabel, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView trailingAnchor](self->_artworkImageView, "trailingAnchor"));
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  imageViewToPrimaryLabelHorizontalConstraint = self->_imageViewToPrimaryLabelHorizontalConstraint;
  self->_imageViewToPrimaryLabelHorizontalConstraint = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_secondaryLabel, "firstBaselineAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_primaryLabel, "lastBaselineAnchor"));
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 24.0));
  primaryToSecondaryLabelBaselineConstraint = self->_primaryToSecondaryLabelBaselineConstraint;
  self->_primaryToSecondaryLabelBaselineConstraint = v12;

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView leadingAnchor](self->_artworkImageView, "leadingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentHeaderView leadingAnchor](self, "leadingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
  v14 = self->_imageViewToPrimaryLabelHorizontalConstraint;
  v49[0] = v46;
  v49[1] = v14;
  v49[2] = self->_imageViewWidthConstraint;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_primaryLabel, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentHeaderView trailingAnchor](self, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
  v49[3] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_secondaryLabel, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_primaryLabel, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v49[4] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_secondaryLabel, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentHeaderView trailingAnchor](self, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v49[5] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView topAnchor](self->_artworkImageView, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentHeaderView topAnchor](self, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 23.0));
  v49[6] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView heightAnchor](self->_artworkImageView, "heightAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView widthAnchor](self->_artworkImageView, "widthAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
  v49[7] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentHeaderView bottomAnchor](self, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView bottomAnchor](self->_artworkImageView, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintGreaterThanOrEqualToAnchor:constant:", v29, 22.0));
  v49[8] = v28;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_primaryLabel, "firstBaselineAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentHeaderView topAnchor](self, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 40.0));
  v18 = self->_primaryToSecondaryLabelBaselineConstraint;
  v49[9] = v17;
  v49[10] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentHeaderView bottomAnchor](self, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_secondaryLabel, "lastBaselineAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:constant:", v20, 21.0));
  v49[11] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentHeaderView bottomAnchor](self, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_secondaryLabel, "lastBaselineAnchor"));
  LODWORD(v24) = 1148829696;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:priority:", v23, 21.0, v24));
  v49[12] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 13));

  return v26;
}

- (void)setPrimaryToSecondaryLabelBaselineSpacing:(double)a3
{
  -[NSLayoutConstraint setConstant:](self->_primaryToSecondaryLabelBaselineConstraint, "setConstant:", a3);
}

- (id)viewForFirstBaselineLayout
{
  return self->_primaryLabel;
}

- (id)viewForLastBaselineLayout
{
  return self->_secondaryLabel;
}

- (void)setImageSource:(id)a3
{
  double v5;
  double v6;

  -[MKArtworkImageView setImageSource:](self->_artworkImageView, "setImageSource:");
  v5 = 40.0;
  if (a3)
  {
    v6 = 13.0;
  }
  else
  {
    v5 = 0.0;
    v6 = 0.0;
  }
  -[NSLayoutConstraint setConstant:](self->_imageViewWidthConstraint, "setConstant:", v5);
  -[NSLayoutConstraint setConstant:](self->_imageViewToPrimaryLabelHorizontalConstraint, "setConstant:", v6);
}

- (MKArtworkImageSource)imageSource
{
  return (MKArtworkImageSource *)-[MKArtworkImageView imageSource](self->_artworkImageView, "imageSource");
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (MKArtworkImageView)artworkImageView
{
  return self->_artworkImageView;
}

- (void)setArtworkImageView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkImageView, a3);
}

- (NSLayoutConstraint)imageViewToPrimaryLabelHorizontalConstraint
{
  return self->_imageViewToPrimaryLabelHorizontalConstraint;
}

- (void)setImageViewToPrimaryLabelHorizontalConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewToPrimaryLabelHorizontalConstraint, a3);
}

- (NSLayoutConstraint)imageViewWidthConstraint
{
  return self->_imageViewWidthConstraint;
}

- (void)setImageViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewWidthConstraint, a3);
}

- (NSLayoutConstraint)primaryToSecondaryLabelBaselineConstraint
{
  return self->_primaryToSecondaryLabelBaselineConstraint;
}

- (void)setPrimaryToSecondaryLabelBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_primaryToSecondaryLabelBaselineConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryToSecondaryLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewToPrimaryLabelHorizontalConstraint, 0);
  objc_storeStrong((id *)&self->_artworkImageView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end
