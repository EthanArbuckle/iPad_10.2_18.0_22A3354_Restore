@implementation PXContentSyndicationSettings

+ (PXContentSyndicationSettings)sharedInstance
{
  if (sharedInstance_onceToken_206976 != -1)
    dispatch_once(&sharedInstance_onceToken_206976, &__block_literal_global_206977);
  return (PXContentSyndicationSettings *)(id)sharedInstance_sharedInstance_206978;
}

- (int64_t)dataSourceType
{
  return self->_dataSourceType;
}

- (BOOL)treatEveryAssetAsGuest
{
  return self->_treatEveryAssetAsGuest;
}

- (BOOL)enableFilteringCuratedGridsForContentSyndication
{
  return self->_enableFilteringCuratedGridsForContentSyndication;
}

- (BOOL)ignoreSocialLayerEnablement
{
  return self->_ignoreSocialLayerEnablement;
}

- (BOOL)contentSyndicationEnabled
{
  return self->_contentSyndicationEnabled;
}

- (BOOL)delayLoadingActualDataSourceUntilAfterLaunch
{
  return self->_delayLoadingActualDataSourceUntilAfterLaunch;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXContentSyndicationSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXContentSyndicationSettings setContentSyndicationEnabled:](self, "setContentSyndicationEnabled:", 1);
  -[PXContentSyndicationSettings setIgnoreSocialLayerEnablement:](self, "setIgnoreSocialLayerEnablement:", 0);
  -[PXContentSyndicationSettings setShowSidebarItemEvenIfNoSyndicatedContentAvailable:](self, "setShowSidebarItemEvenIfNoSyndicatedContentAvailable:", 0);
  -[PXContentSyndicationSettings setShouldMockChallengeQuestions:](self, "setShouldMockChallengeQuestions:", 0);
  -[PXContentSyndicationSettings setShowSyndicatedContentInLibrary:](self, "setShowSyndicatedContentInLibrary:", 1);
  -[PXContentSyndicationSettings setEnableFilteringCuratedGridsForContentSyndication:](self, "setEnableFilteringCuratedGridsForContentSyndication:", 0);
  -[PXContentSyndicationSettings setShowContentSyndicationInSystemPhotoLibraryOnly:](self, "setShowContentSyndicationInSystemPhotoLibraryOnly:", 1);
  -[PXContentSyndicationSettings setDataSourceType:](self, "setDataSourceType:", 0);
  -[PXContentSyndicationSettings setUseUserLibraryForSyndicatedAssets:](self, "setUseUserLibraryForSyndicatedAssets:", 0);
  -[PXContentSyndicationSettings setMaxNumberOfBatches:](self, "setMaxNumberOfBatches:", 50);
  -[PXContentSyndicationSettings setMaxNumberOfAssetsPerBatch:](self, "setMaxNumberOfAssetsPerBatch:", 50);
  -[PXContentSyndicationSettings setDelayLoadingActualDataSourceUntilAfterLaunch:](self, "setDelayLoadingActualDataSourceUntilAfterLaunch:", 1);
  -[PXContentSyndicationSettings setLoadVerySmallInitialBatchOfRecentCollections:](self, "setLoadVerySmallInitialBatchOfRecentCollections:", 1);
  -[PXContentSyndicationSettings setBlackOverlayForFirstThumbnail:](self, "setBlackOverlayForFirstThumbnail:", 0.0299999993);
  -[PXContentSyndicationSettings setBlackOverlayForSecondThumbnail:](self, "setBlackOverlayForSecondThumbnail:", 0.119999997);
  -[PXContentSyndicationSettings setBlackOverlayForThirdThumbnail:](self, "setBlackOverlayForThirdThumbnail:", 0.25);
  -[PXContentSyndicationSettings setItemCellBlurStyle:](self, "setItemCellBlurStyle:", 0);
  -[PXContentSyndicationSettings setShouldHorizontallyCenterAttributionViewInGrid:](self, "setShouldHorizontallyCenterAttributionViewInGrid:", 1);
  -[PXContentSyndicationSettings setAlwaysLeadingAlignAttributionViewOnRegularWidthPads:](self, "setAlwaysLeadingAlignAttributionViewOnRegularWidthPads:", 1);
  -[PXContentSyndicationSettings setShowSyndicatedContentWidgetForSavedAssets:](self, "setShowSyndicatedContentWidgetForSavedAssets:", 1);
  -[PXContentSyndicationSettings setShowSyndicatedContentWidgetForGuestAssets:](self, "setShowSyndicatedContentWidgetForGuestAssets:", 1);
  -[PXContentSyndicationSettings setShowSyndicated1upPillUI:](self, "setShowSyndicated1upPillUI:", 1);
  -[PXContentSyndicationSettings setSyndicated1upPillAlignment:](self, "setSyndicated1upPillAlignment:", 0);
  -[PXContentSyndicationSettings setSavedAssetViewVisibility:](self, "setSavedAssetViewVisibility:", 2);
  -[PXContentSyndicationSettings setNumberOfMinutesToShowPillUIAfterSaving:](self, "setNumberOfMinutesToShowPillUIAfterSaving:", 43200);
  -[PXContentSyndicationSettings setPreventActualSaveToLibraryBehavior:](self, "setPreventActualSaveToLibraryBehavior:", 0);
  -[PXContentSyndicationSettings setPreventActualRemoveSuggestionBehavior:](self, "setPreventActualRemoveSuggestionBehavior:", 0);
  -[PXContentSyndicationSettings setTreatEveryAssetAsGuest:](self, "setTreatEveryAssetAsGuest:", 0);
  -[PXContentSyndicationSettings setEnableStackAspectRatio:](self, "setEnableStackAspectRatio:", 0);
  -[PXContentSyndicationSettings setEnableStackSmartCrop:](self, "setEnableStackSmartCrop:", 0);
  -[PXContentSyndicationSettings setUseSystemLibraryForReview:](self, "setUseSystemLibraryForReview:", 0);
  -[PXContentSyndicationSettings setUseRandomStatusForReview:](self, "setUseRandomStatusForReview:", 0);
  -[PXContentSyndicationSettings setReviewScope:](self, "setReviewScope:", 1);
  -[PXContentSyndicationSettings setReviewProcessingValuesScope:](self, "setReviewProcessingValuesScope:", 32496);
  -[PXContentSyndicationSettings setMockNumberOfAssetsSaved:](self, "setMockNumberOfAssetsSaved:", 0);
  -[PXContentSyndicationSettings setFooterMockType:](self, "setFooterMockType:", 1);
  -[PXContentSyndicationSettings setWaitForAndLogAssetArrivalWhenSaving:](self, "setWaitForAndLogAssetArrivalWhenSaving:", 0);
}

