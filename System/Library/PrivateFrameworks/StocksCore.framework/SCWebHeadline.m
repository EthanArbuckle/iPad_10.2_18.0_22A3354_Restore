@implementation SCWebHeadline

- (SCWebHeadline)initWithURL:(id)a3 title:(id)a4 shortExcerpt:(id)a5 publishDate:(id)a6 sourceName:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SCWebHeadline *v17;
  uint64_t v18;
  NSString *identifier;
  id v21;
  objc_super v22;

  v13 = a3;
  v21 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SCWebHeadline;
  v17 = -[SCWebHeadline init](&v22, sel_init);
  if (v17)
  {
    objc_msgSend(v13, "absoluteString");
    v18 = objc_claimAutoreleasedReturnValue();
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v18;

    objc_storeStrong((id *)&v17->_contentURL, a3);
    objc_storeStrong((id *)&v17->_title, a4);
    objc_storeStrong((id *)&v17->_shortExcerpt, a5);
    objc_storeStrong((id *)&v17->_publishDate, a6);
    objc_storeStrong((id *)&v17->_sourceName, a7);
  }

  return v17;
}

- (unint64_t)contentType
{
  return 1;
}

- (BOOL)hasThumbnail
{
  return 0;
}

- (BOOL)hasVideo
{
  return 0;
}

- (int64_t)feedElementType
{
  return 0;
}

- (id)versionIdentifier
{
  return CFSTR("1");
}

- (FCChannelProviding)sourceChannel
{
  return 0;
}

- (BOOL)isPaid
{
  return 0;
}

- (BOOL)isPressRelease
{
  return 0;
}

- (NSString)language
{
  return 0;
}

- (BOOL)isANF
{
  return 0;
}

- (NSString)accessoryText
{
  return 0;
}

- (unint64_t)storyType
{
  return 0;
}

- (BOOL)isDisplayingAsNativeAd
{
  return 0;
}

- (BOOL)showSubscriptionRequiredText
{
  return 0;
}

- (FCTopStoriesStyleConfiguration)storyStyle
{
  return 0;
}

- (FCHeadlineThumbnail)thumbnailLQ
{
  return 0;
}

- (FCHeadlineThumbnail)thumbnail
{
  return 0;
}

- (FCHeadlineThumbnail)thumbnailMedium
{
  return 0;
}

- (FCHeadlineThumbnail)thumbnailHQ
{
  return 0;
}

- (FCHeadlineThumbnail)thumbnailUltraHQ
{
  return 0;
}

- (FCHeadlineThumbnail)thumbnailWidgetLQ
{
  return 0;
}

- (id)thumbnailWidgetLQTagged
{
  return 0;
}

- (FCHeadlineThumbnail)thumbnailWidget
{
  return 0;
}

- (id)thumbnailWidgetTagged
{
  return 0;
}

- (FCHeadlineThumbnail)thumbnailWidgetHQ
{
  return 0;
}

- (id)thumbnailWidgetHQTagged
{
  return 0;
}

- (NSURL)routeURL
{
  return 0;
}

- (NSArray)authors
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (int64_t)publisherArticleVersion
{
  return 0;
}

- (NSString)excerpt
{
  return (NSString *)&stru_1E5AFDA90;
}

- (void)enumerateTopicConversionStatsWithBlock:(id)a3
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline enumerateTopicConversionStatsWithBlock:].cold.1();
}

- (void)addSurfacedByArticleListID:(id)a3
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline addSurfacedByArticleListID:].cold.1();
}

- (void)applyConditionalScore:(double)a3
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline applyConditionalScore:].cold.1();
}

- (void)markAsEvergreen
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s method"));
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"-[SCWebHeadline markAsEvergreen]", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (NSDate)displayDate
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline displayDate].cold.1();
  return 0;
}

- (BOOL)usesImageOnTopLayout
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline usesImageOnTopLayout].cold.1();
  return 0;
}

- (unint64_t)topStoryType
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline topStoryType].cold.1();
  return 0;
}

- (BOOL)isTopStory
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline isTopStory].cold.1();
  return 0;
}

- (FCFeedPersonalizedItemScoreProfile)scoreProfile
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline scoreProfile].cold.1();
  return 0;
}

