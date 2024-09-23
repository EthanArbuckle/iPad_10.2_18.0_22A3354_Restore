@implementation PXInboxTableViewCell

- (PXInboxTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PXInboxTableViewCell *v4;
  UIImageView *v5;
  UIImageView *placeholderImageView;
  void *v7;
  PXBadgedThumbnailView *v8;
  PXBadgedThumbnailView *thumbnailView;
  void *v10;
  void *v11;
  void *v12;
  UILabel *v13;
  UILabel *titleLabel;
  void *v15;
  void *v16;
  NSString *v17;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v19;
  UILabel *v20;
  UILabel *subtitleLabel;
  void *v22;
  PXRoundedCornerOverlayView *v23;
  PXRoundedCornerOverlayView *cornerOverlayView;
  void *v25;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PXInboxTableViewCell;
  v4 = -[PXInboxTableViewCell initWithStyle:reuseIdentifier:](&v28, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v4)
  {
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    placeholderImageView = v4->_placeholderImageView;
    v4->_placeholderImageView = v5;

    -[UIImageView setContentMode:](v4->_placeholderImageView, "setContentMode:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v4->_placeholderImageView, "setBackgroundColor:", v7);

    v8 = -[PXBadgedThumbnailView initWithplaceholderImageView:]([PXBadgedThumbnailView alloc], "initWithplaceholderImageView:", v4->_placeholderImageView);
    thumbnailView = v4->_thumbnailView;
    v4->_thumbnailView = v8;

    v10 = (void *)objc_opt_class();
    -[PXInboxTableViewCell tintColor](v4, "tintColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "thumbnailBadgeImageForTintColor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXBadgedThumbnailView setBadgeImage:](v4->_thumbnailView, "setBadgeImage:", v12);

    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v13;

    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v15);

    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 4);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferredContentSizeCategory");
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v17);

    if (IsAccessibilityCategory)
      v19 = 4;
    else
      v19 = 2;
    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", v19);
    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 4);
    v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v20;

    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_subtitleLabel, "setFont:", v22);

    -[UILabel setLineBreakMode:](v4->_subtitleLabel, "setLineBreakMode:", 4);
    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 1);
    -[UILabel setTextAlignment:](v4->_subtitleLabel, "setTextAlignment:", 4);
    v23 = objc_alloc_init(PXRoundedCornerOverlayView);
    cornerOverlayView = v4->_cornerOverlayView;
    v4->_cornerOverlayView = v23;

    -[PXRoundedCornerOverlayView performChanges:](v4->_cornerOverlayView, "performChanges:", &__block_literal_global_19);
    -[PXInboxTableViewCell contentView](v4, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v4->_cornerOverlayView);
    objc_msgSend(v25, "addSubview:", v4->_thumbnailView);
    objc_msgSend(v25, "addSubview:", v4->_titleLabel);
    objc_msgSend(v25, "addSubview:", v4->_subtitleLabel);
    -[PXInboxTableViewCell setClipsToBounds:](v4, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v4, sel__contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXInboxTableViewCell;
  -[PXInboxTableViewCell prepareForReuse](&v9, sel_prepareForReuse);
  -[PXInboxTableViewCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributedText:", 0);

  -[PXInboxTableViewCell subtitleLabel](self, "subtitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedText:", 0);

  -[PXInboxTableViewCell setUnseen:](self, "setUnseen:", 0);
  -[PXInboxTableViewCell thumbnailView](self, "thumbnailView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfItems");

  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      -[PXInboxTableViewCell thumbnailView](self, "thumbnailView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setImage:forItemAtIndex:", 0, i);

    }
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXInboxTableViewCell;
  -[PXInboxTableViewCell layoutSubviews](&v16, sel_layoutSubviews);
  -[PXInboxTableViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXInboxTableViewCell cornerOverlayView](self, "cornerOverlayView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[PXInboxTableViewCell layoutCoordinator](self, "layoutCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutInCell:", self);

  -[PXInboxTableViewCell placeholderImageView](self, "placeholderImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend((id)objc_opt_class(), "placeholderEmptyImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setImage:", v15);

  }
}

- (void)_updateTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[PXInboxTableViewCell title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXInboxTableViewCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXInboxTableViewCell isUnseen](self, "isUnseen"))
  {
    v9[0] = *MEMORY[0x1E0DC1138];
    objc_msgSend(v4, "font");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v9[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "px_bulletPrefixAttributedStringWithBulletAttributes:isLeftToRight:", v7, -[PXInboxTableViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
  }
  objc_msgSend(v4, "setAttributedText:", v3);

}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
  -[PXInboxTableViewCell _updateTitle](self, "_updateTitle");
}

- (void)setTitle:(id)a3
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[PXInboxTableViewCell title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToAttributedString:", v7);

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_title, a3);
    -[PXInboxTableViewCell _updateTitle](self, "_updateTitle");
  }

}

