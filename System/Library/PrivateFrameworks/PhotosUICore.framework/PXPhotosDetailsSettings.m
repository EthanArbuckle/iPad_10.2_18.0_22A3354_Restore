@implementation PXPhotosDetailsSettings

+ (PXPhotosDetailsSettings)sharedInstance
{
  if (sharedInstance_onceToken_217083 != -1)
    dispatch_once(&sharedInstance_onceToken_217083, &__block_literal_global_217084);
  return (PXPhotosDetailsSettings *)(id)sharedInstance_sharedInstance_217085;
}

- (PXAssetBadgeInfo)debugBadgeInfo
{
  __int128 v4;
  PXAssetBadgeInfo *result;
  __int128 v6;
  __int128 v7;

  v4 = *((_OWORD *)off_1E50B7E20 + 1);
  *(_OWORD *)&retstr->badges = *(_OWORD *)off_1E50B7E20;
  *(_OWORD *)&retstr->count = v4;
  result = -[PXPhotosDetailsSettings debugBadgeInfoType](self, "debugBadgeInfoType");
  if (result == (PXAssetBadgeInfo *)2)
  {
    result = (PXAssetBadgeInfo *)PXAssetBadgeInfoCreateWithBadges();
  }
  else
  {
    if (result != (PXAssetBadgeInfo *)1)
      return result;
    result = (PXAssetBadgeInfo *)PXAssetBadgeInfoCreateWithDuration();
  }
  *(_OWORD *)&retstr->badges = v6;
  *(_OWORD *)&retstr->count = v7;
  return result;
}

