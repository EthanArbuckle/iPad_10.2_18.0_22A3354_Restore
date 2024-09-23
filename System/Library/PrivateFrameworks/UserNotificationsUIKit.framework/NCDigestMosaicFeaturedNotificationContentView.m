@implementation NCDigestMosaicFeaturedNotificationContentView

- (void)setContentViewStyle:(unint64_t)a3
{
  if (self->_contentViewStyle != a3)
  {
    self->_contentViewStyle = a3;
    self->_hasUpdatedContent = 1;
    -[NCDigestMosaicFeaturedNotificationContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHorizontalMarginForContentOverlap:(double)a3
{
  self->_horizontalMarginForContentOverlap = a3;
  -[NCDigestMosaicFeaturedNotificationContentView setNeedsLayout](self, "setNeedsLayout");
}

- (double)imageAttachmentSizeRatio
{
  double result;
  _BOOL4 v4;

  if (-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
    return 0.6;
  v4 = -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium");
  result = 0.666666667;
  if (!v4)
    return 1.0;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)NCDigestMosaicFeaturedNotificationContentView;
  -[NCDigestMosaicFeaturedNotificationContentView layoutSubviews](&v3, sel_layoutSubviews);
  -[NCDigestMosaicFeaturedNotificationContentView bounds](self, "bounds");
  if (CGRectGetWidth(v4) > 0.0)
  {
    -[NCDigestMosaicFeaturedNotificationContentView _layoutSubviews](self, "_layoutSubviews");
    if (self->_hasUpdatedContent)
    {
      -[UIView pl_performCrossFadeIfNecessary](self->_crossfadingContentView, "pl_performCrossFadeIfNecessary");
      self->_hasUpdatedContent = 0;
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  UIImageView *thumbnailImageView;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  UILabel *primarySubtitleTextLabel;
  char v17;
  UILabel *secondaryTextLabel;
  char v19;
  UILabel *footerTextLabel;
  char v21;
  double v22;
  double v23;
  CGSize result;

  height = a3.height;
  width = a3.width;
  thumbnailImageView = self->_thumbnailImageView;
  if (self->_imageBoundingView)
  {
    if (thumbnailImageView)
    {
      -[NCDigestMosaicFeaturedNotificationContentView _imageHeightForBounds:](self, "_imageHeightForBounds:", 0.0, 0.0, a3.width, a3.height);
      if (!-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
        -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium", 8.0);
    }
    else
    {
      if (!-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
        -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium");
      if (!-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
        -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium", 30.0);
      if (!-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
        -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium", 16.0);
    }
  }
  -[NCDigestMosaicFeaturedNotificationContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:", 0.0, 0.0, width, height);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleSmall](self, "_isContentViewStyleSmall")
     || -[NCDigestMosaicFeaturedNotificationContentView _isAXSize](self, "_isAXSize");
  if (self->_primaryTextLabel
    && (!-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleSmall](self, "_isContentViewStyleSmall")
     || !thumbnailImageView))
  {
    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", self->_primaryTextLabel, -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForPrimaryTextInFrame:](self, "_numberOfLinesForPrimaryTextInFrame:", v8, v10, v12, v14));
  }
  primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
  if (primarySubtitleTextLabel)
    v17 = v15;
  else
    v17 = 1;
  if ((v17 & 1) == 0)
    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", primarySubtitleTextLabel, -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForPrimarySubtitleTextInFrame:](self, "_numberOfLinesForPrimarySubtitleTextInFrame:", v8, v10, v12, v14));
  secondaryTextLabel = self->_secondaryTextLabel;
  if (secondaryTextLabel)
    v19 = v15;
  else
    v19 = 1;
  if ((v19 & 1) == 0)
  {
    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", secondaryTextLabel, -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForSecondaryTextInFrame:](self, "_numberOfLinesForSecondaryTextInFrame:", v8, v10, v12, v14));
    if (!-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
      -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium", 6.0);
  }
  footerTextLabel = self->_footerTextLabel;
  if (footerTextLabel)
    v21 = v15;
  else
    v21 = 1;
  if ((v21 & 1) == 0)
    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", footerTextLabel, -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForFooterTextInFrame:](self, "_numberOfLinesForFooterTextInFrame:", v8, v10, v12, v14));
  if ((!-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleSmall](self, "_isContentViewStyleSmall")
     || !thumbnailImageView)
    && !-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
  {
    -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium");
  }
  UISizeRoundToScale();
  result.height = v23;
  result.width = v22;
  return result;
}

- (void)setBadgedIconView:(id)a3
{
  NCBadgedIconView **p_badgedIconView;
  NCBadgedIconView *v6;
  void *v7;
  void *v8;
  id v9;

  p_badgedIconView = &self->_badgedIconView;
  v9 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    -[NCBadgedIconView removeFromSuperview](*p_badgedIconView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_badgedIconView, a3);
    if (*p_badgedIconView)
    {
      -[NCDigestMosaicFeaturedNotificationContentView _configureImageBoundingViewIfNecessary](self, "_configureImageBoundingViewIfNecessary");
      -[UIView addSubview:](self->_imageBoundingView, "addSubview:", *p_badgedIconView);
      v6 = *p_badgedIconView;
    }
    else
    {
      v6 = 0;
    }
    -[NCBadgedIconView dominantColor](v6, "dominantColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCDigestMosaicFeaturedNotificationContentView _updateBackgroundColorForIconImageDominantColor:](self, "_updateBackgroundColorForIconImageDominantColor:", v7);

    if (objc_msgSend(v9, "isFeaturingSymbol"))
    {
      -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", *p_badgedIconView, 0, v8, v8);
    -[NCDigestMosaicFeaturedNotificationContentView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (NSString)primaryText
{
  return -[UILabel text](self->_primaryTextLabel, "text");
}

- (void)setPrimaryText:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  UILabel *primaryTextLabel;
  UILabel *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  id v12;

  v12 = a3;
  -[NCDigestMosaicFeaturedNotificationContentView primaryText](self, "primaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  v6 = v12;
  if ((v5 & 1) == 0)
  {
    primaryTextLabel = self->_primaryTextLabel;
    if (v12)
    {
      if (!primaryTextLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v9 = self->_primaryTextLabel;
        self->_primaryTextLabel = v8;

        -[UILabel setLineBreakMode:](self->_primaryTextLabel, "setLineBreakMode:", 4);
        if (-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleSmall](self, "_isContentViewStyleSmall"))
          -[UILabel setAdjustsFontSizeToFitWidth:](self->_primaryTextLabel, "setAdjustsFontSizeToFitWidth:", 1);
        -[NCDigestMosaicFeaturedNotificationContentView _configureCrossfadingContentViewIfNecessary](self, "_configureCrossfadingContentViewIfNecessary");
        -[UIView addSubview:](self->_crossfadingContentView, "addSubview:", self->_primaryTextLabel);
        -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_primaryTextLabel, -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleSmall](self, "_isContentViewStyleSmall") ^ 1, v10, 0);

      }
      -[NCDigestMosaicFeaturedNotificationContentView _updateTextAttributesForPrimaryTextLabel](self, "_updateTextAttributesForPrimaryTextLabel");
      -[UILabel setText:](self->_primaryTextLabel, "setText:", v12);
    }
    else
    {
      -[UILabel removeFromSuperview](primaryTextLabel, "removeFromSuperview");
      v11 = self->_primaryTextLabel;
      self->_primaryTextLabel = 0;

    }
    self->_hasUpdatedContent = 1;
    -[NCDigestMosaicFeaturedNotificationContentView setNeedsLayout](self, "setNeedsLayout");
    v6 = v12;
  }

}

- (NSString)primarySubtitleText
{
  return -[UILabel text](self->_primarySubtitleTextLabel, "text");
}

- (void)setPrimarySubtitleText:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  UILabel *primarySubtitleTextLabel;
  UILabel *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  id v12;

  v12 = a3;
  -[NCDigestMosaicFeaturedNotificationContentView primarySubtitleText](self, "primarySubtitleText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  v6 = v12;
  if ((v5 & 1) == 0)
  {
    primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
    if (v12)
    {
      if (!primarySubtitleTextLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v9 = self->_primarySubtitleTextLabel;
        self->_primarySubtitleTextLabel = v8;

        -[UILabel setLineBreakMode:](self->_primarySubtitleTextLabel, "setLineBreakMode:", 4);
        -[NCDigestMosaicFeaturedNotificationContentView _configureCrossfadingContentViewIfNecessary](self, "_configureCrossfadingContentViewIfNecessary");
        -[UIView addSubview:](self->_crossfadingContentView, "addSubview:", self->_primarySubtitleTextLabel);
        -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_primarySubtitleTextLabel, 1, v10, 0);

      }
      -[NCDigestMosaicFeaturedNotificationContentView _updateTextAttributesForPrimarySubtitleTextLabel](self, "_updateTextAttributesForPrimarySubtitleTextLabel");
      -[UILabel setText:](self->_primarySubtitleTextLabel, "setText:", v12);
    }
    else
    {
      -[UILabel removeFromSuperview](primarySubtitleTextLabel, "removeFromSuperview");
      v11 = self->_primarySubtitleTextLabel;
      self->_primarySubtitleTextLabel = 0;

    }
    self->_hasUpdatedContent = 1;
    -[NCDigestMosaicFeaturedNotificationContentView setNeedsLayout](self, "setNeedsLayout");
    v6 = v12;
  }

}

- (NSAttributedString)secondaryText
{
  return -[UILabel attributedText](self->_secondaryTextLabel, "attributedText");
}

- (void)setSecondaryText:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  UILabel *secondaryTextLabel;
  UILabel *v8;
  UILabel *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[NCDigestMosaicFeaturedNotificationContentView secondaryText](self, "secondaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  v6 = v12;
  if ((v5 & 1) == 0)
  {
    secondaryTextLabel = self->_secondaryTextLabel;
    if (v12)
    {
      if (!secondaryTextLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v9 = self->_secondaryTextLabel;
        self->_secondaryTextLabel = v8;

        -[UILabel _setTextAlignmentFollowsWritingDirection:](self->_secondaryTextLabel, "_setTextAlignmentFollowsWritingDirection:", 1);
        -[UILabel setLineBreakMode:](self->_secondaryTextLabel, "setLineBreakMode:", 4);
        -[NCDigestMosaicFeaturedNotificationContentView _configureCrossfadingContentViewIfNecessary](self, "_configureCrossfadingContentViewIfNecessary");
        -[UIView addSubview:](self->_crossfadingContentView, "addSubview:", self->_secondaryTextLabel);
        -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_secondaryTextLabel, 0, v10, 0);

        secondaryTextLabel = self->_secondaryTextLabel;
      }
      -[UILabel textColor](secondaryTextLabel, "textColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setAttributedText:](self->_secondaryTextLabel, "setAttributedText:", v12);
      -[UILabel setTextColor:](self->_secondaryTextLabel, "setTextColor:", v11);
      -[NCDigestMosaicFeaturedNotificationContentView _updateTextAttributesForSecondaryTextElement](self, "_updateTextAttributesForSecondaryTextElement");
    }
    else
    {
      -[UILabel removeFromSuperview](secondaryTextLabel, "removeFromSuperview");
      v11 = self->_secondaryTextLabel;
      self->_secondaryTextLabel = 0;
    }

    self->_hasUpdatedContent = 1;
    -[NCDigestMosaicFeaturedNotificationContentView setNeedsLayout](self, "setNeedsLayout");
    v6 = v12;
  }

}

- (NSString)footerText
{
  return -[UILabel text](self->_footerTextLabel, "text");
}

- (void)setFooterText:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  UILabel *footerTextLabel;
  UILabel *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  id v12;

  v12 = a3;
  -[NCDigestMosaicFeaturedNotificationContentView footerText](self, "footerText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  v6 = v12;
  if ((v5 & 1) == 0)
  {
    footerTextLabel = self->_footerTextLabel;
    if (v12)
    {
      if (!footerTextLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v9 = self->_footerTextLabel;
        self->_footerTextLabel = v8;

        -[UILabel setLineBreakMode:](self->_footerTextLabel, "setLineBreakMode:", 4);
        -[NCDigestMosaicFeaturedNotificationContentView addSubview:](self, "addSubview:", self->_footerTextLabel);
        -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_footerTextLabel, 1, v10, 0);

      }
      -[NCDigestMosaicFeaturedNotificationContentView _updateTextAttributesForFooterTextLabel](self, "_updateTextAttributesForFooterTextLabel");
      -[UILabel setText:](self->_footerTextLabel, "setText:", v12);
    }
    else
    {
      -[UILabel removeFromSuperview](footerTextLabel, "removeFromSuperview");
      v11 = self->_footerTextLabel;
      self->_footerTextLabel = 0;

    }
    self->_hasUpdatedContent = 1;
    -[NCDigestMosaicFeaturedNotificationContentView setNeedsLayout](self, "setNeedsLayout");
    v6 = v12;
  }

}

- (void)setSecondaryTextMaximumNumberOfLines:(unint64_t)a3
{
  void *v4;
  uint64_t v5;

  if (self->_secondaryTextMaximumNumberOfLines != a3)
  {
    self->_secondaryTextMaximumNumberOfLines = a3;
    -[NCDigestMosaicFeaturedNotificationContentView secondaryText](self, "secondaryText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5)
    {
      self->_hasUpdatedContent = 1;
      -[NCDigestMosaicFeaturedNotificationContentView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  if (self->_screenCaptureProhibited != a3)
  {
    self->_screenCaptureProhibited = a3;
    -[NCDigestMosaicFeaturedNotificationContentView nc_setScreenCaptureProhibited:](self, "nc_setScreenCaptureProhibited:");
  }
}

- (UIImage)thumbnail
{
  return -[UIImageView image](self->_thumbnailImageView, "image");
}

- (void)setThumbnail:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  UIImageView *thumbnailImageView;
  UIImageView *v8;
  UIImageView *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[NCDigestMosaicFeaturedNotificationContentView thumbnail](self, "thumbnail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  v6 = v11;
  if ((v5 & 1) == 0)
  {
    thumbnailImageView = self->_thumbnailImageView;
    if (v11)
    {
      if (!thumbnailImageView)
      {
        v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
        v9 = self->_thumbnailImageView;
        self->_thumbnailImageView = v8;

        -[UIImageView setContentMode:](self->_thumbnailImageView, "setContentMode:", 2);
        -[NCDigestMosaicFeaturedNotificationContentView _configureImageBoundingViewIfNecessary](self, "_configureImageBoundingViewIfNecessary");
        -[UIView addSubview:](self->_imageBoundingView, "addSubview:", self->_thumbnailImageView);
        v6 = v11;
        thumbnailImageView = self->_thumbnailImageView;
      }
      -[UIImageView setImage:](thumbnailImageView, "setImage:", v6);
      -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationListBaseContentView _updateVisualStylingOfImageView:ifSymbolImageWithStyle:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfImageView:ifSymbolImageWithStyle:visualStylingProvider:outgoingProvider:", self->_thumbnailImageView, 0, v10, v10);
    }
    else
    {
      -[UIImageView removeFromSuperview](thumbnailImageView, "removeFromSuperview");
      v10 = self->_thumbnailImageView;
      self->_thumbnailImageView = 0;
    }

    -[NCDigestMosaicFeaturedNotificationContentView _updateTextAttributes](self, "_updateTextAttributes");
    self->_hasUpdatedContent = 1;
    -[NCDigestMosaicFeaturedNotificationContentView setNeedsLayout](self, "setNeedsLayout");
    v6 = v11;
  }

}

- (void)_layoutSubviews
{
  -[NCDigestMosaicFeaturedNotificationContentView _layoutImageBoundingView](self, "_layoutImageBoundingView");
  -[NCDigestMosaicFeaturedNotificationContentView _layoutThumbnailImageView](self, "_layoutThumbnailImageView");
  -[NCDigestMosaicFeaturedNotificationContentView _layoutIconImageView](self, "_layoutIconImageView");
  -[NCDigestMosaicFeaturedNotificationContentView _layoutBackgroundView](self, "_layoutBackgroundView");
  -[NCDigestMosaicFeaturedNotificationContentView _layoutPrimaryTextLabel](self, "_layoutPrimaryTextLabel");
  -[NCDigestMosaicFeaturedNotificationContentView _layoutPrimarySubtitleTextLabel](self, "_layoutPrimarySubtitleTextLabel");
  -[NCDigestMosaicFeaturedNotificationContentView _layoutSecondaryTextLabel](self, "_layoutSecondaryTextLabel");
  -[NCDigestMosaicFeaturedNotificationContentView _layoutFooterTextLabel](self, "_layoutFooterTextLabel");
}

- (void)_layoutImageBoundingView
{
  UIView *imageBoundingView;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGRect v12;

  imageBoundingView = self->_imageBoundingView;
  if (imageBoundingView)
  {
    -[UIView frame](imageBoundingView, "frame");
    -[NCDigestMosaicFeaturedNotificationContentView bounds](self, "bounds");
    v8 = v4;
    v9 = v5;
    v10 = v6;
    v11 = v7;
    if (self->_thumbnailImageView)
    {
      -[NCDigestMosaicFeaturedNotificationContentView _imageHeightForBounds:](self, "_imageHeightForBounds:", v4, v5, v6, v7);
    }
    else
    {
      if (!-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
        -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium");
      if (!-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
        -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium");
      if (!-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
        -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium", 16.0);
    }
    v12.origin.x = v8;
    v12.origin.y = v9;
    v12.size.width = v10;
    v12.size.height = v11;
    CGRectGetWidth(v12);
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_imageBoundingView, "setFrame:");
  }
}

- (void)_layoutThumbnailImageView
{
  UIImageView *thumbnailImageView;

  thumbnailImageView = self->_thumbnailImageView;
  if (thumbnailImageView)
  {
    -[UIImageView frame](thumbnailImageView, "frame");
    -[UIView bounds](self->_imageBoundingView, "bounds");
    -[UIImageView setFrame:](self->_thumbnailImageView, "setFrame:");
  }
}

- (void)_layoutIconImageView
{
  CGRect v3;

  if (self->_badgedIconView)
  {
    -[UIView bringSubviewToFront:](self->_imageBoundingView, "bringSubviewToFront:");
    -[NCBadgedIconView frame](self->_badgedIconView, "frame");
    if (!-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
      -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium");
    if (-[NCDigestMosaicFeaturedNotificationContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      -[UIView bounds](self->_imageBoundingView, "bounds");
      CGRectGetWidth(v3);
      if (!-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
        -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium", 30.0);
    }
    if (!-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
      -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium");
    if (!-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
      -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium");
    UIRectIntegralWithScale();
    -[NCBadgedIconView setFrame:](self->_badgedIconView, "setFrame:");
  }
}

- (void)_layoutBackgroundView
{
  UIView *backgroundView;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  UIImageView *thumbnailImageView;
  CAGradientLayer *backgroundGradientLayer;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    -[UIView frame](backgroundView, "frame");
    -[NCDigestMosaicFeaturedNotificationContentView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    if (self->_thumbnailImageView)
    {
      -[UIView frame](self->_imageBoundingView, "frame");
      CGRectGetMaxY(v14);
    }
    v15.origin.x = v5;
    v15.origin.y = v7;
    v15.size.width = v9;
    v15.size.height = v11;
    CGRectGetWidth(v15);
    thumbnailImageView = self->_thumbnailImageView;
    v16.origin.x = v5;
    v16.origin.y = v7;
    v16.size.width = v9;
    v16.size.height = v11;
    CGRectGetHeight(v16);
    if (thumbnailImageView)
    {
      -[UIView frame](self->_imageBoundingView, "frame");
      CGRectGetMaxY(v17);
    }
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_backgroundView, "setFrame:");
    backgroundGradientLayer = self->_backgroundGradientLayer;
    -[UIView bounds](self->_backgroundView, "bounds");
    -[CAGradientLayer setFrame:](backgroundGradientLayer, "setFrame:");
  }
}

- (void)_layoutPrimaryTextLabel
{
  UILabel *primaryTextLabel;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double x;
  double y;
  double width;
  double height;
  double v17;
  double v18;
  double MaxY;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  double v24;
  double v25;
  NCDigestMosaicFeaturedNotificationContentView *v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat rect;
  CGFloat v38;
  CGFloat v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  primaryTextLabel = self->_primaryTextLabel;
  if (primaryTextLabel)
  {
    -[UILabel frame](primaryTextLabel, "frame");
    if (-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleSmall](self, "_isContentViewStyleSmall")
      && (self->_thumbnailImageView || -[NCDigestMosaicFeaturedNotificationContentView _isAXSize](self, "_isAXSize")))
    {
      v4 = *MEMORY[0x1E0C9D648];
      v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      -[NCDigestMosaicFeaturedNotificationContentView bounds](self, "bounds");
      v9 = v8;
      v38 = v11;
      v39 = v10;
      rect = v12;
      -[NCDigestMosaicFeaturedNotificationContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:");
      x = v40.origin.x;
      y = v40.origin.y;
      width = v40.size.width;
      height = v40.size.height;
      v17 = CGRectGetWidth(v40);
      v34 = height;
      -[UILabel unui_measuringHeightWithNumberOfLines:](self->_primaryTextLabel, "unui_measuringHeightWithNumberOfLines:", -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForPrimaryTextInFrame:](self, "_numberOfLinesForPrimaryTextInFrame:", x, y, width, height));
      v35 = v18;
      -[UIView frame](self->_imageBoundingView, "frame");
      MaxY = CGRectGetMaxY(v41);
      if (self->_thumbnailImageView)
      {
        v20 = 8.0;
        if (!-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
        {
          if (-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium"))
          {
            v20 = 6.0;
          }
          else
          {
            v20 = 4.0;
          }
        }
      }
      else
      {
        v20 = 0.0;
      }
      v36 = v9;
      if (-[NCDigestMosaicFeaturedNotificationContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      {
        v42.origin.x = v9;
        v42.size.width = v38;
        v42.origin.y = v39;
        v42.size.height = rect;
        v21 = CGRectGetMaxX(v42) - v17;
        v22 = -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge");
        v23 = 12.0;
        if (!v22)
        {
          -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium", 12.0);
          v23 = 10.0;
        }
        v24 = v21 - v23;
      }
      else
      {
        v24 = 12.0;
        if (!-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
        {
          -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium");
          v24 = 10.0;
        }
      }
      v25 = MaxY + v20;
      -[NCBadgedIconView superview](self->_badgedIconView, "superview");
      v26 = (NCDigestMosaicFeaturedNotificationContentView *)objc_claimAutoreleasedReturnValue();
      if (v26 == self)
      {
        -[NCBadgedIconView frame](self->_badgedIconView, "frame");
        UIRectCenteredYInRect();
        v24 = v30;
        v27 = v31;
        v28 = v32;
        v29 = v33;
      }
      else
      {
        v27 = v25;
        v28 = v17;
        v29 = v35;
      }

      -[UILabel unui_drawingHeightWithNumberOfLines:](self->_primaryTextLabel, "unui_drawingHeightWithNumberOfLines:", -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForPrimaryTextInFrame:](self, "_numberOfLinesForPrimaryTextInFrame:", x, y, width, v34));
      v43.origin.x = v36;
      v43.size.height = rect;
      v43.size.width = v38;
      v43.origin.y = v39;
      CGRectGetHeight(v43);
      v44.origin.x = v24;
      v44.origin.y = v27;
      v44.size.width = v28;
      v44.size.height = v29;
      CGRectGetWidth(v44);
      BSRectWithSize();
      UIRectCenteredIntegralRectScale();
    }
    -[UILabel setFrame:](self->_primaryTextLabel, "setFrame:", v4, v5, v6, v7);
  }
}

- (void)_layoutPrimarySubtitleTextLabel
{
  UILabel *primarySubtitleTextLabel;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double x;
  double y;
  double width;
  double height;
  double v19;
  UILabel *primaryTextLabel;
  double v21;
  double v22;
  UIView *imageBoundingView;
  double MaxY;
  BOOL v25;
  double v26;
  _BOOL4 v27;
  double v28;
  BOOL v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
  if (primarySubtitleTextLabel)
  {
    -[UILabel frame](primarySubtitleTextLabel, "frame");
    if (-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleSmall](self, "_isContentViewStyleSmall")
      || -[NCDigestMosaicFeaturedNotificationContentView _isAXSize](self, "_isAXSize"))
    {
      v4 = *MEMORY[0x1E0C9D648];
      v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      -[NCDigestMosaicFeaturedNotificationContentView bounds](self, "bounds");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v32 = v14;
      -[NCDigestMosaicFeaturedNotificationContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:");
      x = v35.origin.x;
      y = v35.origin.y;
      width = v35.size.width;
      height = v35.size.height;
      v19 = CGRectGetWidth(v35);
      -[UILabel unui_measuringHeightWithNumberOfLines:](self->_primarySubtitleTextLabel, "unui_measuringHeightWithNumberOfLines:", -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForPrimarySubtitleTextInFrame:](self, "_numberOfLinesForPrimarySubtitleTextInFrame:", x, y, width, height));
      primaryTextLabel = self->_primaryTextLabel;
      v33 = v13;
      v34 = v21;
      if (primaryTextLabel)
      {
        -[UILabel frame](primaryTextLabel, "frame");
        v22 = CGRectGetMaxY(v36) + 1.0;
      }
      else
      {
        imageBoundingView = self->_imageBoundingView;
        if (imageBoundingView)
        {
          -[UIView frame](imageBoundingView, "frame");
          MaxY = CGRectGetMaxY(v37);
          if (self->_thumbnailImageView)
          {
            v25 = -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge");
            v26 = 8.0;
            if (!v25)
            {
              v27 = -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium", 8.0);
              v26 = 4.0;
              if (v27)
                v26 = 6.0;
            }
          }
          else
          {
            v26 = 0.0;
          }
          v22 = MaxY + v26;
        }
        else
        {
          v22 = 0.0;
        }
      }
      if (-[NCDigestMosaicFeaturedNotificationContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      {
        v38.origin.x = v9;
        v38.origin.y = v11;
        v38.size.height = v32;
        v38.size.width = v33;
        v28 = CGRectGetMaxX(v38) - v19;
        v29 = -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge");
        v30 = 12.0;
        if (!v29)
        {
          -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium", 12.0);
          v30 = 10.0;
        }
        v31 = v28 - v30;
      }
      else
      {
        v31 = 12.0;
        if (!-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
        {
          -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium");
          v31 = 10.0;
        }
      }
      -[UILabel unui_drawingHeightWithNumberOfLines:](self->_primarySubtitleTextLabel, "unui_drawingHeightWithNumberOfLines:", -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForPrimarySubtitleTextInFrame:](self, "_numberOfLinesForPrimarySubtitleTextInFrame:", x, y, width, height));
      v39.origin.x = v31;
      v39.origin.y = v22;
      v39.size.width = v19;
      v39.size.height = v34;
      CGRectGetWidth(v39);
      BSRectWithSize();
      UIRectCenteredIntegralRectScale();
    }
    -[UILabel setFrame:](self->_primarySubtitleTextLabel, "setFrame:", v4, v5, v6, v7);
  }
}

- (void)_layoutSecondaryTextLabel
{
  UILabel *secondaryTextLabel;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double x;
  double y;
  double width;
  double height;
  double v19;
  UILabel *primarySubtitleTextLabel;
  double v21;
  double MaxY;
  BOOL v23;
  double v24;
  BOOL v25;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  double v30;
  double v31;
  UIView *imageBoundingView;
  BOOL v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  secondaryTextLabel = self->_secondaryTextLabel;
  if (secondaryTextLabel)
  {
    -[UILabel frame](secondaryTextLabel, "frame");
    if (-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleSmall](self, "_isContentViewStyleSmall")
      || -[NCDigestMosaicFeaturedNotificationContentView _isAXSize](self, "_isAXSize"))
    {
      v4 = *MEMORY[0x1E0C9D648];
      v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
LABEL_20:
      -[UILabel setFrame:](self->_secondaryTextLabel, "setFrame:", v4, v5, v6, v7);
      return;
    }
    -[NCDigestMosaicFeaturedNotificationContentView bounds](self, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v34 = v14;
    -[NCDigestMosaicFeaturedNotificationContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:");
    x = v37.origin.x;
    y = v37.origin.y;
    width = v37.size.width;
    height = v37.size.height;
    v19 = CGRectGetWidth(v37);
    -[UILabel unui_measuringHeightWithNumberOfLines:](self->_secondaryTextLabel, "unui_measuringHeightWithNumberOfLines:", -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForSecondaryTextInFrame:](self, "_numberOfLinesForSecondaryTextInFrame:", x, y, width, height));
    primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
    v35 = v13;
    v36 = v21;
    if (primarySubtitleTextLabel || (primarySubtitleTextLabel = self->_primaryTextLabel) != 0)
    {
      -[UILabel frame](primarySubtitleTextLabel, "frame");
      MaxY = CGRectGetMaxY(v38);
      v23 = -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge");
      v24 = 6.0;
      if (!v23)
      {
        v25 = !-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium", 6.0);
        v24 = 1.0;
        v26 = 2.0;
        goto LABEL_10;
      }
    }
    else
    {
      imageBoundingView = self->_imageBoundingView;
      if (!imageBoundingView)
      {
        v27 = 0.0;
        goto LABEL_13;
      }
      -[UIView frame](imageBoundingView, "frame");
      MaxY = CGRectGetMaxY(v41);
      if (self->_thumbnailImageView)
      {
        v33 = -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge");
        v24 = 8.0;
        if (!v33)
        {
          v25 = !-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium", 8.0);
          v24 = 4.0;
          v26 = 6.0;
LABEL_10:
          if (!v25)
            v24 = v26;
        }
      }
      else
      {
        v24 = 0.0;
      }
    }
    v27 = MaxY + v24;
LABEL_13:
    if (-[NCDigestMosaicFeaturedNotificationContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      v39.origin.x = v9;
      v39.origin.y = v11;
      v39.size.height = v34;
      v39.size.width = v35;
      v28 = CGRectGetMaxX(v39) - v19;
      v29 = -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge");
      v30 = 12.0;
      if (!v29)
      {
        -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium", 12.0);
        v30 = 10.0;
      }
      v31 = v28 - v30;
    }
    else
    {
      v31 = 12.0;
      if (!-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
      {
        -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium");
        v31 = 10.0;
      }
    }
    -[UILabel unui_drawingHeightWithNumberOfLines:](self->_secondaryTextLabel, "unui_drawingHeightWithNumberOfLines:", -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForSecondaryTextInFrame:](self, "_numberOfLinesForSecondaryTextInFrame:", x, y, width, height));
    v40.origin.x = v31;
    v40.origin.y = v27;
    v40.size.width = v19;
    v40.size.height = v36;
    CGRectGetWidth(v40);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    goto LABEL_20;
  }
}

- (void)_layoutFooterTextLabel
{
  UILabel *footerTextLabel;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double x;
  double y;
  double width;
  double height;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat rect;
  CGFloat MaxY;
  CGFloat v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  footerTextLabel = self->_footerTextLabel;
  if (footerTextLabel)
  {
    -[UILabel frame](footerTextLabel, "frame");
    if (-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleSmall](self, "_isContentViewStyleSmall")
      || -[NCDigestMosaicFeaturedNotificationContentView _isAXSize](self, "_isAXSize"))
    {
      v4 = *MEMORY[0x1E0C9D648];
      v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      -[NCDigestMosaicFeaturedNotificationContentView bounds](self, "bounds");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      rect = v14;
      -[NCDigestMosaicFeaturedNotificationContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:");
      x = v29.origin.x;
      y = v29.origin.y;
      width = v29.size.width;
      height = v29.size.height;
      v19 = CGRectGetWidth(v29);
      -[UILabel unui_measuringHeightWithNumberOfLines:](self->_footerTextLabel, "unui_measuringHeightWithNumberOfLines:", -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForFooterTextInFrame:](self, "_numberOfLinesForFooterTextInFrame:", x, y, width, height));
      v28 = v20;
      -[UILabel frame](self->_secondaryTextLabel, "frame");
      MaxY = CGRectGetMaxY(v30);
      if (-[NCDigestMosaicFeaturedNotificationContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      {
        v31.origin.x = v9;
        v31.origin.y = rect;
        v31.size.width = v11;
        v31.size.height = v13;
        v21 = CGRectGetMaxX(v31) - v19;
        v22 = -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge");
        v23 = 12.0;
        v24 = v19;
        if (!v22)
        {
          -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium", 12.0);
          v23 = 10.0;
        }
        v25 = v21 - v23;
      }
      else
      {
        v25 = 12.0;
        v24 = v19;
        if (!-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
        {
          -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium");
          v25 = 10.0;
        }
      }
      -[UILabel unui_drawingHeightWithNumberOfLines:](self->_footerTextLabel, "unui_drawingHeightWithNumberOfLines:", -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForFooterTextInFrame:](self, "_numberOfLinesForFooterTextInFrame:", x, y, width, height));
      v32.origin.x = v25;
      v32.origin.y = MaxY;
      v32.size.width = v24;
      v32.size.height = v28;
      CGRectGetWidth(v32);
      BSRectWithSize();
      UIRectCenteredIntegralRectScale();
    }
    -[UILabel setFrame:](self->_footerTextLabel, "setFrame:", v4, v5, v6, v7);
  }
}

- (void)_configureClippingViewIfNecessary
{
  id v3;
  UIView *v4;
  UIView *clippingView;
  UIView *v6;
  BOOL v7;
  double v8;

  if (!self->_clippingView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NCDigestMosaicFeaturedNotificationContentView bounds](self, "bounds");
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    clippingView = self->_clippingView;
    self->_clippingView = v4;

    -[UIView setAutoresizingMask:](self->_clippingView, "setAutoresizingMask:", 18);
    -[UIView setClipsToBounds:](self->_clippingView, "setClipsToBounds:", 1);
    v6 = self->_clippingView;
    v7 = -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge");
    v8 = 18.0;
    if (!v7)
    {
      -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium", 18.0);
      v8 = 15.0;
    }
    -[UIView _setContinuousCornerRadius:](v6, "_setContinuousCornerRadius:", v8);
    -[NCDigestMosaicFeaturedNotificationContentView addSubview:](self, "addSubview:", self->_clippingView);
    -[NCDigestMosaicFeaturedNotificationContentView sendSubviewToBack:](self, "sendSubviewToBack:", self->_clippingView);
  }
}

- (void)_configureImageBoundingViewIfNecessary
{
  id v3;
  UIView *v4;
  UIView *imageBoundingView;

  if (!self->_imageBoundingView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    imageBoundingView = self->_imageBoundingView;
    self->_imageBoundingView = v4;

    -[UIView setClipsToBounds:](self->_imageBoundingView, "setClipsToBounds:", 1);
    -[NCDigestMosaicFeaturedNotificationContentView _configureCrossfadingContentViewIfNecessary](self, "_configureCrossfadingContentViewIfNecessary");
    -[UIView addSubview:](self->_crossfadingContentView, "addSubview:", self->_imageBoundingView);
  }
}

- (void)_configureCrossfadingContentViewIfNecessary
{
  id v3;
  UIView *v4;
  UIView *crossfadingContentView;

  if (!self->_crossfadingContentView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NCDigestMosaicFeaturedNotificationContentView bounds](self, "bounds");
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    crossfadingContentView = self->_crossfadingContentView;
    self->_crossfadingContentView = v4;

    -[NCDigestMosaicFeaturedNotificationContentView _configureClippingViewIfNecessary](self, "_configureClippingViewIfNecessary");
    -[UIView addSubview:](self->_clippingView, "addSubview:", self->_crossfadingContentView);
    -[UIView setAutoresizingMask:](self->_crossfadingContentView, "setAutoresizingMask:", 18);
  }
}

- (void)_configureBackgroundViewIfNecessary
{
  id v3;
  UIView *v4;
  UIView *backgroundView;
  CAGradientLayer *v6;
  CAGradientLayer *backgroundGradientLayer;
  void *v8;

  if (!self->_backgroundView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    backgroundView = self->_backgroundView;
    self->_backgroundView = v4;

    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v6 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
    backgroundGradientLayer = self->_backgroundGradientLayer;
    self->_backgroundGradientLayer = v6;

    -[CAGradientLayer setType:](self->_backgroundGradientLayer, "setType:", *MEMORY[0x1E0CD2F48]);
    -[CAGradientLayer setStartPoint:](self->_backgroundGradientLayer, "setStartPoint:", 0.5, 1.0);
    -[CAGradientLayer setEndPoint:](self->_backgroundGradientLayer, "setEndPoint:", 0.5, 0.0);
    -[UIView layer](self->_backgroundView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertSublayer:atIndex:", self->_backgroundGradientLayer, 0);

    -[NCDigestMosaicFeaturedNotificationContentView _configureCrossfadingContentViewIfNecessary](self, "_configureCrossfadingContentViewIfNecessary");
    -[UIView addSubview:](self->_crossfadingContentView, "addSubview:", self->_backgroundView);
    -[UIView sendSubviewToBack:](self->_crossfadingContentView, "sendSubviewToBack:", self->_backgroundView);
  }
}

- (void)_configureBackgroundColorViewIfNecessary
{
  id v3;
  MTStylingProvidingSolidColorView *v4;
  MTStylingProvidingSolidColorView *backgroundColorView;

  if (!self->_backgroundColorView)
  {
    v3 = objc_alloc(MEMORY[0x1E0D474B0]);
    -[NCDigestMosaicFeaturedNotificationContentView bounds](self, "bounds");
    v4 = (MTStylingProvidingSolidColorView *)objc_msgSend(v3, "initWithFrame:");
    backgroundColorView = self->_backgroundColorView;
    self->_backgroundColorView = v4;

    -[NCDigestMosaicFeaturedNotificationContentView _configureClippingViewIfNecessary](self, "_configureClippingViewIfNecessary");
    -[UIView addSubview:](self->_clippingView, "addSubview:", self->_backgroundColorView);
    -[UIView sendSubviewToBack:](self->_clippingView, "sendSubviewToBack:", self->_backgroundColorView);
    -[MTStylingProvidingSolidColorView setAutoresizingMask:](self->_backgroundColorView, "setAutoresizingMask:", 18);
  }
}

- (BOOL)_isAXSize
{
  NSString *v2;
  BOOL IsAccessibilityCategory;

  -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v2);

  return IsAccessibilityCategory;
}

- (double)_imageHeightForBounds:(CGRect)a3
{
  double result;

  CGRectGetWidth(a3);
  if (!-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
    -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium");
  UICeilToScale();
  return result;
}

- (BOOL)_isContentViewStyleLarge
{
  return -[NCDigestMosaicFeaturedNotificationContentView contentViewStyle](self, "contentViewStyle") == 2;
}

- (BOOL)_isContentViewStyleMedium
{
  return -[NCDigestMosaicFeaturedNotificationContentView contentViewStyle](self, "contentViewStyle") == 0;
}

- (BOOL)_isContentViewStyleSmall
{
  return -[NCDigestMosaicFeaturedNotificationContentView contentViewStyle](self, "contentViewStyle") == 1;
}

- (CGRect)_labelSizingBoundsForRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = CGRectGetWidth(a3);
  v9 = -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge");
  v10 = 12.0;
  if (!v9)
  {
    -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium", 12.0);
    v10 = 10.0;
  }
  v11 = v8 + v10 * -2.0;
  -[NCDigestMosaicFeaturedNotificationContentView horizontalMarginForContentOverlap](self, "horizontalMarginForContentOverlap");
  v13 = v11 - v12;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v14 = CGRectGetHeight(v18);
  v15 = 0.0;
  v16 = 0.0;
  v17 = v13;
  result.size.height = v14;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)_updateBackgroundColorForIconImageDominantColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  CAGradientLayer *backgroundGradientLayer;
  UIColor *v11;
  id v12;
  void *v13;
  UIColor *backgroundColor;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NCDigestMosaicFeaturedNotificationContentView _configureBackgroundViewIfNecessary](self, "_configureBackgroundViewIfNecessary");
  -[NCDigestMosaicFeaturedNotificationContentView _configureBackgroundColorViewIfNecessary](self, "_configureBackgroundColorViewIfNecessary");
  -[NCDigestMosaicFeaturedNotificationContentView sectionIdentifier](self, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _NCNotificationBackgroundColorForSectionIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = v4;
  v8 = v7;

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = 0.0;
  v18 = 0.0;
  v15 = 0.0;
  v16 = 0.0;
  objc_msgSend(v8, "getHue:saturation:brightness:alpha:", &v18, &v17, &v16, &v15);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v18, v17, v16 + dbl_1CFD91AA0[v16 > 0.95], v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  backgroundGradientLayer = self->_backgroundGradientLayer;
  v11 = (UIColor *)objc_retainAutorelease(v8);
  v19[0] = -[UIColor CGColor](v11, "CGColor");
  v12 = objc_retainAutorelease(v9);
  v19[1] = objc_msgSend(v12, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setColors:](backgroundGradientLayer, "setColors:", v13);

  -[MTStylingProvidingSolidColorView setBackgroundColor:](self->_backgroundColorView, "setBackgroundColor:", v11);
  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = v11;

  -[NCDigestMosaicFeaturedNotificationContentView _updateVisualStylingProviderForBackgroundColorView](self, "_updateVisualStylingProviderForBackgroundColorView");
}

- (void)_updateVisualStylingProviderForBackgroundColorView
{
  MTStylingProvidingSolidColorView *backgroundColorView;
  id v4;

  backgroundColorView = self->_backgroundColorView;
  if (backgroundColorView)
  {
    -[MTStylingProvidingSolidColorView visualStylingProviderForCategory:](backgroundColorView, "visualStylingProviderForCategory:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListBaseContentView setVisualStylingProvider:forCategory:](self, "setVisualStylingProvider:forCategory:", v4, 1);

  }
}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  NCBadgedIconView *badgedIconView;
  id v8;
  void *v9;
  NCBadgedIconView *v10;
  id v11;
  id v12;

  badgedIconView = self->_badgedIconView;
  v8 = a5;
  v12 = a3;
  if (-[NCBadgedIconView isFeaturingSymbol](badgedIconView, "isFeaturingSymbol"))
    v9 = v12;
  else
    v9 = 0;
  v10 = self->_badgedIconView;
  v11 = v9;
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v10, 0, v11, v8);
  -[NCNotificationListBaseContentView _updateVisualStylingOfImageView:ifSymbolImageWithStyle:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfImageView:ifSymbolImageWithStyle:visualStylingProvider:outgoingProvider:", self->_thumbnailImageView, 0, v12, v8);
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_primaryTextLabel, -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleSmall](self, "_isContentViewStyleSmall") ^ 1, v12, v8);
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_primarySubtitleTextLabel, 1, v12, v8);
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_secondaryTextLabel, 0, v12, v8);
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_footerTextLabel, 1, v12, v8);

}

- (unint64_t)_maximumNumberOfLinesForPrimaryText
{
  NSString *v2;
  unint64_t v3;

  -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v2))
    v3 = 0;
  else
    v3 = 2;

  return v3;
}

- (unint64_t)_numberOfLinesForPrimaryTextInFrame:(CGRect)a3
{
  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", self->_primaryTextLabel, -[NCDigestMosaicFeaturedNotificationContentView _maximumNumberOfLinesForPrimaryText](self, "_maximumNumberOfLinesForPrimaryText"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (unint64_t)_maximumNumberOfLinesForPrimarySubtitleText
{
  NSString *v2;
  unint64_t v3;

  -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  v3 = !UIContentSizeCategoryIsAccessibilityCategory(v2);

  return v3;
}

- (unint64_t)_numberOfLinesForPrimarySubtitleTextInFrame:(CGRect)a3
{
  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", self->_primarySubtitleTextLabel, -[NCDigestMosaicFeaturedNotificationContentView _maximumNumberOfLinesForPrimarySubtitleText](self, "_maximumNumberOfLinesForPrimarySubtitleText"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (unint64_t)_maximumNumberOfLinesForSecondaryText
{
  NSString *v3;
  unint64_t v4;

  -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v3))
  {
    v4 = 0;
  }
  else if (-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
  {
    if (self->_thumbnailImageView)
      v4 = 4;
    else
      v4 = 5;
  }
  else if (-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium"))
  {
    v4 = 5;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (unint64_t)_numberOfLinesForSecondaryTextInFrame:(CGRect)a3
{
  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", self->_secondaryTextLabel, -[NCDigestMosaicFeaturedNotificationContentView _maximumNumberOfLinesForSecondaryText](self, "_maximumNumberOfLinesForSecondaryText"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (unint64_t)_maximumNumberOfLinesForFooterText
{
  NSString *v2;
  unint64_t v3;

  -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  v3 = !UIContentSizeCategoryIsAccessibilityCategory(v2);

  return v3;
}

- (unint64_t)_numberOfLinesForFooterTextInFrame:(CGRect)a3
{
  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", self->_footerTextLabel, -[NCDigestMosaicFeaturedNotificationContentView _maximumNumberOfLinesForFooterText](self, "_maximumNumberOfLinesForFooterText"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_updateTextAttributes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCDigestMosaicFeaturedNotificationContentView;
  -[NCNotificationListBaseContentView _updateTextAttributes](&v3, sel__updateTextAttributes);
  -[NCDigestMosaicFeaturedNotificationContentView _updateTextAttributesForPrimaryTextLabel](self, "_updateTextAttributesForPrimaryTextLabel");
  -[NCDigestMosaicFeaturedNotificationContentView _updateTextAttributesForPrimarySubtitleTextLabel](self, "_updateTextAttributesForPrimarySubtitleTextLabel");
  -[NCDigestMosaicFeaturedNotificationContentView _updateTextAttributesForSecondaryTextElement](self, "_updateTextAttributesForSecondaryTextElement");
  -[NCDigestMosaicFeaturedNotificationContentView _updateTextAttributesForFooterTextLabel](self, "_updateTextAttributesForFooterTextLabel");
}

- (void)_updateTextAttributesForPrimaryTextLabel
{
  NSString *v3;
  id *v4;
  _BOOL4 v5;
  id v6;
  UILabel *primaryTextLabel;
  double *v8;
  _BOOL4 v9;

  if (self->_primaryTextLabel)
  {
    -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (UIContentSizeCategoryIsAccessibilityCategory(v3))
    {
      v4 = (id *)MEMORY[0x1E0DC4A88];
    }
    else if (-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
    {
      v4 = (id *)MEMORY[0x1E0DC4AA0];
    }
    else
    {
      v5 = -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium");
      v4 = (id *)MEMORY[0x1E0DC4AA0];
      if (!v5)
        v4 = (id *)MEMORY[0x1E0DC4A98];
    }
    v6 = *v4;

    primaryTextLabel = self->_primaryTextLabel;
    if (-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
    {
      v8 = (double *)MEMORY[0x1E0DC1448];
    }
    else
    {
      v9 = -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium");
      v8 = (double *)MEMORY[0x1E0DC1448];
      if (!v9)
        v8 = (double *)MEMORY[0x1E0DC1440];
    }
    -[NCNotificationListBaseContentView _updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:](self, "_updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:", primaryTextLabel, v6, 0, -[NCDigestMosaicFeaturedNotificationContentView _maximumNumberOfLinesForPrimaryText](self, "_maximumNumberOfLinesForPrimaryText"), *v8);

    self->_hasUpdatedContent = 1;
    -[NCDigestMosaicFeaturedNotificationContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTextAttributesForPrimarySubtitleTextLabel
{
  NSString *v3;
  id *v4;
  _BOOL4 v5;
  id v6;
  UILabel *primarySubtitleTextLabel;
  double *v8;
  _BOOL4 v9;

  if (self->_primarySubtitleTextLabel)
  {
    -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (UIContentSizeCategoryIsAccessibilityCategory(v3))
    {
      v4 = (id *)MEMORY[0x1E0DC4A88];
    }
    else if (-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
    {
      v4 = (id *)MEMORY[0x1E0DC4AA0];
    }
    else
    {
      v5 = -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium");
      v4 = (id *)MEMORY[0x1E0DC4AA0];
      if (!v5)
        v4 = (id *)MEMORY[0x1E0DC4A98];
    }
    v6 = *v4;

    primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
    if (-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
    {
      v8 = (double *)MEMORY[0x1E0DC1448];
    }
    else
    {
      v9 = -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium");
      v8 = (double *)MEMORY[0x1E0DC1448];
      if (!v9)
        v8 = (double *)MEMORY[0x1E0DC1440];
    }
    -[NCNotificationListBaseContentView _updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:](self, "_updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:", primarySubtitleTextLabel, v6, 0, -[NCDigestMosaicFeaturedNotificationContentView _maximumNumberOfLinesForPrimarySubtitleText](self, "_maximumNumberOfLinesForPrimarySubtitleText"), *v8);

    self->_hasUpdatedContent = 1;
    -[NCDigestMosaicFeaturedNotificationContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTextAttributesForSecondaryTextElement
{
  NSString *v3;
  id *v4;
  id v5;
  UILabel *secondaryTextLabel;
  double *v7;
  _BOOL4 v8;

  if (self->_secondaryTextLabel)
  {
    -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (UIContentSizeCategoryIsAccessibilityCategory(v3))
    {
      v4 = (id *)MEMORY[0x1E0DC4A88];
    }
    else if (-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
    {
      v4 = (id *)MEMORY[0x1E0DC4A90];
    }
    else
    {
      -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium");
      v4 = (id *)MEMORY[0x1E0DC4A98];
    }
    v5 = *v4;

    secondaryTextLabel = self->_secondaryTextLabel;
    if (-[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleLarge](self, "_isContentViewStyleLarge"))
    {
      v7 = (double *)MEMORY[0x1E0DC1448];
    }
    else
    {
      v8 = -[NCDigestMosaicFeaturedNotificationContentView _isContentViewStyleMedium](self, "_isContentViewStyleMedium");
      v7 = (double *)MEMORY[0x1E0DC1448];
      if (!v8)
        v7 = (double *)MEMORY[0x1E0DC1440];
    }
    -[NCNotificationListBaseContentView _updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:](self, "_updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:", secondaryTextLabel, v5, 0, -[NCDigestMosaicFeaturedNotificationContentView _maximumNumberOfLinesForSecondaryText](self, "_maximumNumberOfLinesForSecondaryText"), *v7);

    self->_hasUpdatedContent = 1;
    -[NCDigestMosaicFeaturedNotificationContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTextAttributesForFooterTextLabel
{
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  id *v5;
  id v6;

  if (self->_footerTextLabel)
  {
    -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);
    v5 = (id *)MEMORY[0x1E0DC4A88];
    if (!IsAccessibilityCategory)
      v5 = (id *)MEMORY[0x1E0DC4AB8];
    v6 = *v5;

    -[NCNotificationListBaseContentView _updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:](self, "_updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:", self->_footerTextLabel, v6, 0, -[NCDigestMosaicFeaturedNotificationContentView _maximumNumberOfLinesForFooterText](self, "_maximumNumberOfLinesForFooterText"), *MEMORY[0x1E0DC1440]);
    self->_hasUpdatedContent = 1;
    -[NCDigestMosaicFeaturedNotificationContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NCBadgedIconView)badgedIconView
{
  return self->_badgedIconView;
}

- (unint64_t)secondaryTextMaximumNumberOfLines
{
  return self->_secondaryTextMaximumNumberOfLines;
}

- (BOOL)screenCaptureProhibited
{
  return self->_screenCaptureProhibited;
}

- (unint64_t)contentViewStyle
{
  return self->_contentViewStyle;
}

- (double)horizontalMarginForContentOverlap
{
  return self->_horizontalMarginForContentOverlap;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundColorView, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundGradientLayer, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_badgedIconView, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
  objc_storeStrong((id *)&self->_imageBoundingView, 0);
  objc_storeStrong((id *)&self->_footerTextLabel, 0);
  objc_storeStrong((id *)&self->_secondaryTextLabel, 0);
  objc_storeStrong((id *)&self->_primarySubtitleTextLabel, 0);
  objc_storeStrong((id *)&self->_primaryTextLabel, 0);
  objc_storeStrong((id *)&self->_crossfadingContentView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
}

@end
