@implementation NCFullScreenStagingBannerView

- (NCFullScreenStagingBannerView)initWithSettings:(id)a3
{
  id v4;
  NCFullScreenStagingBannerView *v5;
  uint64_t v6;
  NCUNUIKitPrototypeSettings *settings;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NCFullScreenStagingBannerView;
  v5 = -[NCFullScreenStagingBannerView init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    settings = v5->_settings;
    v5->_settings = (NCUNUIKitPrototypeSettings *)v6;

    -[NCFullScreenStagingBannerView layer](v5, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHitTestsAsOpaque:", 1);

    -[NCFullScreenStagingBannerView _configureTapGestureIfNecessary](v5, "_configureTapGestureIfNecessary");
  }

  return v5;
}

- (void)setStaticContentProvider:(id)a3
{
  NCNotificationStaticContentProviding **p_staticContentProvider;
  id v5;

  p_staticContentProvider = &self->_staticContentProvider;
  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_staticContentProvider, a3);

}

- (void)setStage:(int64_t)a3
{
  -[NCFullScreenStagingBannerView transitionToStage:completion:](self, "transitionToStage:completion:", a3, 0);
}

- (void)transitionToStage:(int64_t)a3 completion:(id)a4
{
  if (self->_stage < a3)
  {
    self->_stage = a3;
    -[NCFullScreenStagingBannerView _transitionToStage:fromStage:settings:completion:](self, "_transitionToStage:fromStage:settings:completion:");
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  NCFullScreenStagingBannerView *v5;
  void *v6;
  NCFullScreenStagingBannerView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NCFullScreenStagingBannerView;
  -[NCFullScreenStagingBannerView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (NCFullScreenStagingBannerView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    -[NCFullScreenStagingBannerView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "allowsHitTesting"))
      v7 = self;
    else
      v7 = 0;
    v5 = v7;

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  UIView *contentHitRectView;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCFullScreenStagingBannerView;
  -[NCFullScreenStagingBannerView layoutSubviews](&v8, sel_layoutSubviews);
  if (-[NCUNUIKitPrototypeSettings isContentHitRectVisible](self->_settings, "isContentHitRectVisible"))
  {
    if (self->_stage >= 1)
    {
      -[NCFullScreenStagingBannerView _configureContentHitRectViewIfNecessary](self, "_configureContentHitRectViewIfNecessary");
      objc_initWeak(&location, self);
      v3 = (void *)MEMORY[0x1E0DC3F10];
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __47__NCFullScreenStagingBannerView_layoutSubviews__block_invoke;
      v5[3] = &unk_1E8D1B278;
      objc_copyWeak(&v6, &location);
      objc_msgSend(v3, "_animateUsingSpringInteractive:animations:completion:", 0, v5, 0);
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[UIView removeFromSuperview](self->_contentHitRectView, "removeFromSuperview");
    contentHitRectView = self->_contentHitRectView;
    self->_contentHitRectView = 0;

  }
}

void __47__NCFullScreenStagingBannerView_layoutSubviews__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_layoutContentHitRectViewForActiveStage");
    objc_msgSend(v2[67], "setAlpha:", 1.0);
    WeakRetained = v2;
  }

}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1E8D5FD48;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  MTVisualStylingProvider *v6;
  MTVisualStylingProvider *strokeVisualStylingProvider;
  MTVisualStylingProvider *v8;
  MTVisualStylingProvider *v9;
  MTVisualStylingProvider *v10;
  MTVisualStylingProvider *v11;

  v6 = (MTVisualStylingProvider *)a3;
  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider != v6)
  {
    v11 = v6;
    v8 = v6;
    v9 = self->_strokeVisualStylingProvider;
    self->_strokeVisualStylingProvider = v8;
    v10 = strokeVisualStylingProvider;

    -[NCFullScreenStagingBannerView _visualStylingProviderDidChange:forCategory:outgoingProvider:](self, "_visualStylingProviderDidChange:forCategory:outgoingProvider:", self->_strokeVisualStylingProvider, a4, v10);
    v6 = v11;
  }

}

- (void)dateLabelDidChange:(id)a3
{
  UILabel *dateLabel;
  void *v5;
  id v6;

  dateLabel = self->_dateLabel;
  -[BSUIDateLabel text](self->_referenceDateLabel, "text", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NCFullScreenStagingBannerView _composedDateStringWithDateString:staticContentProvider:](self, "_composedDateStringWithDateString:staticContentProvider:", v6, self->_staticContentProvider);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](dateLabel, "setAttributedText:", v5);

}

- (unint64_t)_detailLabelsNumberOfLines
{
  if (-[NCNotificationStaticContentProviding isNumberOfLinesInfinite](self->_staticContentProvider, "isNumberOfLinesInfinite"))return 0;
  else
    return 2;
}

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  id v9;
  id v10;

  if (a3)
  {
    v9 = a5;
    v10 = a3;
    objc_msgSend(a6, "stopAutomaticallyUpdatingView:", v10);
    objc_msgSend(v9, "automaticallyUpdateView:withStyle:", v10, a4);

  }
}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  -[NCFullScreenStagingBannerView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_briefSecondaryLabel, 2, a3, a5);
}

- (void)_setImportantTextVisualStylingProvider:(id)a3
{
  MTVisualStylingProvider *v4;
  MTVisualStylingProvider *importantTextVisualStylingProvider;
  MTVisualStylingProvider *v6;
  MTVisualStylingProvider *v7;
  MTVisualStylingProvider *v8;
  MTVisualStylingProvider *v9;

  v4 = (MTVisualStylingProvider *)a3;
  importantTextVisualStylingProvider = self->_importantTextVisualStylingProvider;
  if (importantTextVisualStylingProvider != v4)
  {
    v9 = v4;
    v6 = v4;
    v7 = self->_importantTextVisualStylingProvider;
    self->_importantTextVisualStylingProvider = v6;
    v8 = importantTextVisualStylingProvider;

    -[NCFullScreenStagingBannerView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_dateLabel, 1, self->_importantTextVisualStylingProvider, v8);
    v4 = v9;
  }

}

- (void)_configureGrabberViewIfNecessary
{
  PLGrabberView *v3;
  PLGrabberView *grabberView;

  if (!self->_grabberView)
  {
    v3 = (PLGrabberView *)objc_alloc_init(MEMORY[0x1E0D7D3C8]);
    grabberView = self->_grabberView;
    self->_grabberView = v3;

    -[NCFullScreenStagingBannerView addSubview:](self, "addSubview:", self->_grabberView);
  }
}

- (id)_briefPrimaryLabelViewFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "bsui_defaultFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0DC4AE8], 4);
}

- (void)_configureInitialViewsForBriefStage
{
  BSUIPartialStylingLabelView *v3;
  BSUIPartialStylingLabelView *briefPrimaryLabelView;
  BSUIPartialStylingLabelView *v5;
  void *v6;
  void *v7;
  UILabel *v8;
  UILabel *briefSecondaryLabel;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  -[NCFullScreenStagingBannerView _configureGrabberViewIfNecessary](self, "_configureGrabberViewIfNecessary");
  if (!self->_briefPrimaryLabelView)
  {
    v3 = (BSUIPartialStylingLabelView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01948]), "initWithTokenType:", 1);
    briefPrimaryLabelView = self->_briefPrimaryLabelView;
    self->_briefPrimaryLabelView = v3;

    -[BSUIPartialStylingLabelView setNumberOfLines:](self->_briefPrimaryLabelView, "setNumberOfLines:", 1);
    v5 = self->_briefPrimaryLabelView;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIPartialStylingLabelView setTextColor:](v5, "setTextColor:", v6);

    -[NCFullScreenStagingBannerView _briefPrimaryLabelViewFont](self, "_briefPrimaryLabelViewFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIPartialStylingLabelView setFont:](self->_briefPrimaryLabelView, "setFont:", v7);
    -[NCFullScreenStagingBannerView addSubview:](self, "addSubview:", self->_briefPrimaryLabelView);

  }
  if (!self->_briefSecondaryLabel)
  {
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    briefSecondaryLabel = self->_briefSecondaryLabel;
    self->_briefSecondaryLabel = v8;

    -[UILabel setNumberOfLines:](self->_briefSecondaryLabel, "setNumberOfLines:", 1);
    objc_msgSend(MEMORY[0x1E0DC1358], "defaultFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B58]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x1E0DC13C0];
    v17 = *MEMORY[0x1E0DC1458];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1438]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fontDescriptorByAddingAttributes:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = self->_briefSecondaryLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v14, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v15, "setFont:", v16);

    -[NCFullScreenStagingBannerView addSubview:](self, "addSubview:", self->_briefSecondaryLabel);
    -[NCFullScreenStagingBannerView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_briefSecondaryLabel, 2, self->_strokeVisualStylingProvider, 0);

  }
}

- (id)_composedDateStringWithDateString:(id)a3 staticContentProvider:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  objc_msgSend(a4, "importantText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (objc_msgSend(v6, "length"))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    NCUserNotificationsUIKitFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("IMPORTANT_TEXT_FULLSCREEN_FORMAT"), &stru_1E8D21F60, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v10, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3498], "nc_safeAttributedStringWithString:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_configureDetailScrollViewIfNecessary
{
  UIScrollView *v3;
  UIScrollView *detailScrollView;

  if (!self->_detailScrollView)
  {
    v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
    detailScrollView = self->_detailScrollView;
    self->_detailScrollView = v3;

    -[UIScrollView setShowsVerticalScrollIndicator:](self->_detailScrollView, "setShowsVerticalScrollIndicator:", 1);
    -[UIScrollView setShowsHorizontalScrollIndicator:](self->_detailScrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[NCFullScreenStagingBannerView addSubview:](self, "addSubview:", self->_detailScrollView);
  }
}

- (void)_configureDateLabelIfNecessaryWithStaticContentProvider:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BSUIDateLabel *v10;
  BSUIDateLabel *referenceDateLabel;
  UILabel *v12;
  UILabel *dateLabel;
  UILabel *v14;
  void *v15;
  id v16;

  if (!self->_dateLabel)
  {
    v4 = (void *)MEMORY[0x1E0D01918];
    v5 = a3;
    objc_msgSend(v4, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "isDateAllDay");

    objc_msgSend(v6, "startLabelWithStartDate:endDate:timeZone:allDay:forStyle:", v7, 0, v8, v9, 1);
    v10 = (BSUIDateLabel *)objc_claimAutoreleasedReturnValue();
    referenceDateLabel = self->_referenceDateLabel;
    self->_referenceDateLabel = v10;

    -[BSUIDateLabel setDelegate:](self->_referenceDateLabel, "setDelegate:", self);
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    dateLabel = self->_dateLabel;
    self->_dateLabel = v12;

    -[UILabel setNumberOfLines:](self->_dateLabel, "setNumberOfLines:", 1);
    v14 = self->_dateLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v14, "setTextColor:", v15);

    objc_msgSend(MEMORY[0x1E0DC1350], "bsui_defaultFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0DC4B50], 4);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_dateLabel, "setFont:", v16);
    -[NCFullScreenStagingBannerView _configureDetailScrollViewIfNecessary](self, "_configureDetailScrollViewIfNecessary");
    -[UIScrollView addSubview:](self->_detailScrollView, "addSubview:", self->_dateLabel);
    -[NCFullScreenStagingBannerView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_dateLabel, 1, self->_importantTextVisualStylingProvider, 0);
    -[NCFullScreenStagingBannerView dateLabelDidChange:](self, "dateLabelDidChange:", self->_referenceDateLabel);

  }
}

- (void)_configureThumbnailViewIfNecessaryWithStaticContentProvider:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  UIImageView *v8;
  UIImageView *thumbnailView;
  id v10;

  v4 = a3;
  if (!self->_thumbnailView)
  {
    v10 = v4;
    objc_msgSend(v4, "thumbnail");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v10;
    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0DC3890]);
      objc_msgSend(v10, "thumbnail");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (UIImageView *)objc_msgSend(v6, "initWithImage:", v7);
      thumbnailView = self->_thumbnailView;
      self->_thumbnailView = v8;

      -[UIImageView _setContinuousCornerRadius:](self->_thumbnailView, "_setContinuousCornerRadius:", 20.0);
      -[UIImageView setClipsToBounds:](self->_thumbnailView, "setClipsToBounds:", 1);
      -[NCFullScreenStagingBannerView addSubview:](self, "addSubview:", self->_thumbnailView);
      v4 = v10;
    }
  }

}

