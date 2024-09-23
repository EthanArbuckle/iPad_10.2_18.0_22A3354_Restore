@implementation SFSearchResult

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSString)sectionBundleIdentifier
{
  return self->_sectionBundleIdentifier;
}

- (SFCard)inlineCard
{
  return self->_inlineCard;
}

- (NSString)resultBundleId
{
  return self->_resultBundleId;
}

- (SFCard)compactCard
{
  return self->_compactCard;
}

- (int)type
{
  return self->_type;
}

- (int)topHit
{
  return self->_topHit;
}

- (BOOL)isStaticCorrection
{
  return self->_isStaticCorrection;
}

- (BOOL)isLocalApplicationResult
{
  return self->_isLocalApplicationResult;
}

- (BOOL)usesCompactDisplay
{
  return self->_usesCompactDisplay;
}

- (BOOL)renderHorizontallyWithOtherResultsInCategory
{
  return self->_renderHorizontallyWithOtherResultsInCategory;
}

- (BOOL)noGoTakeover
{
  return self->_noGoTakeover;
}

- (BOOL)wasCompact
{
  return self->_wasCompact;
}

- (NSString)userInput
{
  return self->_userInput;
}

- (BOOL)shouldUseCompactDisplay
{
  return self->_shouldUseCompactDisplay;
}

- (BOOL)shouldAutoNavigate
{
  return self->_shouldAutoNavigate;
}

- (NSString)resultType
{
  return self->_resultType;
}

- (double)rankingScore
{
  return self->_rankingScore;
}

- (SFPunchout)punchout
{
  return self->_punchout;
}

- (BOOL)publiclyIndexable
{
  return self->_publiclyIndexable;
}

- (BOOL)preferTopPlatter
{
  return self->_preferTopPlatter;
}

- (SFMailResultDetails)mailResultDetails
{
  return self->_mailResultDetails;
}

- (SFMailRankingSignals)mailRankingSignals
{
  return self->_mailRankingSignals;
}

- (NSDictionary)localFeatures
{
  return self->_localFeatures;
}

- (BOOL)isVideoAssetFromPhotos
{
  return self->_isVideoAssetFromPhotos;
}

- (BOOL)isMailInstantAnswerUpdated
{
  return self->_isMailInstantAnswerUpdated;
}

- (BOOL)isInstantAnswer
{
  return self->_isInstantAnswer;
}

- (BOOL)isFuzzyMatch
{
  return self->_isFuzzyMatch;
}

- (NSString)intendedQuery
{
  return self->_intendedQuery;
}

- (NSNumber)indexOfSectionWhenRanked
{
  return self->_indexOfSectionWhenRanked;
}

- (NSNumber)indexOfResultInSectionWhenRanked
{
  return self->_indexOfResultInSectionWhenRanked;
}

- (NSString)fbr
{
  return self->_fbr;
}

- (NSData)entityData
{
  return self->_entityData;
}

- (BOOL)doNotFold
{
  return self->_doNotFold;
}

- (BOOL)didTakeoverGo
{
  return self->_didTakeoverGo;
}

- (BOOL)didRerankPersonalResult
{
  return self->_didRerankPersonalResult;
}

- (NSString)correctedQuery
{
  return self->_correctedQuery;
}

- (SFCoreSpotlightRankingSignals)coreSpotlightRankingSignals
{
  return self->_coreSpotlightRankingSignals;
}

- (int)coreSpotlightIndexUsed
{
  return self->_coreSpotlightIndexUsed;
}

- (int)coreSpotlightIndexUsedReason
{
  return self->_coreSpotlightIndexUsedReason;
}

- (BOOL)containsPersonalResult
{
  return self->_containsPersonalResult;
}

- (NSString)completedQuery
{
  return self->_completedQuery;
}

- (SFCard)card
{
  return self->_card;
}

- (unint64_t)blockId
{
  return self->_blockId;
}

- (SFActionItem)action
{
  return self->_action;
}

- (void)setSectionBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (SFTopic)requestedTopic
{
  return self->_requestedTopic;
}

