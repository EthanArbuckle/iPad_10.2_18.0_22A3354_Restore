@implementation PXSharingSettings

- (BOOL)enableNewActionContextMenu
{
  return self->_enableNewActionContextMenu;
}

+ (PXSharingSettings)sharedInstance
{
  if (sharedInstance_onceToken_155336 != -1)
    dispatch_once(&sharedInstance_onceToken_155336, &__block_literal_global_155337);
  return (PXSharingSettings *)(id)sharedInstance_sharedInstance_155338;
}

- (void)setDefaultValues
{
  -[PXSharingSettings setShowConfidentialityWarnings:](self, "setShowConfidentialityWarnings:", 1);
  -[PXSharingSettings setConfidentialityWarningsVersion:](self, "setConfidentialityWarningsVersion:", 7);
  -[PXSharingSettings setDisableMailDrop:](self, "setDisableMailDrop:", 0);
  -[PXSharingSettings setMaxMessagesAssetLimit:](self, "setMaxMessagesAssetLimit:", 20);
  -[PXSharingSettings setMaxMailPhotoLimit:](self, "setMaxMailPhotoLimit:", 5);
  -[PXSharingSettings setShowInternalGIFExport:](self, "setShowInternalGIFExport:", 0);
  -[PXSharingSettings setAllowCopyingVideos:](self, "setAllowCopyingVideos:", 0);
  -[PXSharingSettings setShowFileRadarButtonOnInternalInstalls:](self, "setShowFileRadarButtonOnInternalInstalls:", 1);
  -[PXSharingSettings setSimulatedErrorType:](self, "setSimulatedErrorType:", 0);
  -[PXSharingSettings setEnableNewActionContextMenu:](self, "setEnableNewActionContextMenu:", 1);
  -[PXSharingSettings setEnableOneUpAnimation:](self, "setEnableOneUpAnimation:", 1);
  -[PXSharingSettings setAllowFallbacksWhilePreparing:](self, "setAllowFallbacksWhilePreparing:", 0);
  -[PXSharingSettings setLocationBakingComparisonStrategy:](self, "setLocationBakingComparisonStrategy:", 0);
  -[PXSharingSettings setDisableMetadataCorrections:](self, "setDisableMetadataCorrections:", 0);
  -[PXSharingSettings setForceDateTimeMetadataBaking:](self, "setForceDateTimeMetadataBaking:", 0);
  -[PXSharingSettings setForceLocationMetadataBaking:](self, "setForceLocationMetadataBaking:", 0);
  -[PXSharingSettings setForceCaptionMetadataBaking:](self, "setForceCaptionMetadataBaking:", 0);
  -[PXSharingSettings setForceAccessibilityDescriptionMetadataBaking:](self, "setForceAccessibilityDescriptionMetadataBaking:", 0);
  -[PXSharingSettings setSendAssetURLsToMessages:](self, "setSendAssetURLsToMessages:", 0);
  -[PXSharingSettings setSimulateError:](self, "setSimulateError:", 0);
  -[PXSharingSettings setSimulateDownloadFailure:](self, "setSimulateDownloadFailure:", 0);
  -[PXSharingSettings setSimulateMaxFilesizeLimitForGIFsInSharedAlbumsError:](self, "setSimulateMaxFilesizeLimitForGIFsInSharedAlbumsError:", 0);
  -[PXSharingSettings setSimulateCPLNotReadyError:](self, "setSimulateCPLNotReadyError:", 0);
  -[PXSharingSettings setSimulateLowDiskSpaceError:](self, "setSimulateLowDiskSpaceError:", 0);
  -[PXSharingSettings setSimulateUserCloudNotAuthenticated:](self, "setSimulateUserCloudNotAuthenticated:", 0);
  -[PXSharingSettings setSimulateSyndicatedResourceUnavailable:](self, "setSimulateSyndicatedResourceUnavailable:", 0);
  -[PXSharingSettings setSimulateMismatchedExportCounts:](self, "setSimulateMismatchedExportCounts:", 0);
  -[PXSharingSettings setShowSingleVideoDurationInShareSheetHeader:](self, "setShowSingleVideoDurationInShareSheetHeader:", 1);
  -[PXSharingSettings setSharingHeaderLocationDisplayStyle:](self, "setSharingHeaderLocationDisplayStyle:", 0);
  -[PXSharingSettings setProvideGenericTypeIdentifiersForNilActivityTypes:](self, "setProvideGenericTypeIdentifiersForNilActivityTypes:", 1);
  -[PXSharingSettings setShowUnmodifiedOriginalsExportSwitch:](self, "setShowUnmodifiedOriginalsExportSwitch:", 0);
  -[PXSharingSettings setShowGlobalLivenessExclusionSwitch:](self, "setShowGlobalLivenessExclusionSwitch:", 0);
  -[PXSharingSettings setShowGlobalLocationExclusionSwitch:](self, "setShowGlobalLocationExclusionSwitch:", 1);
  -[PXSharingSettings setExcludeLivenessByDefaultWhenSharing:](self, "setExcludeLivenessByDefaultWhenSharing:", 0);
  -[PXSharingSettings setExcludeLocationByDefaultWhenSharing:](self, "setExcludeLocationByDefaultWhenSharing:", 0);
  -[PXSharingSettings setShowSendAsAssetBundlesForCMM:](self, "setShowSendAsAssetBundlesForCMM:", 1);
  -[PXSharingSettings setShowSendAsAssetBundlesForIndividualItems:](self, "setShowSendAsAssetBundlesForIndividualItems:", 1);
  -[PXSharingSettings setSendAsAssetBundlesByDefaultWhenSharing:](self, "setSendAsAssetBundlesByDefaultWhenSharing:", 0);
  -[PXSharingSettings setSavePhotosBundlesToFilesWithoutExtractingMedia:](self, "setSavePhotosBundlesToFilesWithoutExtractingMedia:", 0);
  -[PXSharingSettings setShouldUpdateFileCreationDatesForUnmodifiedOriginalExports:](self, "setShouldUpdateFileCreationDatesForUnmodifiedOriginalExports:", 1);
  -[PXSharingSettings setShouldUpdateFileCreationDatesForRegularExports:](self, "setShouldUpdateFileCreationDatesForRegularExports:", 1);
}