- (void)_configureContentHitRectViewIfNecessary
{
  UIView *v3;
  UIView *contentHitRectView;
  UIView *v5;
  void *v6;
  void *v7;
  void *v8;

  if (!self->_contentHitRectView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    contentHitRectView = self->_contentHitRectView;
    self->_contentHitRectView = v3;

    v5 = self->_contentHitRectView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorWithAlphaComponent:", 0.25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v7);

    -[UIView layer](self->_contentHitRectView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsHitTesting:", 0);

    -[UIView setAlpha:](self->_contentHitRectView, "setAlpha:", 0.0);
    -[NCFullScreenStagingBannerView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_contentHitRectView, 0);
  }
}

- (void)_configureInitialViewsForDetailStage
{
  UILabel *v3;
  UILabel *detailPrimaryLabel;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  UILabel *detailSecondaryLabel;

  -[NCFullScreenStagingBannerView _configureDetailScrollViewIfNecessary](self, "_configureDetailScrollViewIfNecessary");
  if (!self->_detailPrimaryLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    detailPrimaryLabel = self->_detailPrimaryLabel;
    self->_detailPrimaryLabel = v3;

    -[UILabel setNumberOfLines:](self->_detailPrimaryLabel, "setNumberOfLines:", -[NCFullScreenStagingBannerView _detailLabelsNumberOfLines](self, "_detailLabelsNumberOfLines"));
    v5 = self->_detailPrimaryLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5, "setTextColor:", v6);

    v7 = self->_detailPrimaryLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 48.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    -[UIScrollView addSubview:](self->_detailScrollView, "addSubview:", self->_detailPrimaryLabel);
  }
  if (!self->_detailSecondaryLabel)
  {
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    detailSecondaryLabel = self->_detailSecondaryLabel;
    self->_detailSecondaryLabel = v9;

    -[UILabel setNumberOfLines:](self->_detailSecondaryLabel, "setNumberOfLines:", -[NCFullScreenStagingBannerView _detailLabelsNumberOfLines](self, "_detailLabelsNumberOfLines"));
    -[NCFullScreenStagingBannerView _configureDetailSecondaryLabel](self, "_configureDetailSecondaryLabel");
    -[UIScrollView addSubview:](self->_detailScrollView, "addSubview:", self->_detailSecondaryLabel);
  }
}

- (void)_configureDetailSecondaryLabel
{
  UILabel *detailSecondaryLabel;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  detailSecondaryLabel = self->_detailSecondaryLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](detailSecondaryLabel, "setTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC1358], "defaultFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4AE8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0DC13C0];
  v12 = *MEMORY[0x1E0DC1458];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1438]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptorByAddingAttributes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = self->_detailSecondaryLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v9, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v10, "setFont:", v11);

}

- (void)_configureInitialViewsForStage:(int64_t)a3
{
  if (a3 == 2)
  {
    -[NCFullScreenStagingBannerView _configureInitialViewsForDetailStage](self, "_configureInitialViewsForDetailStage");
  }
  else if (a3 == 1)
  {
    -[NCFullScreenStagingBannerView _configureInitialViewsForBriefStage](self, "_configureInitialViewsForBriefStage");
  }
}

- (void)_setBadgedIconView:(id)a3
{
  id v5;
  NCBadgedIconView **p_badgedIconView;
  uint64_t v7;
  NCBadgedIconView *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v5 = a3;
  p_badgedIconView = &self->_badgedIconView;
  if ((BSEqualObjects() & 1) == 0)
  {
    -[NCBadgedIconView removeFromSuperview](*p_badgedIconView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_badgedIconView, a3);
    if (*p_badgedIconView)
    {
      -[NCFullScreenStagingBannerView addSubview:](self, "addSubview:", v5);
      v7 = MEMORY[0x1E0C809B0];
      v8 = *p_badgedIconView;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __52__NCFullScreenStagingBannerView__setBadgedIconView___block_invoke;
      v10[3] = &unk_1E8D1B858;
      v10[4] = self;
      -[NCBadgedIconView setBadgeLayoutBlock:](v8, "setBadgeLayoutBlock:", v10);
      if (self->_stage >= 1)
      {
        v9[0] = v7;
        v9[1] = 3221225472;
        v9[2] = __52__NCFullScreenStagingBannerView__setBadgedIconView___block_invoke_2;
        v9[3] = &unk_1E8D1B568;
        v9[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v9);
      }
      -[NCFullScreenStagingBannerView addSubview:](self, "addSubview:", *p_badgedIconView);
    }
    -[NCFullScreenStagingBannerView setNeedsLayout](self, "setNeedsLayout");
  }

}

double __52__NCFullScreenStagingBannerView__setBadgedIconView___block_invoke(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  uint64_t v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double MinX;
  double v27;
  CGFloat MaxX;
  CGFloat v29;
  double v30;
  CGFloat v31;
  void *v32;
  double v33;
  double v34;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v11 = a2;
  BSRectWithSize();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "layoutDirection");

  v22 = a3;
  v23 = a4;
  v24 = a5;
  v25 = a6;
  if (v21 == 1)
  {
    MinX = CGRectGetMinX(*(CGRect *)&v22);
    v27 = -6.0;
  }
  else
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v22);
    v29 = v13;
    v30 = MaxX;
    v36.origin.x = v29;
    v36.origin.y = v15;
    v36.size.width = v17;
    v36.size.height = v19;
    MinX = v30 - CGRectGetWidth(v36);
    v27 = 6.0;
  }
  v31 = MinX + v27;
  v37.origin.x = a3;
  v37.origin.y = a4;
  v37.size.width = a5;
  v37.size.height = a6;
  CGRectGetMaxY(v37);
  v38.origin.x = v31;
  v38.origin.y = v15;
  v38.size.width = v17;
  v38.size.height = v19;
  CGRectGetHeight(v38);
  objc_msgSend(v11, "traitCollection");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "displayScale");
  UIRectRoundToScale();
  v34 = v33;

  return v34;
}

uint64_t __52__NCFullScreenStagingBannerView__setBadgedIconView___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layoutIfNeeded");
}

- (void)_updateWithStaticContentForStage:(int64_t)a3
{
  NCNotificationStaticContentProviding *staticContentProvider;
  NCNotificationStaticContentProviding *v6;
  NCNotificationStaticContentProviding *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  UILabel *detailPrimaryLabel;
  void *v31;
  BSUIPartialStylingLabelView *briefPrimaryLabelView;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  staticContentProvider = self->_staticContentProvider;
  if (a3 >= 2)
    v6 = staticContentProvider;
  else
    v6 = (NCNotificationStaticContentProviding *)-[NCNotificationStaticContentProviding copyWithContentHidingEnforcement:](staticContentProvider, "copyWithContentHidingEnforcement:", -1);
  v7 = v6;
  -[NCNotificationStaticContentProviding badgedIconView](v6, "badgedIconView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCFullScreenStagingBannerView _setBadgedIconView:](self, "_setBadgedIconView:", v8);

  -[NCNotificationStaticContentProviding contentSummaryText](v7, "contentSummaryText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel textColor](self->_briefSecondaryLabel, "textColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    _NCContentSummaryText(v9, 0, 0, (uint64_t)v10, 0);
  else
    -[NCNotificationStaticContentProviding secondaryText](v7, "secondaryText");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (a3 == 2)
  {
    -[NCNotificationStaticContentProviding importantTextVisualStylingProvider](v7, "importantTextVisualStylingProvider");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCFullScreenStagingBannerView _setImportantTextVisualStylingProvider:](self, "_setImportantTextVisualStylingProvider:", v29);

    -[NCFullScreenStagingBannerView _configureDateLabelIfNecessaryWithStaticContentProvider:](self, "_configureDateLabelIfNecessaryWithStaticContentProvider:", v7);
    -[NCFullScreenStagingBannerView _configureThumbnailViewIfNecessaryWithStaticContentProvider:](self, "_configureThumbnailViewIfNecessaryWithStaticContentProvider:", v7);
    detailPrimaryLabel = self->_detailPrimaryLabel;
    -[NCNotificationStaticContentProviding primaryText](v7, "primaryText");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](detailPrimaryLabel, "setText:", v31);

    -[UILabel setAttributedText:](self->_detailSecondaryLabel, "setAttributedText:", v12);
    -[NCFullScreenStagingBannerView _configureDetailSecondaryLabel](self, "_configureDetailSecondaryLabel");
  }
  else if (a3 == 1)
  {
    v33 = (void *)v11;
    v35 = v10;
    v13 = (void *)MEMORY[0x1E0DC3888];
    -[NCFullScreenStagingBannerView _briefPrimaryLabelViewFont](self, "_briefPrimaryLabelViewFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configurationWithFont:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v17;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configurationWithPaletteColors:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "configurationByApplyingConfiguration:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v34 = (void *)v21;
    -[NCNotificationStaticContentProviding importantAttributedTextWithImageConfiguration:importantAdornmentEligibleOptions:](v7, "importantAttributedTextWithImageConfiguration:importantAdornmentEligibleOptions:", v21, -1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "length"))
    {
      v23 = (void *)objc_msgSend(v22, "mutableCopy");
      v24 = objc_alloc(MEMORY[0x1E0CB3498]);
      v25 = (void *)MEMORY[0x1E0CB3940];
      -[NCNotificationStaticContentProviding primaryText](v7, "primaryText");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR(" %@"), v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v24, "initWithString:", v27);
      objc_msgSend(v23, "appendAttributedString:", v28);

      -[BSUIPartialStylingLabelView setAttributedText:](self->_briefPrimaryLabelView, "setAttributedText:", v23);
    }
    else
    {
      briefPrimaryLabelView = self->_briefPrimaryLabelView;
      -[NCNotificationStaticContentProviding primaryText](v7, "primaryText");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSUIPartialStylingLabelView setText:](briefPrimaryLabelView, "setText:", v23);
    }
    v12 = v33;

    -[UILabel setAttributedText:](self->_briefSecondaryLabel, "setAttributedText:", v33);
    v10 = v35;
  }

}

