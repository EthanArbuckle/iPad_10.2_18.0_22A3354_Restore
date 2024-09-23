@implementation PXImportSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXImportSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXImportSettings setUsePhotosOneUp:](self, "setUsePhotosOneUp:", 0);
  -[PXImportSettings setImportSourceSimulationViaDiagnosticsEnabled:](self, "setImportSourceSimulationViaDiagnosticsEnabled:", 0);
  -[PXImportSettings setSimulatedBatteryLevel:](self, "setSimulatedBatteryLevel:", 0);
  -[PXImportSettings setSimulateEmptyImportSource:](self, "setSimulateEmptyImportSource:", 0);
  -[PXImportSettings setDelayBeforeShowingPreparationAlert:](self, "setDelayBeforeShowingPreparationAlert:", 1.0);
  -[PXImportSettings setSimulateLongDiskSpacePreparation:](self, "setSimulateLongDiskSpacePreparation:", 0);
  -[PXImportSettings setSimulatedDiskSpace:](self, "setSimulatedDiskSpace:", 0);
  -[PXImportSettings setShowImportItemFilenames:](self, "setShowImportItemFilenames:", 0);
  -[PXImportSettings setDisableAssetDeletion:](self, "setDisableAssetDeletion:", 0);
  -[PXImportSettings setLoadActualThumbnails:](self, "setLoadActualThumbnails:", 1);
  -[PXImportSettings setLazyLoadAllAssets:](self, "setLazyLoadAllAssets:", 1);
  -[PXImportSettings setGroupItemsByEXIFDate:](self, "setGroupItemsByEXIFDate:", 0);
  -[PXImportSettings setShowNewestItemsInGridUntilScrolled:](self, "setShowNewestItemsInGridUntilScrolled:", 0);
  -[PXImportSettings setAlreadyImportedTruncationMode:](self, "setAlreadyImportedTruncationMode:", 2);
  -[PXImportSettings setHide1UpToolbarAndMarginsForCollapsedAlreadyImportedItem:](self, "setHide1UpToolbarAndMarginsForCollapsedAlreadyImportedItem:", 1);
  -[PXImportSettings setLongPressForOneUpInCompactMode:](self, "setLongPressForOneUpInCompactMode:", 1);
  -[PXImportSettings setLongPressForOneUpInPadSpec:](self, "setLongPressForOneUpInPadSpec:", 1);
  -[PXImportSettings setUseThumbnailSizesAsImageSizeHints:](self, "setUseThumbnailSizesAsImageSizeHints:", 1);
  -[PXImportSettings setLoadRetinaThumbnails:](self, "setLoadRetinaThumbnails:", 0);
  -[PXImportSettings setAlwaysShowCPLOptimizedMessage:](self, "setAlwaysShowCPLOptimizedMessage:", 0);
  -[PXImportSettings setAssetEnumerationBehavior:](self, "setAssetEnumerationBehavior:", 0);
  -[PXImportSettings setAssetEnumerationBatchInterval:](self, "setAssetEnumerationBatchInterval:", 0.25);
  -[PXImportSettings setAssetEnumerationBatchSize:](self, "setAssetEnumerationBatchSize:", 10);
  -[PXImportSettings setShowProgressTitles:](self, "setShowProgressTitles:", 1);
  -[PXImportSettings setExternalOneUpSimulateDeletionFailure:](self, "setExternalOneUpSimulateDeletionFailure:", 0);
  -[PXImportSettings setExternalOneUpForceEnable:](self, "setExternalOneUpForceEnable:", 0);
}

- (void)setUseThumbnailSizesAsImageSizeHints:(BOOL)a3
{
  self->_useThumbnailSizesAsImageSizeHints = a3;
}

- (void)setUsePhotosOneUp:(BOOL)a3
{
  self->_usePhotosOneUp = a3;
}

- (void)setSimulatedDiskSpace:(int64_t)a3
{
  self->_simulatedDiskSpace = a3;
}

- (void)setSimulatedBatteryLevel:(int64_t)a3
{
  self->_simulatedBatteryLevel = a3;
}

- (void)setSimulateLongDiskSpacePreparation:(BOOL)a3
{
  self->_simulateLongDiskSpacePreparation = a3;
}

- (void)setSimulateEmptyImportSource:(BOOL)a3
{
  self->_simulateEmptyImportSource = a3;
}

- (void)setShowProgressTitles:(BOOL)a3
{
  self->_showProgressTitles = a3;
}

- (void)setShowNewestItemsInGridUntilScrolled:(BOOL)a3
{
  self->_showNewestItemsInGridUntilScrolled = a3;
}

- (void)setShowImportItemFilenames:(BOOL)a3
{
  self->_showImportItemFilenames = a3;
}

- (void)setLongPressForOneUpInPadSpec:(BOOL)a3
{
  self->_longPressForOneUpInPadSpec = a3;
}

- (void)setLongPressForOneUpInCompactMode:(BOOL)a3
{
  self->_longPressForOneUpInCompactMode = a3;
}

- (void)setLoadRetinaThumbnails:(BOOL)a3
{
  self->_loadRetinaThumbnails = a3;
}

- (void)setLoadActualThumbnails:(BOOL)a3
{
  self->_loadActualThumbnails = a3;
}