- (void)setSimulatedErrorType:(int64_t)a3
{
  self->_simulatedErrorType = a3;
}

- (void)setSimulateUserCloudNotAuthenticated:(BOOL)a3
{
  self->_simulateUserCloudNotAuthenticated = a3;
}

- (void)setSimulateSyndicatedResourceUnavailable:(BOOL)a3
{
  self->_simulateSyndicatedResourceUnavailable = a3;
}

- (void)setSimulateMismatchedExportCounts:(BOOL)a3
{
  self->_simulateMismatchedExportCounts = a3;
}

- (void)setSimulateMaxFilesizeLimitForGIFsInSharedAlbumsError:(BOOL)a3
{
  self->_simulateMaxFilesizeLimitForGIFsInSharedAlbumsError = a3;
}

- (void)setSimulateLowDiskSpaceError:(BOOL)a3
{
  self->_simulateLowDiskSpaceError = a3;
}

- (void)setSimulateError:(BOOL)a3
{
  self->_simulateError = a3;
}

- (void)setSimulateDownloadFailure:(BOOL)a3
{
  self->_simulateDownloadFailure = a3;
}

- (void)setSimulateCPLNotReadyError:(BOOL)a3
{
  self->_simulateCPLNotReadyError = a3;
}

- (void)setShowUnmodifiedOriginalsExportSwitch:(BOOL)a3
{
  self->_showUnmodifiedOriginalsExportSwitch = a3;
}

- (void)setShowSingleVideoDurationInShareSheetHeader:(BOOL)a3
{
  self->_showSingleVideoDurationInShareSheetHeader = a3;
}

- (void)setShowSendAsAssetBundlesForIndividualItems:(BOOL)a3
{
  self->_showSendAsAssetBundlesForIndividualItems = a3;
}

- (void)setShowSendAsAssetBundlesForCMM:(BOOL)a3
{
  self->_showSendAsAssetBundlesForCMM = a3;
}

