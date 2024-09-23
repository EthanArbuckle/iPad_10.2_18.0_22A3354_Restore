@implementation WBSSearchParameters

+ (NSArray)searchParameters
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSTrialManager shared](WBSTrialManager, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSSearchParameters getSearchParametersHelper:withTrial:withCache:](WBSSearchParameters, "getSearchParametersHelper:withTrial:withCache:", v2, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

+ (id)getSearchParametersHelper:(id)a3 withTrial:(id)a4 withCache:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  WBSSearchParameters *v11;
  void *v12;
  void *v13;
  WBSSearchParameters *v14;
  WBSSearchParameters *v15;
  id v16;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)standard_params;
  if (!standard_params || !a5)
  {
    v11 = objc_alloc_init(WBSSearchParameters);
    v12 = (void *)standard_params;
    standard_params = (uint64_t)v11;

    v10 = (void *)standard_params;
  }
  objc_msgSend(v10, "updateUsingPreferenceKeys:", v7);
  if (v8 && objc_msgSend(v8, "isReady") && objc_msgSend(v8, "inExperiment"))
  {
    v13 = (void *)trial_params;
    if (!trial_params || !a5)
    {
      if (objc_msgSend(v8, "runCFFlow"))
      {
        v14 = -[WBSSearchParameters initWithTrial:forPrefs:forTrial:]([WBSSearchParameters alloc], "initWithTrial:forPrefs:forTrial:", 1, v7, v8);
        objc_msgSend(v9, "addObject:", v14);

      }
      v15 = -[WBSSearchParameters initWithTrial:forPrefs:forTrial:]([WBSSearchParameters alloc], "initWithTrial:forPrefs:forTrial:", 0, v7, v8);
      objc_msgSend(v9, "addObject:", v15);

      objc_storeStrong((id *)&trial_params, v9);
      v13 = (void *)trial_params;
    }
  }
  else
  {
    objc_msgSend(v9, "addObject:", standard_params);
    v13 = v9;
  }
  v16 = v13;

  return v16;
}

+ (id)codePathUUIDForHideIgnoredSiriSuggestedWebsites
{
  if (+[WBSSearchParameters codePathUUIDForHideIgnoredSiriSuggestedWebsites]::onceToken != -1)
    dispatch_once(&+[WBSSearchParameters codePathUUIDForHideIgnoredSiriSuggestedWebsites]::onceToken, &__block_literal_global_93);
  return (id)+[WBSSearchParameters codePathUUIDForHideIgnoredSiriSuggestedWebsites]::codePathUUID;
}

void __70__WBSSearchParameters_codePathUUIDForHideIgnoredSiriSuggestedWebsites__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("81C7C46C-0C4F-40C3-9527-EC71B259C813"));
  v1 = (void *)+[WBSSearchParameters codePathUUIDForHideIgnoredSiriSuggestedWebsites]::codePathUUID;
  +[WBSSearchParameters codePathUUIDForHideIgnoredSiriSuggestedWebsites]::codePathUUID = v0;

}

- (WBSSearchParameters)init
{
  WBSSearchParameters *v2;
  WBSSearchParameters *v3;
  WBSSearchParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WBSSearchParameters;
  v2 = -[WBSSearchParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WBSSearchParameters updateWithDefaults](v2, "updateWithDefaults");
    v4 = v3;
  }

  return v3;
}

- (WBSSearchParameters)initWithPreferences:(id)a3
{
  id v4;
  WBSSearchParameters *v5;
  WBSSearchParameters *v6;
  void *v7;
  id v8;
  WBSSearchParameters *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSSearchParameters;
  v5 = -[WBSSearchParameters init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[WBSSearchParameters updateWithDefaults](v5, "updateWithDefaults");
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v8 = v4;

      v7 = v8;
    }
    -[WBSSearchParameters updateUsingPreferenceKeys:](v6, "updateUsingPreferenceKeys:", v7);
    v9 = v6;

  }
  return v6;
}