- (double)tileProminenceScore
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline tileProminenceScore].cold.1();
  return 0.0;
}

- (NSString)surfacedByBinID
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline surfacedByBinID].cold.1();
  return 0;
}

- (NSString)surfacedByTopicID
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline surfacedByTopicID].cold.1();
  return 0;
}

- (NSString)surfacedByChannelID
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline surfacedByChannelID].cold.1();
  return 0;
}

- (NSString)surfacedBySectionID
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline surfacedBySectionID].cold.1();
  return 0;
}

- (id)surfacedByTagIDs
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline surfacedByTagIDs].cold.1();
  return 0;
}

- (NSString)referencedArticleID
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline referencedArticleID].cold.1();
  return 0;
}

- (NSString)primaryAudience
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline primaryAudience].cold.1();
  return 0;
}

- (NSString)titleCompact
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline titleCompact].cold.1();
  return 0;
}

- (int64_t)backendArticleVersion
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline backendArticleVersion].cold.1();
  return 0;
}

- (CGRect)thumbnailFocalFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline thumbnailFocalFrame].cold.1();
  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSDate)lastModifiedDate
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline lastModifiedDate].cold.1();
  return 0;
}

- (NSDate)lastFetchedDate
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline lastFetchedDate].cold.1();
  return 0;
}

- (NSArray)topics
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline topics].cold.1();
  return 0;
}

- (NSArray)topicIDs
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline topicIDs].cold.1();
  return 0;
}

- (id)endOfArticleTopicIDs
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline endOfArticleTopicIDs].cold.1();
  return 0;
}

- (NSURL)videoURL
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline videoURL].cold.1();
  return 0;
}

- (double)videoDuration
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline videoDuration].cold.1();
  return 0.0;
}

- (BOOL)isFeatureCandidate
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline isFeatureCandidate].cold.1();
  return 0;
}

- (BOOL)isSponsored
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline isSponsored].cold.1();
  return 0;
}

- (NSString)sponsoredBy
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline sponsoredBy].cold.1();
  return 0;
}

- (NSArray)iAdCategories
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline iAdCategories].cold.1();
  return 0;
}

- (NSArray)iAdKeywords
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline iAdKeywords].cold.1();
  return 0;
}

- (NSArray)iAdSectionIDs
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline iAdSectionIDs].cold.1();
  return 0;
}

- (NSArray)blockedStorefrontIDs
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline blockedStorefrontIDs].cold.1();
  return 0;
}

- (NSArray)allowedStorefrontIDs
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline allowedStorefrontIDs].cold.1();
  return 0;
}

- (BOOL)isDeleted
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline isDeleted].cold.1();
  return 0;
}

- (BOOL)isDraft
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline isDraft].cold.1();
  return 0;
}

- (NSString)localDraftPath
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline localDraftPath].cold.1();
  return 0;
}

- (NSArray)relatedArticleIDs
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline relatedArticleIDs].cold.1();
  return 0;
}

- (NSArray)moreFromPublisherArticleIDs
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline moreFromPublisherArticleIDs].cold.1();
  return 0;
}

- (int64_t)minimumNewsVersion
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline minimumNewsVersion].cold.1();
  return 0;
}

- (FCCoverArt)coverArt
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline coverArt].cold.1();
  return 0;
}

- (NSString)videoCallToActionTitle
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline videoCallToActionTitle].cold.1();
  return 0;
}

- (NSURL)videoCallToActionURL
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline videoCallToActionURL].cold.1();
  return 0;
}

- (BOOL)needsRapidUpdates
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline needsRapidUpdates].cold.1();
  return 0;
}

- (BOOL)showMinimalChrome
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline showMinimalChrome].cold.1();
  return 0;
}

- (BOOL)isBoundToContext
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline isBoundToContext].cold.1();
  return 0;
}

- (BOOL)isHiddenFromFeeds
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline isHiddenFromFeeds].cold.1();
  return 0;
}

- (NSString)sourceFeedID
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline sourceFeedID].cold.1();
  return 0;
}

- (NSString)publisherID
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline publisherID].cold.1();
  return 0;
}

- (double)globalUserFeedback
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline globalUserFeedback].cold.1();
  return 0.0;
}