- (void)setWaitForAndLogAssetArrivalWhenSaving:(BOOL)a3
{
  self->_waitForAndLogAssetArrivalWhenSaving = a3;
}

- (void)setUseUserLibraryForSyndicatedAssets:(BOOL)a3
{
  self->_useUserLibraryForSyndicatedAssets = a3;
}

- (void)setUseSystemLibraryForReview:(BOOL)a3
{
  self->_useSystemLibraryForReview = a3;
}

- (void)setUseRandomStatusForReview:(BOOL)a3
{
  self->_useRandomStatusForReview = a3;
}

- (void)setTreatEveryAssetAsGuest:(BOOL)a3
{
  self->_treatEveryAssetAsGuest = a3;
}

- (void)setSyndicated1upPillAlignment:(int64_t)a3
{
  self->_syndicated1upPillAlignment = a3;
}

- (void)setShowSyndicatedContentWidgetForSavedAssets:(BOOL)a3
{
  self->_showSyndicatedContentWidgetForSavedAssets = a3;
}

- (void)setShowSyndicatedContentWidgetForGuestAssets:(BOOL)a3
{
  self->_showSyndicatedContentWidgetForGuestAssets = a3;
}

- (void)setShowSyndicatedContentInLibrary:(BOOL)a3
{
  self->_showSyndicatedContentInLibrary = a3;
}

- (void)setShowSyndicated1upPillUI:(BOOL)a3
{
  self->_showSyndicated1upPillUI = a3;
}

- (void)setShowSidebarItemEvenIfNoSyndicatedContentAvailable:(BOOL)a3
{
  self->_showSidebarItemEvenIfNoSyndicatedContentAvailable = a3;
}

- (void)setShowContentSyndicationInSystemPhotoLibraryOnly:(BOOL)a3
{
  self->_showContentSyndicationInSystemPhotoLibraryOnly = a3;
}

- (void)setShouldMockChallengeQuestions:(BOOL)a3
{
  self->_shouldMockChallengeQuestions = a3;
}

- (void)setShouldHorizontallyCenterAttributionViewInGrid:(BOOL)a3
{
  self->_shouldHorizontallyCenterAttributionViewInGrid = a3;
}

- (void)setSavedAssetViewVisibility:(int64_t)a3
{
  self->_savedAssetViewVisibility = a3;
}

- (void)setReviewScope:(int64_t)a3
{
  self->_reviewScope = a3;
}

- (void)setReviewProcessingValuesScope:(unsigned __int16)a3
{
  self->_reviewProcessingValuesScope = a3;
}

- (void)setPreventActualSaveToLibraryBehavior:(BOOL)a3
{
  self->_preventActualSaveToLibraryBehavior = a3;
}

- (void)setPreventActualRemoveSuggestionBehavior:(BOOL)a3
{
  self->_preventActualRemoveSuggestionBehavior = a3;
}

