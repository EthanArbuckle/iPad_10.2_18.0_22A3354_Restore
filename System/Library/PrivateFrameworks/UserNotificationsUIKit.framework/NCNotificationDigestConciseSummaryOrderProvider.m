@implementation NCNotificationDigestConciseSummaryOrderProvider

- (void)setDeviceAuthenticated:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationDigestConciseSummaryOrderProvider;
  -[NCNotificationSummaryOrderProvider setDeviceAuthenticated:](&v5, sel_setDeviceAuthenticated_);
  -[NCNotificationSummaryContentProvider setDeviceAuthenticated:](self->_summaryContentProvider, "setDeviceAuthenticated:", v3);
  -[NCNotificationSummaryOrderProvider configureSummaryContentDisplaying:withSummaryContentProviding:](self, "configureSummaryContentDisplaying:withSummaryContentProviding:", self->_summaryPlatterView, self->_summaryContentProvider);
}

- (BOOL)adjustForContentSizeCategoryChange
{
  -[NCNotificationSummaryPlatterView adjustForContentSizeCategoryChange](self->_summaryPlatterView, "adjustForContentSizeCategoryChange");
  return 1;
}

- (id)leadingSummaryPlatterViewConfigureIfNecessary
{
  NCNotificationSummaryPlatterView *summaryPlatterView;
  NCNotificationSummaryPlatterView *v4;
  NCNotificationSummaryPlatterView *v5;
  NCNotificationSummaryPlatterView *v6;
  void *v7;
  NCNotificationSummaryPlatterView *v8;
  void *v9;

  summaryPlatterView = self->_summaryPlatterView;
  if (!summaryPlatterView)
  {
    v4 = objc_alloc_init(NCNotificationSummaryPlatterView);
    v5 = self->_summaryPlatterView;
    self->_summaryPlatterView = v4;

    -[NCNotificationSummaryPlatterView setFrame:](self->_summaryPlatterView, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_summaryPlatterView;
    -[NCNotificationSummaryOrderProvider materialGroupNameBase](self, "materialGroupNameBase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPlatterView setMaterialGroupNameBase:](v6, "setMaterialGroupNameBase:", v7);

    v8 = self->_summaryPlatterView;
    -[NCNotificationSummaryOrderProvider summaryPlatterViewTapGestureRecognizer](self, "summaryPlatterViewTapGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationSummaryPlatterView addGestureRecognizer:](v8, "addGestureRecognizer:", v9);

    -[NCNotificationDigestConciseSummaryOrderProvider _updateSummaryPlatterView](self, "_updateSummaryPlatterView");
    summaryPlatterView = self->_summaryPlatterView;
  }
  return summaryPlatterView;
}

- (void)_updateSummaryPlatterView
{
  id v3;
  id v4;

  v3 = -[NCNotificationDigestConciseSummaryOrderProvider leadingSummaryPlatterViewConfigureIfNecessary](self, "leadingSummaryPlatterViewConfigureIfNecessary");
  -[NCNotificationDigestConciseSummaryOrderProvider _updateSummaryContentProvider](self, "_updateSummaryContentProvider");
  -[NCNotificationSummaryOrderProvider configureSummaryContentDisplaying:withSummaryContentProviding:](self, "configureSummaryContentDisplaying:withSummaryContentProviding:", self->_summaryPlatterView, self->_summaryContentProvider);
  -[NCNotificationSummaryOrderProvider delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationSummaryOrderProviderRequestsReloadingLeadingSummaryPlatterView:", self);

}

- (void)_updateSummaryContentProvider
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NCNotificationSummaryContentProvider *v8;
  NCNotificationSummaryContentProvider *summaryContentProvider;
  NCNotificationSummaryContentProvider *v10;
  void *v11;
  id v12;

  -[NCNotificationSummaryOrderProvider cachedOrderedNotificationGroupLists](self, "cachedOrderedNotificationGroupLists");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationDigestSummaryOrderProvider userNotificationDigest](self, "userNotificationDigest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewFlattenedGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationSummaryOrderProvider orderedNotificationGroupLists:forATXUserNotificationDigestNotificationGroup:orderGroupNotifications:](self, "orderedNotificationGroupLists:forATXUserNotificationDigestNotificationGroup:orderGroupNotifications:", v12, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    -[NCNotificationSummaryOrderProvider cachedOrderedNotificationGroupLists](self, "cachedOrderedNotificationGroupLists");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  if (objc_msgSend(v5, "count"))
  {
    -[NCNotificationSummaryOrderProvider representativeNotificationRequestsForNotificationGroupLists:](self, "representativeNotificationRequestsForNotificationGroupLists:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[NCNotificationSummaryContentProvider summaryContentProviderOfType:notificationRequests:](NCNotificationSummaryContentProvider, "summaryContentProviderOfType:notificationRequests:", 3, v7);
    v8 = (NCNotificationSummaryContentProvider *)objc_claimAutoreleasedReturnValue();
    summaryContentProvider = self->_summaryContentProvider;
    self->_summaryContentProvider = v8;

    -[NCNotificationSummaryContentProvider setDeviceAuthenticated:](self->_summaryContentProvider, "setDeviceAuthenticated:", -[NCNotificationSummaryOrderProvider isDeviceAuthenticated](self, "isDeviceAuthenticated"));
    v10 = self->_summaryContentProvider;
    -[NCNotificationSummaryOrderProvider summaryHeading](self, "summaryHeading");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationSummaryContentProvider setSummaryTitle:](v10, "setSummaryTitle:", v11);

  }
  else
  {
    v7 = self->_summaryContentProvider;
    self->_summaryContentProvider = 0;
  }

}

- (NCNotificationSummaryPlatterView)summaryPlatterView
{
  return self->_summaryPlatterView;
}

- (void)setSummaryPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_summaryPlatterView, a3);
}

- (NCNotificationSummaryContentProvider)summaryContentProvider
{
  return self->_summaryContentProvider;
}

- (void)setSummaryContentProvider:(id)a3
{
  objc_storeStrong((id *)&self->_summaryContentProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryContentProvider, 0);
  objc_storeStrong((id *)&self->_summaryPlatterView, 0);
}

@end
