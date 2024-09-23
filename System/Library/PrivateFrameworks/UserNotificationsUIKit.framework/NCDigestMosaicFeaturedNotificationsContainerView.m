@implementation NCDigestMosaicFeaturedNotificationsContainerView

- (NSArray)featuredNotificationContentProviders
{
  return self->_featuredNotificationContentProviders;
}

- (void)setFeaturedNotificationContentProviders:(id)a3
{
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *v11;
  NSMutableArray *notificationViews;
  BOOL v13;
  _QWORD v14[5];
  BOOL v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((BSEqualArrays() & 1) != 0)
  {
    -[NCDigestMosaicFeaturedNotificationsContainerView updateContent](self, "updateContent");
  }
  else
  {
    objc_storeStrong((id *)&self->_featuredNotificationContentProviders, a3);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->_notificationViews;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10++), "removeFromSuperview");
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    notificationViews = self->_notificationViews;
    self->_notificationViews = v11;

    v13 = -[NCDigestMosaicFeaturedNotificationsContainerView _shouldShowImageAttachments](self, "_shouldShowImageAttachments");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __92__NCDigestMosaicFeaturedNotificationsContainerView_setFeaturedNotificationContentProviders___block_invoke;
    v14[3] = &unk_1E8D1F780;
    v14[4] = self;
    v15 = v13;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);
  }

}

void __92__NCDigestMosaicFeaturedNotificationsContainerView_setFeaturedNotificationContentProviders___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  _BOOL8 v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = objc_msgSend(*(id *)(a1 + 32), "_contentViewStyleForIndex:", a3);
  v6 = v5 == 1 || *(_BYTE *)(a1 + 40) != 0;
  v7 = objc_msgSend(*(id *)(a1 + 32), "_isDisplayingRichFeaturedNotifications");
  v8 = *(void **)(a1 + 32);
  if ((v7 & 1) != 0)
    v9 = objc_msgSend(v8, "_newFeaturedNotificationViewForContentProvider:contentViewStyle:showImageAttachment:", v11, v5, v6);
  else
    v9 = objc_msgSend(v8, "_newNotificationSeamlessContentViewForContentProvider:", v11);
  v10 = (void *)v9;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "addObject:", v9);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v10);

}

- (void)updateContent
{
  NSUInteger v3;
  BOOL v4;
  NSArray *featuredNotificationContentProviders;
  _QWORD v6[5];
  BOOL v7;

  v3 = -[NSArray count](self->_featuredNotificationContentProviders, "count");
  if (v3 == -[NSMutableArray count](self->_notificationViews, "count"))
  {
    v4 = -[NCDigestMosaicFeaturedNotificationsContainerView _shouldShowImageAttachments](self, "_shouldShowImageAttachments");
    featuredNotificationContentProviders = self->_featuredNotificationContentProviders;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__NCDigestMosaicFeaturedNotificationsContainerView_updateContent__block_invoke;
    v6[3] = &unk_1E8D1F780;
    v6[4] = self;
    v7 = v4;
    -[NSArray enumerateObjectsUsingBlock:](featuredNotificationContentProviders, "enumerateObjectsUsingBlock:", v6);
  }
  else
  {
    -[NCDigestMosaicFeaturedNotificationsContainerView setFeaturedNotificationContentProviders:](self, "setFeaturedNotificationContentProviders:", self->_featuredNotificationContentProviders);
  }
}

