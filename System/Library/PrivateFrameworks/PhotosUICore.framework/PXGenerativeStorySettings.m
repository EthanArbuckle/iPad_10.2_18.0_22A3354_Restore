@implementation PXGenerativeStorySettings

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  uint64_t v5;

  static SettingsUIProvider.Module(_:sections:)(0x432079726F6D654DLL, 0xEF6E6F6974616572, (uint64_t (*)(uint64_t))sub_1A7118668, &v5);
  SettingsUIModule.prototypeToolsModule.getter();
  v3 = v2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGenerativeStorySettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  self->_internal_isMemoryCreationEnabled = 1;
  self->_preferInternalEvaluationUI = 0;
  self->_preferMockSuggestionsData = 0;
  self->_showFreeformMemoryCreationButtonInLemonadeNavBar = 0;
  self->_showFreeformMemoryCreationCellInMemoryShelf = 1;
  self->_showFreeformMemoryCreationButtonInMemoryShelf = 1;
  self->_showFreeformMemoryCreationButtonInMemoryFeed = 1;
  self->_shouldReplaceLemonadePlayButton = 0;
  self->_shouldForceFallbackMemoryGeneration = 0;
  self->_shouldLoadStoriesFromCache = -[PXGenerativeStorySettings _isAppleInternal](self, "_isAppleInternal");
  self->_replaceMemoryCreationWithMockData = 0;
  self->_simulateCreationError = 0;
  self->_entryPointShowsBlurredMovieBackground = 1;
  self->_showDebugUIGenerationProgress = 0;
  self->_showDebugErrorUI = 1;
  self->_disableBackgroundBlur = 0;
  self->_showAllBackgroundAssets = 0;
  self->_backgroundBlurRadius = 40.0;
  self->_simulateSlowFetchForBackgroundAssets = 0;
  self->_shouldUsePlaceholderAssetsForLoadingAnimation = 1;
  self->_shouldUseRetrievedAssetsForLoadingAnimation = 1;
  self->_shouldUseExtendedAssetsForLoadingAnimation = 1;
  *(_WORD *)&self->_shouldUseGlobalTraitsForLoadingAnimation = 1;
  self->_vfxQualityPostProcessingFXHighQuality = 0;
  self->_vfxQualityResolution = 0;
  self->_vfxQualityFrameRate = 0;
  self->_automaticallyRestartStoryGenerationAfterUserDisambiguation = 1;
  self->_automaticallyExpandDisambiguationMenu = 1;
  self->_useOverlayNavigationType = 1;
  self->_showIntelligenceLightingInSuggestions = 1;
  self->_intelligenceLightModeInPromptTextField = 1;
  self->_unresolvableAmbiguityShowsContinueButton = 0;
  self->_enableDateLocationDisambiguation = 0;
  *(_WORD *)&self->_ambiguousTokensPauseStoryGeneration = 1;
  self->_useSystemPromptInputTextField = 1;
  self->_autocompleteSuggestionsMode = 2;
  self->_showChapterTitles = 0;
  self->_saveCurationInFolder = 0;
  self->_uploadVisualDiagnostics = 0;
  self->_shouldUseAvailabilityMonitor = 1;
  *(_WORD *)&self->_shouldUseProcessingStatusInAvailabilityMonitor = 1;
  self->_availabilityPollingInterval = 60.0;
  self->_showPerformanceTTRIfGenerationSlowOrHanging = 0;
  if (-[PXGenerativeStorySettings _isAppleInternal](self, "_isAppleInternal"))
  {
    self->_centralizedFeedbackUI = 0;
    self->_shouldForceDiagnosticAsSeedOrFCS = 0;
  }
  else
  {
    self->_shouldForceDiagnosticAsSeedOrFCS = 1;
    self->_centralizedFeedbackUI = 1;
  }
}

