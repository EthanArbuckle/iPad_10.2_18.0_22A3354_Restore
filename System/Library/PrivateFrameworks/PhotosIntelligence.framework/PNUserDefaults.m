@implementation PNUserDefaults

+ (void)initialize
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___PNUserDefaults;
  objc_msgSendSuper2(&v3, sel_initialize);
  objc_msgSend(a1, "_registerDefaults");
}

+ (void)_registerDefaults
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[11];
  _QWORD v9[11];
  _QWORD v10[54];
  _QWORD v11[55];

  v11[54] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDBD1C0];
  v4 = MEMORY[0x24BDBD1C8];
  v10[0] = CFSTR("PNPromoterStatusMergeCandidateLimit");
  v10[1] = CFSTR("PNPromoterStatusVerifiedPersonLimit");
  v11[0] = &unk_25149A0A8;
  v11[1] = &unk_25149A0C0;
  v10[2] = CFSTR("PNCollectionToStoryContextTokenLimit");
  v10[3] = CFSTR("PNPersonalTraitsMinRatioOfAssets");
  v11[2] = &unk_25149A0D8;
  v11[3] = &unk_251499F88;
  v10[4] = CFSTR("PNPersonalTraitGeneratorMinNumberOfStandardDeviations");
  v10[5] = CFSTR("PNUseGMSStreaming");
  v11[4] = &unk_25149A0F0;
  v11[5] = MEMORY[0x24BDBD1C0];
  v10[6] = CFSTR("PNUseGMSTemplates");
  v10[7] = CFSTR("PNEnableAssetScopingTokenPromotion");
  v11[6] = MEMORY[0x24BDBD1C8];
  v11[7] = MEMORY[0x24BDBD1C0];
  v10[8] = CFSTR("PNAssetScopingTokenPromotionLikeliness");
  v10[9] = CFSTR("kPNAssetsSelectionUsingOverlappingMomentsThreshold");
  v11[8] = &unk_251499F98;
  v11[9] = &unk_251499FA8;
  v10[10] = CFSTR("kPNRetrievalThresholdGlobalTraitsScopedAssets");
  v10[11] = CFSTR("kPNRetrievalThresholdGlobalTraits");
  v11[10] = &unk_251499FB8;
  v11[11] = &unk_251499FC8;
  v10[12] = CFSTR("kPNRetrievalThresholdShotlistMatching");
  v10[13] = CFSTR("PNUserQueryEmbeddingSearchRetrievalLimit");
  v11[12] = &unk_251499FC8;
  v11[13] = &unk_25149A108;
  v10[14] = CFSTR("PNGlobalTraitsScopingEmbeddingSearchRetrievalLimit");
  v10[15] = CFSTR("PNGlobalTraitsMatchingEmbeddingSearchRetrievalLimit");
  v11[14] = &unk_25149A120;
  v11[15] = &unk_25149A120;
  v10[16] = CFSTR("PNShotlistMatchingEmbeddingSearchRetrievalLimit");
  v10[17] = CFSTR("PNKeyAssetEmbeddingSearchRetrievalLimit");
  v11[16] = &unk_25149A120;
  v11[17] = &unk_25149A120;
  v10[18] = CFSTR("PNPlaceholderAssetFetchMultiplier");
  v10[19] = CFSTR("PNMusicKeywordsPegasusParameters");
  v11[18] = &unk_25149A138;
  v11[19] = &unk_25149A650;
  v10[20] = CFSTR("PNMusicKeywordsThimbleParameters");
  v10[21] = CFSTR("PNEnableOnDemandCaptionGeneration");
  v11[20] = &unk_25149A678;
  v11[21] = MEMORY[0x24BDBD1C0];
  v10[22] = CFSTR("PNEnableMediaAnalysisEmbeddingSearch");
  v10[23] = CFSTR("kPNForceVisualClusterBasedStories");
  v11[22] = MEMORY[0x24BDBD1C8];
  v11[23] = MEMORY[0x24BDBD1C0];
  v10[24] = CFSTR("kPNSaveVisualClustersToDebugAlbums");
  v10[25] = CFSTR("kPNStoryGenerationNumberOfGlobalTraits");
  v11[24] = MEMORY[0x24BDBD1C0];
  v11[25] = &unk_25149A150;
  v10[26] = CFSTR("kPNStoryGenerationNumberOfChaptersPerStory");
  v10[27] = CFSTR("kPNStoryGenerationNumberOfShotsPerChapter");
  v11[26] = &unk_25149A168;
  v11[27] = &unk_25149A180;
  v10[28] = CFSTR("kPNStoryGenerationNumberOfTraitsToSelect");
  v10[29] = CFSTR("kPNEnableChapterValidator");
  v11[28] = &unk_25149A198;
  v11[29] = MEMORY[0x24BDBD1C0];
  v10[30] = CFSTR("kPNPromotePlayableAssetsInStories");
  v10[31] = CFSTR("kPNShufflePromptParameters");
  v11[30] = MEMORY[0x24BDBD1C8];
  v11[31] = MEMORY[0x24BDBD1C8];
  v10[32] = CFSTR("PNUseStillAssetsOnlyInBackgound");
  v10[33] = CFSTR("PNEnableMockRateLimitingError");
  v11[32] = MEMORY[0x24BDBD1C0];
  v11[33] = MEMORY[0x24BDBD1C0];
  v10[34] = CFSTR("PNEnableMockNetworkError");
  v10[35] = CFSTR("PNEnableMockServerRequestTimeout");
  v11[34] = MEMORY[0x24BDBD1C0];
  v11[35] = MEMORY[0x24BDBD1C0];
  v10[36] = CFSTR("PNEnableGeneralMCError");
  v10[37] = CFSTR("kPNTripHighlightRepresentativeAssetsThreshold");
  v11[36] = MEMORY[0x24BDBD1C0];
  v11[37] = &unk_251499FD8;
  v10[38] = CFSTR("PNPromptRankingParameters");
  v8[0] = CFSTR("weightForAction");
  v8[1] = CFSTR("weightForPerson");
  v9[0] = &unk_251499FE8;
  v9[1] = &unk_251499FF8;
  v8[2] = CFSTR("weightForPersonRelationship");
  v8[3] = CFSTR("weightForPlace");
  v9[2] = &unk_251499FF8;
  v9[3] = &unk_251499FD8;
  v8[4] = CFSTR("weightForCity");
  v8[5] = CFSTR("weightForTrait");
  v9[4] = &unk_251499FD8;
  v9[5] = &unk_251499FA8;
  v8[6] = CFSTR("embeddingDistanceThreshold");
  v8[7] = CFSTR("defaultMetadataDistanceThreshold");
  v9[6] = &unk_25149A008;
  v9[7] = &unk_25149A018;
  v8[8] = CFSTR("minimumMetadataDistanceThreshold");
  v8[9] = CFSTR("metadataDistanceThresholdDecrement");
  v9[8] = &unk_25149A028;
  v9[9] = &unk_25149A038;
  v8[10] = CFSTR("promptComparisonCount");
  v9[10] = &unk_25149A1B0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[38] = v5;
  v11[39] = &unk_25149A1C8;
  v10[39] = CFSTR("PNPromptValidationAssetCountThreshold");
  v10[40] = CFSTR("PNPromptValidationOfflineLLMQUEnabled");
  v11[40] = v4;
  v11[41] = &unk_25149A1B0;
  v10[41] = CFSTR("PNGlobalTraitsModelVersion");
  v10[42] = CFSTR("PNStorytellerModelVersion");
  v11[42] = &unk_25149A1B0;
  v11[43] = &unk_25149A1B0;
  v10[43] = CFSTR("PNAssetCurationModelVersion");
  v10[44] = CFSTR("PNGlobalTraitsUseWhatScoping");
  v11[44] = v4;
  v11[45] = v3;
  v10[45] = CFSTR("PNGlobalTraitsIfNotEnoughWhatAssetsUseWholeLibrary");
  v10[46] = CFSTR("PNGlobalTraitsUseOnlyRetrievalIfEnough");
  v11[46] = v3;
  v11[47] = &unk_25149A1E0;
  v10[47] = CFSTR("PNGlobalTraitsUseOnlyRetrievalThreshold");
  v10[48] = CFSTR("PNGlobalTraitsEnoughWhatAssetsThreshold");
  v11[48] = &unk_25149A1F8;
  v11[49] = v3;
  v10[49] = CFSTR("PNGlobalTraitsUseMomentValidation");
  v10[50] = CFSTR("PNGlobalTraitsNumberOfTraitsForMomentOverlap");
  v11[50] = &unk_25149A198;
  v11[51] = v3;
  v10[51] = CFSTR("PNGlobalTraitsUseSemanticSimilarity");
  v10[52] = CFSTR("PNGlobalTraitsMaximumTextSimilarityScore");
  v10[53] = CFSTR("PNUseLanguageDetectionLexiconFallback");
  v11[52] = &unk_25149A048;
  v11[53] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 54);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerDefaults:", v6);

  v7 = (void *)xpc_copy_entitlement_for_self();
  if (v7 == (void *)MEMORY[0x24BDACF20])
    +[LLMDefaults setupDefaultBackendWithRemoveUserOverwrite:enableLogging:](_TtC18PhotosIntelligence11LLMDefaults, "setupDefaultBackendWithRemoveUserOverwrite:enableLogging:", 0, 0);

}