- (int64_t)debugBadgeInfoType
{
  return self->_debugBadgeInfoType;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDetailsSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXPhotosDetailsSettings setDefaultCurationAlgorithm:](self, "setDefaultCurationAlgorithm:", 0);
  -[PXPhotosDetailsSettings setDetailsViewCurationAlgorithm:](self, "setDetailsViewCurationAlgorithm:", 1);
  -[PXPhotosDetailsSettings setEnableFetchResultCaching:](self, "setEnableFetchResultCaching:", 1);
  -[PXPhotosDetailsSettings setShowHeaderWidget:](self, "setShowHeaderWidget:", 1);
  -[PXPhotosDetailsSettings setShowAssetsWidget:](self, "setShowAssetsWidget:", 1);
  -[PXPhotosDetailsSettings setShowCaptionHashtagsWidget:](self, "setShowCaptionHashtagsWidget:", 1);
  -[PXPhotosDetailsSettings setMapWidgetAllowCopyPasteLocation:](self, "setMapWidgetAllowCopyPasteLocation:", 1);
  -[PXPhotosDetailsSettings setShowTimeWidget:](self, "setShowTimeWidget:", 1);
  -[PXPhotosDetailsSettings setShowEXIFWidget:](self, "setShowEXIFWidget:", 1);
  -[PXPhotosDetailsSettings setShowAlbumAttributionWidget:](self, "setShowAlbumAttributionWidget:", 1);
  -[PXPhotosDetailsSettings setShowAssetDescriptionWidget:](self, "setShowAssetDescriptionWidget:", 0);
  -[PXPhotosDetailsSettings setShowAssetRichDescription:](self, "setShowAssetRichDescription:", 0);
  -[PXPhotosDetailsSettings setShowAppAttributionWidget:](self, "setShowAppAttributionWidget:", 1);
  -[PXPhotosDetailsSettings setShowVisualLookUpWidget:](self, "setShowVisualLookUpWidget:", 1);
  -[PXPhotosDetailsSettings setFormattedLensStringsEnabled:](self, "setFormattedLensStringsEnabled:", 1);
  -[PXPhotosDetailsSettings setShowDemoTilingViewWidget:](self, "setShowDemoTilingViewWidget:", 1);
  -[PXPhotosDetailsSettings setShowDemoViewWidget:](self, "setShowDemoViewWidget:", 1);
  -[PXPhotosDetailsSettings setShowDemoDynamicWidget:](self, "setShowDemoDynamicWidget:", 0);
  -[PXPhotosDetailsSettings setShowActionableLivePhotosBadge:](self, "setShowActionableLivePhotosBadge:", 1);
  -[PXPhotosDetailsSettings setShowPlacesWidget:](self, "setShowPlacesWidget:", 1);
  -[PXPhotosDetailsSettings setShowRelatedPeopleWidget:](self, "setShowRelatedPeopleWidget:", 1);
  -[PXPhotosDetailsSettings setShowSharedLibraryWidget:](self, "setShowSharedLibraryWidget:", 1);
  -[PXPhotosDetailsSettings setShowActionsWidget:](self, "setShowActionsWidget:", 1);
  -[PXPhotosDetailsSettings setShowPeopleInlineCandidateWidget:](self, "setShowPeopleInlineCandidateWidget:", 1);
  -[PXPhotosDetailsSettings setShowFacesAreaRect:](self, "setShowFacesAreaRect:", 0);
  -[PXPhotosDetailsSettings setAllowWidgetsContentLoading:](self, "setAllowWidgetsContentLoading:", 1);
  -[PXPhotosDetailsSettings setLoadAllWidgetsContentAfterDelay:](self, "setLoadAllWidgetsContentAfterDelay:", 1);
  -[PXPhotosDetailsSettings setLoadAllWidgetsContentOnScroll:](self, "setLoadAllWidgetsContentOnScroll:", 1);
  -[PXPhotosDetailsSettings setDefaultPriorityWidgetsLoadingDelay:](self, "setDefaultPriorityWidgetsLoadingDelay:", 0.2);
  -[PXPhotosDetailsSettings setAllowMultiColumnLayout:](self, "setAllowMultiColumnLayout:", 0);
  -[PXPhotosDetailsSettings setAllowsTopTrailingSelectCancelButton:](self, "setAllowsTopTrailingSelectCancelButton:", 1);
  -[PXPhotosDetailsSettings setPurgeOnMemoryWarning:](self, "setPurgeOnMemoryWarning:", 1);
  -[PXPhotosDetailsSettings setDetailViewsToKeepLoaded:](self, "setDetailViewsToKeepLoaded:", 4);
  -[PXPhotosDetailsSettings setUseCuratedLibraryLayout:](self, "setUseCuratedLibraryLayout:", 1);
  -[PXPhotosDetailsSettings setAllowItemReorderingInCuratedLayout:](self, "setAllowItemReorderingInCuratedLayout:", 0);
  -[PXPhotosDetailsSettings setEditorialLayoutEdit:](self, "setEditorialLayoutEdit:", 0);
  -[PXPhotosDetailsSettings setEditorialLayoutColumns:](self, "setEditorialLayoutColumns:", 3);
  -[PXPhotosDetailsSettings setEditorialLayoutAvoidSmallestTile:](self, "setEditorialLayoutAvoidSmallestTile:", 1);
  -[PXPhotosDetailsSettings setEditorialLayoutTargetRowsForChunk:](self, "setEditorialLayoutTargetRowsForChunk:", 4);
  -[PXPhotosDetailsSettings setEditorialLayoutActivityFeedItemCountThreshold:](self, "setEditorialLayoutActivityFeedItemCountThreshold:", 6);
  -[PXPhotosDetailsSettings setAssetsWidgetPlaceholderAspectRatio:](self, "setAssetsWidgetPlaceholderAspectRatio:", 0.75);
  -[PXPhotosDetailsSettings setAllowEditorialLayoutStressTest:](self, "setAllowEditorialLayoutStressTest:", 0);
  -[PXPhotosDetailsSettings setDebugBadgeInfoType:](self, "setDebugBadgeInfoType:", 0);
  -[PXPhotosDetailsSettings setCaptionWidgetEnableHashtags:](self, "setCaptionWidgetEnableHashtags:", 0);
  -[PXPhotosDetailsSettings setCaptionWidgetEnableVScrollingInEdit:](self, "setCaptionWidgetEnableVScrollingInEdit:", 0);
  -[PXPhotosDetailsSettings setCaptionWidgetEnableFadeInEffect:](self, "setCaptionWidgetEnableFadeInEffect:", 0);
  -[PXPhotosDetailsSettings setCaptionWidgetFadeInDuration:](self, "setCaptionWidgetFadeInDuration:", 0.45);
  -[PXPhotosDetailsSettings setCaptionWidgetEnableDirectAttachToMaster:](self, "setCaptionWidgetEnableDirectAttachToMaster:", 0);
  -[PXPhotosDetailsSettings setPlacesWidgetShowOnlyPlaceholder:](self, "setPlacesWidgetShowOnlyPlaceholder:", 0);
  -[PXPhotosDetailsSettings setShowLookUpWidgetSearchIcon:](self, "setShowLookUpWidgetSearchIcon:", 0);
  -[PXPhotosDetailsSettings setPeopleWidgetMaximumNumberOfPeople:](self, "setPeopleWidgetMaximumNumberOfPeople:", 0);
  -[PXPhotosDetailsSettings setPeopleWidgetDisableSocialGroup:](self, "setPeopleWidgetDisableSocialGroup:", 0);
  -[PXPhotosDetailsSettings setAddToTabSimulate:](self, "setAddToTabSimulate:", 0);
  -[PXPhotosDetailsSettings setAddToTabOpacity:](self, "setAddToTabOpacity:", 0.8);
  -[PXPhotosDetailsSettings setAddToTabDuration:](self, "setAddToTabDuration:", 0.5);
  -[PXPhotosDetailsSettings setAddToTabTranslationDelay:](self, "setAddToTabTranslationDelay:", 0.0);
  -[PXPhotosDetailsSettings setAddToTabScaleDelay:](self, "setAddToTabScaleDelay:", 0.0);
  -[PXPhotosDetailsSettings setAddToTabRotationDelay:](self, "setAddToTabRotationDelay:", 0.0);
  -[PXPhotosDetailsSettings setAddToTabFadeOutDelay:](self, "setAddToTabFadeOutDelay:", 0.75);
  -[PXPhotosDetailsSettings setAddToTabEndRotation:](self, "setAddToTabEndRotation:", 20.0);
  -[PXPhotosDetailsSettings setDraggableInfoPanelEnabled:](self, "setDraggableInfoPanelEnabled:", 1);
}

- (void)setUseCuratedLibraryLayout:(BOOL)a3
{
  self->_useCuratedLibraryLayout = a3;
}

- (void)setShowVisualLookUpWidget:(BOOL)a3
{
  self->_showVisualLookUpWidget = a3;
}

- (void)setShowTimeWidget:(BOOL)a3
{
  self->_showTimeWidget = a3;
}

- (void)setShowSharedLibraryWidget:(BOOL)a3
{
  self->_showSharedLibraryWidget = a3;
}

- (void)setShowRelatedPeopleWidget:(BOOL)a3
{
  self->_showRelatedPeopleWidget = a3;
}

- (void)setShowPlacesWidget:(BOOL)a3
{
  self->_showPlacesWidget = a3;
}

- (void)setShowPeopleInlineCandidateWidget:(BOOL)a3
{
  self->_showPeopleInlineCandidateWidget = a3;
}

- (void)setShowLookUpWidgetSearchIcon:(BOOL)a3
{
  self->_showLookUpWidgetSearchIcon = a3;
}

- (void)setShowHeaderWidget:(BOOL)a3
{
  self->_showHeaderWidget = a3;
}

- (void)setShowFacesAreaRect:(BOOL)a3
{
  self->_showFacesAreaRect = a3;
}

