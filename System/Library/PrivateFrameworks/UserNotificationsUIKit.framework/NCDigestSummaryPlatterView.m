@implementation NCDigestSummaryPlatterView

- (NCDigestSummaryPlatterView)initWithRecipe:(int64_t)a3
{
  NCDigestSummaryPlatterView *v3;
  NCDigestSummaryPlatterView *v4;
  objc_super v6;

  if ((unint64_t)a3 <= 1)
    a3 = 1;
  v6.receiver = self;
  v6.super_class = (Class)NCDigestSummaryPlatterView;
  v3 = -[PLPlatterView initWithRecipe:](&v6, sel_initWithRecipe_, a3);
  v4 = v3;
  if (v3)
  {
    -[PLPlatterView _setContinuousCornerRadius:](v3, "_setContinuousCornerRadius:", 28.0);
    -[NCDigestSummaryPlatterView _configureSummaryViewIfNecessary](v4, "_configureSummaryViewIfNecessary");
  }
  return v4;
}

- (void)updateContent
{
  -[NCDigestSummaryView updateContent](self->_summaryView, "updateContent");
  -[NCDigestSummaryPlatterView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[NCDigestSummaryView sizeThatFits:](self->_summaryView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)didMoveToSuperview
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NCDigestSummaryView *summaryView;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)NCDigestSummaryPlatterView;
  -[NCDigestSummaryPlatterView didMoveToSuperview](&v15, sel_didMoveToSuperview);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NCDigestSummaryView requiredVisualStyleCategories](self->_summaryView, "requiredVisualStyleCategories", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "integerValue");
        summaryView = self->_summaryView;
        -[PLPlatterView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCDigestSummaryView setVisualStylingProvider:forCategory:](summaryView, "setVisualStylingProvider:forCategory:", v10, v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v5);
  }

}

- (NSDate)date
{
  return -[NCDigestSummaryView date](self->_summaryView, "date");
}

- (void)setDate:(id)a3
{
  -[NCDigestSummaryView setDate:](self->_summaryView, "setDate:", a3);
}

- (NSTimeZone)timeZone
{
  return -[NCDigestSummaryView timeZone](self->_summaryView, "timeZone");
}

- (void)setTimeZone:(id)a3
{
  -[NCDigestSummaryView setTimeZone:](self->_summaryView, "setTimeZone:", a3);
}

- (int64_t)dateFormatStyle
{
  return -[NCDigestSummaryView dateFormatStyle](self->_summaryView, "dateFormatStyle");
}

- (void)setDateFormatStyle:(int64_t)a3
{
  -[NCDigestSummaryView setDateFormatStyle:](self->_summaryView, "setDateFormatStyle:", a3);
}

- (NSString)heading
{
  return -[NCDigestSummaryView heading](self->_summaryView, "heading");
}

- (void)setHeading:(id)a3
{
  -[NCDigestSummaryView setHeading:](self->_summaryView, "setHeading:", a3);
}

- (NSString)subheading
{
  return -[NCDigestSummaryView subheading](self->_summaryView, "subheading");
}

- (void)setSubheading:(id)a3
{
  -[NCDigestSummaryView setSubheading:](self->_summaryView, "setSubheading:", a3);
}

- (unint64_t)count
{
  return -[NCDigestSummaryView count](self->_summaryView, "count");
}

- (void)setCount:(unint64_t)a3
{
  -[NCDigestSummaryView setCount:](self->_summaryView, "setCount:", a3);
}

- (BOOL)presentFeaturedNotificationsInline
{
  return -[NCDigestSummaryView presentFeaturedNotificationsInline](self->_summaryView, "presentFeaturedNotificationsInline");
}

- (void)setPresentFeaturedNotificationsInline:(BOOL)a3
{
  -[NCDigestSummaryView setPresentFeaturedNotificationsInline:](self->_summaryView, "setPresentFeaturedNotificationsInline:", a3);
}

- (NSArray)featuredNotificationContentProviders
{
  return -[NCDigestSummaryView featuredNotificationContentProviders](self->_summaryView, "featuredNotificationContentProviders");
}