- (void)setShowInternalGIFExport:(BOOL)a3
{
  self->_showInternalGIFExport = a3;
}

- (void)setShowGlobalLocationExclusionSwitch:(BOOL)a3
{
  self->_showGlobalLocationExclusionSwitch = a3;
}

- (void)setShowGlobalLivenessExclusionSwitch:(BOOL)a3
{
  self->_showGlobalLivenessExclusionSwitch = a3;
}

- (void)setShowFileRadarButtonOnInternalInstalls:(BOOL)a3
{
  self->_showFileRadarButtonOnInternalInstalls = a3;
}

- (void)setShowConfidentialityWarnings:(BOOL)a3
{
  self->_showConfidentialityWarnings = a3;
}

- (void)setShouldUpdateFileCreationDatesForUnmodifiedOriginalExports:(BOOL)a3
{
  self->_shouldUpdateFileCreationDatesForUnmodifiedOriginalExports = a3;
}

- (void)setSharingHeaderLocationDisplayStyle:(int64_t)a3
{
  self->_sharingHeaderLocationDisplayStyle = a3;
}

- (void)setSendAssetURLsToMessages:(BOOL)a3
{
  self->_sendAssetURLsToMessages = a3;
}

- (void)setSendAsAssetBundlesByDefaultWhenSharing:(BOOL)a3
{
  self->_sendAsAssetBundlesByDefaultWhenSharing = a3;
}

- (void)setSavePhotosBundlesToFilesWithoutExtractingMedia:(BOOL)a3
{
  self->_savePhotosBundlesToFilesWithoutExtractingMedia = a3;
}

- (void)setMaxMessagesAssetLimit:(unint64_t)a3
{
  self->_maxMessagesAssetLimit = a3;
}

- (void)setMaxMailPhotoLimit:(unint64_t)a3
{
  self->_maxMailPhotoLimit = a3;
}

- (void)setLocationBakingComparisonStrategy:(int64_t)a3
{
  self->_locationBakingComparisonStrategy = a3;
}

- (void)setForceLocationMetadataBaking:(BOOL)a3
{
  self->_forceLocationMetadataBaking = a3;
}

- (void)setForceDateTimeMetadataBaking:(BOOL)a3
{
  self->_forceDateTimeMetadataBaking = a3;
}

- (void)setForceCaptionMetadataBaking:(BOOL)a3
{
  self->_forceCaptionMetadataBaking = a3;
}

- (void)setForceAccessibilityDescriptionMetadataBaking:(BOOL)a3
{
  self->_forceAccessibilityDescriptionMetadataBaking = a3;
}

- (void)setExcludeLocationByDefaultWhenSharing:(BOOL)a3
{
  self->_excludeLocationByDefaultWhenSharing = a3;
}

- (void)setExcludeLivenessByDefaultWhenSharing:(BOOL)a3
{
  self->_excludeLivenessByDefaultWhenSharing = a3;
}

- (void)setEnableOneUpAnimation:(BOOL)a3
{
  self->_enableOneUpAnimation = a3;
}

- (void)setEnableNewActionContextMenu:(BOOL)a3
{
  self->_enableNewActionContextMenu = a3;
}

- (void)setDisableMetadataCorrections:(BOOL)a3
{
  self->_disableMetadataCorrections = a3;
}

- (void)setDisableMailDrop:(BOOL)a3
{
  self->_disableMailDrop = a3;
}

- (void)setConfidentialityWarningsVersion:(unint64_t)a3
{
  self->_confidentialityWarningsVersion = a3;
}

- (void)setAllowFallbacksWhilePreparing:(BOOL)a3
{
  self->_allowFallbacksWhilePreparing = a3;
}

- (void)setAllowCopyingVideos:(BOOL)a3
{
  self->_allowCopyingVideos = a3;
}

- (void)setShouldUpdateFileCreationDatesForRegularExports:(BOOL)a3
{
  self->_shouldUpdateFileCreationDatesForRegularExports = a3;
}

