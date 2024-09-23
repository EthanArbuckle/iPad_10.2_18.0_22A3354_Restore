@implementation NCNotificationShortLookView

- (NCNotificationShortLookView)initWithFrame:(CGRect)a3
{
  NCNotificationShortLookView *v3;
  NCNotificationShortLookView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationShortLookView;
  v3 = -[NCNotificationShortLookView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_backgroundAlpha = 1.0;
    v3->_disableDimming = 0;
    -[NCNotificationShortLookView _configurePlatterViewIfNeccesary](v3, "_configurePlatterViewIfNeccesary");
  }
  return v4;
}

- (NSString)title
{
  return 0;
}

- (BOOL)isNotificationContentViewHidden
{
  double v2;

  -[NCNotificationContentDisplaying alpha](self->_notificationContentView, "alpha");
  return v2 == 0.0;
}

- (void)setNotificationContentViewHidden:(BOOL)a3
{
  double v4;
  void *v5;

  if (a3)
    v4 = 0.0;
  else
    v4 = 1.0;
  -[NCNotificationShortLookView _notificationContentView](self, "_notificationContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

  -[NCAuxiliaryOptionsView setAlpha:](self->_auxiliaryOptionsView, "setAlpha:", v4);
}

- (MTMaterialView)backgroundMaterialView
{
  return -[PLPlatterView backgroundMaterialView](self->_platterView, "backgroundMaterialView");
}

- (BOOL)isHighlighted
{
  return -[PLPlatterView isHighlighted](self->_platterView, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  -[PLPlatterView setHighlighted:](self->_platterView, "setHighlighted:", a3);
}

- (BOOL)isTruncatingSecondaryText
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[NCNotificationContentDisplaying isTruncatingSecondaryText](self->_notificationContentView, "isTruncatingSecondaryText");
  else
    return 0;
}

- (void)setAlignContentToBottom:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[NCNotificationContentDisplaying setAlignContentToBottom:](self->_notificationContentView, "setAlignContentToBottom:", v3);
}

- (void)setDisableDimming:(BOOL)a3
{
  if (self->_disableDimming != a3)
  {
    self->_disableDimming = a3;
    -[NCNotificationListStackDimmingOverlayView setHidden:](self->_stackDimmingOverlayView, "setHidden:");
  }
}

- (void)configureStackDimmingForTransform:(CGAffineTransform *)a3
{
  double v4;
  NCNotificationListStackDimmingOverlayView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NCNotificationListStackDimmingOverlayView *v15;
  NCNotificationListStackDimmingOverlayView *stackDimmingOverlayView;
  _QWORD v17[5];

  if (a3->a <= 0.94)
    v4 = dbl_1CFD91A50[a3->a < 0.94];
  else
    v4 = 0.0;
  if (v4 > 0.0 && !self->_stackDimmingOverlayView)
  {
    v5 = [NCNotificationListStackDimmingOverlayView alloc];
    -[NCNotificationShortLookView bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[PLPlatterView _continuousCornerRadius](self->_platterView, "_continuousCornerRadius");
    v15 = -[NCNotificationListStackDimmingOverlayView initWithFrame:cornerRadius:](v5, "initWithFrame:cornerRadius:", v7, v9, v11, v13, v14);
    stackDimmingOverlayView = self->_stackDimmingOverlayView;
    self->_stackDimmingOverlayView = v15;

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __65__NCNotificationShortLookView_configureStackDimmingForTransform___block_invoke;
    v17[3] = &unk_1E8D1B568;
    v17[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v17);
  }
  -[NCNotificationListStackDimmingOverlayView setAlpha:](self->_stackDimmingOverlayView, "setAlpha:", v4);
  -[NCNotificationListStackDimmingOverlayView setHidden:](self->_stackDimmingOverlayView, "setHidden:", self->_disableDimming);
}

void __65__NCNotificationShortLookView_configureStackDimmingForTransform___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 416);
  v3 = *(_QWORD *)(v1 + 448);
  objc_msgSend(v2, "customContentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertSubview:belowSubview:", v3, v4);

}

