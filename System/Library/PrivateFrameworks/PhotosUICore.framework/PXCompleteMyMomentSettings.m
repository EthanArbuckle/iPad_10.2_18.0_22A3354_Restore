@implementation PXCompleteMyMomentSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCompleteMyMomentSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXCompleteMyMomentSettings setAlwaysSortAfterAddMore:](self, "setAlwaysSortAfterAddMore:", 0);
  -[PXCompleteMyMomentSettings setInvitationsDataSourceType:](self, "setInvitationsDataSourceType:", 0);
  -[PXCompleteMyMomentSettings setPreventNilTitles:](self, "setPreventNilTitles:", 1);
  -[PXCompleteMyMomentSettings setSimulateMomentShareCreationError:](self, "setSimulateMomentShareCreationError:", 0);
  -[PXCompleteMyMomentSettings setSimulatedMomentShareCreationErrorType:](self, "setSimulatedMomentShareCreationErrorType:", 0);
  -[PXCompleteMyMomentSettings setShowTitle:](self, "setShowTitle:", 1);
  -[PXCompleteMyMomentSettings setShowSubtitle:](self, "setShowSubtitle:", 0);
  -[PXCompleteMyMomentSettings setShowOtherTitle:](self, "setShowOtherTitle:", 0);
  -[PXCompleteMyMomentSettings setShowMessage:](self, "setShowMessage:", 0);
  -[PXCompleteMyMomentSettings setShowSenderField:](self, "setShowSenderField:", 0);
  -[PXCompleteMyMomentSettings setShowPeopleSuggestions:](self, "setShowPeopleSuggestions:", 0);
  -[PXCompleteMyMomentSettings setShowMergeCandidateSuggestionsAfterBootstrapNaming:](self, "setShowMergeCandidateSuggestionsAfterBootstrapNaming:", 0);
  -[PXCompleteMyMomentSettings setReviewFlow:](self, "setReviewFlow:", 0);
  -[PXCompleteMyMomentSettings setInitialLayoutType:](self, "setInitialLayoutType:", 0);
  -[PXCompleteMyMomentSettings setAllowLayoutTransitionGesture:](self, "setAllowLayoutTransitionGesture:", 0);
  -[PXCompleteMyMomentSettings setPublishTransport:](self, "setPublishTransport:", 0);
  -[PXCompleteMyMomentSettings setPeopleSuggestionsDataSourceType:](self, "setPeopleSuggestionsDataSourceType:", 1);
  -[PXCompleteMyMomentSettings setShouldShowInlineAddButton:](self, "setShouldShowInlineAddButton:", 1);
  -[PXCompleteMyMomentSettings setAllowOneUpGesture:](self, "setAllowOneUpGesture:", 1);
  -[PXCompleteMyMomentSettings setShowFloatingBanner:](self, "setShowFloatingBanner:", 1);
  -[PXCompleteMyMomentSettings setShowProgressInGrid:](self, "setShowProgressInGrid:", 0);
  -[PXCompleteMyMomentSettings setAllowSwipeSelection:](self, "setAllowSwipeSelection:", 1);
  -[PXCompleteMyMomentSettings setSimulateImport:](self, "setSimulateImport:", 0);
  -[PXCompleteMyMomentSettings setSimulateImportFailure:](self, "setSimulateImportFailure:", 0);
  -[PXCompleteMyMomentSettings setShowProgressBannerView:](self, "setShowProgressBannerView:", 0);
  -[PXCompleteMyMomentSettings setShowProgressBannerViewPaused:](self, "setShowProgressBannerViewPaused:", 0);
  -[PXCompleteMyMomentSettings setShowAttachedHeaderView:](self, "setShowAttachedHeaderView:", 1);
  -[PXCompleteMyMomentSettings setShowSectionHeaders:](self, "setShowSectionHeaders:", 1);
  -[PXCompleteMyMomentSettings setSectionHeadersShouldFloat:](self, "setSectionHeadersShouldFloat:", 0);
  -[PXCompleteMyMomentSettings setShowStatusFooter:](self, "setShowStatusFooter:", 1);
  -[PXCompleteMyMomentSettings setDirectSendMessages:](self, "setDirectSendMessages:", 0);
  -[PXCompleteMyMomentSettings setFakeMomentShareURL:](self, "setFakeMomentShareURL:", 0);
  -[PXCompleteMyMomentSettings setAutoAcceptBubbles:](self, "setAutoAcceptBubbles:", 0);
  -[PXCompleteMyMomentSettings setSimulateDelays:](self, "setSimulateDelays:", 0);
  -[PXCompleteMyMomentSettings setShowURLInBubble:](self, "setShowURLInBubble:", 0);
  -[PXCompleteMyMomentSettings setShowDebugStatus:](self, "setShowDebugStatus:", 0);
  -[PXCompleteMyMomentSettings setAlwaysTapToRetry:](self, "setAlwaysTapToRetry:", 0);
  -[PXCompleteMyMomentSettings setOverrideNumberOfColumnsInPortrait:](self, "setOverrideNumberOfColumnsInPortrait:", 0);
  -[PXCompleteMyMomentSettings setOverrideNumberOfColumnsInLandscape:](self, "setOverrideNumberOfColumnsInLandscape:", 0);
  -[PXCompleteMyMomentSettings setUseDebugColors:](self, "setUseDebugColors:", 0);
  -[PXCompleteMyMomentSettings setSimulateMomentShareBubbleError:](self, "setSimulateMomentShareBubbleError:", 0);
  -[PXCompleteMyMomentSettings setSimulatedMomentShareBubbleErrorType:](self, "setSimulatedMomentShareBubbleErrorType:", 0);
  -[PXCompleteMyMomentSettings setShowMessageTextEntryGadget:](self, "setShowMessageTextEntryGadget:", 0);
  -[PXCompleteMyMomentSettings setSharingLinkType:](self, "setSharingLinkType:", 0);
  -[PXCompleteMyMomentSettings setGraphSuggestionEnabled:](self, "setGraphSuggestionEnabled:", 1);
  -[PXCompleteMyMomentSettings setPeopleSuggestionsTimeout:](self, "setPeopleSuggestionsTimeout:", 1.0);
  -[PXCompleteMyMomentSettings setCmmShareSheetBehavior:](self, "setCmmShareSheetBehavior:", 1);
  -[PXCompleteMyMomentSettings setDisableShareSheetAutomaticBehaviorIfADPEnabled:](self, "setDisableShareSheetAutomaticBehaviorIfADPEnabled:", 0);
  -[PXCompleteMyMomentSettings setShareSheetLinkAssetCountThreshold:](self, "setShareSheetLinkAssetCountThreshold:", 12);
  -[PXCompleteMyMomentSettings setShareSheetLinkTotalFileSizeThresholdMB:](self, "setShareSheetLinkTotalFileSizeThresholdMB:", 400);
  -[PXCompleteMyMomentSettings setShareSheetLinkSpatialVideoFileSizeThresholdMB:](self, "setShareSheetLinkSpatialVideoFileSizeThresholdMB:", 100);
  -[PXCompleteMyMomentSettings setShareSheetLinkSpatialImageFileSizeThresholdMB:](self, "setShareSheetLinkSpatialImageFileSizeThresholdMB:", 20);
  -[PXCompleteMyMomentSettings setShouldBakeInIfLivePhotoPlaybackDisabled:](self, "setShouldBakeInIfLivePhotoPlaybackDisabled:", 1);
  -[PXCompleteMyMomentSettings setShouldBakeInIfLivePhotoMuted:](self, "setShouldBakeInIfLivePhotoMuted:", 1);
  -[PXCompleteMyMomentSettings setShouldBakeInIfAdjustedByThirdParty:](self, "setShouldBakeInIfAdjustedByThirdParty:", 1);
  -[PXCompleteMyMomentSettings setShouldBakeInIfCropped:](self, "setShouldBakeInIfCropped:", 1);
  -[PXCompleteMyMomentSettings setShouldBakeInIfTimelineTrimmed:](self, "setShouldBakeInIfTimelineTrimmed:", 1);
  -[PXCompleteMyMomentSettings setShouldBakeInIfPortraitDepthEffectEnabled:](self, "setShouldBakeInIfPortraitDepthEffectEnabled:", 0);
  -[PXCompleteMyMomentSettings setShouldBakeInIfContainsPenultimateResources:](self, "setShouldBakeInIfContainsPenultimateResources:", 1);
  -[PXCompleteMyMomentSettings setShouldIncludeSpatialOvercaptureResources:](self, "setShouldIncludeSpatialOvercaptureResources:", 0);
  -[PXCompleteMyMomentSettings setSimulateShouldPromptUserToIgnoreBudgets:](self, "setSimulateShouldPromptUserToIgnoreBudgets:", 0);
  -[PXCompleteMyMomentSettings setSimulateCPLAlertOnPublish:](self, "setSimulateCPLAlertOnPublish:", 0);
  -[PXCompleteMyMomentSettings setEmulatesEmptyMomentShare:](self, "setEmulatesEmptyMomentShare:", 0);
  -[PXCompleteMyMomentSettings setDisableDescriptiveWaiting:](self, "setDisableDescriptiveWaiting:", 0);
  -[PXCompleteMyMomentSettings setDisableOneUpDescriptiveAdd:](self, "setDisableOneUpDescriptiveAdd:", 0);
  -[PXCompleteMyMomentSettings setDisableClickyOrb:](self, "setDisableClickyOrb:", 0);
  -[PXCompleteMyMomentSettings setDisablePrintAction:](self, "setDisablePrintAction:", 0);
  -[PXCompleteMyMomentSettings setDisableShareAction:](self, "setDisableShareAction:", 0);
  -[PXCompleteMyMomentSettings setDisableShowInAllPhotosAction:](self, "setDisableShowInAllPhotosAction:", 0);
  -[PXCompleteMyMomentSettings setDisableCopyAction:](self, "setDisableCopyAction:", 0);
  -[PXCompleteMyMomentSettings setDisableDetailView:](self, "setDisableDetailView:", 0);
  -[PXCompleteMyMomentSettings setSimulateAllMomentSharesAreNew:](self, "setSimulateAllMomentSharesAreNew:", 0);
  -[PXCompleteMyMomentSettings setSimulateFeatureFlagState:](self, "setSimulateFeatureFlagState:", 0);
  -[PXCompleteMyMomentSettings setSimulateCloudState:](self, "setSimulateCloudState:", 0);
  -[PXCompleteMyMomentSettings setSimulateCloudPhotosState:](self, "setSimulateCloudPhotosState:", 0);
  -[PXCompleteMyMomentSettings setSimulateCPLFeatureState:](self, "setSimulateCPLFeatureState:", 0);
  -[PXCompleteMyMomentSettings setSimulateCPLCMMFeatureState:](self, "setSimulateCPLCMMFeatureState:", 0);
  -[PXCompleteMyMomentSettings setSimulateSystemPhotoLibraryState:](self, "setSimulateSystemPhotoLibraryState:", 0);
  -[PXCompleteMyMomentSettings setSimulateCloudPhotosExitState:](self, "setSimulateCloudPhotosExitState:", 0);
}