void __35__PXSharingSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharingSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_155338;
  sharedInstance_sharedInstance_155338 = v0;

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
  uint64_t v71;
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
  _QWORD v172[9];
  void *v173;
  _QWORD v174[2];
  _QWORD v175[2];
  _QWORD v176[8];
  _QWORD v177[8];
  _QWORD v178[10];
  _QWORD v179[2];
  _QWORD v180[7];
  _QWORD v181[3];

  v181[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v3 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showConfidentialityWarnings);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Show Confidentiality Warnings"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v181[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v181, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v6, CFSTR("Warnings"));
  v171 = (void *)objc_claimAutoreleasedReturnValue();

  v169 = (void *)MEMORY[0x1E0D83078];
  v7 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_disableMailDrop);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:valueKeyPath:", CFSTR("Disable Mail Drop"), v167);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v180[0] = v164;
  v8 = (void *)MEMORY[0x1E0D830D0];
  NSStringFromSelector(sel_maxMessagesAssetLimit);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:valueKeyPath:", CFSTR("Messages Asset Limit"), v160);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "minValue:maxValue:", 0.0, 50.0);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "px_increment:", 1.0);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v180[1] = v146;
  v9 = (void *)MEMORY[0x1E0D830D0];
  NSStringFromSelector(sel_maxMailPhotoLimit);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:valueKeyPath:", CFSTR("Mail Image Limit (if no MailDrop)"), v141);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "minValue:maxValue:", 0.0, 50.0);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "px_increment:", 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v180[2] = v10;
  v11 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showInternalGIFExport);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rowWithTitle:valueKeyPath:", CFSTR("Show Autoloop -> GIF"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v180[3] = v13;
  v14 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableNewActionContextMenu);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rowWithTitle:valueKeyPath:", CFSTR("Enable New Action Context Menu"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v180[4] = v16;
  v17 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableOneUpAnimation);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:valueKeyPath:", CFSTR("Enable 1up animation"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v180[5] = v19;
  v20 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowCopyingVideos);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rowWithTitle:valueKeyPath:", CFSTR("Allow Copying Videos"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v180[6] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v180, 7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "sectionWithRows:title:", v23, CFSTR("Share Sheet"));
  v170 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0D83078];
  v25 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showSingleVideoDurationInShareSheetHeader);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rowWithTitle:valueKeyPath:", CFSTR("Show Duration For Single Video"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v179[0] = v27;
  v28 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_sharingHeaderLocationDisplayStyle);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "rowWithTitle:valueKeyPath:", CFSTR("Location Display Style"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "possibleValues:titles:", &unk_1E53E86B8, &unk_1E53E86D0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v179[1] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v179, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sectionWithRows:title:", v32, CFSTR("Share Sheet Header Options"));
  v168 = (void *)objc_claimAutoreleasedReturnValue();

  v165 = (void *)MEMORY[0x1E0D83078];
  v33 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_provideGenericTypeIdentifiersForNilActivityTypes);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rowWithTitle:valueKeyPath:", CFSTR("Fast UTType for nil activity types"), v161);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v178[0] = v157;
  v34 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showUnmodifiedOriginalsExportSwitch);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "rowWithTitle:valueKeyPath:", CFSTR("Unmodified Export Switch"), v152);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v178[1] = v147;
  v35 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showGlobalLivenessExclusionSwitch);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "rowWithTitle:valueKeyPath:", CFSTR("Show Liveness Switch"), v142);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v178[2] = v138;
  v36 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showGlobalLocationExclusionSwitch);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rowWithTitle:valueKeyPath:", CFSTR("Show Location Switch"), v134);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v178[3] = v130;
  v37 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_excludeLivenessByDefaultWhenSharing);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "rowWithTitle:valueKeyPath:", CFSTR("Exclude Liveness"), v127);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v178[4] = v125;
  v38 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_excludeLocationByDefaultWhenSharing);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "rowWithTitle:valueKeyPath:", CFSTR("Exclude Location"), v123);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v178[5] = v39;
  v40 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showSendAsAssetBundlesForCMM);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "rowWithTitle:valueKeyPath:", CFSTR("Show \"All Photos Data\" option for CMM"), v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v178[6] = v42;
  v43 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showSendAsAssetBundlesForIndividualItems);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "rowWithTitle:valueKeyPath:", CFSTR("Show \"All Photos Data\" option for Individual Items"), v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v178[7] = v45;
  v46 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_sendAsAssetBundlesByDefaultWhenSharing);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "rowWithTitle:valueKeyPath:", CFSTR("Send All Photos Data"), v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v178[8] = v48;
  v49 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_savePhotosBundlesToFilesWithoutExtractingMedia);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "rowWithTitle:valueKeyPath:", CFSTR("Allow All Photos Data for \"Save To Files\"), v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v178[9] = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v178, 10);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "sectionWithRows:title:", v52, CFSTR("Metadata Preferences (Share Sheet Secondary Actions)"));
  v166 = (void *)objc_claimAutoreleasedReturnValue();

  v162 = (void *)MEMORY[0x1E0D83078];
  v53 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowFallbacksWhilePreparing);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "rowWithTitle:valueKeyPath:", CFSTR("Allow fallbacks during prepare"), v158);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v177[0] = v153;
  v54 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_locationBakingComparisonStrategy);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "rowWithTitle:valueKeyPath:", CFSTR("Location Baking Comparison"), v148);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "possibleValues:titles:", &unk_1E53E86E8, &unk_1E53E8700);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v177[1] = v139;
  v55 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_disableMetadataCorrections);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "rowWithTitle:valueKeyPath:", CFSTR("Disable Metadata Corrections"), v135);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v177[2] = v131;
  v56 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_forceDateTimeMetadataBaking);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "rowWithTitle:valueKeyPath:", CFSTR("Always Bake Creation Date"), v128);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v177[3] = v57;
  v58 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_forceLocationMetadataBaking);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "rowWithTitle:valueKeyPath:", CFSTR("Always Bake Location"), v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v177[4] = v60;
  v61 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_forceCaptionMetadataBaking);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "rowWithTitle:valueKeyPath:", CFSTR("Always Bake Caption"), v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v177[5] = v63;
  v64 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_forceAccessibilityDescriptionMetadataBaking);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "rowWithTitle:valueKeyPath:", CFSTR("Always Bake AX Description"), v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v177[6] = v66;
  v67 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_sendAssetURLsToMessages);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "rowWithTitle:valueKeyPath:", CFSTR("Send Asset URLs to Messages"), v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v177[7] = v69;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v177, 8);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "sectionWithRows:title:", v70, CFSTR("Export Pipeline"));
  v163 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("simulateError != 0"));
  v71 = objc_claimAutoreleasedReturnValue();
  v154 = (void *)MEMORY[0x1E0D83078];
  v72 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateError);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "rowWithTitle:valueKeyPath:", CFSTR("Simulate Error"), v149);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v176[0] = v144;
  v73 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateDownloadFailure);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "rowWithTitle:valueKeyPath:", CFSTR("Download Failure"), v140);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "condition:", v71);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v176[1] = v132;
  v74 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateCPLNotReadyError);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "rowWithTitle:valueKeyPath:", CFSTR("CPL Not Ready error"), v129);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "condition:", v71);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v176[2] = v124;
  v75 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateLowDiskSpaceError);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "rowWithTitle:valueKeyPath:", CFSTR("Low Disk Space"), v122);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "condition:", v71);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v176[3] = v120;
  v76 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateUserCloudNotAuthenticated);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "rowWithTitle:valueKeyPath:", CFSTR("iCloud Settings Require Review"), v119);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (void *)v71;
  objc_msgSend(v118, "condition:", v71);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v176[4] = v78;
  v79 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateMaxFilesizeLimitForGIFsInSharedAlbumsError);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "rowWithTitle:valueKeyPath:", CFSTR("GIF -> Shared Albums file limit"), v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = v77;
  objc_msgSend(v81, "condition:", v77);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v176[5] = v82;
  v83 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateSyndicatedResourceUnavailable);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "rowWithTitle:valueKeyPath:", CFSTR("Syndicated resource unavailable"), v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "condition:", v77);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v176[6] = v86;
  v87 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateMismatchedExportCounts);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "rowWithTitle:valueKeyPath:", CFSTR("Mismatched count failure (uses fallback)"), v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v176[7] = v89;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v176, 8);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "sectionWithRows:title:", v90, CFSTR("Simulation"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();

  v91 = (void *)MEMORY[0x1E0D83078];
  v92 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_simulatedErrorType);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "rowWithTitle:valueKeyPath:", CFSTR("Error Type Override"), v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "possibleValues:titles:", &unk_1E53E8718, &unk_1E53E8730);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v175[0] = v95;
  v96 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showFileRadarButtonOnInternalInstalls);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "rowWithTitle:valueKeyPath:", CFSTR("Show Radar Button (Internal OS)"), v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v175[1] = v98;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v175, 2);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "sectionWithRows:title:", v99, CFSTR("Error Presentation UI"));
  v150 = (void *)objc_claimAutoreleasedReturnValue();

  v100 = (void *)MEMORY[0x1E0D83078];
  v101 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_shouldUpdateFileCreationDatesForUnmodifiedOriginalExports);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "rowWithTitle:valueKeyPath:", CFSTR("Unmodified Originals"), v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v174[0] = v103;
  v104 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_shouldUpdateFileCreationDatesForRegularExports);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "rowWithTitle:valueKeyPath:", CFSTR("Share Sheet"), v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v174[1] = v106;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v174, 2);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "sectionWithRows:title:", v107, CFSTR("File Creation Date Set During Export"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();

  v108 = (void *)MEMORY[0x1E0D83078];
  v109 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "rowWithTitle:action:", CFSTR("Restore Defaults"), v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = v111;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v173, 1);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "sectionWithRows:", v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  v114 = (void *)MEMORY[0x1E0D83078];
  v172[0] = v171;
  v172[1] = v170;
  v172[2] = v168;
  v172[3] = v166;
  v172[4] = v163;
  v172[5] = v155;
  v172[6] = v150;
  v172[7] = v145;
  v172[8] = v113;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v172, 9);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "moduleWithTitle:contents:", CFSTR("Sharing Settings"), v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  return v116;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (void)defaultValueDidChangeForKey:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("confidentialityWarningsVersion")))
  {
    -[PXSharingSettings setShowConfidentialityWarnings:](self, "setShowConfidentialityWarnings:", 1);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PXSharingSettings;
    -[PXSettings defaultValueDidChangeForKey:](&v5, sel_defaultValueDidChangeForKey_, v4);
  }

}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  __CFString *v7;
  __CFString *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[PXSharingSettings description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PXSharingSettings showConfidentialityWarnings](self, "showConfidentialityWarnings");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  v8 = v7;
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tShow Confidentiality Warnings: %@"), v8);

  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tConfidentiality Warnings Version: %ld"), -[PXSharingSettings confidentialityWarningsVersion](self, "confidentialityWarningsVersion"));
  return v5;
}