- (void)setShowEXIFWidget:(BOOL)a3
{
  self->_showEXIFWidget = a3;
}

- (void)setShowDemoViewWidget:(BOOL)a3
{
  self->_showDemoViewWidget = a3;
}

- (void)setShowDemoTilingViewWidget:(BOOL)a3
{
  self->_showDemoTilingViewWidget = a3;
}

- (void)setShowDemoDynamicWidget:(BOOL)a3
{
  self->_showDemoDynamicWidget = a3;
}

- (void)setShowCaptionHashtagsWidget:(BOOL)a3
{
  self->_showCaptionHashtagsWidget = a3;
}

- (void)setShowAssetsWidget:(BOOL)a3
{
  self->_showAssetsWidget = a3;
}

- (void)setShowAppAttributionWidget:(BOOL)a3
{
  self->_showAppAttributionWidget = a3;
}

- (void)setShowActionsWidget:(BOOL)a3
{
  self->_showActionsWidget = a3;
}

- (void)setShowActionableLivePhotosBadge:(BOOL)a3
{
  self->_showActionableLivePhotosBadge = a3;
}

- (void)setPurgeOnMemoryWarning:(BOOL)a3
{
  self->_purgeOnMemoryWarning = a3;
}

- (void)setPlacesWidgetShowOnlyPlaceholder:(BOOL)a3
{
  self->_placesWidgetShowOnlyPlaceholder = a3;
}

- (void)setPeopleWidgetMaximumNumberOfPeople:(int64_t)a3
{
  self->_peopleWidgetMaximumNumberOfPeople = a3;
}

- (void)setPeopleWidgetDisableSocialGroup:(BOOL)a3
{
  self->_peopleWidgetDisableSocialGroup = a3;
}

- (void)setMapWidgetAllowCopyPasteLocation:(BOOL)a3
{
  self->_mapWidgetAllowCopyPasteLocation = a3;
}

- (void)setLoadAllWidgetsContentOnScroll:(BOOL)a3
{
  self->_loadAllWidgetsContentOnScroll = a3;
}

- (void)setLoadAllWidgetsContentAfterDelay:(BOOL)a3
{
  self->_loadAllWidgetsContentAfterDelay = a3;
}

- (void)setFormattedLensStringsEnabled:(BOOL)a3
{
  self->_formattedLensStringsEnabled = a3;
}

- (void)setEditorialLayoutTargetRowsForChunk:(int64_t)a3
{
  self->_editorialLayoutTargetRowsForChunk = a3;
}

- (void)setEditorialLayoutEdit:(BOOL)a3
{
  self->_editorialLayoutEdit = a3;
}

- (void)setEditorialLayoutColumns:(int64_t)a3
{
  self->_editorialLayoutColumns = a3;
}

- (void)setEditorialLayoutAvoidSmallestTile:(BOOL)a3
{
  self->_editorialLayoutAvoidSmallestTile = a3;
}

- (void)setEditorialLayoutActivityFeedItemCountThreshold:(int64_t)a3
{
  self->_editorialLayoutActivityFeedItemCountThreshold = a3;
}

- (void)setDraggableInfoPanelEnabled:(BOOL)a3
{
  self->_draggableInfoPanelEnabled = a3;
}

- (void)setDetailViewsToKeepLoaded:(int64_t)a3
{
  self->_detailViewsToKeepLoaded = a3;
}

- (void)setDefaultPriorityWidgetsLoadingDelay:(double)a3
{
  self->_defaultPriorityWidgetsLoadingDelay = a3;
}

- (void)setDebugBadgeInfoType:(int64_t)a3
{
  self->_debugBadgeInfoType = a3;
}

- (void)setCaptionWidgetFadeInDuration:(double)a3
{
  self->_captionWidgetFadeInDuration = a3;
}

- (void)setCaptionWidgetEnableVScrollingInEdit:(BOOL)a3
{
  self->_captionWidgetEnableVScrollingInEdit = a3;
}

- (void)setCaptionWidgetEnableHashtags:(BOOL)a3
{
  self->_captionWidgetEnableHashtags = a3;
}

- (void)setCaptionWidgetEnableFadeInEffect:(BOOL)a3
{
  self->_captionWidgetEnableFadeInEffect = a3;
}

- (void)setCaptionWidgetEnableDirectAttachToMaster:(BOOL)a3
{
  self->_captionWidgetEnableDirectAttachToMaster = a3;
}

- (void)setAssetsWidgetPlaceholderAspectRatio:(double)a3
{
  self->_assetsWidgetPlaceholderAspectRatio = a3;
}

- (void)setAllowsTopTrailingSelectCancelButton:(BOOL)a3
{
  self->_allowsTopTrailingSelectCancelButton = a3;
}

- (void)setAllowWidgetsContentLoading:(BOOL)a3
{
  self->_allowWidgetsContentLoading = a3;
}

- (void)setAllowMultiColumnLayout:(BOOL)a3
{
  self->_allowMultiColumnLayout = a3;
}

- (void)setAllowItemReorderingInCuratedLayout:(BOOL)a3
{
  self->_allowItemReorderingInCuratedLayout = a3;
}

- (void)setAllowEditorialLayoutStressTest:(BOOL)a3
{
  self->_allowEditorialLayoutStressTest = a3;
}

- (void)setAddToTabTranslationDelay:(double)a3
{
  self->_addToTabTranslationDelay = a3;
}

- (void)setAddToTabSimulate:(BOOL)a3
{
  self->_addToTabSimulate = a3;
}

- (void)setAddToTabScaleDelay:(double)a3
{
  self->_addToTabScaleDelay = a3;
}

- (void)setAddToTabRotationDelay:(double)a3
{
  self->_addToTabRotationDelay = a3;
}

