@implementation FRFeldsparContext

- (FCNotificationsConfiguration)notificationsConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeldsparContext cloudContext](self, "cloudContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appConfigurationManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "possiblyUnfetchedAppConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "notificationsConfig"));

  return (FCNotificationsConfiguration *)v5;
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (FRAppActivityMonitor)appActivityMonitor
{
  return self->_appActivityMonitor;
}

- (FRAnalyticsController)analyticsController
{
  return self->_analyticsController;
}

- (void)setUnderlyingImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingImageCache, a3);
}

- (void)setSpotlightManager:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightManager, a3);
}

- (void)setReadingList:(id)a3
{
  objc_storeStrong((id *)&self->_readingList, a3);
}

- (void)setReadingHistory:(id)a3
{
  objc_storeStrong((id *)&self->_readingHistory, a3);
}

- (void)setPresubscribeService:(id)a3
{
  objc_storeStrong((id *)&self->_presubscribeService, a3);
}

- (void)setNotificationManager:(id)a3
{
  objc_storeStrong((id *)&self->_notificationManager, a3);
}

- (void)setIssueViewingSessionManager:(id)a3
{
  objc_storeStrong((id *)&self->_issueViewingSessionManager, a3);
}

- (void)setGizmoSyncManager:(id)a3
{
  objc_storeStrong((id *)&self->_gizmoSyncManager, a3);
}

- (void)setFavoritesPersonalizer:(id)a3
{
  objc_storeStrong((id *)&self->_favoritesPersonalizer, a3);
}

- (void)setCloudContext:(id)a3
{
  objc_storeStrong((id *)&self->_cloudContext, a3);
}

- (void)setArticlePrefetchManager:(id)a3
{
  objc_storeStrong((id *)&self->_articlePrefetchManager, a3);
}

- (void)setArticleContentPool:(id)a3
{
  objc_storeStrong((id *)&self->_articleContentPool, a3);
}

- (void)setAppActivityMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_appActivityMonitor, a3);
}

- (void)setAnalyticsController:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsController, a3);
}

- (FCReadingList)readingList
{
  return self->_readingList;
}

- (FCReadingHistory)readingHistory
{
  return self->_readingHistory;
}

- (FRGizmoSyncManager)gizmoSyncManager
{
  return self->_gizmoSyncManager;
}

- (FRFavoritesPersonalizer)favoritesPersonalizer
{
  return self->_favoritesPersonalizer;
}

- (FRArticleContentPool)articleContentPool
{
  return self->_articleContentPool;
}

- (FCSubscriptionController)subscriptionController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeldsparContext cloudContext](self, "cloudContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "subscriptionController"));

  return (FCSubscriptionController *)v3;
}

- (FCSubscriptionList)subscriptionList
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeldsparContext cloudContext](self, "cloudContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "subscriptionList"));

  return (FCSubscriptionList *)v3;
}

- (FCPrivateChannelMembershipController)privateChannelMembershipController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeldsparContext cloudContext](self, "cloudContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "privateChannelMembershipController"));

  return (FCPrivateChannelMembershipController *)v3;
}

- (FCBundleSubscriptionManagerType)bundleSubscriptionManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeldsparContext cloudContext](self, "cloudContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundleSubscriptionManager"));

  return (FCBundleSubscriptionManagerType *)v3;
}

- (FCShortcutList)shortcutList
{
  return self->_shortcutList;
}

- (void)setShortcutList:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutList, a3);
}

- (FCShortcutCategoryList)shortcutCategoryList
{
  return self->_shortcutCategoryList;
}

- (void)setShortcutCategoryList:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutCategoryList, a3);
}

- (FRNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (FRAppSessionDataReporting)appSessionDataReporter
{
  return self->_appSessionDataReporter;
}

- (void)setAppSessionDataReporter:(id)a3
{
  objc_storeStrong((id *)&self->_appSessionDataReporter, a3);
}

- (FRNonArticleHeadlineVendor)nonArticleVendor
{
  return self->_nonArticleVendor;
}

- (void)setNonArticleVendor:(id)a3
{
  objc_storeStrong((id *)&self->_nonArticleVendor, a3);
}

- (FRArticlePrefetchManager)articlePrefetchManager
{
  return self->_articlePrefetchManager;
}

- (FRSpotlightManager)spotlightManager
{
  return self->_spotlightManager;
}

- (FRStateRestoreController)stateRestoreController
{
  return self->_stateRestoreController;
}

- (void)setStateRestoreController:(id)a3
{
  objc_storeStrong((id *)&self->_stateRestoreController, a3);
}

- (TSSharedImageCacheType)underlyingImageCache
{
  return self->_underlyingImageCache;
}

- (AAViewingSessionManagerType)issueViewingSessionManager
{
  return self->_issueViewingSessionManager;
}

- (FRPresubscribeService)presubscribeService
{
  return self->_presubscribeService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presubscribeService, 0);
  objc_storeStrong((id *)&self->_issueViewingSessionManager, 0);
  objc_storeStrong((id *)&self->_gizmoSyncManager, 0);
  objc_storeStrong((id *)&self->_underlyingImageCache, 0);
  objc_storeStrong((id *)&self->_stateRestoreController, 0);
  objc_storeStrong((id *)&self->_spotlightManager, 0);
  objc_storeStrong((id *)&self->_articlePrefetchManager, 0);
  objc_storeStrong((id *)&self->_articleContentPool, 0);
  objc_storeStrong((id *)&self->_favoritesPersonalizer, 0);
  objc_storeStrong((id *)&self->_nonArticleVendor, 0);
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_storeStrong((id *)&self->_appActivityMonitor, 0);
  objc_storeStrong((id *)&self->_appSessionDataReporter, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_subscriptionList, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_shortcutCategoryList, 0);
  objc_storeStrong((id *)&self->_shortcutList, 0);
  objc_storeStrong((id *)&self->_readingList, 0);
  objc_storeStrong((id *)&self->_readingHistory, 0);
}

@end