void __65__NCDigestMosaicFeaturedNotificationsContainerView_updateContent__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  _BOOL8 v8;
  id *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v5, "_contentViewStyleForIndex:", a3);
  v8 = v7 == 1 || *(_BYTE *)(a1 + 40) != 0;
  v9 = *(id **)(a1 + 32);
  objc_msgSend(v9[53], "objectAtIndex:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_configureNotificationContentView:withContentProvider:showImageAttachment:contentViewStyle:", v10, v6, v8, v7);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  NSMutableArray *notificationViews;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[8];
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[NCDigestMosaicFeaturedNotificationsContainerView _isDisplayingRichFeaturedNotifications](self, "_isDisplayingRichFeaturedNotifications"))
  {
    v14 = 0;
    v15 = (double *)&v14;
    v16 = 0x2020000000;
    v17 = 0;
    notificationViews = self->_notificationViews;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__NCDigestMosaicFeaturedNotificationsContainerView_sizeThatFits___block_invoke;
    v13[3] = &unk_1E8D1F7A8;
    *(double *)&v13[6] = width;
    *(double *)&v13[7] = height;
    v13[4] = self;
    v13[5] = &v14;
    -[NSMutableArray enumerateObjectsUsingBlock:](notificationViews, "enumerateObjectsUsingBlock:", v13);
    v7 = v15[3];
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    -[NSMutableArray firstObject](self->_notificationViews, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "sizeThatFits:", width, height);
      v7 = v10;
    }
    else
    {
      v7 = 0.0;
    }

  }
  v11 = width;
  v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

void __65__NCDigestMosaicFeaturedNotificationsContainerView_sizeThatFits___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  v21 = a2;
  v6 = *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v7 = objc_msgSend(*(id *)(a1 + 32), "_contentViewStyleForIndex:", a3);
  if (v7)
  {
    if (v7 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "_sizingBoundsForSmallFeaturedViewInRect:", 0.0, 0.0, v6, v5);
      objc_msgSend(v21, "sizeThatFits:", v18, v19);
      v9 = v21;
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v14 = *(double *)(v13 + 24);
      v15 = 10.0;
    }
    else
    {
      v8 = v7 == 2;
      v9 = v21;
      if (!v8)
        goto LABEL_11;
      objc_msgSend(*(id *)(a1 + 32), "_sizingBoundsForLargeFeaturedViewInRect:", 0.0, 0.0, v6, v5);
      objc_msgSend(v21, "sizeThatFits:", v10, v11);
      v9 = v21;
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v14 = *(double *)(v13 + 24);
      v15 = 20.0;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_sizingBoundsForMediumFeaturedViewInRect:", 0.0, 0.0, v6, v5);
    objc_msgSend(v21, "sizeThatFits:", v16, v17);
    v9 = v21;
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(double *)(v13 + 24);
    v15 = 50.0;
  }
  v20 = v12 + v15;
  if (v14 < v20)
    v14 = v20;
  *(double *)(v13 + 24) = v14;
LABEL_11:

}

- (void)layoutSubviews
{
  _BOOL4 v3;
  NSMutableArray *notificationViews;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NCDigestMosaicFeaturedNotificationsContainerView;
  -[NCDigestMosaicFeaturedNotificationsContainerView layoutSubviews](&v7, sel_layoutSubviews);
  v3 = -[NCDigestMosaicFeaturedNotificationsContainerView _isDisplayingRichFeaturedNotifications](self, "_isDisplayingRichFeaturedNotifications");
  notificationViews = self->_notificationViews;
  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__NCDigestMosaicFeaturedNotificationsContainerView_layoutSubviews__block_invoke;
    v6[3] = &unk_1E8D1F7D0;
    v6[4] = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](notificationViews, "enumerateObjectsUsingBlock:", v6);
  }
  else
  {
    -[NSMutableArray firstObject](notificationViews, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCDigestMosaicFeaturedNotificationsContainerView bounds](self, "bounds");
    objc_msgSend(v5, "setFrame:");

  }
}

void __66__NCDigestMosaicFeaturedNotificationsContainerView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  BOOL v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = objc_msgSend(*(id *)(a1 + 32), "_contentViewStyleForIndex:", a3);
  if (v5)
  {
    if (v5 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "_layoutSmallFeaturedView:", v8);
    }
    else
    {
      v6 = v5 == 2;
      v7 = v8;
      if (!v6)
        goto LABEL_9;
      objc_msgSend(*(id *)(a1 + 32), "_layoutLargeFeaturedView:", v8);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_layoutMediumFeaturedView:", v8);
  }
  v7 = v8;
LABEL_9:

}

