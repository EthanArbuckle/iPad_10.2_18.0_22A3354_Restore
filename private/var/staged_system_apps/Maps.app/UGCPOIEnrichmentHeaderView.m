@implementation UGCPOIEnrichmentHeaderView

- (UGCPOIEnrichmentHeaderView)initWithFrame:(CGRect)a3
{
  UGCPOIEnrichmentHeaderView *v3;
  UGCPOIEnrichmentHeaderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UGCPOIEnrichmentHeaderView;
  v3 = -[UGCPOIEnrichmentHeaderView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UGCPOIEnrichmentHeaderView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("UGCPOIEnrichmentHeader"));
    -[UGCPOIEnrichmentHeaderView _setupSubviews](v4, "_setupSubviews");
    -[UGCPOIEnrichmentHeaderView _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[UGCPOIEnrichmentHeaderView _cancelBrandIconDownload](self, "_cancelBrandIconDownload");
  v3.receiver = self;
  v3.super_class = (Class)UGCPOIEnrichmentHeaderView;
  -[UGCPOIEnrichmentHeaderView dealloc](&v3, "dealloc");
}

- (void)_setupSubviews
{
  id v3;
  double y;
  double width;
  double height;
  UIImageView *v7;
  UIImageView *headerImageView;
  UILabel *v9;
  UILabel *titleLabel;
  void *v11;
  UILabel *v12;
  UILabel *secondaryLabel;
  void *v14;
  void *v15;

  -[UGCPOIEnrichmentHeaderView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", 16.0, 0.0, 16.0, 0.0);
  v3 = objc_alloc((Class)UIImageView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  headerImageView = self->_headerImageView;
  self->_headerImageView = v7;

  -[UIImageView setAccessibilityIdentifier:](self->_headerImageView, "setAccessibilityIdentifier:", CFSTR("HeaderImageView"));
  v9 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UGCFontManager poiEnrichmentHeaderViewTitleFont](UGCFontManager, "poiEnrichmentHeaderViewTitleFont"));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v11);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
  v12 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UGCFontManager poiEnrichmentHeaderViewSecondaryTitleFont](UGCFontManager, "poiEnrichmentHeaderViewSecondaryTitleFont"));
  -[UILabel setFont:](self->_secondaryLabel, "setFont:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_secondaryLabel, "setTextColor:", v15);

  -[UILabel setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_secondaryLabel, "setTextAlignment:", 1);
  -[UILabel setAccessibilityIdentifier:](self->_secondaryLabel, "setAccessibilityIdentifier:", CFSTR("SecondaryLabel"));
  -[UGCPOIEnrichmentHeaderView addSubview:](self, "addSubview:", self->_headerImageView);
  -[UGCPOIEnrichmentHeaderView addSubview:](self, "addSubview:", self->_titleLabel);
  -[UGCPOIEnrichmentHeaderView addSubview:](self, "addSubview:", self->_secondaryLabel);
}

- (void)_setupConstraints
{
  id v3;
  id v4;
  void *v5;
  id v6;
  UILabel *titleLabel;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v3 = objc_msgSend(objc_alloc((Class)MUSizeLayout), "initWithItem:size:", self->_headerImageView, 40.0, 40.0);
  v4 = objc_alloc((Class)MUStackLayout);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentHeaderView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v6 = objc_msgSend(v4, "initWithContainer:axis:", v5, 1);

  titleLabel = self->_titleLabel;
  v11[0] = self->_headerImageView;
  v11[1] = titleLabel;
  v11[2] = self->_secondaryLabel;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 3));
  objc_msgSend(v6, "setArrangedLayoutItems:", v8);

  objc_msgSend(v6, "setAlignment:forArrangedLayoutItem:", 2, self->_headerImageView);
  objc_msgSend(v6, "setAlignmentBoundsContent:forArrangedLayoutItem:", 1, self->_headerImageView);
  objc_msgSend(v6, "setPadding:forArrangedLayoutItem:", self->_titleLabel, 4.0, 0.0, 0.0, 0.0);
  v10[0] = v3;
  v10[1] = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  +[NSLayoutConstraint _mapsui_activateLayouts:](NSLayoutConstraint, "_mapsui_activateLayouts:", v9);

}

- (void)setMapItem:(id)a3
{
  MKMapItem *v5;
  MKMapItem *v6;

  v5 = (MKMapItem *)a3;
  if (self->_mapItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mapItem, a3);
    -[UGCPOIEnrichmentHeaderView _refreshContent](self, "_refreshContent");
    v5 = v6;
  }

}

- (void)setHideSummaryText:(BOOL)a3
{
  if (self->_hideSummaryText != a3)
  {
    self->_hideSummaryText = a3;
    -[UGCPOIEnrichmentHeaderView _refreshContent](self, "_refreshContent");
  }
}

