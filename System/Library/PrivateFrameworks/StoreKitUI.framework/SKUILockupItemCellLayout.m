@implementation SKUILockupItemCellLayout

- (void)_initSKUILockupItemCellLayout
{
  OUTLINED_FUNCTION_1();
}

- (SKUILockupItemCellLayout)initWithCollectionViewCell:(id)a3
{
  SKUILockupItemCellLayout *v3;
  SKUILockupItemCellLayout *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKUILockupItemCellLayout;
  v3 = -[SKUICellLayout initWithCollectionViewCell:](&v6, sel_initWithCollectionViewCell_, a3);
  v4 = v3;
  if (v3)
    -[SKUILockupItemCellLayout _initSKUILockupItemCellLayout](v3, "_initSKUILockupItemCellLayout");
  return v4;
}

- (SKUILockupItemCellLayout)initWithParentView:(id)a3
{
  SKUILockupItemCellLayout *v3;
  SKUILockupItemCellLayout *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKUILockupItemCellLayout;
  v3 = -[SKUICellLayout initWithParentView:](&v6, sel_initWithParentView_, a3);
  v4 = v3;
  if (v3)
    -[SKUILockupItemCellLayout _initSKUILockupItemCellLayout](v3, "_initSKUILockupItemCellLayout");
  return v4;
}

- (SKUILockupItemCellLayout)initWithTableViewCell:(id)a3
{
  SKUILockupItemCellLayout *v3;
  SKUILockupItemCellLayout *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKUILockupItemCellLayout;
  v3 = -[SKUICellLayout initWithTableViewCell:](&v6, sel_initWithTableViewCell_, a3);
  v4 = v3;
  if (v3)
    -[SKUILockupItemCellLayout _initSKUILockupItemCellLayout](v3, "_initSKUILockupItemCellLayout");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIEmbeddedMediaView removeTarget:action:forControlEvents:](self->_videoThumbnailView, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SKUILockupItemCellLayout;
  -[SKUIItemCellLayout dealloc](&v3, sel_dealloc);
}

+ (double)heightForLockupComponent:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  _QWORD v21[3];

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
      {
        +[SKUILockupItemCellLayout heightForLockupComponent:clientContext:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
        if (v6)
          goto LABEL_5;
LABEL_7:
        memset(v21, 0, sizeof(v21));
        goto LABEL_8;
      }
    }
  }
  if (!v6)
    goto LABEL_7;
LABEL_5:
  objc_msgSend(v6, "lockupStyle");
LABEL_8:
  objc_msgSend(v6, "item");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editorial");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "heightForLockupStyle:item:editorial:clientContext:", v21, v16, v17, v7);
  v19 = v18;

  return v19;
}

+ (double)heightForLockupStyle:(SKUILockupStyle *)a3 item:(id)a4 editorial:(id)a5 clientContext:(id)a6
{
  id v10;
  id v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  unint64_t visibleFields;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;

  v10 = a4;
  v11 = a6;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v12)
        +[SKUILockupItemCellLayout heightForLockupStyle:item:editorial:clientContext:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  +[SKUILockupMetadataView maximumHeightWithVisibleFields:](SKUILockupMetadataView, "maximumHeightWithVisibleFields:", a3->visibleFields);
  v21 = v20;
  SKUILockupImageSizeForLockupSize(a3->artworkSize, objc_msgSend(v10, "itemKind"));
  visibleFields = a3->visibleFields;
  if ((visibleFields & 2) != 0)
    v24 = v22;
  else
    v24 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v25 = 0.0;
  if ((visibleFields & 2) != 0)
    v26 = 11.0;
  else
    v26 = 0.0;
  v27 = 58.0;
  if ((visibleFields & 4) == 0)
    v27 = 0.0;
  if ((visibleFields & 0x400) != 0)
  {
    objc_msgSend(v10, "videos", v27, v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "videoThumbnailSizeForVideo:clientContext:", v30, v11);
    v32 = v31;

    if (v21 >= v24)
      v33 = v21;
    else
      v33 = v24;
    v25 = v33 + v32 + 10.0;
  }
  else
  {
    switch(a3->layoutStyle)
    {
      case 0:
        v28 = v21 + v27;
        if (v28 >= v24)
          v25 = v28;
        else
          v25 = v24;
        break;
      case 1:
        if (v21 >= v24)
          v25 = v21;
        else
          v25 = v24;
        break;
      case 2:
        v34 = v21 + v24 + v26;
        goto LABEL_28;
      case 3:
        v34 = v21 + v24 + v26;
        if (a5)
          v27 = -0.0;
LABEL_28:
        v25 = v27 + v34;
        break;
      default:
        break;
    }
  }

  return v25;
}

