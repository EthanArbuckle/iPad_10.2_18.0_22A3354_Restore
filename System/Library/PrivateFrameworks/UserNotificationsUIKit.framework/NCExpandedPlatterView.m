@implementation NCExpandedPlatterView

- (void)setHidesNotificationContent:(BOOL)a3
{
  NCNotificationSeamlessContentView *notificationContentView;
  void *v5;

  if (self->_hidesNotificationContent != a3)
  {
    self->_hidesNotificationContent = a3;
    if (a3)
    {
      -[NCNotificationSeamlessContentView removeFromSuperview](self->_notificationContentView, "removeFromSuperview");
      notificationContentView = self->_notificationContentView;
      self->_notificationContentView = 0;

    }
    -[PLExpandedPlatterView _mainContentView](self, "_mainContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

    -[NCExpandedPlatterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UITapGestureRecognizer)defaultTapGestureRecognizer
{
  -[NCExpandedPlatterView _configureDefaultTapGestureRecognizerIfNecessary](self, "_configureDefaultTapGestureRecognizerIfNecessary");
  return self->_defaultTapGestureRecognizer;
}

- (NCExpandedPlatterView)initWithFrame:(CGRect)a3
{
  NCExpandedPlatterView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCExpandedPlatterView;
  v3 = -[PLExpandedPlatterView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCExpandedPlatterView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (void)layoutSubviews
{
  void (**v2)(_QWORD);
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  void *v6;
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __39__NCExpandedPlatterView_layoutSubviews__block_invoke;
  v6 = &unk_1E8D1B278;
  objc_copyWeak(&v7, &location);
  v2 = (void (**)(_QWORD))_Block_copy(&v3);
  if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled", v3, v4, v5, v6)
    && objc_msgSend(MEMORY[0x1E0DC3F10], "_isInRetargetableAnimationBlock"))
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateByRetargetingAnimations:completion:", v2, 0);
  }
  else
  {
    v2[2](v2);
  }

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __39__NCExpandedPlatterView_layoutSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_layoutSubviews");

}

- (CGRect)_mainContentViewFrame
{
  double v3;
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
  objc_super v16;
  CGRect result;

  v16.receiver = self;
  v16.super_class = (Class)NCExpandedPlatterView;
  -[PLExpandedPlatterView _mainContentViewFrame](&v16, sel__mainContentViewFrame);
  v6 = v5;
  v8 = v7;
  v9 = v3;
  v10 = v4;
  if (!self->_hidesNotificationContent)
  {
    -[NCNotificationSeamlessContentView sizeThatFits:](self->_notificationContentView, "sizeThatFits:", v3, v4);
    v10 = v10 + v11;
  }
  v12 = v6;
  v13 = v8;
  v14 = v9;
  v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGSize)_contentViewSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  v12.receiver = self;
  v12.super_class = (Class)NCExpandedPlatterView;
  -[PLExpandedPlatterView _contentViewSize](&v12, sel__contentViewSize);
  v4 = v3;
  v6 = v5;
  if (!self->_hidesNotificationContent)
  {
    -[NCExpandedPlatterView bounds](self, "bounds");
    -[NCExpandedPlatterView contentSizeForSize:](self, "contentSizeForSize:", v7, v8);
    -[NCNotificationSeamlessContentView sizeThatFits:](self->_notificationContentView, "sizeThatFits:");
    v6 = v6 + v9;
  }
  v10 = v4;
  v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  NCNotificationSeamlessContentView *notificationContentView;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)NCExpandedPlatterView;
  -[PLExpandedPlatterView sizeThatFitsContentWithSize:](&v13, sel_sizeThatFitsContentWithSize_, a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  notificationContentView = self->_notificationContentView;
  if (notificationContentView)
  {
    -[NCNotificationSeamlessContentView sizeThatFits:](notificationContentView, "sizeThatFits:", width, 1.79769313e308);
    v8 = v8 + v10;
  }
  v11 = v6;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)contentSizeForSize:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  NCNotificationSeamlessContentView *notificationContentView;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)NCExpandedPlatterView;
  -[PLExpandedPlatterView contentSizeForSize:](&v13, sel_contentSizeForSize_, a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  notificationContentView = self->_notificationContentView;
  if (notificationContentView)
  {
    -[NCNotificationSeamlessContentView sizeThatFits:](notificationContentView, "sizeThatFits:", width, 1.79769313e308);
    if (v8 - v10 >= 0.0)
      v8 = v8 - v10;
    else
      v8 = 0.0;
  }
  v11 = v6;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCExpandedPlatterView;
  -[NCExpandedPlatterView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[NCExpandedPlatterView adjustForContentSizeCategoryChange](self, "adjustForContentSizeCategoryChange");
}

- (NCBadgedIconView)badgedIconView
{
  return -[NCNotificationSeamlessContentView badgedIconView](self->_notificationContentView, "badgedIconView");
}

- (void)setBadgedIconView:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCExpandedPlatterView badgedIconView](self, "badgedIconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[NCExpandedPlatterView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NCNotificationSeamlessContentView setBadgedIconView:](self->_notificationContentView, "setBadgedIconView:", v6);
    -[NCExpandedPlatterView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)primaryText
{
  return -[NCNotificationSeamlessContentView primaryText](self->_notificationContentView, "primaryText");
}

- (void)setPrimaryText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCExpandedPlatterView primaryText](self, "primaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[NCExpandedPlatterView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    -[NCNotificationSeamlessContentView setPrimaryText:](self->_notificationContentView, "setPrimaryText:", v6);
    -[NCExpandedPlatterView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)primarySubtitleText
{
  return -[NCNotificationSeamlessContentView primarySubtitleText](self->_notificationContentView, "primarySubtitleText");
}

- (void)setPrimarySubtitleText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCExpandedPlatterView primarySubtitleText](self, "primarySubtitleText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[NCExpandedPlatterView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    -[NCNotificationSeamlessContentView setPrimarySubtitleText:](self->_notificationContentView, "setPrimarySubtitleText:", v6);
    -[NCExpandedPlatterView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSAttributedString)secondaryText
{
  return -[NCNotificationSeamlessContentView secondaryText](self->_notificationContentView, "secondaryText");
}

- (void)setSecondaryText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCExpandedPlatterView secondaryText](self, "secondaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[NCExpandedPlatterView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    -[NCNotificationSeamlessContentView setSecondaryText:](self->_notificationContentView, "setSecondaryText:", v6);
    -[NCExpandedPlatterView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)importantText
{
  return -[NCNotificationSeamlessContentView importantText](self->_notificationContentView, "importantText");
}

- (id)accessibilityIdentifier
{
  return CFSTR("notification-expanded-view");
}

- (void)setImportantText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCExpandedPlatterView importantText](self, "importantText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[NCExpandedPlatterView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    -[NCNotificationSeamlessContentView setImportantText:](self->_notificationContentView, "setImportantText:", v6);
    -[NCExpandedPlatterView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSAttributedString)importantAttributedText
{
  return -[NCNotificationSeamlessContentView importantAttributedText](self->_notificationContentView, "importantAttributedText");
}

- (void)setImportantAttributedText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCExpandedPlatterView importantAttributedText](self, "importantAttributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[NCExpandedPlatterView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    -[NCNotificationSeamlessContentView setImportantAttributedText:](self->_notificationContentView, "setImportantAttributedText:", v6);
    -[NCExpandedPlatterView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIImageConfiguration)importantTextImageConfiguration
{
  return -[NCNotificationSeamlessContentView importantTextImageConfiguration](self->_notificationContentView, "importantTextImageConfiguration");
}

- (MTVisualStylingProvider)importantTextVisualStylingProvider
{
  return -[NCNotificationSeamlessContentView importantTextVisualStylingProvider](self->_notificationContentView, "importantTextVisualStylingProvider");
}

- (void)setImportantTextVisualStylingProvider:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCExpandedPlatterView importantTextVisualStylingProvider](self, "importantTextVisualStylingProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[NCExpandedPlatterView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    -[NCNotificationSeamlessContentView setImportantTextVisualStylingProvider:](self->_notificationContentView, "setImportantTextVisualStylingProvider:", v6);
    -[NCExpandedPlatterView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (NSString)footerText
{
  return -[NCNotificationSeamlessContentView footerText](self->_notificationContentView, "footerText");
}

- (void)setFooterText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCExpandedPlatterView footerText](self, "footerText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[NCExpandedPlatterView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    -[NCNotificationSeamlessContentView setFooterText:](self->_notificationContentView, "setFooterText:", v6);
    -[NCExpandedPlatterView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSDate)date
{
  return -[NCNotificationSeamlessContentView date](self->_notificationContentView, "date");
}

- (void)setDate:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCExpandedPlatterView date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[NCExpandedPlatterView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    -[NCNotificationSeamlessContentView setDate:](self->_notificationContentView, "setDate:", v6);
    -[NCExpandedPlatterView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (BOOL)isDateAllDay
{
  return -[NCNotificationSeamlessContentView isDateAllDay](self->_notificationContentView, "isDateAllDay");
}

- (void)setDateAllDay:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[NCExpandedPlatterView isDateAllDay](self, "isDateAllDay") != a3)
  {
    -[NCExpandedPlatterView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    -[NCNotificationSeamlessContentView setDateAllDay:](self->_notificationContentView, "setDateAllDay:", v3);
    -[NCExpandedPlatterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSTimeZone)timeZone
{
  return -[NCNotificationSeamlessContentView timeZone](self->_notificationContentView, "timeZone");
}

- (void)setTimeZone:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCExpandedPlatterView timeZone](self, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[NCExpandedPlatterView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    -[NCNotificationSeamlessContentView setTimeZone:](self->_notificationContentView, "setTimeZone:", v6);
    -[NCExpandedPlatterView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (int64_t)dateFormatStyle
{
  return -[NCNotificationSeamlessContentView dateFormatStyle](self->_notificationContentView, "dateFormatStyle");
}

- (void)setDateFormatStyle:(int64_t)a3
{
  if (-[NCExpandedPlatterView dateFormatStyle](self, "dateFormatStyle") != a3)
  {
    -[NCExpandedPlatterView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    -[NCNotificationSeamlessContentView setDateFormatStyle:](self->_notificationContentView, "setDateFormatStyle:", a3);
    -[NCExpandedPlatterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)hideDate
{
  return -[NCNotificationSeamlessContentView hideDate](self->_notificationContentView, "hideDate");
}

- (void)setHideDate:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[NCExpandedPlatterView hideDate](self, "hideDate") != a3)
  {
    -[NCNotificationSeamlessContentView setHideDate:](self->_notificationContentView, "setHideDate:", v3);
    -[NCExpandedPlatterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)screenCaptureProhibited
{
  return -[NCNotificationSeamlessContentView screenCaptureProhibited](self->_notificationContentView, "screenCaptureProhibited");
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[NCExpandedPlatterView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
  -[NCNotificationSeamlessContentView setScreenCaptureProhibited:](self->_notificationContentView, "setScreenCaptureProhibited:", v3);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  objc_super v4;

  -[NCExpandedPlatterView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
  if (-[NCNotificationSeamlessContentView adjustsFontForContentSizeCategory](self->_notificationContentView, "adjustsFontForContentSizeCategory"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)NCExpandedPlatterView;
  return -[PLExpandedPlatterView adjustsFontForContentSizeCategory](&v4, sel_adjustsFontForContentSizeCategory);
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NCExpandedPlatterView;
  -[PLExpandedPlatterView setAdjustsFontForContentSizeCategory:](&v5, sel_setAdjustsFontForContentSizeCategory_);
  -[NCExpandedPlatterView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
  -[NCNotificationSeamlessContentView setAdjustsFontForContentSizeCategory:](self->_notificationContentView, "setAdjustsFontForContentSizeCategory:", v3);
}

- (BOOL)adjustForContentSizeCategoryChange
{
  unsigned int v3;
  int v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCExpandedPlatterView;
  v3 = -[PLExpandedPlatterView adjustForContentSizeCategoryChange](&v6, sel_adjustForContentSizeCategoryChange);
  v4 = -[NCNotificationSeamlessContentView adjustForContentSizeCategoryChange](self->_notificationContentView, "adjustForContentSizeCategoryChange") | v3;
  if (v4 == 1)
    -[NCExpandedPlatterView setNeedsLayout](self, "setNeedsLayout");
  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return self->_defaultTapGestureRecognizer != a3
      || -[NCExpandedPlatterView _tapGestureRecognizerShouldReceiveTouch:](self, "_tapGestureRecognizerShouldReceiveTouch:", a4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  NCExpandedPlatterView *v5;
  void *v6;

  if (self->_defaultTapGestureRecognizer != a3)
    return 0;
  v5 = self;
  objc_msgSend(a4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v6, "isDescendantOfView:", v5->_notificationContentView);

  return (char)v5;
}

- (void)notificationSeamlessContentView:(id)a3 requestsInteractionWithURL:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[PLExpandedPlatterView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "expandedPlatterView:requestsInteractionWithURL:", self, v6);

}

- (void)_configureNotificationContentViewIfNecessary
{
  NCNotificationSeamlessContentView *v3;
  NCNotificationSeamlessContentView *notificationContentView;
  id v5;

  if (!self->_notificationContentView && !self->_hidesNotificationContent)
  {
    -[PLExpandedPlatterView _configureMainContentViewIfNecessary](self, "_configureMainContentViewIfNecessary");
    v3 = objc_alloc_init(NCNotificationSeamlessContentView);
    notificationContentView = self->_notificationContentView;
    self->_notificationContentView = v3;

    -[NCNotificationSeamlessContentView setDelegate:](self->_notificationContentView, "setDelegate:", self);
    -[NCNotificationSeamlessContentView setURLInteractionEnabled:](self->_notificationContentView, "setURLInteractionEnabled:", 1);
    -[NCNotificationSeamlessContentView setTextMenusEnabled:](self->_notificationContentView, "setTextMenusEnabled:", 1);
    -[PLExpandedPlatterView _mainContentView](self, "_mainContentView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", self->_notificationContentView);

  }
}

- (void)_layoutNotificationContentView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NCNotificationSeamlessContentView *notificationContentView;

  if (self->_notificationContentView)
  {
    -[PLExpandedPlatterView _layoutMainContentViewIfNecessary](self, "_layoutMainContentViewIfNecessary");
    -[PLExpandedPlatterView _mainContentView](self, "_mainContentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v5 = v4;
    v7 = v6;

    -[NCNotificationSeamlessContentView sizeThatFits:](self->_notificationContentView, "sizeThatFits:", v5, v7);
    BSRectWithSize();
    notificationContentView = self->_notificationContentView;
    UIRectIntegralWithScale();
    -[NCNotificationSeamlessContentView setFrame:](notificationContentView, "setFrame:");
  }
}

- (void)_configureDefaultTapGestureRecognizerIfNecessary
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *defaultTapGestureRecognizer;

  if (!self->_defaultTapGestureRecognizer)
  {
    v3 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3D80]);
    defaultTapGestureRecognizer = self->_defaultTapGestureRecognizer;
    self->_defaultTapGestureRecognizer = v3;

    -[UITapGestureRecognizer setDelegate:](self->_defaultTapGestureRecognizer, "setDelegate:", self);
    -[NCExpandedPlatterView addGestureRecognizer:](self, "addGestureRecognizer:", self->_defaultTapGestureRecognizer);
  }
}

- (void)_layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)NCExpandedPlatterView;
  -[PLExpandedPlatterView layoutSubviews](&v15, sel_layoutSubviews);
  -[NCExpandedPlatterView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
  if (!self->_hidesNotificationContent)
  {
    -[NCExpandedPlatterView _layoutNotificationContentView](self, "_layoutNotificationContentView");
    -[NCNotificationSeamlessContentView frame](self->_notificationContentView, "frame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[PLExpandedPlatterView customContentView](self, "customContentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");

    v16.origin.x = v4;
    v16.origin.y = v6;
    v16.size.width = v8;
    v16.size.height = v10;
    CGRectGetHeight(v16);
    -[PLExpandedPlatterView customContentView](self, "customContentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    UIRectIntegralWithScale();
    objc_msgSend(v12, "setFrame:");

  }
  if (self->_scrollViewPinnedToBottom)
  {
    -[PLExpandedPlatterView scrollView](self, "scrollView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentSize");
    -[NCExpandedPlatterView frame](self, "frame");
    CGRectGetHeight(v17);
    UICeilToScale();
    objc_msgSend(v13, "setContentOffset:", 0.0, v14);

  }
}

- (BOOL)_tapGestureRecognizerShouldReceiveTouch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLExpandedPlatterView _mainContentView](self, "_mainContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isDescendantOfView:", v6);

  -[PLExpandedPlatterView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = objc_msgSend(v8, "expandedPlatterView:tapGestureRecognizerShouldReceiveTouch:", self, v4);
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSArray)menuActions
{
  return self->_menuActions;
}

- (void)setMenuActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 592);
}

- (BOOL)hidesNotificationContent
{
  return self->_hidesNotificationContent;
}

- (BOOL)isScrollViewPinnedToBottom
{
  return self->_scrollViewPinnedToBottom;
}

- (void)setScrollViewPinnedToBottom:(BOOL)a3
{
  self->_scrollViewPinnedToBottom = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuActions, 0);
  objc_storeStrong((id *)&self->_defaultTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_notificationContentView, 0);
}

@end
