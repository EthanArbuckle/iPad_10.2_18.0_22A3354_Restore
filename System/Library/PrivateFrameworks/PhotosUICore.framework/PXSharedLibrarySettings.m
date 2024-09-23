@implementation PXSharedLibrarySettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PXSharedLibrarySettings;
  -[PTSettings setDefaultValues](&v19, sel_setDefaultValues);
  -[PXSharedLibrarySettings setShowPreviewCancelButton:](self, "setShowPreviewCancelButton:", 0);
  -[PXSharedLibrarySettings setShowMoveToLibraryActionsInShareSheet:](self, "setShowMoveToLibraryActionsInShareSheet:", 0);
  -[PXSharedLibrarySettings setShowPersonalLibraryContentOnly:](self, "setShowPersonalLibraryContentOnly:", 1);
  -[PXSharedLibrarySettings setAlwaysConfirmMoveToSharedLibrary:](self, "setAlwaysConfirmMoveToSharedLibrary:", 0);
  -[PXSharedLibrarySettings setAlwaysConfirmMoveToPersonalLibrary:](self, "setAlwaysConfirmMoveToPersonalLibrary:", 0);
  -[PXSharedLibrarySettings setAlwaysConfirmRemoveSharedLibrarySuggestion:](self, "setAlwaysConfirmRemoveSharedLibrarySuggestion:", 0);
  -[PXSharedLibrarySettings setConfirmMoveToPersonalLibraryFromSharedLibraryPreview:](self, "setConfirmMoveToPersonalLibraryFromSharedLibraryPreview:", 0);
  -[PXSharedLibrarySettings setEnableIncompleteUIElements:](self, "setEnableIncompleteUIElements:", 0);
  -[PXSharedLibrarySettings setEnableAutoShareWithParticipants:](self, "setEnableAutoShareWithParticipants:", 0);
  -[PXSharedLibrarySettings setEnableOneUpBadge:](self, "setEnableOneUpBadge:", 1);
  -[PXSharedLibrarySettings setMockPersonSuggestionForSetupAssistant:](self, "setMockPersonSuggestionForSetupAssistant:", 0);
  -[PXSharedLibrarySettings setInvitationsDataSourceType:](self, "setInvitationsDataSourceType:", 0);
  -[PXSharedLibrarySettings setPreviewDataSourceType:](self, "setPreviewDataSourceType:", 0);
  -[PXSharedLibrarySettings setSharedLibraryDataSourceType:](self, "setSharedLibraryDataSourceType:", 0);
  -[PXSharedLibrarySettings setExitingDataSourceType:](self, "setExitingDataSourceType:", 0);
  -[PXSharedLibrarySettings setSourceLibraryInfoType:](self, "setSourceLibraryInfoType:", 0);
  -[PXSharedLibrarySettings setSimulateErrorType:](self, "setSimulateErrorType:", 0);
  -[PXSharedLibrarySettings setShowSampleGadgets:](self, "setShowSampleGadgets:", 0);
  -[PXSharedLibrarySettings setShowDebugAlbums:](self, "setShowDebugAlbums:", 0);
  PXSharedUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("PXSharedLibrarySharingSuggestionsBannerFirstCheckThreshold"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v4, "integerValue") < 0)
    v5 = 7;
  else
    v5 = objc_msgSend(v4, "integerValue");
  -[PXSharedLibrarySettings setSharingSuggestionsBannerFirstCheckThreshold:](self, "setSharingSuggestionsBannerFirstCheckThreshold:", v5);
  PXSharedUserDefaults();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("PXSharedLibrarySharingSuggestionsBannerUnreadCountThreshold"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "integerValue") >= 1)
    v8 = objc_msgSend(v7, "integerValue");
  else
    v8 = 10;
  -[PXSharedLibrarySettings setSharingSuggestionsBannerUnreadCountThreshold:](self, "setSharingSuggestionsBannerUnreadCountThreshold:", v8);
  -[PXSharedLibrarySettings setSharingSuggestionsLegibilityStrength:](self, "setSharingSuggestionsLegibilityStrength:", 0.8);
  PXSharedUserDefaults();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("PXSharedLibrarySharingSuggestionsMinimumTimeSinceLastBannerDismiss"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v11 = 86400.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "doubleValue");
    if (v12 > 0.0)
    {
      objc_msgSend(v10, "doubleValue");
      v11 = v13;
    }
  }
  -[PXSharedLibrarySettings setSharingSuggestionsMinimumTimeSinceLastBannerDismiss:](self, "setSharingSuggestionsMinimumTimeSinceLastBannerDismiss:", v11);
  PXSharedUserDefaults();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("PXSharedLibrarySharingSuggestionsMinimumTimeSinceLastAsset"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v16 = 7200.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "doubleValue");
    if (v17 > 0.0)
    {
      objc_msgSend(v15, "doubleValue");
      v16 = v18;
    }
  }
  -[PXSharedLibrarySettings setSharingSuggestionsMinimumTimeSinceLastAsset:](self, "setSharingSuggestionsMinimumTimeSinceLastAsset:", v16);
  -[PXSharedLibrarySettings setForceLegacyDevicesFallback:](self, "setForceLegacyDevicesFallback:", 0);
  -[PXSharedLibrarySettings setIncludeNonLegacyDevicesInFallback:](self, "setIncludeNonLegacyDevicesInFallback:", 0);
  -[PXSharedLibrarySettings setSimulateSlowLegacyDevicesFetchInFallback:](self, "setSimulateSlowLegacyDevicesFetchInFallback:", 0);
  -[PXSharedLibrarySettings setSimulateLegacyDevicesRemoteFailure:](self, "setSimulateLegacyDevicesRemoteFailure:", 0);

}