- (void)setNumberOfMinutesToShowPillUIAfterSaving:(unint64_t)a3
{
  self->_numberOfMinutesToShowPillUIAfterSaving = a3;
}

- (void)setMockNumberOfAssetsSaved:(BOOL)a3
{
  self->_mockNumberOfAssetsSaved = a3;
}

- (void)setMaxNumberOfBatches:(unint64_t)a3
{
  self->_maxNumberOfBatches = a3;
}

- (void)setMaxNumberOfAssetsPerBatch:(unint64_t)a3
{
  self->_maxNumberOfAssetsPerBatch = a3;
}

- (void)setLoadVerySmallInitialBatchOfRecentCollections:(BOOL)a3
{
  self->_loadVerySmallInitialBatchOfRecentCollections = a3;
}

- (void)setItemCellBlurStyle:(int64_t)a3
{
  self->_itemCellBlurStyle = a3;
}

- (void)setIgnoreSocialLayerEnablement:(BOOL)a3
{
  self->_ignoreSocialLayerEnablement = a3;
}

- (void)setFooterMockType:(int64_t)a3
{
  self->_footerMockType = a3;
}

- (void)setEnableStackSmartCrop:(BOOL)a3
{
  self->_enableStackSmartCrop = a3;
}

- (void)setEnableStackAspectRatio:(BOOL)a3
{
  self->_enableStackAspectRatio = a3;
}

- (void)setEnableFilteringCuratedGridsForContentSyndication:(BOOL)a3
{
  self->_enableFilteringCuratedGridsForContentSyndication = a3;
}

- (void)setDelayLoadingActualDataSourceUntilAfterLaunch:(BOOL)a3
{
  self->_delayLoadingActualDataSourceUntilAfterLaunch = a3;
}

- (void)setDataSourceType:(int64_t)a3
{
  self->_dataSourceType = a3;
}

- (void)setContentSyndicationEnabled:(BOOL)a3
{
  self->_contentSyndicationEnabled = a3;
}

- (void)setBlackOverlayForThirdThumbnail:(double)a3
{
  self->_blackOverlayForThirdThumbnail = a3;
}

- (void)setBlackOverlayForSecondThumbnail:(double)a3
{
  self->_blackOverlayForSecondThumbnail = a3;
}

- (void)setBlackOverlayForFirstThumbnail:(double)a3
{
  self->_blackOverlayForFirstThumbnail = a3;
}

- (void)setAlwaysLeadingAlignAttributionViewOnRegularWidthPads:(BOOL)a3
{
  self->_alwaysLeadingAlignAttributionViewOnRegularWidthPads = a3;
}

void __46__PXContentSyndicationSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentSyndicationSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_206978;
  sharedInstance_sharedInstance_206978 = v0;

}