- (void)_refreshContent
{
  MKMapItem *mapItem;
  void *v4;
  void *v5;

  mapItem = self->_mapItem;
  if (mapItem)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem name](mapItem, "name"));
    -[UILabel setText:](self->_titleLabel, "setText:", v4);

    if (self->_hideSummaryText)
    {
      -[UILabel setText:](self->_secondaryLabel, "setText:", 0);
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _shortAddress](self->_mapItem, "_shortAddress"));
      -[UILabel setText:](self->_secondaryLabel, "setText:", v5);

    }
    -[UGCPOIEnrichmentHeaderView _updateIcon](self, "_updateIcon");
  }
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UGCPOIEnrichmentHeaderView;
  -[UGCPOIEnrichmentHeaderView layoutSubviews](&v4, "layoutSubviews");
  -[UIImageView setClipsToBounds:](self->_headerImageView, "setClipsToBounds:", 1);
  -[UIImageView bounds](self->_headerImageView, "bounds");
  -[UIImageView _setCornerRadius:](self->_headerImageView, "_setCornerRadius:", v3 * 0.5);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UGCPOIEnrichmentHeaderView;
  v4 = a3;
  -[UGCPOIEnrichmentHeaderView traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentHeaderView traitCollection](self, "traitCollection", v10.receiver, v10.super_class));
  objc_msgSend(v5, "displayScale");
  v7 = v6;
  objc_msgSend(v4, "displayScale");
  v9 = v8;

  if (v7 != v9)
    -[UGCPOIEnrichmentHeaderView _refreshContent](self, "_refreshContent");
}

- (void)_updateIcon
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  NSURL **p_brandIconURL;
  NSURL *v8;
  NSURL *obj;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentHeaderView traitCollection](self, "traitCollection"));
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
  obj = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_bestAvatarBrandIconURLForSize:allowSmaller:", 1, v5 * 40.0, v5 * 40.0));

  p_brandIconURL = &self->_brandIconURL;
  v8 = obj;
  if (obj != self->_brandIconURL)
  {
    if ((-[NSURL isEqual:](obj, "isEqual:") & 1) == 0)
    {
      -[UGCPOIEnrichmentHeaderView _cancelBrandIconDownload](self, "_cancelBrandIconDownload");
      objc_storeStrong((id *)p_brandIconURL, obj);
      -[UGCPOIEnrichmentHeaderView _startBrandIconDownload](self, "_startBrandIconDownload");
    }
    v8 = *p_brandIconURL;
  }
  if (!v8)
    -[UGCPOIEnrichmentHeaderView _setBrandIcon:fallbackToMapItemIcon:](self, "_setBrandIcon:fallbackToMapItemIcon:", 0, 1);

}

- (void)_cancelBrandIconDownload
{
  id v3;

  if (self->_brandIconURL)
  {
    if (self->_isDownloadingBrandIcon)
    {
      self->_isDownloadingBrandIcon = 0;
      v3 = (id)objc_claimAutoreleasedReturnValue(+[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager"));
      objc_msgSend(v3, "cancelLoadAppImageAtURL:", self->_brandIconURL);

    }
  }
}

- (void)_startBrandIconDownload
{
  NSURL *v3;
  void *v4;
  NSURL *v5;
  _QWORD v6[4];
  NSURL *v7;
  id v8;
  id location;

  if (self->_brandIconURL)
  {
    if (!self->_isDownloadingBrandIcon)
    {
      objc_initWeak(&location, self);
      v3 = self->_brandIconURL;
      self->_isDownloadingBrandIcon = 1;
      -[UGCPOIEnrichmentHeaderView _setBrandIcon:fallbackToMapItemIcon:](self, "_setBrandIcon:fallbackToMapItemIcon:", 0, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager"));
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100A3DC8C;
      v6[3] = &unk_1011E0778;
      objc_copyWeak(&v8, &location);
      v5 = v3;
      v7 = v5;
      objc_msgSend(v4, "loadAppImageAtURL:completionHandler:", v5, v6);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_setBrandIcon:(id)a3 fallbackToMapItemIcon:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  MKMapItem *mapItem;
  void *v9;
  id v10;

  v4 = a4;
  v6 = a3;
  v10 = v6;
  if (v6)
  {
    v7 = v6;
  }
  else if (v4)
  {
    mapItem = self->_mapItem;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentHeaderView traitCollection](self, "traitCollection"));
    objc_msgSend(v9, "displayScale");
    v7 = (id)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForMapItem:forScale:fallbackToBundleIcon:](MKIconManager, "imageForMapItem:forScale:fallbackToBundleIcon:", mapItem, 0));

  }
  else
  {
    v7 = 0;
  }
  -[UIImageView setImage:](self->_headerImageView, "setImage:", v7);

}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (BOOL)hideSummaryText
{
  return self->_hideSummaryText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_brandIconURL, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
}

@end
