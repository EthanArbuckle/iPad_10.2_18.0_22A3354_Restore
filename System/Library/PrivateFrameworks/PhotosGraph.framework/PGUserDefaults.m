@implementation PGUserDefaults

+ (void)initialize
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___PGUserDefaults;
  objc_msgSendSuper2(&v3, sel_initialize);
  objc_msgSend(a1, "_registerDefaults");
}

+ (void)_registerDefaults
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[41];
  _QWORD v17[43];

  v17[41] = *MEMORY[0x1E0C80C00];
  v2 = _os_feature_enabled_impl();
  if (PGIsAppleInternal_onceToken != -1)
    dispatch_once(&PGIsAppleInternal_onceToken, &__block_literal_global_8044);
  if (v2)
    v3 = 6;
  else
    v3 = 5;
  if (v2)
    v4 = 4;
  else
    v4 = 3;
  v5 = PGIsAppleInternal_isAppleInternal;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C9AAB0];
  v8 = MEMORY[0x1E0C9AAA0];
  v17[2] = MEMORY[0x1E0C9AAA0];
  v17[3] = &unk_1E84E4F58;
  v17[0] = MEMORY[0x1E0C9AAB0];
  v17[1] = MEMORY[0x1E0C9AAB0];
  v17[4] = &unk_1E84EB558;
  v17[5] = MEMORY[0x1E0C9AAB0];
  v17[6] = MEMORY[0x1E0C9AAA0];
  v17[7] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5, CFSTR("showHolidayCalendarEvents"), CFSTR("PGCuratedLibraryTripKeyAssetUseIconicScore"), CFSTR("alwaysShowHolidayCalendarEvents"), CFSTR("PGPeopleMemoryMaximumNumberOfFacesPerAssetForSingleFocusedPersonFacedAssets"), CFSTR("PGPeopleMemoryMinimumRatioOfFocusedPersonFacesPerAssetForMultipleFocusedPersonsFacedAssets"), CFSTR("enablePublicEvents"), CFSTR("disableMemoryElection"), CFSTR("autonamingDisabled"), CFSTR("ingestAutonamingSignalProperties"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[8] = v9;
  v17[9] = v8;
  v16[9] = CFSTR("ingestAutonamingFilteredOutInferences");
  v16[10] = CFSTR("relationshipInferenceDisabled");
  v17[10] = v8;
  v16[11] = CFSTR("ingestRelationshipSignalProperties");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[11] = v10;
  v17[12] = v8;
  v16[12] = CFSTR("ingestRelationshipFilteredOutInferences");
  v16[13] = CFSTR("PGMaximumNumberOfTextFeaturesPerEvent");
  v17[13] = &unk_1E84E4F70;
  v17[14] = v7;
  v16[14] = CFSTR("PGBoundPHTextFeatures");
  v16[15] = CFSTR("PGSuppressGraphLiveUpdate");
  v17[15] = v8;
  v17[16] = v8;
  v16[16] = CFSTR("PGOnThisDayHighlightKeyAssetRotationIsEnabled");
  v16[17] = CFSTR("behavioralCurationEnabled");
  v17[17] = v7;
  v16[18] = CFSTR("PGMaximumNumberOfVisibleRegularItems");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[18] = v11;
  v16[19] = CFSTR("PGMaximumNumberOfVisibleItems");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[19] = v12;
  v17[20] = &unk_1E84E4F88;
  v16[20] = CFSTR("PGMinimumNumberOfVisibleItems");
  v16[21] = CFSTR("kPGUseExtendedCurationAssetCountForLocationTitles");
  v17[21] = v7;
  v16[22] = CFSTR("photosChallengeProfileEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[22] = v13;
  v17[23] = v8;
  v16[23] = CFSTR("kPGMusicCurationShouldUseOldStylePreviewURL");
  v16[24] = CFSTR("kPGMusicCurationAllowAllForExport");
  v17[24] = v8;
  v17[25] = v8;
  v16[25] = CFSTR("kPGMusicCurationAllowExplicitMusicContent");
  v16[26] = CFSTR("PGUseMeaningEdgeForEventLabelingAlgorithm");
  v17[26] = v8;
  v17[27] = v8;
  v16[27] = CFSTR("PGGraphConsistencyCheckIsEnabled");
  v16[28] = CFSTR("PGGraphConsistencyNotificationIsEnabled");
  v17[28] = v8;
  v17[29] = &unk_1E84EB568;
  v16[29] = CFSTR("PGGraphConsistencyPercentageThresholdForTTR");
  v16[30] = CFSTR("PGRelationshipTagMinConfidenceThreshold");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[31] = CFSTR("PGWallpaperSkipSettlingEffectScoreGating");
  v16[32] = CFSTR("usersChildrenInferenceRecencyThresholdYears");
  v17[32] = &unk_1E84EB578;
  v17[33] = &unk_1E84EB588;
  v16[33] = CFSTR("usersChildrenInferenceMinimumLifespanYears");
  v16[34] = CFSTR("usersPetsInferenceRecencyThresholdYears");
  v17[34] = &unk_1E84EB578;
  v17[35] = &unk_1E84EB598;
  v17[30] = v14;
  v17[31] = v8;
  v16[35] = CFSTR("usersPetsInferenceMinimumLifespanYears");
  v16[36] = CFSTR("enableMomentCLIPFeatureGraphIngest");
  v17[36] = v8;
  v17[37] = v8;
  v16[37] = CFSTR("useAOIsInExtendedTokens");
  v16[38] = CFSTR("minimumCumulativeDistributionOfPersonFrequency");
  v17[38] = &unk_1E84EB5A8;
  v17[39] = &unk_1E84EB5A8;
  v16[39] = CFSTR("minimumCumulativeDistributionOfCityFrequency");
  v16[40] = CFSTR("minimumCumulativeDistributionOfAreaFrequency");
  v17[40] = &unk_1E84EB558;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 41);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerDefaults:", v15);

}

