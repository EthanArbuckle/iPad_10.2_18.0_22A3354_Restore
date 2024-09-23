@implementation PXMemoriesFeedSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMemoriesFeedSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXMemoriesFeedSettings setUseSlowAnimations:](self, "setUseSlowAnimations:", 0);
  -[PXMemoriesFeedSettings setAlwaysShowOnboarding:](self, "setAlwaysShowOnboarding:", 0);
  -[PXMemoriesFeedSettings setForceReloadAfterRefresh:](self, "setForceReloadAfterRefresh:", 0);
  -[PXMemoriesFeedSettings setDisableRoundedOverlays:](self, "setDisableRoundedOverlays:", 0);
  -[PXMemoriesFeedSettings setRankMemoriesByRelevanceScore:](self, "setRankMemoriesByRelevanceScore:", 0);
  -[PXMemoriesFeedSettings setDataSourceType:](self, "setDataSourceType:", -[PXMemoriesFeedSettings _defaultDataSourceType](self, "_defaultDataSourceType"));
  -[PXMemoriesFeedSettings setDisplayContentDuringGraphRebuild:](self, "setDisplayContentDuringGraphRebuild:", 1);
  -[PXMemoriesFeedSettings setGroupsPerBatch:](self, "setGroupsPerBatch:", 20);
  -[PXMemoriesFeedSettings setAdditionalContentThreshold:](self, "setAdditionalContentThreshold:", 512.0);
  -[PXMemoriesFeedSettings setMemoryGroupingMethod:](self, "setMemoryGroupingMethod:", 2);
  -[PXMemoriesFeedSettings setMemoryGroupingInterval:](self, "setMemoryGroupingInterval:", 0.0);
  -[PXMemoriesFeedSettings setFavoriteMemoriesSortOrder:](self, "setFavoriteMemoriesSortOrder:", 1);
  -[PXMemoriesFeedSettings setSharingBehavior:](self, "setSharingBehavior:", 0);
}

- (void)setUseSlowAnimations:(BOOL)a3
{
  self->_useSlowAnimations = a3;
}

- (void)setSharingBehavior:(int64_t)a3
{
  self->_sharingBehavior = a3;
}

- (void)setRankMemoriesByRelevanceScore:(BOOL)a3
{
  self->_rankMemoriesByRelevanceScore = a3;
}

- (void)setMemoryGroupingMethod:(int64_t)a3
{
  self->_memoryGroupingMethod = a3;
}

- (void)setMemoryGroupingInterval:(double)a3
{
  self->_memoryGroupingInterval = a3;
}

- (void)setGroupsPerBatch:(unint64_t)a3
{
  self->_groupsPerBatch = a3;
}

- (void)setForceReloadAfterRefresh:(BOOL)a3
{
  self->_forceReloadAfterRefresh = a3;
}

- (void)setFavoriteMemoriesSortOrder:(int64_t)a3
{
  self->_favoriteMemoriesSortOrder = a3;
}

- (void)setDisplayContentDuringGraphRebuild:(BOOL)a3
{
  self->_displayContentDuringGraphRebuild = a3;
}

- (void)setDisableRoundedOverlays:(BOOL)a3
{
  self->_disableRoundedOverlays = a3;
}

- (void)setDataSourceType:(int64_t)a3
{
  self->_dataSourceType = a3;
}

- (void)setAlwaysShowOnboarding:(BOOL)a3
{
  self->_alwaysShowOnboarding = a3;
}

- (void)setAdditionalContentThreshold:(double)a3
{
  self->_additionalContentThreshold = a3;
}

- (int64_t)_defaultDataSourceType
{
  return 3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (int64_t)dataSourceType
{
  return self->_dataSourceType;
}

- (BOOL)useSlowAnimations
{
  return self->_useSlowAnimations;
}

- (BOOL)forceReloadAfterRefresh
{
  return self->_forceReloadAfterRefresh;
}

- (BOOL)disableRoundedOverlays
{
  return self->_disableRoundedOverlays;
}

- (BOOL)rankMemoriesByRelevanceScore
{
  return self->_rankMemoriesByRelevanceScore;
}

- (BOOL)displayContentDuringGraphRebuild
{
  return self->_displayContentDuringGraphRebuild;
}

- (BOOL)alwaysShowOnboarding
{
  return self->_alwaysShowOnboarding;
}

- (int64_t)memoryGroupingMethod
{
  return self->_memoryGroupingMethod;
}

- (double)memoryGroupingInterval
{
  return self->_memoryGroupingInterval;
}

- (double)additionalContentThreshold
{
  return self->_additionalContentThreshold;
}

- (unint64_t)groupsPerBatch
{
  return self->_groupsPerBatch;
}

- (int64_t)favoriteMemoriesSortOrder
{
  return self->_favoriteMemoriesSortOrder;
}

- (int64_t)sharingBehavior
{
  return self->_sharingBehavior;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9170 != -1)
    dispatch_once(&sharedInstance_onceToken_9170, &__block_literal_global_9171);
  return (id)sharedInstance_sharedInstance_9172;
}