- (void)setSourceLibraryInfoType:(int64_t)a3
{
  self->_sourceLibraryInfoType = a3;
}

- (void)setSimulateSlowLegacyDevicesFetchInFallback:(BOOL)a3
{
  self->_simulateSlowLegacyDevicesFetchInFallback = a3;
}

- (void)setSimulateLegacyDevicesRemoteFailure:(BOOL)a3
{
  self->_simulateLegacyDevicesRemoteFailure = a3;
}

- (void)setSimulateErrorType:(int64_t)a3
{
  self->_simulateErrorType = a3;
}

- (void)setShowSampleGadgets:(BOOL)a3
{
  self->_showSampleGadgets = a3;
}

- (void)setShowPreviewCancelButton:(BOOL)a3
{
  self->_showPreviewCancelButton = a3;
}

- (void)setShowPersonalLibraryContentOnly:(BOOL)a3
{
  self->_showPersonalLibraryContentOnly = a3;
}

- (void)setShowMoveToLibraryActionsInShareSheet:(BOOL)a3
{
  self->_showMoveToLibraryActionsInShareSheet = a3;
}

- (void)setShowDebugAlbums:(BOOL)a3
{
  self->_showDebugAlbums = a3;
}

- (void)setSharingSuggestionsMinimumTimeSinceLastBannerDismiss:(double)a3
{
  self->_sharingSuggestionsMinimumTimeSinceLastBannerDismiss = a3;
}

- (void)setSharingSuggestionsMinimumTimeSinceLastAsset:(double)a3
{
  self->_sharingSuggestionsMinimumTimeSinceLastAsset = a3;
}

- (void)setSharingSuggestionsLegibilityStrength:(double)a3
{
  self->_sharingSuggestionsLegibilityStrength = a3;
}

- (void)setSharingSuggestionsBannerUnreadCountThreshold:(int64_t)a3
{
  self->_sharingSuggestionsBannerUnreadCountThreshold = a3;
}

- (void)setSharedLibraryDataSourceType:(int64_t)a3
{
  self->_sharedLibraryDataSourceType = a3;
}

- (void)setPreviewDataSourceType:(int64_t)a3
{
  self->_previewDataSourceType = a3;
}

- (void)setMockPersonSuggestionForSetupAssistant:(BOOL)a3
{
  self->_mockPersonSuggestionForSetupAssistant = a3;
}

- (void)setInvitationsDataSourceType:(int64_t)a3
{
  self->_invitationsDataSourceType = a3;
}

- (void)setIncludeNonLegacyDevicesInFallback:(BOOL)a3
{
  self->_includeNonLegacyDevicesInFallback = a3;
}

- (void)setForceLegacyDevicesFallback:(BOOL)a3
{
  self->_forceLegacyDevicesFallback = a3;
}

- (void)setExitingDataSourceType:(int64_t)a3
{
  self->_exitingDataSourceType = a3;
}

- (void)setEnableOneUpBadge:(BOOL)a3
{
  self->_enableOneUpBadge = a3;
}