+ (BOOL)useExtendedCurationAssetCountForLocationTitles
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kPGUseExtendedCurationAssetCountForLocationTitles"));

  return v3;
}

+ (BOOL)isShowingHolidayCalendarEvents
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("showHolidayCalendarEvents"));

  return v3;
}

+ (BOOL)isAlwaysShowingHolidayCalendarEvents
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("alwaysShowHolidayCalendarEvents"));

  return v3;
}

+ (unint64_t)minimumNumberOfCuratedAssetsForInterestingMoments
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("PGMinimumNumberOfCuratedAssetsForInterestingMoments"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  return v4;
}

+ (BOOL)isMemoriesNotificationDisabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("notificationDisabled"));

  return v3;
}

+ (BOOL)isMemoriesLivingOnFeedbackEnabled
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("PGMemoriesLivingOnFeedbackEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

+ (unint64_t)maximumNumberOfFacesPerAssetForSingleFocusedPersonFacedAssets
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("PGPeopleMemoryMaximumNumberOfFacesPerAssetForSingleFocusedPersonFacedAssets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  return v4;
}

+ (double)minimumRatioOfFocusedPersonFacesPerAssetForMultipleFocusedPersonsFacedAssets
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("PGPeopleMemoryMinimumRatioOfFocusedPersonFacesPerAssetForMultipleFocusedPersonsFacedAssets"));
  v4 = v3;

  return v4;
}

+ (BOOL)isAutonamingDisabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("autonamingDisabled"));

  return v3;
}

+ (BOOL)isAutonamingSignalPropertiesIngestAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ingestAutonamingSignalProperties"));

  return v3;
}

+ (BOOL)isAutonamingFilteredOutInferencesIngestAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ingestAutonamingFilteredOutInferences"));

  return v3;
}

+ (BOOL)isRelationshipInferenceDisabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("relationshipInferenceDisabled"));

  return v3;
}

+ (BOOL)isRelationshipSignalPropertiesIngestAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ingestRelationshipSignalProperties"));

  return v3;
}

+ (BOOL)isRelationshipFilteredOutInferencesIngestAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ingestRelationshipFilteredOutInferences"));

  return v3;
}

+ (unint64_t)maximumNumberOfTextFeaturesPerEvent
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("PGMaximumNumberOfTextFeaturesPerEvent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  return v4;
}

+ (BOOL)boundTextFeaturesPerEvent
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PGBoundPHTextFeatures"));

  return v3;
}

+ (BOOL)isPublicEventsEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("enablePublicEvents"));

  return v3;
}

+ (BOOL)isMemoryElectionDisabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("disableMemoryElection"));

  return v3;
}

