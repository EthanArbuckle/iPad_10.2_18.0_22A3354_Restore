@implementation PXForYouSettings

+ (PXForYouSettings)sharedInstance
{
  if (sharedInstance_onceToken_153640 != -1)
    dispatch_once(&sharedInstance_onceToken_153640, &__block_literal_global_153641);
  return (PXForYouSettings *)(id)sharedInstance_sharedInstance_153642;
}

- (void)setDefaultValues
{
  uint64_t v3;
  int HasInternalUI;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXForYouSettings;
  -[PTSettings setDefaultValues](&v6, sel_setDefaultValues);
  v3 = 1;
  -[PXForYouSettings setShowMemories:](self, "setShowMemories:", 1);
  -[PXForYouSettings setShowSharedAlbumActivity:](self, "setShowSharedAlbumActivity:", 1);
  -[PXForYouSettings setShowCMMInvitations:](self, "setShowCMMInvitations:", 1);
  -[PXForYouSettings setShowRecentInterestSuggestions:](self, "setShowRecentInterestSuggestions:", 1);
  -[PXForYouSettings setShowFooter:](self, "setShowFooter:", 0);
  HasInternalUI = PFOSVariantHasInternalUI();
  if ((HasInternalUI & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "BOOLForKey:", CFSTR("photosChallengeProfileEnabled"));

  }
  -[PXForYouSettings setShowSurveyQuestions:](self, "setShowSurveyQuestions:", v3);
  -[PXForYouSettings setShowSurveyQuestionsWithProfile:](self, "setShowSurveyQuestionsWithProfile:", HasInternalUI ^ 1u);
  -[PXForYouSettings setShowVerticalSampleGadgets:](self, "setShowVerticalSampleGadgets:", 0);
  -[PXForYouSettings setShowHorizontalGadget:](self, "setShowHorizontalGadget:", 0);
  -[PXForYouSettings setShowSharedLibraryInvitations:](self, "setShowSharedLibraryInvitations:", 1);
  -[PXForYouSettings setShowSharedLibrarySharingSuggestions:](self, "setShowSharedLibrarySharingSuggestions:", 1);
  -[PXForYouSettings setShowContentSyndication:](self, "setShowContentSyndication:", 1);
  -[PXForYouSettings setUseMockData:](self, "setUseMockData:", 0);
  -[PXForYouSettings setForceDisplayReportJunk:](self, "setForceDisplayReportJunk:", 0);
  -[PXForYouSettings setForcePortraitBias:](self, "setForcePortraitBias:", 0);
  -[PXForYouSettings setUseSquareSharedAlbumActivity:](self, "setUseSquareSharedAlbumActivity:", 1);
  -[PXForYouSettings setDisableSharedAlbumTopMargin:](self, "setDisableSharedAlbumTopMargin:", 1);
  -[PXForYouSettings setAlwaysShowSuggestionRenderingOverlay:](self, "setAlwaysShowSuggestionRenderingOverlay:", 0);
  -[PXForYouSettings setUseCachedEditRenders:](self, "setUseCachedEditRenders:", 1);
  -[PXForYouSettings setDelayEditRenders:](self, "setDelayEditRenders:", 0);
  -[PXForYouSettings setAllowVideoPlayback:](self, "setAllowVideoPlayback:", 0);
  -[PXForYouSettings setAllowLoopPlayback:](self, "setAllowLoopPlayback:", 1);
  -[PXForYouSettings setAllowGIFPlayback:](self, "setAllowGIFPlayback:", 1);
  -[PXForYouSettings setMaxSimultaneousVideoCount:](self, "setMaxSimultaneousVideoCount:", 5);
  -[PXForYouSettings setMinimumVisibilityForVideoPlayback:](self, "setMinimumVisibilityForVideoPlayback:", 15.0);
  -[PXForYouSettings setMaxMemoriesToFetch:](self, "setMaxMemoriesToFetch:", 13);
}

- (void)setUseSquareSharedAlbumActivity:(BOOL)a3
{
  self->_useSquareSharedAlbumActivity = a3;
}

- (void)setUseMockData:(BOOL)a3
{
  self->_useMockData = a3;
}

- (void)setUseCachedEditRenders:(BOOL)a3
{
  self->_useCachedEditRenders = a3;
}