+ (id)settingsControllerModule
{
  int v2;
  void *v3;
  void *v4;
  __CFString *v5;
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
  uint64_t v20;
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
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  PXPhotoLibraryProcessingProgressRow *v107;
  void *v108;
  void *v109;
  PXPhotoLibraryProcessingProgressRow *v110;
  PXPhotoLibraryProcessingProgressRow **v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  id v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  __CFString *v185;
  void *v186;
  void *v187;
  void *v188;
  id v189;
  _QWORD v190[13];
  void *v191;
  _QWORD v192[2];
  void *v193;
  PXPhotoLibraryProcessingProgressRow *v194;
  PXPhotoLibraryProcessingProgressRow *v195;
  _QWORD v196[4];
  _QWORD v197[2];
  _QWORD v198[17];
  _QWORD v199[17];
  _QWORD v200[4];
  void *v201;
  _QWORD v202[8];
  _QWORD v203[2];
  _QWORD v204[4];
  _QWORD v205[7];

  v205[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0DA8880], "isEnabled");
  v187 = (void *)MEMORY[0x1E0D830B8];
  v3 = (void *)MEMORY[0x1E0D83010];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = CFSTR("NO");
  if (v2)
    v5 = CFSTR("YES");
  v185 = v5;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Messages->Shared With You on: %@"), v185);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_rowWithTitle:action:", v182, &__block_literal_global_52099);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v205[0] = v179;
  v6 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_contentSyndicationEnabled);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:valueKeyPath:", CFSTR("Syndication UI Enabled"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v205[1] = v8;
  v9 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_ignoreSocialLayerEnablement);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:valueKeyPath:", CFSTR("Ignore Shared With You enablement"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v205[2] = v11;
  v12 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showSyndicatedContentInLibrary);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:valueKeyPath:", CFSTR("Show Content in Library Tab"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "conditionFormat:", CFSTR("contentSyndicationEnabled != 0"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v205[3] = v15;
  v16 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableFilteringCuratedGridsForContentSyndication);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rowWithTitle:valueKeyPath:", CFSTR("Filter curated grids, if disabled"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v205[4] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v205, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "sectionWithRows:title:", v19, CFSTR("General"));
  v188 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXContentSyndicationSettings _createDataSourceSection](PXContentSyndicationSettings, "_createDataSourceSection");
  v20 = objc_claimAutoreleasedReturnValue();
  v183 = (void *)MEMORY[0x1E0D830B8];
  v186 = (void *)v20;
  v21 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_blackOverlayForFirstThumbnail);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rowWithTitle:valueKeyPath:", CFSTR("🔄 Img #1 dark %"), v180);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "minValue:maxValue:", 0.0, 1.0);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "px_increment:", 0.01);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v204[0] = v170;
  v22 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_blackOverlayForSecondThumbnail);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rowWithTitle:valueKeyPath:", CFSTR("🔄 Img #2 dark %"), v166);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "minValue:maxValue:", 0.0, 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "px_increment:", 0.01);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v204[1] = v24;
  v25 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_blackOverlayForThirdThumbnail);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rowWithTitle:valueKeyPath:", CFSTR("🔄 Img #3 dark %"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "minValue:maxValue:", 0.0, 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "px_increment:", 0.01);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v204[2] = v29;
  v30 = (void *)MEMORY[0x1E0D830B0];
  NSStringFromSelector(sel_itemCellBlurStyle);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "rowWithTitle:valueKeyPath:", CFSTR("🔄 Blur Style"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "possibleValues:titles:", &unk_1E53E8C40, &unk_1E53E8C58);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v204[3] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v204, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "sectionWithRows:title:conditionFormat:", v34, CFSTR("Syndication Cells"), CFSTR("contentSyndicationEnabled != 0"));
  v184 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1E0D830B8];
  v36 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_shouldHorizontallyCenterAttributionViewInGrid);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rowWithTitle:valueKeyPath:", CFSTR("Center micro-pill horizontally"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v203[0] = v38;
  v39 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_alwaysLeadingAlignAttributionViewOnRegularWidthPads);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "rowWithTitle:valueKeyPath:", CFSTR("iPad: Leading-align pill on regular widths"), v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v203[1] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v203, 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sectionWithRows:title:conditionFormat:", v42, CFSTR("Syndication Grids"), CFSTR("contentSyndicationEnabled != 0"));
  v181 = (void *)objc_claimAutoreleasedReturnValue();

  v177 = (void *)MEMORY[0x1E0D830B8];
  v43 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_showSyndicatedContentWidgetForSavedAssets);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "rowWithTitle:valueKeyPath:", CFSTR("Show 1up Widget for saved assets"), v174);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "conditionFormat:", CFSTR("contentSyndicationEnabled != 0"));
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v202[0] = v167;
  v44 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_showSyndicatedContentWidgetForGuestAssets);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "rowWithTitle:valueKeyPath:", CFSTR("Show 1up Widget for guest assets"), v163);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "conditionFormat:", CFSTR("contentSyndicationEnabled != 0"));
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v202[1] = v156;
  v45 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_showSyndicated1upPillUI);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "rowWithTitle:valueKeyPath:", CFSTR("Show 1up Pill UI"), v153);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "conditionFormat:", CFSTR("contentSyndicationEnabled != 0"));
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v202[2] = v148;
  v46 = (void *)MEMORY[0x1E0D830B0];
  NSStringFromSelector(sel_syndicated1upPillAlignment);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "rowWithTitle:valueKeyPath:", CFSTR("Pill Alignment"), v146);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "possibleValues:titles:", &unk_1E53E8C70, &unk_1E53E8C88);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v202[3] = v143;
  v47 = (void *)MEMORY[0x1E0D830B0];
  NSStringFromSelector(sel_savedAssetViewVisibility);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "rowWithTitle:valueKeyPath:", CFSTR("Show Pill UI for Saved Assets"), v142);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "possibleValues:titles:", &unk_1E53E8CA0, &unk_1E53E8CB8);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v202[4] = v140;
  v48 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_numberOfMinutesToShowPillUIAfterSaving);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "rowWithTitle:valueKeyPath:", CFSTR("# Mins After Save"), v139);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "minValue:maxValue:", 0.5, 30.0);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "px_increment:", 0.5);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "conditionFormat:", CFSTR("savedAssetViewVisibility = 2"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v202[5] = v50;
  v51 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_preventActualSaveToLibraryBehavior);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "rowWithTitle:valueKeyPath:", CFSTR("Prevent Actual Save to Library"), v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "conditionFormat:", CFSTR("contentSyndicationEnabled != 0"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v202[6] = v54;
  v55 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_preventActualRemoveSuggestionBehavior);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "rowWithTitle:valueKeyPath:", CFSTR("Prevent Actual Remove Suggestion"), v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "conditionFormat:", CFSTR("contentSyndicationEnabled != 0"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v202[7] = v58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v202, 8);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "sectionWithRows:title:conditionFormat:", v59, CFSTR("1up"), CFSTR("contentSyndicationEnabled != 0"));
  v178 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = (void *)MEMORY[0x1E0D830B8];
  v61 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_treatEveryAssetAsGuest);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "rowWithTitle:valueKeyPath:", CFSTR("Treat All Assets As Guest"), v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v201 = v63;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v201, 1);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "sectionWithRows:title:conditionFormat:", v64, CFSTR("Inline Guest Assets"), CFSTR("contentSyndicationEnabled != 0"));
  v175 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = (void *)MEMORY[0x1E0D830B8];
  v66 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useSystemLibraryForReview);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "rowWithTitle:valueKeyPath:", CFSTR("Use System Library"), v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v200[0] = v68;
  v69 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useRandomStatusForReview);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "rowWithTitle:valueKeyPath:", CFSTR("Use Random Status"), v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v200[1] = v71;
  v72 = (void *)MEMORY[0x1E0D830B0];
  NSStringFromSelector(sel_reviewScope);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "rowWithTitle:valueKeyPath:", CFSTR("Review UI Scope"), v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "possibleValues:titles:", &unk_1E53E8CD0, &unk_1E53E8CE8);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v200[2] = v75;
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Review All"), &__block_literal_global_272);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v200[3] = v76;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v200, 4);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "sectionWithRows:title:", v77, CFSTR("Review Syndicated Assets"));
  v172 = (void *)objc_claimAutoreleasedReturnValue();

  v198[0] = &unk_1E53EBDD8;
  v198[1] = &unk_1E53EBDF0;
  v199[0] = CFSTR("All Positives");
  v199[1] = CFSTR("All Negatives");
  v198[2] = &unk_1E53EBE08;
  PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v199[2] = v168;
  v198[3] = &unk_1E53EBE20;
  PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v199[3] = v164;
  v198[4] = &unk_1E53EBE38;
  PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v199[4] = v160;
  v198[5] = &unk_1E53EBE50;
  PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v199[5] = v157;
  v198[6] = &unk_1E53EBE68;
  PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v199[6] = v154;
  v198[7] = &unk_1E53EBE80;
  PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v199[7] = v151;
  v198[8] = &unk_1E53EBE98;
  PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v199[8] = v78;
  v198[9] = &unk_1E53EBEB0;
  PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v199[9] = v79;
  v198[10] = &unk_1E53EBEC8;
  PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v199[10] = v80;
  v198[11] = &unk_1E53EBEE0;
  PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v199[11] = v81;
  v198[12] = &unk_1E53EBEF8;
  PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v199[12] = v82;
  v198[13] = &unk_1E53EBF10;
  PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v199[13] = v83;
  v198[14] = &unk_1E53EBF28;
  PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v199[14] = v84;
  v198[15] = &unk_1E53EBF40;
  PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v199[15] = v85;
  v198[16] = &unk_1E53EBF58;
  PHAssetMediaAnalysisSyndicationProcessingValueDescription();
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v199[16] = v86;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v199, v198, 17);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  v88 = (void *)MEMORY[0x1E0D830B8];
  v89 = (void *)MEMORY[0x1E0D830B0];
  NSStringFromSelector(sel_reviewProcessingValuesScope);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "rowWithTitle:valueKeyPath:", CFSTR("Review UI Scope"), v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "allKeys");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = v87;
  objc_msgSend(v87, "allValues");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "possibleValues:titles:", v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v197[0] = v94;
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Review All"), &__block_literal_global_315);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v197[1] = v95;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v197, 2);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "sectionWithRows:title:", v96, CFSTR("Review Processing Values"));
  v165 = (void *)objc_claimAutoreleasedReturnValue();

  v97 = (void *)MEMORY[0x1E0D830B8];
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Generate Questions"), &__block_literal_global_344);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v196[0] = v98;
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Reset All Questions"), &__block_literal_global_346);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v196[1] = v99;
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Delete All Questions"), &__block_literal_global_348);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v196[2] = v100;
  v101 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_shouldMockChallengeQuestions);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "rowWithTitle:valueKeyPath:", CFSTR("Mock Questions"), v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "conditionFormat:", CFSTR("contentSyndicationEnabled != 0"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v196[3] = v104;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v196, 4);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "sectionWithRows:title:", v105, CFSTR("Challenge Questions"));
  v161 = (void *)objc_claimAutoreleasedReturnValue();

  v189 = 0;
  objc_msgSend(MEMORY[0x1E0CD16F8], "openPhotoLibraryWithWellKnownIdentifier:error:", 3, &v189);
  v106 = objc_claimAutoreleasedReturnValue();
  v155 = (void *)v106;
  v158 = v189;
  if (v106)
  {
    v107 = [PXPhotoLibraryProcessingProgressRow alloc];
    NSStringFromSelector(sel_libraryStateBriefDescription);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_libraryStateImage);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = -[PXPhotoLibraryProcessingProgressRow initWithPhotoLibrary:titleKeyPath:imageKeyPath:](v107, "initWithPhotoLibrary:titleKeyPath:imageKeyPath:", v106, v108, v109);

    v195 = v110;
    v111 = &v195;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D83010], "rowWithTitle:action:", CFSTR("No Syndication Library Available"), 0);
    v110 = (PXPhotoLibraryProcessingProgressRow *)objc_claimAutoreleasedReturnValue();
    v194 = v110;
    v111 = &v194;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 1);
  v152 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v152, CFSTR("Syndication Library Processing"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = (void *)MEMORY[0x1E0D83078];
  v113 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "rowWithTitle:action:", CFSTR("Restore Defaults"), v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = v115;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v193, 1);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "sectionWithRows:", v116);
  v149 = (void *)objc_claimAutoreleasedReturnValue();

  v117 = (void *)MEMORY[0x1E0D830B8];
  v118 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_mockNumberOfAssetsSaved);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "rowWithTitle:valueKeyPath:", CFSTR("Mock Number of Assets Saved"), v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v192[0] = v120;
  v121 = (void *)MEMORY[0x1E0D830B0];
  NSStringFromSelector(sel_footerMockType);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "rowWithTitle:valueKeyPath:", CFSTR("Number of Assets Saved"), v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "possibleValues:titles:", &unk_1E53E8D00, &unk_1E53E8D18);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "conditionFormat:", CFSTR("mockNumberOfAssetsSaved != 0"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v192[1] = v125;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v192, 2);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "sectionWithRows:title:conditionFormat:", v126, CFSTR("Footer"), CFSTR("contentSyndicationEnabled != 0"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();

  v127 = (void *)MEMORY[0x1E0D830B8];
  v128 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_waitForAndLogAssetArrivalWhenSaving);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "rowWithTitle:valueKeyPath:", CFSTR("Wait + Log asset arrival on save"), v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v191 = v130;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v191, 1);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "sectionWithRows:title:conditionFormat:", v131, CFSTR("Debugging"), CFSTR("contentSyndicationEnabled != 0"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  v133 = (void *)MEMORY[0x1E0D83078];
  v190[0] = v188;
  v190[1] = v147;
  v190[2] = v172;
  v190[3] = v165;
  v190[4] = v186;
  v190[5] = v184;
  v190[6] = v181;
  v190[7] = v178;
  v190[8] = v175;
  v190[9] = v161;
  v190[10] = v145;
  v190[11] = v132;
  v190[12] = v149;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v190, 13);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "moduleWithTitle:contents:", CFSTR("Content Syndication"), v134);
  v135 = (void *)objc_claimAutoreleasedReturnValue();

  return v135;
}