- (void)setUseDebugColors:(BOOL)a3
{
  self->_useDebugColors = a3;
}

- (void)setSimulatedMomentShareCreationErrorType:(int64_t)a3
{
  self->_simulatedMomentShareCreationErrorType = a3;
}

- (void)setSimulatedMomentShareBubbleErrorType:(int64_t)a3
{
  self->_simulatedMomentShareBubbleErrorType = a3;
}

- (void)setSimulateSystemPhotoLibraryState:(int64_t)a3
{
  self->_simulateSystemPhotoLibraryState = a3;
}

- (void)setSimulateShouldPromptUserToIgnoreBudgets:(BOOL)a3
{
  self->_simulateShouldPromptUserToIgnoreBudgets = a3;
}

- (void)setSimulateMomentShareCreationError:(BOOL)a3
{
  self->_simulateMomentShareCreationError = a3;
}

- (void)setSimulateMomentShareBubbleError:(BOOL)a3
{
  self->_simulateMomentShareBubbleError = a3;
}

- (void)setSimulateImportFailure:(BOOL)a3
{
  self->_simulateImportFailure = a3;
}

- (void)setSimulateImport:(BOOL)a3
{
  self->_simulateImport = a3;
}

- (void)setSimulateFeatureFlagState:(int64_t)a3
{
  self->_simulateFeatureFlagState = a3;
}

- (void)setSimulateDelays:(BOOL)a3
{
  self->_simulateDelays = a3;
}

- (void)setSimulateCloudState:(int64_t)a3
{
  self->_simulateCloudState = a3;
}

- (void)setSimulateCloudPhotosState:(int64_t)a3
{
  self->_simulateCloudPhotosState = a3;
}