- (BOOL)_isAppleInternal
{
  if (_isAppleInternal_onceToken[0] != -1)
    dispatch_once(_isAppleInternal_onceToken, &__block_literal_global_166);
  return _isAppleInternal_isAppleInternal;
}

- (BOOL)shouldLoadStoriesFromCache
{
  return self->_shouldLoadStoriesFromCache;
}

- (void)setShouldLoadStoriesFromCache:(BOOL)a3
{
  self->_shouldLoadStoriesFromCache = a3;
}

- (BOOL)preferInternalEvaluationUI
{
  return self->_preferInternalEvaluationUI;
}

- (void)setPreferInternalEvaluationUI:(BOOL)a3
{
  self->_preferInternalEvaluationUI = a3;
}

- (BOOL)preferMockSuggestionsData
{
  return self->_preferMockSuggestionsData;
}

- (void)setPreferMockSuggestionsData:(BOOL)a3
{
  self->_preferMockSuggestionsData = a3;
}

- (BOOL)showFreeformMemoryCreationButtonInLemonadeNavBar
{
  return self->_showFreeformMemoryCreationButtonInLemonadeNavBar;
}

- (void)setShowFreeformMemoryCreationButtonInLemonadeNavBar:(BOOL)a3
{
  self->_showFreeformMemoryCreationButtonInLemonadeNavBar = a3;
}

- (BOOL)showFreeformMemoryCreationCellInMemoryShelf
{
  return self->_showFreeformMemoryCreationCellInMemoryShelf;
}

- (void)setShowFreeformMemoryCreationCellInMemoryShelf:(BOOL)a3
{
  self->_showFreeformMemoryCreationCellInMemoryShelf = a3;
}

- (BOOL)showFreeformMemoryCreationButtonInMemoryShelf
{
  return self->_showFreeformMemoryCreationButtonInMemoryShelf;
}

- (void)setShowFreeformMemoryCreationButtonInMemoryShelf:(BOOL)a3
{
  self->_showFreeformMemoryCreationButtonInMemoryShelf = a3;
}

- (BOOL)showFreeformMemoryCreationButtonInMemoryFeed
{
  return self->_showFreeformMemoryCreationButtonInMemoryFeed;
}

- (void)setShowFreeformMemoryCreationButtonInMemoryFeed:(BOOL)a3
{
  self->_showFreeformMemoryCreationButtonInMemoryFeed = a3;
}

- (BOOL)shouldReplaceLemonadePlayButton
{
  return self->_shouldReplaceLemonadePlayButton;
}

- (void)setShouldReplaceLemonadePlayButton:(BOOL)a3
{
  self->_shouldReplaceLemonadePlayButton = a3;
}

- (BOOL)entryPointShowsBlurredMovieBackground
{
  return self->_entryPointShowsBlurredMovieBackground;
}

- (void)setEntryPointShowsBlurredMovieBackground:(BOOL)a3
{
  self->_entryPointShowsBlurredMovieBackground = a3;
}

- (BOOL)disableBackgroundBlur
{
  return self->_disableBackgroundBlur;
}

- (void)setDisableBackgroundBlur:(BOOL)a3
{
  self->_disableBackgroundBlur = a3;
}

- (BOOL)showAllBackgroundAssets
{
  return self->_showAllBackgroundAssets;
}

- (void)setShowAllBackgroundAssets:(BOOL)a3
{
  self->_showAllBackgroundAssets = a3;
}

- (BOOL)simulateSlowFetchForBackgroundAssets
{
  return self->_simulateSlowFetchForBackgroundAssets;
}

- (void)setSimulateSlowFetchForBackgroundAssets:(BOOL)a3
{
  self->_simulateSlowFetchForBackgroundAssets = a3;
}

- (double)backgroundBlurRadius
{
  return self->_backgroundBlurRadius;
}

- (void)setBackgroundBlurRadius:(double)a3
{
  self->_backgroundBlurRadius = a3;
}