+ (id)_createDataSourceSection
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
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[7];

  v29[6] = *MEMORY[0x1E0C80C00];
  v22 = (id)MEMORY[0x1E0D830B8];
  v2 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_useUserLibraryForSyndicatedAssets);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:valueKeyPath:", CFSTR("🔄 User Library For Syndicated Assets"), v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v27;
  v3 = (void *)MEMORY[0x1E0D830B0];
  NSStringFromSelector(sel_dataSourceType);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Data Source Type"), v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "possibleValues:titles:", &unk_1E53E8D30, &unk_1E53E8D48);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v24;
  v4 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_maxNumberOfBatches);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("🔄 Max Batches"), v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "minValue:maxValue:", 1.0, 50.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "px_increment:", 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v5;
  v6 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_maxNumberOfAssetsPerBatch);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:valueKeyPath:", CFSTR("🔄 Max Assets Per Batch"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue:maxValue:", 1.0, 50.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "px_increment:", 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v10;
  v11 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_delayLoadingActualDataSourceUntilAfterLaunch);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rowWithTitle:valueKeyPath:", CFSTR("Perf: Delay data source manager at launch"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v13;
  v14 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_loadVerySmallInitialBatchOfRecentCollections);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rowWithTitle:valueKeyPath:", CFSTR("Perf: Load initial small batch"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sectionWithRows:title:conditionFormat:", v17, CFSTR("Shared With You"), CFSTR("contentSyndicationEnabled != 0"));
  v23 = (id)objc_claimAutoreleasedReturnValue();

  return v23;
}