- (void)setSimulateCloudPhotosExitState:(int64_t)a3
{
  self->_simulateCloudPhotosExitState = a3;
}

- (void)setSimulateCPLFeatureState:(int64_t)a3
{
  self->_simulateCPLFeatureState = a3;
}

- (void)setSimulateCPLCMMFeatureState:(int64_t)a3
{
  self->_simulateCPLCMMFeatureState = a3;
}

- (void)setSimulateCPLAlertOnPublish:(BOOL)a3
{
  self->_simulateCPLAlertOnPublish = a3;
}

- (void)setSimulateAllMomentSharesAreNew:(BOOL)a3
{
  self->_simulateAllMomentSharesAreNew = a3;
}

- (void)setShowURLInBubble:(BOOL)a3
{
  self->_showURLInBubble = a3;
}

- (void)setShowTitle:(BOOL)a3
{
  self->_showTitle = a3;
}

- (void)setShowSubtitle:(BOOL)a3
{
  self->_showSubtitle = a3;
}

- (void)setShowStatusFooter:(BOOL)a3
{
  self->_showStatusFooter = a3;
}

- (void)setShowSenderField:(BOOL)a3
{
  self->_showSenderField = a3;
}

- (void)setShowSectionHeaders:(BOOL)a3
{
  self->_showSectionHeaders = a3;
}

- (void)setShowProgressInGrid:(BOOL)a3
{
  self->_showProgressInGrid = a3;
}

- (void)setShowProgressBannerViewPaused:(BOOL)a3
{
  self->_showProgressBannerViewPaused = a3;
}

- (void)setShowProgressBannerView:(BOOL)a3
{
  self->_showProgressBannerView = a3;
}

- (void)setShowPeopleSuggestions:(BOOL)a3
{
  self->_showPeopleSuggestions = a3;
}

- (void)setShowOtherTitle:(BOOL)a3
{
  self->_showOtherTitle = a3;
}

- (void)setShowMessageTextEntryGadget:(BOOL)a3
{
  self->_showMessageTextEntryGadget = a3;
}

- (void)setShowMessage:(BOOL)a3
{
  self->_showMessage = a3;
}

- (void)setShowMergeCandidateSuggestionsAfterBootstrapNaming:(BOOL)a3
{
  self->_showMergeCandidateSuggestionsAfterBootstrapNaming = a3;
}

- (void)setShowFloatingBanner:(BOOL)a3
{
  self->_showFloatingBanner = a3;
}

- (void)setShowDebugStatus:(BOOL)a3
{
  self->_showDebugStatus = a3;
}

- (void)setShowAttachedHeaderView:(BOOL)a3
{
  self->_showAttachedHeaderView = a3;
}

- (void)setShouldShowInlineAddButton:(BOOL)a3
{
  self->_shouldShowInlineAddButton = a3;
}

- (void)setShouldIncludeSpatialOvercaptureResources:(BOOL)a3
{
  self->_shouldIncludeSpatialOvercaptureResources = a3;
}

- (void)setShouldBakeInIfTimelineTrimmed:(BOOL)a3
{
  self->_shouldBakeInIfTimelineTrimmed = a3;
}

- (void)setShouldBakeInIfPortraitDepthEffectEnabled:(BOOL)a3
{
  self->_shouldBakeInIfPortraitDepthEffectEnabled = a3;
}

- (void)setShouldBakeInIfLivePhotoPlaybackDisabled:(BOOL)a3
{
  self->_shouldBakeInIfLivePhotoPlaybackDisabled = a3;
}

- (void)setShouldBakeInIfLivePhotoMuted:(BOOL)a3
{
  self->_shouldBakeInIfLivePhotoMuted = a3;
}

- (void)setShouldBakeInIfCropped:(BOOL)a3
{
  self->_shouldBakeInIfCropped = a3;
}

- (void)setShouldBakeInIfContainsPenultimateResources:(BOOL)a3
{
  self->_shouldBakeInIfContainsPenultimateResources = a3;
}

- (void)setShouldBakeInIfAdjustedByThirdParty:(BOOL)a3
{
  self->_shouldBakeInIfAdjustedByThirdParty = a3;
}

- (void)setSharingLinkType:(int64_t)a3
{
  self->_sharingLinkType = a3;
}

- (void)setShareSheetLinkTotalFileSizeThresholdMB:(unint64_t)a3
{
  self->_shareSheetLinkTotalFileSizeThresholdMB = a3;
}

- (void)setShareSheetLinkSpatialVideoFileSizeThresholdMB:(unint64_t)a3
{
  self->_shareSheetLinkSpatialVideoFileSizeThresholdMB = a3;
}

- (void)setShareSheetLinkAssetCountThreshold:(int64_t)a3
{
  self->_shareSheetLinkAssetCountThreshold = a3;
}

- (void)setSectionHeadersShouldFloat:(BOOL)a3
{
  self->_sectionHeadersShouldFloat = a3;
}

- (void)setReviewFlow:(int64_t)a3
{
  self->_reviewFlow = a3;
}

- (void)setPublishTransport:(int64_t)a3
{
  self->_publishTransport = a3;
}

- (void)setPreventNilTitles:(BOOL)a3
{
  self->_preventNilTitles = a3;
}

- (void)setPeopleSuggestionsTimeout:(double)a3
{
  self->_peopleSuggestionsTimeout = a3;
}

- (void)setPeopleSuggestionsDataSourceType:(int64_t)a3
{
  self->_peopleSuggestionsDataSourceType = a3;
}

- (void)setOverrideNumberOfColumnsInPortrait:(int64_t)a3
{
  self->_overrideNumberOfColumnsInPortrait = a3;
}

- (void)setOverrideNumberOfColumnsInLandscape:(int64_t)a3
{
  self->_overrideNumberOfColumnsInLandscape = a3;
}

- (void)setInvitationsDataSourceType:(int64_t)a3
{
  self->_invitationsDataSourceType = a3;
}

- (void)setInitialLayoutType:(int64_t)a3
{
  self->_initialLayoutType = a3;
}

- (void)setGraphSuggestionEnabled:(BOOL)a3
{
  self->_graphSuggestionEnabled = a3;
}

- (void)setFakeMomentShareURL:(BOOL)a3
{
  self->_fakeMomentShareURL = a3;
}

- (void)setEmulatesEmptyMomentShare:(BOOL)a3
{
  self->_emulatesEmptyMomentShare = a3;
}

