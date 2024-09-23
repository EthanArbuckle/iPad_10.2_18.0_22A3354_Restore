@implementation SearchResultTableViewCell

+ (double)estimatedCellHeight
{
  return 100.0;
}

- (SearchResultTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SearchResultTableViewCell *v4;
  SearchResultTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  UIImageView *v13;
  UIImageView *imageView;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SearchResultTableViewCell;
  v4 = -[_SearchResultTableViewCell initWithStyle:reuseIdentifier:](&v21, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultTableViewCell window](v4, "window"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screen"));
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "nativeScale");
      v10 = v9;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v11, "nativeScale");
      v10 = v12;

    }
    v13 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    imageView = v5->_imageView;
    v5->_imageView = v13;

    -[UIImageView setClipsToBounds:](v5->_imageView, "setClipsToBounds:", 1);
    -[SearchResultTableViewCell _imageSize](v5, "_imageSize");
    -[UIImageView setMinimumLayoutSize:](v5->_imageView, "setMinimumLayoutSize:");
    -[SearchResultTableViewCell _imageSize](v5, "_imageSize");
    -[UIImageView setMaximumLayoutSize:](v5->_imageView, "setMaximumLayoutSize:");
    -[UIImageView setAccessibilityIdentifier:](v5->_imageView, "setAccessibilityIdentifier:", CFSTR("ImageView"));
    if (sub_1002A8AA0(v5) == 5)
    {
      -[UIImageView setCustomAlignmentRectInsets:](v5->_imageView, "setCustomAlignmentRectInsets:", -3.0, 0.0, 0.0, 0.0);
      -[NUIContainerStackView insertArrangedSubview:atIndex:](v5->super._containerStackView, "insertArrangedSubview:atIndex:", v5->_imageView, 0);
    }
    else if (!v5->super._accessibilityEnabled)
    {
      -[UIImageView _setContinuousCornerRadius:](v5->_imageView, "_setContinuousCornerRadius:", 8.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v5->_imageView, "layer"));
      objc_msgSend(v15, "setBorderWidth:", 1.0 / v10);

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
      -[UIImageView setTintColor:](v5->_imageView, "setTintColor:", v16);

      -[UIImageView setCustomAlignmentRectInsets:](v5->_imageView, "setCustomAlignmentRectInsets:", -1.0, 0.0, 0.0, 0.0);
      -[NUIContainerStackView addArrangedSubview:](v5->super._containerStackView, "addArrangedSubview:", v5->_imageView);
      -[SearchResultTableViewCell leadingMargin](v5, "leadingMargin");
      v18 = v17;
      -[SearchResultTableViewCell trailingMargin](v5, "trailingMargin");
      -[NUIContainerStackView setLayoutMargins:](v5->super._containerStackView, "setLayoutMargins:", 15.0, v18, 0.0, v19);
    }
  }
  return v5;
}

- (void)_updateSpacings
{
  void *v3;
  char *v4;
  NUIContainerStackView *labelStackView;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchResultTableViewCell;
  -[_SearchResultTableViewCell _updateSpacings](&v7, "_updateSpacings");
  if (sub_1002A8AA0(self) != 5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NUIContainerStackView arrangedSubviews](self->super._labelStackView, "arrangedSubviews"));
    if (objc_msgSend(v3, "containsObject:", self->super._secondLabelStackView))
    {
      v4 = (char *)objc_msgSend(v3, "indexOfObject:", self->super._secondLabelStackView);
      if (v4 < (char *)objc_msgSend(v3, "count") - 1)
      {
        labelStackView = self->super._labelStackView;
        -[NUIContainerStackView spacing](labelStackView, "spacing");
        -[NUIContainerStackView setCustomSpacing:afterView:](labelStackView, "setCustomSpacing:afterView:", self->super._secondLabelStackView, v6 + 1.0);
      }
    }

  }
}

- (int64_t)containerAlignment
{
  if (sub_1002A8AA0(self) == 5 && (id)-[_SearchResultTableViewCell numberOfLines](self, "numberOfLines") == (id)1)
    return 3;
  else
    return 1;
}

- (void)updateImageViewAlignmentAndSpacingIfNeeded
{
  double top;
  double left;
  UIImageView *imageView;
  double bottom;
  double right;

  if (sub_1002A8AA0(self) == 5)
  {
    if ((id)-[_SearchResultTableViewCell numberOfLines](self, "numberOfLines") == (id)1)
    {
      top = UIEdgeInsetsZero.top;
      left = UIEdgeInsetsZero.left;
      imageView = self->_imageView;
      bottom = UIEdgeInsetsZero.bottom;
      right = UIEdgeInsetsZero.right;
    }
    else
    {
      imageView = self->_imageView;
      top = -3.0;
      left = 0.0;
      bottom = 0.0;
      right = 0.0;
    }
    -[UIImageView setCustomAlignmentRectInsets:](imageView, "setCustomAlignmentRectInsets:", top, left, bottom, right);
  }
}