- (id)notificationContentView
{
  return self->_notificationContentView;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  -[NCNotificationShortLookView contentSizeForSize:](self, "contentSizeForSize:", a3.width, a3.height);
  -[NCNotificationShortLookView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:");
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationShortLookView;
  -[NCNotificationShortLookView layoutSubviews](&v3, sel_layoutSubviews);
  -[NCNotificationShortLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
  -[NCNotificationShortLookView _layoutNotificationContentView](self, "_layoutNotificationContentView");
  -[NCNotificationShortLookView _layoutAuxiliaryOptionsView](self, "_layoutAuxiliaryOptionsView");
}

- (double)_continuousCornerRadius
{
  double result;

  -[PLPlatterView _continuousCornerRadius](self->_platterView, "_continuousCornerRadius");
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  -[PLPlatterView _setContinuousCornerRadius:](self->_platterView, "_setContinuousCornerRadius:", a3);
}

- (double)_cornerRadius
{
  double result;

  -[PLPlatterView _cornerRadius](self->_platterView, "_cornerRadius");
  return result;
}

- (void)_setCornerRadius:(double)a3
{
  -[PLPlatterView _setCornerRadius:](self->_platterView, "_setCornerRadius:", a3);
}

- (UIView)customContentView
{
  return -[PLPlatterView customContentView](self->_platterView, "customContentView");
}

- (BOOL)hasShadow
{
  return -[PLPlatterView hasShadow](self->_platterView, "hasShadow");
}

- (void)setHasShadow:(BOOL)a3
{
  -[PLPlatterView setHasShadow:](self->_platterView, "setHasShadow:", a3);
}

- (BOOL)isBackgroundBlurred
{
  return -[PLPlatterView isBackgroundBlurred](self->_platterView, "isBackgroundBlurred");
}

- (void)setBackgroundBlurred:(BOOL)a3
{
  -[PLPlatterView setBackgroundBlurred:](self->_platterView, "setBackgroundBlurred:", a3);
}

- (void)startLightEffect
{
  PLPlatterView *v2;

  v2 = self->_platterView;
  NSSelectorFromString(CFSTR("startLightEffect"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PLPlatterView performSelector:](v2, "performSelector:", NSSelectorFromString(CFSTR("startLightEffect")));

}

- (void)stopLightEffect
{
  PLPlatterView *v2;

  v2 = self->_platterView;
  NSSelectorFromString(CFSTR("stopLightEffect"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PLPlatterView performSelector:](v2, "performSelector:", NSSelectorFromString(CFSTR("stopLightEffect")));

}

- (CGSize)contentSizeForSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PLPlatterView contentSizeForSize:](self->_platterView, "contentSizeForSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[NCNotificationShortLookView _sizeThatFitsContentWithSize:withAuxiliaryOptionsViewVisible:](self, "_sizeThatFitsContentWithSize:withAuxiliaryOptionsViewVisible:", -[NCAuxiliaryOptionsView auxiliaryOptionsVisible](self->_auxiliaryOptionsView, "auxiliaryOptionsVisible"), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (NSString)primaryText
{
  return (NSString *)-[NCNotificationContentDisplaying primaryText](self->_notificationContentView, "primaryText");
}

- (void)setPrimaryText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCNotificationContentDisplaying primaryText](self->_notificationContentView, "primaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[NCNotificationShortLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    -[NCNotificationContentDisplaying setPrimaryText:](self->_notificationContentView, "setPrimaryText:", v6);
    -[NCNotificationShortLookView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)primarySubtitleText
{
  return (NSString *)-[NCNotificationContentDisplaying primarySubtitleText](self->_notificationContentView, "primarySubtitleText");
}

- (void)setContentSummaryText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NCNotificationContentDisplaying contentSummaryText](self->_notificationContentView, "contentSummaryText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = BSEqualObjects();

    if ((v5 & 1) == 0)
    {
      -[NCNotificationShortLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[NCNotificationContentDisplaying setContentSummaryText:](self->_notificationContentView, "setContentSummaryText:", v6);
      -[NCNotificationShortLookView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (NSAttributedString)contentSummaryText
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NCNotificationContentDisplaying contentSummaryText](self->_notificationContentView, "contentSummaryText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSAttributedString *)v3;
}

- (void)setPrimarySubtitleText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCNotificationContentDisplaying primarySubtitleText](self->_notificationContentView, "primarySubtitleText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[NCNotificationShortLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    -[NCNotificationContentDisplaying setPrimarySubtitleText:](self->_notificationContentView, "setPrimarySubtitleText:", v6);
    -[NCNotificationShortLookView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSAttributedString)secondaryText
{
  return (NSAttributedString *)-[NCNotificationContentDisplaying secondaryText](self->_notificationContentView, "secondaryText");
}

- (void)setSecondaryText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCNotificationContentDisplaying secondaryText](self->_notificationContentView, "secondaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[NCNotificationShortLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    -[NCNotificationContentDisplaying setSecondaryText:](self->_notificationContentView, "setSecondaryText:", v6);
    -[NCNotificationShortLookView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)importantText
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NCNotificationContentDisplaying importantText](self->_notificationContentView, "importantText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setImportantText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCNotificationShortLookView importantText](self, "importantText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[NCNotificationShortLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NCNotificationContentDisplaying setImportantText:](self->_notificationContentView, "setImportantText:", v6);
  }

}

- (NSAttributedString)importantAttributedText
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NCNotificationContentDisplaying importantAttributedText](self->_notificationContentView, "importantAttributedText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSAttributedString *)v3;
}

- (void)setImportantAttributedText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCNotificationShortLookView importantAttributedText](self, "importantAttributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[NCNotificationShortLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NCNotificationContentDisplaying setImportantAttributedText:](self->_notificationContentView, "setImportantAttributedText:", v6);
  }

}

- (UIImageConfiguration)importantTextImageConfiguration
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NCNotificationContentDisplaying importantTextImageConfiguration](self->_notificationContentView, "importantTextImageConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (UIImageConfiguration *)v3;
}