- (BOOL)showConfidentialityWarnings
{
  return self->_showConfidentialityWarnings;
}

- (BOOL)disableMailDrop
{
  return self->_disableMailDrop;
}

- (unint64_t)maxMessagesAssetLimit
{
  return self->_maxMessagesAssetLimit;
}

- (unint64_t)maxMailPhotoLimit
{
  return self->_maxMailPhotoLimit;
}

- (BOOL)showInternalGIFExport
{
  return self->_showInternalGIFExport;
}

- (BOOL)allowCopyingVideos
{
  return self->_allowCopyingVideos;
}

- (unint64_t)confidentialityWarningsVersion
{
  return self->_confidentialityWarningsVersion;
}

- (BOOL)enableOneUpAnimation
{
  return self->_enableOneUpAnimation;
}

- (BOOL)allowFallbacksWhilePreparing
{
  return self->_allowFallbacksWhilePreparing;
}

- (int64_t)locationBakingComparisonStrategy
{
  return self->_locationBakingComparisonStrategy;
}

- (BOOL)disableMetadataCorrections
{
  return self->_disableMetadataCorrections;
}

- (BOOL)forceDateTimeMetadataBaking
{
  return self->_forceDateTimeMetadataBaking;
}

- (BOOL)forceLocationMetadataBaking
{
  return self->_forceLocationMetadataBaking;
}

