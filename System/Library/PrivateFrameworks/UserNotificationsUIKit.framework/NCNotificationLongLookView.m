@implementation NCNotificationLongLookView

- (UITapGestureRecognizer)lookViewTapGestureRecognizer
{
  -[NCNotificationLongLookView _configureLookViewTapGestureRecognizerIfNecessary](self, "_configureLookViewTapGestureRecognizerIfNecessary");
  return self->_lookViewTapGestureRecognizer;
}

- (void)setCustomContentLocation:(unint64_t)a3
{
  if (self->_customContentLocation != a3)
  {
    self->_customContentLocation = a3;
    -[NCNotificationLongLookView _updateTopMargin](self, "_updateTopMargin");
    -[NCNotificationLongLookView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCustomContentSize:(CGSize)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationLongLookView;
  -[PLExpandedPlatterView setCustomContentSize:](&v4, sel_setCustomContentSize_, a3.width, a3.height);
  -[NCNotificationLongLookView _updateTopMargin](self, "_updateTopMargin");
}

- (void)_updateTopMargin
{
  double v3;
  unint64_t customContentLocation;
  uint64_t v5;

  -[PLExpandedPlatterView customContentSize](self, "customContentSize");
  if (fabs(v3) >= 2.22044605e-16)
  {
    customContentLocation = self->_customContentLocation;
    if (!customContentLocation)
    {
      v5 = 0;
      goto LABEL_6;
    }
    if (customContentLocation != 1)
      return;
  }
  v5 = 1;
LABEL_6:
  -[NCNotificationContentView setUseSmallTopMargin:](self->_notificationContentView, "setUseSmallTopMargin:", v5);
}

- (void)setHidesNotificationContent:(BOOL)a3
{
  NCNotificationContentView *notificationContentView;
  void *v5;

  if (self->_hidesNotificationContent != a3)
  {
    self->_hidesNotificationContent = a3;
    if (a3)
    {
      -[NCNotificationContentView removeFromSuperview](self->_notificationContentView, "removeFromSuperview");
      notificationContentView = self->_notificationContentView;
      self->_notificationContentView = 0;

    }
    -[PLExpandedPlatterView _mainContentView](self, "_mainContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

    -[NCNotificationLongLookView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)primaryText
{
  return -[NCNotificationContentView primaryText](self->_notificationContentView, "primaryText");
}

- (void)setPrimaryText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCNotificationContentView primaryText](self->_notificationContentView, "primaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[NCNotificationLongLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    -[NCNotificationContentView setPrimaryText:](self->_notificationContentView, "setPrimaryText:", v6);
  }

}

- (NSString)primarySubtitleText
{
  return -[NCNotificationContentView primarySubtitleText](self->_notificationContentView, "primarySubtitleText");
}

- (void)setPrimarySubtitleText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCNotificationContentView primarySubtitleText](self->_notificationContentView, "primarySubtitleText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[NCNotificationLongLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    -[NCNotificationContentView setPrimarySubtitleText:](self->_notificationContentView, "setPrimarySubtitleText:", v6);
  }

}

- (NSAttributedString)secondaryText
{
  return -[NCNotificationContentView secondaryText](self->_notificationContentView, "secondaryText");
}

- (void)setSecondaryText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCNotificationContentView secondaryText](self->_notificationContentView, "secondaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[NCNotificationLongLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    -[NCNotificationContentView setSecondaryText:](self->_notificationContentView, "setSecondaryText:", v6);
  }

}

- (void)setContentSummaryText:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[NCNotificationContentView setContentSummaryText:](self->_notificationContentView, "setContentSummaryText:", v4);

}

- (NSAttributedString)contentSummaryText
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NCNotificationContentView contentSummaryText](self->_notificationContentView, "contentSummaryText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSAttributedString *)v3;
}

- (BOOL)screenCaptureProhibited
{
  return -[NCNotificationContentView screenCaptureProhibited](self->_notificationContentView, "screenCaptureProhibited");
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[PLExpandedPlatterView _configureMainContentViewIfNecessary](self, "_configureMainContentViewIfNecessary");
  -[NCNotificationContentView setScreenCaptureProhibited:](self->_notificationContentView, "setScreenCaptureProhibited:", v3);
}

- (BOOL)hideDate
{
  return -[NCNotificationContentView hideDate](self->_notificationContentView, "hideDate");
}

- (void)setHideDate:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[PLExpandedPlatterView _configureMainContentViewIfNecessary](self, "_configureMainContentViewIfNecessary");
  -[NCNotificationContentView setHideDate:](self->_notificationContentView, "setHideDate:", v3);
}

