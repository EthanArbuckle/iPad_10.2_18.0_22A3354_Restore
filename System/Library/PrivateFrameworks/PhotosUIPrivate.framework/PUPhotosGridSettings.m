@implementation PUPhotosGridSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotosGridSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PUPhotosGridSettings setDefaultItemSideSize:](self, "setDefaultItemSideSize:", 132.0);
  -[PUPhotosGridSettings setMaximumSpacing:](self, "setMaximumSpacing:", 20.0);
  -[PUPhotosGridSettings setBadgeAllItemsAsFavorites:](self, "setBadgeAllItemsAsFavorites:", 0);
  -[PUPhotosGridSettings setDisplayAllItemsAsBursts:](self, "setDisplayAllItemsAsBursts:", 0);
  -[PUPhotosGridSettings setAllowDynamicDetailsTitles:](self, "setAllowDynamicDetailsTitles:", 1);
  -[PUPhotosGridSettings setSimulatedDetailsAttributesLoadingDelay:](self, "setSimulatedDetailsAttributesLoadingDelay:", 0.0);
  -[PUPhotosGridSettings setForceJPEGThumbnailsInDefaultGrid:](self, "setForceJPEGThumbnailsInDefaultGrid:", 1);
  -[PUPhotosGridSettings setNumberColumnsInDefaultGrid:](self, "setNumberColumnsInDefaultGrid:", 4);
  -[PUPhotosGridSettings setNumberOfColumnsInWideGrid:](self, "setNumberOfColumnsInWideGrid:", 5);
  -[PUPhotosGridSettings setFlashDegradedImages:](self, "setFlashDegradedImages:", 0);
  -[PUPhotosGridSettings setUseFloatingHeaders:](self, "setUseFloatingHeaders:", 1);
  -[PUPhotosGridSettings setSwipeSelectionEnabled:](self, "setSwipeSelectionEnabled:", 1);
  -[PUPhotosGridSettings setPreviewRevealProgressToFreezeMagnifier:](self, "setPreviewRevealProgressToFreezeMagnifier:", 0.400000006);
  -[PUPhotosGridSettings setMagnifierRevealPreviewScale:](self, "setMagnifierRevealPreviewScale:", 1.75);
  -[PUPhotosGridSettings setMinimumDistanceToUnfreeze:](self, "setMinimumDistanceToUnfreeze:", 20.0);
  -[PUPhotosGridSettings setShouldExitEditingModeAfterDuplication:](self, "setShouldExitEditingModeAfterDuplication:", 1);
  -[PUPhotosGridSettings setShowTimelineScrubbers:](self, "setShowTimelineScrubbers:", 0);
  -[PUPhotosGridSettings setLeftScrubberRate:](self, "setLeftScrubberRate:", 10.0);
  -[PUPhotosGridSettings setRightScrubberRate:](self, "setRightScrubberRate:", 5.0);
  -[PUPhotosGridSettings setGlobalFooterVisibility:](self, "setGlobalFooterVisibility:", 0);
  -[PUPhotosGridSettings setSimulateGlobalFooterImportantInformationUpdates:](self, "setSimulateGlobalFooterImportantInformationUpdates:", 0);
}

- (void)setUseFloatingHeaders:(BOOL)a3
{
  self->_useFloatingHeaders = a3;
}

- (void)setSwipeSelectionEnabled:(BOOL)a3
{
  self->_swipeSelectionEnabled = a3;
}

- (void)setSimulatedDetailsAttributesLoadingDelay:(double)a3
{
  self->_simulatedDetailsAttributesLoadingDelay = a3;
}

- (void)setSimulateGlobalFooterImportantInformationUpdates:(BOOL)a3
{
  self->_simulateGlobalFooterImportantInformationUpdates = a3;
}

- (void)setShowTimelineScrubbers:(BOOL)a3
{
  self->_showTimelineScrubbers = a3;
}

- (void)setShouldExitEditingModeAfterDuplication:(BOOL)a3
{
  self->_shouldExitEditingModeAfterDuplication = a3;
}

- (void)setRightScrubberRate:(double)a3
{
  self->_rightScrubberRate = a3;
}

- (void)setPreviewRevealProgressToFreezeMagnifier:(double)a3
{
  self->_previewRevealProgressToFreezeMagnifier = a3;
}

- (void)setNumberOfColumnsInWideGrid:(int64_t)a3
{
  self->_numberOfColumnsInWideGrid = a3;
}

- (void)setNumberColumnsInDefaultGrid:(int64_t)a3
{
  self->_numberColumnsInDefaultGrid = a3;
}

