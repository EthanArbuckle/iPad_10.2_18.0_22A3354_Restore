@implementation PXPeopleUISettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPeopleUISettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXPeopleUISettings setEnableNewPeoplePetsCuration:](self, "setEnableNewPeoplePetsCuration:", 1);
  -[PXPeopleUISettings setUseSummaryAssetsForCuration:](self, "setUseSummaryAssetsForCuration:", 1);
  -[PXPeopleUISettings setAlwaysShowBootstrap:](self, "setAlwaysShowBootstrap:", 0);
  -[PXPeopleUISettings setEnableBootstrapDemoMode:](self, "setEnableBootstrapDemoMode:", 0);
  -[PXPeopleUISettings setUseBootstrapMockDataSource:](self, "setUseBootstrapMockDataSource:", 0);
  -[PXPeopleUISettings setAlwaysShowBanner:](self, "setAlwaysShowBanner:", 0);
  -[PXPeopleUISettings setDebugBannerStyle:](self, "setDebugBannerStyle:", 0);
  -[PXPeopleUISettings setDebugBannerAttribution:](self, "setDebugBannerAttribution:", 0);
  -[PXPeopleUISettings setIgnoreNegativeSuggestionFeedback:](self, "setIgnoreNegativeSuggestionFeedback:", 0);
  -[PXPeopleUISettings setNegativeFeedbackWaitPeriodMinutes:](self, "setNegativeFeedbackWaitPeriodMinutes:", 1440);
  -[PXPeopleUISettings setIgnoreAttributionFiltering:](self, "setIgnoreAttributionFiltering:", 0);
  -[PXPeopleUISettings setAlwaysShowMe:](self, "setAlwaysShowMe:", 0);
  -[PXPeopleUISettings setDebugBlurredCells:](self, "setDebugBlurredCells:", 0);
  -[PXPeopleUISettings setDisplayBootstrapSuggestionType:](self, "setDisplayBootstrapSuggestionType:", 0);
  -[PXPeopleUISettings setDisplayReviewMorePhotosSuggestionType:](self, "setDisplayReviewMorePhotosSuggestionType:", 0);
  -[PXPeopleUISettings setDisplayReviewMorePhotosDate:](self, "setDisplayReviewMorePhotosDate:", 0);
  -[PXPeopleUISettings setForceReviewMorePhotosInterimLoading:](self, "setForceReviewMorePhotosInterimLoading:", 0);
  -[PXPeopleUISettings setShowReviewPhotosObjectType:](self, "setShowReviewPhotosObjectType:", 0);
  -[PXPeopleUISettings setEnableReviewPhotosDemoMode:](self, "setEnableReviewPhotosDemoMode:", 0);
  -[PXPeopleUISettings setUseReviewPhotosMockDataSource:](self, "setUseReviewPhotosMockDataSource:", 0);
  -[PXPeopleUISettings setEvictsCacheWhenBackgrounded:](self, "setEvictsCacheWhenBackgrounded:", 1);
  -[PXPeopleUISettings setUseGridZeroForDetails:](self, "setUseGridZeroForDetails:", 0);
  -[PXPeopleUISettings setUseMockSocialGroupData:](self, "setUseMockSocialGroupData:", 0);
  -[PXPeopleUISettings setMockProcessingUpdates:](self, "setMockProcessingUpdates:", 0);
  -[PXPeopleUISettings setMockEmptyContentUpdates:](self, "setMockEmptyContentUpdates:", 0);
}

- (void)setUseSummaryAssetsForCuration:(BOOL)a3
{
  self->_useSummaryAssetsForCuration = a3;
}

- (void)setUseReviewPhotosMockDataSource:(BOOL)a3
{
  self->_useReviewPhotosMockDataSource = a3;
}

- (void)setUseMockSocialGroupData:(BOOL)a3
{
  self->_useMockSocialGroupData = a3;
}

- (void)setUseGridZeroForDetails:(BOOL)a3
{
  self->_useGridZeroForDetails = a3;
}

- (void)setUseBootstrapMockDataSource:(BOOL)a3
{
  self->_useBootstrapMockDataSource = a3;
}

- (void)setShowReviewPhotosObjectType:(BOOL)a3
{
  self->_showReviewPhotosObjectType = a3;
}

- (void)setNegativeFeedbackWaitPeriodMinutes:(int64_t)a3
{
  self->_negativeFeedbackWaitPeriodMinutes = a3;
}