- (SFText)title
{
  return self->_title;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void)setResultBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (void)setRenderHorizontallyWithOtherResultsInCategory:(BOOL)a3
{
  self->_renderHorizontallyWithOtherResultsInCategory = a3;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (void)setIsLocalApplicationResult:(BOOL)a3
{
  self->_isLocalApplicationResult = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (double)personalizationScore
{
  return self->_personalizationScore;
}

- (NSData)mapsData
{
  void *v3;
  void *v4;
  NSData *mapsData;
  NSData *v6;
  NSData *v7;

  -[SFCard cardSections](self->_inlineCard, "cardSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  mapsData = self->_mapsData;
  if (mapsData)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    mapsData = self->_mapsData;
LABEL_5:
    v6 = mapsData;
    goto LABEL_6;
  }
  objc_msgSend(v4, "mapsData");
  v6 = (NSData *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v7 = v6;

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "encodeObject:forKey:", self->_identifier, CFSTR("_identifier"));
  objc_msgSend(v11, "encodeDouble:forKey:", CFSTR("_rankingScore"), self->_rankingScore);
  objc_msgSend(v11, "encodeInteger:forKey:", self->_topHit, CFSTR("_topHit"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_thumbnail, CFSTR("_thumbnail"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_preventThumbnailImageScaling, CFSTR("_preventThumbnailImageScaling"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_title, CFSTR("_title"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_secondaryTitle, CFSTR("_secondaryTitle"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_secondaryTitleImage, CFSTR("_secondaryTitleImage"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_isSecondaryTitleDetached, CFSTR("_isSecondaryTitleDetached"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_isCentered, CFSTR("_isCentered"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_descriptions, CFSTR("_descriptions"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_footnote, CFSTR("_footnote"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_publishDate, CFSTR("_publishDate"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_sourceName, CFSTR("_sourceName"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_completion, CFSTR("_completion"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_completionImage, CFSTR("_completionImage"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_url, CFSTR("_url"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_auxiliaryTopText, CFSTR("_auxiliaryTopText"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_auxiliaryMiddleText, CFSTR("_auxiliaryMiddleText"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_auxiliaryBottomText, CFSTR("_auxiliaryBottomText"));
  objc_msgSend(v11, "encodeInt:forKey:", self->_auxiliaryBottomTextColor, CFSTR("_auxiliaryBottomTextColor"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_action, CFSTR("_action"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_punchout, CFSTR("_punchout"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_storeIdentifier, CFSTR("_storeIdentifier"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_contactIdentifier, CFSTR("_contactIdentifier"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_calendarIdentifier, CFSTR("_calendarIdentifier"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_entityIdentifier, CFSTR("_entityIdentifier"));
  -[SFCard cardSections](self->_inlineCard, "cardSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SFCard cardSections](self->_inlineCard, "cardSections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (objc_msgSend(v7, "mapsData"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          -[SFSearchResult mapsData](self, "mapsData"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v8, "isEqualToData:", v9),
          v9,
          v8,
          (v10 & 1) == 0))
    {
      objc_msgSend(v11, "encodeObject:forKey:", self->_mapsData, CFSTR("_mapsData"));
    }

  }
  objc_msgSend(v11, "encodeObject:forKey:", self->_mapsResultType, CFSTR("_mapsResultType"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_mapsMoreURL, CFSTR("_mapsMoreURL"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_mapsMoreString, CFSTR("_mapsMoreString"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_mapsMoreIcon, CFSTR("_mapsMoreIcon"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_nearbyBusinessesString, CFSTR("_nearbyBusinessesString"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_appleReferrer, CFSTR("_appleReferrer"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_card, CFSTR("_card"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_inlineCard, CFSTR("_inlineCard"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_moreResults, CFSTR("_moreResults"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_moreResultsPunchout, CFSTR("_moreResultsPunchout"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_normalizedTopic, CFSTR("_normalizedTopic"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_requestedTopic, CFSTR("_requestedTopic"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_applicationBundleIdentifier, CFSTR("_applicationBundleIdentifier"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_sectionBundleIdentifier, CFSTR("_sectionBundleIdentifier"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_isLocalApplicationResult, CFSTR("_isLocalApplicationResult"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_userActivityRequiredString, CFSTR("_userActivityRequiredString"));
  objc_msgSend(v11, "encodeInteger:forKey:", self->_type, CFSTR("_type"));
  objc_msgSend(v11, "encodeInteger:forKey:", self->_minimumRankOfTopHitToSuppressResult, CFSTR("_minimumRankOfTopHitToSuppressResult"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_sectionHeader, CFSTR("_sectionHeader"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_sectionHeaderMore, CFSTR("_sectionHeaderMore"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_sectionHeaderMoreURL, CFSTR("_sectionHeaderMoreURL"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_customProperties, CFSTR("_customProperties"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_renderHorizontallyWithOtherResultsInCategory, CFSTR("_renderHorizontallyWithOtherResultsInCategory"));
  objc_msgSend(v11, "encodeInteger:forKey:", self->_placement, CFSTR("_placement"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_mediaType, CFSTR("_mediaType"));
  objc_msgSend(v11, "encodeDouble:forKey:", CFSTR("_serverScore"), self->_serverScore);
  objc_msgSend(v11, "encodeDouble:forKey:", CFSTR("_personalizationScore"), self->_personalizationScore);
  objc_msgSend(v11, "encodeObject:forKey:", self->_resultType, CFSTR("_resultType"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_resultTemplate, CFSTR("_resultTemplate"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_isQuickGlance, CFSTR("_isQuickGlance"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_isStreaming, CFSTR("_isStreaming"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_engagementScore, CFSTR("_engagementScore"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_queryIndependentScore, CFSTR("_queryIndependentScore"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_maxAge, CFSTR("_maxAge"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_titleNote, CFSTR("_titleNote"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_titleNoteSize, CFSTR("_titleNoteSize"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_resultBundleId, CFSTR("_resultBundleId"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_icon, CFSTR("_icon"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_isStaticCorrection, CFSTR("_isStaticCorrection"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_isFuzzyMatch, CFSTR("_isFuzzyMatch"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_localFeatures, CFSTR("_localFeatures"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_serverFeatures, CFSTR("_serverFeatures"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_noGoTakeover, CFSTR("_noGoTakeover"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_shouldUseCompactDisplay, CFSTR("_shouldUseCompactDisplay"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_preferTopPlatter, CFSTR("_preferTopPlatter"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_wasCompact, CFSTR("_wasCompact"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_didTakeoverGo, CFSTR("_didTakeoverGo"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_usesCompactDisplay, CFSTR("_usesCompactDisplay"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_compactCard, CFSTR("_compactCard"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_usesTopHitDisplay, CFSTR("_usesTopHitDisplay"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_tophitCard, CFSTR("_tophitCard"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_alternativeURLs, CFSTR("_alternativeURLs"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_intendedQuery, CFSTR("_intendedQuery"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_completedQuery, CFSTR("_completedQuery"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_correctedQuery, CFSTR("_correctedQuery"));
  objc_msgSend(v11, "encodeInt64:forKey:", self->_queryId, CFSTR("_queryId"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_publiclyIndexable, CFSTR("_publiclyIndexable"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_userInput, CFSTR("_userInput"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_itemProviderDataTypes, CFSTR("_itemProviderDataTypes"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_itemProviderFileTypes, CFSTR("_itemProviderFileTypes"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_contentType, CFSTR("_contentType"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_contentTypeTree, CFSTR("_contentTypeTree"));
  objc_msgSend(v11, "encodeInteger:forKey:", self->_dataOwnerType, CFSTR("_dataOwnerType"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_fileProviderIdentifier, CFSTR("_fileProviderIdentifier"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_fileProviderDomainIdentifier, CFSTR("_fileProviderDomainIdentifier"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_fbr, CFSTR("_fbr"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_doNotFold, CFSTR("_doNotFold"));
  objc_msgSend(v11, "encodeInt64:forKey:", self->_blockId, CFSTR("_blockId"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_entityData, CFSTR("_entityData"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_isInstantAnswer, CFSTR("_isInstantAnswer"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_shouldAutoNavigate, CFSTR("_shouldAutoNavigate"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_containsPersonalResult, CFSTR("_containsPersonalResult"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_didRerankPersonalResult, CFSTR("_didRerankPersonalResult"));
  objc_msgSend(v11, "encodeInt32:forKey:", self->_coreSpotlightIndexUsed, CFSTR("_coreSpotlightIndexUsed"));
  objc_msgSend(v11, "encodeInt32:forKey:", self->_coreSpotlightIndexUsedReason, CFSTR("_coreSpotlightIndexUsedReason"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_coreSpotlightRankingSignals, CFSTR("_coreSpotlightRankingSignals"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_mailRankingSignals, CFSTR("_mailRankingSignals"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_mailResultDetails, CFSTR("_mailResultDetails"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_isVideoAssetFromPhotos, CFSTR("_isVideoAssetFromPhotos"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_resultEntity, CFSTR("_resultEntity"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_isMailInstantAnswerUpdated, CFSTR("_isMailInstantAnswerUpdated"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_indexOfSectionWhenRanked, CFSTR("_indexOfSectionWhenRanked"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_indexOfResultInSectionWhenRanked, CFSTR("_indexOfResultInSectionWhenRanked"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_safariAttributes, CFSTR("_safariAttributes"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_entityType, CFSTR("_entityType"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_hasAppTopHitShortcut, CFSTR("_hasAppTopHitShortcut"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_photosAttributes, CFSTR("_photosAttributes"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_photosAggregatedInfo, CFSTR("_photosAggregatedInfo"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_moreResultsButton, CFSTR("_moreResultsButton"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreResultsButton, 0);
  objc_storeStrong((id *)&self->_photosAggregatedInfo, 0);
  objc_storeStrong((id *)&self->_photosAttributes, 0);
  objc_storeStrong((id *)&self->_entityType, 0);
  objc_storeStrong((id *)&self->_safariAttributes, 0);
  objc_storeStrong((id *)&self->_indexOfResultInSectionWhenRanked, 0);
  objc_storeStrong((id *)&self->_indexOfSectionWhenRanked, 0);
  objc_storeStrong((id *)&self->_resultEntity, 0);
  objc_storeStrong((id *)&self->_mailResultDetails, 0);
  objc_storeStrong((id *)&self->_mailRankingSignals, 0);
  objc_storeStrong((id *)&self->_coreSpotlightRankingSignals, 0);
  objc_storeStrong((id *)&self->_entityData, 0);
  objc_storeStrong((id *)&self->_srf, 0);
  objc_storeStrong((id *)&self->_fbr, 0);
  objc_storeStrong((id *)&self->_fileProviderDomainIdentifier, 0);
  objc_storeStrong((id *)&self->_fileProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_contentTypeTree, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_itemProviderFileTypes, 0);
  objc_storeStrong((id *)&self->_itemProviderDataTypes, 0);
  objc_storeStrong((id *)&self->_userInput, 0);
  objc_storeStrong((id *)&self->_alternativeURLs, 0);
  objc_storeStrong((id *)&self->_compactCard, 0);
  objc_storeStrong((id *)&self->_completedQuery, 0);
  objc_storeStrong((id *)&self->_correctedQuery, 0);
  objc_storeStrong((id *)&self->_intendedQuery, 0);
  objc_storeStrong((id *)&self->_serverFeatures, 0);
  objc_storeStrong((id *)&self->_localFeatures, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_resultBundleId, 0);
  objc_storeStrong((id *)&self->_titleNoteSize, 0);
  objc_storeStrong((id *)&self->_titleNote, 0);
  objc_storeStrong((id *)&self->_maxAge, 0);
  objc_storeStrong((id *)&self->_queryIndependentScore, 0);
  objc_storeStrong((id *)&self->_engagementScore, 0);
  objc_storeStrong((id *)&self->_resultTemplate, 0);
  objc_storeStrong((id *)&self->_resultType, 0);
  objc_storeStrong((id *)&self->_customProperties, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_sectionHeaderMoreURL, 0);
  objc_storeStrong((id *)&self->_sectionHeaderMore, 0);
  objc_storeStrong((id *)&self->_sectionHeader, 0);
  objc_storeStrong((id *)&self->_userActivityRequiredString, 0);
  objc_storeStrong((id *)&self->_sectionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_requestedTopic, 0);
  objc_storeStrong((id *)&self->_normalizedTopic, 0);
  objc_storeStrong((id *)&self->_moreResultsPunchout, 0);
  objc_storeStrong((id *)&self->_moreResults, 0);
  objc_storeStrong((id *)&self->_tophitCard, 0);
  objc_storeStrong((id *)&self->_inlineCard, 0);
  objc_storeStrong((id *)&self->_card, 0);
  objc_storeStrong((id *)&self->_appleReferrer, 0);
  objc_storeStrong((id *)&self->_nearbyBusinessesString, 0);
  objc_storeStrong((id *)&self->_mapsMoreIcon, 0);
  objc_storeStrong((id *)&self->_mapsMoreString, 0);
  objc_storeStrong((id *)&self->_mapsMoreURL, 0);
  objc_storeStrong((id *)&self->_mapsResultType, 0);
  objc_storeStrong((id *)&self->_mapsData, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_punchout, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_auxiliaryBottomText, 0);
  objc_storeStrong((id *)&self->_auxiliaryMiddleText, 0);
  objc_storeStrong((id *)&self->_auxiliaryTopText, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_completionImage, 0);
  objc_storeStrong((id *)&self->_completion, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_descriptions, 0);
  objc_storeStrong((id *)&self->_secondaryTitleImage, 0);
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (SFSearchResult)initWithCoder:(id)a3
{
  id v4;
  SFSearchResult *v5;
  uint64_t v6;
  NSString *identifier;
  double v8;
  uint64_t v9;
  SFImage *thumbnail;
  uint64_t v11;
  SFText *title;
  uint64_t v13;
  NSString *secondaryTitle;
  uint64_t v15;
  SFImage *secondaryTitleImage;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *descriptions;
  uint64_t v22;
  NSString *footnote;
  uint64_t v24;
  NSString *publishDate;
  uint64_t v26;
  NSString *sourceName;
  uint64_t v28;
  NSString *completion;
  uint64_t v30;
  SFImage *completionImage;
  uint64_t v32;
  NSURL *url;
  uint64_t v34;
  NSString *auxiliaryTopText;
  uint64_t v36;
  NSString *auxiliaryMiddleText;
  uint64_t v38;
  NSString *auxiliaryBottomText;
  uint64_t v40;
  SFActionItem *action;
  uint64_t v42;
  SFPunchout *punchout;
  uint64_t v44;
  NSString *storeIdentifier;
  uint64_t v46;
  NSString *contactIdentifier;
  uint64_t v48;
  NSString *calendarIdentifier;
  uint64_t v50;
  NSString *entityIdentifier;
  uint64_t v52;
  NSData *mapsData;
  uint64_t v54;
  NSString *mapsResultType;
  uint64_t v56;
  NSURL *mapsMoreURL;
  uint64_t v58;
  NSString *mapsMoreString;
  uint64_t v60;
  SFImage *mapsMoreIcon;
  uint64_t v62;
  NSString *nearbyBusinessesString;
  uint64_t v64;
  NSString *appleReferrer;
  uint64_t v66;
  SFCard *card;
  uint64_t v68;
  SFCard *inlineCard;
  uint64_t v70;
  SFCard *tophitCard;
  uint64_t v72;
  SFMoreResults *moreResults;
  uint64_t v74;
  SFPunchout *moreResultsPunchout;
  uint64_t v76;
  SFTopic *normalizedTopic;
  uint64_t v78;
  SFTopic *requestedTopic;
  uint64_t v80;
  NSString *applicationBundleIdentifier;
  uint64_t v82;
  NSString *sectionBundleIdentifier;
  uint64_t v84;
  NSString *userActivityRequiredString;
  uint64_t v86;
  NSString *sectionHeader;
  uint64_t v88;
  NSString *sectionHeaderMore;
  uint64_t v90;
  NSURL *sectionHeaderMoreURL;
  uint64_t v92;
  SFCustom *customProperties;
  uint64_t v94;
  NSString *mediaType;
  double v96;
  double v97;
  uint64_t v98;
  NSString *resultType;
  uint64_t v100;
  NSString *resultTemplate;
  uint64_t v102;
  NSNumber *engagementScore;
  uint64_t v104;
  NSNumber *queryIndependentScore;
  uint64_t v106;
  NSNumber *maxAge;
  uint64_t v108;
  NSString *titleNote;
  uint64_t v110;
  NSNumber *titleNoteSize;
  uint64_t v112;
  NSString *resultBundleId;
  uint64_t v114;
  SFImage *icon;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  NSDictionary *localFeatures;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  NSDictionary *serverFeatures;
  uint64_t v129;
  SFCard *compactCard;
  void *v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  NSArray *alternativeURLs;
  uint64_t v136;
  NSString *intendedQuery;
  uint64_t v138;
  NSString *completedQuery;
  uint64_t v140;
  NSString *correctedQuery;
  uint64_t v142;
  NSString *userInput;
  void *v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  NSArray *itemProviderDataTypes;
  void *v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  NSArray *itemProviderFileTypes;
  uint64_t v154;
  NSString *contentType;
  void *v156;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  NSArray *contentTypeTree;
  uint64_t v161;
  NSString *fileProviderIdentifier;
  uint64_t v163;
  NSString *fileProviderDomainIdentifier;
  uint64_t v165;
  NSString *fbr;
  uint64_t v167;
  NSData *entityData;
  uint64_t v169;
  SFCoreSpotlightRankingSignals *coreSpotlightRankingSignals;
  uint64_t v171;
  SFMailRankingSignals *mailRankingSignals;
  uint64_t v173;
  SFMailResultDetails *mailResultDetails;
  uint64_t v175;
  SFResultEntity *resultEntity;
  uint64_t v177;
  NSNumber *indexOfSectionWhenRanked;
  uint64_t v179;
  NSNumber *indexOfResultInSectionWhenRanked;
  uint64_t v181;
  SFSafariAttributes *safariAttributes;
  uint64_t v183;
  NSString *entityType;
  uint64_t v185;
  SFPhotosAttributes *photosAttributes;
  uint64_t v187;
  SFPhotosAggregatedInfo *photosAggregatedInfo;
  uint64_t v189;
  SFCommandButtonItem *moreResultsButton;
  objc_super v192;

  v4 = a3;
  v192.receiver = self;
  v192.super_class = (Class)SFSearchResult;
  v5 = -[SFSearchResult init](&v192, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_rankingScore"));
    v5->_rankingScore = v8;
    v5->_topHit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_topHit"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_thumbnail"));
    v9 = objc_claimAutoreleasedReturnValue();
    thumbnail = v5->_thumbnail;
    v5->_thumbnail = (SFImage *)v9;

    v5->_preventThumbnailImageScaling = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_preventThumbnailImageScaling"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v11 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (SFText *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_secondaryTitle"));
    v13 = objc_claimAutoreleasedReturnValue();
    secondaryTitle = v5->_secondaryTitle;
    v5->_secondaryTitle = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_secondaryTitleImage"));
    v15 = objc_claimAutoreleasedReturnValue();
    secondaryTitleImage = v5->_secondaryTitleImage;
    v5->_secondaryTitleImage = (SFImage *)v15;

    v5->_isSecondaryTitleDetached = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isSecondaryTitleDetached"));
    v5->_isCentered = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isCentered"));
    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("_descriptions"));
    v20 = objc_claimAutoreleasedReturnValue();
    descriptions = v5->_descriptions;
    v5->_descriptions = (NSArray *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_footnote"));
    v22 = objc_claimAutoreleasedReturnValue();
    footnote = v5->_footnote;
    v5->_footnote = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_publishDate"));
    v24 = objc_claimAutoreleasedReturnValue();
    publishDate = v5->_publishDate;
    v5->_publishDate = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sourceName"));
    v26 = objc_claimAutoreleasedReturnValue();
    sourceName = v5->_sourceName;
    v5->_sourceName = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_completion"));
    v28 = objc_claimAutoreleasedReturnValue();
    completion = v5->_completion;
    v5->_completion = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_completionImage"));
    v30 = objc_claimAutoreleasedReturnValue();
    completionImage = v5->_completionImage;
    v5->_completionImage = (SFImage *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_url"));
    v32 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_auxiliaryTopText"));
    v34 = objc_claimAutoreleasedReturnValue();
    auxiliaryTopText = v5->_auxiliaryTopText;
    v5->_auxiliaryTopText = (NSString *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_auxiliaryMiddleText"));
    v36 = objc_claimAutoreleasedReturnValue();
    auxiliaryMiddleText = v5->_auxiliaryMiddleText;
    v5->_auxiliaryMiddleText = (NSString *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_auxiliaryBottomText"));
    v38 = objc_claimAutoreleasedReturnValue();
    auxiliaryBottomText = v5->_auxiliaryBottomText;
    v5->_auxiliaryBottomText = (NSString *)v38;

    v5->_auxiliaryBottomTextColor = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_auxiliaryBottomTextColor"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_action"));
    v40 = objc_claimAutoreleasedReturnValue();
    action = v5->_action;
    v5->_action = (SFActionItem *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_punchout"));
    v42 = objc_claimAutoreleasedReturnValue();
    punchout = v5->_punchout;
    v5->_punchout = (SFPunchout *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_storeIdentifier"));
    v44 = objc_claimAutoreleasedReturnValue();
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSString *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contactIdentifier"));
    v46 = objc_claimAutoreleasedReturnValue();
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_calendarIdentifier"));
    v48 = objc_claimAutoreleasedReturnValue();
    calendarIdentifier = v5->_calendarIdentifier;
    v5->_calendarIdentifier = (NSString *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_entityIdentifier"));
    v50 = objc_claimAutoreleasedReturnValue();
    entityIdentifier = v5->_entityIdentifier;
    v5->_entityIdentifier = (NSString *)v50;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_mapsData"));
    v52 = objc_claimAutoreleasedReturnValue();
    mapsData = v5->_mapsData;
    v5->_mapsData = (NSData *)v52;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_mapsResultType"));
    v54 = objc_claimAutoreleasedReturnValue();
    mapsResultType = v5->_mapsResultType;
    v5->_mapsResultType = (NSString *)v54;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_mapsMoreURL"));
    v56 = objc_claimAutoreleasedReturnValue();
    mapsMoreURL = v5->_mapsMoreURL;
    v5->_mapsMoreURL = (NSURL *)v56;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_mapsMoreString"));
    v58 = objc_claimAutoreleasedReturnValue();
    mapsMoreString = v5->_mapsMoreString;
    v5->_mapsMoreString = (NSString *)v58;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_mapsMoreIcon"));
    v60 = objc_claimAutoreleasedReturnValue();
    mapsMoreIcon = v5->_mapsMoreIcon;
    v5->_mapsMoreIcon = (SFImage *)v60;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_nearbyBusinessesString"));
    v62 = objc_claimAutoreleasedReturnValue();
    nearbyBusinessesString = v5->_nearbyBusinessesString;
    v5->_nearbyBusinessesString = (NSString *)v62;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_appleReferrer"));
    v64 = objc_claimAutoreleasedReturnValue();
    appleReferrer = v5->_appleReferrer;
    v5->_appleReferrer = (NSString *)v64;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_card"));
    v66 = objc_claimAutoreleasedReturnValue();
    card = v5->_card;
    v5->_card = (SFCard *)v66;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_inlineCard"));
    v68 = objc_claimAutoreleasedReturnValue();
    inlineCard = v5->_inlineCard;
    v5->_inlineCard = (SFCard *)v68;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_tophitCard"));
    v70 = objc_claimAutoreleasedReturnValue();
    tophitCard = v5->_tophitCard;
    v5->_tophitCard = (SFCard *)v70;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_moreResults"));
    v72 = objc_claimAutoreleasedReturnValue();
    moreResults = v5->_moreResults;
    v5->_moreResults = (SFMoreResults *)v72;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_moreResultsPunchout"));
    v74 = objc_claimAutoreleasedReturnValue();
    moreResultsPunchout = v5->_moreResultsPunchout;
    v5->_moreResultsPunchout = (SFPunchout *)v74;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_normalizedTopic"));
    v76 = objc_claimAutoreleasedReturnValue();
    normalizedTopic = v5->_normalizedTopic;
    v5->_normalizedTopic = (SFTopic *)v76;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_requestedTopic"));
    v78 = objc_claimAutoreleasedReturnValue();
    requestedTopic = v5->_requestedTopic;
    v5->_requestedTopic = (SFTopic *)v78;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_applicationBundleIdentifier"));
    v80 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v80;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sectionBundleIdentifier"));
    v82 = objc_claimAutoreleasedReturnValue();
    sectionBundleIdentifier = v5->_sectionBundleIdentifier;
    v5->_sectionBundleIdentifier = (NSString *)v82;

    v5->_isLocalApplicationResult = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isLocalApplicationResult"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userActivityRequiredString"));
    v84 = objc_claimAutoreleasedReturnValue();
    userActivityRequiredString = v5->_userActivityRequiredString;
    v5->_userActivityRequiredString = (NSString *)v84;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_type"));
    v5->_minimumRankOfTopHitToSuppressResult = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_minimumRankOfTopHitToSuppressResult"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sectionHeader"));
    v86 = objc_claimAutoreleasedReturnValue();
    sectionHeader = v5->_sectionHeader;
    v5->_sectionHeader = (NSString *)v86;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sectionHeaderMore"));
    v88 = objc_claimAutoreleasedReturnValue();
    sectionHeaderMore = v5->_sectionHeaderMore;
    v5->_sectionHeaderMore = (NSString *)v88;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sectionHeaderMoreURL"));
    v90 = objc_claimAutoreleasedReturnValue();
    sectionHeaderMoreURL = v5->_sectionHeaderMoreURL;
    v5->_sectionHeaderMoreURL = (NSURL *)v90;

    v5->_placement = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_placement"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_customProperties"));
    v92 = objc_claimAutoreleasedReturnValue();
    customProperties = v5->_customProperties;
    v5->_customProperties = (SFCustom *)v92;

    v5->_renderHorizontallyWithOtherResultsInCategory = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_renderHorizontallyWithOtherResultsInCategory"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_mediaType"));
    v94 = objc_claimAutoreleasedReturnValue();
    mediaType = v5->_mediaType;
    v5->_mediaType = (NSString *)v94;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_serverScore"));
    v5->_serverScore = v96;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_personalizationScore"));
    v5->_personalizationScore = v97;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_resultType"));
    v98 = objc_claimAutoreleasedReturnValue();
    resultType = v5->_resultType;
    v5->_resultType = (NSString *)v98;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_resultTemplate"));
    v100 = objc_claimAutoreleasedReturnValue();
    resultTemplate = v5->_resultTemplate;
    v5->_resultTemplate = (NSString *)v100;

    v5->_isQuickGlance = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isQuickGlance"));
    v5->_isStreaming = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isStreaming"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_engagementScore"));
    v102 = objc_claimAutoreleasedReturnValue();
    engagementScore = v5->_engagementScore;
    v5->_engagementScore = (NSNumber *)v102;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_queryIndependentScore"));
    v104 = objc_claimAutoreleasedReturnValue();
    queryIndependentScore = v5->_queryIndependentScore;
    v5->_queryIndependentScore = (NSNumber *)v104;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_maxAge"));
    v106 = objc_claimAutoreleasedReturnValue();
    maxAge = v5->_maxAge;
    v5->_maxAge = (NSNumber *)v106;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_titleNote"));
    v108 = objc_claimAutoreleasedReturnValue();
    titleNote = v5->_titleNote;
    v5->_titleNote = (NSString *)v108;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_titleNoteSize"));
    v110 = objc_claimAutoreleasedReturnValue();
    titleNoteSize = v5->_titleNoteSize;
    v5->_titleNoteSize = (NSNumber *)v110;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_resultBundleId"));
    v112 = objc_claimAutoreleasedReturnValue();
    resultBundleId = v5->_resultBundleId;
    v5->_resultBundleId = (NSString *)v112;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_icon"));
    v114 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (SFImage *)v114;

    v5->_isStaticCorrection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isStaticCorrection"));
    v5->_isFuzzyMatch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isFuzzyMatch"));
    v116 = (void *)MEMORY[0x1E0C99E60];
    v117 = objc_opt_class();
    v118 = objc_opt_class();
    v119 = objc_opt_class();
    objc_msgSend(v116, "setWithObjects:", v117, v118, v119, objc_opt_class(), 0);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v120, CFSTR("_localFeatures"));
    v121 = objc_claimAutoreleasedReturnValue();
    localFeatures = v5->_localFeatures;
    v5->_localFeatures = (NSDictionary *)v121;

    v123 = (void *)MEMORY[0x1E0C99E60];
    v124 = objc_opt_class();
    v125 = objc_opt_class();
    objc_msgSend(v123, "setWithObjects:", v124, v125, objc_opt_class(), 0);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v126, CFSTR("_serverFeatures"));
    v127 = objc_claimAutoreleasedReturnValue();
    serverFeatures = v5->_serverFeatures;
    v5->_serverFeatures = (NSDictionary *)v127;

    v5->_shouldUseCompactDisplay = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldUseCompactDisplay"));
    v5->_noGoTakeover = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_noGoTakeover"));
    v5->_preferTopPlatter = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_preferTopPlatter"));
    v5->_wasCompact = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_wasCompact"));
    v5->_didTakeoverGo = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_didTakeoverGo"));
    v5->_usesCompactDisplay = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_usesCompactDisplay"));
    v5->_usesTopHitDisplay = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_usesTopHitDisplay"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_compactCard"));
    v129 = objc_claimAutoreleasedReturnValue();
    compactCard = v5->_compactCard;
    v5->_compactCard = (SFCard *)v129;

    v131 = (void *)MEMORY[0x1E0C99E60];
    v132 = objc_opt_class();
    objc_msgSend(v131, "setWithObjects:", v132, objc_opt_class(), 0);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v133, CFSTR("_alternativeURLs"));
    v134 = objc_claimAutoreleasedReturnValue();
    alternativeURLs = v5->_alternativeURLs;
    v5->_alternativeURLs = (NSArray *)v134;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_intendedQuery"));
    v136 = objc_claimAutoreleasedReturnValue();
    intendedQuery = v5->_intendedQuery;
    v5->_intendedQuery = (NSString *)v136;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_completedQuery"));
    v138 = objc_claimAutoreleasedReturnValue();
    completedQuery = v5->_completedQuery;
    v5->_completedQuery = (NSString *)v138;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_correctedQuery"));
    v140 = objc_claimAutoreleasedReturnValue();
    correctedQuery = v5->_correctedQuery;
    v5->_correctedQuery = (NSString *)v140;

    v5->_queryId = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_queryId"));
    v5->_publiclyIndexable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_publiclyIndexable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userInput"));
    v142 = objc_claimAutoreleasedReturnValue();
    userInput = v5->_userInput;
    v5->_userInput = (NSString *)v142;

    v144 = (void *)MEMORY[0x1E0C99E60];
    v145 = objc_opt_class();
    objc_msgSend(v144, "setWithObjects:", v145, objc_opt_class(), 0);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v146, CFSTR("_itemProviderDataTypes"));
    v147 = objc_claimAutoreleasedReturnValue();
    itemProviderDataTypes = v5->_itemProviderDataTypes;
    v5->_itemProviderDataTypes = (NSArray *)v147;

    v149 = (void *)MEMORY[0x1E0C99E60];
    v150 = objc_opt_class();
    objc_msgSend(v149, "setWithObjects:", v150, objc_opt_class(), 0);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v151, CFSTR("_itemProviderFileTypes"));
    v152 = objc_claimAutoreleasedReturnValue();
    itemProviderFileTypes = v5->_itemProviderFileTypes;
    v5->_itemProviderFileTypes = (NSArray *)v152;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contentType"));
    v154 = objc_claimAutoreleasedReturnValue();
    contentType = v5->_contentType;
    v5->_contentType = (NSString *)v154;

    v156 = (void *)MEMORY[0x1E0C99E60];
    v157 = objc_opt_class();
    objc_msgSend(v156, "setWithObjects:", v157, objc_opt_class(), 0);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v158, CFSTR("_contentTypeTree"));
    v159 = objc_claimAutoreleasedReturnValue();
    contentTypeTree = v5->_contentTypeTree;
    v5->_contentTypeTree = (NSArray *)v159;

    v5->_dataOwnerType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_dataOwnerType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fileProviderIdentifier"));
    v161 = objc_claimAutoreleasedReturnValue();
    fileProviderIdentifier = v5->_fileProviderIdentifier;
    v5->_fileProviderIdentifier = (NSString *)v161;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fileProviderDomainIdentifier"));
    v163 = objc_claimAutoreleasedReturnValue();
    fileProviderDomainIdentifier = v5->_fileProviderDomainIdentifier;
    v5->_fileProviderDomainIdentifier = (NSString *)v163;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fbr"));
    v165 = objc_claimAutoreleasedReturnValue();
    fbr = v5->_fbr;
    v5->_fbr = (NSString *)v165;

    v5->_doNotFold = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_doNotFold"));
    v5->_blockId = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_blockId"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_entityData"));
    v167 = objc_claimAutoreleasedReturnValue();
    entityData = v5->_entityData;
    v5->_entityData = (NSData *)v167;

    v5->_isInstantAnswer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isInstantAnswer"));
    v5->_shouldAutoNavigate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldAutoNavigate"));
    v5->_containsPersonalResult = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_containsPersonalResult"));
    v5->_didRerankPersonalResult = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_didRerankPersonalResult"));
    v5->_coreSpotlightIndexUsed = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_coreSpotlightIndexUsed"));
    v5->_coreSpotlightIndexUsedReason = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_coreSpotlightIndexUsedReason"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_coreSpotlightRankingSignals"));
    v169 = objc_claimAutoreleasedReturnValue();
    coreSpotlightRankingSignals = v5->_coreSpotlightRankingSignals;
    v5->_coreSpotlightRankingSignals = (SFCoreSpotlightRankingSignals *)v169;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_mailRankingSignals"));
    v171 = objc_claimAutoreleasedReturnValue();
    mailRankingSignals = v5->_mailRankingSignals;
    v5->_mailRankingSignals = (SFMailRankingSignals *)v171;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_mailResultDetails"));
    v173 = objc_claimAutoreleasedReturnValue();
    mailResultDetails = v5->_mailResultDetails;
    v5->_mailResultDetails = (SFMailResultDetails *)v173;

    v5->_isVideoAssetFromPhotos = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isVideoAssetFromPhotos"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_resultEntity"));
    v175 = objc_claimAutoreleasedReturnValue();
    resultEntity = v5->_resultEntity;
    v5->_resultEntity = (SFResultEntity *)v175;

    v5->_isMailInstantAnswerUpdated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isMailInstantAnswerUpdated"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_indexOfSectionWhenRanked"));
    v177 = objc_claimAutoreleasedReturnValue();
    indexOfSectionWhenRanked = v5->_indexOfSectionWhenRanked;
    v5->_indexOfSectionWhenRanked = (NSNumber *)v177;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_indexOfResultInSectionWhenRanked"));
    v179 = objc_claimAutoreleasedReturnValue();
    indexOfResultInSectionWhenRanked = v5->_indexOfResultInSectionWhenRanked;
    v5->_indexOfResultInSectionWhenRanked = (NSNumber *)v179;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_safariAttributes"));
    v181 = objc_claimAutoreleasedReturnValue();
    safariAttributes = v5->_safariAttributes;
    v5->_safariAttributes = (SFSafariAttributes *)v181;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_entityType"));
    v183 = objc_claimAutoreleasedReturnValue();
    entityType = v5->_entityType;
    v5->_entityType = (NSString *)v183;

    v5->_hasAppTopHitShortcut = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasAppTopHitShortcut"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_photosAttributes"));
    v185 = objc_claimAutoreleasedReturnValue();
    photosAttributes = v5->_photosAttributes;
    v5->_photosAttributes = (SFPhotosAttributes *)v185;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_photosAggregatedInfo"));
    v187 = objc_claimAutoreleasedReturnValue();
    photosAggregatedInfo = v5->_photosAggregatedInfo;
    v5->_photosAggregatedInfo = (SFPhotosAggregatedInfo *)v187;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_moreResultsButton"));
    v189 = objc_claimAutoreleasedReturnValue();
    moreResultsButton = v5->_moreResultsButton;
    v5->_moreResultsButton = (SFCommandButtonItem *)v189;

  }
  return v5;
}

- (SFMoreResults)moreResults
{
  return self->_moreResults;
}

- (SFPunchout)moreResultsPunchout
{
  return self->_moreResultsPunchout;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSearchResult action](self, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("action"));

  -[SFSearchResult applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SFSearchResult applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("applicationBundleIdentifier"));

  }
  -[SFSearchResult completedQuery](self, "completedQuery");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SFSearchResult completedQuery](self, "completedQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("completedQuery"));

  }
  -[SFSearchResult correctedQuery](self, "correctedQuery");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SFSearchResult correctedQuery](self, "correctedQuery");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("correctedQuery"));

  }
  -[SFSearchResult descriptions](self, "descriptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    -[SFSearchResult descriptions](self, "descriptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v89;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v89 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * v22), "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v23);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
      }
      while (v20);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("descriptions"));
  }
  -[SFSearchResult identifier](self, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[SFSearchResult identifier](self, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("identifier"));

  }
  -[SFSearchResult intendedQuery](self, "intendedQuery");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[SFSearchResult intendedQuery](self, "intendedQuery");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("intendedQuery"));

  }
  -[SFSearchResult fbr](self, "fbr");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[SFSearchResult fbr](self, "fbr");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("fbr"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFSearchResult isLocalApplicationResult](self, "isLocalApplicationResult"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("isLocalApplicationResult"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFSearchResult isStaticCorrection](self, "isStaticCorrection"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("isStaticCorrection"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFSearchResult isFuzzyMatch](self, "isFuzzyMatch"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("isFuzzyMatch"));

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  -[SFSearchResult localFeatures](self, "localFeatures", 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v85;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v85 != v40)
          objc_enumerationMutation(v37);
        v42 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * v41);
        -[SFSearchResult localFeatures](self, "localFeatures");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKeyedSubscript:", v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v44, v42);

        ++v41;
      }
      while (v39 != v41);
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
    }
    while (v39);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("localFeatures"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFSearchResult publiclyIndexable](self, "publiclyIndexable"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("publiclyIndexable"));

  -[SFSearchResult punchout](self, "punchout");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "dictionaryRepresentation");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("punchout"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SFSearchResult queryId](self, "queryId"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("queryId"));

  v49 = (void *)MEMORY[0x1E0CB37E8];
  -[SFSearchResult rankingScore](self, "rankingScore");
  objc_msgSend(v49, "numberWithDouble:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("rankingScore"));

  -[SFSearchResult resultBundleId](self, "resultBundleId");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    -[SFSearchResult resultBundleId](self, "resultBundleId");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v52, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("resultBundleId"));

  }
  -[SFSearchResult resultType](self, "resultType");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    -[SFSearchResult resultType](self, "resultType");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)objc_msgSend(v55, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("resultType"));

  }
  -[SFSearchResult sectionBundleIdentifier](self, "sectionBundleIdentifier");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    -[SFSearchResult sectionBundleIdentifier](self, "sectionBundleIdentifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)objc_msgSend(v58, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("sectionBundleIdentifier"));

  }
  -[SFSearchResult title](self, "title");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "dictionaryRepresentation");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("title"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SFSearchResult topHit](self, "topHit"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("topHit"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SFSearchResult type](self, "type"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("type"));

  -[SFSearchResult url](self, "url");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "dictionaryRepresentation");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("url"));

  -[SFSearchResult inlineCard](self, "inlineCard");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    -[SFSearchResult inlineCard](self, "inlineCard");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "dictionaryRepresentation");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("inlineCard"));

  }
  -[SFSearchResult card](self, "card");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (v69)
  {
    -[SFSearchResult card](self, "card");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "dictionaryRepresentation");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("card"));

  }
  -[SFSearchResult thumbnail](self, "thumbnail");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    -[SFSearchResult thumbnail](self, "thumbnail");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "dictionaryRepresentation");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("thumbnail"));

  }
  -[SFSearchResult secondaryTitle](self, "secondaryTitle");
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (v75)
  {
    -[SFSearchResult secondaryTitle](self, "secondaryTitle");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = (void *)objc_msgSend(v76, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("secondaryTitle"));

  }
  -[SFSearchResult footnote](self, "footnote");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
  {
    -[SFSearchResult footnote](self, "footnote");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)objc_msgSend(v79, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v80, CFSTR("footnote"));

  }
  if (-[SFSearchResult doNotFold](self, "doNotFold"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFSearchResult doNotFold](self, "doNotFold"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, CFSTR("doNotFold"));

  }
  if (-[SFSearchResult blockId](self, "blockId"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SFSearchResult blockId](self, "blockId"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v82, CFSTR("blockId"));

  }
  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SFSearchResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (SFSearchResult)initWithQueryTopic:(id)a3
{
  id v4;
  SFSearchResult *v5;
  SFText *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SFSymbolImage *v11;
  void *v12;
  SFPunchout *v13;
  void *v14;
  SFSuggestionCardSection *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SFUpdateSearchQueryCommand *v20;
  void *v21;
  SFCard *v22;
  void *v23;
  SFSearchResult *v24;
  objc_super v26;
  SFSuggestionCardSection *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SFSearchResult;
  v5 = -[SFSearchResult init](&v26, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(SFText);
    objc_msgSend(v4, "query");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFText setText:](v6, "setText:", v7);

    -[SFSearchResult setTitle:](v5, "setTitle:", v6);
    objc_msgSend(v4, "query");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setCompletion:](v5, "setCompletion:", v8);

    +[SFSearchResult fallbackBundleId](SFSearchResult, "fallbackBundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setResultBundleId:](v5, "setResultBundleId:", v9);

    +[SFSearchResult fallbackSectionBundleIdentifier](SFSearchResult, "fallbackSectionBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setSectionBundleIdentifier:](v5, "setSectionBundleIdentifier:", v10);

    -[SFSearchResult setType:](v5, "setType:", 17);
    v11 = objc_alloc_init(SFSymbolImage);
    +[SFSearchResult fallbackImageSymbolName](SFSearchResult, "fallbackImageSymbolName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSymbolImage setSymbolName:](v11, "setSymbolName:", v12);

    -[SFImage setIsTemplate:](v11, "setIsTemplate:", 1);
    v13 = objc_alloc_init(SFPunchout);
    -[SFSearchResult resultBundleId](v5, "resultBundleId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPunchout setBundleIdentifier:](v13, "setBundleIdentifier:", v14);

    v15 = objc_alloc_init(SFSuggestionCardSection);
    objc_msgSend(v4, "query");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFText textWithString:](SFRichText, "textWithString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSuggestionCardSection setSuggestionText:](v15, "setSuggestionText:", v17);

    -[SFSuggestionCardSection suggestionText](v15, "suggestionText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMaxLines:", 1);

    -[SFSuggestionCardSection setSuggestionType:](v15, "setSuggestionType:", 0);
    v28[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v15, "setPunchoutOptions:", v19);

    -[SFSuggestionCardSection setThumbnail:](v15, "setThumbnail:", v11);
    v20 = objc_alloc_init(SFUpdateSearchQueryCommand);
    objc_msgSend(v4, "query");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUpdateSearchQueryCommand setSearchString:](v20, "setSearchString:", v21);

    -[SFUpdateSearchQueryCommand setQuerySource:](v20, "setQuerySource:", 1);
    -[SFCardSection setCommand:](v15, "setCommand:", v20);
    v22 = objc_alloc_init(SFCard);
    v27 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCard setCardSections:](v22, "setCardSections:", v23);

    -[SFSearchResult setInlineCard:](v5, "setInlineCard:", v22);
    v24 = v5;

  }
  return v5;
}

- (SFSearchResult)initWithSearchResult:(id)a3
{
  id v4;
  SFSearchResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;

  v4 = a3;
  v5 = -[SFSearchResult init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "thumbnail");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setThumbnail:](v5, "setThumbnail:", v7);

    -[SFSearchResult setPreventThumbnailImageScaling:](v5, "setPreventThumbnailImageScaling:", objc_msgSend(v4, "preventThumbnailImageScaling"));
    objc_msgSend(v4, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setTitle:](v5, "setTitle:", v8);

    objc_msgSend(v4, "secondaryTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setSecondaryTitle:](v5, "setSecondaryTitle:", v9);

    objc_msgSend(v4, "secondaryTitleImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setSecondaryTitleImage:](v5, "setSecondaryTitleImage:", v10);

    -[SFSearchResult setIsSecondaryTitleDetached:](v5, "setIsSecondaryTitleDetached:", objc_msgSend(v4, "isSecondaryTitleDetached"));
    -[SFSearchResult setIsCentered:](v5, "setIsCentered:", objc_msgSend(v4, "isCentered"));
    objc_msgSend(v4, "descriptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setDescriptions:](v5, "setDescriptions:", v11);

    objc_msgSend(v4, "footnote");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setFootnote:](v5, "setFootnote:", v12);

    objc_msgSend(v4, "publishDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setPublishDate:](v5, "setPublishDate:", v13);

    objc_msgSend(v4, "sourceName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setSourceName:](v5, "setSourceName:", v14);

    objc_msgSend(v4, "completion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setCompletion:](v5, "setCompletion:", v15);

    objc_msgSend(v4, "completionImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setCompletionImage:](v5, "setCompletionImage:", v16);

    objc_msgSend(v4, "url");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setUrl:](v5, "setUrl:", v17);

    objc_msgSend(v4, "auxiliaryTopText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setAuxiliaryTopText:](v5, "setAuxiliaryTopText:", v18);

    objc_msgSend(v4, "auxiliaryMiddleText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setAuxiliaryMiddleText:](v5, "setAuxiliaryMiddleText:", v19);

    objc_msgSend(v4, "auxiliaryBottomText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setAuxiliaryBottomText:](v5, "setAuxiliaryBottomText:", v20);

    -[SFSearchResult setAuxiliaryBottomTextColor:](v5, "setAuxiliaryBottomTextColor:", objc_msgSend(v4, "auxiliaryBottomTextColor"));
    objc_msgSend(v4, "action");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setAction:](v5, "setAction:", v21);

    objc_msgSend(v4, "punchout");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setPunchout:](v5, "setPunchout:", v22);

    objc_msgSend(v4, "storeIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setStoreIdentifier:](v5, "setStoreIdentifier:", v23);

    objc_msgSend(v4, "contactIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setContactIdentifier:](v5, "setContactIdentifier:", v24);

    objc_msgSend(v4, "calendarIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setCalendarIdentifier:](v5, "setCalendarIdentifier:", v25);

    objc_msgSend(v4, "entityIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setEntityIdentifier:](v5, "setEntityIdentifier:", v26);

    objc_msgSend(v4, "mapsData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setMapsData:](v5, "setMapsData:", v27);

    objc_msgSend(v4, "mapsResultType");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setMapsResultType:](v5, "setMapsResultType:", v28);

    objc_msgSend(v4, "mapsMoreURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setMapsMoreURL:](v5, "setMapsMoreURL:", v29);

    objc_msgSend(v4, "mapsMoreString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setMapsMoreString:](v5, "setMapsMoreString:", v30);

    objc_msgSend(v4, "mapsMoreIcon");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setMapsMoreIcon:](v5, "setMapsMoreIcon:", v31);

    objc_msgSend(v4, "nearbyBusinessesString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setNearbyBusinessesString:](v5, "setNearbyBusinessesString:", v32);

    objc_msgSend(v4, "appleReferrer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setAppleReferrer:](v5, "setAppleReferrer:", v33);

    objc_msgSend(v4, "card");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setCard:](v5, "setCard:", v34);

    objc_msgSend(v4, "inlineCard");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setInlineCard:](v5, "setInlineCard:", v35);

    -[SFSearchResult setUsesTopHitDisplay:](v5, "setUsesTopHitDisplay:", objc_msgSend(v4, "usesTopHitDisplay"));
    objc_msgSend(v4, "tophitCard");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setTophitCard:](v5, "setTophitCard:", v36);

    objc_msgSend(v4, "moreResults");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setMoreResults:](v5, "setMoreResults:", v37);

    objc_msgSend(v4, "moreResultsPunchout");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setMoreResultsPunchout:](v5, "setMoreResultsPunchout:", v38);

    objc_msgSend(v4, "applicationBundleIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v39);

    objc_msgSend(v4, "sectionBundleIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setSectionBundleIdentifier:](v5, "setSectionBundleIdentifier:", v40);

    -[SFSearchResult setIsLocalApplicationResult:](v5, "setIsLocalApplicationResult:", objc_msgSend(v4, "isLocalApplicationResult"));
    objc_msgSend(v4, "userActivityRequiredString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setUserActivityRequiredString:](v5, "setUserActivityRequiredString:", v41);

    -[SFSearchResult setTopHit:](v5, "setTopHit:", objc_msgSend(v4, "topHit"));
    objc_msgSend(v4, "sectionHeader");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setSectionHeader:](v5, "setSectionHeader:", v42);

    objc_msgSend(v4, "sectionHeaderMore");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setSectionHeaderMore:](v5, "setSectionHeaderMore:", v43);

    objc_msgSend(v4, "sectionHeaderMoreURL");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setSectionHeaderMoreURL:](v5, "setSectionHeaderMoreURL:", v44);

    -[SFSearchResult setRenderHorizontallyWithOtherResultsInCategory:](v5, "setRenderHorizontallyWithOtherResultsInCategory:", objc_msgSend(v4, "renderHorizontallyWithOtherResultsInCategory"));
    objc_msgSend(v4, "rankingScore");
    -[SFSearchResult setRankingScore:](v5, "setRankingScore:");
    -[SFSearchResult setPlacement:](v5, "setPlacement:", objc_msgSend(v4, "placement"));
    -[SFSearchResult setType:](v5, "setType:", objc_msgSend(v4, "type"));
    objc_msgSend(v4, "domainName");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setDomainName:](v5, "setDomainName:", v45);

    -[SFSearchResult setMinimumRankOfTopHitToSuppressResult:](v5, "setMinimumRankOfTopHitToSuppressResult:", objc_msgSend(v4, "minimumRankOfTopHitToSuppressResult"));
    objc_msgSend(v4, "mediaType");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setMediaType:](v5, "setMediaType:", v46);

    objc_msgSend(v4, "serverScore");
    -[SFSearchResult setServerScore:](v5, "setServerScore:");
    objc_msgSend(v4, "personalizationScore");
    -[SFSearchResult setPersonalizationScore:](v5, "setPersonalizationScore:");
    objc_msgSend(v4, "customProperties");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setCustomProperties:](v5, "setCustomProperties:", v47);

    objc_msgSend(v4, "resultType");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setResultType:](v5, "setResultType:", v48);

    objc_msgSend(v4, "resultTemplate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setResultTemplate:](v5, "setResultTemplate:", v49);

    -[SFSearchResult setIsQuickGlance:](v5, "setIsQuickGlance:", objc_msgSend(v4, "isQuickGlance"));
    -[SFSearchResult setIsStreaming:](v5, "setIsStreaming:", objc_msgSend(v4, "isStreaming"));
    objc_msgSend(v4, "engagementScore");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setEngagementScore:](v5, "setEngagementScore:", v50);

    objc_msgSend(v4, "queryIndependentScore");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setQueryIndependentScore:](v5, "setQueryIndependentScore:", v51);

    objc_msgSend(v4, "maxAge");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setMaxAge:](v5, "setMaxAge:", v52);

    objc_msgSend(v4, "titleNote");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setTitleNote:](v5, "setTitleNote:", v53);

    objc_msgSend(v4, "titleNoteSize");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setTitleNoteSize:](v5, "setTitleNoteSize:", v54);

    objc_msgSend(v4, "resultBundleId");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setResultBundleId:](v5, "setResultBundleId:", v55);

    objc_msgSend(v4, "icon");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setIcon:](v5, "setIcon:", v56);

    -[SFSearchResult setIsStaticCorrection:](v5, "setIsStaticCorrection:", objc_msgSend(v4, "isStaticCorrection"));
    objc_msgSend(v4, "localFeatures");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setLocalFeatures:](v5, "setLocalFeatures:", v57);

    objc_msgSend(v4, "serverFeatures");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setServerFeatures:](v5, "setServerFeatures:", v58);

    objc_msgSend(v4, "intendedQuery");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setIntendedQuery:](v5, "setIntendedQuery:", v59);

    objc_msgSend(v4, "correctedQuery");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setCorrectedQuery:](v5, "setCorrectedQuery:", v60);

    objc_msgSend(v4, "completedQuery");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setCompletedQuery:](v5, "setCompletedQuery:", v61);

    -[SFSearchResult setNoGoTakeover:](v5, "setNoGoTakeover:", objc_msgSend(v4, "noGoTakeover"));
    -[SFSearchResult setShouldUseCompactDisplay:](v5, "setShouldUseCompactDisplay:", objc_msgSend(v4, "shouldUseCompactDisplay"));
    -[SFSearchResult setPreferTopPlatter:](v5, "setPreferTopPlatter:", objc_msgSend(v4, "preferTopPlatter"));
    -[SFSearchResult setWasCompact:](v5, "setWasCompact:", objc_msgSend(v4, "wasCompact"));
    -[SFSearchResult setDidTakeoverGo:](v5, "setDidTakeoverGo:", objc_msgSend(v4, "didTakeoverGo"));
    -[SFSearchResult setUsesCompactDisplay:](v5, "setUsesCompactDisplay:", objc_msgSend(v4, "usesCompactDisplay"));
    objc_msgSend(v4, "compactCard");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setCompactCard:](v5, "setCompactCard:", v62);

    objc_msgSend(v4, "alternativeURLs");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setAlternativeURLs:](v5, "setAlternativeURLs:", v63);

    -[SFSearchResult setQueryId:](v5, "setQueryId:", objc_msgSend(v4, "queryId"));
    -[SFSearchResult setPubliclyIndexable:](v5, "setPubliclyIndexable:", objc_msgSend(v4, "publiclyIndexable"));
    objc_msgSend(v4, "userInput");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setUserInput:](v5, "setUserInput:", v64);

    objc_msgSend(v4, "itemProviderDataTypes");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setItemProviderDataTypes:](v5, "setItemProviderDataTypes:", v65);

    objc_msgSend(v4, "itemProviderFileTypes");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setItemProviderFileTypes:](v5, "setItemProviderFileTypes:", v66);

    objc_msgSend(v4, "contentType");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setContentType:](v5, "setContentType:", v67);

    objc_msgSend(v4, "contentTypeTree");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setContentTypeTree:](v5, "setContentTypeTree:", v68);

    -[SFSearchResult setDataOwnerType:](v5, "setDataOwnerType:", objc_msgSend(v4, "dataOwnerType"));
    objc_msgSend(v4, "fileProviderIdentifier");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setFileProviderIdentifier:](v5, "setFileProviderIdentifier:", v69);

    objc_msgSend(v4, "fileProviderDomainIdentifier");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setFileProviderDomainIdentifier:](v5, "setFileProviderDomainIdentifier:", v70);

    objc_msgSend(v4, "fbr");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setFbr:](v5, "setFbr:", v71);

    objc_msgSend(v4, "srf");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setSrf:](v5, "setSrf:", v72);

    -[SFSearchResult setDoNotFold:](v5, "setDoNotFold:", objc_msgSend(v4, "doNotFold"));
    -[SFSearchResult setBlockId:](v5, "setBlockId:", objc_msgSend(v4, "blockId"));
    objc_msgSend(v4, "entityData");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setEntityData:](v5, "setEntityData:", v73);

    -[SFSearchResult setIsInstantAnswer:](v5, "setIsInstantAnswer:", objc_msgSend(v4, "isInstantAnswer"));
    -[SFSearchResult setShouldAutoNavigate:](v5, "setShouldAutoNavigate:", objc_msgSend(v4, "shouldAutoNavigate"));
    objc_msgSend(v4, "normalizedTopic");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setNormalizedTopic:](v5, "setNormalizedTopic:", v74);

    objc_msgSend(v4, "requestedTopic");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setRequestedTopic:](v5, "setRequestedTopic:", v75);

    -[SFSearchResult setContainsPersonalResult:](v5, "setContainsPersonalResult:", objc_msgSend(v4, "containsPersonalResult"));
    -[SFSearchResult setDidRerankPersonalResult:](v5, "setDidRerankPersonalResult:", objc_msgSend(v4, "didRerankPersonalResult"));
    -[SFSearchResult setCoreSpotlightIndexUsed:](v5, "setCoreSpotlightIndexUsed:", objc_msgSend(v4, "coreSpotlightIndexUsed"));
    -[SFSearchResult setCoreSpotlightIndexUsedReason:](v5, "setCoreSpotlightIndexUsedReason:", objc_msgSend(v4, "coreSpotlightIndexUsedReason"));
    objc_msgSend(v4, "coreSpotlightRankingSignals");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setCoreSpotlightRankingSignals:](v5, "setCoreSpotlightRankingSignals:", v76);

    objc_msgSend(v4, "mailRankingSignals");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setMailRankingSignals:](v5, "setMailRankingSignals:", v77);

    objc_msgSend(v4, "mailResultDetails");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setMailResultDetails:](v5, "setMailResultDetails:", v78);

    -[SFSearchResult setIsVideoAssetFromPhotos:](v5, "setIsVideoAssetFromPhotos:", objc_msgSend(v4, "isVideoAssetFromPhotos"));
    objc_msgSend(v4, "resultEntity");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setResultEntity:](v5, "setResultEntity:", v79);

    objc_msgSend(v4, "entityType");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setEntityType:](v5, "setEntityType:", v80);

    -[SFSearchResult setIsMailInstantAnswerUpdated:](v5, "setIsMailInstantAnswerUpdated:", objc_msgSend(v4, "isMailInstantAnswerUpdated"));
    objc_msgSend(v4, "indexOfSectionWhenRanked");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setIndexOfSectionWhenRanked:](v5, "setIndexOfSectionWhenRanked:", v81);

    objc_msgSend(v4, "indexOfResultInSectionWhenRanked");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setIndexOfResultInSectionWhenRanked:](v5, "setIndexOfResultInSectionWhenRanked:", v82);

    objc_msgSend(v4, "safariAttributes");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setSafariAttributes:](v5, "setSafariAttributes:", v83);

    -[SFSearchResult setHasAppTopHitShortcut:](v5, "setHasAppTopHitShortcut:", objc_msgSend(v4, "hasAppTopHitShortcut"));
    objc_msgSend(v4, "photosAttributes");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setPhotosAttributes:](v5, "setPhotosAttributes:", v84);

    objc_msgSend(v4, "photosAggregatedInfo");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setPhotosAggregatedInfo:](v5, "setPhotosAggregatedInfo:", v85);

    objc_msgSend(v4, "moreResultsButton");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setMoreResultsButton:](v5, "setMoreResultsButton:", v86);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSearchResult:", self);
}

- (void)updatePunchout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SFSearchResult inlineCard](self, "inlineCard");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cardSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSearchResult setPunchout:](self, "setPunchout:", v6);

}

- (SFImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (BOOL)preventThumbnailImageScaling
{
  return self->_preventThumbnailImageScaling;
}

- (void)setPreventThumbnailImageScaling:(BOOL)a3
{
  self->_preventThumbnailImageScaling = a3;
}

- (NSString)secondaryTitle
{
  return self->_secondaryTitle;
}

- (void)setSecondaryTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (SFImage)secondaryTitleImage
{
  return self->_secondaryTitleImage;
}

- (void)setSecondaryTitleImage:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTitleImage, a3);
}

- (BOOL)isSecondaryTitleDetached
{
  return self->_isSecondaryTitleDetached;
}

- (void)setIsSecondaryTitleDetached:(BOOL)a3
{
  self->_isSecondaryTitleDetached = a3;
}

- (BOOL)isCentered
{
  return self->_isCentered;
}

- (void)setIsCentered:(BOOL)a3
{
  self->_isCentered = a3;
}

- (NSArray)descriptions
{
  return self->_descriptions;
}

- (void)setDescriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)publishDate
{
  return self->_publishDate;
}

- (void)setPublishDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (void)setSourceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (SFImage)completionImage
{
  return self->_completionImage;
}

- (void)setCompletionImage:(id)a3
{
  objc_storeStrong((id *)&self->_completionImage, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)auxiliaryTopText
{
  return self->_auxiliaryTopText;
}

- (void)setAuxiliaryTopText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)auxiliaryMiddleText
{
  return self->_auxiliaryMiddleText;
}

- (void)setAuxiliaryMiddleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)auxiliaryBottomText
{
  return self->_auxiliaryBottomText;
}

- (void)setAuxiliaryBottomText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (int)auxiliaryBottomTextColor
{
  return self->_auxiliaryBottomTextColor;
}

- (void)setAuxiliaryBottomTextColor:(int)a3
{
  self->_auxiliaryBottomTextColor = a3;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (void)setPunchout:(id)a3
{
  objc_storeStrong((id *)&self->_punchout, a3);
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (void)setCalendarIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (void)setEntityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void)setMapsData:(id)a3
{
  objc_storeStrong((id *)&self->_mapsData, a3);
}

- (NSString)mapsResultType
{
  return self->_mapsResultType;
}

- (void)setMapsResultType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSURL)mapsMoreURL
{
  return self->_mapsMoreURL;
}

- (void)setMapsMoreURL:(id)a3
{
  objc_storeStrong((id *)&self->_mapsMoreURL, a3);
}

- (NSString)mapsMoreString
{
  return self->_mapsMoreString;
}

- (void)setMapsMoreString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (SFImage)mapsMoreIcon
{
  return self->_mapsMoreIcon;
}

- (void)setMapsMoreIcon:(id)a3
{
  objc_storeStrong((id *)&self->_mapsMoreIcon, a3);
}

- (NSString)nearbyBusinessesString
{
  return self->_nearbyBusinessesString;
}

- (void)setNearbyBusinessesString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)appleReferrer
{
  return self->_appleReferrer;
}

- (void)setAppleReferrer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void)setCard:(id)a3
{
  objc_storeStrong((id *)&self->_card, a3);
}

- (void)setInlineCard:(id)a3
{
  objc_storeStrong((id *)&self->_inlineCard, a3);
}

- (BOOL)usesTopHitDisplay
{
  return self->_usesTopHitDisplay;
}

- (void)setUsesTopHitDisplay:(BOOL)a3
{
  self->_usesTopHitDisplay = a3;
}

- (SFCard)tophitCard
{
  return self->_tophitCard;
}

- (void)setTophitCard:(id)a3
{
  objc_storeStrong((id *)&self->_tophitCard, a3);
}

- (void)setMoreResults:(id)a3
{
  objc_storeStrong((id *)&self->_moreResults, a3);
}

- (void)setMoreResultsPunchout:(id)a3
{
  objc_storeStrong((id *)&self->_moreResultsPunchout, a3);
}

- (SFTopic)normalizedTopic
{
  return self->_normalizedTopic;
}

- (void)setNormalizedTopic:(id)a3
{
  objc_storeStrong((id *)&self->_normalizedTopic, a3);
}

- (void)setRequestedTopic:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSString)userActivityRequiredString
{
  return self->_userActivityRequiredString;
}

- (void)setUserActivityRequiredString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (void)setTopHit:(int)a3
{
  self->_topHit = a3;
}

- (NSString)sectionHeader
{
  return self->_sectionHeader;
}

- (void)setSectionHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSString)sectionHeaderMore
{
  return self->_sectionHeaderMore;
}

- (void)setSectionHeaderMore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSURL)sectionHeaderMoreURL
{
  return self->_sectionHeaderMoreURL;
}

- (void)setSectionHeaderMoreURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (void)setRankingScore:(double)a3
{
  self->_rankingScore = a3;
}

- (int)placement
{
  return self->_placement;
}

- (void)setPlacement:(int)a3
{
  self->_placement = a3;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (unint64_t)minimumRankOfTopHitToSuppressResult
{
  return self->_minimumRankOfTopHitToSuppressResult;
}

- (void)setMinimumRankOfTopHitToSuppressResult:(unint64_t)a3
{
  self->_minimumRankOfTopHitToSuppressResult = a3;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (double)serverScore
{
  return self->_serverScore;
}

- (void)setServerScore:(double)a3
{
  self->_serverScore = a3;
}

- (void)setPersonalizationScore:(double)a3
{
  self->_personalizationScore = a3;
}

- (SFCustom)customProperties
{
  return self->_customProperties;
}

- (void)setCustomProperties:(id)a3
{
  objc_storeStrong((id *)&self->_customProperties, a3);
}

- (void)setResultType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSString)resultTemplate
{
  return self->_resultTemplate;
}

- (void)setResultTemplate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (BOOL)isQuickGlance
{
  return self->_isQuickGlance;
}

- (void)setIsQuickGlance:(BOOL)a3
{
  self->_isQuickGlance = a3;
}

- (BOOL)isStreaming
{
  return self->_isStreaming;
}

- (void)setIsStreaming:(BOOL)a3
{
  self->_isStreaming = a3;
}

- (NSNumber)engagementScore
{
  return self->_engagementScore;
}

- (void)setEngagementScore:(id)a3
{
  objc_storeStrong((id *)&self->_engagementScore, a3);
}

- (NSNumber)queryIndependentScore
{
  return self->_queryIndependentScore;
}

- (void)setQueryIndependentScore:(id)a3
{
  objc_storeStrong((id *)&self->_queryIndependentScore, a3);
}

- (NSNumber)maxAge
{
  return self->_maxAge;
}

- (void)setMaxAge:(id)a3
{
  objc_storeStrong((id *)&self->_maxAge, a3);
}

- (NSString)titleNote
{
  return self->_titleNote;
}

- (void)setTitleNote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (NSNumber)titleNoteSize
{
  return self->_titleNoteSize;
}

- (void)setTitleNoteSize:(id)a3
{
  objc_storeStrong((id *)&self->_titleNoteSize, a3);
}

- (SFImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void)setIsStaticCorrection:(BOOL)a3
{
  self->_isStaticCorrection = a3;
}

- (void)setIsFuzzyMatch:(BOOL)a3
{
  self->_isFuzzyMatch = a3;
}

- (void)setLocalFeatures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (NSDictionary)serverFeatures
{
  return self->_serverFeatures;
}

- (void)setServerFeatures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (void)setIntendedQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (void)setCorrectedQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (void)setCompletedQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (void)setNoGoTakeover:(BOOL)a3
{
  self->_noGoTakeover = a3;
}

- (void)setShouldUseCompactDisplay:(BOOL)a3
{
  self->_shouldUseCompactDisplay = a3;
}

- (void)setPreferTopPlatter:(BOOL)a3
{
  self->_preferTopPlatter = a3;
}

- (void)setWasCompact:(BOOL)a3
{
  self->_wasCompact = a3;
}

- (void)setDidTakeoverGo:(BOOL)a3
{
  self->_didTakeoverGo = a3;
}

- (void)setUsesCompactDisplay:(BOOL)a3
{
  self->_usesCompactDisplay = a3;
}

- (void)setCompactCard:(id)a3
{
  objc_storeStrong((id *)&self->_compactCard, a3);
}

- (NSArray)alternativeURLs
{
  return self->_alternativeURLs;
}

- (void)setAlternativeURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (void)setPubliclyIndexable:(BOOL)a3
{
  self->_publiclyIndexable = a3;
}

- (void)setUserInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (NSArray)itemProviderDataTypes
{
  return self->_itemProviderDataTypes;
}

- (void)setItemProviderDataTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 592);
}

- (NSArray)itemProviderFileTypes
{
  return self->_itemProviderFileTypes;
}

- (void)setItemProviderFileTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 600);
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (NSArray)contentTypeTree
{
  return self->_contentTypeTree;
}

- (void)setContentTypeTree:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 616);
}

- (int64_t)dataOwnerType
{
  return self->_dataOwnerType;
}

- (void)setDataOwnerType:(int64_t)a3
{
  self->_dataOwnerType = a3;
}

- (NSString)fileProviderIdentifier
{
  return self->_fileProviderIdentifier;
}

- (void)setFileProviderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 632);
}