void __60__PXContentSyndicationSettings_UI__settingsControllerModule__block_invoke_3_347(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v2 = a2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _DeleteAllQuestionsAction(UINavigationController *__strong)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXContentSyndicationSettings+UI.m"), 374, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("navigationController"));

  }
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _AllHubbleQuestionsForPhotoLibrary(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = ___DeleteAllQuestionsAction_block_invoke;
    v13[3] = &unk_1E5149198;
    v14 = v4;
    v12 = 0;
    v5 = objc_msgSend(v3, "performChangesAndWait:error:", v13, &v12);
    v6 = v12;
    v7 = v6;
    if ((v5 & 1) != 0)
    {
      v8 = CFSTR("Questions Deleted Successfully");
      v9 = CFSTR("Quit and re-launch Photos to update questions.");
    }
    else
    {
      objc_msgSend(v6, "localizedDescription");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("Failed to Delete Questions");
    }

  }
  else
  {
    v8 = CFSTR("Failed to Delete Questions");
    v9 = CFSTR("No questions available to delete.");
  }
  _PresentAlertForNavigationController(v8, v9, v2);

}

void __60__PXContentSyndicationSettings_UI__settingsControllerModule__block_invoke_2_345(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v2 = a2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _ResetAllQuestionsAction(UINavigationController *__strong)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXContentSyndicationSettings+UI.m"), 346, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("navigationController"));

  }
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _AllHubbleQuestionsForPhotoLibrary(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = ___ResetAllQuestionsAction_block_invoke;
    v13[3] = &unk_1E5149198;
    v14 = v4;
    v12 = 0;
    v5 = objc_msgSend(v3, "performChangesAndWait:error:", v13, &v12);
    v6 = v12;
    v7 = v6;
    if ((v5 & 1) != 0)
    {
      v8 = CFSTR("Questions Reset Successfully");
      v9 = CFSTR("Quit and re-launch Photos to update questions.");
    }
    else
    {
      objc_msgSend(v6, "localizedDescription");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("Failed to Reset Questions");
    }

  }
  else
  {
    v8 = CFSTR("Failed to Reset Questions");
    v9 = CFSTR("No questions available to reset.");
  }
  _PresentAlertForNavigationController(v8, v9, v2);

}