- (BOOL)hasGlobalUserFeedback
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline hasGlobalUserFeedback].cold.1();
  return 0;
}

- (unint64_t)articleContentType
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline articleContentType].cold.1();
  return 0;
}

- (unint64_t)halfLife
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline halfLife].cold.1();
  return 0;
}

- (BOOL)isBlockedExplicitContent
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline isBlockedExplicitContent].cold.1();
  return 0;
}

- (unint64_t)feedOrder
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline feedOrder].cold.1();
  return 0;
}

- (BOOL)isFromBlockedStorefront
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline isFromBlockedStorefront].cold.1();
  return 0;
}

- (BOOL)isExplicitContent
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline isExplicitContent].cold.1();
  return 0;
}

- (NSString)feedID
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline feedID].cold.1();
  return 0;
}

- (unint64_t)order
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline order].cold.1();
  return 0;
}

- (NSString)sourceChannelID
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline sourceChannelID].cold.1();
  return 0;
}

- (unint64_t)publishDateMilliseconds
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline publishDateMilliseconds].cold.1();
  return 0;
}

- (unint64_t)feedHalfLifeMilliseconds
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline feedHalfLifeMilliseconds].cold.1();
  return 0;
}

- (double)globalScore
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline globalScore].cold.1();
  return 0.0;
}

- (BOOL)canBePurchased
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline canBePurchased].cold.1();
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline globalCohorts].cold.1();
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)publisherCohorts
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline publisherCohorts].cold.1();
  return 0;
}

- (id)articleRecirculationConfigJSON
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline articleRecirculationConfigJSON].cold.1();
  return 0;
}

- (NSArray)publisherSpecifiedArticleIDs
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline publisherSpecifiedArticleIDs].cold.1();
  return 0;
}

- (FCNativeAdProviding)associatedAd
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline associatedAd].cold.1();
  return 0;
}

- (BOOL)isHiddenFromAutoFavorites
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline isHiddenFromAutoFavorites].cold.1();
  return 0;
}

- (BOOL)showPublisherLogo
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline showPublisherLogo].cold.1();
  return 0;
}

- (BOOL)isFullTrackAvailableToAll
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline isFullTrackAvailableToAll].cold.1();
  return 0;
}

- (NSArray)narrators
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline narrators].cold.1();
  return 0;
}

- (BOOL)disablePrerollAds
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline disablePrerollAds].cold.1();
  return 0;
}

- (BOOL)disableTapToChannel
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline disableTapToChannel].cold.1();
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline globalConversionStats].cold.1();
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)publisherConversionStats
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline publisherConversionStats].cold.1();
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)publisherTagMetadata
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline publisherTagMetadata].cold.1();
  return 0;
}

- (BOOL)hasVideoStillImage
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline hasVideoStillImage].cold.1();
  return 0;
}

- (FCAssetHandle)videoStillImage
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline videoStillImage].cold.1();
  return 0;
}

- (NSString)videoType
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline videoType].cold.1();
  return 0;
}

- (BOOL)isCoread
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline isCoread].cold.1();
  return 0;
}

- (NSString)nativeAdCampaignData
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline nativeAdCampaignData].cold.1();
  return 0;
}

- (NSArray)sportsEventIDs
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline sportsEventIDs].cold.1();
  return 0;
}

- (NSArray)surfacedByArticleListIDs
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline surfacedByArticleListIDs].cold.1();
  return 0;
}