- (NSString)fileProviderDomainIdentifier
{
  return self->_fileProviderDomainIdentifier;
}

- (void)setFileProviderDomainIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 640);
}

- (void)setFbr:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 648);
}

- (NSString)srf
{
  return self->_srf;
}

- (void)setSrf:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (void)setDoNotFold:(BOOL)a3
{
  self->_doNotFold = a3;
}

- (void)setBlockId:(unint64_t)a3
{
  self->_blockId = a3;
}

- (void)setEntityData:(id)a3
{
  objc_storeStrong((id *)&self->_entityData, a3);
}

- (void)setIsInstantAnswer:(BOOL)a3
{
  self->_isInstantAnswer = a3;
}

- (void)setShouldAutoNavigate:(BOOL)a3
{
  self->_shouldAutoNavigate = a3;
}

- (void)setContainsPersonalResult:(BOOL)a3
{
  self->_containsPersonalResult = a3;
}

- (void)setDidRerankPersonalResult:(BOOL)a3
{
  self->_didRerankPersonalResult = a3;
}

- (void)setCoreSpotlightIndexUsed:(int)a3
{
  self->_coreSpotlightIndexUsed = a3;
}

- (void)setCoreSpotlightIndexUsedReason:(int)a3
{
  self->_coreSpotlightIndexUsedReason = a3;
}