- (void)setFeaturedNotificationContentProviders:(id)a3
{
  -[NCDigestSummaryView setFeaturedNotificationContentProviders:](self->_summaryView, "setFeaturedNotificationContentProviders:", a3);
}

- (NCNotificationSummaryContentProviding)communicationsSummaryContentProvider
{
  return -[NCDigestSummaryView communicationsSummaryContentProvider](self->_summaryView, "communicationsSummaryContentProvider");
}

- (void)setCommunicationsSummaryContentProvider:(id)a3
{
  -[NCDigestSummaryView setCommunicationsSummaryContentProvider:](self->_summaryView, "setCommunicationsSummaryContentProvider:", a3);
}

- (NCNotificationSummaryContentProviding)appsSummaryContentProvider
{
  return -[NCDigestSummaryView appsSummaryContentProvider](self->_summaryView, "appsSummaryContentProvider");
}

- (void)setAppsSummaryContentProvider:(id)a3
{
  -[NCDigestSummaryView setAppsSummaryContentProvider:](self->_summaryView, "setAppsSummaryContentProvider:", a3);
}

- (UIView)clearControlView
{
  return -[NCDigestSummaryView clearControlView](self->_summaryView, "clearControlView");
}

- (void)setClearControlView:(id)a3
{
  -[NCDigestSummaryView setClearControlView:](self->_summaryView, "setClearControlView:", a3);
}

- (id)requiredVisualStyleCategories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0C99E20];
  v9.receiver = self;
  v9.super_class = (Class)NCDigestSummaryPlatterView;
  -[PLPlatterView requiredVisualStyleCategories](&v9, sel_requiredVisualStyleCategories);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCDigestSummaryView requiredVisualStyleCategories](self->_summaryView, "requiredVisualStyleCategories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  objc_msgSend(v5, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NCDigestSummaryPlatterView;
  v6 = a3;
  -[PLPlatterView setVisualStylingProvider:forCategory:](&v7, sel_setVisualStylingProvider_forCategory_, v6, a4);
  -[NCDigestSummaryView setVisualStylingProvider:forCategory:](self->_summaryView, "setVisualStylingProvider:forCategory:", v6, a4, v7.receiver, v7.super_class);

}

- (void)setMaterialGroupNameBase:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCDigestSummaryPlatterView;
  v4 = a3;
  -[PLPlatterView setMaterialGroupNameBase:](&v5, sel_setMaterialGroupNameBase_, v4);
  -[NCDigestSummaryView setMaterialGroupNameBase:](self->_summaryView, "setMaterialGroupNameBase:", v4, v5.receiver, v5.super_class);

}

- (BOOL)adjustsFontForContentSizeCategory
{
  return -[NCDigestSummaryView adjustsFontForContentSizeCategory](self->_summaryView, "adjustsFontForContentSizeCategory");
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  -[NCDigestSummaryView setAdjustsFontForContentSizeCategory:](self->_summaryView, "setAdjustsFontForContentSizeCategory:", a3);
}

- (BOOL)adjustForContentSizeCategoryChange
{
  return -[NCDigestSummaryView adjustForContentSizeCategoryChange](self->_summaryView, "adjustForContentSizeCategoryChange");
}

- (void)_configureSummaryViewIfNecessary
{
  NCDigestSummaryView *v3;
  NCDigestSummaryView *v4;
  NCDigestSummaryView *summaryView;
  id v6;

  if (!self->_summaryView)
  {
    -[PLPlatterView customContentView](self, "customContentView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v3 = [NCDigestSummaryView alloc];
    objc_msgSend(v6, "bounds");
    v4 = -[NCDigestSummaryView initWithFrame:](v3, "initWithFrame:");
    summaryView = self->_summaryView;
    self->_summaryView = v4;

    objc_msgSend(v6, "addSubview:", self->_summaryView);
    -[NCDigestSummaryView setAutoresizingMask:](self->_summaryView, "setAutoresizingMask:", 18);
    -[NCDigestSummaryView _setContinuousCornerRadius:](self->_summaryView, "_setContinuousCornerRadius:", 28.0);
    -[NCDigestSummaryView setClipsToBounds:](self->_summaryView, "setClipsToBounds:", 1);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryView, 0);
}

@end
