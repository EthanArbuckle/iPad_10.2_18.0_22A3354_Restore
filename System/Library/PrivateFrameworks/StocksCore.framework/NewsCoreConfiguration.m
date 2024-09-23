@implementation NewsCoreConfiguration

- (FCPaidBundleConfiguration)paidBundleConfig
{
  return (FCPaidBundleConfiguration *)sub_1ABD01D08(self);
}

- (int64_t)articleRapidUpdatesTimeout
{
  return 60;
}

- (void).cxx_destruct
{
  _BYTE v3[3120];
  _BYTE __dst[512];

  swift_bridgeObjectRelease();
  memcpy(v3, (char *)self + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration, sizeof(v3));
  sub_1ABD7DDF4((uint64_t)v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  memcpy(__dst, (char *)self + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_paidBundleConfiguration, 0x1F9uLL);
  sub_1ABDF2060((uint64_t)__dst);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

- (NSDictionary)endpointConfigsByEnvironment
{
  _TtC10StocksCore21NewsCoreConfiguration *v2;
  void *v3;

  v2 = self;
  NewsCoreConfiguration.endpointConfigsByEnvironment.getter();

  v3 = (void *)sub_1ABF31618();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (FCTopStoriesConfiguration)topStoriesConfig
{
  _TtC10StocksCore21NewsCoreConfiguration *v2;
  void *v3;
  void *v4;

  v2 = self;
  NewsCoreConfiguration.topStoriesConfig.getter();
  v4 = v3;

  return (FCTopStoriesConfiguration *)v4;
}

- (int64_t)entitlementsRequestTimeoutDurationInSeconds
{
  return *(_QWORD *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 2782];
}

- (NSString)experimentalizableFieldPostfix
{
  void *v2;

  if (*(_QWORD *)&self->experimentalizableFieldPostfix[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_experimentalizableFieldPostfix])
  {
    sub_1ABF2FF5C();
    v2 = (void *)sub_1ABF31780();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)useSecureConnectionForAssets
{
  return 1;
}

- (NSNumber)currentTreatment
{
  return (NSNumber *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, 0);
}

- (id)copyWithZone:(void *)a3
{
  _TtC10StocksCore21NewsCoreConfiguration *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  NewsCoreConfiguration.copy(with:)((uint64_t)v3);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_1ABF32224();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

- (BOOL)shouldShowAlternateHeadlines
{
  return 0;
}

- (NSArray)deprecatedSportsTopicTagIds
{
  return (NSArray *)(id)sub_1ABF319FC();
}

- (BOOL)isOrderFeedEndpointEnabled
{
  return 1;
}

- (id)personalizationTreatment
{
  return sub_1ABD01D08(self);
}

- (BOOL)todayFeedEnabled
{
  return 0;
}

- (FCPuzzlesConfiguration)puzzlesConfig
{
  return (FCPuzzlesConfiguration *)sub_1ABD47C84((uint64_t)self, (uint64_t)a2, (Class *)0x1E0D58E68);
}

- (FCNewsPersonalizationConfiguration)newsPersonalizationConfiguration
{
  return (FCNewsPersonalizationConfiguration *)sub_1ABD47C84((uint64_t)self, (uint64_t)a2, (Class *)0x1E0D58CE0);
}

- (int64_t)analyticsEndpointMaxPayloadSize
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_analyticsEndpointMaxPayloadSize);
}

- (int64_t)maxRetriesForDroppedFeeds
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_maxRetriesForDroppedFeeds);
}

- (double)delayBeforeRetryingDroppedFeeds
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_delayBeforeRetryingDroppedFeeds);
}

- (BOOL)enableCacheFallbackForArticleRecirculation
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_enableCacheFallbackForArticleRecirculation);
}

- (double)prerollLoadingTimeout
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_prerollLoadingTimeout);
}

- (double)prerollReadyToPlayTimeout
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_prerollReadyToPlayTimeout);
}

- (BOOL)isPrivateDataEncryptionRequired
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_isPrivateDataEncryptionRequired);
}