- (void)_prepareForTransitionToBriefStage
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  uint64_t v11;
  PLGrabberView *grabberView;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  NCBadgedIconView *badgedIconView;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  CGFloat v38;
  double MaxY;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat rect;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  uint64_t v64;
  CGAffineTransform v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  -[NCFullScreenStagingBannerView bounds](self, "bounds");
  v4 = v3;
  v62 = v3;
  v63 = v5;
  v7 = v6;
  v9 = v8;
  -[NCFullScreenStagingBannerView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayScale");
  v64 = v11;

  grabberView = self->_grabberView;
  -[NCFullScreenStagingBannerView bounds](self, "bounds");
  -[PLGrabberView sizeThatFitsContainerWithSize:](grabberView, "sizeThatFitsContainerWithSize:", v13, v14);
  BSRectWithSize();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v66.origin.x = v4;
  v66.origin.y = v7;
  v66.size.width = v9;
  v66.size.height = v63;
  CGRectGetMaxY(v66);
  v67.origin.x = v16;
  v67.origin.y = v18;
  v67.size.width = v20;
  v67.size.height = v22;
  CGRectGetHeight(v67);
  UIRectCenteredXInRectScale();
  -[PLGrabberView setFrame:](self->_grabberView, "setFrame:", v64);
  -[PLGrabberView setWeighting:](self->_grabberView, "setWeighting:", 0.0);
  BSRectWithSize();
  v68.origin.x = v62;
  v68.origin.y = v7;
  v68.size.width = v9;
  v68.size.height = v63;
  CGRectGetMaxY(v68);
  v23 = v9;
  UIRectCenteredXInRectScale();
  v59 = v25;
  v60 = v24;
  v57 = v27;
  v58 = v26;
  -[NCBadgedIconView setFrame:](self->_badgedIconView, "setFrame:", v64);
  badgedIconView = self->_badgedIconView;
  CGAffineTransformMakeScale(&v65, 0.8, 0.8);
  -[NCBadgedIconView setTransform:](badgedIconView, "setTransform:", &v65);
  -[NCBadgedIconView setAlpha:](self->_badgedIconView, "setAlpha:", 0.0);
  -[NCFullScreenStagingBannerView safeAreaInsets](self, "safeAreaInsets");
  v30 = v29;
  v32 = v31;
  v69.origin.x = v62;
  v69.origin.y = v7;
  v69.size.width = v23;
  v69.size.height = v63;
  v33 = CGRectGetWidth(v69) - v30 - v32;
  v70.origin.x = v62;
  v70.origin.y = v7;
  v70.size.width = v23;
  v70.size.height = v63;
  -[BSUIPartialStylingLabelView sizeThatFits:](self->_briefPrimaryLabelView, "sizeThatFits:", v33, CGRectGetHeight(v70));
  BSRectWithSize();
  v35 = v34;
  rect = v36;
  v38 = v37;
  v71.origin.y = v59;
  v71.origin.x = v60;
  v71.size.height = v57;
  v71.size.width = v58;
  MaxY = CGRectGetMaxY(v71);
  v72.origin.x = v62;
  v72.origin.y = v7;
  v72.size.width = v23;
  v72.size.height = v63;
  v40 = MaxY + CGRectGetHeight(v72) * 0.12553011;
  v73.origin.x = v35;
  v73.origin.y = v40;
  v73.size.width = rect;
  v73.size.height = v38;
  CGRectGetWidth(v73);
  v41 = v23;
  UIRectCenteredXInRectScale();
  v61 = v42;
  v44 = v43;
  v46 = v45;
  v48 = v47;
  -[BSUIPartialStylingLabelView setFrame:](self->_briefPrimaryLabelView, "setFrame:", v64);
  -[BSUIPartialStylingLabelView setAlpha:](self->_briefPrimaryLabelView, "setAlpha:", 0.0);
  v74.origin.x = v62;
  v74.origin.y = v7;
  v74.size.width = v41;
  v74.size.height = v63;
  -[UILabel sizeThatFits:](self->_briefSecondaryLabel, "sizeThatFits:", v33, CGRectGetHeight(v74));
  BSRectWithSize();
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v75.origin.x = v61;
  v75.origin.y = v44;
  v75.size.width = v46;
  v75.size.height = v48;
  v55 = CGRectGetMaxY(v75) + 2.0;
  v76.origin.x = v50;
  v76.origin.y = v55;
  v76.size.width = v52;
  v76.size.height = v54;
  CGRectGetWidth(v76);
  UIRectCenteredXInRectScale();
  -[UILabel setFrame:](self->_briefSecondaryLabel, "setFrame:", v64);
  -[UILabel setAlpha:](self->_briefSecondaryLabel, "setAlpha:", 0.0);
}

- (double)_detailTextMaxWidthForBounds:(CGRect)a3 thumbnailVisible:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v21;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NCFullScreenStagingBannerView safeAreaInsets](self, "safeAreaInsets");
  v11 = v10;
  v13 = v12;
  -[NCFullScreenStagingBannerView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "layoutDirection");

  if (v15 == 1)
    v16 = v11;
  else
    v16 = v13;
  if (v15 == 1)
    v17 = v13;
  else
    v17 = v11;
  if (v4)
    v18 = v16 + 118.0;
  else
    v18 = v16;
  v19 = v17 + 84.0 + 34.0;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  return CGRectGetWidth(v21) - v19 - v18;
}

- (void)_prepareForTransitionToDetailStage
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
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double Width;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  UIScrollView *detailScrollView;
  CGFloat v44;
  UILabel *dateLabel;
  UILabel *detailPrimaryLabel;
  UILabel *detailSecondaryLabel;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  UIImageView *thumbnailView;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat rect;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  -[NCFullScreenStagingBannerView bounds](self, "bounds");
  v4 = v3;
  v66 = v5;
  v67 = v3;
  v6 = v5;
  v8 = v7;
  v64 = v7;
  v65 = v9;
  v10 = v9;
  -[NCFullScreenStagingBannerView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");

  -[UIImageView image](self->_thumbnailView, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCFullScreenStagingBannerView traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "layoutDirection");

  -[NCFullScreenStagingBannerView _detailTextMaxWidthForBounds:thumbnailVisible:](self, "_detailTextMaxWidthForBounds:thumbnailVisible:", v12 != 0, v4, v6, v8, v10);
  v16 = v15;
  -[UILabel sizeThatFits:](self->_dateLabel, "sizeThatFits:");
  BSRectWithSize();
  v61 = v18;
  v62 = v17;
  v20 = v19;
  rect = v19;
  v22 = v21;
  -[UILabel sizeThatFits:](self->_detailPrimaryLabel, "sizeThatFits:", v16, 1.79769313e308);
  BSRectWithSize();
  v59 = v24;
  v60 = v23;
  v26 = v25;
  v57 = v25;
  v28 = v27;
  -[UILabel sizeThatFits:](self->_detailSecondaryLabel, "sizeThatFits:", v16, 1.79769313e308);
  BSRectWithSize();
  v30 = v29;
  v32 = v31;
  v58 = v31;
  v34 = v33;
  v36 = v35;
  v68.size.width = v61;
  v68.origin.x = v62;
  v68.origin.y = v20;
  v68.size.height = v22;
  Width = CGRectGetWidth(v68);
  v69.size.width = v59;
  v69.origin.x = v60;
  v69.origin.y = v26;
  v69.size.height = v28;
  v38 = CGRectGetWidth(v69);
  v70.origin.x = v30;
  v70.origin.y = v32;
  v70.size.width = v34;
  v70.size.height = v36;
  v39 = CGRectGetWidth(v70);
  if (Width >= v38)
    v40 = Width;
  else
    v40 = v38;
  if (v40 >= v39)
    v41 = v40;
  else
    v41 = v39;
  if (v14 == 1)
    v42 = 10.0;
  else
    v42 = 0.0;
  v71.origin.x = v42;
  v71.origin.y = rect;
  v71.size.width = v41;
  v71.size.height = v22;
  CGRectGetHeight(v71);
  v72.origin.x = v42;
  v72.origin.y = v57;
  v72.size.width = v41;
  v72.size.height = v28;
  CGRectGetHeight(v72);
  v73.origin.x = v42;
  v73.origin.y = v58;
  v73.size.width = v41;
  v73.size.height = v36;
  CGRectGetHeight(v73);
  -[NCFullScreenStagingBannerView safeAreaInsets](self, "safeAreaInsets");
  -[PLGrabberView frame](self->_grabberView, "frame");
  BSRectWithSize();
  UIRectCenteredYInRect();
  if (v14 == 1)
  {
    v74.origin.y = v66;
    v74.origin.x = v67;
    v74.size.width = v64;
    v74.size.height = v65;
    CGRectGetMaxX(v74);
  }
  UIRectRoundToScale();
  -[UIScrollView setFrame:](self->_detailScrollView, "setFrame:");
  detailScrollView = self->_detailScrollView;
  UISizeRoundToScale();
  -[UIScrollView setContentSize:](detailScrollView, "setContentSize:");
  v75.origin.x = v42;
  v75.origin.y = rect;
  v75.size.width = v41;
  v75.size.height = v22;
  v44 = CGRectGetMaxY(v75) + 6.0;
  v76.origin.x = v42;
  v76.origin.y = v44;
  v76.size.width = v41;
  v76.size.height = v28;
  CGRectGetMaxY(v76);
  v77.origin.y = v66;
  v77.origin.x = v67;
  v77.size.width = v64;
  v77.size.height = v65;
  CGRectGetHeight(v77);
  dateLabel = self->_dateLabel;
  UIRectRoundToScale();
  -[UILabel setFrame:](dateLabel, "setFrame:");
  -[UILabel setAlpha:](self->_dateLabel, "setAlpha:", 0.0);
  detailPrimaryLabel = self->_detailPrimaryLabel;
  UIRectRoundToScale();
  -[UILabel setFrame:](detailPrimaryLabel, "setFrame:");
  -[UILabel setAlpha:](self->_detailPrimaryLabel, "setAlpha:", 0.0);
  detailSecondaryLabel = self->_detailSecondaryLabel;
  UIRectRoundToScale();
  -[UILabel setFrame:](detailSecondaryLabel, "setFrame:");
  -[UILabel setAlpha:](self->_detailSecondaryLabel, "setAlpha:", 0.0);
  if (v12)
  {
    BSRectWithSize();
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v55 = v54;
    if (v14 != 1)
    {
      v78.origin.x = v67;
      v78.origin.y = v66;
      v78.size.width = v64;
      v78.size.height = v65;
      CGRectGetWidth(v78);
      v79.origin.x = v49;
      v79.origin.y = v51;
      v79.size.width = v53;
      v79.size.height = v55;
      CGRectGetWidth(v79);
    }
    UIRectCenteredYInRect();
    thumbnailView = self->_thumbnailView;
    UIRectRoundToScale();
    -[UIImageView setFrame:](thumbnailView, "setFrame:");
    -[UIImageView setAlpha:](self->_thumbnailView, "setAlpha:", 0.0);
  }
}

- (void)_prepareForTransitionToStage:(int64_t)a3
{
  -[NCFullScreenStagingBannerView _configureInitialViewsForStage:](self, "_configureInitialViewsForStage:");
  -[NCFullScreenStagingBannerView _updateWithStaticContentForStage:](self, "_updateWithStaticContentForStage:", a3);
  if (a3 == 2)
  {
    -[NCFullScreenStagingBannerView _prepareForTransitionToDetailStage](self, "_prepareForTransitionToDetailStage");
  }
  else if (a3 == 1)
  {
    -[NCFullScreenStagingBannerView _prepareForTransitionToBriefStage](self, "_prepareForTransitionToBriefStage");
  }
}