void __40__PXMemoriesFeedSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "memoryFeed");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_9172;
  sharedInstance_sharedInstance_9172 = v0;

}

+ (id)settingsControllerModule
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
  _QWORD v45[5];
  void *v46;
  _QWORD v47[3];
  void *v48;
  _QWORD v49[12];

  v49[10] = *MEMORY[0x1E0C80C00];
  v40 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Slow Animations"), CFSTR("useSlowAnimations"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v43;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Display Content During Graph Rebuild"), CFSTR("displayContentDuringGraphRebuild"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v42;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Always Show Onboarding"), CFSTR("alwaysShowOnboarding"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v39;
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Reset Onboarding"), &__block_literal_global_265868);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v38;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Memory Grouping Method"), CFSTR("memoryGroupingMethod"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "possibleValues:titles:", &unk_1E53EAAE8, &unk_1E53EAB00);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v36;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Memory Grouping Interval"), CFSTR("memoryGroupingInterval"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "possibleValues:titles:", &unk_1E53EAB18, &unk_1E53EAB30);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("memoryGroupingMethod == %@"), &unk_1E53EF4F8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "condition:", v33);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v2;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Groups Per Batch"), CFSTR("groupsPerBatch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minValue:maxValue:", 0.0, 1024.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_increment:", 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v5;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Additional Content Threshold"), CFSTR("additionalContentThreshold"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue:maxValue:", 0.0, 1024.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_increment:", 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v8;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Disable Rounded Overlay View"), CFSTR("disableRoundedOverlays"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v49[8] = v9;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Rank Memories By Relevance Score"), CFSTR("rankMemoriesByRelevanceScore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v49[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "sectionWithRows:title:", v11, CFSTR("Settings"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Force Reload After Refresh"), CFSTR("forceReloadAfterRefresh"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionWithRows:title:", v14, CFSTR("Refreshing"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Delete Memories"), &__block_literal_global_215_265891);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v17;
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:output:", CFSTR("Font Diagnostics"), &__block_literal_global_233_265893);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v18;
  v19 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(a1, "_resetRejectedMemories");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rowWithTitle:action:", CFSTR("Reset Rejected Memories"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionWithRows:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Show Single Memory View"), &__block_literal_global_240_265896);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sectionWithRows:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0D83078];
  v45[0] = v41;
  v45[1] = v15;
  v45[2] = v23;
  v45[3] = v27;
  v45[4] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "moduleWithTitle:contents:", CFSTR("Memories Feed"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

+ (id)_resetRejectedMemories
{
  return (id)objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_246_265860);
}

uint64_t __52__PXMemoriesFeedSettings_UI___resetRejectedMemories__block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = PXMemoriesResetRejected(v0, 1, 0);

  return v1;
}

void __54__PXMemoriesFeedSettings_UI__settingsControllerModule__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  _SingleMemoryDebugViewController *v3;

  v2 = a2;
  v3 = objc_alloc_init(_SingleMemoryDebugViewController);
  objc_msgSend(v2, "pushViewController:animated:", v3, 1);

}

id __54__PXMemoriesFeedSettings_UI__settingsControllerModule__block_invoke_4()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "librarySpecificFetchOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "setIncludePendingMemories:", 1);
  objc_msgSend(v1, "setIncludeRejectedMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSortDescriptors:", v3);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXTitleFontDiagnosticsService diagnosticsDescriptionForAssetCollections:](PXTitleFontDiagnosticsService, "diagnosticsDescriptionForAssetCollections:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __54__PXMemoriesFeedSettings_UI__settingsControllerModule__block_invoke_214(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0DC3450];
  v3 = a2;
  objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", 0, CFSTR("Are you sure? This action cannot be undone."), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Delete All Memories"), 2, &__block_literal_global_223_265906);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v4);

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v5);

  objc_msgSend(v3, "presentViewController:animated:completion:", v6, 1, 0);
}

void __54__PXMemoriesFeedSettings_UI__settingsControllerModule__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "librarySpecificFetchOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "setIncludePendingMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PXMemoriesFeedSettings_UI__settingsControllerModule__block_invoke_3;
  v5[3] = &unk_1E5149198;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "performChangesAndWait:error:", v5, 0);

}

uint64_t __54__PXMemoriesFeedSettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD1640], "deleteMemories:", *(_QWORD *)(a1 + 32));
}

void __54__PXMemoriesFeedSettings_UI__settingsControllerModule__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeObjectForKey:", CFSTR("PXMemoriesHasConfirmedOnboardingDefaultsKey"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "synchronize");

}

@end