- (MTVisualStylingProvider)importantTextVisualStylingProvider
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NCNotificationContentDisplaying importantTextVisualStylingProvider](self->_notificationContentView, "importantTextVisualStylingProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (MTVisualStylingProvider *)v3;
}

- (void)setImportantTextVisualStylingProvider:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCNotificationShortLookView importantTextVisualStylingProvider](self, "importantTextVisualStylingProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[NCNotificationShortLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NCNotificationContentDisplaying setImportantTextVisualStylingProvider:](self->_notificationContentView, "setImportantTextVisualStylingProvider:", v6);
  }

}

- (NSString)footerText
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NCNotificationContentDisplaying footerText](self->_notificationContentView, "footerText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setFooterText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCNotificationShortLookView footerText](self, "footerText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[NCNotificationShortLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NCNotificationContentDisplaying setFooterText:](self->_notificationContentView, "setFooterText:", v6);
    -[NCNotificationShortLookView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIAction)inlineAction
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NCNotificationContentDisplaying inlineAction](self->_notificationContentView, "inlineAction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (UIAction *)v3;
}

- (void)setInlineAction:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCNotificationShortLookView inlineAction](self, "inlineAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[NCNotificationShortLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NCNotificationContentDisplaying setInlineAction:](self->_notificationContentView, "setInlineAction:", v6);
  }

}

- (NCBadgedIconView)badgedIconView
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NCNotificationContentDisplaying badgedIconView](self->_notificationContentView, "badgedIconView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NCBadgedIconView *)v3;
}