- (void)setEnableIncompleteUIElements:(BOOL)a3
{
  self->_enableIncompleteUIElements = a3;
}

- (void)setEnableAutoShareWithParticipants:(BOOL)a3
{
  self->_enableAutoShareWithParticipants = a3;
}

- (void)setConfirmMoveToPersonalLibraryFromSharedLibraryPreview:(BOOL)a3
{
  self->_confirmMoveToPersonalLibraryFromSharedLibraryPreview = a3;
}

- (void)setAlwaysConfirmRemoveSharedLibrarySuggestion:(BOOL)a3
{
  self->_alwaysConfirmRemoveSharedLibrarySuggestion = a3;
}

- (void)setAlwaysConfirmMoveToSharedLibrary:(BOOL)a3
{
  self->_alwaysConfirmMoveToSharedLibrary = a3;
}

- (void)setAlwaysConfirmMoveToPersonalLibrary:(BOOL)a3
{
  self->_alwaysConfirmMoveToPersonalLibrary = a3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_89973 != -1)
    dispatch_once(&sharedInstance_onceToken_89973, &__block_literal_global_89974);
  return (id)sharedInstance_sharedInstance_89975;
}

void __41__PXSharedLibrarySettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedLibrarySettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_89975;
  sharedInstance_sharedInstance_89975 = v0;

}

- (int64_t)sharedLibraryDataSourceType
{
  return self->_sharedLibraryDataSourceType;
}

- (int64_t)previewDataSourceType
{
  return self->_previewDataSourceType;
}

- (int64_t)invitationsDataSourceType
{
  return self->_invitationsDataSourceType;
}

- (int64_t)exitingDataSourceType
{
  return self->_exitingDataSourceType;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)showPreviewCancelButton
{
  return self->_showPreviewCancelButton;
}

- (BOOL)showMoveToLibraryActionsInShareSheet
{
  return self->_showMoveToLibraryActionsInShareSheet;
}

- (BOOL)showPersonalLibraryContentOnly
{
  return self->_showPersonalLibraryContentOnly;
}

- (BOOL)showPreviewAssetsOnlyFilter
{
  return self->_showPreviewAssetsOnlyFilter;
}

- (void)setShowPreviewAssetsOnlyFilter:(BOOL)a3
{
  self->_showPreviewAssetsOnlyFilter = a3;
}

- (BOOL)alwaysConfirmMoveToSharedLibrary
{
  return self->_alwaysConfirmMoveToSharedLibrary;
}

- (BOOL)alwaysConfirmMoveToPersonalLibrary
{
  return self->_alwaysConfirmMoveToPersonalLibrary;
}

- (BOOL)alwaysConfirmRemoveSharedLibrarySuggestion
{
  return self->_alwaysConfirmRemoveSharedLibrarySuggestion;
}

- (BOOL)confirmMoveToPersonalLibraryFromSharedLibraryPreview
{
  return self->_confirmMoveToPersonalLibraryFromSharedLibraryPreview;
}

- (BOOL)enableIncompleteUIElements
{
  return self->_enableIncompleteUIElements;
}

- (BOOL)enableAutoShareWithParticipants
{
  return self->_enableAutoShareWithParticipants;
}

- (BOOL)enableOneUpBadge
{
  return self->_enableOneUpBadge;
}

- (BOOL)mockPersonSuggestionForSetupAssistant
{
  return self->_mockPersonSuggestionForSetupAssistant;
}

- (int64_t)sourceLibraryInfoType
{
  return self->_sourceLibraryInfoType;
}

- (int64_t)simulateErrorType
{
  return self->_simulateErrorType;
}

- (int64_t)sharingSuggestionsBannerFirstCheckThreshold
{
  return self->_sharingSuggestionsBannerFirstCheckThreshold;
}

- (void)setSharingSuggestionsBannerFirstCheckThreshold:(int64_t)a3
{
  self->_sharingSuggestionsBannerFirstCheckThreshold = a3;
}

- (int64_t)sharingSuggestionsBannerUnreadCountThreshold
{
  return self->_sharingSuggestionsBannerUnreadCountThreshold;
}

- (double)sharingSuggestionsLegibilityStrength
{
  return self->_sharingSuggestionsLegibilityStrength;
}

- (double)sharingSuggestionsMinimumTimeSinceLastBannerDismiss
{
  return self->_sharingSuggestionsMinimumTimeSinceLastBannerDismiss;
}