- (_TtC10StocksCore21NewsCoreConfiguration)init
{
  _TtC10StocksCore21NewsCoreConfiguration *result;

  result = (_TtC10StocksCore21NewsCoreConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (NSString)forYouRecordConfigID
{
  return (NSString *)(id)sub_1ABF31780();
}

- (BOOL)isPrivateDataEncryptionAllowed
{
  return 1;
}

- (BOOL)isPrivateDataEncryptionMigrationDesired
{
  return 0;
}

- (BOOL)isPrivateDataMigrationCleanupEnabled
{
  return 0;
}

- (BOOL)privateDataShouldSecureSubscriptions
{
  return 0;
}

- (BOOL)diversifyOptionalTopStories
{
  return 1;
}

- (int64_t)savedArticlesCutoffTime
{
  return 0;
}

- (int64_t)savedArticlesOpenedCutoffTime
{
  return 0;
}

- (int64_t)savedArticlesMaximumCountWiFi
{
  return 0;
}

- (int64_t)savedArticlesMaximumCountCellular
{
  return 0;
}

- (id)analyticsEnvelopeContentTypeConfigsForEnvironment:(unint64_t)a3
{
  _TtC10StocksCore21NewsCoreConfiguration *v4;
  void *v5;

  v4 = self;
  NewsCoreConfiguration.analyticsEnvelopeContentTypeConfigs(for:)(a3);

  sub_1ABCF7BCC(0, (unint64_t *)&qword_1ED34FD80);
  sub_1ABCF7BCC(0, &qword_1ED3511D0);
  sub_1ABDF1218();
  v5 = (void *)sub_1ABF31618();
  swift_bridgeObjectRelease();
  return v5;
}

- (int64_t)subscriptionsGlobalMeteredCount
{
  return 0;
}

- (double)endOfArticleMinPaidHeadlineRatio
{
  double result;

  result = *(double *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration
                                            + 2630];
  if (self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 2638])
    return 0.25;
  return result;
}

- (int64_t)endOfArticleMaxInaccessiblePaidArticleCount
{
  if (self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 2654])
    return 2;
  else
    return *(_QWORD *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration
                                            + 2646];
}

- (int64_t)endOfArticleExpireArticlesAfter
{
  if (self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 2670])
    return 2592000;
  else
    return *(_QWORD *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration
                                            + 2662];
}

- (double)interstitialAdLoadDelay
{
  double result;

  result = *(double *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration
                                            + 2678];
  if (self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 2686])
    return 1.0;
  return result;
}

- (NSArray)permanentChannelIDs
{
  return (NSArray *)0;
}

- (NSString)briefingsTagID
{
  return (NSString *)0;
}

- (FCNotificationsConfiguration)notificationsConfig
{
  return (FCNotificationsConfiguration *)sub_1ABD47C84((uint64_t)self, (uint64_t)a2, (Class *)0x1E0D58D10);
}

- (FCEmbedProxyConfiguration)embedProxyConfiguration
{
  _TtC10StocksCore21NewsCoreConfiguration *v2;
  id v3;

  v2 = self;
  v3 = NewsCoreConfiguration.embedProxyConfiguration.getter();

  return (FCEmbedProxyConfiguration *)v3;
}

- (FCPeopleAlsoReadConfiguration)peopleAlsoReadConfiguration
{
  return (FCPeopleAlsoReadConfiguration *)0;
}