- (void)setDisableShowInAllPhotosAction:(BOOL)a3
{
  self->_disableShowInAllPhotosAction = a3;
}

- (void)setDisableShareSheetAutomaticBehaviorIfADPEnabled:(BOOL)a3
{
  self->_disableShareSheetAutomaticBehaviorIfADPEnabled = a3;
}

- (void)setDisableShareAction:(BOOL)a3
{
  self->_disableShareAction = a3;
}

- (void)setDisablePrintAction:(BOOL)a3
{
  self->_disablePrintAction = a3;
}

- (void)setDisableOneUpDescriptiveAdd:(BOOL)a3
{
  self->_disableOneUpDescriptiveAdd = a3;
}

- (void)setDisableDetailView:(BOOL)a3
{
  self->_disableDetailView = a3;
}

- (void)setDisableDescriptiveWaiting:(BOOL)a3
{
  self->_disableDescriptiveWaiting = a3;
}

- (void)setDisableCopyAction:(BOOL)a3
{
  self->_disableCopyAction = a3;
}

- (void)setDisableClickyOrb:(BOOL)a3
{
  self->_disableClickyOrb = a3;
}

- (void)setDirectSendMessages:(BOOL)a3
{
  self->_directSendMessages = a3;
}

- (void)setCmmShareSheetBehavior:(int64_t)a3
{
  self->_cmmShareSheetBehavior = a3;
}

- (void)setAutoAcceptBubbles:(BOOL)a3
{
  self->_autoAcceptBubbles = a3;
}

- (void)setAlwaysTapToRetry:(BOOL)a3
{
  self->_alwaysTapToRetry = a3;
}

- (void)setAlwaysSortAfterAddMore:(BOOL)a3
{
  self->_alwaysSortAfterAddMore = a3;
}

- (void)setAllowSwipeSelection:(BOOL)a3
{
  self->_allowSwipeSelection = a3;
}

- (void)setAllowOneUpGesture:(BOOL)a3
{
  self->_allowOneUpGesture = a3;
}

- (void)setAllowLayoutTransitionGesture:(BOOL)a3
{
  self->_allowLayoutTransitionGesture = a3;
}

- (void)setWorkflowCoordinator:(id)a3
{
  objc_setAssociatedObject(self, (const void *)PXCMMWorkflowCoordinatorAssociationKey, a3, (void *)1);
}

- (PXCMMWorkflowCoordinator)workflowCoordinator
{
  PXCMMWorkflowCoordinator *v3;

  objc_getAssociatedObject(self, (const void *)PXCMMWorkflowCoordinatorAssociationKey);
  v3 = (PXCMMWorkflowCoordinator *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(PXCMMWorkflowCoordinator);
    -[PXCMMWorkflowCoordinator setDelegate:](v3, "setDelegate:", self);
    objc_setAssociatedObject(self, (const void *)PXCMMWorkflowCoordinatorAssociationKey, v3, (void *)1);
  }
  return v3;
}