+ (int64_t)promoterStatusMergeCandidateLimit
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("PNPromoterStatusMergeCandidateLimit"));

  return v3;
}

+ (int64_t)promoterStatusVerifiedPersonLimit
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("PNPromoterStatusVerifiedPersonLimit"));

  return v3;
}

+ (BOOL)locationCurationAvoidPeople
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNLocationCurationAvoidPeople"));

  return v3;
}

+ (NSString)ajaxDawToken
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("PNAjaxDawToken"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)fallbackBase30bModelName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("PNFallbackBase30bModelName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)fallbackStorytelling30bModelName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("PNFallbackStorytelling30bModelName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)fallbackGlobalTraits30bModelName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("PNFallbackGlobalTraits30bModelName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)fallbackAssetCuration30bModelName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("PNFallbackAssetCuration30bModelName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (int64_t)collectionToStoryContextTokenLimit
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("PNCollectionToStoryContextTokenLimit"));

  return v3;
}

+ (double)personalTraitGeneratorMinRatioOfAssets
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("PNPersonalTraitsMinRatioOfAssets"));
  v4 = v3;

  return v4;
}

+ (double)personalTraitGeneratorMinNumberOfStandardDeviations
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("PNPersonalTraitGeneratorMinNumberOfStandardDeviations"));
  v4 = v3;

  return v4;
}