- (double)sharingSuggestionsMinimumTimeSinceLastAsset
{
  return self->_sharingSuggestionsMinimumTimeSinceLastAsset;
}

- (BOOL)showSampleGadgets
{
  return self->_showSampleGadgets;
}

- (BOOL)showDebugAlbums
{
  return self->_showDebugAlbums;
}

- (BOOL)forceLegacyDevicesFallback
{
  return self->_forceLegacyDevicesFallback;
}

- (BOOL)includeNonLegacyDevicesInFallback
{
  return self->_includeNonLegacyDevicesInFallback;
}

- (BOOL)simulateSlowLegacyDevicesFetchInFallback
{
  return self->_simulateSlowLegacyDevicesFetchInFallback;
}

- (BOOL)simulateLegacyDevicesRemoteFailure
{
  return self->_simulateLegacyDevicesRemoteFailure;
}

+ (id)settingsControllerModule
{
  int v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
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
  int v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  int v93;
  void *v94;
  const __CFString *v95;
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
  void *v153;
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
  _QWORD v183[9];
  _QWORD v184[3];
  _QWORD v185[4];
  _QWORD v186[2];
  _QWORD v187[6];
  _QWORD v188[4];
  _QWORD v189[5];
  _QWORD v190[13];
  _QWORD v191[3];

  v191[1] = *MEMORY[0x1E0C80C00];
  v2 = _os_feature_enabled_impl();
  v3 = (void *)MEMORY[0x1E0D83010];
  v4 = CFSTR("Disabled");
  if (v2)
    v4 = CFSTR("Enabled");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), CFSTR("GoldilocksLocalMode"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _FeatureFlagToggleRowAction(CFSTR("GoldilocksLocalMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:action:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v2 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  _ImageForStateAndBackgroundColor(v2, v180);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStaticImage:", v8);

  v9 = (void *)MEMORY[0x1E0D83078];
  v181 = v7;
  v191[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v191, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:title:", v10, CFSTR("Feature Flags Status"));
  v182 = (void *)objc_claimAutoreleasedReturnValue();

  PXSharedLibrarySettingsSimulateErrorTypes();
  v11 = objc_claimAutoreleasedReturnValue();
  PXSharedLibrarySettingsSimulateErrorTypeTitles();
  v12 = objc_claimAutoreleasedReturnValue();
  v176 = (void *)MEMORY[0x1E0D83078];
  v13 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showMoveToLibraryActionsInShareSheet);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:valueKeyPath:", CFSTR("Show Move Library Actions on Share Sheet"), v173);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v190[0] = v170;
  v14 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showPreviewCancelButton);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rowWithTitle:valueKeyPath:", CFSTR("Show Preview Cancel Button"), v166);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v190[1] = v162;
  v15 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showPersonalLibraryContentOnly);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rowWithTitle:valueKeyPath:", CFSTR("Show Personal Library Only"), v158);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v190[2] = v154;
  v16 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_alwaysConfirmMoveToSharedLibrary);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rowWithTitle:valueKeyPath:", CFSTR("Always Confirm Move To Shared Library"), v150);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v190[3] = v147;
  v17 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_alwaysConfirmMoveToPersonalLibrary);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:valueKeyPath:", CFSTR("Always Confirm Move To Personal Library"), v144);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v190[4] = v142;
  v18 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_alwaysConfirmRemoveSharedLibrarySuggestion);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rowWithTitle:valueKeyPath:", CFSTR("Always Confirm Remove Shared Library Suggestion"), v140);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v190[5] = v138;
  v19 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_confirmMoveToPersonalLibraryFromSharedLibraryPreview);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rowWithTitle:valueKeyPath:", CFSTR("Confirm Move To Personal Library from Preview"), v136);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v190[6] = v134;
  v20 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableIncompleteUIElements);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rowWithTitle:valueKeyPath:", CFSTR("Enable Incomplete UI"), v132);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v190[7] = v130;
  v21 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableAutoShareWithParticipants);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rowWithTitle:valueKeyPath:", CFSTR("Enable Auto Share with Participants"), v129);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v190[8] = v128;
  v22 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableOneUpBadge);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rowWithTitle:valueKeyPath:", CFSTR("Enable OneUp Badge"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v190[9] = v24;
  v25 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showDebugAlbums);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rowWithTitle:valueKeyPath:", CFSTR("Show Debug Albums"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v190[10] = v27;
  v28 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_mockPersonSuggestionForSetupAssistant);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "rowWithTitle:valueKeyPath:", CFSTR("Mock Person Suggestion"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v190[11] = v30;
  v31 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_simulateErrorType);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rowWithTitle:valueKeyPath:", CFSTR("Error Simulation"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = (void *)v12;
  v179 = (void *)v11;
  objc_msgSend(v33, "possibleValues:titles:", v11, v12);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v190[12] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v190, 13);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "sectionWithRows:title:", v35, CFSTR("Settings"));
  v177 = (void *)objc_claimAutoreleasedReturnValue();

  v174 = (void *)MEMORY[0x1E0D83078];
  v36 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_invitationsDataSourceType);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rowWithTitle:valueKeyPath:", CFSTR("Invitations"), v171);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "possibleValues:titles:", &unk_1E53E9A98, &unk_1E53E9AB0);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v189[0] = v163;
  v37 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_previewDataSourceType);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "rowWithTitle:valueKeyPath:", CFSTR("Preview"), v159);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "possibleValues:titles:", &unk_1E53E9AC8, &unk_1E53E9AE0);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v189[1] = v151;
  v38 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_sharedLibraryDataSourceType);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "rowWithTitle:valueKeyPath:", CFSTR("Shared Library"), v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "possibleValues:titles:", &unk_1E53E9AF8, &unk_1E53E9B10);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v189[2] = v41;
  v42 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_exitingDataSourceType);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "rowWithTitle:valueKeyPath:", CFSTR("Exiting"), v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "possibleValues:titles:", &unk_1E53E9B28, &unk_1E53E9B40);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v189[3] = v45;
  v46 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_sourceLibraryInfoType);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "rowWithTitle:valueKeyPath:", CFSTR("Source Library"), v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "possibleValues:titles:", &unk_1E53E9B58, &unk_1E53E9B70);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v189[4] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v189, 5);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "sectionWithRows:title:", v50, CFSTR("Data Source"));
  v175 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = (void *)MEMORY[0x1E0D83078];
  v52 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_351);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "rowWithTitle:action:", CFSTR("Copy URL"), v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v188[0] = v54;
  v55 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_339_138066);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "rowWithTitle:action:", CFSTR("Reset Local Mode LibraryScopes"), v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v188[1] = v57;
  v58 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_138068);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "rowWithTitle:action:", CFSTR("Reset Camera Sharing Preferences"), v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v188[2] = v60;
  v61 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_254_138070);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "rowWithTitle:action:", CFSTR("Reset Invitation Dates"), v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v188[3] = v63;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v188, 4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "sectionWithRows:title:", v64, CFSTR("Actions"));
  v172 = (void *)objc_claimAutoreleasedReturnValue();

  v168 = (void *)MEMORY[0x1E0D83078];
  v65 = (void *)MEMORY[0x1E0D830D0];
  NSStringFromSelector(sel_sharingSuggestionsBannerFirstCheckThreshold);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "rowWithTitle:valueKeyPath:", CFSTR("Banner First Check Threshold"), v164);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "minValue:maxValue:", 0.0, 30.0);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "px_increment:", 1.0);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v187[0] = v152;
  v66 = (void *)MEMORY[0x1E0D830D0];
  NSStringFromSelector(sel_sharingSuggestionsBannerUnreadCountThreshold);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "rowWithTitle:valueKeyPath:", CFSTR("Banner Unread Threshold"), v148);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "minValue:maxValue:", 0.0, 100.0);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "px_increment:", 5.0);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v187[1] = v141;
  v67 = (void *)MEMORY[0x1E0D830D0];
  NSStringFromSelector(sel_sharingSuggestionsMinimumTimeSinceLastBannerDismiss);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "rowWithTitle:valueKeyPath:", CFSTR("Banner Timeout After Dismiss"), v139);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "minValue:maxValue:", 0.0, 604800.0);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "px_increment:", 86400.0);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v187[2] = v133;
  v68 = (void *)MEMORY[0x1E0D830D0];
  NSStringFromSelector(sel_sharingSuggestionsMinimumTimeSinceLastAsset);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "rowWithTitle:valueKeyPath:", CFSTR("Banner Timeout After Last Asset"), v131);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "minValue:maxValue:", 0.0, 86400.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "px_increment:", 3600.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v187[3] = v71;
  v72 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_sharingSuggestionsLegibilityStrength);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "rowWithTitle:valueKeyPath:", CFSTR("Legibility Strength"), v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "minValue:maxValue:", 0.0, 2.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "px_increment:", 0.05);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v187[4] = v76;
  v77 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_281);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "rowWithTitle:action:", CFSTR("Reset Stored Dates"), v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v187[5] = v79;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v187, 6);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "sectionWithRows:title:", v80, CFSTR("Sharing Suggestions"));
  v169 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = _os_feature_enabled_impl();
  v82 = (void *)MEMORY[0x1E0D83010];
  if (v81)
    v83 = CFSTR("Enabled");
  else
    v83 = CFSTR("Disabled");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), CFSTR("GoldilocksLegacyDevices"), v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  _FeatureFlagToggleRowAction(CFSTR("GoldilocksLegacyDevices"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "rowWithTitle:action:", v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v81 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  _ImageForStateAndBackgroundColor(v81, v161);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setStaticImage:", v87);

  v88 = (void *)MEMORY[0x1E0D83078];
  v165 = v86;
  v186[0] = v86;
  v89 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateLegacyDevicesRemoteFailure);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "rowWithTitle:valueKeyPath:", CFSTR("Simulate Remote UI Failure"), v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v186[1] = v91;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v186, 2);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "sectionWithRows:title:", v92, CFSTR("Legacy Devices"));
  v157 = (void *)objc_claimAutoreleasedReturnValue();

  v93 = _os_feature_enabled_impl();
  v94 = (void *)MEMORY[0x1E0D83010];
  if (v93)
    v95 = CFSTR("Enabled");
  else
    v95 = CFSTR("Disabled");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), CFSTR("GoldilocksLegacyDevicesFallback"), v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  _FeatureFlagToggleRowAction(CFSTR("GoldilocksLegacyDevicesFallback"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "rowWithTitle:action:", v96, v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v93 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  _ImageForStateAndBackgroundColor(v93, v153);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setStaticImage:", v99);

  v100 = (void *)MEMORY[0x1E0D83078];
  v185[0] = v98;
  v149 = v98;
  v101 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_forceLegacyDevicesFallback);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "rowWithTitle:valueKeyPath:", CFSTR("Force Fallback"), v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v185[1] = v103;
  v104 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_includeNonLegacyDevicesInFallback);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "rowWithTitle:valueKeyPath:", CFSTR("Show Supported Devices"), v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v185[2] = v106;
  v107 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateSlowLegacyDevicesFetchInFallback);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "rowWithTitle:valueKeyPath:", CFSTR("Simulate Slow Fetch"), v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v185[3] = v109;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v185, 4);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "sectionWithRows:title:", v110, CFSTR("Legacy Devices Fallback"));
  v146 = (void *)objc_claimAutoreleasedReturnValue();

  v111 = (void *)MEMORY[0x1E0D83078];
  v112 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_361);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "rowWithTitle:action:", CFSTR("Generate Camera Switch Questions"), v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v184[0] = v114;
  v115 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_377);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "rowWithTitle:action:", CFSTR("Generate Suggestion Questions"), v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v184[1] = v117;
  v118 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_381);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "rowWithTitle:action:", CFSTR("Evaluate & Send Metrics"), v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v184[2] = v120;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v184, 3);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "sectionWithRows:title:", v121, CFSTR("Photos Challenge Questions"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = (void *)MEMORY[0x1E0D83078];
  v183[0] = v182;
  v183[1] = v177;
  v183[2] = v175;
  v183[3] = v172;
  v183[4] = v169;
  v183[5] = v157;
  v183[6] = v146;
  v183[7] = v122;
  v183[8] = v123;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v183, 9);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "moduleWithTitle:contents:", CFSTR("Shared Library"), v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();

  return v126;
}

uint64_t __55__PXSharedLibrarySettings_UI__settingsControllerModule__block_invoke_3()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "px_sharedLibrarySharingSuggestionsCountsManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clearStoredDates");

  return 1;
}

uint64_t __55__PXSharedLibrarySettings_UI__settingsControllerModule__block_invoke_2()
{
  PXPreferencesResetSharedLibraryInvitationDates();
  return 1;
}

uint64_t __55__PXSharedLibrarySettings_UI__settingsControllerModule__block_invoke()
{
  PXPreferencesResetCameraSharingPreferences();
  return 1;
}

@end
