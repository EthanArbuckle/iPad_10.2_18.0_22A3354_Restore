@implementation NCNotificationRichContentView

- (NCNotificationRichContentView)initWithFrame:(CGRect)a3
{
  NCNotificationRichContentView *v3;
  NCNotificationRichContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationRichContentView;
  v3 = -[NCNotificationListBaseContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_attachmentImageFeatured = 0;
    -[NCNotificationRichContentView _setContinuousCornerRadius:](v3, "_setContinuousCornerRadius:", 23.5);
  }
  return v4;
}

- (void)setAttachmentImageFeatured:(BOOL)a3
{
  if (self->_attachmentImageFeatured != a3)
  {
    self->_attachmentImageFeatured = a3;
    -[NCNotificationRichContentView setClipsToBounds:](self, "setClipsToBounds:");
    -[NCNotificationRichContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationRichContentView;
  -[NCNotificationRichContentView layoutSubviews](&v3, sel_layoutSubviews);
  -[NCNotificationRichContentView bounds](self, "bounds");
  if (CGRectGetWidth(v4) > 0.0)
  {
    -[NCNotificationRichContentView _layoutSubviews](self, "_layoutSubviews");
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
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UILabel *primaryTextLabel;
  UILabel *primarySubtitleTextLabel;
  UILabel *secondaryTextLabel;
  UILabel *footerTextLabel;
  BSUIDateLabel *dateLabel;
  double v19;
  double v20;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[NCNotificationRichContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:", 0.0, 0.0, a3.width, a3.height);
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  primaryTextLabel = self->_primaryTextLabel;
  if (primaryTextLabel)
    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", primaryTextLabel, -[NCNotificationRichContentView _numberOfLinesForPrimaryTextInFrame:](self, "_numberOfLinesForPrimaryTextInFrame:", v6, v7, v8, v9));
  primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
  if (primarySubtitleTextLabel)
    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", primarySubtitleTextLabel, -[NCNotificationRichContentView _numberOfLinesForPrimarySubtitleTextInFrame:](self, "_numberOfLinesForPrimarySubtitleTextInFrame:", v10, v11, v12, v13));
  secondaryTextLabel = self->_secondaryTextLabel;
  if (secondaryTextLabel)
    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", secondaryTextLabel, -[NCNotificationRichContentView _numberOfLinesForSecondaryTextInFrame:](self, "_numberOfLinesForSecondaryTextInFrame:", v10, v11, v12, v13));
  footerTextLabel = self->_footerTextLabel;
  if (footerTextLabel)
    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", footerTextLabel, -[NCNotificationRichContentView _numberOfLinesForFooterTextInFrame:](self, "_numberOfLinesForFooterTextInFrame:", v10, v11, v12, v13));
  dateLabel = self->_dateLabel;
  if (dateLabel)
  {
    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", dateLabel, 1, 0.0);
    -[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured");
  }
  if (self->_badgedIconView)
  {
    if (!-[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured"))
    {
      -[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured");
      if (!-[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured"))
      {
        -[NCNotificationRichContentView badgedIconView](self, "badgedIconView");

      }
    }
  }
  if (-[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured")
    && self->_imageBoundingView
    && self->_thumbnailImageView)
  {
    -[NCNotificationRichContentView _featuredImageHeightForBounds:](self, "_featuredImageHeightForBounds:", 0.0, 0.0, width, height);
  }
  UISizeRoundToScale();
  result.height = v20;
  result.width = v19;
  return result;
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
  UILabel *v10;
  void *v11;
  UILabel *v12;
  id v13;

  v13 = a3;
  -[NCNotificationRichContentView primaryText](self, "primaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  v6 = v13;
  if ((v5 & 1) == 0)
  {
    primaryTextLabel = self->_primaryTextLabel;
    if (v13)
    {
      if (!primaryTextLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v9 = self->_primaryTextLabel;
        self->_primaryTextLabel = v8;

        -[UILabel setLineBreakMode:](self->_primaryTextLabel, "setLineBreakMode:", 4);
        -[NCNotificationRichContentView _configureCrossfadingContentViewIfNecessary](self, "_configureCrossfadingContentViewIfNecessary");
        -[UIView addSubview:](self->_crossfadingContentView, "addSubview:", self->_primaryTextLabel);
        -[NCNotificationRichContentView _updateTextAttributesForPrimaryTextLabel](self, "_updateTextAttributesForPrimaryTextLabel");
        v10 = self->_primaryTextLabel;
        -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v10, 0, v11, 0);

        v6 = v13;
        primaryTextLabel = self->_primaryTextLabel;
      }
      -[UILabel setText:](primaryTextLabel, "setText:", v6);
    }
    else
    {
      -[UILabel removeFromSuperview](primaryTextLabel, "removeFromSuperview");
      v12 = self->_primaryTextLabel;
      self->_primaryTextLabel = 0;

    }
    self->_hasUpdatedContent = 1;
    -[NCNotificationRichContentView setNeedsLayout](self, "setNeedsLayout");
    v6 = v13;
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
  UILabel *v10;
  void *v11;
  UILabel *v12;
  id v13;

  v13 = a3;
  -[NCNotificationRichContentView primarySubtitleText](self, "primarySubtitleText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  v6 = v13;
  if ((v5 & 1) == 0)
  {
    primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
    if (v13)
    {
      if (!primarySubtitleTextLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v9 = self->_primarySubtitleTextLabel;
        self->_primarySubtitleTextLabel = v8;

        -[UILabel setLineBreakMode:](self->_primarySubtitleTextLabel, "setLineBreakMode:", 4);
        -[NCNotificationRichContentView _configureCrossfadingContentViewIfNecessary](self, "_configureCrossfadingContentViewIfNecessary");
        -[UIView addSubview:](self->_crossfadingContentView, "addSubview:", self->_primarySubtitleTextLabel);
        -[NCNotificationRichContentView _updateTextAttributesForPrimarySubtitleTextLabel](self, "_updateTextAttributesForPrimarySubtitleTextLabel");
        v10 = self->_primarySubtitleTextLabel;
        -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v10, 0, v11, 0);

        v6 = v13;
        primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
      }
      -[UILabel setText:](primarySubtitleTextLabel, "setText:", v6);
    }
    else
    {
      -[UILabel removeFromSuperview](primarySubtitleTextLabel, "removeFromSuperview");
      v12 = self->_primarySubtitleTextLabel;
      self->_primarySubtitleTextLabel = 0;

    }
    self->_hasUpdatedContent = 1;
    -[NCNotificationRichContentView setNeedsLayout](self, "setNeedsLayout");
    v6 = v13;
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
  -[NCNotificationRichContentView secondaryText](self, "secondaryText");
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
        -[NCNotificationRichContentView _configureCrossfadingContentViewIfNecessary](self, "_configureCrossfadingContentViewIfNecessary");
        -[UIView addSubview:](self->_crossfadingContentView, "addSubview:", self->_secondaryTextLabel);
        -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_secondaryTextLabel, 0, v10, 0);
        if (v10)
          objc_msgSend(v10, "automaticallyUpdateView:withStyle:", self->_secondaryTextLabel, 0);

        secondaryTextLabel = self->_secondaryTextLabel;
      }
      -[UILabel textColor](secondaryTextLabel, "textColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setAttributedText:](self->_secondaryTextLabel, "setAttributedText:", v12);
      -[UILabel setTextColor:](self->_secondaryTextLabel, "setTextColor:", v11);
      -[NCNotificationRichContentView _updateTextAttributesForSecondaryTextElement](self, "_updateTextAttributesForSecondaryTextElement");
    }
    else
    {
      -[UILabel removeFromSuperview](secondaryTextLabel, "removeFromSuperview");
      v11 = self->_secondaryTextLabel;
      self->_secondaryTextLabel = 0;
    }

    self->_hasUpdatedContent = 1;
    -[NCNotificationRichContentView setNeedsLayout](self, "setNeedsLayout");
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
  UILabel *v10;
  void *v11;
  UILabel *v12;
  id v13;

  v13 = a3;
  -[NCNotificationRichContentView footerText](self, "footerText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  v6 = v13;
  if ((v5 & 1) == 0)
  {
    footerTextLabel = self->_footerTextLabel;
    if (v13)
    {
      if (!footerTextLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v9 = self->_footerTextLabel;
        self->_footerTextLabel = v8;

        -[UILabel setLineBreakMode:](self->_footerTextLabel, "setLineBreakMode:", 4);
        -[UIView addSubview:](self->_crossfadingContentView, "addSubview:", self->_footerTextLabel);
        -[NCNotificationRichContentView _updateTextAttributesForFooterTextLabel](self, "_updateTextAttributesForFooterTextLabel");
        v10 = self->_footerTextLabel;
        -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v10, 1, v11, 0);

        v6 = v13;
        footerTextLabel = self->_footerTextLabel;
      }
      -[UILabel setText:](footerTextLabel, "setText:", v6);
    }
    else
    {
      -[UILabel removeFromSuperview](footerTextLabel, "removeFromSuperview");
      v12 = self->_footerTextLabel;
      self->_footerTextLabel = 0;

    }
    self->_hasUpdatedContent = 1;
    -[NCNotificationRichContentView setNeedsLayout](self, "setNeedsLayout");
    v6 = v13;
  }

}

- (void)setSecondaryTextMaximumNumberOfLines:(unint64_t)a3
{
  void *v4;
  uint64_t v5;

  if (self->_secondaryTextMaximumNumberOfLines != a3)
  {
    self->_secondaryTextMaximumNumberOfLines = a3;
    -[NCNotificationRichContentView secondaryText](self, "secondaryText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5)
    {
      self->_hasUpdatedContent = 1;
      -[NCNotificationRichContentView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  if (self->_screenCaptureProhibited != a3)
  {
    self->_screenCaptureProhibited = a3;
    -[NCNotificationRichContentView nc_setScreenCaptureProhibited:](self, "nc_setScreenCaptureProhibited:");
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
  UIImageView *v10;
  _BOOL4 v11;
  double v12;
  UIView *imageBoundingView;
  id v14;
  UIView *v15;
  UIView *v16;
  void *v17;
  UIImageView *v18;
  id v19;

  v19 = a3;
  -[NCNotificationRichContentView thumbnail](self, "thumbnail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  v6 = v19;
  if ((v5 & 1) == 0)
  {
    thumbnailImageView = self->_thumbnailImageView;
    if (v19)
    {
      if (!thumbnailImageView)
      {
        v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
        v9 = self->_thumbnailImageView;
        self->_thumbnailImageView = v8;

        -[UIImageView setContentMode:](self->_thumbnailImageView, "setContentMode:", 2);
        v10 = self->_thumbnailImageView;
        v11 = -[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured");
        v12 = 14.0;
        if (v11)
          v12 = 0.0;
        -[UIImageView _setContinuousCornerRadius:](v10, "_setContinuousCornerRadius:", v12);
        -[UIImageView setClipsToBounds:](self->_thumbnailImageView, "setClipsToBounds:", 1);
        imageBoundingView = self->_imageBoundingView;
        if (!imageBoundingView)
        {
          v14 = objc_alloc(MEMORY[0x1E0DC3F10]);
          v15 = (UIView *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
          v16 = self->_imageBoundingView;
          self->_imageBoundingView = v15;

          -[NCNotificationRichContentView _configureCrossfadingContentViewIfNecessary](self, "_configureCrossfadingContentViewIfNecessary");
          -[UIView addSubview:](self->_crossfadingContentView, "addSubview:", self->_imageBoundingView);
          imageBoundingView = self->_imageBoundingView;
        }
        -[UIView addSubview:](imageBoundingView, "addSubview:", self->_thumbnailImageView);
        thumbnailImageView = self->_thumbnailImageView;
        v6 = v19;
      }
      -[UIImageView setImage:](thumbnailImageView, "setImage:", v6);
      -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationListBaseContentView _updateVisualStylingOfImageView:ifSymbolImageWithStyle:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfImageView:ifSymbolImageWithStyle:visualStylingProvider:outgoingProvider:", self->_thumbnailImageView, 0, v17, v17);
    }
    else
    {
      -[UIImageView removeFromSuperview](thumbnailImageView, "removeFromSuperview");
      v18 = self->_thumbnailImageView;
      self->_thumbnailImageView = 0;

      -[UIView removeFromSuperview](self->_imageBoundingView, "removeFromSuperview");
      v17 = self->_imageBoundingView;
      self->_imageBoundingView = 0;
    }

    self->_hasUpdatedContent = 1;
    -[NCNotificationRichContentView setNeedsLayout](self, "setNeedsLayout");
    v6 = v19;
  }

}

- (void)setBadgedIconView:(id)a3
{
  NCBadgedIconView **p_badgedIconView;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_badgedIconView = &self->_badgedIconView;
  v6 = BSEqualObjects();
  v7 = v9;
  if ((v6 & 1) == 0)
  {
    -[NCBadgedIconView removeFromSuperview](*p_badgedIconView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_badgedIconView, a3);
    if (*p_badgedIconView)
    {
      -[NCNotificationRichContentView addSubview:](self, "addSubview:");
      -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCBadgedIconView updateVisualStylingOfProminentImageViewIfSymbolImageWithStyle:visualStylingProvider:outgoingProvider:](*p_badgedIconView, "updateVisualStylingOfProminentImageViewIfSymbolImageWithStyle:visualStylingProvider:outgoingProvider:", 0, v8, v8);

    }
    -[NCNotificationRichContentView setNeedsLayout](self, "setNeedsLayout");
    v7 = v9;
  }

}

- (void)setDate:(id)a3
{
  NSDate *v4;
  NSDate *date;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSDate *)objc_msgSend(v6, "copy");
    date = self->_date;
    self->_date = v4;

    -[NCNotificationRichContentView _tearDownDateLabel](self, "_tearDownDateLabel");
    -[NCNotificationRichContentView _configureDateLabelIfNecessary](self, "_configureDateLabelIfNecessary");
    -[NCNotificationRichContentView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setDateAllDay:(BOOL)a3
{
  if (self->_dateAllDay != a3)
  {
    self->_dateAllDay = a3;
    -[NCNotificationRichContentView _tearDownDateLabel](self, "_tearDownDateLabel");
    -[NCNotificationRichContentView _configureDateLabelIfNecessary](self, "_configureDateLabelIfNecessary");
    -[NCNotificationRichContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDateFormatStyle:(int64_t)a3
{
  if (self->_dateFormatStyle != a3)
  {
    self->_dateFormatStyle = a3;
    -[NCNotificationRichContentView _tearDownDateLabel](self, "_tearDownDateLabel");
    -[NCNotificationRichContentView _configureDateLabelIfNecessary](self, "_configureDateLabelIfNecessary");
    -[NCNotificationRichContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHideDate:(BOOL)a3
{
  if (self->_hideDate != a3)
  {
    self->_hideDate = a3;
    -[NCNotificationRichContentView _tearDownDateLabel](self, "_tearDownDateLabel");
    -[NCNotificationRichContentView _configureDateLabelIfNecessary](self, "_configureDateLabelIfNecessary");
    -[NCNotificationRichContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTimeZone:(id)a3
{
  NSTimeZone *v4;
  NSTimeZone *timeZone;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSTimeZone *)objc_msgSend(v6, "copy");
    timeZone = self->_timeZone;
    self->_timeZone = v4;

    -[NCNotificationRichContentView _tearDownDateLabel](self, "_tearDownDateLabel");
    -[NCNotificationRichContentView _configureDateLabelIfNecessary](self, "_configureDateLabelIfNecessary");
    -[NCNotificationRichContentView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_layoutSubviews
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__NCNotificationRichContentView__layoutSubviews__block_invoke;
  v2[3] = &unk_1E8D1B568;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

uint64_t __48__NCNotificationRichContentView__layoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_layoutImageBoundingView");
  objc_msgSend(*(id *)(a1 + 32), "_layoutThumbnailImageView");
  objc_msgSend(*(id *)(a1 + 32), "_layoutBadgedIconView");
  objc_msgSend(*(id *)(a1 + 32), "_layoutPrimaryTextLabel");
  objc_msgSend(*(id *)(a1 + 32), "_layoutPrimarySubtitleTextLabel");
  objc_msgSend(*(id *)(a1 + 32), "_layoutSecondaryTextLabel");
  objc_msgSend(*(id *)(a1 + 32), "_layoutFooterTextLabel");
  return objc_msgSend(*(id *)(a1 + 32), "_layoutDateLabel");
}

- (void)_layoutImageBoundingView
{
  UIView *imageBoundingView;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect v14;

  imageBoundingView = self->_imageBoundingView;
  if (!imageBoundingView)
    return;
  -[UIView frame](imageBoundingView, "frame");
  -[NCNotificationRichContentView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (-[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured"))
  {
    v13.origin.x = v5;
    v13.origin.y = v7;
    v13.size.width = v9;
    v13.size.height = v11;
    CGRectGetWidth(v13);
    if (self->_thumbnailImageView)
      -[NCNotificationRichContentView _featuredImageHeightForBounds:](self, "_featuredImageHeightForBounds:", v5, v7, v9, v11);
    if (!-[NCNotificationRichContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))goto LABEL_12;
  }
  else if ((-[NCNotificationRichContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") & 1) != 0)
  {
    goto LABEL_12;
  }
  v14.origin.x = v5;
  v14.origin.y = v7;
  v14.size.width = v9;
  v14.size.height = v11;
  CGRectGetMaxX(v14);
LABEL_12:
  UIRectIntegralWithScale();
  -[UIView setFrame:](self->_imageBoundingView, "setFrame:");
  v12 = 1.0;
  if (!self->_thumbnailImageView)
    v12 = 0.0;
  -[UIView setAlpha:](self->_imageBoundingView, "setAlpha:", v12);
}

- (void)_layoutThumbnailImageView
{
  UIImageView *thumbnailImageView;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIImageView *v12;
  _BOOL4 v13;
  double v14;

  thumbnailImageView = self->_thumbnailImageView;
  if (thumbnailImageView)
  {
    -[UIImageView frame](thumbnailImageView, "frame");
    -[UIView bounds](self->_imageBoundingView, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v12 = self->_thumbnailImageView;
    v13 = -[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured");
    v14 = 14.0;
    if (v13)
      v14 = 0.0;
    -[UIImageView _setContinuousCornerRadius:](v12, "_setContinuousCornerRadius:", v14);
    -[UIImageView setFrame:](self->_thumbnailImageView, "setFrame:", v5, v7, v9, v11);
  }
}

- (void)_layoutBadgedIconView
{
  void *v2;
  NCBadgedIconView *badgedIconView;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  BOOL v13;
  CGRect v14;

  badgedIconView = self->_badgedIconView;
  if (badgedIconView)
  {
    -[NCBadgedIconView frame](badgedIconView, "frame");
    -[NCNotificationRichContentView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = -[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured");
    if (!v13)
    {
      -[NCNotificationRichContentView badgedIconView](self, "badgedIconView");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (!-[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured"))
    {
      -[NCNotificationRichContentView badgedIconView](self, "badgedIconView");

    }
    if (!v13)

    if (-[NCNotificationRichContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      v14.origin.x = v6;
      v14.origin.y = v8;
      v14.size.width = v10;
      v14.size.height = v12;
      CGRectGetWidth(v14);
    }
    -[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured");
    -[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured");
    UIRectIntegralWithScale();
    -[NCBadgedIconView setFrame:](self->_badgedIconView, "setFrame:");
    -[NCNotificationRichContentView bringSubviewToFront:](self, "bringSubviewToFront:", self->_badgedIconView);
  }
}

- (void)_layoutPrimaryTextLabel
{
  UILabel *primaryTextLabel;
  double x;
  double y;
  double width;
  double height;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  primaryTextLabel = self->_primaryTextLabel;
  if (primaryTextLabel)
  {
    -[UILabel frame](primaryTextLabel, "frame");
    -[NCNotificationRichContentView bounds](self, "bounds");
    -[NCNotificationRichContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:");
    x = v16.origin.x;
    y = v16.origin.y;
    width = v16.size.width;
    height = v16.size.height;
    v8 = CGRectGetWidth(v16);
    -[UILabel unui_measuringHeightWithNumberOfLines:](self->_primaryTextLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationRichContentView _numberOfLinesForPrimaryTextInFrame:](self, "_numberOfLinesForPrimaryTextInFrame:", x, y, width, height));
    v10 = v9;
    v11 = 13.0;
    if (self->_thumbnailImageView
      && -[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured"))
    {
      -[UIView frame](self->_imageBoundingView, "frame");
      v11 = CGRectGetMaxY(v17) + 8.0;
    }
    if (-[NCNotificationRichContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      -[NCNotificationRichContentView bounds](self, "bounds");
      v12 = CGRectGetMaxX(v18) - v8;
      -[NCNotificationRichContentView _labelLayoutHorizontalMargin](self, "_labelLayoutHorizontalMargin");
      v14 = v12 - v13;
    }
    else
    {
      -[NCNotificationRichContentView _labelLayoutHorizontalMargin](self, "_labelLayoutHorizontalMargin");
      v14 = v15;
    }
    -[UILabel unui_drawingHeightWithNumberOfLines:](self->_primaryTextLabel, "unui_drawingHeightWithNumberOfLines:", -[NCNotificationRichContentView _numberOfLinesForPrimaryTextInFrame:](self, "_numberOfLinesForPrimaryTextInFrame:", x, y, width, height));
    v19.origin.x = v14;
    v19.origin.y = v11;
    v19.size.width = v8;
    v19.size.height = v10;
    CGRectGetWidth(v19);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    -[UILabel setFrame:](self->_primaryTextLabel, "setFrame:");
  }
}

- (void)_layoutPrimarySubtitleTextLabel
{
  UILabel *primarySubtitleTextLabel;
  double x;
  double y;
  double width;
  double height;
  double v8;
  double v9;
  CGFloat v10;
  UILabel *primaryTextLabel;
  uint64_t v12;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
  if (!primarySubtitleTextLabel)
    return;
  -[UILabel frame](primarySubtitleTextLabel, "frame");
  -[NCNotificationRichContentView bounds](self, "bounds");
  -[NCNotificationRichContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:");
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  v8 = CGRectGetWidth(v22);
  -[UILabel unui_measuringHeightWithNumberOfLines:](self->_primarySubtitleTextLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationRichContentView _numberOfLinesForPrimarySubtitleTextInFrame:](self, "_numberOfLinesForPrimarySubtitleTextInFrame:", x, y, width, height));
  v10 = v9;
  primaryTextLabel = self->_primaryTextLabel;
  if (primaryTextLabel)
  {
    -[UILabel frame](primaryTextLabel, "frame");
    v16 = 1.0;
LABEL_4:
    v17 = CGRectGetMaxY(*(CGRect *)&v12) + v16;
    goto LABEL_5;
  }
  v17 = 13.0;
  if (self->_thumbnailImageView
    && -[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured"))
  {
    -[UIView frame](self->_imageBoundingView, "frame");
    v16 = 8.0;
    goto LABEL_4;
  }
LABEL_5:
  if (-[NCNotificationRichContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    -[NCNotificationRichContentView bounds](self, "bounds");
    v18 = CGRectGetMaxX(v23) - v8;
    -[NCNotificationRichContentView _labelLayoutHorizontalMargin](self, "_labelLayoutHorizontalMargin");
    v20 = v18 - v19;
  }
  else
  {
    -[NCNotificationRichContentView _labelLayoutHorizontalMargin](self, "_labelLayoutHorizontalMargin");
    v20 = v21;
  }
  -[UILabel unui_drawingHeightWithNumberOfLines:](self->_primarySubtitleTextLabel, "unui_drawingHeightWithNumberOfLines:", -[NCNotificationRichContentView _numberOfLinesForPrimarySubtitleTextInFrame:](self, "_numberOfLinesForPrimarySubtitleTextInFrame:", x, y, width, height));
  v24.origin.x = v20;
  v24.origin.y = v17;
  v24.size.width = v8;
  v24.size.height = v10;
  CGRectGetWidth(v24);
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  -[UILabel setFrame:](self->_primarySubtitleTextLabel, "setFrame:");
}

- (void)_layoutSecondaryTextLabel
{
  UILabel *secondaryTextLabel;
  double x;
  double y;
  double width;
  double height;
  double v8;
  double v9;
  CGFloat v10;
  UILabel *primarySubtitleTextLabel;
  uint64_t v12;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  secondaryTextLabel = self->_secondaryTextLabel;
  if (!secondaryTextLabel)
    return;
  -[UILabel frame](secondaryTextLabel, "frame");
  -[NCNotificationRichContentView bounds](self, "bounds");
  -[NCNotificationRichContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:");
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  v8 = CGRectGetWidth(v22);
  -[UILabel unui_measuringHeightWithNumberOfLines:](self->_secondaryTextLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationRichContentView _numberOfLinesForSecondaryTextInFrame:](self, "_numberOfLinesForSecondaryTextInFrame:", x, y, width, height));
  v10 = v9;
  primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
  if (primarySubtitleTextLabel || (primarySubtitleTextLabel = self->_primaryTextLabel) != 0)
  {
    -[UILabel frame](primarySubtitleTextLabel, "frame");
    v16 = 1.0;
LABEL_5:
    v17 = CGRectGetMaxY(*(CGRect *)&v12) + v16;
    goto LABEL_6;
  }
  v17 = 13.0;
  if (self->_thumbnailImageView
    && -[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured"))
  {
    -[UIView frame](self->_imageBoundingView, "frame");
    v16 = 8.0;
    goto LABEL_5;
  }
LABEL_6:
  if (-[NCNotificationRichContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    -[NCNotificationRichContentView bounds](self, "bounds");
    v18 = CGRectGetMaxX(v23) - v8;
    -[NCNotificationRichContentView _labelLayoutHorizontalMargin](self, "_labelLayoutHorizontalMargin");
    v20 = v18 - v19;
  }
  else
  {
    -[NCNotificationRichContentView _labelLayoutHorizontalMargin](self, "_labelLayoutHorizontalMargin");
    v20 = v21;
  }
  -[UILabel unui_drawingHeightWithNumberOfLines:](self->_secondaryTextLabel, "unui_drawingHeightWithNumberOfLines:", -[NCNotificationRichContentView _numberOfLinesForSecondaryTextInFrame:](self, "_numberOfLinesForSecondaryTextInFrame:", x, y, width, height));
  v24.origin.x = v20;
  v24.origin.y = v17;
  v24.size.width = v8;
  v24.size.height = v10;
  CGRectGetWidth(v24);
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  -[UILabel setFrame:](self->_secondaryTextLabel, "setFrame:");
}

- (void)_layoutFooterTextLabel
{
  UILabel *footerTextLabel;
  double x;
  double y;
  double width;
  double height;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat MaxY;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  footerTextLabel = self->_footerTextLabel;
  if (footerTextLabel)
  {
    -[UILabel frame](footerTextLabel, "frame");
    -[NCNotificationRichContentView bounds](self, "bounds");
    -[NCNotificationRichContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:");
    x = v16.origin.x;
    y = v16.origin.y;
    width = v16.size.width;
    height = v16.size.height;
    v8 = CGRectGetWidth(v16);
    -[UILabel unui_measuringHeightWithNumberOfLines:](self->_footerTextLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationRichContentView _numberOfLinesForFooterTextInFrame:](self, "_numberOfLinesForFooterTextInFrame:", x, y, width, height));
    v10 = v9;
    -[UILabel frame](self->_secondaryTextLabel, "frame");
    MaxY = CGRectGetMaxY(v17);
    if (-[NCNotificationRichContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      -[NCNotificationRichContentView bounds](self, "bounds");
      v12 = CGRectGetMaxX(v18) - v8;
      -[NCNotificationRichContentView _labelLayoutHorizontalMargin](self, "_labelLayoutHorizontalMargin");
      v14 = v12 - v13;
    }
    else
    {
      -[NCNotificationRichContentView _labelLayoutHorizontalMargin](self, "_labelLayoutHorizontalMargin");
      v14 = v15;
    }
    -[UILabel unui_drawingHeightWithNumberOfLines:](self->_footerTextLabel, "unui_drawingHeightWithNumberOfLines:", -[NCNotificationRichContentView _numberOfLinesForFooterTextInFrame:](self, "_numberOfLinesForFooterTextInFrame:", x, y, width, height));
    v19.origin.x = v14;
    v19.origin.y = MaxY;
    v19.size.width = v8;
    v19.size.height = v10;
    CGRectGetWidth(v19);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    -[UILabel setFrame:](self->_footerTextLabel, "setFrame:");
  }
}

- (void)_layoutDateLabel
{
  BSUIDateLabel *dateLabel;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double x;
  double y;
  double width;
  double height;
  BOOL v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UILabel *footerTextLabel;
  double MaxY;
  _BOOL4 v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  dateLabel = self->_dateLabel;
  if (dateLabel)
  {
    -[BSUIDateLabel frame](dateLabel, "frame");
    -[NCNotificationRichContentView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    if (-[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured"))
      v12 = 12.0;
    else
      v12 = 14.0;
    v36.origin.x = v5;
    v36.origin.y = v7;
    v36.size.width = v9;
    v36.size.height = v11;
    v37 = CGRectInset(v36, v12, 0.0);
    x = v37.origin.x;
    y = v37.origin.y;
    width = v37.size.width;
    height = v37.size.height;
    v17 = -[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured");
    v18 = height;
    v19 = width;
    v20 = y;
    v21 = x;
    if (!v17)
      -[NCNotificationRichContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:", x, y, width, height);
    v22 = CGRectGetWidth(*(CGRect *)&v21);
    -[BSUIDateLabel unui_measuringHeightWithNumberOfLines:](self->_dateLabel, "unui_measuringHeightWithNumberOfLines:", 1);
    v24 = v23;
    footerTextLabel = self->_footerTextLabel;
    if (!footerTextLabel)
      footerTextLabel = self->_secondaryTextLabel;
    -[UILabel frame](footerTextLabel, "frame");
    MaxY = CGRectGetMaxY(v38);
    v27 = -[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured");
    v28 = 1.0;
    if (v27)
      v28 = 2.0;
    v29 = MaxY + v28;
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    v30 = CGRectGetMaxY(v39) - v24 + -12.0;
    if (v29 >= v30)
      v31 = v29;
    else
      v31 = v30;
    if (-[NCNotificationRichContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      -[NCNotificationRichContentView bounds](self, "bounds");
      v32 = CGRectGetMaxX(v40) - v22;
      -[NCNotificationRichContentView _labelLayoutHorizontalMargin](self, "_labelLayoutHorizontalMargin");
      v34 = v32 - v33;
    }
    else
    {
      -[NCNotificationRichContentView _labelLayoutHorizontalMargin](self, "_labelLayoutHorizontalMargin");
      v34 = v35;
    }
    -[BSUIDateLabel unui_drawingHeightWithNumberOfLines:](self->_dateLabel, "unui_drawingHeightWithNumberOfLines:", 1);
    v41.origin.x = v34;
    v41.origin.y = v31;
    v41.size.width = v22;
    v41.size.height = v24;
    CGRectGetWidth(v41);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    -[BSUIDateLabel setFrame:](self->_dateLabel, "setFrame:");
  }
}

- (void)dateLabelDidChange:(id)a3
{
  -[BSUIDateLabel sizeToFit](self->_dateLabel, "sizeToFit", a3);
  -[NCNotificationRichContentView setNeedsLayout](self, "setNeedsLayout");
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

- (void)_configureCrossfadingContentViewIfNecessary
{
  id v3;
  UIView *v4;
  UIView *crossfadingContentView;

  if (!self->_crossfadingContentView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NCNotificationRichContentView bounds](self, "bounds");
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    crossfadingContentView = self->_crossfadingContentView;
    self->_crossfadingContentView = v4;

    -[NCNotificationRichContentView addSubview:](self, "addSubview:", self->_crossfadingContentView);
    -[UIView setAutoresizingMask:](self->_crossfadingContentView, "setAutoresizingMask:", 18);
  }
}

- (double)_featuredImageHeightForBounds:(CGRect)a3
{
  void *v4;
  double v5;
  double v6;

  CGRectGetWidth(a3);
  -[NCNotificationRichContentView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  UICeilToScale();
  v6 = v5;

  return v6;
}

- (CGRect)_labelSizingBoundsForRect:(CGRect)a3
{
  void *v3;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  _BOOL4 v18;
  double v19;
  CGRect v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = CGRectGetWidth(a3);
  if (self->_thumbnailImageView
    && !-[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured"))
  {
    v10 = 98.0;
  }
  else if (-[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured"))
  {
    v10 = 12.0;
  }
  else
  {
    v10 = 14.0;
  }
  if (self->_badgedIconView
    && !-[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured"))
  {
    v16 = -[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured");
    if (v16)
    {
      v17 = 20.0;
    }
    else
    {
      -[NCNotificationRichContentView badgedIconView](self, "badgedIconView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
        v17 = 38.0;
      else
        v17 = 56.0;
    }
    v18 = -[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured");
    v19 = 10.0;
    if (!v18)
      v19 = 12.0;
    v11 = v17 + v19 + 12.0;
    if (!v16)

  }
  else if (-[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured"))
  {
    v11 = 12.0;
  }
  else
  {
    v11 = 14.0;
  }
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v12 = CGRectGetHeight(v20);
  v13 = 0.0;
  v14 = 0.0;
  v15 = v9 - v10 - v11;
  result.size.height = v12;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (double)_labelLayoutHorizontalMargin
{
  double v3;
  double v5;
  void *v6;
  double v7;

  if (self->_badgedIconView
    && !-[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured"))
  {
    if (-[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured"))
      v5 = 22.0;
    else
      v5 = 24.0;
    if (-[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured"))
    {
      return v5 + 20.0;
    }
    else
    {
      -[NCNotificationRichContentView badgedIconView](self, "badgedIconView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 38.0;
      if (!v6)
        v7 = 56.0;
      v3 = v5 + v7;

    }
  }
  else if (-[NCNotificationRichContentView isAttachmentImageFeatured](self, "isAttachmentImageFeatured"))
  {
    return 12.0;
  }
  else
  {
    return 14.0;
  }
  return v3;
}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  id v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NCNotificationRichContentView;
  v8 = a5;
  v9 = a3;
  -[NCNotificationListBaseContentView _visualStylingProviderDidChange:forCategory:outgoingProvider:](&v10, sel__visualStylingProviderDidChange_forCategory_outgoingProvider_, v9, a4, v8);
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_primaryTextLabel, 0, v9, v8, v10.receiver, v10.super_class);
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_primarySubtitleTextLabel, 0, v9, v8);
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_secondaryTextLabel, 0, v9, v8);
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_footerTextLabel, 1, v9, v8);
  -[NCNotificationListBaseContentView _updateVisualStylingOfImageView:ifSymbolImageWithStyle:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfImageView:ifSymbolImageWithStyle:visualStylingProvider:outgoingProvider:", self->_thumbnailImageView, 0, v9, v8);
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_dateLabel, 1, v9, v8);

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
  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", self->_primaryTextLabel, -[NCNotificationRichContentView _maximumNumberOfLinesForPrimaryText](self, "_maximumNumberOfLinesForPrimaryText"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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
  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", self->_primarySubtitleTextLabel, -[NCNotificationRichContentView _maximumNumberOfLinesForPrimarySubtitleText](self, "_maximumNumberOfLinesForPrimarySubtitleText"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (unint64_t)_maximumNumberOfLinesForSecondaryText
{
  NSString *v3;
  unint64_t secondaryTextMaximumNumberOfLines;

  -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v3))
    secondaryTextMaximumNumberOfLines = 0;
  else
    secondaryTextMaximumNumberOfLines = self->_secondaryTextMaximumNumberOfLines;

  return secondaryTextMaximumNumberOfLines;
}

- (unint64_t)_numberOfLinesForSecondaryTextInFrame:(CGRect)a3
{
  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", self->_secondaryTextLabel, -[NCNotificationRichContentView _maximumNumberOfLinesForSecondaryText](self, "_maximumNumberOfLinesForSecondaryText"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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
  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", self->_footerTextLabel, -[NCNotificationRichContentView _maximumNumberOfLinesForFooterText](self, "_maximumNumberOfLinesForFooterText"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_updateTextAttributes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationRichContentView;
  -[NCNotificationListBaseContentView _updateTextAttributes](&v3, sel__updateTextAttributes);
  -[NCNotificationRichContentView _updateTextAttributesForPrimaryTextLabel](self, "_updateTextAttributesForPrimaryTextLabel");
  -[NCNotificationRichContentView _updateTextAttributesForPrimarySubtitleTextLabel](self, "_updateTextAttributesForPrimarySubtitleTextLabel");
  -[NCNotificationRichContentView _updateTextAttributesForSecondaryTextElement](self, "_updateTextAttributesForSecondaryTextElement");
  -[NCNotificationRichContentView _updateTextAttributesForFooterTextLabel](self, "_updateTextAttributesForFooterTextLabel");
  -[NCNotificationRichContentView _updateTextAttributesForDateLabel](self, "_updateTextAttributesForDateLabel");
}

- (void)_updateTextAttributesForPrimaryTextLabel
{
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  id *v5;
  id v6;

  if (self->_primaryTextLabel)
  {
    -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);
    v5 = (id *)MEMORY[0x1E0DC4A88];
    if (!IsAccessibilityCategory)
      v5 = (id *)MEMORY[0x1E0DC4B10];
    v6 = *v5;

    -[NCNotificationListBaseContentView _updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:](self, "_updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:", self->_primaryTextLabel, v6, 0, -[NCNotificationRichContentView _maximumNumberOfLinesForPrimaryText](self, "_maximumNumberOfLinesForPrimaryText"), *MEMORY[0x1E0DC1448]);
    self->_hasUpdatedContent = 1;
    -[NCNotificationRichContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTextAttributesForPrimarySubtitleTextLabel
{
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  id *v5;
  id v6;

  if (self->_primarySubtitleTextLabel)
  {
    -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);
    v5 = (id *)MEMORY[0x1E0DC4A88];
    if (!IsAccessibilityCategory)
      v5 = (id *)MEMORY[0x1E0DC4B10];
    v6 = *v5;

    -[NCNotificationListBaseContentView _updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:](self, "_updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:", self->_primarySubtitleTextLabel, v6, 0, -[NCNotificationRichContentView _maximumNumberOfLinesForPrimarySubtitleText](self, "_maximumNumberOfLinesForPrimarySubtitleText"), *MEMORY[0x1E0DC1448]);
    self->_hasUpdatedContent = 1;
    -[NCNotificationRichContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTextAttributesForSecondaryTextElement
{
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  id *v5;
  id v6;

  if (self->_secondaryTextLabel)
  {
    -[NCNotificationListBaseContentView preferredContentSizeCategory](self, "preferredContentSizeCategory");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);
    v5 = (id *)MEMORY[0x1E0DC4A88];
    if (!IsAccessibilityCategory)
      v5 = (id *)MEMORY[0x1E0DC4AB8];
    v6 = *v5;

    -[NCNotificationListBaseContentView _updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:](self, "_updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:", self->_secondaryTextLabel, v6, 0, -[NCNotificationRichContentView _maximumNumberOfLinesForSecondaryText](self, "_maximumNumberOfLinesForSecondaryText"), *MEMORY[0x1E0DC1440]);
    self->_hasUpdatedContent = 1;
    -[NCNotificationRichContentView setNeedsLayout](self, "setNeedsLayout");
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
      v5 = (id *)MEMORY[0x1E0DC4AA0];
    v6 = *v5;

    -[NCNotificationListBaseContentView _updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:](self, "_updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:", self->_footerTextLabel, v6, 0, -[NCNotificationRichContentView _maximumNumberOfLinesForFooterText](self, "_maximumNumberOfLinesForFooterText"), *MEMORY[0x1E0DC1440]);
    self->_hasUpdatedContent = 1;
    -[NCNotificationRichContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTextAttributesForDateLabel
{
  BSUIDateLabel *dateLabel;
  void *v4;

  dateLabel = self->_dateLabel;
  if (dateLabel)
  {
    -[NCNotificationRichContentView _dateLabelPreferredFont](self, "_dateLabelPreferredFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIDateLabel setFont:](dateLabel, "setFont:", v4);

    -[BSUIDateLabel setNumberOfLines:](self->_dateLabel, "setNumberOfLines:", 1);
    -[BSUIDateLabel setLineBreakMode:](self->_dateLabel, "setLineBreakMode:", 3);
    -[NCNotificationRichContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_dateLabelPreferredFont
{
  return -[NCNotificationListBaseContentView _preferredFont:textStyle:weight:additionalTraits:](self, "_preferredFont:textStyle:weight:additionalTraits:", 1, *MEMORY[0x1E0DC4AA0], 0, *MEMORY[0x1E0DC1440]);
}

- (void)_configureDateLabelIfNecessary
{
  if (!self->_dateLabel)
  {
    if (self->_date)
      -[NCNotificationRichContentView _configureDateLabel](self, "_configureDateLabel");
  }
}

- (void)_configureDateLabel
{
  void *v3;
  BSUIDateLabel *v4;
  BSUIDateLabel *dateLabel;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D01918], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startLabelWithStartDate:endDate:timeZone:allDay:forStyle:", self->_date, 0, self->_timeZone, self->_dateAllDay, self->_dateFormatStyle);
  v4 = (BSUIDateLabel *)objc_claimAutoreleasedReturnValue();
  dateLabel = self->_dateLabel;
  self->_dateLabel = v4;

  -[BSUIDateLabel setDelegate:](self->_dateLabel, "setDelegate:", self);
  -[BSUIDateLabel setHidden:](self->_dateLabel, "setHidden:", self->_hideDate);
  -[NCNotificationRichContentView addSubview:](self, "addSubview:", self->_dateLabel);
  -[NCNotificationRichContentView _updateTextAttributesForDateLabel](self, "_updateTextAttributesForDateLabel");
  -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_dateLabel, 1, v7, 0);
  v6 = v7;
  if (v7)
  {
    objc_msgSend(v7, "automaticallyUpdateView:withStyle:", self->_dateLabel, 1);
    v6 = v7;
  }

}

- (void)_recycleDateLabel
{
  void *v3;
  id v4;

  -[BSUIDateLabel setDelegate:](self->_dateLabel, "setDelegate:", 0);
  -[BSUIDateLabel setHidden:](self->_dateLabel, "setHidden:", 0);
  -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAutomaticallyUpdatingView:", self->_dateLabel);

  objc_msgSend(MEMORY[0x1E0D01918], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recycleLabel:", self->_dateLabel);

}

- (void)_tearDownDateLabel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __51__NCNotificationRichContentView__tearDownDateLabel__block_invoke;
  v2[3] = &unk_1E8D1B568;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

void __51__NCNotificationRichContentView__tearDownDateLabel__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 504);
  if (v2)
  {
    objc_msgSend(v2, "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 32), "_recycleDateLabel");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 504);
    *(_QWORD *)(v3 + 504) = 0;

  }
}

- (int64_t)_dateFormatStyleForDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  unsigned int v6;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDateInToday:", v4);

  return v6;
}

- (unint64_t)secondaryTextMaximumNumberOfLines
{
  return self->_secondaryTextMaximumNumberOfLines;
}

- (BOOL)screenCaptureProhibited
{
  return self->_screenCaptureProhibited;
}

- (NCBadgedIconView)badgedIconView
{
  return self->_badgedIconView;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)isDateAllDay
{
  return self->_dateAllDay;
}

- (int64_t)dateFormatStyle
{
  return self->_dateFormatStyle;
}

- (BOOL)hideDate
{
  return self->_hideDate;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (BOOL)isAttachmentImageFeatured
{
  return self->_attachmentImageFeatured;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_badgedIconView, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
  objc_storeStrong((id *)&self->_imageBoundingView, 0);
  objc_storeStrong((id *)&self->_footerTextLabel, 0);
  objc_storeStrong((id *)&self->_secondaryTextLabel, 0);
  objc_storeStrong((id *)&self->_primarySubtitleTextLabel, 0);
  objc_storeStrong((id *)&self->_primaryTextLabel, 0);
  objc_storeStrong((id *)&self->_crossfadingContentView, 0);
}

@end