+ (CGSize)videoThumbnailSizeForVideo:(id)a3 clientContext:(id)a4
{
  id v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  v5 = a3;
  v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        +[SKUILockupItemCellLayout videoThumbnailSizeForVideo:clientContext:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  if (SKUIUserInterfaceIdiom(v6) == 1)
  {
    v15 = 0x406BA00000000000;
    v16 = 0x4064C00000000000;
  }
  else
  {
    objc_msgSend(v5, "artworks");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "largestArtwork");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0x4066800000000000;
    if (v18 && (objc_msgSend(v18, "size"), v19 < v20))
    {
      v15 = 0x4066800000000000;
      v16 = 0x4074000000000000;
    }
    else
    {
      v15 = 0x4074000000000000;
    }

  }
  v21 = *(double *)&v15;
  v22 = *(double *)&v16;
  result.height = v22;
  result.width = v21;
  return result;
}

- (NSString)artistName
{
  return -[SKUILockupMetadataView artistName](self->_metadataView, "artistName");
}

- (NSString)categoryString
{
  return -[SKUILockupMetadataView categoryString](self->_metadataView, "categoryString");
}

- (NSString)editorialBadgeString
{
  return -[SKUILockupMetadataView editorialBadgeString](self->_metadataView, "editorialBadgeString");
}

- (void)endVideoPlaybackAnimated:(BOOL)a3
{
  -[SKUIEmbeddedMediaView endPlaybackAnimated:](self->_videoThumbnailView, "endPlaybackAnimated:", a3);
}

- (NSString)itemCountString
{
  return -[SKUILockupMetadataView itemCountString](self->_metadataView, "itemCountString");
}

- (int64_t)numberOfUserRatings
{
  return -[SKUILockupMetadataView numberOfUserRatings](self->_metadataView, "numberOfUserRatings");
}

- (void)playInlineVideoWithURL:(id)a3
{
  -[SKUIEmbeddedMediaView beginInlinePlaybackWithURL:](self->_videoThumbnailView, "beginInlinePlaybackWithURL:", a3);
}

- (NSString)releaseDateString
{
  return -[SKUILockupMetadataView releaseDateString](self->_metadataView, "releaseDateString");
}

- (void)setArtistName:(id)a3
{
  -[SKUILockupMetadataView setArtistName:](self->_metadataView, "setArtistName:", a3);
}

- (void)setCategoryString:(id)a3
{
  -[SKUILockupMetadataView setCategoryString:](self->_metadataView, "setCategoryString:", a3);
}

- (void)setEditorialBadgeString:(id)a3
{
  -[SKUILockupMetadataView setEditorialBadgeString:](self->_metadataView, "setEditorialBadgeString:", a3);
}