- (void)setAddToTabOpacity:(double)a3
{
  self->_addToTabOpacity = a3;
}

- (void)setAddToTabFadeOutDelay:(double)a3
{
  self->_addToTabFadeOutDelay = a3;
}

- (void)setAddToTabEndRotation:(double)a3
{
  self->_addToTabEndRotation = a3;
}

- (void)setAddToTabDuration:(double)a3
{
  self->_addToTabDuration = a3;
}

void __41__PXPhotosDetailsSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosDetails");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_217085;
  sharedInstance_sharedInstance_217085 = v0;

}

+ (id)settingsControllerModule
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
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
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
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
  void *v136;
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
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
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
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  id v260;
  char *aSelector;
  void *v262;
  void *v263;
  void *v264;
  _QWORD v265[4];
  id v266;
  id v267;
  _QWORD v268[4];
  id v269;
  _QWORD v270[11];
  _QWORD v271[5];
  void *v272;
  void *v273;
  _QWORD v274[2];
  _QWORD v275[10];
  _QWORD v276[6];
  _QWORD v277[8];
  _QWORD v278[17];
  _QWORD v279[10];
  _QWORD v280[3];

  v280[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D83078];
  v5 = (void *)MEMORY[0x1E0D83010];
  v6 = MEMORY[0x1E0C809B0];
  v268[0] = MEMORY[0x1E0C809B0];
  v268[1] = 3221225472;
  v268[2] = __55__PXPhotosDetailsSettings_UI__settingsControllerModule__block_invoke;
  v268[3] = &unk_1E512E798;
  v7 = v3;
  v269 = v7;
  objc_msgSend(v5, "px_rowWithTitle:action:", CFSTR("Test Photos Details"), v268);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v280[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v280, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:", v9);
  v264 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = &unk_1E53E99A8;
  v262 = (void *)MEMORY[0x1E0D83078];
  v11 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_defaultCurationAlgorithm);
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rowWithTitle:valueKeyPath:", CFSTR("Default Curation"), v256);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v251, "px_possibleValues:formatter:", &unk_1E53E99A8, &__block_literal_global_152338);
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  v279[0] = v245;
  v12 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_detailsViewCurationAlgorithm);
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:valueKeyPath:", CFSTR("Details View Curation"), v239);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v233, "px_possibleValues:formatter:", &unk_1E53E99A8, &__block_literal_global_152338);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  v279[1] = v227;
  v13 = (void *)MEMORY[0x1E0D83010];
  v14 = (void *)MEMORY[0x1E0D830A0];
  v265[0] = v6;
  v265[1] = 3221225472;
  v265[2] = __55__PXPhotosDetailsSettings_UI__settingsControllerModule__block_invoke_3;
  v265[3] = &unk_1E5141048;
  v266 = v7;
  v267 = a1;
  v260 = v7;
  objc_msgSend(v14, "actionWithHandler:", v265);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:action:", CFSTR("Fill Library with Fake Assets"), v221);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_detailsViewCurationAlgorithm);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicateWithFormat:", CFSTR("%K == %d"), v215, 2);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v209, "condition:", v203);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v279[2] = v197;
  v16 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableFetchResultCaching);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rowWithTitle:valueKeyPath:", CFSTR("Fetch Result Caching"), v191);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v279[3] = v187;
  v17 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showActionsWidget);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:valueKeyPath:", CFSTR("Actions Widget"), v183);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v279[4] = v179;
  v18 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowMultiColumnLayout);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rowWithTitle:valueKeyPath:", CFSTR("Multi Column Layout"), v175);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v279[5] = v19;
  v20 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowsTopTrailingSelectCancelButton);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rowWithTitle:valueKeyPath:", CFSTR("Top Select/Cancel"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v279[6] = v22;
  v23 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showFacesAreaRect);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "rowWithTitle:valueKeyPath:", CFSTR("Show Faces Area Rect"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v279[7] = v25;
  v26 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_draggableInfoPanelEnabled);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rowWithTitle:valueKeyPath:", CFSTR("Draggable Info Panel"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v279[8] = v28;
  v29 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_formattedLensStringsEnabled);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "rowWithTitle:valueKeyPath:", CFSTR("Formatted Lens Strings"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v279[9] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v279, 10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v262, "sectionWithRows:title:", v32, CFSTR("Settings"));
  v263 = (void *)objc_claimAutoreleasedReturnValue();

  v192 = (void *)MEMORY[0x1E0D83078];
  v33 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showVisualLookUpWidget);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rowWithTitle:valueKeyPath:", CFSTR("Visual Lookup Widget"), v257);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  v278[0] = v252;
  v34 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showAlbumAttributionWidget);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "rowWithTitle:valueKeyPath:", CFSTR("Album Attribution Widget"), v246);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  v278[1] = v240;
  v35 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showAppAttributionWidget);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "rowWithTitle:valueKeyPath:", CFSTR("Saved From Apps Widget"), v234);
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  v278[2] = v228;
  v36 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showTimeWidget);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rowWithTitle:valueKeyPath:", CFSTR("Date & Time Widget"), v222);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v278[3] = v216;
  v37 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showEXIFWidget);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "rowWithTitle:valueKeyPath:", CFSTR("EXIF Widget"), v210);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  v278[4] = v204;
  v38 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showAssetDescriptionWidget);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "rowWithTitle:valueKeyPath:", CFSTR("Asset Description Widget"), v198);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v278[5] = v188;
  v39 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showAssetRichDescription);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "rowWithTitle:valueKeyPath:", CFSTR("Asset Rich Description"), v184);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v278[6] = v180;
  v40 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showHeaderWidget);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "rowWithTitle:valueKeyPath:", CFSTR("Header Widget"), v176);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v278[7] = v172;
  v41 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showAssetsWidget);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "rowWithTitle:valueKeyPath:", CFSTR("Assets Widget"), v169);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v278[8] = v166;
  v42 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showCaptionHashtagsWidget);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "rowWithTitle:valueKeyPath:", CFSTR("Caption&Hashtags Widget"), v163);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v278[9] = v160;
  v43 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showDemoTilingViewWidget);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "rowWithTitle:valueKeyPath:", CFSTR("Demo Tiling View Widget"), v158);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v278[10] = v157;
  v44 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showDemoViewWidget);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "rowWithTitle:valueKeyPath:", CFSTR("Demo View Widget"), v156);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v278[11] = v155;
  v45 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showDemoDynamicWidget);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "rowWithTitle:valueKeyPath:", CFSTR("Demo Dynamic Widget"), v154);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v278[12] = v46;
  v47 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showPlacesWidget);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "rowWithTitle:valueKeyPath:", CFSTR("Places Widget"), v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v278[13] = v49;
  v50 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showRelatedPeopleWidget);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "rowWithTitle:valueKeyPath:", CFSTR("People Widget"), v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v278[14] = v52;
  v53 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showSharedLibraryWidget);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "rowWithTitle:valueKeyPath:", CFSTR("Shared Library Widget"), v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v278[15] = v55;
  v56 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showActionsWidget);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "rowWithTitle:valueKeyPath:", CFSTR("Actions Widget"), v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v278[16] = v58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v278, 17);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "sectionWithRows:title:", v59, CFSTR("Info Panel"));
  aSelector = (char *)objc_claimAutoreleasedReturnValue();

  v258 = (void *)MEMORY[0x1E0D83078];
  v60 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_addToTabSimulate);
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "rowWithTitle:valueKeyPath:", CFSTR("Only Perform Animation"), v253);
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  v277[0] = v247;
  v61 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_addToTabOpacity);
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "rowWithTitle:valueKeyPath:", CFSTR("Opacity"), v241);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v235, "minValue:maxValue:", 0.0, 1.0);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "px_increment:", 0.05);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  v277[1] = v223;
  v62 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_addToTabDuration);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "rowWithTitle:valueKeyPath:", CFSTR("Duration"), v217);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v211, "minValue:maxValue:", 0.0, 3.0);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "px_increment:", 0.05);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v277[2] = v199;
  v63 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_addToTabTranslationDelay);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "rowWithTitle:valueKeyPath:", CFSTR("Translation Start"), v193);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "minValue:maxValue:", 0.0, 1.0);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "px_increment:", 0.05);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v277[3] = v181;
  v64 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_addToTabScaleDelay);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "rowWithTitle:valueKeyPath:", CFSTR("Scale Down Start"), v177);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "minValue:maxValue:", 0.0, 1.0);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "px_increment:", 0.05);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v277[4] = v167;
  v65 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_addToTabRotationDelay);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "rowWithTitle:valueKeyPath:", CFSTR("Rotation Start"), v164);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "minValue:maxValue:", 0.0, 1.0);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "px_increment:", 0.05);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v277[5] = v66;
  v67 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_addToTabFadeOutDelay);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "rowWithTitle:valueKeyPath:", CFSTR("Fade Out Start"), v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "minValue:maxValue:", 0.0, 1.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "px_increment:", 0.05);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v277[6] = v71;
  v72 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_addToTabEndRotation);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "rowWithTitle:valueKeyPath:", CFSTR("Final Rotation Angle"), v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "minValue:maxValue:", 0.0, 360.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "px_increment:", 2.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v277[7] = v76;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v277, 8);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v258, "sectionWithRows:title:", v77, CFSTR("Create Photo Memory Feedback"));
  v259 = (void *)objc_claimAutoreleasedReturnValue();

  v254 = (void *)MEMORY[0x1E0D83078];
  v78 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_purgeOnMemoryWarning);
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "rowWithTitle:valueKeyPath:", CFSTR("Purge On Memory Warning"), v248);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  v276[0] = v242;
  v79 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_detailViewsToKeepLoaded);
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "rowWithTitle:valueKeyPath:", CFSTR("Detail Views to Keep Loaded"), v236);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v230, "minValue:maxValue:", 0.0, 20.0);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v224, "px_increment:", 1.0);
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  v276[1] = v218;
  v80 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowWidgetsContentLoading);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "rowWithTitle:valueKeyPath:", CFSTR("Widgets Content Loading"), v212);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  v276[2] = v206;
  v81 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_loadAllWidgetsContentAfterDelay);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "rowWithTitle:valueKeyPath:", CFSTR("Load All Widgets after Delay"), v200);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "conditionFormat:", CFSTR("allowWidgetsContentLoading != 0"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v276[3] = v82;
  v83 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_loadAllWidgetsContentOnScroll);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "rowWithTitle:valueKeyPath:", CFSTR("Load All Widgets on Scroll"), v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "conditionFormat:", CFSTR("allowWidgetsContentLoading != 0"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v276[4] = v86;
  v87 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_defaultPriorityWidgetsLoadingDelay);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "rowWithTitle:valueKeyPath:", CFSTR("Default Priority Load Delay"), v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "minValue:maxValue:", 0.0, 2.0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "px_increment:", 0.1);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "conditionFormat:", CFSTR("allowWidgetsContentLoading != 0"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v276[5] = v92;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v276, 6);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v254, "sectionWithRows:title:", v93, CFSTR("Loading"));
  v255 = (void *)objc_claimAutoreleasedReturnValue();

  v249 = (void *)MEMORY[0x1E0D83078];
  v94 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useCuratedLibraryLayout);
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "rowWithTitle:valueKeyPath:", CFSTR("Curated Library Layout"), v243);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v275[0] = v237;
  v95 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowItemReorderingInCuratedLayout);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "rowWithTitle:valueKeyPath:", CFSTR("Allow Curated Items Reordering"), v231);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  v275[1] = v225;
  v96 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_editorialLayoutEdit);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "rowWithTitle:valueKeyPath:", CFSTR("Editorial Layout Edit"), v219);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v275[2] = v213;
  v97 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_editorialLayoutColumns);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "rowWithTitle:valueKeyPath:", CFSTR("Editorial Layout Columns"), v207);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "minValue:maxValue:", 3.0, 8.0);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "px_increment:", 1.0);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v275[3] = v190;
  v98 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_editorialLayoutTargetRowsForChunk);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "rowWithTitle:valueKeyPath:", CFSTR("Editorial Layout Target Rows For Chunk"), v186);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "possibleValues:titles:", &unk_1E53E9C78, &unk_1E53E9C90);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v275[4] = v178;
  v99 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_editorialLayoutAvoidSmallestTile);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "rowWithTitle:valueKeyPath:", CFSTR("Editorial Layout Avoid Smallest Tile"), v174);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v275[5] = v171;
  v100 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_editorialLayoutActivityFeedItemCountThreshold);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "rowWithTitle:valueKeyPath:", CFSTR("Editorial Activity Feed Layout"), v168);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "possibleValues:titles:", &unk_1E53E9CA8, &unk_1E53E9CC0);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v275[6] = v162;
  v101 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_assetsWidgetPlaceholderAspectRatio);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "rowWithTitle:valueKeyPath:", CFSTR("Placeholder Aspect Ratio"), v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "minValue:maxValue:", 0.25, 4.0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "px_increment:", 0.25);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v275[7] = v105;
  v106 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowEditorialLayoutStressTest);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "rowWithTitle:valueKeyPath:", CFSTR("Allow Editorial Layout Stress Test"), v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v275[8] = v108;
  v109 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_debugBadgeInfoType);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "rowWithTitle:valueKeyPath:", CFSTR("Debug Badges"), v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "possibleValues:titles:", &unk_1E53E9CD8, &unk_1E53E9CF0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v275[9] = v112;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v275, 10);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v249, "sectionWithRows:title:conditionFormat:", v113, CFSTR("Assets Widget"), CFSTR("showAssetsWidget != 0"));
  v250 = (void *)objc_claimAutoreleasedReturnValue();

  v114 = (void *)MEMORY[0x1E0D83078];
  v115 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_peopleWidgetDisableSocialGroup);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "rowWithTitle:valueKeyPath:", CFSTR("Disable Social Groups"), v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v274[0] = v117;
  v118 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_peopleWidgetMaximumNumberOfPeople);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "rowWithTitle:valueKeyPath:", CFSTR("Max Number of People"), v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "minValue:maxValue:", 0.0, 20.0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "px_increment:", 1.0);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v274[1] = v122;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v274, 2);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "sectionWithRows:title:conditionFormat:", v123, CFSTR("People Widget"), CFSTR("showRelatedPeopleWidget != 0"));
  v244 = (void *)objc_claimAutoreleasedReturnValue();

  v124 = (void *)MEMORY[0x1E0D83078];
  v125 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_placesWidgetShowOnlyPlaceholder);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "rowWithTitle:valueKeyPath:", CFSTR("Placeholder Only"), v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v273 = v127;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v273, 1);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "sectionWithRows:title:conditionFormat:", v128, CFSTR("Places Widget"), CFSTR("showPlacesWidget != 0"));
  v238 = (void *)objc_claimAutoreleasedReturnValue();

  v129 = (void *)MEMORY[0x1E0D83078];
  v130 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showLookUpWidgetSearchIcon);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "rowWithTitle:valueKeyPath:", CFSTR("Enable Search Icon"), v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v272 = v132;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v272, 1);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "sectionWithRows:title:conditionFormat:", v133, CFSTR("Visual LookUp Widget"), CFSTR("showVisualLookUpWidget != 0"));
  v232 = (void *)objc_claimAutoreleasedReturnValue();

  v202 = (void *)MEMORY[0x1E0D83078];
  v134 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_captionWidgetEnableHashtags);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "rowWithTitle:valueKeyPath:", CFSTR("Enable Hashtags"), v226);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v271[0] = v220;
  v135 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_captionWidgetEnableVScrollingInEdit);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "rowWithTitle:valueKeyPath:", CFSTR("Enable V-Scrolling in Edit"), v214);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v271[1] = v208;
  v136 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_captionWidgetEnableFadeInEffect);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "rowWithTitle:valueKeyPath:", CFSTR("Enable Fade-In effect"), v196);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v271[2] = v137;
  v138 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_captionWidgetFadeInDuration);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "rowWithTitle:valueKeyPath:", CFSTR("Fade-In duration"), v139);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "minValue:maxValue:", 0.25, 1.0);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "px_increment:", 0.05);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "conditionFormat:", CFSTR("captionWidgetEnableFadeInEffect != 0"));
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v271[3] = v143;
  v144 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_captionWidgetEnableDirectAttachToMaster);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "rowWithTitle:valueKeyPath:", CFSTR("Enable Direct Attach to Master Photo"), v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v271[4] = v146;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v271, 5);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "sectionWithRows:title:conditionFormat:", v147, CFSTR("Caption Widget"), CFSTR("showCaptionHashtagsWidget != 0"));
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = (void *)MEMORY[0x1E0D83078];
  v270[0] = v264;
  v270[1] = v263;
  v270[2] = aSelector;
  v270[3] = v259;
  v270[4] = v255;
  v270[5] = v250;
  v270[6] = v148;
  v270[7] = v232;
  v270[8] = v244;
  v270[9] = v238;
  v270[10] = v149;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v270, 11);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "moduleWithTitle:contents:", CFSTR("Photos Details"), v151);
  v152 = (void *)objc_claimAutoreleasedReturnValue();

  return v152;
}