- (BOOL)forceCaptionMetadataBaking
{
  return self->_forceCaptionMetadataBaking;
}

- (BOOL)forceAccessibilityDescriptionMetadataBaking
{
  return self->_forceAccessibilityDescriptionMetadataBaking;
}

- (BOOL)sendAssetURLsToMessages
{
  return self->_sendAssetURLsToMessages;
}

- (BOOL)simulateError
{
  return self->_simulateError;
}

- (BOOL)simulateDownloadFailure
{
  return self->_simulateDownloadFailure;
}

- (BOOL)simulateCPLNotReadyError
{
  return self->_simulateCPLNotReadyError;
}

- (BOOL)simulateLowDiskSpaceError
{
  return self->_simulateLowDiskSpaceError;
}

- (BOOL)simulateUserCloudNotAuthenticated
{
  return self->_simulateUserCloudNotAuthenticated;
}

- (BOOL)simulateMaxFilesizeLimitForGIFsInSharedAlbumsError
{
  return self->_simulateMaxFilesizeLimitForGIFsInSharedAlbumsError;
}

- (BOOL)simulateSyndicatedResourceUnavailable
{
  return self->_simulateSyndicatedResourceUnavailable;
}

- (BOOL)simulateMismatchedExportCounts
{
  return self->_simulateMismatchedExportCounts;
}