- (void)setSubtitle:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PXInboxTableViewCell subtitle](self, "subtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToAttributedString:", v7);

  if ((v5 & 1) == 0)
  {
    -[PXInboxTableViewCell subtitleLabel](self, "subtitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAttributedText:", v7);

    -[PXInboxTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSAttributedString)subtitle
{
  void *v2;
  void *v3;

  -[PXInboxTableViewCell subtitleLabel](self, "subtitleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)setUnseen:(BOOL)a3
{
  if (self->_unseen != a3)
  {
    self->_unseen = a3;
    -[PXInboxTableViewCell _updateTitle](self, "_updateTitle");
  }
}

- (void)setFrame:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXInboxTableViewCell;
  -[PXInboxTableViewCell setFrame:](&v3, sel_setFrame_, a3.origin.x + -10.0, a3.origin.y, a3.size.width + 10.0, a3.size.height);
}

- (void)_updateTitleLabel
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
    v6 = 4;
  else
    v6 = 2;
  -[PXInboxTableViewCell titleLabel](self, "titleLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfLines:", v6);

}

- (PXInboxModel)model
{
  return self->_model;
}

- (NSAttributedString)title
{
  return self->_title;
}

- (BOOL)isUnseen
{
  return self->_unseen;
}

- (PXInboxTableViewCellLayoutCoordinator)layoutCoordinator
{
  return self->_layoutCoordinator;
}

- (void)setLayoutCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_layoutCoordinator, a3);
}

- (UIImageView)placeholderImageView
{
  return self->_placeholderImageView;
}

- (void)setPlaceholderImageView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderImageView, a3);
}

- (PXRoundedCornerOverlayView)cornerOverlayView
{
  return self->_cornerOverlayView;
}

- (void)setCornerOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_cornerOverlayView, a3);
}

- (PXBadgedThumbnailView)thumbnailView
{
  return self->_thumbnailView;
}

- (void)setThumbnailView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_thumbnailView, 0);
  objc_storeStrong((id *)&self->_cornerOverlayView, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);
  objc_storeStrong((id *)&self->_layoutCoordinator, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

void __54__PXInboxTableViewCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "setCornerRadius:", 4.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setOverlayColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  objc_msgSend(v2, "setDisplayScale:");

}

+ (id)emptyPlaceholderImageForSystemImageNamed:(id)a3 scale:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0DC3888];
  v6 = a3;
  objc_msgSend(v5, "configurationWithWeight:", 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configurationWithPaletteColors:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationByApplyingConfiguration:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4B50], a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configurationByApplyingConfiguration:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v6, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (UIImage)placeholderEmptyImage
{
  if (placeholderEmptyImage_onceToken != -1)
    dispatch_once(&placeholderEmptyImage_onceToken, &__block_literal_global_210706);
  return (UIImage *)(id)placeholderEmptyImage_placeholderEmptyImage;
}

+ (UIColor)unseenHighlightColor
{
  if (unseenHighlightColor_onceToken != -1)
    dispatch_once(&unseenHighlightColor_onceToken, &__block_literal_global_6_210705);
  return (UIColor *)(id)unseenHighlightColor_color;
}

+ (id)thumbnailBadgeImageForTintColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  id v15;
  CGSize v17;

  v4 = a3;
  v5 = v4;
  if (!thumbnailBadgeImageForTintColor__image
    || (objc_msgSend(v4, "isEqual:", thumbnailBadgeImageForTintColor__cachedTintColor) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXThumbsUpBubbleOnly"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_tintedImageWithColor:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXThumbsUpBubble"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_tintedImageWithColor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v17.width = 23.0;
    v17.height = 23.0;
    UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
    v11 = *MEMORY[0x1E0C9D538];
    v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v7, "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x1E0C9D538], v12, 1.0);
    objc_msgSend(v10, "drawAtPoint:blendMode:alpha:", 20, v11, v12, 1.0);
    UIGraphicsGetImageFromCurrentImageContext();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)thumbnailBadgeImageForTintColor__image;
    thumbnailBadgeImageForTintColor__image = v13;

    UIGraphicsEndImageContext();
    objc_storeStrong((id *)&thumbnailBadgeImageForTintColor__cachedTintColor, a3);

  }
  v15 = (id)thumbnailBadgeImageForTintColor__image;

  return v15;
}

+ (void)preloadResources
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PXInboxTableViewCell_preloadResources__block_invoke;
  v6[3] = &__block_descriptor_40_e5_v8__0l;
  v6[4] = a1;
  objc_msgSend(v3, "scheduleMainQueueTask:", v6);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __40__PXInboxTableViewCell_preloadResources__block_invoke_2;
  v5[3] = &__block_descriptor_40_e5_v8__0l;
  v5[4] = a1;
  objc_msgSend(v3, "scheduleMainQueueTask:", v5);

}

void __40__PXInboxTableViewCell_preloadResources__block_invoke()
{
  objc_msgSend((id)objc_opt_class(), "placeholderEmptyImage");

}

void __40__PXInboxTableViewCell_preloadResources__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "px_firstKeyWindow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tintColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "thumbnailBadgeImageForTintColor:", v4);
}

void __44__PXInboxTableViewCell_unseenHighlightColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.16, 0.43, 0.83, 0.2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)unseenHighlightColor_color;
  unseenHighlightColor_color = v0;

}

void __45__PXInboxTableViewCell_placeholderEmptyImage__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[PXInboxTableViewCell emptyPlaceholderImageForSystemImageNamed:scale:](PXInboxTableViewCell, "emptyPlaceholderImageForSystemImageNamed:scale:", CFSTR("icloud"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)placeholderEmptyImage_placeholderEmptyImage;
  placeholderEmptyImage_placeholderEmptyImage = v0;

}

@end