- (void)setIgnoreNegativeSuggestionFeedback:(BOOL)a3
{
  self->_ignoreNegativeSuggestionFeedback = a3;
}

- (void)setIgnoreAttributionFiltering:(BOOL)a3
{
  self->_ignoreAttributionFiltering = a3;
}

- (void)setForceReviewMorePhotosInterimLoading:(BOOL)a3
{
  self->_forceReviewMorePhotosInterimLoading = a3;
}

- (void)setEvictsCacheWhenBackgrounded:(BOOL)a3
{
  self->_evictsCacheWhenBackgrounded = a3;
}

- (void)setEnableReviewPhotosDemoMode:(BOOL)a3
{
  self->_enableReviewPhotosDemoMode = a3;
}

- (void)setEnableNewPeoplePetsCuration:(BOOL)a3
{
  self->_enableNewPeoplePetsCuration = a3;
}

- (void)setEnableBootstrapDemoMode:(BOOL)a3
{
  self->_enableBootstrapDemoMode = a3;
}

- (void)setDisplayReviewMorePhotosSuggestionType:(BOOL)a3
{
  self->_displayReviewMorePhotosSuggestionType = a3;
}

- (void)setDisplayReviewMorePhotosDate:(BOOL)a3
{
  self->_displayReviewMorePhotosDate = a3;
}

- (void)setDisplayBootstrapSuggestionType:(BOOL)a3
{
  self->_displayBootstrapSuggestionType = a3;
}

- (void)setDebugBlurredCells:(BOOL)a3
{
  self->_debugBlurredCells = a3;
}

- (void)setDebugBannerStyle:(int64_t)a3
{
  self->_debugBannerStyle = a3;
}

- (void)setDebugBannerAttribution:(int64_t)a3
{
  self->_debugBannerAttribution = a3;
}

- (void)setAlwaysShowMe:(BOOL)a3
{
  self->_alwaysShowMe = a3;
}

- (void)setAlwaysShowBootstrap:(BOOL)a3
{
  self->_alwaysShowBootstrap = a3;
}

- (void)setAlwaysShowBanner:(BOOL)a3
{
  self->_alwaysShowBanner = a3;
}