- (void)setDisplaysAsChainResult:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchResultTableViewCell;
  -[_SearchResultTableViewCell setDisplaysAsChainResult:](&v8, "setDisplaysAsChainResult:", a3);
  -[SearchResultTableViewCell _imageSize](self, "_imageSize");
  v5 = v4;
  v7 = v6;
  -[UIImageView setMinimumLayoutSize:](self->_imageView, "setMinimumLayoutSize:");
  -[UIImageView setMaximumLayoutSize:](self->_imageView, "setMaximumLayoutSize:", v5, v7);
}

- (double)leadingMargin
{
  uint64_t v2;
  double result;

  v2 = sub_1002A8AA0(self);
  result = 16.0;
  if (v2 == 5)
    return 0.0;
  return result;
}

- (double)trailingMargin
{
  double result;
  objc_super v3;

  if (!self->super._accessibilityEnabled)
    return 16.0;
  v3.receiver = self;
  v3.super_class = (Class)SearchResultTableViewCell;
  -[_SearchResultTableViewCell trailingMargin](&v3, "trailingMargin");
  return result;
}

- (double)horizontalSpacing
{
  uint64_t v3;
  double result;
  objc_super v5;

  v3 = sub_1002A8AA0(self);
  result = 8.0;
  if (v3 != 5)
  {
    if (self->super._accessibilityEnabled)
    {
      v5.receiver = self;
      v5.super_class = (Class)SearchResultTableViewCell;
      -[_SearchResultTableViewCell horizontalSpacing](&v5, "horizontalSpacing", 8.0);
    }
    else
    {
      return 5.0;
    }
  }
  return result;
}

- (void)updateTheme
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SearchResultTableViewCell;
  -[_SearchResultTableViewCell updateTheme](&v9, "updateTheme");
  if (sub_1002A8AA0(self) != 5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultTableViewCell theme](self, "theme"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageBackgroundColor"));
    -[UIImageView setBackgroundColor:](self->_imageView, "setBackgroundColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultTableViewCell theme](self, "theme"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageBorderColor")));
    v7 = objc_msgSend(v6, "CGColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
    objc_msgSend(v8, "setBorderColor:", v7);

  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchResultTableViewCell;
  -[_SearchResultTableViewCell prepareForReuse](&v3, "prepareForReuse");
  -[_SearchResultTableViewCell setDebugString:](self, "setDebugString:", 0);
}

- (void)didUpdateMapItem
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchResultTableViewCell;
  -[_SearchResultTableViewCell didUpdateMapItem](&v3, "didUpdateMapItem");
  -[SearchResultTableViewCell cancelLoadingPhoto](self, "cancelLoadingPhoto");
  ++self->_imageState;
  -[UIImageView setImage:](self->_imageView, "setImage:", 0);
  -[SearchResultTableViewCell loadPhoto](self, "loadPhoto");
}

- (void)didUpdatePublisherResult
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchResultTableViewCell;
  -[_SearchResultTableViewCell didUpdatePublisherResult](&v3, "didUpdatePublisherResult");
  -[SearchResultTableViewCell loadPhoto](self, "loadPhoto");
}

- (void)didUpdateRelatedSection
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchResultTableViewCell;
  -[_SearchResultTableViewCell didUpdateRelatedSection](&v5, "didUpdateRelatedSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell relatedSection](self, "relatedSection"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Fallback-Guide")));
    -[SearchResultTableViewCell setMapsImage:](self, "setMapsImage:", v4);

  }
}