void __60__PXContentSyndicationSettings_UI__settingsControllerModule__block_invoke_343(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  NSObject *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0D721A8];
  v30[0] = *MEMORY[0x1E0D721E0];
  v30[1] = v3;
  v31[0] = &unk_1E53EBF70;
  v31[1] = &unk_1E53EBF88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__52185;
  v24 = __Block_byref_object_dispose__52186;
  v25 = 0;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = ___GenerateQuestionsAction_block_invoke;
  v16 = &unk_1E511DD58;
  v18 = &v26;
  v19 = &v20;
  v8 = v5;
  v17 = v8;
  objc_msgSend(v7, "requestGenerateQuestionsWithOptions:reply:", v4, &v13);

  v9 = dispatch_time(0, 300000000000);
  if (dispatch_group_wait(v8, v9))
  {
    v10 = CFSTR("Request timed out.");
  }
  else
  {
    if (*((_BYTE *)v27 + 24))
    {
      v10 = 0;
      v11 = CFSTR("Questions Generated Successfully");
      goto LABEL_6;
    }
    v12 = (void *)v21[5];
    if (v12)
    {
      objc_msgSend(v12, "localizedDescription", v13, v14, v15, v16);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = CFSTR("All available questions may have already been generated, or your syndication library may not have been processed yet.");
    }
  }
  v11 = CFSTR("Failed to Generate Questions");
LABEL_6:
  _PresentAlertForNavigationController(v11, v10, v2);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

}

void __60__PXContentSyndicationSettings_UI__settingsControllerModule__block_invoke_314(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v2 = a2;
  v7 = 0;
  PXContentSyndicationProcessingValuesReviewViewController((uint64_t)&v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v2, "pushViewController:animated:", v3, 1);
  }
  else
  {
    objc_msgSend(v4, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _PresentAlertForNavigationController(v6, 0, v2);

  }
}

void __60__PXContentSyndicationSettings_UI__settingsControllerModule__block_invoke_271(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v2 = a2;
  v7 = 0;
  PXContentSyndicationReviewViewController((uint64_t)&v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v2, "pushViewController:animated:", v3, 1);
  }
  else
  {
    objc_msgSend(v4, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _PresentAlertForNavigationController(v6, 0, v2);

  }
}

void __60__PXContentSyndicationSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Enable Shared With You"), CFSTR("Navigate to:\n\nSettings\n-> Messages\n-> Shared With You\n-> Photos\n-> ON"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAction:", v4);

  v5 = (void *)MEMORY[0x1E0DC3448];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__PXContentSyndicationSettings_UI__settingsControllerModule__block_invoke_2;
  v8[3] = &unk_1E5144530;
  v9 = v2;
  v6 = v2;
  objc_msgSend(v5, "actionWithTitle:style:handler:", CFSTR("Settings"), 0, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAction:", v7);

  objc_msgSend(v6, "presentViewController:animated:completion:", v3, 0, 0);
}