+ (double)globalTraitsScopedAssetsRetrievalThreshold
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("kPNRetrievalThresholdGlobalTraitsScopedAssets"));
  v4 = v3;

  return v4;
}

+ (double)globalTraitsRetrievalThreshold
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("kPNRetrievalThresholdGlobalTraits"));
  v4 = v3;

  return v4;
}

+ (double)assetsSelectionUsingOverlappingMomentsThreshold
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("kPNAssetsSelectionUsingOverlappingMomentsThreshold"));
  v4 = v3;

  return v4;
}

+ (double)shotlistMatchingRetrievalThreshold
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("kPNRetrievalThresholdShotlistMatching"));
  v4 = v3;

  return v4;
}

+ (NSNumber)storyAssetsFetcherSimilarityThreshold
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("PNStoryAssetsFetcherSimilarityThreshold"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &unk_25149A058;
  }

  return (NSNumber *)v5;
}

+ (int64_t)userQueryEmbeddingSearchRetrievalLimit
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("PNUserQueryEmbeddingSearchRetrievalLimit"));

  return v3;
}

+ (int64_t)globalTraitsScopingEmbeddingSearchRetrievalLimit
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("PNGlobalTraitsScopingEmbeddingSearchRetrievalLimit"));

  return v3;
}

+ (int64_t)globalTraitsMatchingEmbeddingSearchRetrievalLimit
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("PNGlobalTraitsMatchingEmbeddingSearchRetrievalLimit"));

  return v3;
}