- (CGSize)_contentSizeThatFitsContentWithSizeExcludingActions:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationLongLookView;
  -[PLExpandedPlatterView _contentSizeThatFitsContentWithSizeExcludingActions:](&v12, sel__contentSizeThatFitsContentWithSizeExcludingActions_, a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  if (!self->_hidesNotificationContent)
  {
    -[NCNotificationLongLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
    -[NCNotificationContentView sizeThatFits:](self->_notificationContentView, "sizeThatFits:", width, 0.0);
    v8 = v8 + v9;
  }
  v10 = v6;
  v11 = v8;
  result.height = v11;
  result.width = v10;
  return result;
}

- (int64_t)lookStyle
{
  return 1;
}

- (void)_configureCustomContentView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationLongLookView;
  -[PLExpandedPlatterView _configureCustomContentView](&v4, sel__configureCustomContentView);
  if (!self->_hidesNotificationContent && self->_customContentLocation != 1)
  {
    -[PLExpandedPlatterView customContentView](self, "customContentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setContinuousCornerRadius:", 0.0);

  }
}

- (void)_configureNotificationContentViewIfNecessary
{
  NCNotificationContentView *v3;
  NCNotificationContentView *notificationContentView;
  void *v5;
  NCNotificationContentView *v6;
  void *v7;
  id v8;

  if (!self->_notificationContentView && !self->_hidesNotificationContent)
  {
    -[PLExpandedPlatterView _configureMainContentViewIfNecessary](self, "_configureMainContentViewIfNecessary");
    v3 = -[NCNotificationContentView initWithStyle:]([NCNotificationContentView alloc], "initWithStyle:", -[NCNotificationLongLookView lookStyle](self, "lookStyle"));
    notificationContentView = self->_notificationContentView;
    self->_notificationContentView = v3;

    -[NCNotificationContentView setDelegate:](self->_notificationContentView, "setDelegate:", self);
    -[NCNotificationContentView layer](self->_notificationContentView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMaskedCorners:", 12);

    -[NCNotificationContentView _setContinuousCornerRadius:](self->_notificationContentView, "_setContinuousCornerRadius:", 13.0);
    v6 = self->_notificationContentView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationContentView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[PLExpandedPlatterView _mainContentView](self, "_mainContentView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_notificationContentView);

  }
}

- (void)_configureLookViewTapGestureRecognizerIfNecessary
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *lookViewTapGestureRecognizer;

  if (!self->_lookViewTapGestureRecognizer)
  {
    v3 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3D80]);
    lookViewTapGestureRecognizer = self->_lookViewTapGestureRecognizer;
    self->_lookViewTapGestureRecognizer = v3;

    -[UITapGestureRecognizer setDelegate:](self->_lookViewTapGestureRecognizer, "setDelegate:", self);
    -[NCNotificationLongLookView addGestureRecognizer:](self, "addGestureRecognizer:", self->_lookViewTapGestureRecognizer);
  }
}