void __60__PXContentSyndicationSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __60__PXContentSyndicationSettings_UI__settingsControllerModule__block_invoke_3;
  v1[3] = &unk_1E5148B78;
  v2 = *(id *)(a1 + 32);
  +[PXSystemNavigation navigateToDestination:completion:](PXSystemNavigation, "navigateToDestination:completion:", 1, v1);

}

void __60__PXContentSyndicationSettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v4;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(a3, "localizedDescription");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    _PresentAlertForNavigationController(CFSTR("Failed to Open Settings"), v4, *(void **)(a1 + 32));

  }
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)showSidebarItemEvenIfNoSyndicatedContentAvailable
{
  return self->_showSidebarItemEvenIfNoSyndicatedContentAvailable;
}

- (BOOL)shouldMockChallengeQuestions
{
  return self->_shouldMockChallengeQuestions;
}

- (BOOL)showSyndicatedContentInLibrary
{
  return self->_showSyndicatedContentInLibrary;
}

- (BOOL)showContentSyndicationInSystemPhotoLibraryOnly
{
  return self->_showContentSyndicationInSystemPhotoLibraryOnly;
}

- (BOOL)useUserLibraryForSyndicatedAssets
{
  return self->_useUserLibraryForSyndicatedAssets;
}

- (unint64_t)maxNumberOfBatches
{
  return self->_maxNumberOfBatches;
}

- (unint64_t)maxNumberOfAssetsPerBatch
{
  return self->_maxNumberOfAssetsPerBatch;
}

- (BOOL)loadVerySmallInitialBatchOfRecentCollections
{
  return self->_loadVerySmallInitialBatchOfRecentCollections;
}

- (double)blackOverlayForFirstThumbnail
{
  return self->_blackOverlayForFirstThumbnail;
}

- (double)blackOverlayForSecondThumbnail
{
  return self->_blackOverlayForSecondThumbnail;
}

- (double)blackOverlayForThirdThumbnail
{
  return self->_blackOverlayForThirdThumbnail;
}

- (int64_t)itemCellBlurStyle
{
  return self->_itemCellBlurStyle;
}

- (BOOL)shouldHorizontallyCenterAttributionViewInGrid
{
  return self->_shouldHorizontallyCenterAttributionViewInGrid;
}

- (BOOL)alwaysLeadingAlignAttributionViewOnRegularWidthPads
{
  return self->_alwaysLeadingAlignAttributionViewOnRegularWidthPads;
}

- (BOOL)showSyndicatedContentWidgetForSavedAssets
{
  return self->_showSyndicatedContentWidgetForSavedAssets;
}

- (BOOL)showSyndicatedContentWidgetForGuestAssets
{
  return self->_showSyndicatedContentWidgetForGuestAssets;
}

- (BOOL)showSyndicated1upPillUI
{
  return self->_showSyndicated1upPillUI;
}

- (int64_t)syndicated1upPillAlignment
{
  return self->_syndicated1upPillAlignment;
}

- (int64_t)savedAssetViewVisibility
{
  return self->_savedAssetViewVisibility;
}

- (unint64_t)numberOfMinutesToShowPillUIAfterSaving
{
  return self->_numberOfMinutesToShowPillUIAfterSaving;
}

- (BOOL)preventActualSaveToLibraryBehavior
{
  return self->_preventActualSaveToLibraryBehavior;
}

- (BOOL)preventActualRemoveSuggestionBehavior
{
  return self->_preventActualRemoveSuggestionBehavior;
}

- (BOOL)enableStackAspectRatio
{
  return self->_enableStackAspectRatio;
}

- (BOOL)enableStackSmartCrop
{
  return self->_enableStackSmartCrop;
}

- (BOOL)useSystemLibraryForReview
{
  return self->_useSystemLibraryForReview;
}

- (BOOL)useRandomStatusForReview
{
  return self->_useRandomStatusForReview;
}

- (int64_t)reviewScope
{
  return self->_reviewScope;
}

- (unsigned)reviewProcessingValuesScope
{
  return self->_reviewProcessingValuesScope;
}

- (BOOL)mockNumberOfAssetsSaved
{
  return self->_mockNumberOfAssetsSaved;
}

- (int64_t)footerMockType
{
  return self->_footerMockType;
}

- (BOOL)waitForAndLogAssetArrivalWhenSaving
{
  return self->_waitForAndLogAssetArrivalWhenSaving;
}

- (NSString)libraryStateBriefDescription
{
  return self->_libraryStateBriefDescription;
}

- (void)setLibraryStateBriefDescription:(id)a3
{
  objc_storeStrong((id *)&self->_libraryStateBriefDescription, a3);
}

- (UIImage)libraryStateImage
{
  return self->_libraryStateImage;
}

- (void)setLibraryStateImage:(id)a3
{
  objc_storeStrong((id *)&self->_libraryStateImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryStateImage, 0);
  objc_storeStrong((id *)&self->_libraryStateBriefDescription, 0);
}

@end