- (void)setLazyLoadAllAssets:(BOOL)a3
{
  self->_lazyLoadAllAssets = a3;
}

- (void)setImportSourceSimulationViaDiagnosticsEnabled:(BOOL)a3
{
  self->_importSourceSimulationViaDiagnosticsEnabled = a3;
}

- (void)setHide1UpToolbarAndMarginsForCollapsedAlreadyImportedItem:(BOOL)a3
{
  self->_hide1UpToolbarAndMarginsForCollapsedAlreadyImportedItem = a3;
}

- (void)setGroupItemsByEXIFDate:(BOOL)a3
{
  self->_groupItemsByEXIFDate = a3;
}

- (void)setExternalOneUpSimulateDeletionFailure:(BOOL)a3
{
  self->_externalOneUpSimulateDeletionFailure = a3;
}

- (void)setExternalOneUpForceEnable:(BOOL)a3
{
  self->_externalOneUpForceEnable = a3;
}

- (void)setDisableAssetDeletion:(BOOL)a3
{
  self->_disableAssetDeletion = a3;
}

- (void)setDelayBeforeShowingPreparationAlert:(double)a3
{
  self->_delayBeforeShowingPreparationAlert = a3;
}

- (void)setAssetEnumerationBehavior:(int64_t)a3
{
  self->_assetEnumerationBehavior = a3;
}

- (void)setAssetEnumerationBatchSize:(unint64_t)a3
{
  self->_assetEnumerationBatchSize = a3;
}

- (void)setAssetEnumerationBatchInterval:(double)a3
{
  self->_assetEnumerationBatchInterval = a3;
}

- (void)setAlwaysShowCPLOptimizedMessage:(BOOL)a3
{
  self->_alwaysShowCPLOptimizedMessage = a3;
}

- (void)setAlreadyImportedTruncationMode:(int64_t)a3
{
  self->_alreadyImportedTruncationMode = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)usePhotosOneUp
{
  return self->_usePhotosOneUp;
}

- (BOOL)importSourceSimulationViaDiagnosticsEnabled
{
  return self->_importSourceSimulationViaDiagnosticsEnabled;
}

- (int64_t)simulatedBatteryLevel
{
  return self->_simulatedBatteryLevel;
}

- (BOOL)simulateEmptyImportSource
{
  return self->_simulateEmptyImportSource;
}

- (double)delayBeforeShowingPreparationAlert
{
  return self->_delayBeforeShowingPreparationAlert;
}

- (BOOL)simulateLongDiskSpacePreparation
{
  return self->_simulateLongDiskSpacePreparation;
}

- (int64_t)simulatedDiskSpace
{
  return self->_simulatedDiskSpace;
}

- (BOOL)showImportItemFilenames
{
  return self->_showImportItemFilenames;
}

- (BOOL)disableAssetDeletion
{
  return self->_disableAssetDeletion;
}

- (BOOL)loadActualThumbnails
{
  return self->_loadActualThumbnails;
}

- (BOOL)lazyLoadAllAssets
{
  return self->_lazyLoadAllAssets;
}

- (BOOL)groupItemsByEXIFDate
{
  return self->_groupItemsByEXIFDate;
}

- (BOOL)showNewestItemsInGridUntilScrolled
{
  return self->_showNewestItemsInGridUntilScrolled;
}

- (int64_t)alreadyImportedTruncationMode
{
  return self->_alreadyImportedTruncationMode;
}

- (BOOL)hide1UpToolbarAndMarginsForCollapsedAlreadyImportedItem
{
  return self->_hide1UpToolbarAndMarginsForCollapsedAlreadyImportedItem;
}

- (BOOL)longPressForOneUpInCompactMode
{
  return self->_longPressForOneUpInCompactMode;
}

- (BOOL)longPressForOneUpInPadSpec
{
  return self->_longPressForOneUpInPadSpec;
}

- (BOOL)useThumbnailSizesAsImageSizeHints
{
  return self->_useThumbnailSizesAsImageSizeHints;
}

- (BOOL)loadRetinaThumbnails
{
  return self->_loadRetinaThumbnails;
}

- (BOOL)alwaysShowCPLOptimizedMessage
{
  return self->_alwaysShowCPLOptimizedMessage;
}

- (int64_t)assetEnumerationBehavior
{
  return self->_assetEnumerationBehavior;
}

- (double)assetEnumerationBatchInterval
{
  return self->_assetEnumerationBatchInterval;
}

- (unint64_t)assetEnumerationBatchSize
{
  return self->_assetEnumerationBatchSize;
}

- (BOOL)showProgressTitles
{
  return self->_showProgressTitles;
}

- (BOOL)externalOneUpSimulateDeletionFailure
{
  return self->_externalOneUpSimulateDeletionFailure;
}

- (BOOL)externalOneUpForceEnable
{
  return self->_externalOneUpForceEnable;
}

+ (PXImportSettings)sharedInstance
{
  if (sharedInstance_onceToken_246411 != -1)
    dispatch_once(&sharedInstance_onceToken_246411, &__block_literal_global_246412);
  return (PXImportSettings *)(id)sharedInstance_sharedInstance_246413;
}

void __34__PXImportSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "importSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_246413;
  sharedInstance_sharedInstance_246413 = v0;

}

@end