- (BOOL)showFileRadarButtonOnInternalInstalls
{
  return self->_showFileRadarButtonOnInternalInstalls;
}

- (int64_t)simulatedErrorType
{
  return self->_simulatedErrorType;
}

- (BOOL)showSingleVideoDurationInShareSheetHeader
{
  return self->_showSingleVideoDurationInShareSheetHeader;
}

- (int64_t)sharingHeaderLocationDisplayStyle
{
  return self->_sharingHeaderLocationDisplayStyle;
}

- (BOOL)provideGenericTypeIdentifiersForNilActivityTypes
{
  return self->_provideGenericTypeIdentifiersForNilActivityTypes;
}

- (void)setProvideGenericTypeIdentifiersForNilActivityTypes:(BOOL)a3
{
  self->_provideGenericTypeIdentifiersForNilActivityTypes = a3;
}

- (BOOL)showUnmodifiedOriginalsExportSwitch
{
  return self->_showUnmodifiedOriginalsExportSwitch;
}

- (BOOL)showGlobalLivenessExclusionSwitch
{
  return self->_showGlobalLivenessExclusionSwitch;
}

- (BOOL)showGlobalLocationExclusionSwitch
{
  return self->_showGlobalLocationExclusionSwitch;
}

- (BOOL)excludeLivenessByDefaultWhenSharing
{
  return self->_excludeLivenessByDefaultWhenSharing;
}

- (BOOL)excludeLocationByDefaultWhenSharing
{
  return self->_excludeLocationByDefaultWhenSharing;
}

- (BOOL)showSendAsAssetBundlesForCMM
{
  return self->_showSendAsAssetBundlesForCMM;
}

- (BOOL)showSendAsAssetBundlesForIndividualItems
{
  return self->_showSendAsAssetBundlesForIndividualItems;
}

- (BOOL)sendAsAssetBundlesByDefaultWhenSharing
{
  return self->_sendAsAssetBundlesByDefaultWhenSharing;
}

- (BOOL)savePhotosBundlesToFilesWithoutExtractingMedia
{
  return self->_savePhotosBundlesToFilesWithoutExtractingMedia;
}

- (BOOL)shouldUpdateFileCreationDatesForUnmodifiedOriginalExports
{
  return self->_shouldUpdateFileCreationDatesForUnmodifiedOriginalExports;
}

- (BOOL)shouldUpdateFileCreationDatesForRegularExports
{
  return self->_shouldUpdateFileCreationDatesForRegularExports;
}

@end