+ (void)_fillLibraryWithFakeAssets:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__PXPhotosDetailsSettings_UI___fillLibraryWithFakeAssets___block_invoke;
  v6[3] = &unk_1E5138B28;
  v7 = v3;
  v5 = v3;
  v4 = +[PXAlert show:](PXAlert, "show:", v6);

}

void __58__PXPhotosDetailsSettings_UI___fillLibraryWithFakeAssets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  objc_msgSend(v3, "setTitle:", CFSTR("Fill Library with Fake Assets?"));
  objc_msgSend(v3, "setMessage:", CFSTR("The fake assets will be added at the very beginning of your photo library."));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__PXPhotosDetailsSettings_UI___fillLibraryWithFakeAssets___block_invoke_2;
  v4[3] = &unk_1E5149198;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "addActionWithTitle:style:action:", CFSTR("Fill"), 0, v4);
  objc_msgSend(v3, "addActionWithTitle:style:action:", CFSTR("Cancel"), 1, 0);

}

uint64_t __58__PXPhotosDetailsSettings_UI___fillLibraryWithFakeAssets___block_invoke_2(uint64_t a1)
{
  return +[PXFakePhotoKitAssetsFetcher fillLibraryWithFakeAssets:completion:](PXFakePhotoKitAssetsFetcher, "fillLibraryWithFakeAssets:completion:", *(_QWORD *)(a1 + 32), &__block_literal_global_471);
}

