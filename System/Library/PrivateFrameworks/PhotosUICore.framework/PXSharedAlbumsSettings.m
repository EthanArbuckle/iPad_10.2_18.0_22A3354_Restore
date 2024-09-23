@implementation PXSharedAlbumsSettings

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSharedAlbumsSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  self->_shouldSimulateSharedAlbumsUnavailable = 0;
  self->_activityEntryAllowsMultipleLikeContributors = 1;
  self->_activityEntryAssetsAddedBatchingBehavior = 2;
  self->_shelfBehavior = 1;
  self->_showParticipantCountBadges = 0;
  self->_lemonadeActivityShelfUseActivityEntries = 1;
  self->_lemonadeActivityShelfPlaceholderBehavior = 0;
  self->_lemonadeActivityShelfAlwaysAppearUnread = 0;
  self->_lemonadeActivityShelfAvatarAppearsAsOverlay = 1;
  self->_lemonadeActivityShelfPreventUpdatingUnreadState = 0;
  self->_lemonadeActivityShelfShouldOpenActivityFeedModallyByItself = 0;
  self->_lemonadeActivityFeedUseActivityEntries = 1;
  self->_activityEntryFeedLoadMoreBatchSize = 75;
  self->_lemonadeActivityFeedMultipleAssetsBehavior = 1;
  self->_activityEntryFeedUseOnlyCompactCells = 0;
  self->_activityEntryFeedCompactCellDisplayStyle = 1;
  self->_activityEntryFeedAutoplaysVideosInline = 1;
  self->_activityEntryFeedFollowsReadableWidth = 1;
  self->_activityEntryFeedReadableWidth = 800.0;
  self->_activityEntryFeedDrawDebugBackgrounds = 0;
  self->_useLemonadeSettingsView = 1;
  self->_showPublishingButtonSpinner = 0;
  self->_showPublishingProgressDialog = 1;
  self->_allowEmptyAddressesForDebugging = 0;
  self->_alwaysShowSpatialMediaDataLossAlertForSpatialMedia = 0;
  self->_simulateEmptyActivityEntries = 0;
  self->_simulatedSubscriptionError = 0;
}

- (BOOL)shouldSimulateSharedAlbumsUnavailable
{
  return self->_shouldSimulateSharedAlbumsUnavailable;
}

- (BOOL)activityEntryAllowsMultipleLikeContributors
{
  return self->_activityEntryAllowsMultipleLikeContributors;
}

- (int64_t)activityEntryAssetsAddedBatchingBehavior
{
  return self->_activityEntryAssetsAddedBatchingBehavior;
}

- (int64_t)shelfBehavior
{
  return self->_shelfBehavior;
}

- (BOOL)showParticipantCountBadges
{
  return self->_showParticipantCountBadges;
}

- (BOOL)lemonadeActivityShelfUseActivityEntries
{
  return self->_lemonadeActivityShelfUseActivityEntries;
}

- (BOOL)lemonadeActivityShelfAlwaysAppearUnread
{
  return self->_lemonadeActivityShelfAlwaysAppearUnread;
}

- (BOOL)lemonadeActivityShelfAvatarAppearsAsOverlay
{
  return self->_lemonadeActivityShelfAvatarAppearsAsOverlay;
}

- (BOOL)lemonadeActivityShelfPreventUpdatingUnreadState
{
  return self->_lemonadeActivityShelfPreventUpdatingUnreadState;
}

- (int64_t)lemonadeActivityShelfPlaceholderBehavior
{
  return self->_lemonadeActivityShelfPlaceholderBehavior;
}

- (BOOL)lemonadeActivityShelfShouldOpenActivityFeedModallyByItself
{
  return self->_lemonadeActivityShelfShouldOpenActivityFeedModallyByItself;
}

- (BOOL)lemonadeActivityFeedUseActivityEntries
{
  return self->_lemonadeActivityFeedUseActivityEntries;
}