- (void)workflowCoordinator:(id)a3 workflowViewController:(id)a4 didFinishSession:(id)a5 withActivityState:(unint64_t)a6
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  -[PXCompleteMyMomentSettings workflowCoordinator](self, "workflowCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", 0);

  -[PXCompleteMyMomentSettings setWorkflowCoordinator:](self, "setWorkflowCoordinator:", 0);
  objc_msgSend(v7, "presentingViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);
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
  uint64_t v63;
  uint64_t v64;
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
  uint64_t v80;
  uint64_t v81;
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
  uint64_t v92;
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
  void *v197;
  void *v198;
  void *v199;
  _QWORD v200[12];
  void *v201;
  _QWORD v202[7];
  void *v203;
  _QWORD v204[10];
  _QWORD v205[7];
  _QWORD v206[5];
  void *v207;
  _QWORD v208[3];
  _QWORD v209[13];
  _QWORD v210[6];
  _QWORD v211[14];
  _QWORD v212[3];
  _QWORD v213[5];

  v213[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Share Sheet Behavior"), CFSTR("cmmShareSheetBehavior"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "possibleValues:titles:", &unk_1E53E97E0, &unk_1E53E97F8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v213[0] = v4;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Asset Count Threshold"), CFSTR("shareSheetLinkAssetCountThreshold"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue:maxValue:", 0.0, 20.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "px_increment:", 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v213[1] = v7;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Asset Total Size Threshold (MB)"), CFSTR("shareSheetLinkTotalFileSizeThresholdMB"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue:maxValue:", 0.0, 500.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "px_increment:", 10.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v213[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v213, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v11, CFSTR("Share Sheet"));
  v199 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Sharing Link Type"), CFSTR("sharingLinkType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "possibleValues:titles:", &unk_1E53E9810, &unk_1E53E9828);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v212[0] = v14;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Graph Suggestions"), CFSTR("graphSuggestionEnabled"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v212[1] = v15;
  v16 = (void *)MEMORY[0x1E0D830F8];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("graphSuggestionEnabled == YES"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "px_rowWithTitle:valueKeyPath:condition:", CFSTR("People Graph Timeout"), CFSTR("peopleSuggestionsTimeout"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "minValue:maxValue:", 0.0, 10.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "px_increment:", 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v212[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v212, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionWithRows:title:", v21, CFSTR("Compose Recipient Settings"));
  v198 = (void *)objc_claimAutoreleasedReturnValue();

  v175 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Publish Transport"), CFSTR("publishTransport"));
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "possibleValues:titles:", &unk_1E53E9840, &unk_1E53E9858);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v211[0] = v190;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("People Suggestions DS"), CFSTR("peopleSuggestionsDataSourceType"));
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "possibleValues:titles:", &unk_1E53E9870, &unk_1E53E9888);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v211[1] = v184;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Initial grid layout"), CFSTR("initialLayoutType"));
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "possibleValues:titles:", &unk_1E53E98A0, &unk_1E53E98B8);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v211[2] = v178;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Allow one up"), CFSTR("allowOneUpGesture"));
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v211[3] = v172;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Allow Swipe Selection"), CFSTR("allowSwipeSelection"));
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v211[4] = v168;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Disable Descriptive Add"), CFSTR("disableOneUpDescriptiveAdd"));
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v211[5] = v165;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Disable Descriptive Waiting"), CFSTR("disableDescriptiveWaiting"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v211[6] = v162;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Disable Clicky Orb"), CFSTR("disableClickyOrb"));
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v211[7] = v158;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Disable Share Action"), CFSTR("disableShareAction"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v211[8] = v153;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Disable Print Action"), CFSTR("disablePrintAction"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v211[9] = v22;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Disable Show in All Photos"), CFSTR("disableShowInAllPhotosAction"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v211[10] = v23;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Disable Copy Action"), CFSTR("disableCopyAction"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v211[11] = v24;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Disable Detail View"), CFSTR("disableDetailView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v211[12] = v25;
  v26 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(a1, "_enableAllCmmImprovementsAction");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rowWithTitle:action:", CFSTR("Enable Azul CMM Additions"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_enabledAllCmmImprovementsActionPredicate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "condition:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v211[13] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v211, 14);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "sectionWithRows:title:", v31, CFSTR("Review Settings"));
  v197 = (void *)objc_claimAutoreleasedReturnValue();

  v194 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Empty Moment Share"), CFSTR("emulatesEmptyMomentShare"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v210[0] = v32;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Budget Prompt During Publish"), CFSTR("simulateShouldPromptUserToIgnoreBudgets"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v210[1] = v33;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("CPL Alert During Publish"), CFSTR("simulateCPLAlertOnPublish"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v210[2] = v34;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Asset Import"), CFSTR("simulateImport"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v210[3] = v35;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Import Failure"), CFSTR("simulateImportFailure"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("simulateImport == YES"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "condition:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v210[4] = v38;
  v39 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateAllMomentSharesAreNew);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "rowWithTitle:valueKeyPath:", CFSTR("All Moment Shares Are New"), v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v210[5] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v210, 6);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "sectionWithRows:title:", v42, CFSTR("Simulation"));
  v195 = (void *)objc_claimAutoreleasedReturnValue();

  v191 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Review Flow"), CFSTR("reviewFlow"));
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "possibleValues:titles:", &unk_1E53E98D0, &unk_1E53E98E8);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v209[0] = v185;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Layout transition gesture"), CFSTR("allowLayoutTransitionGesture"));
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v209[1] = v182;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Assets Data Source"), CFSTR("reviewFlowDataSourceType"));
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "possibleValues:titles:", &unk_1E53E9900, &unk_1E53E9918);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v209[2] = v176;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Inline Header View"), CFSTR("showAttachedHeaderView"));
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v209[3] = v173;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Floating Banner"), CFSTR("showFloatingBanner"));
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v209[4] = v169;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Section Headers"), CFSTR("showSectionHeaders"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v209[5] = v43;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Section Headers Float"), CFSTR("sectionHeadersShouldFloat"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v209[6] = v44;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Progress in Grid"), CFSTR("showProgressInGrid"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v209[7] = v45;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Inline add button"), CFSTR("shouldShowInlineAddButton"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v209[8] = v46;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Always Sort All after AddMore"), CFSTR("alwaysSortAfterAddMore"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v209[9] = v47;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Progress Banner View"), CFSTR("showProgressBannerView"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v209[10] = v48;
  v49 = (void *)MEMORY[0x1E0D83108];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("showProgressBannerView == YES"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "px_rowWithTitle:valueKeyPath:condition:", CFSTR("Show Progress Banner View Paused"), CFSTR("showProgressBannerViewPaused"), v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v209[11] = v51;
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Test Review Flow"), &__block_literal_global_120314);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v209[12] = v52;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v209, 13);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "sectionWithRows:title:", v53, CFSTR("Review UI Debug"));
  v192 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Datasource"), CFSTR("invitationsDataSourceType"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "possibleValues:titles:", &unk_1E53E9930, &unk_1E53E9948);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v208[0] = v56;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Prevent Nil Titles"), CFSTR("preventNilTitles"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v208[1] = v57;
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Simulate Going-To-Expire CMM Notification"), &__block_literal_global_402);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v208[2] = v58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v208, 3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "sectionWithRows:title:", v59, CFSTR("Invitations"));
  v189 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Test Incoming Controller"), &__block_literal_global_419_120323);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v207 = v61;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v207, 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "sectionWithRows:title:", v62, CFSTR("Incoming"));
  v180 = (void *)objc_claimAutoreleasedReturnValue();

  PXCMMSettingsSimulateFetchErrorTypes();
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  PXCMMSettingsSimulateFetchErrorTypeTitles();
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  PXCMMSettingsSimulateErrorTypes();
  v63 = objc_claimAutoreleasedReturnValue();
  PXCMMSettingsSimulateErrorTypeTitles();
  v64 = objc_claimAutoreleasedReturnValue();
  v170 = (void *)MEMORY[0x1E0D83078];
  v65 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_simulateFetchErrorType);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "rowWithTitle:valueKeyPath:", CFSTR("Fetch Error"), v166);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "possibleValues:titles:", v186, v183);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v206[0] = v159;
  v66 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateMomentShareCreationError);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "rowWithTitle:valueKeyPath:", CFSTR("Create Error"), v154);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v206[1] = v149;
  v67 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_simulatedMomentShareCreationErrorType);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "rowWithTitle:valueKeyPath:", CFSTR("Create Error Type"), v145);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = (void *)v64;
  v177 = (void *)v63;
  objc_msgSend(v142, "possibleValues:titles:", v63, v64);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("simulateMomentShareCreationError != 0"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "condition:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v206[2] = v69;
  v70 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateMomentShareBubbleError);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "rowWithTitle:valueKeyPath:", CFSTR("Message Bubble Error"), v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v206[3] = v72;
  v73 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_simulatedMomentShareBubbleErrorType);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "rowWithTitle:valueKeyPath:", CFSTR("Message Bubble Error Type"), v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "possibleValues:titles:", v63, v64);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("simulateMomentShareBubbleError != 0"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "condition:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v206[4] = v78;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v206, 5);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "sectionWithRows:title:", v79, CFSTR("Error Simulation"));
  v171 = (void *)objc_claimAutoreleasedReturnValue();

  PXCMMSimulateCapabilitySourceStates();
  v80 = objc_claimAutoreleasedReturnValue();
  PXCMMSimulateCapabilitySourceStateTitles();
  v81 = objc_claimAutoreleasedReturnValue();
  v160 = (void *)MEMORY[0x1E0D83078];
  v82 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_simulateFeatureFlagState);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "rowWithTitle:valueKeyPath:", CFSTR("Feature Flag State"), v155);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "possibleValues:titles:", v80, v81);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v205[0] = v146;
  v83 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_simulateCloudState);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "rowWithTitle:valueKeyPath:", CFSTR("Cloud State"), v143);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "possibleValues:titles:", v80, v81);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v205[1] = v137;
  v84 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_simulateCloudPhotosState);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "rowWithTitle:valueKeyPath:", CFSTR("Cloud Photos State"), v136);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "possibleValues:titles:", v80, v81);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v205[2] = v134;
  v85 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_simulateCPLFeatureState);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "rowWithTitle:valueKeyPath:", CFSTR("CPL Feature State"), v133);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "possibleValues:titles:", v80, v81);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v205[3] = v131;
  v86 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_simulateCPLCMMFeatureState);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "rowWithTitle:valueKeyPath:", CFSTR("CPL CMM Feature State"), v130);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "possibleValues:titles:", v80, v81);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v205[4] = v88;
  v89 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_simulateSystemPhotoLibraryState);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "rowWithTitle:valueKeyPath:", CFSTR("System Photo Library State"), v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v80;
  v164 = (void *)v81;
  v167 = (void *)v80;
  objc_msgSend(v91, "possibleValues:titles:", v80, v81);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v205[5] = v93;
  v94 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_simulateCloudPhotosExitState);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "rowWithTitle:valueKeyPath:", CFSTR("CPL Exit State"), v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "possibleValues:titles:", v92, v81);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v205[6] = v97;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v205, 7);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "sectionWithRows:title:", v98, CFSTR("Capabilities Simulation"));
  v161 = (void *)objc_claimAutoreleasedReturnValue();

  v156 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Direct Send"), CFSTR("directSendMessages"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v204[0] = v151;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Fake PHMomentShare URL"), CFSTR("fakeMomentShareURL"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v204[1] = v147;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Auto Accept Bubbles"), CFSTR("autoAcceptBubbles"));
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v204[2] = v144;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Simulate Delays"), CFSTR("simulateDelays"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v204[3] = v141;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show URL In Bubble"), CFSTR("showURLInBubble"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v204[4] = v138;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Debug Status"), CFSTR("showDebugStatus"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v204[5] = v99;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Always Tap to Retry"), CFSTR("alwaysTapToRetry"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v204[6] = v100;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Columns in Portrait (Override)"), CFSTR("overrideNumberOfColumnsInPortrait"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "minValue:maxValue:", 0.0, 8.0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "px_increment:", 1.0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v204[7] = v103;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Columns in Landscape (Override)"), CFSTR("overrideNumberOfColumnsInLandscape"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "minValue:maxValue:", 0.0, 8.0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "px_increment:", 1.0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v204[8] = v106;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Debug Colors"), CFSTR("useDebugColors"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v204[9] = v107;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v204, 10);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "sectionWithRows:title:", v108, CFSTR("Messages Extension"));
  v157 = (void *)objc_claimAutoreleasedReturnValue();

  v109 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Message Text Entry"), CFSTR("showMessageTextEntryGadget"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v203 = v110;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v203, 1);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "sectionWithRows:title:", v111, CFSTR("Messages Debug Sections"));
  v152 = (void *)objc_claimAutoreleasedReturnValue();

  v112 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Live Photo Disabled"), CFSTR("shouldBakeInIfLivePhotoPlaybackDisabled"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v202[0] = v113;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Live Photo Muted"), CFSTR("shouldBakeInIfLivePhotoMuted"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v202[1] = v114;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Has 3rd Party Adjustments"), CFSTR("shouldBakeInIfAdjustedByThirdParty"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v202[2] = v115;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Cropped"), CFSTR("shouldBakeInIfCropped"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v202[3] = v116;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Timeline Trimmed"), CFSTR("shouldBakeInIfTimelineTrimmed"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v202[4] = v117;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Portrait Effect Applied"), CFSTR("shouldBakeInIfPortraitDepthEffectEnabled"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v202[5] = v118;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Has Penultimate Resources"), CFSTR("shouldBakeInIfContainsPenultimateResources"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v202[6] = v119;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v202, 7);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "sectionWithRows:title:", v120, CFSTR("Automatically Bake In Adjustments If:"));
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  v121 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Include Spatial Overcapture Resources"), CFSTR("shouldIncludeSpatialOvercaptureResources"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v201 = v122;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v201, 1);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "sectionWithRows:title:", v123, CFSTR("Asset Creation Options"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v200[0] = v199;
  v200[1] = v197;
  v200[2] = v195;
  v200[3] = v198;
  v200[4] = v192;
  v200[5] = v189;
  v200[6] = v171;
  v200[7] = v161;
  v200[8] = v180;
  v200[9] = v157;
  v200[10] = v152;
  v200[11] = v148;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v200, 12);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = (void *)objc_msgSend(v126, "mutableCopy");

  objc_msgSend(v127, "addObject:", v124);
  objc_msgSend(v127, "addObject:", v125);
  objc_msgSend(MEMORY[0x1E0D83078], "moduleWithTitle:contents:", CFSTR("Complete My Moment"), v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  return v128;
}