void __58__PXPhotosDetailsSettings_UI___fillLibraryWithFakeAssets___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  char v9;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__PXPhotosDetailsSettings_UI___fillLibraryWithFakeAssets___block_invoke_4;
  v7[3] = &unk_1E512E800;
  v9 = a2;
  v8 = v4;
  v6 = v4;
  v5 = +[PXAlert show:](PXAlert, "show:", v7);

}

void __58__PXPhotosDetailsSettings_UI___fillLibraryWithFakeAssets___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  const __CFString *v4;
  id v5;

  v3 = a2;
  if (*(_BYTE *)(a1 + 40))
    v4 = CFSTR("Done");
  else
    v4 = CFSTR("Failed");
  v5 = v3;
  objc_msgSend(v3, "setTitle:", v4);
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v5, "configureForError:");

}

void __55__PXPhotosDetailsSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  PXPhotosDataSourceConfiguration *v5;
  PXPhotosDataSource *v6;
  PXPhotosDetailsContext *v7;
  PXPhotosDetailsUIViewController *v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsWithOptions:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v4, 0);
  -[PXPhotosDataSourceConfiguration setHideHiddenAssets:](v5, "setHideHiddenAssets:", 1);
  v6 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v5);
  v7 = -[PXPhotosDetailsContext initWithPhotosDataSource:displayTitleInfo:parentContext:keyAssetsFetchResult:]([PXPhotosDetailsContext alloc], "initWithPhotosDataSource:displayTitleInfo:parentContext:keyAssetsFetchResult:", v6, 0, 0, 0);
  v8 = -[PXPhotosDetailsUIViewController initWithContext:options:]([PXPhotosDetailsUIViewController alloc], "initWithContext:options:", v7, 3072);
  objc_msgSend(v3, "px_presentViewControllerInNavigationController:animated:dimissButtonLocation:completion:", v8, 1, 1, 0);

}