- (void)setBadgedIconView:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCNotificationShortLookView badgedIconView](self, "badgedIconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[NCNotificationShortLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NCNotificationContentDisplaying setBadgedIconView:](self->_notificationContentView, "setBadgedIconView:", v6);
    -[NCNotificationShortLookView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIImage)thumbnail
{
  return (UIImage *)-[NCNotificationContentDisplaying thumbnail](self->_notificationContentView, "thumbnail");
}

- (void)setThumbnail:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCNotificationContentDisplaying thumbnail](self->_notificationContentView, "thumbnail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[NCNotificationShortLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    -[NCNotificationContentDisplaying setThumbnail:](self->_notificationContentView, "setThumbnail:", v6);
    -[NCNotificationShortLookView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSDate)date
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NCNotificationContentDisplaying date](self->_notificationContentView, "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSDate *)v3;
}

- (void)setDate:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCNotificationShortLookView date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NCNotificationContentDisplaying setDate:](self->_notificationContentView, "setDate:", v6);
    -[NCNotificationShortLookView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (BOOL)isDateAllDay
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[NCNotificationContentDisplaying isDateAllDay](self->_notificationContentView, "isDateAllDay");
  else
    return 0;
}

- (void)setDateAllDay:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[NCNotificationShortLookView isDateAllDay](self, "isDateAllDay") != a3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NCNotificationContentDisplaying setDateAllDay:](self->_notificationContentView, "setDateAllDay:", v3);
    -[NCNotificationShortLookView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSTimeZone)timeZone
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NCNotificationContentDisplaying timeZone](self->_notificationContentView, "timeZone");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSTimeZone *)v3;
}

- (void)setTimeZone:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCNotificationShortLookView timeZone](self, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NCNotificationContentDisplaying setTimeZone:](self->_notificationContentView, "setTimeZone:", v6);
    -[NCNotificationShortLookView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (int64_t)dateFormatStyle
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[NCNotificationContentDisplaying dateFormatStyle](self->_notificationContentView, "dateFormatStyle");
  else
    return 0;
}

- (void)setDateFormatStyle:(int64_t)a3
{
  if (-[NCNotificationShortLookView dateFormatStyle](self, "dateFormatStyle") != a3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NCNotificationContentDisplaying setDateFormatStyle:](self->_notificationContentView, "setDateFormatStyle:", a3);
    -[NCNotificationShortLookView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)hideDate
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[NCNotificationContentDisplaying hideDate](self->_notificationContentView, "hideDate");
  else
    return 0;
}

