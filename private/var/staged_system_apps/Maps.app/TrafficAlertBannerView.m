@implementation TrafficAlertBannerView

- (TrafficAlertBannerView)initWithTarget:(id)a3 item:(id)a4 aperturePresentation:(BOOL)a5
{
  _BOOL4 v5;
  TrafficAlertBannerView *v6;
  TrafficAlertBannerView *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  MKArtworkImageView *v11;
  MKArtworkImageView *artworkImageView;
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
  v39.super_class = (Class)TrafficAlertBannerView;
  v6 = -[MapsBannerView initWithTarget:item:aperturePresentation:](&v39, "initWithTarget:item:aperturePresentation:", a3, a4);
  v7 = v6;
  if (v6)
  {
    v8 = (objc_class *)objc_opt_class(v6);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[TrafficAlertBannerView setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", v10);

    v11 = (MKArtworkImageView *)objc_alloc_init((Class)MKArtworkImageView);
    artworkImageView = v7->_artworkImageView;
    v7->_artworkImageView = v11;

    -[MKArtworkImageView setAccessibilityIdentifier:](v7->_artworkImageView, "setAccessibilityIdentifier:", CFSTR("ArtworkImageView"));
    -[MKArtworkImageView setTranslatesAutoresizingMaskIntoConstraints:](v7->_artworkImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKArtworkImageView setContentMode:](v7->_artworkImageView, "setContentMode:", 1);
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

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 26.0, UIFontWeightHeavy));
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

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 26.0, UIFontWeightMedium));
    -[UILabel setFont:](v7->_descriptionLabel, "setFont:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView widthAnchor](v7->_artworkImageView, "widthAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToConstant:", 46.0));
    v40[0] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView heightAnchor](v7->_artworkImageView, "heightAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToConstant:", 46.0));
    v40[1] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

    v30 = -[MapsBannerContent initWithHeaderView:iconView:leadingTopView:trailingTopView:bottomView:footerView:]([MapsBannerContent alloc], "initWithHeaderView:iconView:leadingTopView:trailingTopView:bottomView:footerView:", 0, v7->_artworkImageView, v7->_titleLabel, 0, v7->_descriptionLabel, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView contentView](v7, "contentView"));
    objc_msgSend(v31, "setContent:", v30);

    if (v5)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel _tightBoundingBoxLayoutGuide](v7->_titleLabel, "_tightBoundingBoxLayoutGuide"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficAlertBannerView SBUISA_systemApertureObstructedAreaLayoutGuide](v7, "SBUISA_systemApertureObstructedAreaLayoutGuide"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v35));

      LODWORD(v37) = 1144750080;
      objc_msgSend(v36, "setPriority:", v37);
      objc_msgSend(v36, "setActive:", 1);

    }
    -[TrafficAlertBannerView updateFromBannerItem](v7, "updateFromBannerItem");
    v7->_cachedHeight = -1.0;
    v7->_calculatedWidth = -1.0;
  }
  return v7;
}

- (void)updateFromBannerItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unsigned int v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = (id)objc_claimAutoreleasedReturnValue(-[MapsBannerView item](self, "item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_titleLabel, "text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "title"));
  v5 = v3;
  v6 = v4;
  if (v5 | v6)
  {
    v7 = objc_msgSend((id)v5, "isEqual:", v6);

    if (!v7)
      goto LABEL_10;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_descriptionLabel, "text"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "subtitle"));
  v10 = v8;
  v11 = v9;
  if (v10 | v11)
  {
    v12 = objc_msgSend((id)v10, "isEqual:", v11);

    if (!v12)
    {

LABEL_10:
LABEL_11:
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "title"));
      -[UILabel setText:](self->_titleLabel, "setText:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "title"));
      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "title"));
        -[UILabel setHidden:](self->_titleLabel, "setHidden:", objc_msgSend(v21, "length") == 0);

      }
      else
      {
        -[UILabel setHidden:](self->_titleLabel, "setHidden:", 1);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "subtitle"));
      -[UILabel setText:](self->_descriptionLabel, "setText:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "subtitle"));
      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "subtitle"));
        -[UILabel setHidden:](self->_descriptionLabel, "setHidden:", objc_msgSend(v24, "length") == 0);

      }
      else
      {
        -[UILabel setHidden:](self->_descriptionLabel, "setHidden:", 1);
      }

      self->_cachedHeight = -1.0;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "icon"));
      -[MKArtworkImageView setImageSource:](self->_artworkImageView, "setImageSource:", v25);

      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "icon"));
      -[MKArtworkImageView setHidden:](self->_artworkImageView, "setHidden:", v5 == 0);
      goto LABEL_18;
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView image](self->_artworkImageView, "image"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "icon"));
  v15 = v13;
  v16 = v14;
  if (v15 | v16)
  {
    v17 = (void *)v16;
    v18 = objc_msgSend((id)v15, "isEqual:", v16);

    if ((v18 & 1) != 0)
      goto LABEL_19;
    goto LABEL_11;
  }

LABEL_18:
LABEL_19:

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  double cachedHeight;
  double v7;
  double v8;
  void *v9;
  double MaxY;
  void *v11;
  double v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSString *v16;
  void *v17;
  double v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  double v24;
  CGSize v25;
  CGSize result;
  CGRect v27;

  height = a3.height;
  width = a3.width;
  cachedHeight = self->_cachedHeight;
  if (cachedHeight == -1.0 || self->_calculatedWidth != a3.width)
  {
    -[TrafficAlertBannerView _maps_compressedSizeForWidth:withBlock:](self, "_maps_compressedSizeForWidth:withBlock:", 0, a3.width);
    v8 = v7;
    if (-[MapsBannerView aperturePresentation](self, "aperturePresentation"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficAlertBannerView SBUISA_systemApertureObstructedAreaLayoutGuide](self, "SBUISA_systemApertureObstructedAreaLayoutGuide"));
      objc_msgSend(v9, "layoutFrame");
      MaxY = CGRectGetMaxY(v27);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView contentView](self, "contentView"));
      objc_msgSend(v11, "_maps_compressedSizeForWidth:withBlock:", 0, width);
      v8 = MaxY + v12 + 17.0;

    }
    if (v8 <= height)
    {
      self->_cachedHeight = v8;
      self->_calculatedWidth = width;
      cachedHeight = self->_cachedHeight;
    }
    else
    {
      v13 = sub_100431C7C();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsBannerView item](self, "item"));
        v25.width = width;
        v25.height = height;
        v16 = NSStringFromCGSize(v25);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v19 = 138412802;
        v20 = v15;
        v21 = 2112;
        v22 = v17;
        v23 = 2048;
        v24 = v8;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "Banner: %@ wasn't able to draw correctly in the provided space: %@ desired height: %f", (uint8_t *)&v19, 0x20u);

      }
      cachedHeight = height;
    }
  }
  v18 = width;
  result.height = cachedHeight;
  result.width = v18;
  return result;
}

- (unint64_t)bannerType
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkImageView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