+ (int64_t)shotlistMatchingEmbeddingSearchRetrievalLimit
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("PNShotlistMatchingEmbeddingSearchRetrievalLimit"));

  return v3;
}

+ (int64_t)keyAssetEmbeddingSearchRetrievalLimit
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("PNKeyAssetEmbeddingSearchRetrievalLimit"));

  return v3;
}

+ (int64_t)placeholderAssetFetchMultiplier
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("PNPlaceholderAssetFetchMultiplier"));

  return v3;
}

+ (BOOL)useLLMBasedMusicKeywordGeneration
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNUseLLMBasedMusicKeywordGeneration"));

  return v3;
}

+ (BOOL)useMockQUMusicForCuration
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNUseMockQUMusicForCuration"));

  return v3;
}

+ (NSString)mockQUMusic
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("PNMockQUMusic"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)storyMusicMaestroEmbeddingApproach
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("PNStoryMusicMaestroEmbeddingApproach"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)appleMusicSmartSearchMode
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("PNAppleMusicSmartSearchMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)appleMusicMCPrivacyDisclosureState
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("PNAppleMusicMCPrivacyDisclosureState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (BOOL)enableAssetScopingTokenPromotion
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNEnableAssetScopingTokenPromotion"));

  return v3;
}

+ (double)tripHighlightRepresentativeAssetsThreshold
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("kPNTripHighlightRepresentativeAssetsThreshold"));
  v4 = v3;

  return v4;
}

+ (double)assetScopingTokenPromotionLikeliness
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("PNAssetScopingTokenPromotionLikeliness"));
  v4 = v3;

  return v4;
}

+ (BOOL)useGMSStreaming
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNUseGMSStreaming"));

  return v3;
}

+ (BOOL)useGMSTemplates
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNUseGMSTemplates"));

  return v3;
}

+ (NSNumber)globalAndPersonalTraitsSeed
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PNGlobalAndPersonalTraitsSeed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

+ (NSNumber)storytellerSelectedTraitsCount
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PNStorytellerSelectedTraitsCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