- (void)setColoringWithColorScheme:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[SKUILockupMetadataView setColoringWithColorScheme:](self->_metadataView, "setColoringWithColorScheme:", v4);
  objc_msgSend(v4, "primaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIItemCellLayout itemOfferNoticeLabel](self, "itemOfferNoticeLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "setTextColor:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)SKUILockupItemCellLayout;
  -[SKUICellLayout setColoringWithColorScheme:](&v9, sel_setColoringWithColorScheme_, v4);

}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setImageBoundingSize:(CGSize)a3
{
  if (self->_imageBoundingSize.width != a3.width || self->_imageBoundingSize.height != a3.height)
  {
    self->_imageBoundingSize = a3;
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setItemCountString:(id)a3
{
  -[SKUILockupMetadataView setItemCountString:](self->_metadataView, "setItemCountString:", a3);
}

- (void)setItemOfferStyle:(int64_t)a3
{
  if (self->_itemOfferStyle != a3)
  {
    self->_itemOfferStyle = a3;
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPlaysInlineVideo:(BOOL)a3
{
  self->_playsInlineVideo = a3;
  -[SKUIEmbeddedMediaView setEnabled:](self->_videoThumbnailView, "setEnabled:");
}

- (void)setNumberOfUserRatings:(int64_t)a3
{
  -[SKUILockupMetadataView setNumberOfUserRatings:](self->_metadataView, "setNumberOfUserRatings:", a3);
}

- (void)setReleaseDateString:(id)a3
{
  -[SKUILockupMetadataView setReleaseDateString:](self->_metadataView, "setReleaseDateString:", a3);
}

- (void)setTitle:(id)a3
{
  -[SKUILockupMetadataView setTitle:](self->_metadataView, "setTitle:", a3);
  -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
}

- (void)setUserRating:(float)a3
{
  -[SKUILockupMetadataView setUserRating:](self->_metadataView, "setUserRating:");
}

- (void)setVerticalAlignment:(int64_t)a3
{
  if (self->_verticalAlignment != a3)
  {
    self->_verticalAlignment = a3;
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setVideoThumbnailImage:(id)a3
{
  id v4;
  void *v5;
  SKUIEmbeddedMediaView *videoThumbnailView;
  SKUIEmbeddedMediaView *v7;
  SKUIEmbeddedMediaView *v8;
  SKUIEmbeddedMediaView *v9;
  void *v10;
  void *v11;
  void *v12;
  SKUIEmbeddedMediaView *v13;
  id v14;

  v14 = a3;
  -[SKUILockupItemCellLayout videoThumbnailImage](self, "videoThumbnailImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v14;
  if (v4 != v14)
  {
    videoThumbnailView = self->_videoThumbnailView;
    if (v14)
    {
      if (!videoThumbnailView)
      {
        v7 = objc_alloc_init(SKUIEmbeddedMediaView);
        v8 = self->_videoThumbnailView;
        self->_videoThumbnailView = v7;

        -[SKUIEmbeddedMediaView addTarget:action:forControlEvents:](self->_videoThumbnailView, "addTarget:action:forControlEvents:", self, sel__beginVideoPlaybackAction_, 64);
        v9 = self->_videoThumbnailView;
        -[SKUICellLayout parentCellView](self, "parentCellView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "backgroundColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIEmbeddedMediaView setBackgroundColor:](v9, "setBackgroundColor:", v11);

        -[SKUIEmbeddedMediaView setEnabled:](self->_videoThumbnailView, "setEnabled:", self->_playsInlineVideo);
        -[SKUIEmbeddedMediaView setMediaType:](self->_videoThumbnailView, "setMediaType:", 2);
        -[SKUIEmbeddedMediaView setShowsThumbnailReflection:](self->_videoThumbnailView, "setShowsThumbnailReflection:", 0);
        -[SKUIEmbeddedMediaView setThumbnailContentMode:](self->_videoThumbnailView, "setThumbnailContentMode:", 6);
        -[SKUICellLayout contentView](self, "contentView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addSubview:", self->_videoThumbnailView);

        videoThumbnailView = self->_videoThumbnailView;
      }
      -[SKUIEmbeddedMediaView setThumbnailImage:](videoThumbnailView, "setThumbnailImage:");
    }
    else
    {
      -[SKUIEmbeddedMediaView removeTarget:action:forControlEvents:](videoThumbnailView, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
      -[SKUIEmbeddedMediaView removeFromSuperview](self->_videoThumbnailView, "removeFromSuperview");
      v13 = self->_videoThumbnailView;
      self->_videoThumbnailView = 0;

    }
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
    v5 = v14;
  }

}

- (void)setVideoThumbnailSize:(CGSize)a3
{
  if (self->_videoThumbnailSize.width != a3.width || self->_videoThumbnailSize.height != a3.height)
  {
    self->_videoThumbnailSize = a3;
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setVisibleFields:(unint64_t)a3
{
  if (-[SKUILockupMetadataView visibleFields](self->_metadataView, "visibleFields") != a3)
  {
    -[SKUILockupMetadataView setVisibleFields:](self->_metadataView, "setVisibleFields:", a3);
    -[SKUIItemCellLayout setDisplaysItemOfferButton:](self, "setDisplaysItemOfferButton:", (-[SKUILockupItemCellLayout visibleFields](self, "visibleFields") & 0x104) != 0);
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)title
{
  return -[SKUILockupMetadataView title](self->_metadataView, "title");
}

- (float)userRating
{
  float result;

  -[SKUILockupMetadataView userRating](self->_metadataView, "userRating");
  return result;
}

- (UIImage)videoThumbnailImage
{
  return -[SKUIEmbeddedMediaView thumbnailImage](self->_videoThumbnailView, "thumbnailImage");
}

- (unint64_t)visibleFields
{
  return -[SKUILockupMetadataView visibleFields](self->_metadataView, "visibleFields");
}

- (void)layoutForItemOfferChange
{
  void *v3;
  double v4;
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
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float v28;
  float v29;
  double v30;
  CGFloat v31;
  double v32;
  id v33;
  CGRect v34;

  -[SKUICellLayout contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[SKUIItemCellLayout itemOfferButton](self, "itemOfferButton");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "frame");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v33, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  v13 = v12;
  v15 = v14;
  -[SKUIItemCellLayout itemOfferNoticeLabel](self, "itemOfferNoticeLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v7;
  if (objc_msgSend(v16, "isHidden"))
  {
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);

    v16 = 0;
    v19 = v15;
  }
  else
  {
    objc_msgSend(v16, "frame");
    objc_msgSend(v16, "sizeThatFits:", v13 + 10.0, 1.79769313e308);
    v17 = v20;
    v18 = v21;
    v19 = v15 + v21 + 3.0;
  }
  if (self->_layoutStyle == 1)
  {
    v9 = v5 - self->_contentInsets.right - v13;
    if (self->_verticalAlignment == 1)
    {
      v22 = (v32 - v19) * 0.5;
      v11 = floorf(v22);
    }
    else
    {
      -[SKUIItemCellLayout iconImageView](self, "iconImageView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "frame");
      v25 = v24;

      -[SKUILockupMetadataView frame](self->_metadataView, "frame");
      if (v25 >= v26)
        v27 = v25;
      else
        v27 = v26;
      v28 = (v27 - v19) * 0.5;
      v11 = self->_contentInsets.top + floorf(v28);
    }
  }
  v29 = (v13 - v17) * 0.5;
  v30 = v9 + floorf(v29);
  v34.origin.x = v9;
  v34.origin.y = v11;
  v34.size.width = v13;
  v34.size.height = v15;
  v31 = CGRectGetMaxY(v34) + 3.0;
  objc_msgSend(v33, "setFrame:", v9, v11, v13, v15);
  objc_msgSend(v16, "setFrame:", v30, v31, v17, v18);

}

- (void)layoutSubviews
{
  unint64_t layoutStyle;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUILockupItemCellLayout;
  -[SKUICellLayout layoutSubviews](&v4, sel_layoutSubviews);
  layoutStyle = self->_layoutStyle;
  if (layoutStyle - 2 < 2)
  {
    -[SKUILockupItemCellLayout _layoutVertical](self, "_layoutVertical");
  }
  else if (layoutStyle <= 1)
  {
    -[SKUILockupItemCellLayout _layoutHorizontal](self, "_layoutHorizontal");
  }
}

- (void)prepareForReuse
{
  objc_super v3;

  -[SKUIEmbeddedMediaView endPlaybackAnimated:](self->_videoThumbnailView, "endPlaybackAnimated:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUILockupItemCellLayout;
  -[SKUIItemCellLayout prepareForReuse](&v3, sel_prepareForReuse);
}

- (void)setBackgroundColor:(id)a3
{
  UILabel *itemOfferTextLabel;
  id v5;
  objc_super v6;

  itemOfferTextLabel = self->_itemOfferTextLabel;
  v5 = a3;
  -[UILabel setBackgroundColor:](itemOfferTextLabel, "setBackgroundColor:", v5);
  -[SKUILockupMetadataView setBackgroundColor:](self->_metadataView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUILockupItemCellLayout;
  -[SKUIItemCellLayout setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void)setClientContext:(id)a3
{
  SKUILockupMetadataView *metadataView;
  id v5;
  objc_super v6;

  metadataView = self->_metadataView;
  v5 = a3;
  -[SKUILockupMetadataView setClientContext:](metadataView, "setClientContext:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUILockupItemCellLayout;
  -[SKUICellLayout setClientContext:](&v6, sel_setClientContext_, v5);

}

- (void)setIconImage:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUILockupItemCellLayout;
  -[SKUIItemCellLayout setIconImage:](&v5, sel_setIconImage_, a3);
  -[SKUIItemCellLayout iconImageView](self, "iconImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentMode:", 11);

}

- (void)_beginVideoPlaybackAction:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[SKUICellLayout parentCellView](self, "parentCellView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  SKUICollectionViewForView(v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "itemCollectionView:didTapVideoForCollectionViewCell:", v3, v5);

}

- (BOOL)_isItemOfferHidden
{
  void *v3;
  BOOL v4;

  if (!-[SKUIItemCellLayout displaysItemOfferButton](self, "displaysItemOfferButton")
    || (-[SKUILockupItemCellLayout visibleFields](self, "visibleFields") & 0x104) == 0)
  {
    return 1;
  }
  -[SKUIItemCellLayout itemOffer](self, "itemOffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[SKUIItemCellLayout isRestricted](self, "isRestricted");
  else
    v4 = 1;

  return v4;
}

- (id)_itemOfferTextLabel
{
  UILabel *itemOfferTextLabel;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  void *v13;

  itemOfferTextLabel = self->_itemOfferTextLabel;
  if (!itemOfferTextLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v5 = self->_itemOfferTextLabel;
    self->_itemOfferTextLabel = v4;

    v6 = self->_itemOfferTextLabel;
    -[SKUICellLayout parentCellView](self, "parentCellView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v6, "setBackgroundColor:", v8);

    v9 = self->_itemOfferTextLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9, "setFont:", v10);

    v11 = self->_itemOfferTextLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v11, "setTextColor:", v12);

    -[SKUICellLayout contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", self->_itemOfferTextLabel);

    itemOfferTextLabel = self->_itemOfferTextLabel;
  }
  return itemOfferTextLabel;
}

- (void)_layoutHorizontal
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets *p_contentInsets;
  double left;
  double v13;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  UILabel *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  __int128 v44;
  int64_t verticalAlignment;
  __int128 v46;
  double v47;
  SKUIEmbeddedMediaView *videoThumbnailView;
  double width;
  double v50;
  float v51;
  double v52;
  SKUILockupMetadataView *metadataView;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  float64x2_t v59;
  float v60;
  double v61;
  double v62;
  float64x2_t v68;
  double v69;
  float64x2_t v70;
  float64x2_t v72;
  uint64_t v73;
  float v74;
  uint64_t v76;
  float64x2_t v77;
  float64x2_t v79;
  float64x2_t v80;
  double v81;
  double v82;
  float64_t v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  float v89;
  double v90;
  double v91;
  double MaxY;
  void *v93;
  void *v94;
  void *v95;
  __int128 v96;
  uint64_t v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  CGFloat rect2;
  double rect2a;
  double v109;
  double v110;
  double rect;
  double v112;
  float64x2_t v113;
  void *v114;
  void *v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;

  -[SKUICellLayout contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v100 = v10;

  p_contentInsets = &self->_contentInsets;
  left = self->_contentInsets.left;
  -[SKUILockupItemCellLayout _layoutIconImageView](self, "_layoutIconImageView");
  v112 = v13;
  v17 = v15;
  rect = v16;
  if (v15 > 0.00000011920929)
    left = CGRectGetMaxX(*(CGRect *)&v13) + 13.0;
  v18 = -[SKUILockupItemCellLayout _isItemOfferHidden](self, "_isItemOfferHidden");
  -[SKUIItemCellLayout itemOfferButton](self, "itemOfferButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C9D648];
  v21 = *MEMORY[0x1E0C9D648];
  v23 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v114 = v19;
  v99 = v22;
  rect2 = v9;
  if (v18 || self->_itemOfferStyle)
  {
    objc_msgSend(v19, "setHidden:", 1);

    v24 = self->_itemOfferTextLabel;
    if (v18)
    {
      v115 = 0;
      v98 = 0.0;
      v105 = v21;
      v109 = v22;
      v110 = v23;
      goto LABEL_15;
    }
    v25 = 0;
    v26 = 0.0;
    v105 = v21;
    v109 = v22;
    v110 = v23;
  }
  else
  {
    if (v19)
    {
      objc_msgSend(v19, "frame");
      v109 = v28;
      v110 = v27;
      v105 = left;
      v26 = v28;
    }
    else
    {
      v26 = 0.0;
      v109 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v110 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v105 = *MEMORY[0x1E0C9D648];
    }
    v24 = self->_itemOfferTextLabel;
    v25 = v114;
  }
  v115 = v25;
  if (self->_itemOfferStyle == 2)
  {
    -[SKUILockupItemCellLayout _itemOfferTextLabel](self, "_itemOfferTextLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "setHidden:", 0);
    -[SKUIItemCellLayout itemOffer](self, "itemOffer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "buttonText");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setText:", v31);

    objc_msgSend(v29, "frame");
    objc_msgSend(v29, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
    v106 = v32;
    v104 = left;
    v102 = v33;
    v98 = v33;
    goto LABEL_16;
  }
  v98 = v26;
LABEL_15:
  -[UILabel setHidden:](v24, "setHidden:", 1);

  v29 = 0;
  v102 = v22;
  v106 = v23;
  v104 = v21;
LABEL_16:
  v34 = *(double *)(v20 + 8);
  -[SKUIItemCellLayout itemOfferNoticeLabel](self, "itemOfferNoticeLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v35, "isHidden"))
  {

    v35 = 0;
  }
  else if (v35)
  {
    objc_msgSend(v35, "frame");
    v21 = v38;
    v34 = v39;
    v40 = v110;
    if (v115 || (v40 = v106, v29))
    {
      objc_msgSend(v35, "sizeThatFits:", v40 + 10.0, 1.79769313e308);
      v23 = v42;
    }
    else
    {
      v23 = v36;
      v41 = v37;
    }
    v99 = v41;
    v98 = v98 + v41 + 3.0;
  }
  v116.origin.x = v5;
  v116.origin.y = v7;
  v116.size.width = rect2;
  v116.size.height = v100;
  v43 = CGRectGetMaxX(v116) - self->_contentInsets.right;
  *(CGFloat *)&v44 = p_contentInsets->top;
  v96 = v44;
  verticalAlignment = self->_verticalAlignment;
  if ((-[SKUILockupItemCellLayout visibleFields](self, "visibleFields") & 0x400) != 0)
  {
    videoThumbnailView = self->_videoThumbnailView;
    v47 = v112;
    if (videoThumbnailView)
    {
      width = self->_videoThumbnailSize.width;
      v50 = self->_contentInsets.left;
      v51 = (v43 - v50 - width) * 0.5;
      -[SKUIEmbeddedMediaView setFrame:](videoThumbnailView, "setFrame:", v50 + floorf(v51), *(double *)&v96, width, self->_videoThumbnailSize.height);
    }
    verticalAlignment = 0;
    *(double *)&v46 = p_contentInsets->top + self->_videoThumbnailSize.height + 10.0;
    v96 = v46;
  }
  else
  {
    v47 = v112;
  }
  if (self->_layoutStyle != 1)
  {
LABEL_31:
    if (v18)
      goto LABEL_35;
    goto LABEL_32;
  }
  if (v115)
  {
    v105 = v43 - v110;
    objc_msgSend(v115, "layoutSizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
    v43 = v43 - v52 + -10.0;
    goto LABEL_31;
  }
  v104 = v43 - v106;
  v43 = v43 - v106 + -10.0;
  if (v18)
    goto LABEL_35;
LABEL_32:
  if (self->_itemOfferStyle == 1)
  {
    metadataView = self->_metadataView;
    -[SKUIItemCellLayout itemOffer](self, "itemOffer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "buttonText");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUILockupMetadataView setItemOfferString:](metadataView, "setItemOfferString:", v55);

    goto LABEL_36;
  }
LABEL_35:
  -[SKUILockupMetadataView setItemOfferString:](self->_metadataView, "setItemOfferString:", 0, v96);
LABEL_36:
  -[SKUILockupMetadataView frame](self->_metadataView, "frame", v96);
  -[SKUILockupMetadataView sizeThatFits:](self->_metadataView, "sizeThatFits:", v43 - left, 1.79769313e308);
  v58 = v57;
  v59.f64[0] = v56;
  v103 = v23;
  rect2a = v56;
  if (self->_layoutStyle == 1)
  {
    if (verticalAlignment == 1)
    {
      v59.f64[1] = rect;
      v60 = (v100 - v98) * 0.5;
      v61 = floorf(v60);
      v62 = ceilf(v60);
      __asm { FMOV            V1.2D, #0.5 }
      v68 = vcvtq_f64_f32(vrndm_f32(vcvt_f32_f64(vmulq_f64(vsubq_f64((float64x2_t)vdupq_lane_s64(*(uint64_t *)&v100, 0), v59), _Q1))));
    }
    else
    {
      if (rect >= v56)
        *(double *)&v73 = rect;
      else
        *(double *)&v73 = v56;
      v74 = (*(double *)&v73 - v98) * 0.5;
      v61 = *(double *)&v97 + floorf(v74);
      v62 = *(double *)&v97 + ceilf(v74);
      v59.f64[1] = rect;
      __asm { FMOV            V1.2D, #0.5 }
      v68 = vaddq_f64((float64x2_t)vdupq_lane_s64(v97, 0), vcvtq_f64_f32(vrndm_f32(vcvt_f32_f64(vmulq_f64(vsubq_f64((float64x2_t)vdupq_lane_s64(v73, 0), v59), _Q1)))));
    }
    v113 = v68;
    if (!v35)
      goto LABEL_68;
    goto LABEL_54;
  }
  v69 = v109 + 3.0;
  if (!v115)
    v69 = -0.0;
  v70.f64[0] = v69 + v56;
  if (verticalAlignment == 1)
  {
    v70.f64[1] = rect;
    __asm { FMOV            V1.2D, #0.5 }
    v72 = vcvtq_f64_f32(vrndm_f32(vcvt_f32_f64(vmulq_f64(vsubq_f64((float64x2_t)vdupq_lane_s64(*(uint64_t *)&v100, 0), v70), _Q1))));
  }
  else
  {
    if (rect >= v70.f64[0])
      *(double *)&v76 = rect;
    else
      v76 = *(uint64_t *)&v70.f64[0];
    v70.f64[1] = rect;
    v77 = vsubq_f64((float64x2_t)vdupq_lane_s64(v76, 0), v70);
    __asm { FMOV            V1.2D, #0.5 }
    v79 = vcvtq_f64_f32(vrndm_f32(vcvt_f32_f64(vmulq_f64(v77, _Q1))));
    v80 = vld1q_dup_f64(&p_contentInsets->top);
    v72 = vaddq_f64(v80, v79);
  }
  v81 = left;
  v113 = v72;
  v82 = v58;
  v83 = v59.f64[0];
  v61 = CGRectGetMaxY(*(CGRect *)((char *)&v72 - 8)) + 3.0;
  v117.origin.x = left;
  v117.origin.y = v113.f64[0];
  v117.size.width = v58;
  v117.size.height = rect2a;
  v62 = CGRectGetMaxY(v117) + 3.0;
  if (v35)
  {
LABEL_54:
    v101 = v58;
    v84 = v17;
    if (v115)
      v85 = v105;
    else
      v85 = v104;
    if (v115)
      v86 = v61;
    else
      v86 = v62;
    v87 = v106;
    if (v115)
      v87 = v110;
    v88 = v102;
    if (v115)
      v88 = v109;
    v89 = (v87 - v103) * 0.5;
    v90 = floorf(v89);
    v91 = v85;
    MaxY = CGRectGetMaxY(*(CGRect *)(&v86 - 1));
    -[SKUILockupMetadataView primaryTextColor](self->_metadataView, "primaryTextColor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (v93)
    {
      objc_msgSend(v35, "setTextColor:", v93);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setTextColor:", v94);

    }
    v21 = v85 + v90;
    v34 = MaxY + 3.0;

    v17 = v84;
    v58 = v101;
  }
LABEL_68:
  -[SKUIItemCellLayout iconImageView](self, "iconImageView");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setFrame:", v47, v113.f64[1], v17, rect);

  objc_msgSend(v115, "setFrame:", v105, v61, v110, v109);
  objc_msgSend(v35, "setFrame:", v21, v34, v103, v99);
  objc_msgSend(v29, "setFrame:", v104, v62, v106, v102);
  -[SKUILockupMetadataView frame](self->_metadataView, "frame");
  v119.origin.x = left;
  v119.origin.y = v113.f64[0];
  v119.size.width = v58;
  v119.size.height = rect2a;
  if (!CGRectEqualToRect(v118, v119))
  {
    -[SKUILockupMetadataView setFrame:](self->_metadataView, "setFrame:", left, v113.f64[0], v58, rect2a);
    -[SKUILockupMetadataView setNeedsDisplay](self->_metadataView, "setNeedsDisplay");
  }

}

- (CGRect)_layoutIconImageView
{
  void *v3;
  double left;
  double top;
  double width;
  double height;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[SKUIItemCellLayout iconImageView](self, "iconImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  if ((-[SKUILockupItemCellLayout visibleFields](self, "visibleFields") & 2) != 0)
  {
    top = self->_contentInsets.top;
    left = self->_contentInsets.left;
    width = self->_imageBoundingSize.width;
    height = self->_imageBoundingSize.height;
    objc_msgSend(v3, "setFrame:", left, top, width, height);
    objc_msgSend(v3, "setHidden:", -[SKUIItemCellLayout isIconImageHidden](self, "isIconImageHidden"));
  }
  else
  {
    objc_msgSend(v3, "setHidden:", 1);
    left = *MEMORY[0x1E0C9D648];
    top = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v8 = left;
  v9 = top;
  v10 = width;
  v11 = height;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)_layoutVertical
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double left;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  BOOL v18;
  CGFloat v19;
  double v20;
  double v21;
  UILabel *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  float v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  float v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double rect;
  id v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  -[SKUICellLayout contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v55 = v6;

  -[SKUILockupItemCellLayout _layoutIconImageView](self, "_layoutIconImageView");
  v61 = v8;
  rect = v9;
  v65 = v7;
  v66 = v10;
  if (v7 <= 0.00000011920929)
    v11 = v7;
  else
    v11 = v7 + 11.0;
  if (v7 <= 0.00000011920929)
    v12 = 0.0;
  else
    v12 = 11.0;
  -[SKUILockupMetadataView frame](self->_metadataView, "frame");
  left = self->_contentInsets.left;
  -[SKUILockupMetadataView sizeThatFits:](self->_metadataView, "sizeThatFits:", v5 - self->_contentInsets.right - left, 1.79769313e308);
  v15 = v14;
  v67 = v16;
  v17 = v11 + v16;
  -[SKUIItemCellLayout itemOfferButton](self, "itemOfferButton");
  v69 = (id)objc_claimAutoreleasedReturnValue();
  v18 = -[SKUILockupItemCellLayout _isItemOfferHidden](self, "_isItemOfferHidden");
  v19 = *MEMORY[0x1E0C9D648];
  v20 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v21 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v57 = v20;
  if (v18 || self->_itemOfferStyle)
  {
    objc_msgSend(v69, "setHidden:", 1);

    v22 = self->_itemOfferTextLabel;
    if (v18)
    {
      v23 = v15;
      v69 = 0;
      v58 = v19;
      v59 = v21;
      v64 = v20;
      v24 = v20;
      v25 = v12;
      goto LABEL_16;
    }
    v69 = 0;
    v58 = v19;
    v59 = v21;
    v64 = v20;
  }
  else
  {
    objc_msgSend(v69, "setHidden:", 0);
    objc_msgSend(v69, "frame");
    v64 = v26;
    v58 = self->_contentInsets.left;
    v59 = v27;
    v17 = v17 + v27 + 3.0;
    v22 = self->_itemOfferTextLabel;
  }
  v25 = v12;
  if (self->_itemOfferStyle == 2)
  {
    -[SKUILockupItemCellLayout _itemOfferTextLabel](self, "_itemOfferTextLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "setHidden:", 0);
    -[SKUIItemCellLayout itemOffer](self, "itemOffer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "buttonText");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setText:", v30);

    objc_msgSend(v28, "frame");
    v19 = self->_contentInsets.left;
    objc_msgSend(v28, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
    v63 = v31;
    v60 = v32;
    v17 = v17 + v32 + 3.0;
    goto LABEL_17;
  }
  v23 = v15;
  v24 = v57;
LABEL_16:
  -[UILabel setHidden:](v22, "setHidden:", 1);

  v28 = 0;
  v63 = v24;
  v60 = v21;
  v15 = v23;
LABEL_17:
  -[SKUIItemCellLayout itemOfferNoticeLabel](self, "itemOfferNoticeLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "isHidden"))
  {

    v33 = 0;
    goto LABEL_25;
  }
  if (v33)
  {
    objc_msgSend(v33, "frame");
    if (v69)
    {
      v36 = 10.0;
      v37 = v64;
LABEL_24:
      objc_msgSend(v33, "sizeThatFits:", v37 + v36, 1.79769313e308);
      v57 = v38;
      v21 = v39;
      goto LABEL_25;
    }
    v57 = v34;
    if (v28)
    {
      v36 = 10.0;
      v37 = v63;
      goto LABEL_24;
    }
    v21 = v35;
  }
LABEL_25:
  v40 = v61;
  v62 = v19;
  if (self->_verticalAlignment == 1)
  {
    v41 = (v55 - v17) * 0.5;
    rect = floorf(v41);
  }
  v42 = v40;
  v70.origin.x = v40;
  v70.origin.y = rect;
  v70.size.height = v65;
  v70.size.width = v66;
  v43 = v25 + CGRectGetMaxY(v70);
  v71.origin.x = left;
  v71.origin.y = v43;
  v71.size.width = v15;
  v71.size.height = v67;
  v44 = CGRectGetMaxY(v71) + 3.0;
  v56 = left;
  v72.origin.x = left;
  v72.origin.y = v43;
  v72.size.width = v15;
  v72.size.height = v67;
  v45 = CGRectGetMaxY(v72) + 3.0;
  if (v33)
  {
    v46 = v58;
    if (v69)
    {
      v47 = v44;
    }
    else
    {
      v46 = v62;
      v47 = v45;
    }
    v48 = v64;
    if (!v69)
      v48 = v63;
    v49 = v59;
    if (!v69)
      v49 = v60;
    v50 = (v48 - v57) * 0.5;
    objc_msgSend(v33, "setFrame:", v46 + floorf(v50), CGRectGetMaxY(*(CGRect *)&v46) + 3.0, v57, v21);
    -[SKUILockupMetadataView primaryTextColor](self->_metadataView, "primaryTextColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      objc_msgSend(v33, "setTextColor:", v51);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setTextColor:", v52);

    }
  }
  -[SKUIItemCellLayout iconImageView](self, "iconImageView", *(_QWORD *)&v15);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setFrame:", v42, rect, v66, v65);

  objc_msgSend(v69, "setFrame:", v58, v44, v64, v59);
  objc_msgSend(v28, "setFrame:", v62, v45, v63, v60);
  -[SKUILockupMetadataView frame](self->_metadataView, "frame");
  v74.origin.x = v56;
  v74.origin.y = v43;
  v74.size.width = v54;
  v74.size.height = v67;
  if (!CGRectEqualToRect(v73, v74))
  {
    -[SKUILockupMetadataView setFrame:](self->_metadataView, "setFrame:", v56, v43, v54, v67);
    -[SKUILockupMetadataView setNeedsDisplay](self->_metadataView, "setNeedsDisplay");
  }

}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGSize)imageBoundingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageBoundingSize.width;
  height = self->_imageBoundingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)itemOfferStyle
{
  return self->_itemOfferStyle;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (int64_t)lockupSize
{
  return self->_lockupSize;
}

- (void)setLockupSize:(int64_t)a3
{
  self->_lockupSize = a3;
}

- (BOOL)playsInlineVideo
{
  return self->_playsInlineVideo;
}

- (int64_t)verticalAlignment
{
  return self->_verticalAlignment;
}

- (CGSize)videoThumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_videoThumbnailSize.width;
  height = self->_videoThumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoThumbnailView, 0);
  objc_storeStrong((id *)&self->_metadataView, 0);
  objc_storeStrong((id *)&self->_itemOfferTextLabel, 0);
}

+ (void)heightForLockupComponent:(uint64_t)a3 clientContext:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)heightForLockupStyle:(uint64_t)a3 item:(uint64_t)a4 editorial:(uint64_t)a5 clientContext:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)videoThumbnailSizeForVideo:(uint64_t)a3 clientContext:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