- (int64_t)activityEntryFeedLoadMoreBatchSize
{
  return self->_activityEntryFeedLoadMoreBatchSize;
}

- (int64_t)lemonadeActivityFeedMultipleAssetsBehavior
{
  return self->_lemonadeActivityFeedMultipleAssetsBehavior;
}

- (BOOL)activityEntryFeedUseOnlyCompactCells
{
  return self->_activityEntryFeedUseOnlyCompactCells;
}

- (int64_t)activityEntryFeedCompactCellDisplayStyle
{
  return self->_activityEntryFeedCompactCellDisplayStyle;
}

- (BOOL)activityEntryFeedAutoplaysVideosInline
{
  return self->_activityEntryFeedAutoplaysVideosInline;
}

- (BOOL)activityEntryFeedFollowsReadableWidth
{
  return self->_activityEntryFeedFollowsReadableWidth;
}

- (double)activityEntryFeedReadableWidth
{
  return self->_activityEntryFeedReadableWidth;
}

- (BOOL)activityEntryFeedDrawDebugBackgrounds
{
  return self->_activityEntryFeedDrawDebugBackgrounds;
}

- (BOOL)simulateEmptyActivityEntries
{
  return self->_simulateEmptyActivityEntries;
}

- (BOOL)useLemonadeSettingsView
{
  return self->_useLemonadeSettingsView;
}

- (BOOL)showPublishingButtonSpinner
{
  return self->_showPublishingButtonSpinner;
}

- (BOOL)showPublishingProgressDialog
{
  return self->_showPublishingProgressDialog;
}

- (BOOL)allowEmptyAddressesForDebugging
{
  return self->_allowEmptyAddressesForDebugging;
}

- (void)setAllowEmptyAddressesForDebugging:(BOOL)a3
{
  self->_allowEmptyAddressesForDebugging = a3;
}

- (BOOL)alwaysShowSpatialMediaDataLossAlertForSpatialMedia
{
  return self->_alwaysShowSpatialMediaDataLossAlertForSpatialMedia;
}

- (int64_t)simulatedSubscriptionError
{
  return self->_simulatedSubscriptionError;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_35172 != -1)
    dispatch_once(&sharedInstance_onceToken_35172, &__block_literal_global_35173);
  return (id)sharedInstance_sharedInstance_35174;
}