- (void)_layoutForBriefStageWithSettings:(id)a3 completion:(id)a4
{
  id v6;
  dispatch_group_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  id *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  id *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  NSObject *v40;
  void *v41;
  id v42;
  NSObject *v43;
  id v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  UIViewFloatAnimatableProperty *v56;
  UIViewFloatAnimatableProperty *floatAnimatablePropertyForBriefIcon;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  UIViewFloatAnimatableProperty *v81;
  UIViewFloatAnimatableProperty *floatAnimatablePropertyForBriefTextPosition;
  void *v83;
  NSObject *v84;
  id v85;
  id v86;
  id *v87;
  id *v88;
  CGFloat v89;
  void *v90;
  CGFloat v91;
  void (**v92)(_QWORD);
  CGFloat v93;
  void (**v94)(_QWORD);
  uint64_t v95;
  CGFloat recta;
  void *rect;
  id v98;
  _QWORD block[4];
  id v100;
  _QWORD v101[4];
  NSObject *v102;
  id v103;
  id v104;
  _QWORD v105[4];
  NSObject *v106;
  id v107;
  id v108;
  id v109;
  id v110;
  _QWORD v111[4];
  id v112;
  id v113;
  _QWORD v114[4];
  id v115;
  NSObject *v116;
  id v117;
  id v118[9];
  id v119;
  id v120;
  _QWORD v121[4];
  NSObject *v122;
  id v123;
  id v124;
  _QWORD v125[4];
  NSObject *v126;
  id v127;
  id v128;
  id v129;
  _QWORD v130[4];
  id v131;
  id v132;
  id v133;
  void (**v134)(_QWORD);
  void (**v135)(_QWORD);
  _QWORD v136[4];
  id v137;
  id v138;
  _QWORD v139[4];
  id v140;
  NSObject *v141;
  id v142;
  id from;
  _QWORD v144[4];
  id v145;
  NSObject *v146;
  id v147;
  _QWORD aBlock[4];
  id v149;
  NSObject *v150;
  id v151[5];
  id location[2];
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;

  v6 = a3;
  v86 = a4;
  v7 = dispatch_group_create();
  -[NCFullScreenStagingBannerView bounds](self, "bounds");
  -[NCFullScreenStagingBannerView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  v95 = v9;

  BSRectWithSize();
  v11 = v10;
  v91 = v10;
  v93 = v12;
  v13 = v12;
  v89 = v14;
  recta = v15;
  -[BSUIPartialStylingLabelView frame](self->_briefPrimaryLabelView, "frame");
  v17 = v16;
  v88 = v18;
  v20 = v19;
  v22 = v21;
  -[UILabel frame](self->_briefSecondaryLabel, "frame");
  v24 = v23;
  v87 = v25;
  v27 = v26;
  v29 = v28;
  v153.origin.x = v11;
  v153.origin.y = v13;
  v153.size.width = v89;
  v153.size.height = recta;
  CGRectGetHeight(v153);
  v154.origin.x = v17;
  *(_QWORD *)&v154.origin.y = v88;
  v154.size.width = v20;
  v154.size.height = v22;
  CGRectGetHeight(v154);
  v155.origin.x = v24;
  *(_QWORD *)&v155.origin.y = v87;
  v155.size.width = v27;
  v155.size.height = v29;
  CGRectGetHeight(v155);
  v156.origin.y = v93;
  v156.origin.x = v91;
  v156.size.width = v89;
  v156.size.height = recta;
  CGRectGetWidth(v156);
  BSRectWithSize();
  UIRectCenteredYInRect();
  CGRectGetMinY(v157);
  UIRectCenteredXInRectScale();
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  objc_initWeak(location, self->_badgedIconView);
  v38 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke;
  aBlock[3] = &unk_1E8D1B8D0;
  v39 = v6;
  v149 = v39;
  v40 = v7;
  v150 = v40;
  objc_copyWeak(v151, location);
  v151[1] = v31;
  v151[2] = v33;
  v151[3] = v35;
  v151[4] = v37;
  v41 = _Block_copy(aBlock);
  v144[0] = v38;
  v144[1] = 3221225472;
  v144[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_4;
  v144[3] = &unk_1E8D1B920;
  v42 = v39;
  v145 = v42;
  v43 = v40;
  v146 = v43;
  objc_copyWeak(&v147, location);
  v94 = (void (**)(_QWORD))_Block_copy(v144);
  objc_initWeak(&from, self->_grabberView);
  v139[0] = v38;
  v139[1] = 3221225472;
  v139[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_7;
  v139[3] = &unk_1E8D1B920;
  v44 = v42;
  v140 = v44;
  v45 = v43;
  v141 = v45;
  objc_copyWeak(&v142, &from);
  v92 = (void (**)(_QWORD))_Block_copy(v139);
  objc_initWeak(&v138, self);
  v46 = v38;
  v136[0] = v38;
  v136[1] = 3221225472;
  v136[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_10;
  v136[3] = &unk_1E8D1B948;
  objc_copyWeak(&v137, &v138);
  rect = _Block_copy(v136);
  v90 = v41;
  if (v44)
  {
    -[UIViewFloatAnimatableProperty invalidate](self->_floatAnimatablePropertyForBriefIcon, "invalidate", v95);
    v47 = (void *)MEMORY[0x1E0DC3F30];
    v48 = objc_alloc(MEMORY[0x1E0C99E60]);
    v49 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v44, "briefIconPositionMilestone");
    objc_msgSend(v49, "numberWithDouble:");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v44, "briefIconScaleMilestone");
    objc_msgSend(v51, "numberWithDouble:");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v44, "briefGrabberMilestone");
    objc_msgSend(v53, "numberWithDouble:");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(v48, "initWithObjects:", v50, v52, v54, 0);
    v130[0] = v46;
    v130[1] = 3221225472;
    v130[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_11;
    v130[3] = &unk_1E8D1B970;
    v132 = rect;
    v131 = v44;
    v133 = v90;
    v134 = v94;
    v135 = v92;
    objc_msgSend(v47, "unui_animatablePropertyWithProgressMilestones:block:", v55, v130);
    v56 = (UIViewFloatAnimatableProperty *)objc_claimAutoreleasedReturnValue();
    floatAnimatablePropertyForBriefIcon = self->_floatAnimatablePropertyForBriefIcon;
    self->_floatAnimatablePropertyForBriefIcon = v56;

  }
  else
  {
    (*((void (**)(void *))v41 + 2))(v41);
    v94[2](v94);
    v92[2](v92);
  }
  objc_initWeak(&v129, self->_floatAnimatablePropertyForBriefIcon);
  objc_msgSend(v44, "briefIconOpacitySettings");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v46;
  v125[0] = v46;
  v125[1] = 3221225472;
  v125[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_12;
  v125[3] = &unk_1E8D1B998;
  v126 = v45;
  objc_copyWeak(&v127, location);
  objc_copyWeak(&v128, &v129);
  v121[0] = v46;
  v121[1] = 3221225472;
  v121[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_13;
  v121[3] = &unk_1E8D1B9C0;
  v60 = v126;
  v122 = v60;
  objc_copyWeak(&v123, &v138);
  objc_copyWeak(&v124, &v129);
  NCPerformActionsAnimatingIfNecessary(v58, v125, v121);

  *(_QWORD *)&v158.origin.x = v31;
  *(_QWORD *)&v158.origin.y = v33;
  *(_QWORD *)&v158.size.width = v35;
  *(_QWORD *)&v158.size.height = v37;
  CGRectGetMaxY(v158);
  UIRectCenteredXInRectScale();
  x = v159.origin.x;
  y = v159.origin.y;
  width = v159.size.width;
  height = v159.size.height;
  CGRectGetMaxY(v159);
  UIRectCenteredXInRectScale();
  v66 = v65;
  v68 = v67;
  v70 = v69;
  v72 = v71;
  objc_initWeak(&v120, self->_briefPrimaryLabelView);
  objc_initWeak(&v119, self->_briefSecondaryLabel);
  v114[0] = v46;
  v114[1] = 3221225472;
  v114[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_14;
  v114[3] = &unk_1E8D1BA10;
  v98 = v44;
  v115 = v98;
  v73 = v60;
  v116 = v73;
  objc_copyWeak(&v117, &v120);
  v118[1] = *(id *)&x;
  v118[2] = *(id *)&y;
  v118[3] = *(id *)&width;
  v118[4] = *(id *)&height;
  objc_copyWeak(v118, &v119);
  v118[5] = v66;
  v118[6] = v68;
  v118[7] = v70;
  v118[8] = v72;
  v74 = _Block_copy(v114);
  v75 = v74;
  if (v44)
  {
    -[UIViewFloatAnimatableProperty invalidate](self->_floatAnimatablePropertyForBriefTextPosition, "invalidate", v95);
    v76 = (void *)MEMORY[0x1E0DC3F30];
    v77 = objc_alloc(MEMORY[0x1E0C99E60]);
    v78 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v98, "briefTextPositionMilestone");
    objc_msgSend(v78, "numberWithDouble:");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)objc_msgSend(v77, "initWithObjects:", v79, 0);
    v111[0] = v59;
    v111[1] = 3221225472;
    v111[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_17;
    v111[3] = &unk_1E8D1BA38;
    v112 = rect;
    v113 = v75;
    objc_msgSend(v76, "unui_animatablePropertyWithProgressMilestones:block:", v80, v111);
    v81 = (UIViewFloatAnimatableProperty *)objc_claimAutoreleasedReturnValue();
    floatAnimatablePropertyForBriefTextPosition = self->_floatAnimatablePropertyForBriefTextPosition;
    self->_floatAnimatablePropertyForBriefTextPosition = v81;

  }
  else
  {
    (*((void (**)(void *))v74 + 2))(v74);
  }
  objc_initWeak(&v110, self->_floatAnimatablePropertyForBriefTextPosition);
  objc_msgSend(v98, "briefTextOpacitySettings");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v105[0] = v59;
  v105[1] = 3221225472;
  v105[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_18;
  v105[3] = &unk_1E8D1BA60;
  v106 = v73;
  objc_copyWeak(&v107, &v120);
  objc_copyWeak(&v108, &v119);
  objc_copyWeak(&v109, &v110);
  v101[0] = v59;
  v101[1] = 3221225472;
  v101[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_19;
  v101[3] = &unk_1E8D1B9C0;
  v84 = v106;
  v102 = v84;
  objc_copyWeak(&v103, &v138);
  objc_copyWeak(&v104, &v110);
  NCPerformActionsAnimatingIfNecessary(v83, v105, v101);

  block[0] = v59;
  block[1] = 3221225472;
  block[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_20;
  block[3] = &unk_1E8D1B808;
  v100 = v86;
  v85 = v86;
  dispatch_group_notify(v84, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v104);
  objc_destroyWeak(&v103);

  objc_destroyWeak(&v109);
  objc_destroyWeak(&v108);
  objc_destroyWeak(&v107);

  objc_destroyWeak(&v110);
  objc_destroyWeak(v118);
  objc_destroyWeak(&v117);

  objc_destroyWeak(&v119);
  objc_destroyWeak(&v120);
  objc_destroyWeak(&v124);
  objc_destroyWeak(&v123);

  objc_destroyWeak(&v128);
  objc_destroyWeak(&v127);

  objc_destroyWeak(&v129);
  objc_destroyWeak(&v137);
  objc_destroyWeak(&v138);

  objc_destroyWeak(&v142);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v147);
  objc_destroyWeak(v151);

  objc_destroyWeak(location);
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  __int128 v10;
  __int128 v11;

  objc_msgSend(*(id *)(a1 + 32), "briefIconPositionSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_2;
  v7[3] = &unk_1E8D1B880;
  v8 = *(id *)(a1 + 40);
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v4 = *(_OWORD *)(a1 + 72);
  v10 = *(_OWORD *)(a1 + 56);
  v11 = v4;
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_3;
  v5[3] = &unk_1E8D1B8A8;
  v6 = *(id *)(a1 + 40);
  NCPerformActionsAnimatingIfNecessary(v2, v7, v5);

  objc_destroyWeak(&v9);
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  PLSetViewFrameMaintainingTransform();

}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_4(id *a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(a1[4], "briefIconScaleSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_5;
  v6[3] = &unk_1E8D1B8F8;
  v7 = a1[5];
  objc_copyWeak(&v8, a1 + 6);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_6;
  v4[3] = &unk_1E8D1B8A8;
  v5 = a1[5];
  NCPerformActionsAnimatingIfNecessary(v2, v6, v4);

  objc_destroyWeak(&v8);
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  __int128 v3;
  _OWORD v4[3];

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(WeakRetained, "setTransform:", v4);

}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_6(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_7(id *a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(a1[4], "briefGrabberSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_8;
  v6[3] = &unk_1E8D1B8F8;
  v7 = a1[5];
  objc_copyWeak(&v8, a1 + 6);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_9;
  v4[3] = &unk_1E8D1B8A8;
  v5 = a1[5];
  NCPerformActionsAnimatingIfNecessary(v2, v6, v4);

  objc_destroyWeak(&v8);
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_8(uint64_t a1)
{
  id WeakRetained;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setWeighting:", 1.0);

}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_9(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

BOOL __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  _BOOL8 v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "stage") == 1;

  return v2;
}

uint64_t __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_11(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "briefIconPositionMilestone");
    if (BSFloatApproximatelyEqualToFloat())
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "briefIconScaleMilestone");
    if (BSFloatApproximatelyEqualToFloat())
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "briefGrabberMilestone");
    result = BSFloatApproximatelyEqualToFloat();
    if ((_DWORD)result)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  return result;
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_12(uint64_t a1)
{
  id WeakRetained;
  id v3;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAlpha:", 1.0);

  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "setValue:", 1.0);

}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_13(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  id v4;
  void *v5;
  _QWORD *v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (id)WeakRetained[62];
    v6 = WeakRetained;
    v4 = objc_loadWeakRetained((id *)(a1 + 48));

    WeakRetained = v6;
    if (v3 == v4)
    {
      v5 = (void *)v6[62];
      v6[62] = 0;

      WeakRetained = v6;
    }
  }

}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_14(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  objc_msgSend(*(id *)(a1 + 32), "briefTextPositionSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_15;
  v8[3] = &unk_1E8D1B9E8;
  v9 = *(id *)(a1 + 40);
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v4 = *(_OWORD *)(a1 + 80);
  v12 = *(_OWORD *)(a1 + 64);
  v13 = v4;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  v5 = *(_OWORD *)(a1 + 112);
  v14 = *(_OWORD *)(a1 + 96);
  v15 = v5;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_16;
  v6[3] = &unk_1E8D1B8A8;
  v7 = *(id *)(a1 + 40);
  NCPerformActionsAnimatingIfNecessary(v2, v8, v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);

}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_15(uint64_t a1)
{
  id WeakRetained;
  id v3;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "setFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));

}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_16(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_17(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_18(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAlpha:", 1.0);

  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "setAlpha:", 1.0);

  v4 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v4, "setValue:", 1.0);

}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_19(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  id v4;
  void *v5;
  _QWORD *v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (id)WeakRetained[63];
    v6 = WeakRetained;
    v4 = objc_loadWeakRetained((id *)(a1 + 48));

    WeakRetained = v6;
    if (v3 == v4)
    {
      v5 = (void *)v6[63];
      v6[63] = 0;

      WeakRetained = v6;
    }
  }

}

uint64_t __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_20(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)_layoutForDetailStageWithSettings:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_group_t v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  id *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double Height;
  void *v25;
  id *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  CGFloat v31;
  double v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  id v52;
  NSObject *v53;
  id v54;
  void *v55;
  id v56;
  NSObject *v57;
  id v58;
  NSObject *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  UIViewFloatAnimatableProperty *v74;
  UIViewFloatAnimatableProperty *floatAnimatablePropertyForDetailText;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  UIViewFloatAnimatableProperty *v82;
  UIViewFloatAnimatableProperty *floatAnimatablePropertyForDetailIconPosition;
  void *v84;
  NSObject *v85;
  id v86;
  id v87;
  id v88;
  void *v89;
  id *v90;
  id *v91;
  id *v92;
  id *v93;
  void *v94;
  void *v95;
  void *v96;
  void (**v97)(void);
  void *v98;
  void (**v99)(void);
  void *v100;
  void (**v101)(void);
  CGFloat rect;
  void (**recta)(void);
  _QWORD block[4];
  id v105;
  _QWORD v106[4];
  NSObject *v107;
  id v108;
  id v109;
  _QWORD v110[4];
  id v111;
  id v112;
  id v113;
  id v114;
  _QWORD v115[4];
  id v116;
  void (**v117)(void);
  _QWORD v118[4];
  id v119;
  id v120;
  id v121;
  void (**v122)(void);
  void (**v123)(void);
  void (**v124)(void);
  _QWORD v125[4];
  id v126;
  _QWORD v127[4];
  id v128;
  id v129;
  uint64_t *v130;
  id v131;
  id v132[3];
  uint64_t v133;
  id *v134;
  uint64_t v135;
  void (*v136)(uint64_t, uint64_t);
  void (*v137)(uint64_t);
  id v138;
  _QWORD v139[4];
  id v140;
  id v141;
  id v142;
  _QWORD v143[4];
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  _QWORD v149[4];
  id v150;
  NSObject *v151;
  id v152;
  id v153;
  id v154;
  _QWORD v155[4];
  id v156;
  NSObject *v157;
  id v158;
  id v159;
  id v160;
  id v161;
  _QWORD aBlock[6];
  id v163;
  id v164;
  id v165;
  id v166;
  _QWORD v167[4];
  NSObject *v168;
  _QWORD v169[4];
  NSObject *v170;
  id v171[3];
  id v172;
  _QWORD v173[4];
  NSObject *v174;
  _QWORD v175[4];
  NSObject *v176;
  id v177;
  id v178;
  _QWORD v179[4];
  NSObject *v180;
  _QWORD v181[4];
  NSObject *v182;
  id v183;
  id v184[9];
  id from;
  id location[2];
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_group_create();
  -[NCFullScreenStagingBannerView bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[NCFullScreenStagingBannerView traitCollection](self, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "displayScale");
  v92 = v18;

  -[BSUIPartialStylingLabelView frame](self->_briefPrimaryLabelView, "frame");
  v96 = v19;
  v98 = v20;
  v22 = v21;
  v100 = v23;
  v187.origin.x = v10;
  v187.origin.y = v12;
  v187.size.width = v14;
  v187.size.height = v16;
  Height = CGRectGetHeight(v187);
  -[UILabel frame](self->_briefSecondaryLabel, "frame");
  v93 = v26;
  v94 = v25;
  v28 = v27;
  v30 = v29;
  v90 = *(id **)&v12;
  v91 = *(id **)&v10;
  v188.origin.x = v10;
  v188.origin.y = v12;
  v31 = v14;
  v188.size.width = v14;
  rect = v16;
  v188.size.height = v16;
  v32 = CGRectGetHeight(v188);
  objc_initWeak(location, self->_briefPrimaryLabelView);
  objc_initWeak(&from, self->_briefSecondaryLabel);
  objc_msgSend(v6, "detailOutgoingTextPositionSettings");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = MEMORY[0x1E0C809B0];
  v181[0] = MEMORY[0x1E0C809B0];
  v181[1] = 3221225472;
  v181[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke;
  v181[3] = &unk_1E8D1B9E8;
  v182 = v8;
  objc_copyWeak(&v183, location);
  v184[1] = v96;
  *(double *)&v184[2] = v22 + Height * 0.0703986429;
  v184[3] = v100;
  v184[4] = v98;
  objc_copyWeak(v184, &from);
  v184[5] = v94;
  *(double *)&v184[6] = v28 + v32 * 0.0703986429;
  v184[7] = v93;
  v184[8] = v30;
  v179[0] = v34;
  v179[1] = 3221225472;
  v179[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_2;
  v179[3] = &unk_1E8D1B8A8;
  v35 = v182;
  v180 = v35;
  NCPerformActionsAnimatingIfNecessary(v33, v181, v179);
  v89 = v7;

  objc_msgSend(v6, "detailOutgoingTextOpacitySettings");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v175[0] = v34;
  v175[1] = 3221225472;
  v175[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_3;
  v175[3] = &unk_1E8D1B998;
  v176 = v35;
  objc_copyWeak(&v177, location);
  objc_copyWeak(&v178, &from);
  v173[0] = v34;
  v173[1] = 3221225472;
  v173[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_4;
  v173[3] = &unk_1E8D1B8A8;
  v37 = v176;
  v174 = v37;
  NCPerformActionsAnimatingIfNecessary(v36, v175, v173);

  -[NCBadgedIconView center](self->_badgedIconView, "center");
  UIRectGetCenter();
  UIPointRoundToScale();
  v39 = v38;
  v41 = v40;
  objc_initWeak(&v172, self->_badgedIconView);
  objc_msgSend(v6, "detailIconPositionSettings");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v169[0] = v34;
  v169[1] = 3221225472;
  v169[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_5;
  v169[3] = &unk_1E8D1BA88;
  v170 = v37;
  objc_copyWeak(v171, &v172);
  v171[1] = v39;
  v171[2] = v41;
  v167[0] = v34;
  v167[1] = 3221225472;
  v167[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_6;
  v167[3] = &unk_1E8D1B8A8;
  v43 = v170;
  v168 = v43;
  NCPerformActionsAnimatingIfNecessary(v42, v169, v167);

  -[NCFullScreenStagingBannerView traitCollection](self, "traitCollection");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "layoutDirection");

  -[NCFullScreenStagingBannerView safeAreaInsets](self, "safeAreaInsets");
  if (v45 == 1)
  {
    v48 = v47;
    *(_QWORD *)&v189.origin.x = v91;
    *(_QWORD *)&v189.origin.y = v90;
    v189.size.width = v31;
    v189.size.height = rect;
    v49 = CGRectGetMaxX(v189) - v48;
    v50 = -1.0;
  }
  else
  {
    v49 = v46;
    v50 = 1.0;
  }
  objc_initWeak(&v166, self);
  objc_initWeak(&v165, self->_dateLabel);
  objc_initWeak(&v164, self->_detailPrimaryLabel);
  objc_initWeak(&v163, self->_thumbnailView);
  *(_QWORD *)&v190.origin.x = v91;
  *(_QWORD *)&v190.origin.y = v90;
  v190.size.width = v31;
  v190.size.height = rect;
  aBlock[0] = v34;
  aBlock[1] = 3221225472;
  aBlock[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_7;
  aBlock[3] = &__block_descriptor_48_e16_v16__0__UIView_8l;
  *(double *)&aBlock[4] = CGRectGetHeight(v190) * 0.00848176421;
  aBlock[5] = v92;
  v51 = _Block_copy(aBlock);
  v155[0] = v34;
  v155[1] = 3221225472;
  v155[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_8;
  v155[3] = &unk_1E8D1BAF8;
  v52 = v6;
  v156 = v52;
  v53 = v43;
  v157 = v53;
  v54 = v51;
  v158 = v54;
  objc_copyWeak(&v159, &v165);
  objc_copyWeak(&v160, &v164);
  objc_copyWeak(&v161, &v163);
  v55 = _Block_copy(v155);
  v149[0] = v34;
  v149[1] = 3221225472;
  v149[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_11;
  v149[3] = &unk_1E8D1BB20;
  v56 = v52;
  v150 = v56;
  v57 = v53;
  v151 = v57;
  objc_copyWeak(&v152, &v165);
  objc_copyWeak(&v153, &v164);
  objc_copyWeak(&v154, &v163);
  recta = (void (**)(void))_Block_copy(v149);
  objc_initWeak(&v148, self->_detailSecondaryLabel);
  v143[0] = v34;
  v143[1] = 3221225472;
  v143[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_14;
  v143[3] = &unk_1E8D1BB70;
  v58 = v56;
  v144 = v58;
  v59 = v57;
  v145 = v59;
  v88 = v54;
  v146 = v88;
  objc_copyWeak(&v147, &v148);
  v101 = (void (**)(void))_Block_copy(v143);
  v139[0] = v34;
  v139[1] = 3221225472;
  v139[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_17;
  v139[3] = &unk_1E8D1B920;
  v60 = v58;
  v140 = v60;
  v61 = v59;
  v141 = v61;
  objc_copyWeak(&v142, &v148);
  v99 = (void (**)(void))_Block_copy(v139);
  v133 = 0;
  v134 = (id *)&v133;
  v135 = 0x3042000000;
  v136 = __Block_byref_object_copy_;
  v137 = __Block_byref_object_dispose_;
  v138 = 0;
  v127[0] = v34;
  v127[1] = 3221225472;
  v127[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_33;
  v127[3] = &unk_1E8D1BBE8;
  v62 = v60;
  v128 = v62;
  v63 = v61;
  v129 = v63;
  objc_copyWeak(&v131, &v172);
  *(double *)&v132[1] = v49 + v50 * 42.0;
  v132[2] = v41;
  v130 = &v133;
  objc_copyWeak(v132, &v166);
  v95 = v55;
  v97 = (void (**)(void))_Block_copy(v127);
  if (v62)
  {
    v125[0] = v34;
    v125[1] = 3221225472;
    v125[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_4_36;
    v125[3] = &unk_1E8D1B948;
    v87 = v63;
    objc_copyWeak(&v126, &v166);
    v64 = _Block_copy(v125);
    -[UIViewFloatAnimatableProperty invalidate](self->_floatAnimatablePropertyForDetailText, "invalidate");
    v65 = (void *)MEMORY[0x1E0DC3F30];
    v66 = objc_alloc(MEMORY[0x1E0C99E60]);
    v67 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v62, "detailTextMilestone");
    objc_msgSend(v67, "numberWithDouble:");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v62, "detailSecondaryTextMilestone");
    objc_msgSend(v69, "numberWithDouble:");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (void *)objc_msgSend(v66, "initWithObjects:", v68, v70, 0);
    v118[0] = v34;
    v118[1] = 3221225472;
    v118[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_5_37;
    v118[3] = &unk_1E8D1BC10;
    v72 = v64;
    v120 = v72;
    v73 = v62;
    v119 = v73;
    v121 = v95;
    v122 = recta;
    v123 = v101;
    v124 = v99;
    objc_msgSend(v65, "unui_animatablePropertyWithProgressMilestones:block:", v71, v118);
    v74 = (UIViewFloatAnimatableProperty *)objc_claimAutoreleasedReturnValue();
    floatAnimatablePropertyForDetailText = self->_floatAnimatablePropertyForDetailText;
    self->_floatAnimatablePropertyForDetailText = v74;

    objc_storeWeak(v134 + 5, self->_floatAnimatablePropertyForDetailText);
    -[UIViewFloatAnimatableProperty invalidate](self->_floatAnimatablePropertyForDetailIconPosition, "invalidate");
    v76 = (void *)MEMORY[0x1E0DC3F30];
    v77 = objc_alloc(MEMORY[0x1E0C99E60]);
    v78 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v73, "detailIconPositionMilestone");
    objc_msgSend(v78, "numberWithDouble:");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)objc_msgSend(v77, "initWithObjects:", v79, 0);
    v115[0] = v34;
    v115[1] = 3221225472;
    v115[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_6_38;
    v115[3] = &unk_1E8D1BA38;
    v81 = v72;
    v116 = v81;
    v117 = v97;
    objc_msgSend(v76, "unui_animatablePropertyWithProgressMilestones:block:", v80, v115);
    v82 = (UIViewFloatAnimatableProperty *)objc_claimAutoreleasedReturnValue();
    floatAnimatablePropertyForDetailIconPosition = self->_floatAnimatablePropertyForDetailIconPosition;
    self->_floatAnimatablePropertyForDetailIconPosition = v82;

    objc_destroyWeak(&v126);
    v63 = v87;
  }
  else
  {
    (*((void (**)(void *))v55 + 2))(v55);
    recta[2]();
    v101[2]();
    v99[2]();
    v97[2]();
  }
  objc_initWeak(&v114, self->_floatAnimatablePropertyForDetailIconPosition);
  objc_msgSend(v62, "detailIconScaleSettings");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v34;
  v110[1] = 3221225472;
  v110[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_7_39;
  v110[3] = &unk_1E8D1B998;
  v111 = v63;
  objc_copyWeak(&v112, &v172);
  objc_copyWeak(&v113, &v114);
  v106[0] = v34;
  v106[1] = 3221225472;
  v106[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_8_40;
  v106[3] = &unk_1E8D1B9C0;
  v85 = v111;
  v107 = v85;
  objc_copyWeak(&v108, &v166);
  objc_copyWeak(&v109, &v114);
  NCPerformActionsAnimatingIfNecessary(v84, v110, v106);

  block[0] = v34;
  block[1] = 3221225472;
  block[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_9_41;
  block[3] = &unk_1E8D1B808;
  v105 = v89;
  v86 = v89;
  dispatch_group_notify(v85, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v109);
  objc_destroyWeak(&v108);

  objc_destroyWeak(&v113);
  objc_destroyWeak(&v112);

  objc_destroyWeak(&v114);
  objc_destroyWeak(v132);
  objc_destroyWeak(&v131);

  _Block_object_dispose(&v133, 8);
  objc_destroyWeak(&v138);

  objc_destroyWeak(&v142);
  objc_destroyWeak(&v147);

  objc_destroyWeak(&v148);
  objc_destroyWeak(&v154);
  objc_destroyWeak(&v153);
  objc_destroyWeak(&v152);

  objc_destroyWeak(&v161);
  objc_destroyWeak(&v160);
  objc_destroyWeak(&v159);

  objc_destroyWeak(&v163);
  objc_destroyWeak(&v164);
  objc_destroyWeak(&v165);
  objc_destroyWeak(&v166);

  objc_destroyWeak(v171);
  objc_destroyWeak(&v172);

  objc_destroyWeak(&v178);
  objc_destroyWeak(&v177);

  objc_destroyWeak(v184);
  objc_destroyWeak(&v183);

  objc_destroyWeak(&from);
  objc_destroyWeak(location);

}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "setFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));

}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAlpha:", 0.0);

  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "setAlpha:", 0.0);

}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));

}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_6(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;

  if (a2)
  {
    v2 = a2;
    objc_msgSend(v2, "frame");
    UIRectRoundToScale();
    objc_msgSend(v2, "setFrame:");

  }
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_8(id *a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(a1[4], "detailTextPositionSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_9;
  v6[3] = &unk_1E8D1BAD0;
  v7 = a1[5];
  v8 = a1[6];
  objc_copyWeak(&v9, a1 + 7);
  objc_copyWeak(&v10, a1 + 8);
  objc_copyWeak(&v11, a1 + 9);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_10;
  v4[3] = &unk_1E8D1B8A8;
  v5 = a1[5];
  NCPerformActionsAnimatingIfNecessary(v2, v6, v4);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);

}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, WeakRetained);

  v4 = *(_QWORD *)(a1 + 40);
  v5 = objc_loadWeakRetained((id *)(a1 + 56));
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

  v6 = *(_QWORD *)(a1 + 40);
  v7 = objc_loadWeakRetained((id *)(a1 + 64));
  (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_10(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_11(id *a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  objc_msgSend(a1[4], "detailTextOpacitySettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_12;
  v6[3] = &unk_1E8D1BA60;
  v7 = a1[5];
  objc_copyWeak(&v8, a1 + 6);
  objc_copyWeak(&v9, a1 + 7);
  objc_copyWeak(&v10, a1 + 8);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_13;
  v4[3] = &unk_1E8D1B8A8;
  v5 = a1[5];
  NCPerformActionsAnimatingIfNecessary(v2, v6, v4);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);

}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_12(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAlpha:", 0.71);

  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "setAlpha:", 1.0);

  v4 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v4, "setAlpha:", 1.0);

}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_13(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_14(id *a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  objc_msgSend(a1[4], "detailTextPositionSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_15;
  v6[3] = &unk_1E8D1BB48;
  v7 = a1[5];
  v8 = a1[6];
  objc_copyWeak(&v9, a1 + 7);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_16;
  v4[3] = &unk_1E8D1B8A8;
  v5 = a1[5];
  NCPerformActionsAnimatingIfNecessary(v2, v6, v4);

  objc_destroyWeak(&v9);
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_15(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, WeakRetained);

}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_16(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_17(id *a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(a1[4], "detailTextOpacitySettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_18;
  v6[3] = &unk_1E8D1B8F8;
  v7 = a1[5];
  objc_copyWeak(&v8, a1 + 6);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_19;
  v4[3] = &unk_1E8D1B8A8;
  v5 = a1[5];
  NCPerformActionsAnimatingIfNecessary(v2, v6, v4);

  objc_destroyWeak(&v8);
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_18(uint64_t a1)
{
  id WeakRetained;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAlpha:", 1.0);

}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_19(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_33(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  __int128 v13;

  objc_msgSend(*(id *)(a1 + 32), "detailIconPositionSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_2_34;
  v9[3] = &unk_1E8D1BB98;
  v10 = *(id *)(a1 + 40);
  objc_copyWeak(&v12, (id *)(a1 + 56));
  v13 = *(_OWORD *)(a1 + 72);
  v4 = *(void **)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_3_35;
  v5[3] = &unk_1E8D1BBC0;
  v6 = v4;
  objc_copyWeak(&v8, (id *)(a1 + 64));
  v7 = *(_QWORD *)(a1 + 48);
  NCPerformActionsAnimatingIfNecessary(v2, v9, v5);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v12);

}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_2_34(uint64_t a1)
{
  id WeakRetained;
  id v3;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setCenter:", *(double *)(a1 + 56), *(double *)(a1 + 64));

  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(v3, "setValue:", 1.0);

}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_3_35(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  id v4;
  void *v5;
  _QWORD *v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = (id)WeakRetained[65];
    v6 = WeakRetained;
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    WeakRetained = v6;
    if (v3 == v4)
    {
      v5 = (void *)v6[65];
      v6[65] = 0;

      WeakRetained = v6;
    }
  }

}

BOOL __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_4_36(uint64_t a1)
{
  id WeakRetained;
  _BOOL8 v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "stage") == 2;

  return v2;
}

uint64_t __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_5_37(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "detailTextMilestone");
    if (BSFloatApproximatelyEqualToFloat())
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    objc_msgSend(*(id *)(a1 + 32), "detailSecondaryTextMilestone");
    result = BSFloatApproximatelyEqualToFloat();
    if ((_DWORD)result)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }
  }
  return result;
}

uint64_t __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_6_38(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_7_39(uint64_t a1)
{
  id WeakRetained;
  id v3;
  CGAffineTransform v4;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  CGAffineTransformMakeScale(&v4, 0.477272727, 0.477272727);
  objc_msgSend(WeakRetained, "setTransform:", &v4);

  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "setValue:", 1.0);

}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_8_40(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  id v4;
  void *v5;
  _QWORD *v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (id)WeakRetained[64];
    v6 = WeakRetained;
    v4 = objc_loadWeakRetained((id *)(a1 + 48));

    WeakRetained = v6;
    if (v3 == v4)
    {
      v5 = (void *)v6[64];
      v6[64] = 0;

      WeakRetained = v6;
    }
  }

}

uint64_t __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_9_41(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)_layoutForDismissedStageFromBriefStageWithSettings:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_group_t v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  _QWORD block[4];
  id v28;
  _QWORD v29[4];
  NSObject *v30;
  _QWORD v31[4];
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  _QWORD aBlock[5];
  _QWORD v37[4];
  NSObject *v38;
  _QWORD v39[4];
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  NSObject *v46;
  _QWORD v47[4];
  NSObject *v48;
  id v49;
  id v50;
  id from;
  id location[2];
  CGRect v53;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_group_create();
  -[NCFullScreenStagingBannerView bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_initWeak(location, self->_badgedIconView);
  objc_initWeak(&from, self->_grabberView);
  objc_msgSend(v6, "dismissIconOpacitySettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke;
  v47[3] = &unk_1E8D1B998;
  v48 = v8;
  objc_copyWeak(&v49, location);
  objc_copyWeak(&v50, &from);
  v45[0] = v18;
  v45[1] = 3221225472;
  v45[2] = __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_2;
  v45[3] = &unk_1E8D1B8A8;
  v19 = v48;
  v46 = v19;
  NCPerformActionsAnimatingIfNecessary(v17, v47, v45);

  objc_initWeak(&v44, self->_briefPrimaryLabelView);
  objc_initWeak(&v43, self->_briefSecondaryLabel);
  objc_msgSend(v6, "dismissTextOpacitySettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v18;
  v39[1] = 3221225472;
  v39[2] = __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_3;
  v39[3] = &unk_1E8D1B998;
  v40 = v19;
  objc_copyWeak(&v41, &v44);
  objc_copyWeak(&v42, &v43);
  v37[0] = v18;
  v37[1] = 3221225472;
  v37[2] = __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_4;
  v37[3] = &unk_1E8D1B8A8;
  v21 = v40;
  v38 = v21;
  NCPerformActionsAnimatingIfNecessary(v20, v39, v37);

  v53.origin.x = v10;
  v53.origin.y = v12;
  v53.size.width = v14;
  v53.size.height = v16;
  aBlock[0] = v18;
  aBlock[1] = 3221225472;
  aBlock[2] = __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_5;
  aBlock[3] = &__block_descriptor_40_e16_v16__0__UIView_8l;
  *(double *)&aBlock[4] = CGRectGetHeight(v53) * 0.0703986429;
  v22 = _Block_copy(aBlock);
  objc_msgSend(v6, "dismissTextPositionSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v18;
  v31[1] = 3221225472;
  v31[2] = __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_6;
  v31[3] = &unk_1E8D1BC58;
  v32 = v21;
  v24 = v22;
  v33 = v24;
  objc_copyWeak(&v34, &v44);
  objc_copyWeak(&v35, &v43);
  v29[0] = v18;
  v29[1] = 3221225472;
  v29[2] = __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_7;
  v29[3] = &unk_1E8D1B8A8;
  v25 = v32;
  v30 = v25;
  NCPerformActionsAnimatingIfNecessary(v23, v31, v29);

  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_8;
  block[3] = &unk_1E8D1B808;
  v28 = v7;
  v26 = v7;
  dispatch_group_notify(v25, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v34);

  objc_destroyWeak(&v42);
  objc_destroyWeak(&v41);

  objc_destroyWeak(&v43);
  objc_destroyWeak(&v44);

  objc_destroyWeak(&v50);
  objc_destroyWeak(&v49);

  objc_destroyWeak(&from);
  objc_destroyWeak(location);

}

void __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAlpha:", 0.0);

  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "setWeighting:", 0.0);

}

void __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAlpha:", 0.0);

  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "setAlpha:", 0.0);

}

void __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "frame");
  objc_msgSend(v2, "setFrame:");

}

void __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  id v5;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, WeakRetained);

  v4 = *(_QWORD *)(a1 + 40);
  v5 = objc_loadWeakRetained((id *)(a1 + 56));
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

void __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_7(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)_layoutForDismissedStageFromDetailStageWithSettings:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_group_t v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  _QWORD block[4];
  id v30;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD v33[4];
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD aBlock[5];
  _QWORD v41[4];
  NSObject *v42;
  _QWORD v43[4];
  NSObject *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[4];
  NSObject *v54;
  _QWORD v55[4];
  NSObject *v56;
  id v57;
  id v58;
  id from;
  id location[2];
  CGRect v61;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_group_create();
  -[NCFullScreenStagingBannerView bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_initWeak(location, self->_badgedIconView);
  objc_initWeak(&from, self->_grabberView);
  objc_msgSend(v6, "dismissIconOpacitySettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke;
  v55[3] = &unk_1E8D1B998;
  v56 = v8;
  objc_copyWeak(&v57, location);
  objc_copyWeak(&v58, &from);
  v53[0] = v18;
  v53[1] = 3221225472;
  v53[2] = __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_2;
  v53[3] = &unk_1E8D1B8A8;
  v19 = v56;
  v54 = v19;
  NCPerformActionsAnimatingIfNecessary(v17, v55, v53);

  objc_initWeak(&v52, self->_dateLabel);
  objc_initWeak(&v51, self->_detailPrimaryLabel);
  objc_initWeak(&v50, self->_detailSecondaryLabel);
  objc_initWeak(&v49, self->_thumbnailView);
  objc_msgSend(v6, "dismissTextOpacitySettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v18;
  v43[1] = 3221225472;
  v43[2] = __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_3;
  v43[3] = &unk_1E8D1BC80;
  v44 = v19;
  objc_copyWeak(&v45, &v52);
  objc_copyWeak(&v46, &v51);
  objc_copyWeak(&v47, &v50);
  objc_copyWeak(&v48, &v49);
  v41[0] = v18;
  v41[1] = 3221225472;
  v41[2] = __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_4;
  v41[3] = &unk_1E8D1B8A8;
  v21 = v44;
  v42 = v21;
  NCPerformActionsAnimatingIfNecessary(v20, v43, v41);

  v61.origin.x = v10;
  v61.origin.y = v12;
  v61.size.width = v14;
  v61.size.height = v16;
  v22 = v7;
  aBlock[0] = v18;
  aBlock[1] = 3221225472;
  aBlock[2] = __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_5;
  aBlock[3] = &__block_descriptor_40_e16_v16__0__UIView_8l;
  *(double *)&aBlock[4] = CGRectGetHeight(v61) * 0.0703986429;
  v23 = _Block_copy(aBlock);
  v28 = v6;
  objc_msgSend(v6, "dismissTextPositionSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v18;
  v33[1] = 3221225472;
  v33[2] = __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_6;
  v33[3] = &unk_1E8D1BCA8;
  v34 = v21;
  v25 = v23;
  v35 = v25;
  objc_copyWeak(&v36, &v52);
  objc_copyWeak(&v37, &v51);
  objc_copyWeak(&v38, &v50);
  objc_copyWeak(&v39, &v49);
  v31[0] = v18;
  v31[1] = 3221225472;
  v31[2] = __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_7;
  v31[3] = &unk_1E8D1B8A8;
  v26 = v34;
  v32 = v26;
  NCPerformActionsAnimatingIfNecessary(v24, v33, v31);

  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_8;
  block[3] = &unk_1E8D1B808;
  v30 = v22;
  v27 = v22;
  dispatch_group_notify(v26, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&v48);
  objc_destroyWeak(&v47);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&v45);

  objc_destroyWeak(&v49);
  objc_destroyWeak(&v50);
  objc_destroyWeak(&v51);
  objc_destroyWeak(&v52);

  objc_destroyWeak(&v58);
  objc_destroyWeak(&v57);

  objc_destroyWeak(&from);
  objc_destroyWeak(location);

}

void __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAlpha:", 0.0);

  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "setWeighting:", 0.0);

}

void __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;
  id v5;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAlpha:", 0.0);

  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "setAlpha:", 0.0);

  v4 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v4, "setAlpha:", 0.0);

  v5 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v5, "setAlpha:", 0.0);

}

void __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;

  if (a2)
  {
    v2 = a2;
    objc_msgSend(v2, "frame");
    objc_msgSend(v2, "setFrame:");

  }
}

void __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, WeakRetained);

  v4 = *(_QWORD *)(a1 + 40);
  v5 = objc_loadWeakRetained((id *)(a1 + 56));
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

  v6 = *(_QWORD *)(a1 + 40);
  v7 = objc_loadWeakRetained((id *)(a1 + 64));
  (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

  v8 = *(_QWORD *)(a1 + 40);
  v9 = objc_loadWeakRetained((id *)(a1 + 72));
  (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);

}

void __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_7(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (CGRect)_contentFrameForActiveStage
{
  int64_t stage;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  double v70;
  double v71;
  double v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect result;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  stage = self->_stage;
  if (stage == 1)
  {
    -[NCBadgedIconView frame](self->_badgedIconView, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[BSUIPartialStylingLabelView frame](self->_briefPrimaryLabelView, "frame");
    v83.origin.x = v12;
    v83.origin.y = v13;
    v83.size.width = v14;
    v83.size.height = v15;
    v73.origin.x = v5;
    v73.origin.y = v7;
    v73.size.width = v9;
    v73.size.height = v11;
    v74 = CGRectUnion(v73, v83);
    x = v74.origin.x;
    y = v74.origin.y;
    width = v74.size.width;
    height = v74.size.height;
    -[UILabel frame](self->_briefSecondaryLabel, "frame");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v28 = x;
    v29 = y;
    v30 = width;
    v31 = height;
LABEL_6:
    v81 = CGRectUnion(*(CGRect *)&v28, *(CGRect *)&v21);
    v60 = v81.origin.x;
    v61 = v81.origin.y;
    v62 = v81.size.width;
    v63 = v81.size.height;
    goto LABEL_8;
  }
  if (stage != 2)
  {
    v62 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v63 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v60 = *MEMORY[0x1E0C9D648];
    v61 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    goto LABEL_8;
  }
  -[NCBadgedIconView frame](self->_badgedIconView, "frame");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  -[UILabel frame](self->_dateLabel, "frame");
  v84.origin.x = v40;
  v84.origin.y = v41;
  v84.size.width = v42;
  v84.size.height = v43;
  v75.origin.x = v33;
  v75.origin.y = v35;
  v75.size.width = v37;
  v75.size.height = v39;
  v76 = CGRectUnion(v75, v84);
  v44 = v76.origin.x;
  v45 = v76.origin.y;
  v46 = v76.size.width;
  v47 = v76.size.height;
  -[UILabel frame](self->_detailPrimaryLabel, "frame");
  v85.origin.x = v48;
  v85.origin.y = v49;
  v85.size.width = v50;
  v85.size.height = v51;
  v77.origin.x = v44;
  v77.origin.y = v45;
  v77.size.width = v46;
  v77.size.height = v47;
  v78 = CGRectUnion(v77, v85);
  v52 = v78.origin.x;
  v53 = v78.origin.y;
  v54 = v78.size.width;
  v55 = v78.size.height;
  -[UILabel frame](self->_detailSecondaryLabel, "frame");
  v86.origin.x = v56;
  v86.origin.y = v57;
  v86.size.width = v58;
  v86.size.height = v59;
  v79.origin.x = v52;
  v79.origin.y = v53;
  v79.size.width = v54;
  v79.size.height = v55;
  v80 = CGRectUnion(v79, v86);
  v60 = v80.origin.x;
  v61 = v80.origin.y;
  v62 = v80.size.width;
  v63 = v80.size.height;
  -[UIImageView image](self->_thumbnailView, "image");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    -[UIImageView frame](self->_thumbnailView, "frame");
    v21 = v65;
    v23 = v66;
    v25 = v67;
    v27 = v68;
    v28 = v60;
    v29 = v61;
    v30 = v62;
    v31 = v63;
    goto LABEL_6;
  }
LABEL_8:
  v69 = v60;
  v70 = v61;
  v71 = v62;
  v72 = v63;
  result.size.height = v72;
  result.size.width = v71;
  result.origin.y = v70;
  result.origin.x = v69;
  return result;
}

- (CGRect)_contentHitRectForActiveStage
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  NCUNUIKitPrototypeSettings *settings;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect result;
  CGRect v34;

  -[NCFullScreenStagingBannerView _contentFrameForActiveStage](self, "_contentFrameForActiveStage");
  if (CGRectIsEmpty(v31))
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    -[NCFullScreenStagingBannerView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "layoutDirection");

    -[NCUNUIKitPrototypeSettings contentHitRectTopMargin](self->_settings, "contentHitRectTopMargin");
    settings = self->_settings;
    if (v8 == 1)
    {
      -[NCUNUIKitPrototypeSettings contentHitRectLeadingMargin](settings, "contentHitRectLeadingMargin");
      -[NCUNUIKitPrototypeSettings contentHitRectBottomMargin](self->_settings, "contentHitRectBottomMargin");
      -[NCUNUIKitPrototypeSettings contentHitRectTrailingMargin](self->_settings, "contentHitRectTrailingMargin");
    }
    else
    {
      -[NCUNUIKitPrototypeSettings contentHitRectTrailingMargin](settings, "contentHitRectTrailingMargin");
      -[NCUNUIKitPrototypeSettings contentHitRectBottomMargin](self->_settings, "contentHitRectBottomMargin");
      -[NCUNUIKitPrototypeSettings contentHitRectLeadingMargin](self->_settings, "contentHitRectLeadingMargin");
    }
    UIRectInset();
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[NCFullScreenStagingBannerView bounds](self, "bounds");
    v34.origin.x = v18;
    v34.origin.y = v19;
    v34.size.width = v20;
    v34.size.height = v21;
    v32.origin.x = v11;
    v32.origin.y = v13;
    v32.size.width = v15;
    v32.size.height = v17;
    CGRectIntersection(v32, v34);
    -[NCFullScreenStagingBannerView traitCollection](self, "traitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "displayScale");
    UIRectRoundToScale();
    v3 = v23;
    v4 = v24;
    v5 = v25;
    v6 = v26;

  }
  v27 = v3;
  v28 = v4;
  v29 = v5;
  v30 = v6;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (void)_layoutContentHitRectViewForActiveStage
{
  UIView *contentHitRectView;

  contentHitRectView = self->_contentHitRectView;
  if (contentHitRectView)
  {
    -[NCFullScreenStagingBannerView _contentHitRectForActiveStage](self, "_contentHitRectForActiveStage");
    -[UIView setFrame:](contentHitRectView, "setFrame:");
  }
}

- (void)_layoutForStage:(int64_t)a3 fromStage:(int64_t)a4 settings:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  _QWORD aBlock[4];
  id v25;

  v10 = a5;
  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__NCFullScreenStagingBannerView__layoutForStage_fromStage_settings_completion___block_invoke;
  aBlock[3] = &unk_1E8D1B148;
  v13 = v11;
  v25 = v13;
  v14 = _Block_copy(aBlock);
  -[NCFullScreenStagingBannerView _configureContentHitRectViewIfNecessary](self, "_configureContentHitRectViewIfNecessary");
  if (self->_contentHitRectView)
  {
    objc_initWeak(&location, self);
    v15 = (void *)MEMORY[0x1E0DC3F10];
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __79__NCFullScreenStagingBannerView__layoutForStage_fromStage_settings_completion___block_invoke_2;
    v21[3] = &unk_1E8D1B278;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v15, "_animateUsingSpringInteractive:animations:completion:", 0, v21, 0);
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __79__NCFullScreenStagingBannerView__layoutForStage_fromStage_settings_completion___block_invoke_3;
    v18[3] = &unk_1E8D1BCD0;
    objc_copyWeak(&v20, &location);
    v19 = v13;
    v16 = _Block_copy(v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    v14 = v16;
  }
  switch(a3)
  {
    case 3:
      -[NCFullScreenStagingBannerView layer](self, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAllowsHitTesting:", 0);

      if (a4 == 2)
      {
        -[NCFullScreenStagingBannerView _layoutForDismissedStageFromDetailStageWithSettings:completion:](self, "_layoutForDismissedStageFromDetailStageWithSettings:completion:", v10, v14);
      }
      else if (a4 == 1)
      {
        -[NCFullScreenStagingBannerView _layoutForDismissedStageFromBriefStageWithSettings:completion:](self, "_layoutForDismissedStageFromBriefStageWithSettings:completion:", v10, v14);
      }
      break;
    case 2:
      -[NCFullScreenStagingBannerView _layoutForDetailStageWithSettings:completion:](self, "_layoutForDetailStageWithSettings:completion:", v10, v14);
      break;
    case 1:
      -[NCFullScreenStagingBannerView _layoutForBriefStageWithSettings:completion:](self, "_layoutForBriefStageWithSettings:completion:", v10, v14);
      break;
  }

}

uint64_t __79__NCFullScreenStagingBannerView__layoutForStage_fromStage_settings_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __79__NCFullScreenStagingBannerView__layoutForStage_fromStage_settings_completion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[67], "setAlpha:", 0.0);
    WeakRetained = v2;
  }

}

void __79__NCFullScreenStagingBannerView__layoutForStage_fromStage_settings_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v6 = (void *)MEMORY[0x1E0DC3F10];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__NCFullScreenStagingBannerView__layoutForStage_fromStage_settings_completion___block_invoke_4;
  v8[3] = &unk_1E8D1B278;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  objc_msgSend(v6, "_animateUsingSpringInteractive:animations:completion:", 0, v8, 0);
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, a2, a3);
  objc_destroyWeak(&v9);
}