- (void)loadPhoto
{
  int imageState;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSURL *v11;
  NSURL *currentLoadingURL;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  int v17;
  _QWORD v18[4];
  id v19;
  int v20;
  id location;

  -[UIImageView setHidden:](self->_imageView, "setHidden:", 0);
  imageState = self->_imageState;
  if (sub_1002A8AA0(self) == 5)
  {
    objc_initWeak(&location, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100839EB0;
    v18[3] = &unk_1011D8BB8;
    objc_copyWeak(&v19, &location);
    v20 = imageState;
    objc_msgSend(v4, "getImageForMapItem:completion:", v5, v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_geoMapItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_photos"));
    objc_msgSend((id)objc_opt_class(self), "photoSize");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_geo_firstPhotoOfAtLeastSize:"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "url"));
    v11 = (NSURL *)objc_msgSend(v10, "copy");
    currentLoadingURL = self->_currentLoadingURL;
    self->_currentLoadingURL = v11;

    if (v9)
    {
      objc_initWeak(&location, self);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "url"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100839F28;
      v15[3] = &unk_1011D8BE0;
      objc_copyWeak(&v16, &location);
      v17 = imageState;
      objc_msgSend(v13, "loadAppImageAtURL:completionHandler:", v14, v15);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      -[SearchResultTableViewCell setDefaultImage](self, "setDefaultImage");
    }

  }
}

- (void)setMapsImage:(id)a3
{
  UIImageView *imageView;
  id v5;

  imageView = self->_imageView;
  v5 = a3;
  -[UIImageView setContentMode:](imageView, "setContentMode:", 2);
  -[UIImageView setImage:](self->_imageView, "setImage:", v5);

}

- (void)setDefaultImage
{
  _QWORD v3[4];
  id v4;
  id location;

  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10083A0C8;
  v3[3] = &unk_1011ADDF0;
  objc_copyWeak(&v4, &location);
  -[SearchResultTableViewCell getDefaultImage:](self, "getDefaultImage:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)getDefaultImage:(id)a3
{
  void (**v4)(id, MapsUIImageGEOFeatureSpec *);
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  MapsUIImageGEOFeatureSpec *v9;
  int imageState;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(id, MapsUIImageGEOFeatureSpec *);
  id v16;
  int v17;
  id location;

  v4 = (void (**)(id, MapsUIImageGEOFeatureSpec *))a3;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell searchCategory](self, "searchCategory"));
    if (v5
      && (v6 = (void *)v5,
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[BrowseManager sharedManager](BrowseManager, "sharedManager")),
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell searchCategory](self, "searchCategory")),
          v9 = (MapsUIImageGEOFeatureSpec *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellImageForCategory:", v8)),
          v8,
          v7,
          v6,
          v9))
    {
      v4[2](v4, v9);
    }
    else
    {
      imageState = self->_imageState;
      v9 = objc_opt_new(MapsUIImageGEOFeatureSpec);
      -[MapsUIImageGEOFeatureSpec setSize:](v9, "setSize:", 4);
      -[MapsUIImageGEOFeatureSpec setTransparent:](v9, "setTransparent:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_styleAttributes"));
      -[MapsUIImageGEOFeatureSpec setStyle:](v9, "setStyle:", v12);

      objc_initWeak(&location, self);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10083A2F4;
      v14[3] = &unk_1011D8C08;
      objc_copyWeak(&v16, &location);
      v17 = imageState;
      v15 = v4;
      objc_msgSend(v13, "getImageForSpec:completion:", v9, v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }

  }
}

- (void)cancelLoadingPhoto
{
  void *v3;
  NSURL *currentLoadingURL;

  if (self->_currentLoadingURL)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager"));
    objc_msgSend(v3, "cancelLoadAppImageAtURL:", self->_currentLoadingURL);

    currentLoadingURL = self->_currentLoadingURL;
    self->_currentLoadingURL = 0;

    -[UIImageView setImage:](self->_imageView, "setImage:", 0);
  }
}

- (CGSize)_imageSize
{
  uint64_t v3;
  double v4;
  unsigned int v5;
  double v6;
  CGSize result;

  v3 = sub_1002A8AA0(self);
  v4 = 24.0;
  if (v3 != 5)
  {
    v5 = -[_SearchResultTableViewCell displaysAsChainResult](self, "displaysAsChainResult", 24.0);
    v4 = 64.0;
    if (v5)
      v4 = 50.0;
  }
  v6 = v4;
  result.height = v6;
  result.width = v4;
  return result;
}

+ (CGSize)photoSize
{
  double v2;
  double v3;
  CGSize result;

  if (qword_1014D35D8 != -1)
    dispatch_once(&qword_1014D35D8, &stru_1011D8C28);
  v2 = *(double *)&qword_1014D35C8;
  v3 = unk_1014D35D0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)prepareForActionMenuPresentation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchResultTableViewCell;
  -[_SearchResultTableViewCell prepareForActionMenuPresentation](&v4, "prepareForActionMenuPresentation");
  -[UIImageView _setContinuousCornerRadius:](self->_imageView, "_setContinuousCornerRadius:", 8.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
  objc_msgSend(v3, "setMasksToBounds:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLoadingURL, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