- (BOOL)aiGenerated
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SCWebHeadline aiGenerated].cold.1();
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)shortExcerpt
{
  return self->_shortExcerpt;
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_shortExcerpt, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)enumerateTopicConversionStatsWithBlock:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s method"));
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"-[SCWebHeadline enumerateTopicConversionStatsWithBlock:]", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)addSurfacedByArticleListID:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s method"));
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"-[SCWebHeadline addSurfacedByArticleListID:]", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)applyConditionalScore:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s method"));
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"-[SCWebHeadline applyConditionalScore:]", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)displayDate
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"displayDate", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)usesImageOnTopLayout
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"usesImageOnTopLayout", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)topStoryType
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"topStoryType", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)isTopStory
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isTopStory", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)scoreProfile
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"scoreProfile", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)tileProminenceScore
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"tileProminenceScore", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)surfacedByBinID
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"surfacedByBinID", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)surfacedByTopicID
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"surfacedByTopicID", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)surfacedByChannelID
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"surfacedByChannelID", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)surfacedBySectionID
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"surfacedBySectionID", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)surfacedByTagIDs
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"surfacedByTagIDs", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)referencedArticleID
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"referencedArticleID", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)primaryAudience
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"primaryAudience", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)titleCompact
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"titleCompact", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)backendArticleVersion
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"backendArticleVersion", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)thumbnailFocalFrame
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"thumbnailFocalFrame", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)lastModifiedDate
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"lastModifiedDate", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)lastFetchedDate
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"lastFetchedDate", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)topics
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"topics", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)topicIDs
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"topicIDs", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)endOfArticleTopicIDs
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"endOfArticleTopicIDs", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)videoURL
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"videoURL", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)videoDuration
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"videoDuration", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)isFeatureCandidate
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isFeatureCandidate", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)isSponsored
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isSponsored", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)sponsoredBy
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sponsoredBy", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)iAdCategories
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"iAdCategories", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)iAdKeywords
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"iAdKeywords", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)iAdSectionIDs
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"iAdSectionIDs", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)blockedStorefrontIDs
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"blockedStorefrontIDs", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)allowedStorefrontIDs
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"allowedStorefrontIDs", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)isDeleted
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isDeleted", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)isDraft
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isDraft", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)localDraftPath
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"localDraftPath", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)relatedArticleIDs
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"relatedArticleIDs", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)moreFromPublisherArticleIDs
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"moreFromPublisherArticleIDs", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)minimumNewsVersion
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"minimumNewsVersion", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)coverArt
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"coverArt", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)videoCallToActionTitle
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"videoCallToActionTitle", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)videoCallToActionURL
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"videoCallToActionURL", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)needsRapidUpdates
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"needsRapidUpdates", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)showMinimalChrome
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"showMinimalChrome", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)isBoundToContext
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isBoundToContext", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)isHiddenFromFeeds
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isHiddenFromFeeds", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)sourceFeedID
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sourceFeedID", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)publisherID
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"publisherID", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)globalUserFeedback
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"globalUserFeedback", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)hasGlobalUserFeedback
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"hasGlobalUserFeedback", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)articleContentType
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"articleContentType", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)halfLife
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"halfLife", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)isBlockedExplicitContent
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isBlockedExplicitContent", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)feedOrder
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedOrder", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)isFromBlockedStorefront
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isFromBlockedStorefront", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)isExplicitContent
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isExplicitContent", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)feedID
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedID", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)order
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"order", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)sourceChannelID
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sourceChannelID", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)publishDateMilliseconds
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"publishDateMilliseconds", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)feedHalfLifeMilliseconds
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedHalfLifeMilliseconds", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)globalScore
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"globalScore", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)canBePurchased
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"canBePurchased", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)globalCohorts
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"globalCohorts", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)publisherCohorts
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"publisherCohorts", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)articleRecirculationConfigJSON
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"articleRecirculationConfigJSON", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)publisherSpecifiedArticleIDs
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"publisherSpecifiedArticleIDs", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)associatedAd
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"associatedAd", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)isHiddenFromAutoFavorites
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isHiddenFromAutoFavorites", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)showPublisherLogo
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"showPublisherLogo", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)isFullTrackAvailableToAll
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isFullTrackAvailableToAll", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)narrators
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"narrators", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)disablePrerollAds
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"disablePrerollAds", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)disableTapToChannel
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"disableTapToChannel", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)globalConversionStats
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"globalConversionStats", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)publisherConversionStats
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"publisherConversionStats", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)publisherTagMetadata
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"publisherTagMetadata", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)hasVideoStillImage
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"hasVideoStillImage", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)videoStillImage
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"videoStillImage", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)videoType
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"videoType", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)isCoread
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"isCoread", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)nativeAdCampaignData
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"nativeAdCampaignData", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)sportsEventIDs
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sportsEventIDs", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)surfacedByArticleListIDs
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"surfacedByArticleListIDs", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)aiGenerated
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SCWebHeadline does not support the %s property"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1ABCEF000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"aiGenerated", v6, 2u);

  OUTLINED_FUNCTION_2_1();
}

@end