uint64_t __55__PXPhotosDetailsSettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "_fillLibraryWithFakeAssets:", *(_QWORD *)(a1 + 32));
  return 1;
}

__CFString *__55__PXPhotosDetailsSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  return PXPhotosCurationAlgorithmDescription(objc_msgSend(a2, "integerValue"));
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (int64_t)version
{
  return 2;
}

- (int64_t)defaultCurationAlgorithm
{
  return self->_defaultCurationAlgorithm;
}

- (void)setDefaultCurationAlgorithm:(int64_t)a3
{
  self->_defaultCurationAlgorithm = a3;
}

- (int64_t)detailsViewCurationAlgorithm
{
  return self->_detailsViewCurationAlgorithm;
}

- (void)setDetailsViewCurationAlgorithm:(int64_t)a3
{
  self->_detailsViewCurationAlgorithm = a3;
}

- (BOOL)enableFetchResultCaching
{
  return self->_enableFetchResultCaching;
}

- (void)setEnableFetchResultCaching:(BOOL)a3
{
  self->_enableFetchResultCaching = a3;
}

- (BOOL)showHeaderWidget
{
  return self->_showHeaderWidget;
}

- (BOOL)showAssetsWidget
{
  return self->_showAssetsWidget;
}

- (BOOL)showCaptionHashtagsWidget
{
  return self->_showCaptionHashtagsWidget;
}

- (BOOL)showAlbumAttributionWidget
{
  return self->_showAlbumAttributionWidget;
}

- (void)setShowAlbumAttributionWidget:(BOOL)a3
{
  self->_showAlbumAttributionWidget = a3;
}

- (BOOL)showAppAttributionWidget
{
  return self->_showAppAttributionWidget;
}

- (BOOL)showVisualLookUpWidget
{
  return self->_showVisualLookUpWidget;
}

- (BOOL)showTimeWidget
{
  return self->_showTimeWidget;
}

- (BOOL)showEXIFWidget
{
  return self->_showEXIFWidget;
}

- (BOOL)showAssetDescriptionWidget
{
  return self->_showAssetDescriptionWidget;
}

- (void)setShowAssetDescriptionWidget:(BOOL)a3
{
  self->_showAssetDescriptionWidget = a3;
}

- (BOOL)showAssetRichDescription
{
  return self->_showAssetRichDescription;
}

- (void)setShowAssetRichDescription:(BOOL)a3
{
  self->_showAssetRichDescription = a3;
}

- (BOOL)showDemoTilingViewWidget
{
  return self->_showDemoTilingViewWidget;
}

