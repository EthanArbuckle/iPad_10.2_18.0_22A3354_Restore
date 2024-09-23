@implementation RAPLookAroundThumbnailTableViewCell

- (RAPLookAroundThumbnailTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RAPLookAroundThumbnailTableViewCell *v4;
  RAPLookAroundThumbnailTableViewCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RAPLookAroundThumbnailTableViewCell;
  v4 = -[RAPLookAroundThumbnailTableViewCell initWithStyle:reuseIdentifier:](&v8, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[RAPLookAroundThumbnailTableViewCell _setupSubviews](v4, "_setupSubviews");
    -[RAPLookAroundThumbnailTableViewCell _setupConstraints](v5, "_setupConstraints");
    -[RAPLookAroundThumbnailTableViewCell _updateFonts](v5, "_updateFonts");
    -[RAPLookAroundThumbnailTableViewCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, "_contentSizeDidChange", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v5;
}

- (void)setThumbnailImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_thumbnailImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_thumbnailImage, a3);
    -[UIImageView setImage:](self->_thumbnailImageView, "setImage:", self->_thumbnailImage);
    v5 = v6;
  }

}

- (void)_setupSubviews
{
  id v3;
  double y;
  double width;
  double height;
  UIImageView *v7;
  UIImageView *thumbnailImageView;
  UILabel *v9;
  UILabel *nameLabel;
  UILabel *v11;
  UILabel *locationLabel;
  void *v13;
  void *v14;
  id v15;

  v3 = objc_alloc((Class)UIImageView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  thumbnailImageView = self->_thumbnailImageView;
  self->_thumbnailImageView = v7;

  -[UIImageView setContentMode:](self->_thumbnailImageView, "setContentMode:", 2);
  -[UIImageView setClipsToBounds:](self->_thumbnailImageView, "setClipsToBounds:", 1);
  v9 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  nameLabel = self->_nameLabel;
  self->_nameLabel = v9;

  -[UILabel setNumberOfLines:](self->_nameLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_nameLabel, "setLineBreakMode:", 0);
  v11 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  locationLabel = self->_locationLabel;
  self->_locationLabel = v11;

  -[UILabel setNumberOfLines:](self->_locationLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_locationLabel, "setLineBreakMode:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_nameLabel, "setTextColor:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_locationLabel, "setTextColor:", v14);

  v15 = (id)objc_claimAutoreleasedReturnValue(-[RAPLookAroundThumbnailTableViewCell contentView](self, "contentView"));
  objc_msgSend(v15, "addSubview:", self->_thumbnailImageView);
  objc_msgSend(v15, "addSubview:", self->_nameLabel);
  objc_msgSend(v15, "addSubview:", self->_locationLabel);
  -[RAPLookAroundThumbnailTableViewCell _updateFonts](self, "_updateFonts");

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *topToNameBaselineConstraint;
  void *v9;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *nameToLocationBaselineConstraint;
  void *v14;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *locationToBottomBaselineConstraint;
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
  NSLayoutConstraint *v29;
  NSLayoutConstraint *v30;
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
  _QWORD v46[11];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundThumbnailTableViewCell contentView](self, "contentView"));
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_thumbnailImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_locationLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_nameLabel, "firstBaselineAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_nameLabel, "font"));
  objc_msgSend(v6, "_scaledValueForValue:", 60.0);
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5));
  topToNameBaselineConstraint = self->_topToNameBaselineConstraint;
  self->_topToNameBaselineConstraint = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_locationLabel, "firstBaselineAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_nameLabel, "lastBaselineAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_locationLabel, "font"));
  objc_msgSend(v11, "_scaledValueForValue:", 22.0);
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10));
  nameToLocationBaselineConstraint = self->_nameToLocationBaselineConstraint;
  self->_nameToLocationBaselineConstraint = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_locationLabel, "lastBaselineAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_locationLabel, "font"));
  objc_msgSend(v16, "_scaledValueForValue:", -48.0);
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15));
  locationToBottomBaselineConstraint = self->_locationToBottomBaselineConstraint;
  self->_locationToBottomBaselineConstraint = v17;

  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_thumbnailImageView, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, -20.0));
  v46[0] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_thumbnailImageView, "heightAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToConstant:", 110.0));
  v46[1] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_thumbnailImageView, "widthAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToConstant:", 90.0));
  v46[2] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_thumbnailImageView, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_nameLabel, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, -16.0));
  v46[3] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_locationLabel, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_nameLabel, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v46[4] = v32;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_thumbnailImageView, "centerYAnchor"));
  v20 = v3;
  v33 = v3;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerYAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
  v46[5] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_nameLabel, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -16.0));
  v46[6] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_locationLabel, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
  v29 = self->_topToNameBaselineConstraint;
  v46[7] = v28;
  v46[8] = v29;
  v30 = self->_locationToBottomBaselineConstraint;
  v46[9] = self->_nameToLocationBaselineConstraint;
  v46[10] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 11));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

}

- (void)setViewState:(id)a3
{
  GEOPDMuninViewState *v5;
  GEOPDMuninViewState **p_viewState;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  GEOPDMuninViewState *v11;

  v5 = (GEOPDMuninViewState *)a3;
  p_viewState = &self->_viewState;
  if (self->_viewState != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_viewState, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPDMuninViewState locationInfo](*p_viewState, "locationInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "locationName"));
    -[UILabel setText:](self->_nameLabel, "setText:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPDMuninViewState locationInfo](*p_viewState, "locationInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localityName"));
    -[UILabel setText:](self->_locationLabel, "setText:", v10);

    v5 = v11;
  }

}

- (void)_contentSizeDidChange
{
  void *v3;
  void *v4;
  id v5;

  -[RAPLookAroundThumbnailTableViewCell _updateFonts](self, "_updateFonts");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_nameLabel, "font"));
  objc_msgSend(v3, "_scaledValueForValue:", 60.0);
  -[NSLayoutConstraint setConstant:](self->_topToNameBaselineConstraint, "setConstant:");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_locationLabel, "font"));
  objc_msgSend(v4, "_scaledValueForValue:", 22.0);
  -[NSLayoutConstraint setConstant:](self->_nameToLocationBaselineConstraint, "setConstant:");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_locationLabel, "font"));
  objc_msgSend(v5, "_scaledValueForValue:", -48.0);
  -[NSLayoutConstraint setConstant:](self->_locationToBottomBaselineConstraint, "setConstant:");

}

- (void)_updateFonts
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  -[UILabel setFont:](self->_nameLabel, "setFont:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  -[UILabel setFont:](self->_locationLabel, "setFont:", v4);

}

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("RAPLookAroundThumbnailTableViewCell");
}

- (GEOPDMuninViewState)viewState
{
  return self->_viewState;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_locationToBottomBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_nameToLocationBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_topToNameBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
}

@end