+ (id)settingsControllerModule
{
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
  _QWORD v147[5];
  _QWORD v148[12];
  void *v149;
  _QWORD v150[2];
  _QWORD v151[2];
  void *v152;
  void *v153;
  _QWORD v154[2];
  _QWORD v155[2];
  _QWORD v156[2];
  _QWORD v157[3];
  _QWORD v158[3];
  _QWORD v159[4];
  _QWORD v160[10];

  v160[8] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_alwaysShowBanner);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Always Show Banner"), v4);
  v146 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D830B0];
  NSStringFromSelector(sel_debugBannerStyle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowWithTitle:valueKeyPath:", CFSTR("Style"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "possibleValues:titles:", &unk_1E53EA188, &unk_1E53EA1A0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_alwaysShowBanner);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K == 1"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "condition:", v11);
  v145 = (void *)objc_claimAutoreleasedReturnValue();

  v147[0] = MEMORY[0x1E0C809B0];
  v147[1] = 3221225472;
  v147[2] = __51__PXPeopleUISettings_iOS__settingsControllerModule__block_invoke;
  v147[3] = &__block_descriptor_40_e32_v16__0__UINavigationController_8l;
  v147[4] = a1;
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Choose Contact"), v147);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_alwaysShowBanner);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_debugBannerStyle);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithFormat:", CFSTR("%K == 1 && %K == %@"), v14, v15, &unk_1E53EE658);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "condition:", v16);
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D830B0];
  NSStringFromSelector(sel_debugBannerAttribution);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:valueKeyPath:", CFSTR("Attribution"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "possibleValues:titles:", &unk_1E53EA1B8, &unk_1E53EA1D0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_alwaysShowBanner);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "predicateWithFormat:", CFSTR("%K == 1"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "condition:", v23);
  v139 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_ignoreNegativeSuggestionFeedback);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rowWithTitle:valueKeyPath:", CFSTR("Ignore Negative Feedback"), v25);
  v138 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0D83068];
  NSStringFromSelector(sel_negativeFeedbackWaitPeriodMinutes);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rowWithTitle:valueKeyPath:", CFSTR("Negative Feedback Wait (min)"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "valueValidator:", &__block_literal_global_196954);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "valueFormatter:", &__block_literal_global_190_196955);
  v137 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_ignoreAttributionFiltering);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "rowWithTitle:valueKeyPath:", CFSTR("Ignore Attribution Filter"), v31);
  v136 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_203_196957);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "rowWithTitle:action:", CFSTR("Reset Suppressed Suggestions"), v33);
  v135 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (void *)MEMORY[0x1E0D830B8];
  v160[0] = v146;
  v160[1] = v145;
  v160[2] = v140;
  v160[3] = v139;
  v160[4] = v138;
  v160[5] = v137;
  v160[6] = v136;
  v160[7] = v135;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v160, 8);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sectionWithRows:title:", v35, CFSTR("Details Banner"));
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_alwaysShowBootstrap);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rowWithTitle:valueKeyPath:", CFSTR("Always Show Bootstrap"), v37);
  v134 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_enableBootstrapDemoMode);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "rowWithTitle:valueKeyPath:", CFSTR("Demo Mode"), v39);
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_useBootstrapMockDataSource);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "rowWithTitle:valueKeyPath:", CFSTR("Mock Data Source"), v41);
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_displayBootstrapSuggestionType);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "rowWithTitle:valueKeyPath:", CFSTR("Display Type (bV/oUV)"), v43);
  v131 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = (void *)MEMORY[0x1E0D830B8];
  v159[0] = v134;
  v159[1] = v133;
  v159[2] = v132;
  v159[3] = v131;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v159, 4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "sectionWithRows:title:", v45, CFSTR("Bootstrap"));
  v143 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_enableReviewPhotosDemoMode);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "rowWithTitle:valueKeyPath:", CFSTR("Demo Mode"), v47);
  v130 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_useReviewPhotosMockDataSource);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "rowWithTitle:valueKeyPath:", CFSTR("Mock Data Source"), v49);
  v129 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_showReviewPhotosObjectType);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "rowWithTitle:valueKeyPath:", CFSTR("Display Type (cFaces/sCrops)"), v51);
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = (void *)MEMORY[0x1E0D830B8];
  v158[0] = v130;
  v158[1] = v129;
  v158[2] = v128;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v158, 3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "sectionWithRows:title:", v53, CFSTR("Review Photos"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_forceReviewMorePhotosInterimLoading);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "rowWithTitle:valueKeyPath:", CFSTR("Force Interim Loading"), v55);
  v127 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_displayReviewMorePhotosSuggestionType);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "rowWithTitle:valueKeyPath:", CFSTR("Display Type (gMC/rVision)"), v57);
  v126 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_displayReviewMorePhotosDate);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "rowWithTitle:valueKeyPath:", CFSTR("Display Date"), v59);
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = (void *)MEMORY[0x1E0D830B8];
  v157[0] = v127;
  v157[1] = v125;
  v157[2] = v126;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v157, 3);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "sectionWithRows:title:", v61, CFSTR("Review More Photos"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830D8], "rowWithTitle:valueKeyPath:", CFSTR("Debug Blurred Cells"), CFSTR("debugBlurredCells"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_useGridZeroForDetails);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "rowWithTitle:valueKeyPath:", CFSTR("Use GridZero Details"), v63);
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = (void *)MEMORY[0x1E0D830B8];
  v156[0] = v124;
  v156[1] = v123;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v156, 2);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "sectionWithRows:title:", v65, CFSTR("Home"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830D8], "rowWithTitle:valueKeyPath:", CFSTR("Always Show Me"), CFSTR("alwaysShowMe"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)MEMORY[0x1E0D830A8];
  objc_msgSend(MEMORY[0x1E0D830C8], "actionWithHandler:", &__block_literal_global_265_196977);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "rowWithTitle:action:", CFSTR("Reset Me Default"), v67);
  v121 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = (void *)MEMORY[0x1E0D830B8];
  v155[0] = v122;
  v155[1] = v121;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v155, 2);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "sectionWithRows:title:", v69, CFSTR("Me"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_debugFadeLayer);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "rowWithTitle:valueKeyPath:", CFSTR("Debug Fade Layer"), v72);
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_showUUIDIfNoName);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "rowWithTitle:valueKeyPath:", CFSTR("Show UUID If No Name"), v74);
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = (void *)MEMORY[0x1E0D830B8];
  v154[0] = v119;
  v154[1] = v118;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v154, 2);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "sectionWithRows:title:", v76, CFSTR("People Tile"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_evictsCacheWhenBackgrounded);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "rowWithTitle:valueKeyPath:", CFSTR("Evict Cache in Background"), v79);
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  v80 = (void *)MEMORY[0x1E0D830B8];
  v153 = v117;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v153, 1);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "sectionWithRows:title:", v81, CFSTR("Face Crop Manager"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_useMockSocialGroupData);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "rowWithTitle:valueKeyPath:", CFSTR("Mock Social Groups"), v83);
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  v84 = (void *)MEMORY[0x1E0D830B8];
  v152 = v116;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v152, 1);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "sectionWithRows:title:", v85, CFSTR("Social Groups"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  v86 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_enableNewPeoplePetsCuration);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "rowWithTitle:valueKeyPath:", CFSTR("New People & Pets Curation"), v87);
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  v88 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_useSummaryAssetsForCuration);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "rowWithTitle:valueKeyPath:", CFSTR("Use Summary Assets"), v89);
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  v90 = (void *)MEMORY[0x1E0D830B8];
  v151[0] = v114;
  v151[1] = v113;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v151, 2);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "sectionWithRows:title:", v91, CFSTR("People and Pets Curation"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  v92 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_mockProcessingUpdates);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "rowWithTitle:valueKeyPath:", CFSTR("Mock Processing Updates"), v93);
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  v94 = (void *)MEMORY[0x1E0D830D8];
  NSStringFromSelector(sel_mockEmptyContentUpdates);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "rowWithTitle:valueKeyPath:", CFSTR("Mock Empty Content Updates"), v95);
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  v96 = (void *)MEMORY[0x1E0D830B8];
  v150[0] = v110;
  v150[1] = v109;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 2);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "sectionWithRows:title:", v97, CFSTR("People Processing Updates"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  v99 = (void *)MEMORY[0x1E0D830B8];
  v100 = (void *)MEMORY[0x1E0D830A8];
  objc_msgSend(MEMORY[0x1E0D830C0], "actionWithSettingsKeyPath:", 0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "rowWithTitle:action:", CFSTR("Restore Defaults"), v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = v102;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v149, 1);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "sectionWithRows:", v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  v105 = (void *)MEMORY[0x1E0D830B8];
  v148[0] = v144;
  v148[1] = v143;
  v148[2] = v142;
  v148[3] = v141;
  v148[4] = v120;
  v148[5] = v70;
  v148[6] = v77;
  v148[7] = v115;
  v148[8] = v112;
  v148[9] = v111;
  v148[10] = v98;
  v148[11] = v104;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v148, 12);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "moduleWithTitle:contents:", CFSTR("People UI"), v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  return v107;
}