- (BOOL)shouldUsePlaceholderAssetsForLoadingAnimation
{
  return self->_shouldUsePlaceholderAssetsForLoadingAnimation;
}

- (void)setShouldUsePlaceholderAssetsForLoadingAnimation:(BOOL)a3
{
  self->_shouldUsePlaceholderAssetsForLoadingAnimation = a3;
}

- (BOOL)shouldUseRetrievedAssetsForLoadingAnimation
{
  return self->_shouldUseRetrievedAssetsForLoadingAnimation;
}

- (void)setShouldUseRetrievedAssetsForLoadingAnimation:(BOOL)a3
{
  self->_shouldUseRetrievedAssetsForLoadingAnimation = a3;
}

- (BOOL)shouldUseExtendedAssetsForLoadingAnimation
{
  return self->_shouldUseExtendedAssetsForLoadingAnimation;
}

- (void)setShouldUseExtendedAssetsForLoadingAnimation:(BOOL)a3
{
  self->_shouldUseExtendedAssetsForLoadingAnimation = a3;
}

- (BOOL)shouldUseGlobalTraitsForLoadingAnimation
{
  return self->_shouldUseGlobalTraitsForLoadingAnimation;
}

- (void)setShouldUseGlobalTraitsForLoadingAnimation:(BOOL)a3
{
  self->_shouldUseGlobalTraitsForLoadingAnimation = a3;
}

- (BOOL)shouldUsePersonalTraitsForLoadingAnimation
{
  return self->_shouldUsePersonalTraitsForLoadingAnimation;
}

- (void)setShouldUsePersonalTraitsForLoadingAnimation:(BOOL)a3
{
  self->_shouldUsePersonalTraitsForLoadingAnimation = a3;
}

- (BOOL)vfxQualityPostProcessingFXHighQuality
{
  return self->_vfxQualityPostProcessingFXHighQuality;
}

- (void)setVfxQualityPostProcessingFXHighQuality:(BOOL)a3
{
  self->_vfxQualityPostProcessingFXHighQuality = a3;
}

- (int64_t)vfxQualityResolution
{
  return self->_vfxQualityResolution;
}

- (void)setVfxQualityResolution:(int64_t)a3
{
  self->_vfxQualityResolution = a3;
}

- (int64_t)vfxQualityFrameRate
{
  return self->_vfxQualityFrameRate;
}

- (void)setVfxQualityFrameRate:(int64_t)a3
{
  self->_vfxQualityFrameRate = a3;
}

- (BOOL)useSystemPromptInputTextField
{
  return self->_useSystemPromptInputTextField;
}

- (void)setUseSystemPromptInputTextField:(BOOL)a3
{
  self->_useSystemPromptInputTextField = a3;
}

- (BOOL)replaceMemoryCreationWithMockData
{
  return self->_replaceMemoryCreationWithMockData;
}

- (void)setReplaceMemoryCreationWithMockData:(BOOL)a3
{
  self->_replaceMemoryCreationWithMockData = a3;
}

- (BOOL)simulateCreationError
{
  return self->_simulateCreationError;
}

- (void)setSimulateCreationError:(BOOL)a3
{
  self->_simulateCreationError = a3;
}

- (BOOL)showDebugUIGenerationProgress
{
  return self->_showDebugUIGenerationProgress;
}

- (void)setShowDebugUIGenerationProgress:(BOOL)a3
{
  self->_showDebugUIGenerationProgress = a3;
}

- (BOOL)showDebugErrorUI
{
  return self->_showDebugErrorUI;
}

- (void)setShowDebugErrorUI:(BOOL)a3
{
  self->_showDebugErrorUI = a3;
}

- (BOOL)ambiguousTokensPauseStoryGeneration
{
  return self->_ambiguousTokensPauseStoryGeneration;
}

- (void)setAmbiguousTokensPauseStoryGeneration:(BOOL)a3
{
  self->_ambiguousTokensPauseStoryGeneration = a3;
}