- (int64_t)appConfigRefreshRate
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)trendingTopicsRefreshRate
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)notificationEnabledChannelsRefreshFrequency
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSArray)presubscribedFeedIDs
{
  NSArray *result;

  result = (NSArray *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSString)breakingNewsChannelID
{
  NSString *result;

  result = (NSString *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSString)trendingTagID
{
  NSString *result;

  result = (NSString *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSString)featuredStoriesTagID
{
  NSString *result;

  result = (NSString *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSString)savedStoriesTagID
{
  NSString *result;

  result = (NSString *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSString)myMagazinesTagID
{
  NSString *result;

  result = (NSString *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSString)mySportsTagID
{
  NSString *result;

  result = (NSString *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSString)sportsTopStoriesTagID
{
  NSString *result;

  result = (NSString *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSString)shortcutsTagID
{
  NSString *result;

  result = (NSString *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSString)editorialGemsSectionID
{
  NSString *result;

  result = (NSString *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSString)editorialChannelID
{
  NSString *result;

  result = (NSString *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSArray)hiddenFeedIDs
{
  NSArray *result;

  result = (NSArray *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (FCForYouGroupsConfiguration)forYouGroupsConfiguration
{
  FCForYouGroupsConfiguration *result;

  result = (FCForYouGroupsConfiguration *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)minimumDurationBetweenForYouGroupsWeekday
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)minimumDurationBetweenForYouGroupsWeekend
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)minimumDurationBetweenTrendingGroupsWeekday
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)minimumDurationBetweenTrendingGroupsWeekend
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)expiredPaidSubscriptionGroupCutoffTime
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)maximumNumberOfExpiredPaidSubscriptionGroups
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)maximumTimesHeadlineInPaidSubscriptionGroup
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)maximumPaidSubscriptionGroupSizeiPad
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)maximumPaidSubscriptionGroupSizeiPhone
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)optionalTopStoriesRefreshRate
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (double)minimumTrendingUnseenRatio
{
  double result;

  sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (FCVideoGroupsConfig)forYouVideoGroupsConfig
{
  FCVideoGroupsConfig *result;

  result = (FCVideoGroupsConfig *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)minimumDistanceBetweenImageOnTopTiles
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)expirePinnedArticlesAfter
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (BOOL)universalLinksEnabled
{
  return 1;
}

- (NSString)embedConfigurationAssetID
{
  void *v2;

  sub_1ABF2FF5C();
  v2 = (void *)sub_1ABF31780();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSArray)mediaSharingBlacklistedChannelIDs
{
  void *v2;

  sub_1ABF2FF5C();
  v2 = (void *)sub_1ABF319FC();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSString)webEmbedContentBlockers
{
  void *v2;

  sub_1ABF2FF5C();
  v2 = (void *)sub_1ABF31780();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)webEmbedContentBlockerOverrides
{
  void *v2;

  sub_1ABF2FF5C();
  v2 = (void *)sub_1ABF31780();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)anfRenderingConfiguration
{
  void *v2;

  sub_1ABF2FF5C();
  v2 = (void *)sub_1ABF31780();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)endOfArticleFeedConfigurationResourceId
{
  void *v2;

  sub_1ABF2FF5C();
  v2 = (void *)sub_1ABF31780();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)userConcernConfigurationResourceId
{
  void *v2;

  if (*(_QWORD *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 2886])
  {
    sub_1ABF2FF5C();
    v2 = (void *)sub_1ABF31780();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)aiAttributionArticleString
{
  void *v2;

  if (*(_QWORD *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 2902])
  {
    sub_1ABF2FF5C();
    v2 = (void *)sub_1ABF31780();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (FCPaidBundleViaOfferConfig)paidBundleViaOfferConfig
{
  return (FCPaidBundleViaOfferConfig *)sub_1ABD01D08(self);
}

- (int64_t)subscriptionsPlacardGlobalMaximumPerDay
{
  int64_t result;

  result = *(_QWORD *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration
                                            + 2734];
  if (result < 0)
    __break(1u);
  return result;
}

- (int64_t)subscriptionsPlacardPublisherFrequencyInSeconds
{
  double v2;

  v2 = *(double *)(self + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 2792);
  if ((~*(_QWORD *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v2 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v2 < 9.22337204e18)
    return (uint64_t)v2;
LABEL_7:
  __break(1u);
  return self;
}

- (int64_t)subscriptionsGracePeriodForTokenVerificationSeconds
{
  double v2;

  v2 = *(double *)(self + OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 2808);
  if ((~*(_QWORD *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v2 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v2 < 9.22337204e18)
    return (uint64_t)v2;
LABEL_7:
  __break(1u);
  return self;
}

- (BOOL)hideAllPaywalls
{
  return self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 2750];
}

- (BOOL)hideAlacartePaywalls
{
  return self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 2751];
}

- (FCIAdConfiguration)iAdConfig
{
  id v3;
  char v5[8];
  __int128 v6;

  sub_1ABCF7BCC(0, &qword_1ED3471D0);
  v5[0] = self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 1486];
  v6 = *(_OWORD *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 1494];
  sub_1ABD82258(v5);
  return (FCIAdConfiguration *)v3;
}

- (unint64_t)likeDislikeBehavior
{
  return *(_QWORD *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 2758];
}

- (int64_t)autoRefreshMinimumInterval
{
  return 120;
}

- (NSDictionary)articleConfig
{
  _TtC10StocksCore21NewsCoreConfiguration *v3;
  uint64_t v4;
  _TtC10StocksCore21NewsCoreConfiguration *v5;
  void *v6;

  if (!*(_QWORD *)&self->appConfiguration[OBJC_IVAR____TtC10StocksCore21NewsCoreConfiguration_appConfiguration + 3046])
  {
    v5 = self;
    goto LABEL_5;
  }
  sub_1ABDF1B70(0, (unint64_t *)&qword_1ED34FB68, (uint64_t (*)(uint64_t))MEMORY[0x1E0DB48B0], (uint64_t (*)(uint64_t, _QWORD, uint64_t, _QWORD))MEMORY[0x1E0DEA048]);
  sub_1ABDF1270();
  v3 = self;
  v4 = sub_1ABF316B4();
  if (!v4)
  {
LABEL_5:
    sub_1ABD18978(MEMORY[0x1E0DEE9D8]);

    goto LABEL_6;
  }
  sub_1ABD1F230(v4);

  swift_bridgeObjectRelease();
LABEL_6:
  v6 = (void *)sub_1ABF31618();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v6;
}

- (NSArray)onboardingFeedIDs
{
  NSArray *result;

  result = (NSArray *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)autoScrollToTopFeedTimeout
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (FCPrefetchConfiguration)prefetchConfig
{
  FCPrefetchConfiguration *result;

  result = (FCPrefetchConfiguration *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)newFavoriteNotificationAlertsFrequency
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)notificationArticleCacheTimeout
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)notificationArticleWithRapidUpdatesCacheTimeout
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSString)widgetConfigID
{
  NSString *result;

  result = (NSString *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)widgetMinimumArticleExposureDurationToBePreseenInMilliseconds
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (unsigned)widgetMinimumNumberOfTimesPreseenToBeSeen
{
  unsigned int result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (double)articleDiversificationSimilarityExpectationStart
{
  double result;

  sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (double)articleDiversificationSimilarityExpectationEnd
{
  double result;

  sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (double)articleDiversificationUniquePublisherExpectationSlope
{
  double result;

  sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (double)articleDiversificationUniquePublisherExpectationYIntercept
{
  double result;

  sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSString)personalizationBundleIdMappingResourceId
{
  NSString *result;

  result = (NSString *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSString)personalizationUrlMappingResourceId
{
  NSString *result;

  result = (NSString *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSString)personalizationWhitelistResourceId
{
  NSString *result;

  result = (NSString *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSString)personalizationFavorabilityResourceId
{
  NSString *result;

  result = (NSString *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)corryBarMaxArticleCountForArticleList
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)corryBarMaxArticleCountForSingleArticle
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (BOOL)corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers
{
  BOOL result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSString)exploreArticleID
{
  NSString *result;

  result = (NSString *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSArray)externalAnalyticsConfigurations
{
  NSArray *result;

  result = (NSArray *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)stateRestorationAllowedTimeWindow
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (BOOL)terminateAppOnBackgroundAfterJoiningOrLeavingExperiment
{
  BOOL result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSArray)topStoriesPublishDates
{
  NSArray *result;

  result = (NSArray *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSString)articleRecirculationConfigJSON
{
  NSString *result;

  result = (NSString *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (unint64_t)trendingStyle
{
  unint64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NTPBDiscoverMoreVideosInfo)shareDiscoverMoreVideosInfo
{
  NTPBDiscoverMoreVideosInfo *result;

  result = (NTPBDiscoverMoreVideosInfo *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (NSString)articleRecirculationComponentPlacementConfigJSON
{
  NSString *result;

  result = (NSString *)sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (int64_t)articleRecirculationPopularFeedQueryTimeRange
{
  int64_t result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

- (BOOL)disableThumbnailsForArticleRecirculation
{
  BOOL result;

  result = sub_1ABF31FCC();
  __break(1u);
  return result;
}

@end