+ (id)_sharedContactPickerDelegate
{
  if (_sharedContactPickerDelegate_onceToken != -1)
    dispatch_once(&_sharedContactPickerDelegate_onceToken, &__block_literal_global_317);
  return (id)_sharedContactPickerDelegate__delegate;
}

void __55__PXPeopleUISettings_iOS___sharedContactPickerDelegate__block_invoke()
{
  PXPeopleUISettingsContactPickerDelegate *v0;
  void *v1;

  v0 = objc_alloc_init(PXPeopleUISettingsContactPickerDelegate);
  v1 = (void *)_sharedContactPickerDelegate__delegate;
  _sharedContactPickerDelegate__delegate = (uint64_t)v0;

}

void __51__PXPeopleUISettings_iOS__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0C974B0];
  v4 = a2;
  v6 = objc_alloc_init(v3);
  objc_msgSend(*(id *)(a1 + 32), "_sharedContactPickerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v5);

  objc_msgSend(v4, "presentViewController:animated:completion:", v6, 1, 0);
}

uint64_t __51__PXPeopleUISettings_iOS__settingsControllerModule__block_invoke_4()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeObjectForKey:", CFSTR("PXPeopleMePrompted"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "synchronize");

  return 1;
}

uint64_t __51__PXPeopleUISettings_iOS__settingsControllerModule__block_invoke_3()
{
  +[PXPeopleUtilities resetTemporarilySuppressedBootstrapOrSuggestions](PXPeopleUtilities, "resetTemporarilySuppressedBootstrapOrSuggestions");
  return 1;
}