void __79__NCFullScreenStagingBannerView__layoutForStage_fromStage_settings_completion___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_layoutContentHitRectViewForActiveStage");
    objc_msgSend(v2[67], "setAlpha:", 1.0);
    WeakRetained = v2;
  }

}

- (void)_transitionToStage:(int64_t)a3 fromStage:(int64_t)a4 settings:(id)a5 completion:(id)a6
{
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  NCFullScreenStagingBannerView *v17;
  int64_t v18;

  v10 = (void *)MEMORY[0x1E0DC3F10];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __82__NCFullScreenStagingBannerView__transitionToStage_fromStage_settings_completion___block_invoke;
  v16 = &unk_1E8D1BCF8;
  v17 = self;
  v18 = a3;
  v11 = a6;
  v12 = a5;
  objc_msgSend(v10, "performWithoutAnimation:", &v13);
  -[NCFullScreenStagingBannerView _layoutForStage:fromStage:settings:completion:](self, "_layoutForStage:fromStage:settings:completion:", a3, a4, v12, v11, v13, v14, v15, v16, v17, v18);

}

uint64_t __82__NCFullScreenStagingBannerView__transitionToStage_fromStage_settings_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareForTransitionToStage:", *(_QWORD *)(a1 + 40));
}

- (void)_configureTapGestureIfNecessary
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *tapGesture;

  if (!self->_tapGesture)
  {
    v3 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTap_);
    tapGesture = self->_tapGesture;
    self->_tapGesture = v3;

    -[UITapGestureRecognizer setDelegate:](self->_tapGesture, "setDelegate:", self);
    -[NCFullScreenStagingBannerView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapGesture);
  }
}

