@implementation UGCPhotoThumbnailCollectionViewCell

- (UGCPhotoThumbnailCollectionViewCell)initWithFrame:(CGRect)a3
{
  UGCPhotoThumbnailCollectionViewCell *v3;
  UGCPhotoThumbnailCollectionViewCell *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UGCPhotoThumbnailCollectionViewCell;
  v3 = -[UGCPhotoThumbnailCollectionViewCell initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("UGC"), &stru_1011EB268));
    -[UGCPhotoThumbnailCollectionViewCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v8);

    -[UGCPhotoThumbnailCollectionViewCell _setupSubviews](v4, "_setupSubviews");
    -[UGCPhotoThumbnailCollectionViewCell _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)_setupSubviews
{
  id v3;
  double y;
  double width;
  double height;
  UIImageView *v7;
  UIImageView *photoImageView;
  void *v9;
  _TtC4Maps26UGCPhotoThumbnailBadgeView *v10;
  _TtC4Maps26UGCPhotoThumbnailBadgeView *badgeView;

  v3 = objc_alloc((Class)UIImageView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  photoImageView = self->_photoImageView;
  self->_photoImageView = v7;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_photoImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setContentMode:](self->_photoImageView, "setContentMode:", 2);
  -[UIImageView setClipsToBounds:](self->_photoImageView, "setClipsToBounds:", 1);
  -[UIImageView setAccessibilityIgnoresInvertColors:](self->_photoImageView, "setAccessibilityIgnoresInvertColors:", 1);
  -[UIImageView setAccessibilityIdentifier:](self->_photoImageView, "setAccessibilityIdentifier:", CFSTR("PhotoImageView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v9, "addSubview:", self->_photoImageView);

  v10 = -[UGCPhotoThumbnailBadgeView initWithFrame:]([_TtC4Maps26UGCPhotoThumbnailBadgeView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  badgeView = self->_badgeView;
  self->_badgeView = v10;

  -[UGCPhotoThumbnailBadgeView setTranslatesAutoresizingMaskIntoConstraints:](self->_badgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView addSubview:](self->_photoImageView, "addSubview:", self->_badgeView);
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[8];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell contentView](self, "contentView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v38[0] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
  v38[1] = v30;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
  v29 = v3;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v38[2] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v38[3] = v21;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailBadgeView leadingAnchor](self->_badgeView, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:constant:", v18, kMUPlaceSystemSpacing));
  v38[4] = v17;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailBadgeView trailingAnchor](self->_badgeView, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v14));
  v38[5] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailBadgeView bottomAnchor](self->_badgeView, "bottomAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));
  v38[6] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailBadgeView topAnchor](self->_badgeView, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:", v11));
  v38[7] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

}

- (void)setImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  objc_msgSend(v5, "setImage:", v4);

}

- (UIImage)image
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell photoImageView](self, "photoImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "image"));

  return (UIImage *)v3;
}

- (void)setProviderName:(id)a3
{
  NSString *v4;
  NSString *providerName;
  id v6;

  v6 = a3;
  if ((-[NSString isEqual:](self->_providerName, "isEqual:") & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    providerName = self->_providerName;
    self->_providerName = v4;

    -[UGCPhotoThumbnailCollectionViewCell _updateBadge](self, "_updateBadge");
    -[UGCPhotoThumbnailBadgeView setHidden:](self->_badgeView, "setHidden:", -[NSString length](self->_providerName, "length") == 0);
  }

}

- (void)_updateBadge
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[2];
  _QWORD v19[2];

  if (-[NSString length](self->_providerName, "length"))
  {
    v3 = objc_alloc((Class)NSAttributedString);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%@ %@ [Badge format]"), CFSTR("localized string not found"), 0));
    v6 = objc_msgSend(v3, "initWithString:", v5);

    v7 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", self->_providerName);
    v8 = objc_alloc_init((Class)NSTextAttachment);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotoThumbnailBadgeView attributionFont](_TtC4Maps26UGCPhotoThumbnailBadgeView, "attributionFont"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("arrow.up.right.square.fill"), v10));
    objc_msgSend(v8, "setImage:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v8));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableAttributedString localizedAttributedStringWithFormat:](NSMutableAttributedString, "localizedAttributedStringWithFormat:", v6, v7, v12));
    v18[0] = NSFontAttributeName;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPhotoThumbnailBadgeView attributionFont](_TtC4Maps26UGCPhotoThumbnailBadgeView, "attributionFont"));
    v19[0] = v14;
    v18[1] = NSForegroundColorAttributeName;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v19[1] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
    objc_msgSend(v13, "addAttributes:range:", v16, 0, objc_msgSend(v13, "length"));

    v17 = objc_msgSend(v13, "copy");
    -[UGCPhotoThumbnailBadgeView setAttributedText:](self->_badgeView, "setAttributedText:", v17);

  }
  else
  {
    -[UGCPhotoThumbnailBadgeView setAttributedText:](self->_badgeView, "setAttributedText:", 0);
  }
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
  v9.super_class = (Class)UGCPhotoThumbnailCollectionViewCell;
  v4 = a3;
  -[UGCPhotoThumbnailCollectionViewCell traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoThumbnailCollectionViewCell traitCollection](self, "traitCollection", v9.receiver, v9.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v8 = sub_1002A8950(v6, v7);
  if (v8)
    -[UGCPhotoThumbnailCollectionViewCell _updateBadge](self, "_updateBadge");
}

+ (NSString)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(UGCPhotoThumbnailCollectionViewCell);
  return NSStringFromClass(v2);
}

- (void)prepareForReuse
{
  NSString *assetIdentifier;
  NSString *providerName;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UGCPhotoThumbnailCollectionViewCell;
  -[UGCPhotoThumbnailCollectionViewCell prepareForReuse](&v5, "prepareForReuse");
  assetIdentifier = self->_assetIdentifier;
  self->_assetIdentifier = 0;

  -[UIImageView setImage:](self->_photoImageView, "setImage:", 0);
  providerName = self->_providerName;
  self->_providerName = 0;

}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void)setAssetIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)providerName
{
  return self->_providerName;
}

- (UIImageView)photoImageView
{
  return self->_photoImageView;
}

- (void)setPhotoImageView:(id)a3
{
  objc_storeStrong((id *)&self->_photoImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoImageView, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end