+ (id)transientProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PXCompleteMyMomentSettings_UI__transientProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transientProperties_onceToken_120226 != -1)
    dispatch_once(&transientProperties_onceToken_120226, block);
  return (id)transientProperties_transientProperties_120227;
}

+ (id)_enableAllCmmImprovementsAction
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__PXCompleteMyMomentSettings_UI___enableAllCmmImprovementsAction__block_invoke;
  v3[3] = &__block_descriptor_48_e33_B24__0_8__PTUIModuleController_16l;
  v3[4] = a2;
  v3[5] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_enabledAllCmmImprovementsActionPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("disableDescriptiveWaiting == YES || disableOneUpDescriptiveAdd == YES || disableClickyOrb == YES || disablePrintAction == YES || disableShareAction == YES || disableShowInAllPhotosAction == YES || disableCopyAction == YES || disableDetailView == YES"));
}

uint64_t __65__PXCompleteMyMomentSettings_UI___enableAllCmmImprovementsAction__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;

  objc_msgSend(a3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v7, v8, CFSTR("PXCompleteMyMomentSettings+UI.m"), 273, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("moduleController.settings"), v10);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v11, v12, CFSTR("PXCompleteMyMomentSettings+UI.m"), 273, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("moduleController.settings"), v10, v14);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v4, "setDisableDescriptiveWaiting:", 0);
  objc_msgSend(v4, "setDisableOneUpDescriptiveAdd:", 0);
  objc_msgSend(v4, "setDisableClickyOrb:", 0);
  objc_msgSend(v4, "setDisablePrintAction:", 0);
  objc_msgSend(v4, "setDisableShareAction:", 0);
  objc_msgSend(v4, "setDisableShowInAllPhotosAction:", 0);
  objc_msgSend(v4, "setDisableCopyAction:", 0);
  objc_msgSend(v4, "setDisableDetailView:", 0);

  return 1;
}