- (void)setHideDate:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[NCNotificationShortLookView hideDate](self, "hideDate") != a3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NCNotificationContentDisplaying setHideDate:](self->_notificationContentView, "setHideDate:", v3);
    -[NCNotificationShortLookView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)screenCaptureProhibited
{
  return -[NCNotificationContentDisplaying screenCaptureProhibited](self->_notificationContentView, "screenCaptureProhibited");
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[NCNotificationShortLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
  -[NCNotificationContentDisplaying setScreenCaptureProhibited:](self->_notificationContentView, "setScreenCaptureProhibited:", v3);
}

- (UIView)accessoryView
{
  return 0;
}

- (unint64_t)maximumNumberOfPrimaryTextLines
{
  return -[NCNotificationContentDisplaying primaryTextMaximumNumberOfLines](self->_notificationContentView, "primaryTextMaximumNumberOfLines");
}

- (void)setMaximumNumberOfPrimaryTextLines:(unint64_t)a3
{
  -[NCNotificationShortLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
  -[NCNotificationContentDisplaying setPrimaryTextMaximumNumberOfLines:](self->_notificationContentView, "setPrimaryTextMaximumNumberOfLines:", a3);
  -[NCNotificationContentDisplaying setPrimarySubtitleTextMaximumNumberOfLines:](self->_notificationContentView, "setPrimarySubtitleTextMaximumNumberOfLines:", a3);
}

- (unint64_t)maximumNumberOfSecondaryTextLines
{
  return -[NCNotificationContentDisplaying secondaryTextMaximumNumberOfLines](self->_notificationContentView, "secondaryTextMaximumNumberOfLines");
}

- (void)setMaximumNumberOfSecondaryTextLines:(unint64_t)a3
{
  -[NCNotificationShortLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
  -[NCNotificationContentDisplaying setSecondaryTextMaximumNumberOfLines:](self->_notificationContentView, "setSecondaryTextMaximumNumberOfLines:", a3);
}

- (NSString)auxiliaryOptionsSummaryText
{
  return -[NCAuxiliaryOptionsView auxiliaryOptionsSummaryText](self->_auxiliaryOptionsView, "auxiliaryOptionsSummaryText");
}

- (void)setAuxiliaryOptionsSummaryText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCNotificationShortLookView auxiliaryOptionsSummaryText](self, "auxiliaryOptionsSummaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[NCNotificationShortLookView _configureAuxiliaryOptionsViewIfNecessary](self, "_configureAuxiliaryOptionsViewIfNecessary");
    -[NCAuxiliaryOptionsView setAuxiliaryOptionsSummaryText:](self->_auxiliaryOptionsView, "setAuxiliaryOptionsSummaryText:", v6);
    -[NCNotificationShortLookView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (NSArray)auxiliaryOptionButtons
{
  return -[NCAuxiliaryOptionsView auxiliaryOptionButtons](self->_auxiliaryOptionsView, "auxiliaryOptionButtons");
}

- (BOOL)auxiliaryOptionsVisible
{
  return -[NCAuxiliaryOptionsView auxiliaryOptionsVisible](self->_auxiliaryOptionsView, "auxiliaryOptionsVisible");
}

- (void)setAuxiliaryOptionsVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  _QWORD v8[5];

  v3 = a3;
  if (-[NCNotificationShortLookView auxiliaryOptionsVisible](self, "auxiliaryOptionsVisible") != a3)
  {
    -[NCNotificationShortLookView _configureAuxiliaryOptionsViewIfNecessary](self, "_configureAuxiliaryOptionsViewIfNecessary");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__NCNotificationShortLookView_setAuxiliaryOptionsVisible___block_invoke;
    v8[3] = &unk_1E8D1B568;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v8);
    -[NCAuxiliaryOptionsView setAuxiliaryOptionsVisible:](self->_auxiliaryOptionsView, "setAuxiliaryOptionsVisible:", v3);
    -[NCNotificationShortLookView customContentView](self, "customContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 23.5;
    if (!v3)
      v7 = 0.0;
    objc_msgSend(v5, "_setContinuousCornerRadius:", v7);

    -[NCNotificationShortLookView setNeedsLayout](self, "setNeedsLayout");
  }
}

uint64_t __58__NCNotificationShortLookView_setAuxiliaryOptionsVisible___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setAuxiliaryOptionActions:(id)a3
{
  id v4;

  v4 = a3;
  -[NCNotificationShortLookView _configureAuxiliaryOptionsViewIfNecessary](self, "_configureAuxiliaryOptionsViewIfNecessary");
  -[NCAuxiliaryOptionsView setAuxiliaryOptionActions:](self->_auxiliaryOptionsView, "setAuxiliaryOptionActions:", v4);

  -[NCNotificationShortLookView setNeedsLayout](self, "setNeedsLayout");
}

- (NSArray)auxiliaryOptionActions
{
  return -[NCAuxiliaryOptionsView auxiliaryOptionActions](self->_auxiliaryOptionsView, "auxiliaryOptionActions");
}

- (BOOL)adjustsFontForContentSizeCategory
{
  -[NCNotificationShortLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
  if ((-[NCNotificationContentDisplaying adjustsFontForContentSizeCategory](self->_notificationContentView, "adjustsFontForContentSizeCategory") & 1) != 0)return 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[PLPlatterView adjustsFontForContentSizeCategory](self->_platterView, "adjustsFontForContentSizeCategory");
  return 0;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PLPlatterView setAdjustsFontForContentSizeCategory:](self->_platterView, "setAdjustsFontForContentSizeCategory:", v3);
  v5 = -[NCNotificationShortLookView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory");
  -[NCNotificationContentDisplaying setAdjustsFontForContentSizeCategory:](self->_notificationContentView, "setAdjustsFontForContentSizeCategory:", v5);
  -[NCAuxiliaryOptionsView setAdjustsFontForContentSizeCategory:](self->_auxiliaryOptionsView, "setAdjustsFontForContentSizeCategory:", v5);
}

- (BOOL)adjustForContentSizeCategoryChange
{
  int v3;
  int v4;
  int v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = -[PLPlatterView adjustForContentSizeCategoryChange](self->_platterView, "adjustForContentSizeCategoryChange");
  else
    v3 = 0;
  v4 = -[NCNotificationContentDisplaying adjustForContentSizeCategoryChange](self->_notificationContentView, "adjustForContentSizeCategoryChange");
  v5 = -[NCAuxiliaryOptionsView adjustForContentSizeCategoryChange](self->_auxiliaryOptionsView, "adjustForContentSizeCategoryChange") | v4 | v3;
  if (v5 == 1)
    -[NCNotificationShortLookView setNeedsLayout](self, "setNeedsLayout");
  return v5;
}

- (NSString)materialGroupNameBase
{
  return -[PLPlatterView materialGroupNameBase](self->_platterView, "materialGroupNameBase");
}

- (void)setMaterialGroupNameBase:(id)a3
{
  id v4;

  v4 = a3;
  -[NCNotificationShortLookView _configurePlatterViewIfNeccesary](self, "_configurePlatterViewIfNeccesary");
  -[PLPlatterView setMaterialGroupNameBase:](self->_platterView, "setMaterialGroupNameBase:", v4);
  -[NCAuxiliaryOptionsView setMaterialGroupNameBase:](self->_auxiliaryOptionsView, "setMaterialGroupNameBase:", v4);

}

- (int64_t)materialRecipe
{
  return -[PLPlatterView materialRecipe](self->_platterView, "materialRecipe");
}

- (void)setMaterialRecipe:(int64_t)a3
{
  -[NCNotificationShortLookView _configurePlatterViewIfNeccesary](self, "_configurePlatterViewIfNeccesary");
  -[PLPlatterView setMaterialRecipe:](self->_platterView, "setMaterialRecipe:", a3);
  -[NCAuxiliaryOptionsView setMaterialRecipe:](self->_auxiliaryOptionsView, "setMaterialRecipe:", a3);
}

- (void)setBackgroundAlpha:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_backgroundAlpha != a3)
  {
    self->_backgroundAlpha = a3;
    -[NCNotificationShortLookView _configurePlatterViewIfNeccesary](self, "_configurePlatterViewIfNeccesary");
    -[PLPlatterView backgroundMaterialView](self->_platterView, "backgroundMaterialView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[PLPlatterView setNeedsLayout](self->_platterView, "setNeedsLayout");
      -[PLPlatterView layoutIfNeeded](self->_platterView, "layoutIfNeeded");
    }
    -[PLPlatterView backgroundMaterialView](self->_platterView, "backgroundMaterialView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PLPlatterView backgroundMaterialView](self->_platterView, "backgroundMaterialView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlpha:", a3);

      -[PLPlatterView backgroundMaterialView](self->_platterView, "backgroundMaterialView");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHidden:", a3 < 0.001);

    }
  }
}

- (CGSize)_sizeThatFitsContentWithSize:(CGSize)a3 withAuxiliaryOptionsViewVisible:(BOOL)a4
{
  _BOOL4 v4;
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v4 = a4;
  width = a3.width;
  -[PLPlatterView sizeThatFitsContentWithSize:](self->_platterView, "sizeThatFitsContentWithSize:", a3.width, 0.0);
  v8 = v7;
  v10 = v9;
  -[NCNotificationShortLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
  -[NCNotificationContentDisplaying sizeThatFits:](self->_notificationContentView, "sizeThatFits:", width, 0.0);
  v12 = v10 + v11;
  if (v4)
  {
    -[NCAuxiliaryOptionsView sizeThatFits:](self->_auxiliaryOptionsView, "sizeThatFits:", width, 0.0);
    v12 = v12 + v13;
  }
  v14 = v8;
  v15 = v12;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)_configurePlatterViewIfNeccesary
{
  PLPlatterView *v3;
  PLPlatterView *platterView;
  void *v5;
  PLPlatterView *v6;

  if (!self->_platterView)
  {
    v3 = (PLPlatterView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3F0]), "initWithRecipe:", 1);
    platterView = self->_platterView;
    self->_platterView = v3;

    -[PLPlatterView _setContinuousCornerRadius:](self->_platterView, "_setContinuousCornerRadius:", 23.5);
    -[PLPlatterView setAccessibilityIdentifier:](self->_platterView, "setAccessibilityIdentifier:", CFSTR("ShortLook.Platter"));
    -[PLPlatterView customContentView](self->_platterView, "customContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClipsToBounds:", 1);

    -[NCNotificationShortLookView addSubview:](self, "addSubview:", self->_platterView);
    v6 = self->_platterView;
    -[NCNotificationShortLookView bounds](self, "bounds");
    -[PLPlatterView setFrame:](v6, "setFrame:");
    -[PLPlatterView setAutoresizingMask:](self->_platterView, "setAutoresizingMask:", 18);
  }
}

- (id)_newNotificationContentView
{
  NCNotificationSeamlessContentView *v3;

  v3 = objc_alloc_init(NCNotificationSeamlessContentView);
  -[NCNotificationSeamlessContentView setDelegate:](v3, "setDelegate:", self);
  return v3;
}

- (void)_configureNotificationContentViewIfNecessary
{
  _QWORD v2[5];

  if (!self->_notificationContentView)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __75__NCNotificationShortLookView__configureNotificationContentViewIfNecessary__block_invoke;
    v2[3] = &unk_1E8D1B568;
    v2[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
  }
}

void __75__NCNotificationShortLookView__configureNotificationContentViewIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_newNotificationContentView");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 432);
  *(_QWORD *)(v3 + 432) = v2;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "requiredVisualStyleCategories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "integerValue");
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(void **)(v11 + 432);
        objc_msgSend(*(id *)(v11 + 416), "visualStylingProviderForCategory:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setVisualStylingProvider:forCategory:", v13, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAdjustsFontForContentSizeCategory:", objc_msgSend(*(id *)(a1 + 32), "adjustsFontForContentSizeCategory"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setFontProvider:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424));
  objc_msgSend(*(id *)(a1 + 32), "customContentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("ShortLook.Platter.Content"));

  objc_msgSend(*(id *)(a1 + 32), "customContentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432));

}

- (id)_notificationContentView
{
  -[NCNotificationShortLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
  return self->_notificationContentView;
}

- (void)_configureAuxiliaryOptionsViewIfNecessary
{
  NCAuxiliaryOptionsView *v3;
  NCAuxiliaryOptionsView *auxiliaryOptionsView;
  NCAuxiliaryOptionsView *v5;
  void *v6;
  _QWORD v7[5];

  if (!self->_auxiliaryOptionsView)
  {
    v3 = objc_alloc_init(NCAuxiliaryOptionsView);
    auxiliaryOptionsView = self->_auxiliaryOptionsView;
    self->_auxiliaryOptionsView = v3;

    -[NCAuxiliaryOptionsView setFontProvider:](self->_auxiliaryOptionsView, "setFontProvider:", self->_fontProvider);
    -[NCAuxiliaryOptionsView setAdjustsFontForContentSizeCategory:](self->_auxiliaryOptionsView, "setAdjustsFontForContentSizeCategory:", -[NCNotificationShortLookView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"));
    v5 = self->_auxiliaryOptionsView;
    -[NCNotificationShortLookView _continuousCornerRadius](self, "_continuousCornerRadius");
    -[NCAuxiliaryOptionsView _setContinuousCornerRadius:](v5, "_setContinuousCornerRadius:");
    -[NCNotificationShortLookView customContentView](self, "customContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_auxiliaryOptionsView);

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__NCNotificationShortLookView__configureAuxiliaryOptionsViewIfNecessary__block_invoke;
    v7[3] = &unk_1E8D1B568;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v7);
  }
}

uint64_t __72__NCNotificationShortLookView__configureAuxiliaryOptionsViewIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "layoutIfNeeded");
}

- (void)_layoutNotificationContentView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NCNotificationContentDisplaying *notificationContentView;

  if (self->_notificationContentView)
  {
    -[NCNotificationShortLookView customContentView](self, "customContentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;

    -[NCNotificationContentDisplaying sizeThatFits:](self->_notificationContentView, "sizeThatFits:", v5, v7);
    BSRectWithSize();
    notificationContentView = self->_notificationContentView;
    _NCMainScreenScale();
    UIRectIntegralWithScale();
    -[NCNotificationContentDisplaying setFrame:](notificationContentView, "setFrame:");
  }
}

- (void)_layoutAuxiliaryOptionsView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NCAuxiliaryOptionsView *auxiliaryOptionsView;
  _BOOL4 v12;
  double v13;
  _BOOL4 v14;
  CGRect v15;

  if (self->_auxiliaryOptionsView)
  {
    -[NCNotificationShortLookView bounds](self, "bounds");
    -[NCAuxiliaryOptionsView sizeThatFits:](self->_auxiliaryOptionsView, "sizeThatFits:", v3, v4);
    BSRectWithSize();
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[NCNotificationContentDisplaying frame](self->_notificationContentView, "frame");
    -[NCAuxiliaryOptionsView setFrame:](self->_auxiliaryOptionsView, "setFrame:", v6, CGRectGetMaxY(v15), v8, v10);
    auxiliaryOptionsView = self->_auxiliaryOptionsView;
    v12 = -[NCAuxiliaryOptionsView auxiliaryOptionsVisible](auxiliaryOptionsView, "auxiliaryOptionsVisible");
    v13 = 0.0;
    if (v12)
    {
      v14 = -[NCNotificationShortLookView isNotificationContentViewHidden](self, "isNotificationContentViewHidden", 0.0);
      v13 = 1.0;
      if (v14)
        v13 = 0.0;
    }
    -[NCAuxiliaryOptionsView setAlpha:](auxiliaryOptionsView, "setAlpha:", v13);
  }
}

- (id)_fontProvider
{
  void *v3;

  if (!self->_fontProvider)
  {
    if (-[NCNotificationShortLookView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))
      objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
    else
      objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationShortLookView _setFontProvider:](self, "_setFontProvider:", v3);

  }
  return self->_fontProvider;
}

- (void)_setFontProvider:(id)a3
{
  BSUIFontProvider *v5;
  char v6;
  BSUIFontProvider *v7;

  v5 = (BSUIFontProvider *)a3;
  if (self->_fontProvider != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_fontProvider, a3);
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      -[NCNotificationContentDisplaying setFontProvider:](self->_notificationContentView, "setFontProvider:", self->_fontProvider);
      v5 = v7;
    }
  }

}

- (void)didInvalidateSizeFromNotificationSeamlessContentView:(id)a3
{
  id v4;

  -[NCNotificationShortLookView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didInvalidateSizeFromNotificationShortLookView:", self);

}

- (BOOL)alignContentToBottom
{
  return self->_alignContentToBottom;
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (BOOL)disableDimming
{
  return self->_disableDimming;
}

- (NCNotificationShortLookViewDelegate)delegate
{
  return (NCNotificationShortLookViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)_isBanner
{
  return self->_banner;
}

- (void)_setBanner:(BOOL)a3
{
  self->_banner = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stackDimmingOverlayView, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsView, 0);
  objc_storeStrong((id *)&self->_notificationContentView, 0);
  objc_storeStrong((id *)&self->_fontProvider, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
}

@end