- (void)_layoutLargeFeaturedView:(id)a3
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
  double v14;
  id v15;
  CGRect v16;

  v4 = a3;
  if (v4)
  {
    v15 = v4;
    objc_msgSend(v4, "frame");
    -[NCDigestMosaicFeaturedNotificationsContainerView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[NCDigestMosaicFeaturedNotificationsContainerView _sizingBoundsForLargeFeaturedViewInRect:](self, "_sizingBoundsForLargeFeaturedViewInRect:");
    objc_msgSend(v15, "sizeThatFits:", v13, v14);
    if (-[NCDigestMosaicFeaturedNotificationsContainerView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      v16.origin.x = v6;
      v16.origin.y = v8;
      v16.size.width = v10;
      v16.size.height = v12;
      CGRectGetMaxX(v16);
    }
    UIRectIntegralWithScale();
    objc_msgSend(v15, "setFrame:");
    -[NCDigestMosaicFeaturedNotificationsContainerView _overlapMarginForLargeFeaturedView](self, "_overlapMarginForLargeFeaturedView");
    objc_msgSend(v15, "setHorizontalMarginForContentOverlap:");
    v4 = v15;
  }

}

- (void)_layoutMediumFeaturedView:(id)a3
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
  double v14;
  id v15;
  CGRect v16;

  v4 = a3;
  if (v4)
  {
    v15 = v4;
    objc_msgSend(v4, "frame");
    -[NCDigestMosaicFeaturedNotificationsContainerView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[NCDigestMosaicFeaturedNotificationsContainerView _sizingBoundsForMediumFeaturedViewInRect:](self, "_sizingBoundsForMediumFeaturedViewInRect:");
    objc_msgSend(v15, "sizeThatFits:", v13, v14);
    -[NSMutableArray count](self->_notificationViews, "count");
    if ((-[NCDigestMosaicFeaturedNotificationsContainerView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") & 1) == 0)
    {
      v16.origin.x = v6;
      v16.origin.y = v8;
      v16.size.width = v10;
      v16.size.height = v12;
      CGRectGetMaxX(v16);
    }
    UIRectIntegralWithScale();
    objc_msgSend(v15, "setFrame:");
    -[NCDigestMosaicFeaturedNotificationsContainerView bringSubviewToFront:](self, "bringSubviewToFront:", v15);
    v4 = v15;
  }

}

- (void)_layoutSmallFeaturedView:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  id v21;
  CGRect v22;
  CGRect v23;

  v4 = a3;
  if (v4)
  {
    v21 = v4;
    objc_msgSend(v4, "frame");
    -[NCDigestMosaicFeaturedNotificationsContainerView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v19 = v10;
    v20 = v9;
    -[NCDigestMosaicFeaturedNotificationsContainerView _sizingBoundsForSmallFeaturedViewInRect:](self, "_sizingBoundsForSmallFeaturedViewInRect:");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v21, "sizeThatFits:", v15, v17);
    v22.origin.x = v12;
    v22.origin.y = v14;
    v22.size.width = v16;
    v22.size.height = v18;
    CGRectGetWidth(v22);
    if ((-[NCDigestMosaicFeaturedNotificationsContainerView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") & 1) == 0)
    {
      v23.origin.y = v19;
      v23.origin.x = v20;
      v23.size.width = v6;
      v23.size.height = v8;
      CGRectGetMaxX(v23);
    }
    UIRectIntegralWithScale();
    objc_msgSend(v21, "setFrame:");
    -[NCDigestMosaicFeaturedNotificationsContainerView bringSubviewToFront:](self, "bringSubviewToFront:", v21);
    v4 = v21;
  }

}

- (id)_newFeaturedNotificationViewForContentProvider:(id)a3 contentViewStyle:(unint64_t)a4 showImageAttachment:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NCDigestMosaicFeaturedNotificationContentView *v9;
  NCDigestMosaicFeaturedNotificationContentView *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;

  v5 = a5;
  v8 = a3;
  v9 = [NCDigestMosaicFeaturedNotificationContentView alloc];
  v10 = -[NCNotificationListBaseContentView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[NCDigestMosaicFeaturedNotificationContentView setContentViewStyle:](v10, "setContentViewStyle:", a4);
  v11 = 0.0;
  if (a4 == 2)
    -[NCDigestMosaicFeaturedNotificationsContainerView _overlapMarginForLargeFeaturedView](self, "_overlapMarginForLargeFeaturedView", 0.0);
  -[NCDigestMosaicFeaturedNotificationContentView setHorizontalMarginForContentOverlap:](v10, "setHorizontalMarginForContentOverlap:", v11);
  objc_msgSend(v8, "notificationRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCDigestMosaicFeaturedNotificationContentView setSectionIdentifier:](v10, "setSectionIdentifier:", v13);

  -[NCDigestMosaicFeaturedNotificationContentView setUserInteractionEnabled:](v10, "setUserInteractionEnabled:", 0);
  -[NCDigestMosaicFeaturedNotificationContentView layer](v10, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShadowColor:", CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E0C9D8E0]));
  objc_msgSend(v14, "setShadowRadius:", 20.0);
  LODWORD(v15) = 1041865114;
  objc_msgSend(v14, "setShadowOpacity:", v15);
  objc_msgSend(v14, "setShadowOffset:", 0.0, 10.0);
  -[NCDigestMosaicFeaturedNotificationsContainerView _configureNotificationContentView:withContentProvider:showImageAttachment:contentViewStyle:](self, "_configureNotificationContentView:withContentProvider:showImageAttachment:contentViewStyle:", v10, v8, v5, a4);

  return v10;
}

- (id)_newNotificationSeamlessContentViewForContentProvider:(id)a3
{
  id v4;
  NCNotificationSeamlessContentView *v5;
  NCNotificationSeamlessContentView *v6;

  v4 = a3;
  v5 = [NCNotificationSeamlessContentView alloc];
  v6 = -[NCNotificationSeamlessContentView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[NCNotificationSeamlessContentView setThumbnailAlignedWithSecondaryText:](v6, "setThumbnailAlignedWithSecondaryText:", 1);
  -[NCNotificationSeamlessContentView setHorizontalMarginPaddingDisabled:](v6, "setHorizontalMarginPaddingDisabled:", 1);
  -[NCNotificationSeamlessContentView setVisualStylingProvider:forCategory:](v6, "setVisualStylingProvider:forCategory:", self->_strokeVisualStylingProvider, 1);
  -[NCDigestMosaicFeaturedNotificationsContainerView _configureNotificationContentView:withContentProvider:showImageAttachment:contentViewStyle:](self, "_configureNotificationContentView:withContentProvider:showImageAttachment:contentViewStyle:", v6, v4, 1, 2);

  return v6;
}

- (void)_configureNotificationContentView:(id)a3 withContentProvider:(id)a4 showImageAttachment:(BOOL)a5 contentViewStyle:(unint64_t)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NCBadgedIconView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NCBadgedIconView *v24;
  void *v25;
  double v26;
  double v27;
  _QWORD v28[4];
  id v29;
  NCDigestMosaicFeaturedNotificationsContainerView *v30;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (a6 == 1 && objc_msgSend(v11, "appNotificationCount"))
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    NCUserNotificationsUIKitFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_FEATURED_COUNT_TEXT"), &stru_1E8D21F60, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v15, objc_msgSend(v12, "appNotificationCount"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v12, "primaryText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "setPrimaryText:", v16);
  objc_msgSend(v12, "primarySubtitleText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPrimarySubtitleText:", v17);

  objc_msgSend(v12, "secondaryText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSecondaryText:", v18);

  v19 = [NCBadgedIconView alloc];
  objc_msgSend(v12, "icons");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectsAtIndexes:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCDigestMosaicFeaturedNotificationsContainerView traitCollection](self, "traitCollection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[NCBadgedIconView initWithProminentIcons:subordinateIcons:badgeText:compatibleWithInitialTraitCollection:](v19, "initWithProminentIcons:subordinateIcons:badgeText:compatibleWithInitialTraitCollection:", v22, 0, 0, v23);
  objc_msgSend(v10, "setBadgedIconView:", v24);

  objc_msgSend(v10, "setAlpha:", 1.0);
  if (v7)
  {
    objc_msgSend(v12, "thumbnail");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setThumbnail:", v25);

    if (-[NCDigestMosaicFeaturedNotificationsContainerView _isDisplayingRichFeaturedNotifications](self, "_isDisplayingRichFeaturedNotifications"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "imageAttachmentSizeRatio");
        v27 = v26;
      }
      else
      {
        v27 = 0.666666667;
      }
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __143__NCDigestMosaicFeaturedNotificationsContainerView__configureNotificationContentView_withContentProvider_showImageAttachment_contentViewStyle___block_invoke;
      v28[3] = &unk_1E8D1F7F8;
      v29 = v10;
      v30 = self;
      objc_msgSend(v12, "fetchFeaturedAttachmentImageWithSizeRatio:completion:", v28, v27);

    }
  }
  -[NCDigestMosaicFeaturedNotificationsContainerView setNeedsLayout](self, "setNeedsLayout");

}

uint64_t __143__NCDigestMosaicFeaturedNotificationsContainerView__configureNotificationContentView_withContentProvider_showImageAttachment_contentViewStyle___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setThumbnail:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  NSString *v4;
  NSComparisonResult v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NCDigestMosaicFeaturedNotificationsContainerView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  v5 = UIContentSizeCategoryCompareToCategory(v4, self->_preferredContentSizeCategory);
  if (v5)
  {
    objc_storeStrong((id *)&self->_preferredContentSizeCategory, v4);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_notificationViews;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "adjustForContentSizeCategoryChange", (_QWORD)v12);
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    -[NCDigestMosaicFeaturedNotificationsContainerView setNeedsLayout](self, "setNeedsLayout");
  }

  return v5 != NSOrderedSame;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  MTVisualStylingProvider *strokeVisualStylingProvider;
  objc_super v5;

  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider)
    return strokeVisualStylingProvider;
  v5.receiver = self;
  v5.super_class = (Class)NCDigestMosaicFeaturedNotificationsContainerView;
  -[NCDigestMosaicFeaturedNotificationsContainerView visualStylingProviderForCategory:](&v5, sel_visualStylingProviderForCategory_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1E8D5FE80;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  MTVisualStylingProvider *v7;
  BOOL v8;
  NSMutableArray *notificationViews;
  MTVisualStylingProvider *v10;
  _QWORD v11[4];
  MTVisualStylingProvider *v12;
  int64_t v13;

  v7 = (MTVisualStylingProvider *)a3;
  if (self->_strokeVisualStylingProvider != v7)
  {
    v10 = v7;
    objc_storeStrong((id *)&self->_strokeVisualStylingProvider, a3);
    v8 = -[NCDigestMosaicFeaturedNotificationsContainerView _isDisplayingRichFeaturedNotifications](self, "_isDisplayingRichFeaturedNotifications");
    v7 = v10;
    if (!v8)
    {
      notificationViews = self->_notificationViews;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __89__NCDigestMosaicFeaturedNotificationsContainerView_setVisualStylingProvider_forCategory___block_invoke;
      v11[3] = &unk_1E8D1F820;
      v13 = a4;
      v12 = v10;
      -[NSMutableArray enumerateObjectsUsingBlock:](notificationViews, "enumerateObjectsUsingBlock:", v11);

      v7 = v10;
    }
  }

}

void __89__NCDigestMosaicFeaturedNotificationsContainerView_setVisualStylingProvider_forCategory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "requiredVisualStyleCategories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if (v5)
    objc_msgSend(v6, "setVisualStylingProvider:forCategory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)setMaterialGroupNameBase:(id)a3
{
  objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
}

- (BOOL)_isDisplayingRichFeaturedNotifications
{
  return -[NSArray count](self->_featuredNotificationContentProviders, "count") > 1;
}

- (BOOL)_shouldShowImageAttachments
{
  void *v3;
  _BOOL4 v4;
  NSArray *featuredNotificationContentProviders;
  char v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") == 1)
  {
    v4 = -[NCDigestMosaicFeaturedNotificationsContainerView _isDisplayingRichFeaturedNotifications](self, "_isDisplayingRichFeaturedNotifications");

    if (v4)
    {
      featuredNotificationContentProviders = self->_featuredNotificationContentProviders;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __79__NCDigestMosaicFeaturedNotificationsContainerView__shouldShowImageAttachments__block_invoke;
      v8[3] = &unk_1E8D1F848;
      v8[4] = &v9;
      -[NSArray enumerateObjectsUsingBlock:](featuredNotificationContentProviders, "enumerateObjectsUsingBlock:", v8);
    }
  }
  else
  {

  }
  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __79__NCDigestMosaicFeaturedNotificationsContainerView__shouldShowImageAttachments__block_invoke(uint64_t result, void *a2, unint64_t a3)
{
  uint64_t v3;

  if (a3 <= 1)
  {
    v3 = result;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
    {
      result = objc_msgSend(a2, "hasAttachmentImage");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = result;
    }
  }
  return result;
}

- (unint64_t)_contentViewStyleForIndex:(unint64_t)a3
{
  if (a3)
    return a3 != 1;
  else
    return 2;
}

- (CGRect)_sizingBoundsForLargeFeaturedViewInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = CGRectGetWidth(a3) * 0.65;
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v8 = CGRectGetHeight(v12);
  v9 = 0.0;
  v10 = 0.0;
  v11 = v7;
  result.size.height = v8;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)_sizingBoundsForMediumFeaturedViewInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = CGRectGetWidth(a3) * 0.45;
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v8 = CGRectGetHeight(v12);
  v9 = 0.0;
  v10 = 0.0;
  v11 = v7;
  result.size.height = v8;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)_sizingBoundsForSmallFeaturedViewInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dbl_1CFD91D70[objc_msgSend(v7, "userInterfaceIdiom") == 1];
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v9 = CGRectGetWidth(v14) * v8;

  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v10 = CGRectGetHeight(v15);
  v11 = 0.0;
  v12 = 0.0;
  v13 = v9;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)_overlapMarginForLargeFeaturedView
{
  NSUInteger v3;
  double result;
  CGFloat Width;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double MaxX;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v3 = -[NSArray count](self->_featuredNotificationContentProviders, "count");
  result = 0.0;
  if (v3 >= 2)
  {
    -[NCDigestMosaicFeaturedNotificationsContainerView bounds](self, "bounds", 0.0);
    -[NCDigestMosaicFeaturedNotificationsContainerView _sizingBoundsForLargeFeaturedViewInRect:](self, "_sizingBoundsForLargeFeaturedViewInRect:");
    Width = CGRectGetWidth(v19);
    -[NCDigestMosaicFeaturedNotificationsContainerView bounds](self, "bounds");
    -[NCDigestMosaicFeaturedNotificationsContainerView _sizingBoundsForMediumFeaturedViewInRect:](self, "_sizingBoundsForMediumFeaturedViewInRect:");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    if (-[NSArray count](self->_featuredNotificationContentProviders, "count") >= 3)
      v14 = 12.0;
    else
      v14 = 0.0;
    -[NCDigestMosaicFeaturedNotificationsContainerView bounds](self, "bounds");
    v15 = CGRectGetWidth(v20) - v14;
    v21.origin.x = v7;
    v21.origin.y = v9;
    v21.size.width = v11;
    v21.size.height = v13;
    v16 = v15 - CGRectGetWidth(v21);
    v22.origin.x = v7;
    v22.origin.y = v9;
    v22.size.width = v11;
    v22.size.height = v13;
    v17 = CGRectGetWidth(v22);
    v23.origin.x = 0.0;
    v23.origin.y = 0.0;
    v23.size.height = 0.0;
    v23.size.width = Width;
    MaxX = CGRectGetMaxX(v23);
    v24.origin.y = 0.0;
    v24.size.height = 0.0;
    v24.origin.x = v16;
    v24.size.width = v17;
    return MaxX - CGRectGetMinX(v24) + -8.0;
  }
  return result;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_strokeVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_notificationViews, 0);
  objc_storeStrong((id *)&self->_featuredNotificationContentProviders, 0);
}

@end