+ (id)settingsControllerModule
{
  id v2;
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
  _QWORD v150[2];
  _QWORD v151[2];
  _QWORD v152[2];
  _QWORD v153[3];
  void *v154;
  _QWORD v155[9];
  _QWORD v156[8];
  _QWORD v157[2];
  _QWORD v158[2];
  _QWORD v159[3];

  v159[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)MEMORY[0x1E0D83078];
  v4 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_shouldSimulateSharedAlbumsUnavailable);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Simulate Disabled"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v159[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v159, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v7, CFSTR("General"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v8);

  v9 = (void *)MEMORY[0x1E0D83078];
  v10 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_activityEntryAllowsMultipleLikeContributors);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:valueKeyPath:", CFSTR("Allow multiple contributors for Like entries"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v158[0] = v12;
  v13 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_activityEntryAssetsAddedBatchingBehavior);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:valueKeyPath:", CFSTR("Assets Batch Behavior"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "possibleValues:titles:", &unk_1E53E8910, &unk_1E53E8928);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v158[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v158, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:title:", v17, CFSTR("Shared Albums Activity"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = v2;
  objc_msgSend(v2, "addObject:", v18);

  v19 = (void *)MEMORY[0x1E0D83078];
  v20 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_shelfBehavior);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rowWithTitle:valueKeyPath:", CFSTR("Appearance"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "possibleValues:titles:", &unk_1E53E8940, &unk_1E53E8958);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v157[0] = v23;
  v24 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showParticipantCountBadges);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rowWithTitle:valueKeyPath:", CFSTR("Participant count badges"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v157[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v157, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sectionWithRows:title:", v27, CFSTR("Lemonade Shelf"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v28);

  v133 = (void *)MEMORY[0x1E0D83078];
  v29 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_lemonadeActivityShelfUseActivityEntries);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "rowWithTitle:valueKeyPath:", CFSTR("Modern Activities"), v147);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v156[0] = v145;
  v30 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_lemonadeActivityShelfAlwaysAppearUnread);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "rowWithTitle:valueKeyPath:", CFSTR("Always Appear Unread"), v143);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v156[1] = v141;
  v31 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_lemonadeActivityShelfAvatarAppearsAsOverlay);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rowWithTitle:valueKeyPath:", CFSTR("Overlay Avater over Image"), v139);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v156[2] = v137;
  v32 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_lemonadeActivityShelfPreventUpdatingUnreadState);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "rowWithTitle:valueKeyPath:", CFSTR("Don't Update Unread When Seen"), v135);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v156[3] = v131;
  v33 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_428);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rowWithTitle:action:", CFSTR("Force ☁️🔁 Unread to yesterday"), v129);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "conditionFormat:", CFSTR("lemonadeActivityShelfPreventUpdatingUnreadState == 0"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v156[4] = v125;
  v34 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_431);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "rowWithTitle:action:", CFSTR("Force ☁️🔁 Unread to some activities"), v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "conditionFormat:", CFSTR("lemonadeActivityShelfPreventUpdatingUnreadState == 0"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v156[5] = v37;
  v38 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_lemonadeActivityShelfPlaceholderBehavior);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "rowWithTitle:valueKeyPath:", CFSTR("Placeholders"), v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "possibleValues:titles:", &unk_1E53E8970, &unk_1E53E8988);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v156[6] = v41;
  v42 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_lemonadeActivityShelfShouldOpenActivityFeedModallyByItself);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "rowWithTitle:valueKeyPath:", CFSTR("Open Activity Feed Alone"), v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v156[7] = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v156, 8);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "sectionWithRows:title:", v45, CFSTR("Lemonade Shelf"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "addObject:", v46);

  v47 = (void *)MEMORY[0x1E0D83078];
  v48 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_lemonadeActivityFeedUseActivityEntries);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "rowWithTitle:valueKeyPath:", CFSTR("Modern Activities"), v148);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v155[0] = v146;
  v49 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_activityEntryFeedLoadMoreBatchSize);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "rowWithTitle:valueKeyPath:", CFSTR("Fetch Batch Size"), v144);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "minValue:maxValue:", 4.0, 200.0);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "conditionFormat:", CFSTR("lemonadeActivityFeedUseActivityEntries != 0"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v155[1] = v138;
  v50 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_lemonadeActivityFeedMultipleAssetsBehavior);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "rowWithTitle:valueKeyPath:", CFSTR("Show Multiple Photos as"), v136);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "possibleValues:titles:", &unk_1E53E89A0, &unk_1E53E89B8);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "conditionFormat:", CFSTR("lemonadeActivityFeedUseActivityEntries != 0"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v155[2] = v130;
  v51 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_activityEntryFeedUseOnlyCompactCells);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "rowWithTitle:valueKeyPath:", CFSTR("All Compact Cells"), v128);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "conditionFormat:", CFSTR("lemonadeActivityFeedUseActivityEntries != 0"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v155[3] = v124;
  v52 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_activityEntryFeedCompactCellDisplayStyle);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "rowWithTitle:valueKeyPath:", CFSTR("Compact Cell Style"), v123);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "possibleValues:titles:", &unk_1E53E89D0, &unk_1E53E89E8);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "conditionFormat:", CFSTR("lemonadeActivityFeedUseActivityEntries != 0"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v155[4] = v120;
  v53 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_activityEntryFeedAutoplaysVideosInline);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "rowWithTitle:valueKeyPath:", CFSTR("Auto Plays Videos"), v119);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "conditionFormat:", CFSTR("lemonadeActivityFeedUseActivityEntries != 0"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v155[5] = v117;
  v54 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_activityEntryFeedFollowsReadableWidth);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "rowWithTitle:valueKeyPath:", CFSTR("Pad Readable Width"), v116);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "conditionFormat:", CFSTR("lemonadeActivityFeedUseActivityEntries != 0"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v155[6] = v55;
  v56 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_activityEntryFeedReadableWidth);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "rowWithTitle:valueKeyPath:", CFSTR(" -> Width"), v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "minValue:maxValue:", 0.0, 1200.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "conditionFormat:", CFSTR("activityEntryFeedFollowsReadableWidth != 0"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v155[7] = v60;
  v61 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_activityEntryFeedDrawDebugBackgrounds);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "rowWithTitle:valueKeyPath:", CFSTR("Debug Backgrounds"), v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "conditionFormat:", CFSTR("lemonadeActivityFeedUseActivityEntries != 0"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v155[8] = v64;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v155, 9);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "sectionWithRows:title:", v65, CFSTR("Main Activity Feed"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "addObject:", v66);

  v67 = (void *)MEMORY[0x1E0D83078];
  v68 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateEmptyActivityEntries);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "rowWithTitle:valueKeyPath:", CFSTR("Simulate empty activities"), v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = v70;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v154, 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "sectionWithRows:title:", v71, CFSTR("Activities"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "addObject:", v72);

  v73 = (void *)MEMORY[0x1E0D83078];
  v74 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useLemonadeSettingsView);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "rowWithTitle:valueKeyPath:", CFSTR("Use New Shared Album Views"), v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v153[0] = v76;
  v77 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showPublishingButtonSpinner);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "rowWithTitle:valueKeyPath:", CFSTR("Show Publishing Button Spinner"), v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v153[1] = v79;
  v80 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showPublishingProgressDialog);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "rowWithTitle:valueKeyPath:", CFSTR("Show Publishing Progress Dialog"), v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v153[2] = v82;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v153, 3);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "sectionWithRows:title:", v83, CFSTR("Collection Customization Views"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "addObject:", v84);

  v85 = (void *)MEMORY[0x1E0D83078];
  v86 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_alwaysShowSpatialMediaDataLossAlertForSpatialMedia);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "rowWithTitle:valueKeyPath:", CFSTR("Always Show Spatial Media Data Loss Alert"), v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v152[0] = v88;
  v89 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_434);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "rowWithTitle:action:", CFSTR("Reset Spatial Media Data Loss Alert Pref"), v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v152[1] = v91;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 2);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "sectionWithRows:title:", v92, CFSTR("Posting UI"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "addObject:", v93);

  v94 = (void *)MEMORY[0x1E0D83078];
  v95 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_simulatedSubscriptionError);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "rowWithTitle:valueKeyPath:", CFSTR("Subscription Error"), v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "possibleValues:titles:", &unk_1E53E8A00, &unk_1E53E8A18);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v151[0] = v98;
  v99 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowEmptyAddressesForDebugging);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "rowWithTitle:valueKeyPath:", CFSTR("Allow Empty Addresses For Debugging"), v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v151[1] = v101;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v151, 2);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "sectionWithRows:title:", v102, CFSTR("Error Simulation"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "addObject:", v103);

  v104 = (void *)MEMORY[0x1E0D83078];
  v105 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_435);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "rowWithTitle:action:", CFSTR("Activity Prototype"), v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v150[0] = v107;
  v108 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "rowWithTitle:action:", CFSTR("Restore Defaults Settings"), v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v150[1] = v110;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 2);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "sectionWithRows:", v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "addObject:", v112);

  objc_msgSend(MEMORY[0x1E0D83078], "moduleWithTitle:contents:", CFSTR("Shared Albums"), v149);
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  return v113;
}

void __40__PXSharedAlbumsSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedAlbumsSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_35174;
  sharedInstance_sharedInstance_35174 = v0;

}

@end