- (BOOL)ambiguousTokensBlockStoryGeneration
{
  return self->_ambiguousTokensBlockStoryGeneration;
}

- (void)setAmbiguousTokensBlockStoryGeneration:(BOOL)a3
{
  self->_ambiguousTokensBlockStoryGeneration = a3;
}

- (BOOL)enableDateLocationDisambiguation
{
  return self->_enableDateLocationDisambiguation;
}

- (void)setEnableDateLocationDisambiguation:(BOOL)a3
{
  self->_enableDateLocationDisambiguation = a3;
}

- (BOOL)unresolvableAmbiguityShowsContinueButton
{
  return self->_unresolvableAmbiguityShowsContinueButton;
}

- (void)setUnresolvableAmbiguityShowsContinueButton:(BOOL)a3
{
  self->_unresolvableAmbiguityShowsContinueButton = a3;
}

- (BOOL)automaticallyRestartStoryGenerationAfterUserDisambiguation
{
  return self->_automaticallyRestartStoryGenerationAfterUserDisambiguation;
}

- (void)setAutomaticallyRestartStoryGenerationAfterUserDisambiguation:(BOOL)a3
{
  self->_automaticallyRestartStoryGenerationAfterUserDisambiguation = a3;
}

- (BOOL)automaticallyExpandDisambiguationMenu
{
  return self->_automaticallyExpandDisambiguationMenu;
}

- (void)setAutomaticallyExpandDisambiguationMenu:(BOOL)a3
{
  self->_automaticallyExpandDisambiguationMenu = a3;
}

- (BOOL)useOverlayNavigationType
{
  return self->_useOverlayNavigationType;
}

- (void)setUseOverlayNavigationType:(BOOL)a3
{
  self->_useOverlayNavigationType = a3;
}

- (BOOL)showIntelligenceLightingInSuggestions
{
  return self->_showIntelligenceLightingInSuggestions;
}

- (void)setShowIntelligenceLightingInSuggestions:(BOOL)a3
{
  self->_showIntelligenceLightingInSuggestions = a3;
}

- (int64_t)intelligenceLightModeInPromptTextField
{
  return self->_intelligenceLightModeInPromptTextField;
}

- (void)setIntelligenceLightModeInPromptTextField:(int64_t)a3
{
  self->_intelligenceLightModeInPromptTextField = a3;
}

- (int64_t)centralizedFeedbackUI
{
  return self->_centralizedFeedbackUI;
}

- (void)setCentralizedFeedbackUI:(int64_t)a3
{
  self->_centralizedFeedbackUI = a3;
}

- (BOOL)shouldForceDiagnosticAsSeedOrFCS
{
  return self->_shouldForceDiagnosticAsSeedOrFCS;
}

- (void)setShouldForceDiagnosticAsSeedOrFCS:(BOOL)a3
{
  self->_shouldForceDiagnosticAsSeedOrFCS = a3;
}

- (int64_t)autocompleteSuggestionsMode
{
  return self->_autocompleteSuggestionsMode;
}

- (void)setAutocompleteSuggestionsMode:(int64_t)a3
{
  self->_autocompleteSuggestionsMode = a3;
}

- (BOOL)shouldUseAvailabilityMonitor
{
  return self->_shouldUseAvailabilityMonitor;
}

- (void)setShouldUseAvailabilityMonitor:(BOOL)a3
{
  self->_shouldUseAvailabilityMonitor = a3;
}

- (BOOL)shouldUseProcessingStatusInAvailabilityMonitor
{
  return self->_shouldUseProcessingStatusInAvailabilityMonitor;
}

- (void)setShouldUseProcessingStatusInAvailabilityMonitor:(BOOL)a3
{
  self->_shouldUseProcessingStatusInAvailabilityMonitor = a3;
}