- (CGRect)_actionsViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect result;

  v9.receiver = self;
  v9.super_class = (Class)NCNotificationLongLookView;
  -[PLExpandedPlatterView _actionsViewFrame](&v9, sel__actionsViewFrame);
  if (!self->_hidesNotificationContent)
  {
    -[NCNotificationLongLookView bounds](self, "bounds");
    -[PLExpandedPlatterView contentSizeForSize:](self, "contentSizeForSize:", v3, v4);
    -[NCNotificationContentView sizeThatFits:](self->_notificationContentView, "sizeThatFits:");
  }
  _NCMainScreenScale();
  UIRectIntegralWithScale();
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
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
  v16.super_class = (Class)NCNotificationLongLookView;
  -[PLExpandedPlatterView _mainContentViewFrame](&v16, sel__mainContentViewFrame);
  v6 = v5;
  v8 = v7;
  v9 = v3;
  v10 = v4;
  if (!self->_hidesNotificationContent)
  {
    -[NCNotificationContentView sizeThatFits:](self->_notificationContentView, "sizeThatFits:", v3, v4);
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
  v12.super_class = (Class)NCNotificationLongLookView;
  -[PLExpandedPlatterView _contentViewSize](&v12, sel__contentViewSize);
  v4 = v3;
  v6 = v5;
  if (!self->_hidesNotificationContent)
  {
    -[NCNotificationLongLookView bounds](self, "bounds");
    -[PLExpandedPlatterView contentSizeForSize:](self, "contentSizeForSize:", v7, v8);
    -[NCNotificationContentView sizeThatFits:](self->_notificationContentView, "sizeThatFits:");
    v6 = v6 + v9;
  }
  v10 = v4;
  v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_layoutNotificationContentView
{
  void *v3;
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
  CGFloat v15;
  NCNotificationContentView *notificationContentView;
  CGRect v17;

  if (self->_notificationContentView)
  {
    -[PLExpandedPlatterView _layoutMainContentViewIfNecessary](self, "_layoutMainContentViewIfNecessary");
    -[PLExpandedPlatterView _mainContentView](self, "_mainContentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v5 = v4;
    v7 = v6;

    -[NCNotificationContentView sizeThatFits:](self->_notificationContentView, "sizeThatFits:", v5, v7);
    BSRectWithSize();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    if (-[PLExpandedPlatterView clipsVisibleContentToBounds](self, "clipsVisibleContentToBounds"))
    {
      v17.origin.x = v9;
      v17.origin.y = v11;
      v17.size.width = v13;
      v17.size.height = v15;
      CGRectGetHeight(v17);
      -[NCNotificationLongLookView bounds](self, "bounds");
      -[PLExpandedPlatterView _flexibleAreaSizeForBounds:](self, "_flexibleAreaSizeForBounds:");
    }
    notificationContentView = self->_notificationContentView;
    _NCMainScreenScale();
    UIRectIntegralWithScale();
    -[NCNotificationContentView setFrame:](notificationContentView, "setFrame:");
  }
}

- (void)_layoutCustomContentView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NCNotificationLongLookView;
  -[PLExpandedPlatterView _layoutCustomContentView](&v9, sel__layoutCustomContentView);
  if (!self->_hidesNotificationContent && self->_notificationContentView)
  {
    if (-[PLExpandedPlatterView clipsVisibleContentToBounds](self, "clipsVisibleContentToBounds"))
    {
      -[PLExpandedPlatterView _layoutMainContentViewIfNecessary](self, "_layoutMainContentViewIfNecessary");
      -[PLExpandedPlatterView _mainContentView](self, "_mainContentView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "frame");
      v5 = v4;
      v7 = v6;

      -[NCNotificationContentView sizeThatFits:](self->_notificationContentView, "sizeThatFits:", v5, v7);
      -[NCNotificationLongLookView bounds](self, "bounds");
      -[PLExpandedPlatterView _flexibleAreaSizeForBounds:](self, "_flexibleAreaSizeForBounds:");
      -[PLExpandedPlatterView customContentView](self, "customContentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "frame");
      objc_msgSend(v8, "setFrame:");

    }
  }
}

- (void)_layoutCustomContentViewInRelationToContentView
{
  double v3;
  unint64_t customContentLocation;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;

  -[PLExpandedPlatterView customContentSize](self, "customContentSize");
  if (fabs(v3) >= 2.22044605e-16)
  {
    customContentLocation = self->_customContentLocation;
    if (customContentLocation == 1)
    {
      -[NCNotificationContentView frame](self->_notificationContentView, "frame");
      v17 = v16;
      -[PLExpandedPlatterView customContentView](self, "customContentView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "frame");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;

      -[PLExpandedPlatterView customContentView](self, "customContentView");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setFrame:", v20, v17 + v22, v24, v26);

    }
    else if (!customContentLocation)
    {
      -[NCNotificationContentView frame](self->_notificationContentView, "frame");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;
      -[PLExpandedPlatterView customContentView](self, "customContentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "frame");
      v15 = v14;

      -[NCNotificationContentView setFrame:](self->_notificationContentView, "setFrame:", v6, v8 + v15, v10, v12);
    }
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationLongLookView;
  -[PLExpandedPlatterView layoutSubviews](&v3, sel_layoutSubviews);
  -[NCNotificationLongLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
  if (!self->_hidesNotificationContent)
  {
    -[NCNotificationLongLookView _layoutNotificationContentView](self, "_layoutNotificationContentView");
    -[NCNotificationLongLookView _layoutCustomContentViewInRelationToContentView](self, "_layoutCustomContentViewInRelationToContentView");
  }
}

- (BOOL)_lookViewTapGestureRecognizerShouldReceiveTouch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLExpandedPlatterView _headerContentView](self, "_headerContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isDescendantOfView:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[PLExpandedPlatterView _mainContentView](self, "_mainContentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isDescendantOfView:", v8);

  }
  -[PLExpandedPlatterView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = objc_msgSend(v9, "notificationLongLookView:tapGestureRecognizerShouldReceiveTouch:", self, v4);
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)maximumNumberOfPrimaryTextLines
{
  return -[NCNotificationContentView maximumNumberOfPrimaryTextLines](self->_notificationContentView, "maximumNumberOfPrimaryTextLines");
}

- (void)setMaximumNumberOfPrimaryTextLines:(unint64_t)a3
{
  -[NCNotificationLongLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
  -[NCNotificationContentView setMaximumNumberOfPrimaryTextLines:](self->_notificationContentView, "setMaximumNumberOfPrimaryTextLines:", a3);
}

- (unint64_t)maximumNumberOfPrimaryLargeTextLines
{
  return -[NCNotificationContentView maximumNumberOfPrimaryLargeTextLines](self->_notificationContentView, "maximumNumberOfPrimaryLargeTextLines");
}

- (void)setMaximumNumberOfPrimaryLargeTextLines:(unint64_t)a3
{
  -[NCNotificationLongLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
  -[NCNotificationContentView setMaximumNumberOfPrimaryLargeTextLines:](self->_notificationContentView, "setMaximumNumberOfPrimaryLargeTextLines:", a3);
}

- (unint64_t)maximumNumberOfSecondaryTextLines
{
  return -[NCNotificationContentView secondaryTextMaximumNumberOfLines](self->_notificationContentView, "secondaryTextMaximumNumberOfLines");
}

- (void)setMaximumNumberOfSecondaryTextLines:(unint64_t)a3
{
  -[NCNotificationLongLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
  -[NCNotificationContentView setSecondaryTextMaximumNumberOfLines:](self->_notificationContentView, "setSecondaryTextMaximumNumberOfLines:", a3);
}

- (unint64_t)maximumNumberOfSecondaryLargeTextLines
{
  return -[NCNotificationContentView maximumNumberOfSecondaryLargeTextLines](self->_notificationContentView, "maximumNumberOfSecondaryLargeTextLines");
}

- (void)setMaximumNumberOfSecondaryLargeTextLines:(unint64_t)a3
{
  -[NCNotificationLongLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
  -[NCNotificationContentView setMaximumNumberOfSecondaryLargeTextLines:](self->_notificationContentView, "setMaximumNumberOfSecondaryLargeTextLines:", a3);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return self->_lookViewTapGestureRecognizer != a3
      || -[NCNotificationLongLookView _lookViewTapGestureRecognizerShouldReceiveTouch:](self, "_lookViewTapGestureRecognizerShouldReceiveTouch:", a4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  NCNotificationLongLookView *v5;
  void *v6;

  if (self->_lookViewTapGestureRecognizer != a3)
    return 0;
  v5 = self;
  objc_msgSend(a4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v6, "isDescendantOfView:", v5->_notificationContentView);

  return (char)v5;
}

- (double)backgroundAlpha
{
  return 1.0;
}

- (void)notificationContentView:(id)a3 willInteractWithURL:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[PLExpandedPlatterView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "notificationLongLookView:willInteractWithURL:", self, v6);

}

- (BOOL)adjustsFontForContentSizeCategory
{
  objc_super v4;

  -[NCNotificationLongLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
  if (-[NCNotificationContentView adjustsFontForContentSizeCategory](self->_notificationContentView, "adjustsFontForContentSizeCategory"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationLongLookView;
  return -[PLExpandedPlatterView adjustsFontForContentSizeCategory](&v4, sel_adjustsFontForContentSizeCategory);
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationLongLookView;
  -[PLExpandedPlatterView setAdjustsFontForContentSizeCategory:](&v5, sel_setAdjustsFontForContentSizeCategory_);
  -[NCNotificationLongLookView _configureNotificationContentViewIfNecessary](self, "_configureNotificationContentViewIfNecessary");
  -[NCNotificationContentView setAdjustsFontForContentSizeCategory:](self->_notificationContentView, "setAdjustsFontForContentSizeCategory:", v3);
}

- (BOOL)adjustForContentSizeCategoryChange
{
  unsigned int v3;
  int v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationLongLookView;
  v3 = -[PLExpandedPlatterView adjustForContentSizeCategoryChange](&v6, sel_adjustForContentSizeCategoryChange);
  v4 = -[NCNotificationContentView adjustForContentSizeCategoryChange](self->_notificationContentView, "adjustForContentSizeCategoryChange") | v3;
  if (v4 == 1)
    -[NCNotificationLongLookView setNeedsLayout](self, "setNeedsLayout");
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationLongLookView;
  -[NCNotificationLongLookView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[NCNotificationLongLookView adjustForContentSizeCategoryChange](self, "adjustForContentSizeCategoryChange");
}

- (unint64_t)customContentLocation
{
  return self->_customContentLocation;
}

- (BOOL)hidesNotificationContent
{
  return self->_hidesNotificationContent;
}

- (BOOL)disableDimming
{
  return self->_disableDimming;
}

- (void)setDisableDimming:(BOOL)a3
{
  self->_disableDimming = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookViewTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_notificationContentView, 0);
}

@end