- (void)_handleTap:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  _BOOL4 v17;
  int *v18;
  CGPoint v19;
  CGRect v20;

  v4 = a3;
  -[NCFullScreenStagingBannerView _contentHitRectForActiveStage](self, "_contentHitRectForActiveStage");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "locationInView:", self);
  v14 = v13;
  v16 = v15;

  v20.origin.x = v6;
  v20.origin.y = v8;
  v20.size.width = v10;
  v20.size.height = v12;
  v19.x = v14;
  v19.y = v16;
  v17 = CGRectContainsPoint(v20, v19);
  v18 = &OBJC_IVAR___NCFullScreenStagingBannerView__defaultTapAction;
  if (v17)
    v18 = &OBJC_IVAR___NCFullScreenStagingBannerView__contentTapAction;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v18), "performWithSender:target:", self, 0);
}

- (NCUNUIKitPrototypeSettings)settings
{
  return self->_settings;
}

- (NCNotificationStaticContentProviding)staticContentProvider
{
  return self->_staticContentProvider;
}

- (UIAction)contentTapAction
{
  return self->_contentTapAction;
}

- (void)setContentTapAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (UIAction)defaultTapAction
{
  return self->_defaultTapAction;
}

- (void)setDefaultTapAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (int64_t)stage
{
  return self->_stage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTapAction, 0);
  objc_storeStrong((id *)&self->_contentTapAction, 0);
  objc_storeStrong((id *)&self->_staticContentProvider, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_importantTextVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_strokeVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_contentHitRectView, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_floatAnimatablePropertyForDetailText, 0);
  objc_storeStrong((id *)&self->_floatAnimatablePropertyForDetailIconPosition, 0);
  objc_storeStrong((id *)&self->_floatAnimatablePropertyForBriefTextPosition, 0);
  objc_storeStrong((id *)&self->_floatAnimatablePropertyForBriefIcon, 0);
  objc_storeStrong((id *)&self->_thumbnailView, 0);
  objc_storeStrong((id *)&self->_detailSecondaryLabel, 0);
  objc_storeStrong((id *)&self->_detailPrimaryLabel, 0);
  objc_storeStrong((id *)&self->_detailScrollView, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_referenceDateLabel, 0);
  objc_storeStrong((id *)&self->_briefSecondaryLabel, 0);
  objc_storeStrong((id *)&self->_briefPrimaryLabelView, 0);
  objc_storeStrong((id *)&self->_badgedIconView, 0);
  objc_storeStrong((id *)&self->_grabberView, 0);
}

@end