- (void)updateWithDefaults
{
  self->_isCFSearch = 0;
  self->_CFSearchTimeout = 0.06;
  *(_WORD *)&self->_isProvider1Enabled = 0;
  *(_WORD *)&self->_isResultFilteringDisabled = 0;
  self->_isLocalPhantomTophitDisabled = objc_msgSend(MEMORY[0x1E0D89BE8], "isReflectUserIntentInSearchEnabled");
  *(_WORD *)&self->_strengthenAutocompleteTriggerExtensionMatching = 256;
  self->_enableCompletionListHistoryDeduplicationSwitchToTabValue = 1;
  self->_characterThresholdForAnywhereInTitleOrURL = 18;
  *(int64x2_t *)&self->_percentageThresholdForAnywhereInTitle = vdupq_n_s64(0x3FE999999999999AuLL);
  *(_OWORD *)&self->_characterThresholdForStartOfURLPathComponent = xmmword_1A3F5BDF0;
  *(_OWORD *)&self->_characterThresholdForStartOfTitle = xmmword_1A3F5BE00;
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "isReflectUserIntentInSearchEnabled"))
    self->_characterThresholdForStartOfTitleWordMatchLongEnoughForTopHit = 6;
  self->_characterThresholdForStartOfURL = 3;
  self->_normalizedTopSitesScoreAndVisitCountMultiplier = 4.0;
  self->_maxBookmarksAndHistoryItems = -1;
  self->_thresholdForHidingIgnoredSiriSuggestedSites = -1;
}

- (void)updateUsingPreferenceKeys:(id)a3
{
  void *v4;
  id v5;
  int v6;
  double v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v5 = v8;

    v4 = v5;
  }
  if (objc_msgSend(v4, "BOOLForKey:", CFSTR("WBSSearchRelevanceOverrideDefaults")))
  {
    if (objc_msgSend(v4, "BOOLForKey:", CFSTR("WBSDisableTrial")))
    {
      self->_isResultFilteringDisabled = objc_msgSend(v4, "BOOLForKey:", CFSTR("WBSDebugDisableResultFiltering"));
      self->_isDedupeThroughAlternativeURLsEnabled = objc_msgSend(v4, "BOOLForKey:", CFSTR("WBSSearchRelevanceServerAssistedDeduplication"));
      self->_enableCompletionListHistoryDeduplicationValue = objc_msgSend(v4, "BOOLForKey:", CFSTR("WBSSearchRelevanceHistoryDeduplication"));
      self->_enableCompletionListHistoryDeduplicationSwitchToTabValue = objc_msgSend(v4, "BOOLForKey:", CFSTR("WBSSearchRelevanceHistoryDeduplicationSwitchToTab"));
      v6 = objc_msgSend(v4, "BOOLForKey:", CFSTR("WBSSearchRelevanceDecayResults"));
      v7 = 0.0;
      if (v6)
        v7 = 4.0;
      self->_normalizedTopSitesScoreAndVisitCountMultiplier = v7;
      self->_isLocalPhantomTophitDisabled = objc_msgSend(v4, "BOOLForKey:", CFSTR("WBSSearchRelevanceLocalPhantomTophitsDisabled"));
      self->_strengthenAutocompleteTriggerExtensionMatching = objc_msgSend(v4, "BOOLForKey:", CFSTR("WBSSearchRelevanceStrengthenAutocompleteTriggerExtensionMatching"));
    }
    if ((objc_msgSend(v4, "BOOLForKey:", CFSTR("WBSSearchRelevanceOverrideDefaults")) & 1) == 0)
      -[WBSSearchParameters updateWithDefaults](self, "updateWithDefaults");
  }

}

- (WBSSearchParameters)initWithTrial:(BOOL)a3 forPrefs:(id)a4 forTrial:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  WBSSearchParameters *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  WBSSearchParameters *v16;
  WBSSearchParameters *v17;
  _QWORD block[4];
  WBSSearchParameters *v20;
  objc_super v21;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)WBSSearchParameters;
  v10 = -[WBSSearchParameters init](&v21, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v12 = v8;

      v11 = v12;
    }
    objc_msgSend(MEMORY[0x1E0D89D08], "sharedObserver");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", v10);

    -[WBSSearchParameters updateWithDefaults](v10, "updateWithDefaults");
    +[WBSTrialManager shared](WBSTrialManager, "shared");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v15 = v9;

      v14 = v15;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__WBSSearchParameters_initWithTrial_forPrefs_forTrial___block_invoke;
    block[3] = &unk_1E4B2A2C8;
    v16 = v10;
    v20 = v16;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    if ((objc_msgSend(v14, "inExperiment") & 1) != 0
      && (objc_msgSend(v11, "BOOLForKey:", CFSTR("WBSSearchRelevanceOverrideDefaults")) & 1) == 0
      && (objc_msgSend(v11, "BOOLForKey:", CFSTR("WBSDisableTrial")) & 1) == 0)
    {
      -[WBSSearchParameters updateWithTrial:forTrial:](v16, "updateWithTrial:forTrial:", v6, v14);
    }
    v17 = v16;

  }
  return v10;
}