- (BOOL)shouldOverrideAvailabilityPollingInterval
{
  return self->_shouldOverrideAvailabilityPollingInterval;
}

- (void)setShouldOverrideAvailabilityPollingInterval:(BOOL)a3
{
  self->_shouldOverrideAvailabilityPollingInterval = a3;
}

- (double)availabilityPollingInterval
{
  return self->_availabilityPollingInterval;
}

- (void)setAvailabilityPollingInterval:(double)a3
{
  self->_availabilityPollingInterval = a3;
}

- (BOOL)saveCurationInFolder
{
  return self->_saveCurationInFolder;
}

- (void)setSaveCurationInFolder:(BOOL)a3
{
  self->_saveCurationInFolder = a3;
}

- (BOOL)uploadVisualDiagnostics
{
  return self->_uploadVisualDiagnostics;
}

- (void)setUploadVisualDiagnostics:(BOOL)a3
{
  self->_uploadVisualDiagnostics = a3;
}

- (BOOL)internal_isMemoryCreationEnabled
{
  return self->_internal_isMemoryCreationEnabled;
}

- (void)setInternal_isMemoryCreationEnabled:(BOOL)a3
{
  self->_internal_isMemoryCreationEnabled = a3;
}

- (BOOL)shouldForceFallbackMemoryGeneration
{
  return self->_shouldForceFallbackMemoryGeneration;
}

- (void)setShouldForceFallbackMemoryGeneration:(BOOL)a3
{
  self->_shouldForceFallbackMemoryGeneration = a3;
}

- (BOOL)showChapterTitles
{
  return self->_showChapterTitles;
}

- (void)setShowChapterTitles:(BOOL)a3
{
  self->_showChapterTitles = a3;
}

- (BOOL)showPerformanceTTRIfGenerationSlowOrHanging
{
  return self->_showPerformanceTTRIfGenerationSlowOrHanging;
}

- (void)setShowPerformanceTTRIfGenerationSlowOrHanging:(BOOL)a3
{
  self->_showPerformanceTTRIfGenerationSlowOrHanging = a3;
}

uint64_t __45__PXGenerativeStorySettings__isAppleInternal__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  _isAppleInternal_isAppleInternal = result;
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_51928 != -1)
    dispatch_once(&sharedInstance_onceToken_51928, &__block_literal_global_51929);
  return (id)sharedInstance_sharedInstance_51930;
}

+ (BOOL)isMemoryCreationEnabled
{
  void *v2;
  char v3;

  if (!+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled")
    || !_os_feature_enabled_impl())
  {
    return 0;
  }
  +[PXGenerativeStorySettings sharedInstance](PXGenerativeStorySettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "internal_isMemoryCreationEnabled");

  return v3;
}

+ (id)internal_deleteGenerativeMemories
{
  void *v2;
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
  id v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("category"), 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("creationType"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3528];
  v24[0] = v4;
  v24[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == 0"), CFSTR("favorite"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3528];
  v23[0] = v8;
  v23[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v12);

  objc_msgSend(v3, "setIncludeStoryMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __62__PXGenerativeStorySettings_internal_deleteGenerativeMemories__block_invoke;
  v21[3] = &unk_1E5149198;
  v14 = v13;
  v22 = v14;
  v20 = 0;
  v15 = objc_msgSend(v2, "performChangesAndWait:error:", v21, &v20);
  v16 = v20;
  v17 = v16;
  if ((v15 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("All your generative memories have been deleted (%lu memories removed)."), objc_msgSend(v14, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not perform deletion, error: %@"), v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Failed to cleanup: %@"), v17);
  }

  return v18;
}

uint64_t __62__PXGenerativeStorySettings_internal_deleteGenerativeMemories__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD1640], "deleteMemories:", *(_QWORD *)(a1 + 32));
}

void __43__PXGenerativeStorySettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "generativeStorySettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_51930;
  sharedInstance_sharedInstance_51930 = v0;

}

@end