- (void)setCoreSpotlightRankingSignals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 680);
}

- (void)setMailRankingSignals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 688);
}

- (void)setMailResultDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 696);
}

- (void)setIsVideoAssetFromPhotos:(BOOL)a3
{
  self->_isVideoAssetFromPhotos = a3;
}

- (SFResultEntity)resultEntity
{
  return self->_resultEntity;
}

- (void)setResultEntity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 704);
}

- (void)setIsMailInstantAnswerUpdated:(BOOL)a3
{
  self->_isMailInstantAnswerUpdated = a3;
}

- (void)setIndexOfSectionWhenRanked:(id)a3
{
  objc_storeStrong((id *)&self->_indexOfSectionWhenRanked, a3);
}

- (void)setIndexOfResultInSectionWhenRanked:(id)a3
{
  objc_storeStrong((id *)&self->_indexOfResultInSectionWhenRanked, a3);
}

- (SFSafariAttributes)safariAttributes
{
  return self->_safariAttributes;
}

- (void)setSafariAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_safariAttributes, a3);
}

- (NSString)entityType
{
  return self->_entityType;
}

- (void)setEntityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 736);
}

- (BOOL)hasAppTopHitShortcut
{
  return self->_hasAppTopHitShortcut;
}

- (void)setHasAppTopHitShortcut:(BOOL)a3
{
  self->_hasAppTopHitShortcut = a3;
}

- (SFPhotosAttributes)photosAttributes
{
  return self->_photosAttributes;
}

- (void)setPhotosAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_photosAttributes, a3);
}

- (SFPhotosAggregatedInfo)photosAggregatedInfo
{
  return self->_photosAggregatedInfo;
}

- (void)setPhotosAggregatedInfo:(id)a3
{
  objc_storeStrong((id *)&self->_photosAggregatedInfo, a3);
}

- (SFCommandButtonItem)moreResultsButton
{
  return self->_moreResultsButton;
}

- (void)setMoreResultsButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 760);
}

+ (id)fallbackBundleId
{
  return CFSTR("com.apple.coreparsec.fallback");
}

+ (id)fallbackSectionBundleIdentifier
{
  return CFSTR("com.apple.coreparsec.server.fallback");
}

+ (id)fallbackImageSymbolName
{
  return CFSTR("magnifyingglass.circle.fill");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