- (BOOL)showDemoViewWidget
{
  return self->_showDemoViewWidget;
}

- (BOOL)showDemoDynamicWidget
{
  return self->_showDemoDynamicWidget;
}

- (BOOL)showPlacesWidget
{
  return self->_showPlacesWidget;
}

- (BOOL)showRelatedPeopleWidget
{
  return self->_showRelatedPeopleWidget;
}

- (BOOL)showSharedLibraryWidget
{
  return self->_showSharedLibraryWidget;
}

- (BOOL)showActionsWidget
{
  return self->_showActionsWidget;
}

- (BOOL)showPeopleInlineCandidateWidget
{
  return self->_showPeopleInlineCandidateWidget;
}

- (BOOL)showFacesAreaRect
{
  return self->_showFacesAreaRect;
}

- (BOOL)allowWidgetsContentLoading
{
  return self->_allowWidgetsContentLoading;
}

- (BOOL)loadAllWidgetsContentAfterDelay
{
  return self->_loadAllWidgetsContentAfterDelay;
}

- (BOOL)loadAllWidgetsContentOnScroll
{
  return self->_loadAllWidgetsContentOnScroll;
}

- (double)defaultPriorityWidgetsLoadingDelay
{
  return self->_defaultPriorityWidgetsLoadingDelay;
}

- (BOOL)allowMultiColumnLayout
{
  return self->_allowMultiColumnLayout;
}

- (BOOL)allowsTopTrailingSelectCancelButton
{
  return self->_allowsTopTrailingSelectCancelButton;
}

- (BOOL)purgeOnMemoryWarning
{
  return self->_purgeOnMemoryWarning;
}

- (int64_t)detailViewsToKeepLoaded
{
  return self->_detailViewsToKeepLoaded;
}

- (BOOL)useCuratedLibraryLayout
{
  return self->_useCuratedLibraryLayout;
}

- (BOOL)allowItemReorderingInCuratedLayout
{
  return self->_allowItemReorderingInCuratedLayout;
}

- (BOOL)editorialLayoutEdit
{
  return self->_editorialLayoutEdit;
}

- (int64_t)editorialLayoutColumns
{
  return self->_editorialLayoutColumns;
}

- (int64_t)editorialLayoutTargetRowsForChunk
{
  return self->_editorialLayoutTargetRowsForChunk;
}

- (BOOL)editorialLayoutAvoidSmallestTile
{
  return self->_editorialLayoutAvoidSmallestTile;
}

- (int64_t)editorialLayoutActivityFeedItemCountThreshold
{
  return self->_editorialLayoutActivityFeedItemCountThreshold;
}

- (double)assetsWidgetPlaceholderAspectRatio
{
  return self->_assetsWidgetPlaceholderAspectRatio;
}

- (BOOL)allowEditorialLayoutStressTest
{
  return self->_allowEditorialLayoutStressTest;
}

- (BOOL)placesWidgetShowOnlyPlaceholder
{
  return self->_placesWidgetShowOnlyPlaceholder;
}

- (BOOL)showLookUpWidgetSearchIcon
{
  return self->_showLookUpWidgetSearchIcon;
}

- (BOOL)captionWidgetEnableHashtags
{
  return self->_captionWidgetEnableHashtags;
}

- (BOOL)captionWidgetEnableVScrollingInEdit
{
  return self->_captionWidgetEnableVScrollingInEdit;
}

- (BOOL)captionWidgetEnableFadeInEffect
{
  return self->_captionWidgetEnableFadeInEffect;
}

- (double)captionWidgetFadeInDuration
{
  return self->_captionWidgetFadeInDuration;
}

- (BOOL)captionWidgetEnableDirectAttachToMaster
{
  return self->_captionWidgetEnableDirectAttachToMaster;
}

- (BOOL)peopleWidgetDisableSocialGroup
{
  return self->_peopleWidgetDisableSocialGroup;
}

- (int64_t)peopleWidgetMaximumNumberOfPeople
{
  return self->_peopleWidgetMaximumNumberOfPeople;
}

- (BOOL)addToTabSimulate
{
  return self->_addToTabSimulate;
}

- (double)addToTabOpacity
{
  return self->_addToTabOpacity;
}

- (double)addToTabDuration
{
  return self->_addToTabDuration;
}

- (double)addToTabTranslationDelay
{
  return self->_addToTabTranslationDelay;
}

- (double)addToTabScaleDelay
{
  return self->_addToTabScaleDelay;
}

- (double)addToTabRotationDelay
{
  return self->_addToTabRotationDelay;
}

- (double)addToTabFadeOutDelay
{
  return self->_addToTabFadeOutDelay;
}

- (double)addToTabEndRotation
{
  return self->_addToTabEndRotation;
}

- (BOOL)draggableInfoPanelEnabled
{
  return self->_draggableInfoPanelEnabled;
}

- (BOOL)mapWidgetAllowCopyPasteLocation
{
  return self->_mapWidgetAllowCopyPasteLocation;
}

- (BOOL)showActionableLivePhotosBadge
{
  return self->_showActionableLivePhotosBadge;
}

- (BOOL)formattedLensStringsEnabled
{
  return self->_formattedLensStringsEnabled;
}

+ (id)transientProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PXPhotosDetailsSettings_transientProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transientProperties_onceToken_217078 != -1)
    dispatch_once(&transientProperties_onceToken_217078, block);
  return (id)transientProperties_transientProperties_217079;
}

void __46__PXPhotosDetailsSettings_transientProperties__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___PXPhotosDetailsSettings;
  objc_msgSendSuper2(&v5, sel_transientProperties);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_debugBadgeInfo);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObject:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)transientProperties_transientProperties_217079;
  transientProperties_transientProperties_217079 = v3;

}

@end