- (void)setMinimumDistanceToUnfreeze:(double)a3
{
  self->_minimumDistanceToUnfreeze = a3;
}

- (void)setMaximumSpacing:(double)a3
{
  self->_maximumSpacing = a3;
}

- (void)setMagnifierRevealPreviewScale:(double)a3
{
  self->_magnifierRevealPreviewScale = a3;
}

- (void)setLeftScrubberRate:(double)a3
{
  self->_leftScrubberRate = a3;
}

- (void)setGlobalFooterVisibility:(int64_t)a3
{
  self->_globalFooterVisibility = a3;
}

- (void)setForceJPEGThumbnailsInDefaultGrid:(BOOL)a3
{
  self->_forceJPEGThumbnailsInDefaultGrid = a3;
}

- (void)setFlashDegradedImages:(BOOL)a3
{
  self->_flashDegradedImages = a3;
}

- (void)setDisplayAllItemsAsBursts:(BOOL)a3
{
  self->_displayAllItemsAsBursts = a3;
}

- (void)setDefaultItemSideSize:(double)a3
{
  self->_defaultItemSideSize = a3;
}

- (void)setBadgeAllItemsAsFavorites:(BOOL)a3
{
  self->_badgeAllItemsAsFavorites = a3;
}

- (void)setAllowDynamicDetailsTitles:(BOOL)a3
{
  self->_allowDynamicDetailsTitles = a3;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
}

- (double)defaultItemSideSize
{
  return self->_defaultItemSideSize;
}

- (double)maximumSpacing
{
  return self->_maximumSpacing;
}

- (BOOL)badgeAllItemsAsFavorites
{
  return self->_badgeAllItemsAsFavorites;
}

- (BOOL)displayAllItemsAsBursts
{
  return self->_displayAllItemsAsBursts;
}

- (BOOL)allowDynamicDetailsTitles
{
  return self->_allowDynamicDetailsTitles;
}

- (double)simulatedDetailsAttributesLoadingDelay
{
  return self->_simulatedDetailsAttributesLoadingDelay;
}

- (BOOL)forceJPEGThumbnailsInDefaultGrid
{
  return self->_forceJPEGThumbnailsInDefaultGrid;
}

- (int64_t)numberColumnsInDefaultGrid
{
  return self->_numberColumnsInDefaultGrid;
}

- (int64_t)numberOfColumnsInWideGrid
{
  return self->_numberOfColumnsInWideGrid;
}

- (BOOL)flashDegradedImages
{
  return self->_flashDegradedImages;
}

- (BOOL)useFloatingHeaders
{
  return self->_useFloatingHeaders;
}

- (BOOL)isSwipeSelectionEnabled
{
  return self->_swipeSelectionEnabled;
}

- (double)magnifierRevealPreviewScale
{
  return self->_magnifierRevealPreviewScale;
}

- (double)previewRevealProgressToFreezeMagnifier
{
  return self->_previewRevealProgressToFreezeMagnifier;
}

- (double)minimumDistanceToUnfreeze
{
  return self->_minimumDistanceToUnfreeze;
}

- (BOOL)shouldExitEditingModeAfterDuplication
{
  return self->_shouldExitEditingModeAfterDuplication;
}

- (BOOL)showTimelineScrubbers
{
  return self->_showTimelineScrubbers;
}

- (double)leftScrubberRate
{
  return self->_leftScrubberRate;
}

- (double)rightScrubberRate
{
  return self->_rightScrubberRate;
}

- (int64_t)globalFooterVisibility
{
  return self->_globalFooterVisibility;
}

- (BOOL)simulateGlobalFooterImportantInformationUpdates
{
  return self->_simulateGlobalFooterImportantInformationUpdates;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_70750 != -1)
    dispatch_once(&sharedInstance_onceToken_70750, &__block_literal_global_70751);
  return (id)sharedInstance_sharedInstance_70752;
}

