@implementation TransitAlightBannerView

- (TransitAlightBannerView)initWithTarget:(id)a3 item:(id)a4 aperturePresentation:(BOOL)a5
{
  _BOOL4 v5;
  TransitAlightBannerView *v6;
  TransitAlightBannerView *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  MKArtworkImageView *v11;
  MKArtworkImageView *imageView;
  UILabel *v13;
  UILabel *titleLabel;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UILabel *v19;
  UILabel *descriptionLabel;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  MapsBannerContent *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  objc_super v39;
  _QWORD v40[2];

  v5 = a5;
  v39.receiver = self;
  v39.super_class = (Class)TransitAlightBannerView;
  v6 = -[MapsBannerView initWithTarget:item:aperturePresentation:](&v39, "initWithTarget:item:aperturePresentation:", a3, a4);
  v7 = v6;
  if (v6)
  {
    v8 = (objc_class *)objc_opt_class(v6);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[TransitAlightBannerView setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", v10);

    -[TransitAlightBannerView setOverrideUserInterfaceStyle:](v7, "setOverrideUserInterfaceStyle:", 2);
    v11 = objc_opt_new(MKArtworkImageView);
    imageView = v7->_imageView;
    v7->_imageView = v11;

    -[MKArtworkImageView setAccessibilityIdentifier:](v7->_imageView, "setAccessibilityIdentifier:", CFSTR("ImageView"));
    -[MKArtworkImageView setTranslatesAutoresizingMaskIntoConstraints:](v7->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKArtworkImageView setContentMode:](v7->_imageView, "setContentMode:", 1);
    v13 = objc_opt_new(UILabel);
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = v13;

    -[UILabel setAccessibilityIdentifier:](v7->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v7->_titleLabel, "setNumberOfLines:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "resolvedColorWithTraitCollection:", v16));
    -[UILabel setTextColor:](v7->_titleLabel, "setTextColor:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleTitle2, UIFontWeightBold));
    -[UILabel setFont:](v7->_titleLabel, "setFont:", v18);

    v19 = objc_opt_new(UILabel);
    descriptionLabel = v7->_descriptionLabel;
    v7->_descriptionLabel = v19;

    -[UILabel setAccessibilityIdentifier:](v7->_descriptionLabel, "setAccessibilityIdentifier:", CFSTR("DescriptionLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v7->_descriptionLabel, "setNumberOfLines:", 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "resolvedColorWithTraitCollection:", v22));
    -[UILabel setTextColor:](v7->_descriptionLabel, "setTextColor:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleTitle2, UIFontWeightMedium));
    -[UILabel setFont:](v7->_descriptionLabel, "setFont:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView widthAnchor](v7->_imageView, "widthAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintGreaterThanOrEqualToConstant:", 36.0));
    v40[0] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView heightAnchor](v7->_imageView, "heightAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToConstant:", 36.0));
    v40[1] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

    v30 = -[MapsBannerContent initWithHeaderView:iconView:leadingTopView:trailingTopView:bottomView:footerView:]([MapsBannerContent alloc], "initWithHeaderView:iconView:leadingTopView:trailingTopView:bottomView:footerView:", 0, v7->_imageView, v7->_titleLabel, 0, v7->_descriptionLabel, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView contentView](v7, "contentView"));
    objc_msgSend(v31, "setContent:", v30);

    if (v5)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel _tightBoundingBoxLayoutGuide](v7->_titleLabel, "_tightBoundingBoxLayoutGuide"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[TransitAlightBannerView SBUISA_systemApertureObstructedAreaLayoutGuide](v7, "SBUISA_systemApertureObstructedAreaLayoutGuide"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v35));

      LODWORD(v37) = 1144750080;
      objc_msgSend(v36, "setPriority:", v37);
      objc_msgSend(v36, "setActive:", 1);

    }
    -[TransitAlightBannerView updateFromBannerItem](v7, "updateFromBannerItem");
    v7->_cachedHeight = -1.0;
    v7->_calculatedWidth = -1.0;
  }
  return v7;
}

- (void)updateFromBannerItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  NSAttributedStringKey v29;
  void *v30;
  NSAttributedStringKey v31;
  void *v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView item](self, "item"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "route"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "alightMessage"));
  v28 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stepAtIndex:", objc_msgSend(v6, "stepIndex")));

  v27 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextAlightingStep"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "artwork"));
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transitLine"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "artwork"));
    v14 = v13;
    if (v13)
    {
      v11 = v13;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transitLine"));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "alternateArtwork"));

    }
  }

  v16 = objc_msgSend(objc_alloc((Class)MKSizedTransitArtwork), "initWithArtwork:shieldSize:artworkCache:", v11, 7, 0);
  -[MKArtworkImageView setImageSource:](self->_imageView, "setImageSource:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  v31 = NSFontAttributeName;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_titleLabel, "font"));
  v32 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString _mapkit_attributedStringForComposedString:defaultAttributes:](NSAttributedString, "_mapkit_attributedStringForComposedString:defaultAttributes:", v17, v19));
  -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subtitle"));
  v29 = NSFontAttributeName;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_descriptionLabel, "font"));
  v30 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString _mapkit_attributedStringForComposedString:defaultAttributes:](NSAttributedString, "_mapkit_attributedStringForComposedString:defaultAttributes:", v21, v23));
  -[UILabel setAttributedText:](self->_descriptionLabel, "setAttributedText:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](self->_descriptionLabel, "attributedText"));
  v26 = objc_msgSend(v25, "length") == 0;

  -[UILabel setHidden:](self->_descriptionLabel, "setHidden:", v26);
  self->_cachedHeight = -1.0;

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  double cachedHeight;
  double v7;
  double v8;
  void *v9;
  double v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSString *v14;
  void *v15;
  double v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  double v22;
  CGSize v23;
  CGSize result;

  height = a3.height;
  width = a3.width;
  cachedHeight = self->_cachedHeight;
  if (cachedHeight == -1.0 || self->_calculatedWidth != a3.width)
  {
    -[TransitAlightBannerView _maps_compressedSizeForWidth:withBlock:](self, "_maps_compressedSizeForWidth:withBlock:", 0, a3.width);
    v8 = v7;
    if (-[MapsBannerView aperturePresentation](self, "aperturePresentation"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView contentView](self, "contentView"));
      objc_msgSend(v9, "_maps_compressedSizeForWidth:withBlock:", 0, width);
      v8 = v10 + 17.0;

    }
    if (v8 <= height)
    {
      self->_cachedHeight = v8;
      self->_calculatedWidth = width;
      cachedHeight = self->_cachedHeight;
    }
    else
    {
      v11 = sub_100431C7C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView item](self, "item"));
        v23.width = width;
        v23.height = height;
        v14 = NSStringFromCGSize(v23);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v17 = 138412802;
        v18 = v13;
        v19 = 2112;
        v20 = v15;
        v21 = 2048;
        v22 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Banner: %@ wasn't able to draw correctly in the provided space: %@ desired height: %f", (uint8_t *)&v17, 0x20u);

      }
      cachedHeight = height;
    }
  }
  v16 = width;
  result.height = cachedHeight;
  result.width = v16;
  return result;
}

- (unint64_t)bannerType
{
  return 2;
}

- (void)wasDismissedByUser
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9005, 38, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