uint64_t __51__PXPeopleUISettings_iOS__settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(a2, "integerValue"));
}

id __51__PXPeopleUISettings_iOS__settingsControllerModule__block_invoke_186(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "integerValue");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  if (v5 <= 0)
    v5 = objc_msgSend(v4, "negativeFeedbackWaitPeriodMinutes", v5);
  objc_msgSend(v6, "numberWithInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)enableNewPeoplePetsCuration
{
  return self->_enableNewPeoplePetsCuration;
}

- (BOOL)useSummaryAssetsForCuration
{
  return self->_useSummaryAssetsForCuration;
}

- (BOOL)alwaysShowBootstrap
{
  return self->_alwaysShowBootstrap;
}

- (BOOL)enableBootstrapDemoMode
{
  return self->_enableBootstrapDemoMode;
}

- (BOOL)useBootstrapMockDataSource
{
  return self->_useBootstrapMockDataSource;
}

- (BOOL)displayBootstrapSuggestionType
{
  return self->_displayBootstrapSuggestionType;
}

- (BOOL)alwaysShowBanner
{
  return self->_alwaysShowBanner;
}

- (int64_t)debugBannerStyle
{
  return self->_debugBannerStyle;
}

- (int64_t)debugBannerAttribution
{
  return self->_debugBannerAttribution;
}

- (BOOL)ignoreNegativeSuggestionFeedback
{
  return self->_ignoreNegativeSuggestionFeedback;
}

- (int64_t)negativeFeedbackWaitPeriodMinutes
{
  return self->_negativeFeedbackWaitPeriodMinutes;
}

- (BOOL)ignoreAttributionFiltering
{
  return self->_ignoreAttributionFiltering;
}

- (NSString)debugContactIdentifier
{
  return self->_debugContactIdentifier;
}

- (void)setDebugContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)shouldAlwaysShowMe
{
  return self->_alwaysShowMe;
}

- (BOOL)displayReviewMorePhotosSuggestionType
{
  return self->_displayReviewMorePhotosSuggestionType;
}

- (BOOL)displayReviewMorePhotosDate
{
  return self->_displayReviewMorePhotosDate;
}

- (BOOL)forceReviewMorePhotosInterimLoading
{
  return self->_forceReviewMorePhotosInterimLoading;
}

- (BOOL)shouldDebugBlurredCells
{
  return self->_debugBlurredCells;
}

- (BOOL)showReviewPhotosObjectType
{
  return self->_showReviewPhotosObjectType;
}

- (BOOL)enableReviewPhotosDemoMode
{
  return self->_enableReviewPhotosDemoMode;
}

- (BOOL)useReviewPhotosMockDataSource
{
  return self->_useReviewPhotosMockDataSource;
}

- (BOOL)debugFadeLayer
{
  return self->_debugFadeLayer;
}

- (void)setDebugFadeLayer:(BOOL)a3
{
  self->_debugFadeLayer = a3;
}

- (BOOL)showUUIDIfNoName
{
  return self->_showUUIDIfNoName;
}

- (void)setShowUUIDIfNoName:(BOOL)a3
{
  self->_showUUIDIfNoName = a3;
}

- (BOOL)evictsCacheWhenBackgrounded
{
  return self->_evictsCacheWhenBackgrounded;
}

- (BOOL)useGridZeroForDetails
{
  return self->_useGridZeroForDetails;
}

- (BOOL)useMockSocialGroupData
{
  return self->_useMockSocialGroupData;
}

- (BOOL)mockProcessingUpdates
{
  return self->_mockProcessingUpdates;
}

- (void)setMockProcessingUpdates:(BOOL)a3
{
  self->_mockProcessingUpdates = a3;
}

- (BOOL)mockEmptyContentUpdates
{
  return self->_mockEmptyContentUpdates;
}

- (void)setMockEmptyContentUpdates:(BOOL)a3
{
  self->_mockEmptyContentUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugContactIdentifier, 0);
}

+ (PXPeopleUISettings)sharedInstance
{
  if (sharedInstance_onceToken_230196 != -1)
    dispatch_once(&sharedInstance_onceToken_230196, &__block_literal_global_230197);
  return (PXPeopleUISettings *)(id)sharedInstance_sharedInstance_230198;
}

void __36__PXPeopleUISettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peopleUISettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_230198;
  sharedInstance_sharedInstance_230198 = v0;

}

@end