+ (id)settingsControllerModule
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
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
  id v47;
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
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
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
  _QWORD v80[4];
  id v81;
  _QWORD v82[7];
  void *v83;
  void *v84;
  void *v85;
  _QWORD v86[3];
  _QWORD v87[3];
  _QWORD v88[2];
  _QWORD v89[14];

  v89[12] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhysicalScreenScale();
  v77 = (void *)MEMORY[0x1E0D83078];
  v5 = 1.0 / v4;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Swipe Selection"), CFSTR("swipeSelectionEnabled"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = v75;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Fake All Videos"), CFSTR("badgeAllItemsAsFavorites"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v89[1] = v73;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Fake All Bursts"), CFSTR("displayAllItemsAsBursts"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v89[2] = v71;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Allow Dynamic Details Titles"), CFSTR("allowDynamicDetailsTitles"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v89[3] = v69;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Fake Title/Subtitle Delay"), CFSTR("simulatedDetailsAttributesLoadingDelay"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "pu_possibleValues:", &unk_1E59BA5A0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "conditionFormat:", CFSTR("allowDynamicDetailsTitles != 0"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v89[4] = v64;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Flash Degraded Images"), CFSTR("flashDegradedImages"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v89[5] = v63;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Magnifier Reveal Preview Scale"), CFSTR("magnifierRevealPreviewScale"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "minValue:maxValue:", 0.0, 20.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "pu_increment:", 0.00999999978);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v89[6] = v60;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Freeze Magnifier at Reveal Progress"), CFSTR("previewRevealProgressToFreezeMagnifier"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "minValue:maxValue:", 0.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pu_increment:", 0.00999999978);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v89[7] = v7;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Unfreeze Minimum Distance"), CFSTR("minimumDistanceToUnfreeze"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue:maxValue:", 0.0, 500.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pu_increment:", 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v89[8] = v10;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Exit Selection After Duplication"), CFSTR("shouldExitEditingModeAfterDuplication"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v89[9] = v11;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Footer Visibility"), CFSTR("globalFooterVisibility"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "possibleValues:titles:", &unk_1E59BA5B8, &unk_1E59BA5D0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v89[10] = v13;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Simulate Footer Updates"), CFSTR("simulateGlobalFooterImportantInformationUpdates"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v89[11] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "sectionWithRows:title:", v15, CFSTR("Grid Settings"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("JPEG Thumbnails"), CFSTR("forceJPEGThumbnailsInDefaultGrid"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v17;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Columns"), CFSTR("numberColumnsInDefaultGrid"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "possibleValues:titles:", &unk_1E59BA5E8, &unk_1E59BA600);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v79);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionWithRows:title:condition:", v20, CFSTR("iPhone Grid"), v21);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Default Side Size"), CFSTR("defaultItemSideSize"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "minValue:maxValue:", 50.0, 200.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "pu_increment:", v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v25;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Maximum Spacing"), CFSTR("maximumSpacing"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "minValue:maxValue:", 0.0, 100.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "pu_increment:", v5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v28;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Columns at half size"), CFSTR("numberOfColumnsInWideGrid"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "possibleValues:titles:", &unk_1E59BA618, &unk_1E59BA630);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sectionWithRows:title:condition:", v31, CFSTR("iPad Grid Layout"), v79);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show scrubbers"), CFSTR("showTimelineScrubbers"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v33;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Left scrubber rate"), CFSTR("leftScrubberRate"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "minValue:maxValue:", 1.0, 50.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v35;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Right scrubber rate"), CFSTR("rightScrubberRate"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "minValue:maxValue:", 1.0, 50.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v86[2] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sectionWithRows:title:", v38, CFSTR("Timeline scrubbers"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Floating Headers"), CFSTR("useFloatingHeaders"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "sectionWithRows:title:", v41, CFSTR("Relaunch Photos After Changing These Settings"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = (void *)MEMORY[0x1E0D83078];
  v43 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "rowWithTitle:action:", CFSTR("Restore Defaults"), v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "sectionWithRows:", v46);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = objc_alloc(MEMORY[0x1E0D71BE0]);
  objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v47, "initWithPhotoLibrary:", v48);

  v50 = (void *)MEMORY[0x1E0D83078];
  v51 = (void *)MEMORY[0x1E0D83010];
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __48__PUPhotosGridSettings_settingsControllerModule__block_invoke;
  v80[3] = &unk_1E58A7F10;
  v81 = v49;
  v66 = v49;
  objc_msgSend(v51, "pu_rowWithTitle:output:", CFSTR("Localized Warnings"), v80);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v52;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "sectionWithRows:title:", v53, CFSTR("Debug"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = (void *)MEMORY[0x1E0D83078];
  v82[0] = v78;
  v82[1] = v76;
  v82[2] = v74;
  v82[3] = v72;
  v82[4] = v70;
  v82[5] = v68;
  v82[6] = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 7);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "moduleWithTitle:contents:", CFSTR("Photos Grid"), v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  return v57;
}

uint64_t __48__PUPhotosGridSettings_settingsControllerModule__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "allWarningMessageCombinations");
}

void __38__PUPhotosGridSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosGridSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_70752;
  sharedInstance_sharedInstance_70752 = v0;

}

@end