- (void)setShowVerticalSampleGadgets:(BOOL)a3
{
  self->_showVerticalSampleGadgets = a3;
}

- (void)setShowSurveyQuestionsWithProfile:(BOOL)a3
{
  self->_showSurveyQuestionsWithProfile = a3;
}

- (void)setShowSurveyQuestions:(BOOL)a3
{
  self->_showSurveyQuestions = a3;
}

- (void)setShowSharedLibrarySharingSuggestions:(BOOL)a3
{
  self->_showSharedLibrarySharingSuggestions = a3;
}

- (void)setShowSharedLibraryInvitations:(BOOL)a3
{
  self->_showSharedLibraryInvitations = a3;
}

- (void)setShowSharedAlbumActivity:(BOOL)a3
{
  self->_showSharedAlbumActivity = a3;
}

- (void)setShowRecentInterestSuggestions:(BOOL)a3
{
  self->_showRecentInterestSuggestions = a3;
}

- (void)setShowMemories:(BOOL)a3
{
  self->_showMemories = a3;
}

- (void)setShowHorizontalGadget:(BOOL)a3
{
  self->_showHorizontalGadget = a3;
}

- (void)setShowFooter:(BOOL)a3
{
  self->_showFooter = a3;
}

- (void)setShowContentSyndication:(BOOL)a3
{
  self->_showContentSyndication = a3;
}

- (void)setShowCMMInvitations:(BOOL)a3
{
  self->_showCMMInvitations = a3;
}

- (void)setMinimumVisibilityForVideoPlayback:(double)a3
{
  self->_minimumVisibilityForVideoPlayback = a3;
}

- (void)setMaxSimultaneousVideoCount:(unint64_t)a3
{
  self->_maxSimultaneousVideoCount = a3;
}

- (void)setMaxMemoriesToFetch:(unint64_t)a3
{
  self->_maxMemoriesToFetch = a3;
}

- (void)setForcePortraitBias:(BOOL)a3
{
  self->_forcePortraitBias = a3;
}

- (void)setForceDisplayReportJunk:(BOOL)a3
{
  self->_forceDisplayReportJunk = a3;
}

- (void)setDisableSharedAlbumTopMargin:(BOOL)a3
{
  self->_disableSharedAlbumTopMargin = a3;
}

- (void)setDelayEditRenders:(BOOL)a3
{
  self->_delayEditRenders = a3;
}

- (void)setAlwaysShowSuggestionRenderingOverlay:(BOOL)a3
{
  self->_alwaysShowSuggestionRenderingOverlay = a3;
}

- (void)setAllowVideoPlayback:(BOOL)a3
{
  self->_allowVideoPlayback = a3;
}

- (void)setAllowLoopPlayback:(BOOL)a3
{
  self->_allowLoopPlayback = a3;
}

- (void)setAllowGIFPlayback:(BOOL)a3
{
  self->_allowGIFPlayback = a3;
}