void __53__PXCompleteMyMomentSettings_UI__transientProperties__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___PXCompleteMyMomentSettings;
  objc_msgSendSuper2(&v5, sel_transientProperties);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_workflowCoordinator);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObject:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)transientProperties_transientProperties_120227;
  transientProperties_transientProperties_120227 = v3;

}

void __58__PXCompleteMyMomentSettings_UI__settingsControllerModule__block_invoke_2_418(uint64_t a1, void *a2)
{
  id v2;
  PXCMMSharedAlbumsInvitationsDataSourceManager *v3;
  void *v4;
  PXDebugCMMIncomingTableViewController *v5;
  PXCMMSharedAlbumsInvitationsDataSourceManager *v6;

  v2 = a2;
  v3 = [PXCMMSharedAlbumsInvitationsDataSourceManager alloc];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXCMMSharedAlbumsInvitationsDataSourceManager initWithPhotoLibrary:](v3, "initWithPhotoLibrary:", v4);

  v5 = -[PXDebugCMMIncomingTableViewController initWithDataSourceManager:]([PXDebugCMMIncomingTableViewController alloc], "initWithDataSourceManager:", v6);
  objc_msgSend(v2, "px_presentViewControllerInNavigationController:animated:dimissButtonLocation:completion:", v5, 1, 0, 0);

}

void __58__PXCompleteMyMomentSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CD1680], "invitedMomentSharesExpiringInDays:", 50);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = v4;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__120446;
    v19 = __Block_byref_object_dispose__120447;
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__PXCompleteMyMomentSettings_UI__settingsControllerModule__block_invoke_405;
    v12[3] = &unk_1E5129768;
    v7 = v6;
    v13 = v7;
    v14 = &v15;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v12);
    if (v5 < 2)
    {
      v8 = CFSTR("You have an invitation that is about to expire.");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("You have %lu invitations that are about to expire."), v5);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetsdClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "notificationClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "asyncNotifyExpiringMomentShareWithUUIDs:thumbnailImageData:notificationTitle:notificationSubtitle:", v7, v16[5], CFSTR("Complete My Moment"), v8);
    _Block_object_dispose(&v15, 8);

  }
}

