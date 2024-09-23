@implementation NCDigestInlineFeaturedNotificationsContainerView

- (NSArray)featuredNotificationContentProviders
{
  return self->_featuredNotificationContentProviders;
}

- (void)setFeaturedNotificationContentProviders:(id)a3
{
  void *v5;
  void *v6;
  NCNotificationInlineFeaturedSectionList *inlineFeaturedSectionList;
  void *v8;
  id v9;

  v9 = a3;
  if ((BSEqualArrays() & 1) != 0)
  {
    -[NCDigestInlineFeaturedNotificationsContainerView updateContent](self, "updateContent");
  }
  else
  {
    objc_storeStrong((id *)&self->_featuredNotificationContentProviders, a3);
    objc_msgSend(v9, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "listComponentDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCDigestInlineFeaturedNotificationsContainerView _configureInlineFeaturedSectionListIfNecessaryWithDelegate:](self, "_configureInlineFeaturedSectionListIfNecessaryWithDelegate:", v6);

    inlineFeaturedSectionList = self->_inlineFeaturedSectionList;
    objc_msgSend(v9, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationStructuredSectionList setDeviceAuthenticated:](inlineFeaturedSectionList, "setDeviceAuthenticated:", objc_msgSend(v8, "isDeviceAuthenticated"));

    -[NCNotificationInlineFeaturedSectionList setFeaturedNotificationContentProviders:](self->_inlineFeaturedSectionList, "setFeaturedNotificationContentProviders:", v9);
  }
  -[NCDigestInlineFeaturedNotificationsContainerView setNeedsLayout](self, "setNeedsLayout");

}

- (void)updateContent
{
  -[NCNotificationInlineFeaturedSectionList updateContent](self->_inlineFeaturedSectionList, "updateContent");
  -[NCDigestInlineFeaturedNotificationsContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[NCNotificationStructuredSectionList listView](self->_inlineFeaturedSectionList, "listView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;

  v8 = width;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NCDigestInlineFeaturedNotificationsContainerView;
  -[NCDigestInlineFeaturedNotificationsContainerView layoutSubviews](&v12, sel_layoutSubviews);
  -[NCDigestInlineFeaturedNotificationsContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NCNotificationStructuredSectionList listView](self->_inlineFeaturedSectionList, "listView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setVisibleRect:", v4, v6, v8, v10);
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  -[NCDigestInlineFeaturedNotificationsContainerView _configureDividerViewIfNecessary](self, "_configureDividerViewIfNecessary");
  -[NCDigestInlineFeaturedNotificationsContainerView _layoutDividerViewIfNecessary](self, "_layoutDividerViewIfNecessary");

}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  NSString *v4;
  NSComparisonResult v5;

  -[NCDigestInlineFeaturedNotificationsContainerView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  v5 = UIContentSizeCategoryCompareToCategory(v4, self->_preferredContentSizeCategory);
  if (v5)
  {
    objc_storeStrong((id *)&self->_preferredContentSizeCategory, v4);
    -[NCNotificationStructuredSectionList adjustForContentSizeCategoryChange](self->_inlineFeaturedSectionList, "adjustForContentSizeCategoryChange");
    -[NCDigestInlineFeaturedNotificationsContainerView setNeedsLayout](self, "setNeedsLayout");
  }

  return v5 != NSOrderedSame;
}

- (void)setMaterialGroupNameBase:(id)a3
{
  objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
}

- (void)_configureInlineFeaturedSectionListIfNecessaryWithDelegate:(id)a3
{
  id v4;
  NCNotificationInlineFeaturedSectionList *v5;
  NCNotificationInlineFeaturedSectionList *inlineFeaturedSectionList;
  NCNotificationInlineFeaturedSectionList *v7;
  NCNotificationListCache *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (!self->_inlineFeaturedSectionList)
  {
    v10 = v4;
    v5 = -[NCNotificationStructuredSectionList initWithTitle:sectionType:]([NCNotificationInlineFeaturedSectionList alloc], "initWithTitle:sectionType:", 0, 9);
    inlineFeaturedSectionList = self->_inlineFeaturedSectionList;
    self->_inlineFeaturedSectionList = v5;

    -[NCNotificationStructuredSectionList setLogDescription:](self->_inlineFeaturedSectionList, "setLogDescription:", CFSTR("Inline Featured Digest"));
    v7 = self->_inlineFeaturedSectionList;
    v8 = objc_alloc_init(NCNotificationListCache);
    -[NCNotificationStructuredSectionList setNotificationListCache:](v7, "setNotificationListCache:", v8);

    if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EFC0CBA0))
      -[NCNotificationStructuredSectionList setDelegate:](self->_inlineFeaturedSectionList, "setDelegate:", v10);
    -[NCNotificationStructuredSectionList listView](self->_inlineFeaturedSectionList, "listView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCDigestInlineFeaturedNotificationsContainerView addSubview:](self, "addSubview:", v9);

    v4 = v10;
  }

}

- (void)_configureDividerViewIfNecessary
{
  unint64_t v3;
  UIView *dividerView;
  BOOL v5;
  BOOL v6;
  id v7;
  UIView *v8;
  UIView *v9;
  UIView *v10;
  void *v11;
  UIView *v12;
  void *v13;
  UIView *v14;

  v3 = -[NCNotificationStructuredSectionList notificationCount](self->_inlineFeaturedSectionList, "notificationCount");
  dividerView = self->_dividerView;
  if (dividerView)
    v5 = 0;
  else
    v5 = v3 >= 2;
  if (v5)
  {
    v7 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v8 = (UIView *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v9 = self->_dividerView;
    self->_dividerView = v8;

    v10 = self->_dividerView;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    v12 = self->_dividerView;
    -[NCNotificationListBaseContentView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v12, 3, v13, 0);

    -[NCDigestInlineFeaturedNotificationsContainerView addSubview:](self, "addSubview:", self->_dividerView);
  }
  else
  {
    if (dividerView)
      v6 = v3 > 1;
    else
      v6 = 1;
    if (!v6)
    {
      -[UIView removeFromSuperview](dividerView, "removeFromSuperview");
      v14 = self->_dividerView;
      self->_dividerView = 0;

    }
  }
}

- (void)_layoutDividerViewIfNecessary
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  id v11;
  CGRect v12;

  if (self->_dividerView)
  {
    -[NCDigestInlineFeaturedNotificationsContainerView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UIView frame](self->_dividerView, "frame");
    -[NCNotificationStructuredSectionList listView](self->_inlineFeaturedSectionList, "listView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutOffsetForViewAtIndex:", 1);
    v12.origin.x = v4;
    v12.origin.y = v6;
    v12.size.width = v8;
    v12.size.height = v10;
    CGRectGetWidth(v12);
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_dividerView, "setFrame:");

  }
}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  id v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NCDigestInlineFeaturedNotificationsContainerView;
  v8 = a5;
  v9 = a3;
  -[NCNotificationListBaseContentView _visualStylingProviderDidChange:forCategory:outgoingProvider:](&v10, sel__visualStylingProviderDidChange_forCategory_outgoingProvider_, v9, a4, v8);
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_dividerView, 3, v9, v8, v10.receiver, v10.super_class);

}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_inlineFeaturedSectionList, 0);
  objc_storeStrong((id *)&self->_strokeVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_featuredNotificationContentProviders, 0);
}

@end