+ (BOOL)suppressGraphLiveUpdate
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PGSuppressGraphLiveUpdate"));

  return v3;
}

+ (BOOL)graphConsistencyCheckIsEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PGGraphConsistencyCheckIsEnabled"));

  return v3;
}

+ (BOOL)graphConsistencyNotificationIsEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PGGraphConsistencyNotificationIsEnabled"));

  return v3;
}

+ (double)graphConsistencyPercentageThresholdForTTR
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("PGGraphConsistencyPercentageThresholdForTTR"));
  v4 = v3;

  return v4;
}

+ (BOOL)onThisDayHighlightKeyAssetRotationIsEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PGOnThisDayHighlightKeyAssetRotationIsEnabled"));

  return v3;
}

+ (BOOL)isBehavioralCurationEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("behavioralCurationEnabled"));

  return v3;
}

+ (BOOL)isPhotosChallengeEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("photosChallengeProfileEnabled"));

  return v3;
}

+ (NSDictionary)extendedCurationOptions
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("extendedCurationOptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

+ (void)setExtendedCurationOptions:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("extendedCurationOptions"));

}

+ (unint64_t)maximumNumberOfVisibleRegularItems
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("PGMaximumNumberOfVisibleRegularItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  return v4;
}

+ (unint64_t)maximumNumberOfVisibleItems
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("PGMaximumNumberOfVisibleItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  return v4;
}

+ (unint64_t)minimumNumberOfVisibleItems
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("PGMinimumNumberOfVisibleItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  return v4;
}

+ (BOOL)musicCurationShouldUseOldStylePreviewURL
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kPGMusicCurationShouldUseOldStylePreviewURL"));

  return v3;
}

+ (BOOL)musicCurationAllowAllForExport
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kPGMusicCurationAllowAllForExport"));

  return v3;
}

+ (BOOL)musicCurationAllowExplicitMusicContent
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kPGMusicCurationAllowExplicitMusicContent"));

  return v3;
}

+ (BOOL)shouldDisableContentClassificationTask
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PGShouldDisableContentClassificationTask"));

  return v3;
}

+ (BOOL)useMeaningEdgeForEventLabelingAlgorithm
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PGUseMeaningEdgeForEventLabelingAlgorithm"));

  return v3;
}

+ (double)relationshipTagMinConfidenceThreshold
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("PGRelationshipTagMinConfidenceThreshold"));
  v4 = v3;

  return v4;
}

+ (BOOL)useIconicScoreForTrips
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PGCuratedLibraryTripKeyAssetUseIconicScore"));

  return v3;
}

+ (BOOL)wallpaperSkipSettlingEffectScoreGating
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PGWallpaperSkipSettlingEffectScoreGating"));

  return v3;
}

+ (double)usersChildrenInferenceRecencyThresholdFromLatestMomentDateYears
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("usersChildrenInferenceRecencyThresholdYears"));
  v4 = v3;

  return v4;
}

+ (double)usersChildrenInferenceMinimumLifespanYears
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("usersChildrenInferenceMinimumLifespanYears"));
  v4 = v3;

  return v4;
}

+ (double)usersPetsInferenceRecencyThresholdFromLatestMomentDateYears
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("usersPetsInferenceRecencyThresholdYears"));
  v4 = v3;

  return v4;
}

+ (double)usersPetsInferenceMinimumLifespanYears
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("usersPetsInferenceMinimumLifespanYears"));
  v4 = v3;

  return v4;
}

+ (BOOL)enableMomentCLIPFeatureGraphIngest
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("enableMomentCLIPFeatureGraphIngest"));

  return v3;
}

+ (BOOL)useAOIsInExtendedTokens
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("useAOIsInExtendedTokens"));

  return v3;
}

+ (double)minimumCumulativeDistributionOfPersonFrequency
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("minimumCumulativeDistributionOfPersonFrequency"));
  v4 = v3;

  return v4;
}

+ (double)minimumCumulativeDistributionOfCityFrequency
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("minimumCumulativeDistributionOfCityFrequency"));
  v4 = v3;

  return v4;
}

+ (double)minimumCumulativeDistributionOfAreaFrequency
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("minimumCumulativeDistributionOfAreaFrequency"));
  v4 = v3;

  return v4;
}

@end