void __58__PXCompleteMyMomentSettings_UI__settingsControllerModule__block_invoke_405(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v11 = v3;
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(v11, "preview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "previewImageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

void __58__PXCompleteMyMomentSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = (void *)MEMORY[0x1E0CD16F8];
  v3 = a2;
  objc_msgSend(v2, "px_deprecated_appPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  PXCMMCreateDebugCMMContext(v4, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;

  if (v5)
  {
    +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "workflowCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "workflowViewControllerWithContext:embedInNavigationControllerOfClass:", v5, objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("No context was created"), v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v10);

  }
  objc_msgSend(v3, "presentViewController:animated:completion:", v9, 1, 0);

}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (int64_t)cmmShareSheetBehavior
{
  return self->_cmmShareSheetBehavior;
}

- (BOOL)disableShareSheetAutomaticBehaviorIfADPEnabled
{
  return self->_disableShareSheetAutomaticBehaviorIfADPEnabled;
}

- (int64_t)shareSheetLinkAssetCountThreshold
{
  return self->_shareSheetLinkAssetCountThreshold;
}

- (unint64_t)shareSheetLinkTotalFileSizeThresholdMB
{
  return self->_shareSheetLinkTotalFileSizeThresholdMB;
}

- (unint64_t)shareSheetLinkSpatialVideoFileSizeThresholdMB
{
  return self->_shareSheetLinkSpatialVideoFileSizeThresholdMB;
}

- (unint64_t)shareSheetLinkSpatialImageFileSizeThresholdMB
{
  return self->_shareSheetLinkSpatialImageFileSizeThresholdMB;
}

- (void)setShareSheetLinkSpatialImageFileSizeThresholdMB:(unint64_t)a3
{
  self->_shareSheetLinkSpatialImageFileSizeThresholdMB = a3;
}

- (BOOL)alwaysSortAfterAddMore
{
  return self->_alwaysSortAfterAddMore;
}

- (int64_t)invitationsDataSourceType
{
  return self->_invitationsDataSourceType;
}

- (BOOL)preventNilTitles
{
  return self->_preventNilTitles;
}

- (BOOL)simulateMomentShareCreationError
{
  return self->_simulateMomentShareCreationError;
}

- (int64_t)simulatedMomentShareCreationErrorType
{
  return self->_simulatedMomentShareCreationErrorType;
}

- (BOOL)showTitle
{
  return self->_showTitle;
}

- (BOOL)showSubtitle
{
  return self->_showSubtitle;
}

- (BOOL)showOtherTitle
{
  return self->_showOtherTitle;
}

- (BOOL)showMessage
{
  return self->_showMessage;
}

- (BOOL)showSenderField
{
  return self->_showSenderField;
}

- (BOOL)showPeopleSuggestions
{
  return self->_showPeopleSuggestions;
}

- (BOOL)showMergeCandidateSuggestionsAfterBootstrapNaming
{
  return self->_showMergeCandidateSuggestionsAfterBootstrapNaming;
}

- (int64_t)publishTransport
{
  return self->_publishTransport;
}

- (int64_t)peopleSuggestionsDataSourceType
{
  return self->_peopleSuggestionsDataSourceType;
}

- (int64_t)initialLayoutType
{
  return self->_initialLayoutType;
}

- (BOOL)allowOneUpGesture
{
  return self->_allowOneUpGesture;
}

- (BOOL)allowSwipeSelection
{
  return self->_allowSwipeSelection;
}

- (BOOL)simulateImport
{
  return self->_simulateImport;
}

- (BOOL)simulateImportFailure
{
  return self->_simulateImportFailure;
}

- (BOOL)simulateShouldPromptUserToIgnoreBudgets
{
  return self->_simulateShouldPromptUserToIgnoreBudgets;
}

- (BOOL)simulateCPLAlertOnPublish
{
  return self->_simulateCPLAlertOnPublish;
}

- (BOOL)emulatesEmptyMomentShare
{
  return self->_emulatesEmptyMomentShare;
}

- (BOOL)disableOneUpDescriptiveAdd
{
  return self->_disableOneUpDescriptiveAdd;
}

- (BOOL)disableDescriptiveWaiting
{
  return self->_disableDescriptiveWaiting;
}

- (BOOL)disableClickyOrb
{
  return self->_disableClickyOrb;
}

- (BOOL)disablePrintAction
{
  return self->_disablePrintAction;
}

- (BOOL)disableShareAction
{
  return self->_disableShareAction;
}

- (BOOL)disableShowInAllPhotosAction
{
  return self->_disableShowInAllPhotosAction;
}

- (BOOL)disableCopyAction
{
  return self->_disableCopyAction;
}

- (BOOL)disableDetailView
{
  return self->_disableDetailView;
}

- (BOOL)simulateAllMomentSharesAreNew
{
  return self->_simulateAllMomentSharesAreNew;
}

- (int64_t)reviewFlow
{
  return self->_reviewFlow;
}

- (int64_t)reviewFlowDataSourceType
{
  return self->_reviewFlowDataSourceType;
}

- (void)setReviewFlowDataSourceType:(int64_t)a3
{
  self->_reviewFlowDataSourceType = a3;
}

- (BOOL)allowLayoutTransitionGesture
{
  return self->_allowLayoutTransitionGesture;
}

- (BOOL)shouldShowInlineAddButton
{
  return self->_shouldShowInlineAddButton;
}

- (BOOL)showAttachedHeaderView
{
  return self->_showAttachedHeaderView;
}

- (BOOL)showFloatingBanner
{
  return self->_showFloatingBanner;
}

- (BOOL)showSectionHeaders
{
  return self->_showSectionHeaders;
}

- (BOOL)sectionHeadersShouldFloat
{
  return self->_sectionHeadersShouldFloat;
}

- (BOOL)showStatusFooter
{
  return self->_showStatusFooter;
}

- (BOOL)showProgressInGrid
{
  return self->_showProgressInGrid;
}

- (BOOL)showProgressBannerView
{
  return self->_showProgressBannerView;
}

- (BOOL)showProgressBannerViewPaused
{
  return self->_showProgressBannerViewPaused;
}

- (BOOL)directSendMessages
{
  return self->_directSendMessages;
}

- (BOOL)fakeMomentShareURL
{
  return self->_fakeMomentShareURL;
}

- (BOOL)autoAcceptBubbles
{
  return self->_autoAcceptBubbles;
}

- (BOOL)simulateDelays
{
  return self->_simulateDelays;
}

- (BOOL)showURLInBubble
{
  return self->_showURLInBubble;
}

- (BOOL)showDebugStatus
{
  return self->_showDebugStatus;
}

- (BOOL)alwaysTapToRetry
{
  return self->_alwaysTapToRetry;
}

- (int64_t)overrideNumberOfColumnsInPortrait
{
  return self->_overrideNumberOfColumnsInPortrait;
}

- (int64_t)overrideNumberOfColumnsInLandscape
{
  return self->_overrideNumberOfColumnsInLandscape;
}

- (BOOL)useDebugColors
{
  return self->_useDebugColors;
}

- (BOOL)simulateMomentShareBubbleError
{
  return self->_simulateMomentShareBubbleError;
}

- (int64_t)simulatedMomentShareBubbleErrorType
{
  return self->_simulatedMomentShareBubbleErrorType;
}

- (BOOL)showMessageTextEntryGadget
{
  return self->_showMessageTextEntryGadget;
}

- (int64_t)sharingLinkType
{
  return self->_sharingLinkType;
}

- (BOOL)graphSuggestionEnabled
{
  return self->_graphSuggestionEnabled;
}

- (double)peopleSuggestionsTimeout
{
  return self->_peopleSuggestionsTimeout;
}

- (BOOL)shouldBakeInIfLivePhotoPlaybackDisabled
{
  return self->_shouldBakeInIfLivePhotoPlaybackDisabled;
}

- (BOOL)shouldBakeInIfLivePhotoMuted
{
  return self->_shouldBakeInIfLivePhotoMuted;
}

- (BOOL)shouldBakeInIfAdjustedByThirdParty
{
  return self->_shouldBakeInIfAdjustedByThirdParty;
}

- (BOOL)shouldBakeInIfCropped
{
  return self->_shouldBakeInIfCropped;
}

- (BOOL)shouldBakeInIfTimelineTrimmed
{
  return self->_shouldBakeInIfTimelineTrimmed;
}

- (BOOL)shouldBakeInIfPortraitDepthEffectEnabled
{
  return self->_shouldBakeInIfPortraitDepthEffectEnabled;
}

- (BOOL)shouldBakeInIfContainsPenultimateResources
{
  return self->_shouldBakeInIfContainsPenultimateResources;
}

- (BOOL)shouldIncludeSpatialOvercaptureResources
{
  return self->_shouldIncludeSpatialOvercaptureResources;
}

- (int64_t)simulateFetchErrorType
{
  return self->_simulateFetchErrorType;
}

- (void)setSimulateFetchErrorType:(int64_t)a3
{
  self->_simulateFetchErrorType = a3;
}

- (int64_t)simulateFeatureFlagState
{
  return self->_simulateFeatureFlagState;
}

- (int64_t)simulateCloudState
{
  return self->_simulateCloudState;
}

- (int64_t)simulateCloudPhotosState
{
  return self->_simulateCloudPhotosState;
}

- (int64_t)simulateCPLFeatureState
{
  return self->_simulateCPLFeatureState;
}

- (int64_t)simulateCPLCMMFeatureState
{
  return self->_simulateCPLCMMFeatureState;
}

- (int64_t)simulateSystemPhotoLibraryState
{
  return self->_simulateSystemPhotoLibraryState;
}

- (int64_t)simulateCloudPhotosExitState
{
  return self->_simulateCloudPhotosExitState;
}

+ (PXCompleteMyMomentSettings)sharedInstance
{
  if (sharedInstance_onceToken_144153 != -1)
    dispatch_once(&sharedInstance_onceToken_144153, &__block_literal_global_144154);
  return (PXCompleteMyMomentSettings *)(id)sharedInstance_sharedInstance_144155;
}

void __44__PXCompleteMyMomentSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "completeMyMoment");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_144155;
  sharedInstance_sharedInstance_144155 = v0;

}

@end