void __55__WBSSearchParameters_initWithTrial_forPrefs_forTrial___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", *MEMORY[0x1E0D89FD0], *(_QWORD *)(a1 + 32));

}

- (void)updateWithTrial:(BOOL)a3 forTrial:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  NSString *v11;
  NSString *codepathIDs;
  id v13;

  v4 = a3;
  v13 = a4;
  +[WBSTrialManager shared](WBSTrialManager, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v7 = v13;

    v6 = v7;
  }
  if (v4)
  {
    self->_isCFSearch = 1;
    objc_msgSend(v6, "CFSearchTimeoutForDefault:", 0.06);
    self->_CFSearchTimeout = v8;
  }
  self->_isProvider1Enabled = objc_msgSend(v6, "getBoolFactor:forCF:forDefault:", CFSTR("enableProvider1"), 0, 0);
  self->_isProvider2Enabled = objc_msgSend(v6, "getBoolFactor:forCF:forDefault:", CFSTR("enableProvider2"), 0, 0);
  self->_isDedupeThroughAlternativeURLsEnabled = objc_msgSend(v6, "getBoolFactor:forCF:forDefault:", CFSTR("enableDedupeThroughAlternativeURLs"), v4, 0);
  self->_isLocalPhantomTophitDisabled = objc_msgSend(v6, "getBoolFactor:forCF:forDefault:", CFSTR("disableLocalPhantomTophits"), v4, objc_msgSend(MEMORY[0x1E0D89BE8], "isReflectUserIntentInSearchEnabled"));
  self->_strengthenAutocompleteTriggerExtensionMatching = objc_msgSend(v6, "getBoolFactor:forCF:forDefault:", CFSTR("strengthenAutocompleteTriggerExtensionMatching"), v4, 0);
  self->_enableCompletionListHistoryDeduplicationValue = objc_msgSend(v6, "getBoolFactor:forCF:forDefault:", CFSTR("enableCompletionListHistoryDeduplication"), v4, 1);
  self->_characterThresholdForAnywhereInTitleOrURL = objc_msgSend(v6, "getIntFactor:forCF:forDefault:", CFSTR("characterThresholdForAnywhereInTitleOrURL"), v4, 18);
  objc_msgSend(v6, "getFloatFactor:forCF:forDefault:", CFSTR("percentageThresholdForAnywhereInTitle"), v4, 0.8);
  self->_percentageThresholdForAnywhereInTitle = v9;
  objc_msgSend(v6, "getFloatFactor:forCF:forDefault:", CFSTR("percentageThresholdForAnywhereInURL"), v4, 0.8);
  self->_percentageThresholdForAnywhereInURL = v10;
  self->_characterThresholdForStartOfURLPathComponent = (uint64_t)(double)objc_msgSend(v6, "getIntFactor:forCF:forDefault:", CFSTR("characterThresholdForStartOfURLPathComponent"), v4, 4);
  self->_matchingWordsInTitleThreshold = objc_msgSend(v6, "getIntFactor:forCF:forDefault:", CFSTR("matchingWordsInTitleThreshold"), v4, 3);
  self->_characterThresholdForStartOfTitle = (uint64_t)(double)objc_msgSend(v6, "getIntFactor:forCF:forDefault:", CFSTR("characterThresholdForStartOfTitle"), v4, 3);
  self->_characterThresholdForStartOfTitleWord = (uint64_t)(double)objc_msgSend(v6, "getIntFactor:forCF:forDefault:", CFSTR("characterThresholdForStartOfTitleWord"), v4, 4);
  self->_characterThresholdForStartOfURL = (uint64_t)(double)objc_msgSend(v6, "getIntFactor:forCF:forDefault:", CFSTR("characterThresholdForStartOfURL"), v4, 3);
  self->_normalizedTopSitesScoreAndVisitCountMultiplier = (double)objc_msgSend(v6, "getIntFactor:forCF:forDefault:", CFSTR("normalizedTopSitesScoreAndVisitCountMultiplier"), v4, 4);
  self->_maxBookmarksAndHistoryItems = objc_msgSend(v6, "getIntFactor:forCF:forDefault:", CFSTR("maxBookmarksAndHistoryItems"), v4, -1);
  self->_thresholdForHidingIgnoredSiriSuggestedSites = objc_msgSend(v6, "getIntFactor:forCF:forDefault:", CFSTR("thresholdForHidingIgnoredSiriSuggestedSites"), v4, -1);
  objc_msgSend(v6, "stringFactorWithName:", CFSTR("codepathIDs"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  codepathIDs = self->_codepathIDs;
  self->_codepathIDs = v11;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSSearchParameters)initWithCoder:(id)a3
{
  id v4;
  WBSSearchParameters *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  uint64_t v10;
  NSString *codepathIDs;
  WBSSearchParameters *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSSearchParameters;
  v5 = -[WBSSearchParameters init](&v14, sel_init);
  if (v5)
  {
    v5->_isCFSearch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCFSearch"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("CFSearchTimeout"));
    v5->_CFSearchTimeout = v6;
    v5->_isProvider1Enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isProvider1Enabled"));
    v5->_isProvider2Enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isProvider2Enabled"));
    v5->_isResultFilteringDisabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isResultFilteringDisabled"));
    v5->_isDedupeThroughAlternativeURLsEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDedupeThroughAlternativeURLsEnabled"));
    v5->_isLocalPhantomTophitDisabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLocalPhantomTophitDisabled"));
    v5->_strengthenAutocompleteTriggerExtensionMatching = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("strengthenAutocompleteTriggerExtensionMatching"));
    v5->_enableCompletionListHistoryDeduplicationValue = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableCompletionListHistoryDeduplicationValue"));
    v5->_enableCompletionListHistoryDeduplicationSwitchToTabValue = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableCompletionListHistoryDeduplicationSwitchToTabValue"));
    v5->_characterThresholdForAnywhereInTitleOrURL = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("characterThresholdForAnywhereInTitleOrURL"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("percentageThresholdForAnywhereInTitle"));
    v5->_percentageThresholdForAnywhereInTitle = v7;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("percentageThresholdForAnywhereInURL"));
    v5->_percentageThresholdForAnywhereInURL = v8;
    v5->_characterThresholdForStartOfURLPathComponent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("characterThresholdForStartOfURLPathComponent"));
    v5->_matchingWordsInTitleThreshold = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("matchingWordsInTitleThreshold"));
    v5->_characterThresholdForStartOfTitle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("characterThresholdForStartOfTitle"));
    v5->_characterThresholdForStartOfTitleWord = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("characterThresholdForStartOfTitleWord"));
    v5->_characterThresholdForStartOfTitleWordMatchLongEnoughForTopHit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("characterThresholdForStartOfTitleWordMatchLongEnoughForTopHit"));
    v5->_characterThresholdForStartOfURL = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("characterThresholdForStartOfURL"));
    v5->_maxBookmarksAndHistoryItems = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxBookmarksAndHistoryItems"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("normalizedTopSitesScoreAndVisitCountMultiplier"));
    v5->_normalizedTopSitesScoreAndVisitCountMultiplier = v9;
    v5->_thresholdForHidingIgnoredSiriSuggestedSites = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("thresholdForHidingIgnoredSiriSuggestedSites"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("codepathIDs"));
    v10 = objc_claimAutoreleasedReturnValue();
    codepathIDs = v5->_codepathIDs;
    v5->_codepathIDs = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double CFSearchTimeout;
  double percentageThresholdForAnywhereInTitle;
  double percentageThresholdForAnywhereInURL;
  double normalizedTopSitesScoreAndVisitCountMultiplier;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeBool:forKey:", self->_isCFSearch, CFSTR("isCFSearch"));
  CFSearchTimeout = self->_CFSearchTimeout;
  *(float *)&CFSearchTimeout = CFSearchTimeout;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("CFSearchTimeout"), CFSearchTimeout);
  objc_msgSend(v8, "encodeBool:forKey:", self->_isProvider1Enabled, CFSTR("isProvider1Enabled"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_isProvider2Enabled, CFSTR("isProvider2Enabled"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_isResultFilteringDisabled, CFSTR("isResultFilteringDisabled"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_isDedupeThroughAlternativeURLsEnabled, CFSTR("isDedupeThroughAlternativeURLsEnabled"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_isLocalPhantomTophitDisabled, CFSTR("isLocalPhantomTophitDisabled"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_strengthenAutocompleteTriggerExtensionMatching, CFSTR("strengthenAutocompleteTriggerExtensionMatching"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_enableCompletionListHistoryDeduplicationValue, CFSTR("enableCompletionListHistoryDeduplicationValue"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_enableCompletionListHistoryDeduplicationSwitchToTabValue, CFSTR("enableCompletionListHistoryDeduplicationSwitchToTabValue"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_characterThresholdForAnywhereInTitleOrURL, CFSTR("characterThresholdForAnywhereInTitleOrURL"));
  percentageThresholdForAnywhereInTitle = self->_percentageThresholdForAnywhereInTitle;
  *(float *)&percentageThresholdForAnywhereInTitle = percentageThresholdForAnywhereInTitle;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("percentageThresholdForAnywhereInTitle"), percentageThresholdForAnywhereInTitle);
  percentageThresholdForAnywhereInURL = self->_percentageThresholdForAnywhereInURL;
  *(float *)&percentageThresholdForAnywhereInURL = percentageThresholdForAnywhereInURL;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("percentageThresholdForAnywhereInURL"), percentageThresholdForAnywhereInURL);
  objc_msgSend(v8, "encodeInteger:forKey:", self->_characterThresholdForStartOfURLPathComponent, CFSTR("characterThresholdForStartOfURLPathComponent"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_matchingWordsInTitleThreshold, CFSTR("matchingWordsInTitleThreshold"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_characterThresholdForStartOfTitle, CFSTR("characterThresholdForStartOfTitle"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_characterThresholdForStartOfTitleWord, CFSTR("characterThresholdForStartOfTitleWord"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_characterThresholdForStartOfTitleWordMatchLongEnoughForTopHit, CFSTR("characterThresholdForStartOfTitleWordMatchLongEnoughForTopHit"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_characterThresholdForStartOfURL, CFSTR("characterThresholdForStartOfURL"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_maxBookmarksAndHistoryItems, CFSTR("maxBookmarksAndHistoryItems"));
  normalizedTopSitesScoreAndVisitCountMultiplier = self->_normalizedTopSitesScoreAndVisitCountMultiplier;
  *(float *)&normalizedTopSitesScoreAndVisitCountMultiplier = normalizedTopSitesScoreAndVisitCountMultiplier;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("normalizedTopSitesScoreAndVisitCountMultiplier"), normalizedTopSitesScoreAndVisitCountMultiplier);
  objc_msgSend(v8, "encodeInteger:forKey:", self->_thresholdForHidingIgnoredSiriSuggestedSites, CFSTR("thresholdForHidingIgnoredSiriSuggestedSites"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_codepathIDs, CFSTR("codepathIDs"));

}

- (BOOL)isGoogleABEnabledForSearchEnginePreferenceObserver:(id)a3
{
  return self->_isProvider1Enabled;
}

- (BOOL)isDuckDuckGoABEnabledForSearchEnginePreferenceObserver:(id)a3
{
  return self->_isProvider2Enabled;
}

- (BOOL)shouldEmitTriggerLoggingForHidingIgnoredSiriSuggestedWebsite
{
  return -[NSString containsString:](self->_codepathIDs, "containsString:", CFSTR("81C7C46C-0C4F-40C3-9527-EC71B259C813"));
}

- (BOOL)isCFSearch
{
  return self->_isCFSearch;
}

- (void)setIsCFSearch:(BOOL)a3
{
  self->_isCFSearch = a3;
}

- (double)CFSearchTimeout
{
  return self->_CFSearchTimeout;
}

- (void)setCFSearchTimeout:(double)a3
{
  self->_CFSearchTimeout = a3;
}

- (BOOL)isForVoiceSearch
{
  return self->_isForVoiceSearch;
}

- (void)setIsForVoiceSearch:(BOOL)a3
{
  self->_isForVoiceSearch = a3;
}

- (BOOL)isResultFilteringDisabled
{
  return self->_isResultFilteringDisabled;
}

- (void)setIsResultFilteringDisabled:(BOOL)a3
{
  self->_isResultFilteringDisabled = a3;
}

- (BOOL)isDedupeThroughAlternativeURLsEnabled
{
  return self->_isDedupeThroughAlternativeURLsEnabled;
}

- (void)setIsDedupeThroughAlternativeURLsEnabled:(BOOL)a3
{
  self->_isDedupeThroughAlternativeURLsEnabled = a3;
}

- (BOOL)isLocalPhantomTophitDisabled
{
  return self->_isLocalPhantomTophitDisabled;
}

- (void)setIsLocalPhantomTophitDisabled:(BOOL)a3
{
  self->_isLocalPhantomTophitDisabled = a3;
}

- (BOOL)strengthenAutocompleteTriggerExtensionMatching
{
  return self->_strengthenAutocompleteTriggerExtensionMatching;
}

- (void)setStrengthenAutocompleteTriggerExtensionMatching:(BOOL)a3
{
  self->_strengthenAutocompleteTriggerExtensionMatching = a3;
}

- (BOOL)enableCompletionListHistoryDeduplicationValue
{
  return self->_enableCompletionListHistoryDeduplicationValue;
}

- (void)setEnableCompletionListHistoryDeduplicationValue:(BOOL)a3
{
  self->_enableCompletionListHistoryDeduplicationValue = a3;
}

- (BOOL)enableCompletionListHistoryDeduplicationSwitchToTabValue
{
  return self->_enableCompletionListHistoryDeduplicationSwitchToTabValue;
}

- (void)setEnableCompletionListHistoryDeduplicationSwitchToTabValue:(BOOL)a3
{
  self->_enableCompletionListHistoryDeduplicationSwitchToTabValue = a3;
}

- (int64_t)characterThresholdForAnywhereInTitleOrURL
{
  return self->_characterThresholdForAnywhereInTitleOrURL;
}

- (void)setCharacterThresholdForAnywhereInTitleOrURL:(int64_t)a3
{
  self->_characterThresholdForAnywhereInTitleOrURL = a3;
}

- (double)percentageThresholdForAnywhereInTitle
{
  return self->_percentageThresholdForAnywhereInTitle;
}

- (void)setPercentageThresholdForAnywhereInTitle:(double)a3
{
  self->_percentageThresholdForAnywhereInTitle = a3;
}

- (double)percentageThresholdForAnywhereInURL
{
  return self->_percentageThresholdForAnywhereInURL;
}

- (void)setPercentageThresholdForAnywhereInURL:(double)a3
{
  self->_percentageThresholdForAnywhereInURL = a3;
}

- (int64_t)characterThresholdForStartOfURLPathComponent
{
  return self->_characterThresholdForStartOfURLPathComponent;
}

- (void)setCharacterThresholdForStartOfURLPathComponent:(int64_t)a3
{
  self->_characterThresholdForStartOfURLPathComponent = a3;
}

- (int64_t)matchingWordsInTitleThreshold
{
  return self->_matchingWordsInTitleThreshold;
}

- (void)setMatchingWordsInTitleThreshold:(int64_t)a3
{
  self->_matchingWordsInTitleThreshold = a3;
}

- (int64_t)characterThresholdForStartOfTitle
{
  return self->_characterThresholdForStartOfTitle;
}

- (void)setCharacterThresholdForStartOfTitle:(int64_t)a3
{
  self->_characterThresholdForStartOfTitle = a3;
}

- (int64_t)characterThresholdForStartOfTitleWord
{
  return self->_characterThresholdForStartOfTitleWord;
}

- (void)setCharacterThresholdForStartOfTitleWord:(int64_t)a3
{
  self->_characterThresholdForStartOfTitleWord = a3;
}

- (int64_t)characterThresholdForStartOfTitleWordMatchLongEnoughForTopHit
{
  return self->_characterThresholdForStartOfTitleWordMatchLongEnoughForTopHit;
}

- (void)setCharacterThresholdForStartOfTitleWordMatchLongEnoughForTopHit:(int64_t)a3
{
  self->_characterThresholdForStartOfTitleWordMatchLongEnoughForTopHit = a3;
}

- (int64_t)characterThresholdForStartOfURL
{
  return self->_characterThresholdForStartOfURL;
}

- (void)setCharacterThresholdForStartOfURL:(int64_t)a3
{
  self->_characterThresholdForStartOfURL = a3;
}

- (double)normalizedTopSitesScoreAndVisitCountMultiplier
{
  return self->_normalizedTopSitesScoreAndVisitCountMultiplier;
}

- (void)setNormalizedTopSitesScoreAndVisitCountMultiplier:(double)a3
{
  self->_normalizedTopSitesScoreAndVisitCountMultiplier = a3;
}

- (int64_t)maxBookmarksAndHistoryItems
{
  return self->_maxBookmarksAndHistoryItems;
}

- (void)setMaxBookmarksAndHistoryItems:(int64_t)a3
{
  self->_maxBookmarksAndHistoryItems = a3;
}

- (int64_t)thresholdForHidingIgnoredSiriSuggestedSites
{
  return self->_thresholdForHidingIgnoredSiriSuggestedSites;
}

- (NSString)codepathIDs
{
  return self->_codepathIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codepathIDs, 0);
}

@end