void __34__PXForYouSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forYou");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_153642;
  sharedInstance_sharedInstance_153642 = v0;

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
  _QWORD v78[6];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[8];
  _QWORD v82[5];
  _QWORD v83[14];

  v83[12] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "photoLibraryURL");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Memories"), CFSTR("showMemories"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v72;
  v2 = (void *)MEMORY[0x1E0D83108];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", objc_msgSend(MEMORY[0x1E0D719E0], "sharedStreamsEnabledForPhotoLibraryURL:", v77));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_rowWithTitle:valueKeyPath:condition:", CFSTR("Show Shared Album Activity"), CFSTR("showSharedAlbumActivity"), v70);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v83[1] = v67;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show CMM Invitations"), CFSTR("showCMMInvitations"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v83[2] = v65;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Recent Interest Suggestions"), CFSTR("showRecentInterestSuggestions"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v83[3] = v63;
  v3 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showSharedLibraryInvitations);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Show Shared Library Invitations"), v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v83[4] = v61;
  v4 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showSharedLibrarySharingSuggestions);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Show Shared Library Sharing Suggestions"), v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v83[5] = v59;
  v5 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showContentSyndication);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowWithTitle:valueKeyPath:", CFSTR("Show Shared With You"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v83[6] = v7;
  v8 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showSurveyQuestions);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:valueKeyPath:", CFSTR("Show Survey Questions"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v83[7] = v10;
  v11 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showSurveyQuestionsWithProfile);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rowWithTitle:valueKeyPath:", CFSTR("Show Survey Questions With Profile"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v83[8] = v13;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show For You Footer"), CFSTR("showFooter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v83[9] = v14;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show V Sample Gadgets"), CFSTR("showVerticalSampleGadgets"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v83[10] = v15;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show H Sample Gadget"), CFSTR("showHorizontalGadget"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v83[11] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "sectionWithRows:", v17);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830D8], "rowWithTitle:valueKeyPath:", CFSTR("Allow Video Playback"), CFSTR("allowVideoPlayback"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v19;
  objc_msgSend(MEMORY[0x1E0D830D8], "rowWithTitle:valueKeyPath:", CFSTR("Allow Loop Playback"), CFSTR("allowLoopPlayback"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v20;
  objc_msgSend(MEMORY[0x1E0D830B0], "rowWithTitle:valueKeyPath:", CFSTR("Max Simultaneous Loops"), CFSTR("maxSimultaneousVideoCount"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "possibleValues:titles:", &unk_1E53E9768, &unk_1E53E9780);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "conditionFormat:", CFSTR("allowLoopPlayback == YES"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = v23;
  objc_msgSend(MEMORY[0x1E0D830D8], "rowWithTitle:valueKeyPath:", CFSTR("Allow GIF Playback"), CFSTR("allowGIFPlayback"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v82[3] = v24;
  objc_msgSend(MEMORY[0x1E0D830D0], "rowWithTitle:valueKeyPath:", CFSTR("Video Playback Visibility Threshold"), CFSTR("minimumVisibilityForVideoPlayback"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "minValue:maxValue:", 0.0, 40.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v82[4] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sectionWithRows:", v27);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Mock Data"), CFSTR("useMockData"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v71;
  v28 = (void *)MEMORY[0x1E0D83108];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", objc_msgSend(MEMORY[0x1E0D719E0], "sharedStreamsEnabledForPhotoLibraryURL:", v77));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "px_rowWithTitle:valueKeyPath:condition:", CFSTR("Force Display Report Junk"), CFSTR("forceDisplayReportJunk"), v66);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v81[1] = v64;
  v29 = (void *)MEMORY[0x1E0D83108];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", objc_msgSend(MEMORY[0x1E0D719E0], "sharedStreamsEnabledForPhotoLibraryURL:", v77));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "px_rowWithTitle:valueKeyPath:condition:", CFSTR("Force Portrait Bias"), CFSTR("forcePortraitBias"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v81[2] = v31;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Square Shared Album Activity"), CFSTR("useSquareSharedAlbumActivity"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v81[3] = v32;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("No Shared Album Top Margin"), CFSTR("disableSharedAlbumTopMargin"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v81[4] = v33;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Always Show Suggestion Rendering Overlay"), CFSTR("alwaysShowSuggestionRenderingOverlay"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v81[5] = v34;
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Edit seen assets"), &__block_literal_global_115876);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v81[6] = v35;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Max Recent Memories"), CFSTR("maxMemoriesToFetch"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "px_integersFrom:to:", 2, 13);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "px_possibleValues:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v81[7] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 8);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "sectionWithRows:", v39);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830D8], "rowWithTitle:valueKeyPath:", CFSTR("Delay Renders"), CFSTR("delayEditRenders"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v41;
  objc_msgSend(MEMORY[0x1E0D830D8], "rowWithTitle:valueKeyPath:", CFSTR("Use Cached Renders"), CFSTR("useCachedEditRenders"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "sectionWithRows:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = (void *)MEMORY[0x1E0D830A8];
  objc_msgSend(MEMORY[0x1E0D830C8], "actionWithHandler:", &__block_literal_global_265);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "rowWithTitle:action:", CFSTR("Reset Stored Base Date"), v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = (void *)MEMORY[0x1E0D830A8];
  objc_msgSend(MEMORY[0x1E0D830C8], "actionWithHandler:", &__block_literal_global_269_115884);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "rowWithTitle:action:", CFSTR("Simulate Next Day"), v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = (void *)MEMORY[0x1E0D83078];
  v79[0] = v47;
  v79[1] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "sectionWithRows:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)MEMORY[0x1E0D83078];
  v78[0] = v75;
  v78[1] = v69;
  v78[2] = v73;
  v78[3] = v44;
  v78[4] = v53;
  v78[5] = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 6);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "moduleWithTitle:contents:", CFSTR("For You"), v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  return v57;
}

uint64_t __48__PXForYouSettings_UI__settingsControllerModule__block_invoke_3()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37C0]), "initWithName:object:userInfo:", CFSTR("PXForYouSimluatedNextDateNotification"), 0, 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotification:", v0);

  return 1;
}

uint64_t __48__PXForYouSettings_UI__settingsControllerModule__block_invoke_2()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeObjectForKey:", CFSTR("PXForYouLastSeenBadgeDate"));

  return 1;
}

void __48__PXForYouSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PXSeenAssetSettingsViewController *v3;

  v2 = a2;
  v3 = objc_alloc_init(PXSeenAssetSettingsViewController);
  objc_msgSend(v2, "pushViewController:animated:", v3, 1);

}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (int64_t)version
{
  return 2;
}

- (BOOL)showMemories
{
  return self->_showMemories;
}

- (BOOL)showSharedAlbumActivity
{
  return self->_showSharedAlbumActivity;
}

- (BOOL)showCMMInvitations
{
  return self->_showCMMInvitations;
}

- (BOOL)showRecentInterestSuggestions
{
  return self->_showRecentInterestSuggestions;
}

- (BOOL)showSurveyQuestions
{
  return self->_showSurveyQuestions;
}

- (BOOL)showSurveyQuestionsWithProfile
{
  return self->_showSurveyQuestionsWithProfile;
}

- (BOOL)showFooter
{
  return self->_showFooter;
}

- (BOOL)showVerticalSampleGadgets
{
  return self->_showVerticalSampleGadgets;
}

- (BOOL)showHorizontalGadget
{
  return self->_showHorizontalGadget;
}

- (BOOL)showSharedLibraryInvitations
{
  return self->_showSharedLibraryInvitations;
}

- (BOOL)showSharedLibrarySharingSuggestions
{
  return self->_showSharedLibrarySharingSuggestions;
}

- (BOOL)showContentSyndication
{
  return self->_showContentSyndication;
}

- (BOOL)allowVideoPlayback
{
  return self->_allowVideoPlayback;
}

- (BOOL)allowLoopPlayback
{
  return self->_allowLoopPlayback;
}

- (BOOL)allowGIFPlayback
{
  return self->_allowGIFPlayback;
}

- (unint64_t)maxSimultaneousVideoCount
{
  return self->_maxSimultaneousVideoCount;
}

- (double)minimumVisibilityForVideoPlayback
{
  return self->_minimumVisibilityForVideoPlayback;
}

- (BOOL)useMockData
{
  return self->_useMockData;
}

- (BOOL)forceDisplayReportJunk
{
  return self->_forceDisplayReportJunk;
}

- (BOOL)forcePortraitBias
{
  return self->_forcePortraitBias;
}

- (BOOL)useSquareSharedAlbumActivity
{
  return self->_useSquareSharedAlbumActivity;
}

- (BOOL)disableSharedAlbumTopMargin
{
  return self->_disableSharedAlbumTopMargin;
}

- (BOOL)alwaysShowSuggestionRenderingOverlay
{
  return self->_alwaysShowSuggestionRenderingOverlay;
}

- (BOOL)delayEditRenders
{
  return self->_delayEditRenders;
}

- (BOOL)useCachedEditRenders
{
  return self->_useCachedEditRenders;
}

- (unint64_t)maxMemoriesToFetch
{
  return self->_maxMemoriesToFetch;
}

+ (NSArray)keyPathsAffectingGadgetVisibility
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
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_showMemories);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  NSStringFromSelector(sel_showSharedAlbumActivity);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  NSStringFromSelector(sel_showRecentInterestSuggestions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v4;
  NSStringFromSelector(sel_showCMMInvitations);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v5;
  NSStringFromSelector(sel_showSurveyQuestions);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v6;
  NSStringFromSelector(sel_showSurveyQuestionsWithProfile);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v7;
  NSStringFromSelector(sel_showFooter);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v8;
  NSStringFromSelector(sel_showVerticalSampleGadgets);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v9;
  NSStringFromSelector(sel_showHorizontalGadget);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v11;
}

@end