+ (NSString)fallbackQueryUnderstanding30bModelName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("PNFallbackQueryUnderstanding30bModelName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSDictionary)globalTraitsPegasusParameters
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("PNGlobalTraitsPegasusParameters"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

+ (NSDictionary)globalTraitsThimbleParameters
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("PNGlobalTraitsThimbleParameters"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

+ (NSDictionary)assetCurationPegasusParameters
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("PNAssetCurationPegasusParameters"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

+ (NSDictionary)assetCurationThimbleParameters
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("PNAssetCurationThimbleParameters"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

+ (NSDictionary)freeformStoryPegasusParameters
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("PNFreeformStoryPegasusParameters"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

+ (NSDictionary)freeformStoryThimbleParameters
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("PNFreeformStoryThimbleParameters"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

+ (NSDictionary)promptRankingParameters
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("PNPromptRankingParameters"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

+ (int64_t)promptValidationAssetCountThreshold
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("PNPromptValidationAssetCountThreshold"));

  return v3;
}

+ (BOOL)promptValidationOfflineLLMQUEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNPromptValidationOfflineLLMQUEnabled"));

  return v3;
}

+ (NSDictionary)musicKeywordsPegasusParameters
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("PNMusicKeywordsPegasusParameters"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

+ (NSDictionary)musicKeywordsThimbleParameters
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("PNMusicKeywordsThimbleParameters"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

+ (BOOL)disableLLMAssetCuration
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNDisableLLMAssetCuration"));

  return v3;
}

+ (BOOL)enableOnDemandCaptionGeneration
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNEnableOnDemandCaptionGeneration"));

  return v3;
}

+ (BOOL)enableMediaAnalysisEmbeddingSearch
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNEnableMediaAnalysisEmbeddingSearch"));

  return v3;
}

+ (BOOL)forceVisualClusterBasedStories
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kPNForceVisualClusterBasedStories"));

  return v3;
}

+ (BOOL)saveVisualClustersToDebugAlbums
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kPNSaveVisualClustersToDebugAlbums"));

  return v3;
}

+ (NSNumber)numberOfGlobalTraits
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("kPNStoryGenerationNumberOfGlobalTraits"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

+ (NSNumber)numberOfChaptersPerStory
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("kPNStoryGenerationNumberOfChaptersPerStory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

+ (NSNumber)numberOfShotsPerChapter
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("kPNStoryGenerationNumberOfShotsPerChapter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

+ (NSNumber)numberOfTraitsToSelect
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("kPNStoryGenerationNumberOfTraitsToSelect"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

+ (NSString)chapterCurationRandomizerSeed
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("kPNChapterCurationRandomizerSeed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (BOOL)enableChapterValidator
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kPNEnableChapterValidator"));

  return v3;
}

+ (BOOL)promotePlayableAssetsInStories
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kPNPromotePlayableAssetsInStories"));

  return v3;
}

+ (BOOL)shufflePromptParameters
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kPNShufflePromptParameters"));

  return v3;
}

+ (NSString)shufflePromptParametersSeed
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("kPNShufflePromptParametersSeed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)memoryCreationAvailabilityState
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("PNMemoryCreationAvailabilityState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (BOOL)useStillAssetsOnlyInBackgound
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNUseStillAssetsOnlyInBackgound"));

  return v3;
}

+ (BOOL)enableMockRateLimitingError
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNEnableMockRateLimitingError"));

  return v3;
}

+ (BOOL)enableMockNetworkError
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNEnableMockNetworkError"));

  return v3;
}

+ (BOOL)enableMockNotEnoughAssetsError
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNEnableMockNotEnoughAssetsError"));

  return v3;
}

+ (BOOL)enableMockServerRequestTimeout
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNEnableMockServerRequestTimeout"));

  return v3;
}

+ (BOOL)enableMockGeneralMCError
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNEnableGeneralMCError"));

  return v3;
}

+ (int64_t)globalTraitsModelVersion
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("PNGlobalTraitsModelVersion"));

  return v3;
}

+ (int64_t)storytellerModelVersion
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("PNStorytellerModelVersion"));

  return v3;
}

+ (int64_t)assetCurationModelVersion
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("PNAssetCurationModelVersion"));

  return v3;
}

+ (BOOL)globalTraitsUseWhatScoping
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNGlobalTraitsUseWhatScoping"));

  return v3;
}

+ (BOOL)globalTraitsIfNotEnoughWhatAssetsUseWholeLibrary
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNGlobalTraitsIfNotEnoughWhatAssetsUseWholeLibrary"));

  return v3;
}

+ (BOOL)globalTraitsUseOnlyRetrievalIfEnough
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNGlobalTraitsUseOnlyRetrievalIfEnough"));

  return v3;
}

+ (int64_t)globalTraitsUseOnlyRetrievalThreshold
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("PNGlobalTraitsUseOnlyRetrievalThreshold"));

  return v3;
}

+ (int64_t)globalTraitsEnoughWhatAssetsThreshold
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("PNGlobalTraitsEnoughWhatAssetsThreshold"));

  return v3;
}

+ (BOOL)globalTraitsUseMomentValidation
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNGlobalTraitsUseMomentValidation"));

  return v3;
}

+ (int64_t)globalTraitsNumberOfTraitsForMomentOverlap
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("PNGlobalTraitsNumberOfTraitsForMomentOverlap"));

  return v3;
}

+ (BOOL)globalTraitsUseSemanticSimilarity
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNGlobalTraitsUseSemanticSimilarity"));

  return v3;
}

+ (NSNumber)globalTraitsMaximumTextSimilarityScore
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PNGlobalTraitsMaximumTextSimilarityScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

+ (BOOL)useLanguageDetectionLexiconFallback
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PNUseLanguageDetectionLexiconFallback"));

  return v3;
}

+ (NSString)eventElectionMode
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("PNEventElectionMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end
