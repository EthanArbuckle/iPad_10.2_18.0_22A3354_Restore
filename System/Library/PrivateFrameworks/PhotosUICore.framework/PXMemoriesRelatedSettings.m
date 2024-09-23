@implementation PXMemoriesRelatedSettings

- (void)setDefaultValues
{
  int HasInternalUI;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PXMemoriesRelatedSettings;
  -[PTSettings setDefaultValues](&v17, sel_setDefaultValues);
  HasInternalUI = PFOSVariantHasInternalUI();
  -[PXMemoriesRelatedSettings setFakePeopleProximity:](self, "setFakePeopleProximity:", 0);
  -[PXMemoriesRelatedSettings setShowLocalMemories:](self, "setShowLocalMemories:", 0);
  -[PXMemoriesRelatedSettings setUseOnlyMusicForTopicInTopPickSuggestions:](self, "setUseOnlyMusicForTopicInTopPickSuggestions:", 0);
  -[PXMemoriesRelatedSettings setIncludeChillMixInMusicForYou:](self, "setIncludeChillMixInMusicForYou:", 0);
  -[PXMemoriesRelatedSettings setIncludeGetUpMixInMusicForYou:](self, "setIncludeGetUpMixInMusicForYou:", 0);
  -[PXMemoriesRelatedSettings setRefreshPhotoKitTimeout:](self, "setRefreshPhotoKitTimeout:", 3.0);
  -[PXMemoriesRelatedSettings setWidgetRefreshTimeInterval:](self, "setWidgetRefreshTimeInterval:", 900.0);
  if (HasInternalUI)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentDomainForName:", *MEMORY[0x1E0CB2B58]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "valueForKey:", CFSTR("PGMinimumNumberOfCuratedAssetsForMemories"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    objc_msgSend(v6, "valueForKey:", CFSTR("PGMinimumNumberOfCuratedAssetsForInterestingMoments"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    -[PXMemoriesRelatedSettings setMinimumNumberOfCuratedAssetsForMemories:](self, "setMinimumNumberOfCuratedAssetsForMemories:", v8);
    -[PXMemoriesRelatedSettings setMinimumNumberOfCuratedAssetsForInterestingMoments:](self, "setMinimumNumberOfCuratedAssetsForInterestingMoments:", v10);
    objc_msgSend(v6, "valueForKey:", CFSTR("PXMemoriesLivingOnFeedbackUIEnabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v13 = objc_msgSend(v11, "BOOLValue");
    else
      v13 = 1;
    -[PXMemoriesRelatedSettings setEnableMemoriesLivingOnFeedback:](self, "setEnableMemoriesLivingOnFeedback:", v13);
    objc_msgSend(v6, "valueForKey:", CFSTR("PXTimelineSchedulerMode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      v16 = objc_msgSend(v14, "unsignedIntegerValue");
    else
      v16 = 0;
    -[PXMemoriesRelatedSettings setTimelineSchedulerMode:](self, "setTimelineSchedulerMode:", v16);

  }
  -[PXMemoriesRelatedSettings setTimelineContentMode:](self, "setTimelineContentMode:", 0);
  -[PXMemoriesRelatedSettings setWidgetSize:](self, "setWidgetSize:", 0);
  -[PXMemoriesRelatedSettings setMinimumNumberOfCuratedAssetsForMovieHeader:](self, "setMinimumNumberOfCuratedAssetsForMovieHeader:", 5);
  -[PXMemoriesRelatedSettings setDeleteBehavior:](self, "setDeleteBehavior:", 0);
  -[PXMemoriesRelatedSettings setRecoverBlacklistedMemories:](self, "setRecoverBlacklistedMemories:", 0);
  -[PXMemoriesRelatedSettings setShowMemoryTitleLayer:](self, "setShowMemoryTitleLayer:", 0);
  -[PXMemoriesRelatedSettings setEnableIPadWideHeader:](self, "setEnableIPadWideHeader:", 0);
  -[PXMemoriesRelatedSettings setEnableDiscoveryFeed:](self, "setEnableDiscoveryFeed:", 0);
  -[PXMemoriesRelatedSettings setDiscoveryRankingMode:](self, "setDiscoveryRankingMode:", 0);
  -[PXMemoriesRelatedSettings setSubtitleFontSize:](self, "setSubtitleFontSize:", 20);
}

- (void)setWidgetSize:(unint64_t)a3
{
  self->_widgetSize = a3;
}

- (void)setWidgetRefreshTimeInterval:(double)a3
{
  self->_widgetRefreshTimeInterval = a3;
}

- (void)setUseOnlyMusicForTopicInTopPickSuggestions:(BOOL)a3
{
  self->_useOnlyMusicForTopicInTopPickSuggestions = a3;
}

- (void)setTimelineSchedulerMode:(unint64_t)a3
{
  self->_timelineSchedulerMode = a3;
}

- (void)setTimelineContentMode:(unint64_t)a3
{
  self->_timelineContentMode = a3;
}

- (void)setSubtitleFontSize:(int64_t)a3
{
  self->_subtitleFontSize = a3;
}

- (void)setShowMemoryTitleLayer:(BOOL)a3
{
  self->_showMemoryTitleLayer = a3;
}

- (void)setRefreshPhotoKitTimeout:(double)a3
{
  self->_refreshPhotoKitTimeout = a3;
}

- (void)setRecoverBlacklistedMemories:(BOOL)a3
{
  self->_recoverBlacklistedMemories = a3;
}

- (void)setMinimumNumberOfCuratedAssetsForMovieHeader:(int64_t)a3
{
  self->_minimumNumberOfCuratedAssetsForMovieHeader = a3;
}

- (void)setMinimumNumberOfCuratedAssetsForMemories:(int64_t)a3
{
  self->_minimumNumberOfCuratedAssetsForMemories = a3;
}

- (void)setMinimumNumberOfCuratedAssetsForInterestingMoments:(int64_t)a3
{
  self->_minimumNumberOfCuratedAssetsForInterestingMoments = a3;
}

- (void)setIncludeGetUpMixInMusicForYou:(BOOL)a3
{
  self->_includeGetUpMixInMusicForYou = a3;
}

- (void)setIncludeChillMixInMusicForYou:(BOOL)a3
{
  self->_includeChillMixInMusicForYou = a3;
}

- (void)setFakePeopleProximity:(BOOL)a3
{
  self->_fakePeopleProximity = a3;
}

- (void)setEnableMemoriesLivingOnFeedback:(BOOL)a3
{
  self->_enableMemoriesLivingOnFeedback = a3;
}

- (void)setEnableIPadWideHeader:(BOOL)a3
{
  self->_enableIPadWideHeader = a3;
}

- (void)setEnableDiscoveryFeed:(BOOL)a3
{
  self->_enableDiscoveryFeed = a3;
}

- (void)setDiscoveryRankingMode:(unint64_t)a3
{
  self->_discoveryRankingMode = a3;
}

- (void)setDeleteBehavior:(unint64_t)a3
{
  self->_deleteBehavior = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (void)performPostSaveActions
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PXMemoriesRelatedSettings;
  -[PXSettings performPostSaveActions](&v21, sel_performPostSaveActions);
  if (PFOSVariantHasInternalUI())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "synchronize");
    v4 = *MEMORY[0x1E0CB2B58];
    objc_msgSend(v3, "persistentDomainForName:", *MEMORY[0x1E0CB2B58]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = -[PXMemoriesRelatedSettings minimumNumberOfCuratedAssetsForMemories](self, "minimumNumberOfCuratedAssetsForMemories");
    v8 = -[PXMemoriesRelatedSettings minimumNumberOfCuratedAssetsForInterestingMoments](self, "minimumNumberOfCuratedAssetsForInterestingMoments");
    objc_msgSend(v6, "valueForKey:", CFSTR("PGMinimumNumberOfCuratedAssetsForMemories"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    v11 = v7 == v10;
    v12 = v7 != v10;
    if (!v11)
    {
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v13, CFSTR("PGMinimumNumberOfCuratedAssetsForMemories"));

      }
      else
      {
        objc_msgSend(v6, "removeObjectForKey:", CFSTR("PGMinimumNumberOfCuratedAssetsForMemories"));
      }
    }
    objc_msgSend(v6, "valueForKey:", CFSTR("PGMinimumNumberOfCuratedAssetsForInterestingMoments"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    if (v8 != v15)
    {
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v16, CFSTR("PGMinimumNumberOfCuratedAssetsForInterestingMoments"));

      }
      else
      {
        objc_msgSend(v6, "removeObjectForKey:", CFSTR("PGMinimumNumberOfCuratedAssetsForInterestingMoments"));
      }
      v12 = 1;
    }
    v17 = -[PXMemoriesRelatedSettings timelineSchedulerMode](self, "timelineSchedulerMode");
    objc_msgSend(v6, "valueForKey:", CFSTR("PXTimelineSchedulerMode"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
    {
      if (v17 != objc_msgSend(v18, "unsignedIntegerValue"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v20, CFSTR("PXTimelineSchedulerMode"));

        goto LABEL_19;
      }
    }
    else if (v18)
    {
      objc_msgSend(v6, "removeObjectForKey:", CFSTR("PXTimelineSchedulerMode"));
      goto LABEL_19;
    }
    if (!v12)
    {
LABEL_20:

      return;
    }
LABEL_19:
    objc_msgSend(v3, "setPersistentDomain:forName:", v6, v4);
    goto LABEL_20;
  }
}

- (BOOL)enableMemoriesLivingOnFeedback
{
  return self->_enableMemoriesLivingOnFeedback;
}

- (BOOL)fakePeopleProximity
{
  return self->_fakePeopleProximity;
}

- (BOOL)showLocalMemories
{
  return self->_showLocalMemories;
}

- (void)setShowLocalMemories:(BOOL)a3
{
  self->_showLocalMemories = a3;
}

- (BOOL)useOnlyMusicForTopicInTopPickSuggestions
{
  return self->_useOnlyMusicForTopicInTopPickSuggestions;
}

- (BOOL)includeChillMixInMusicForYou
{
  return self->_includeChillMixInMusicForYou;
}

- (BOOL)includeGetUpMixInMusicForYou
{
  return self->_includeGetUpMixInMusicForYou;
}

- (double)refreshPhotoKitTimeout
{
  return self->_refreshPhotoKitTimeout;
}

- (double)widgetRefreshTimeInterval
{
  return self->_widgetRefreshTimeInterval;
}

- (int64_t)minimumNumberOfCuratedAssetsForInterestingMoments
{
  return self->_minimumNumberOfCuratedAssetsForInterestingMoments;
}

- (int64_t)minimumNumberOfCuratedAssetsForMemories
{
  return self->_minimumNumberOfCuratedAssetsForMemories;
}

- (int64_t)minimumNumberOfCuratedAssetsForMovieHeader
{
  return self->_minimumNumberOfCuratedAssetsForMovieHeader;
}

- (unint64_t)deleteBehavior
{
  return self->_deleteBehavior;
}

- (BOOL)recoverBlacklistedMemories
{
  return self->_recoverBlacklistedMemories;
}

- (BOOL)showMemoryTitleLayer
{
  return self->_showMemoryTitleLayer;
}

- (BOOL)enableIPadWideHeader
{
  return self->_enableIPadWideHeader;
}

- (int64_t)subtitleFontSize
{
  return self->_subtitleFontSize;
}

- (unint64_t)timelineContentMode
{
  return self->_timelineContentMode;
}

- (unint64_t)widgetSize
{
  return self->_widgetSize;
}

- (unint64_t)timelineSchedulerMode
{
  return self->_timelineSchedulerMode;
}

- (BOOL)enableDiscoveryFeed
{
  return self->_enableDiscoveryFeed;
}

- (unint64_t)discoveryRankingMode
{
  return self->_discoveryRankingMode;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_62275 != -1)
    dispatch_once(&sharedInstance_onceToken_62275, &__block_literal_global_62276);
  return (id)sharedInstance_sharedInstance_62277;
}

+ (id)schedulerOptionsFromTimelineSchedulerMode:(unint64_t)a3
{
  PXTimelineSchedulerOptions *v4;
  PXTimelineSchedulerOptions *v5;
  double v6;
  void *v7;

  v4 = objc_alloc_init(PXTimelineSchedulerOptions);
  v5 = v4;
  switch(a3)
  {
    case 0uLL:
      v6 = 3600.0;
      goto LABEL_8;
    case 1uLL:
      -[PXTimelineSchedulerOptions setTimelineEntryDuration:](v4, "setTimelineEntryDuration:", 10800.0);
      -[PXTimelineSchedulerOptions timelineEntryDuration](v5, "timelineEntryDuration");
      -[PXTimelineSchedulerOptions setBestContentEntryDuration:](v5, "setBestContentEntryDuration:");
      v7 = &unk_1E53E8EF8;
      goto LABEL_6;
    case 2uLL:
      -[PXTimelineSchedulerOptions setTimelineEntryDuration:](v4, "setTimelineEntryDuration:", 86400.0);
      -[PXTimelineSchedulerOptions timelineEntryDuration](v5, "timelineEntryDuration");
      -[PXTimelineSchedulerOptions setBestContentEntryDuration:](v5, "setBestContentEntryDuration:");
      v7 = &unk_1E53E8F10;
      goto LABEL_6;
    case 3uLL:
      -[PXTimelineSchedulerOptions setTimelineEntryDuration:](v4, "setTimelineEntryDuration:", 21600.0);
      -[PXTimelineSchedulerOptions timelineEntryDuration](v5, "timelineEntryDuration");
      -[PXTimelineSchedulerOptions setBestContentEntryDuration:](v5, "setBestContentEntryDuration:");
      v7 = &unk_1E53E8F28;
LABEL_6:
      -[PXTimelineSchedulerOptions setBestContentStartTimeHours:](v5, "setBestContentStartTimeHours:", v7);
      break;
    case 4uLL:
      v6 = 1800.0;
LABEL_8:
      -[PXTimelineSchedulerOptions setTimelineEntryDuration:](v4, "setTimelineEntryDuration:", v6);
      -[PXTimelineSchedulerOptions setBestContentEntryDuration:](v5, "setBestContentEntryDuration:", 7200.0);
      break;
    default:
      return v5;
  }
  return v5;
}

+ (BOOL)isAssetCountAcceptableForMemoryPlayback:(int64_t)a3
{
  void *v4;
  BOOL v6;

  +[PXMemoriesRelatedSettings sharedInstance](PXMemoriesRelatedSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "minimumNumberOfCuratedAssetsForMovieHeader") <= a3 && *MEMORY[0x1E0CD1F00] >= a3;

  return v6;
}

+ (BOOL)isAssetCountAcceptableForMemoryLensPlayback:(int64_t)a3
{
  void *v4;
  BOOL v5;
  void *v6;

  +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "minimumNumberOfAssetsForPlaybackAsMemory") <= a3)
  {
    +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "maximumNumberOfAssetsForPlaybackAsMemory") >= a3;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __43__PXMemoriesRelatedSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "memoriesRelated");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_62277;
  sharedInstance_sharedInstance_62277 = v0;

}

+ (id)settingsControllerModule
{
  void *v3;
  uint64_t v4;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
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
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
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
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
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
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
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
  id v124;
  void *v125;
  void *v126;
  id v128;
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
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  _QWORD v188[5];
  _QWORD v189[5];
  _QWORD v190[5];
  _QWORD v191[5];
  _QWORD v192[5];
  _QWORD v193[5];
  _QWORD v194[5];
  _QWORD v195[5];
  _QWORD v196[5];
  _QWORD v197[5];
  _QWORD v198[5];
  _QWORD v199[5];
  _QWORD v200[5];
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  _QWORD v205[5];
  _QWORD v206[5];
  _QWORD v207[5];
  _QWORD v208[5];
  _QWORD v209[5];
  _QWORD v210[13];
  void *v211;
  _QWORD v212[2];
  _QWORD v213[5];
  _QWORD v214[4];
  _QWORD v215[8];
  _QWORD v216[6];
  _QWORD v217[2];
  void *v218;
  _QWORD v219[5];
  _QWORD v220[4];
  uint64_t v221;
  _QWORD v222[5];
  _QWORD v223[5];
  _QWORD v224[11];
  _BYTE v225[128];
  uint64_t v226;

  v226 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D83010];
  v4 = MEMORY[0x1E0C809B0];
  v209[0] = MEMORY[0x1E0C809B0];
  v209[1] = 3221225472;
  v209[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke;
  v209[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v209[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v209);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:action:", CFSTR("Graph Service Status"), v5);
  v187 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D83010];
  v208[0] = v4;
  v208[1] = 3221225472;
  v208[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2;
  v208[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v208[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v208);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:action:", CFSTR("Invalidate Transient Caches"), v7);
  v186 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D83010];
  v207[0] = v4;
  v207[1] = 3221225472;
  v207[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_3;
  v207[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v207[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v207);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:action:", CFSTR("Invalidate Persistent Caches"), v9);
  v185 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_80526);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:action:", CFSTR("Trigger Graph Rebuild"), v11);
  v184 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83010];
  v206[0] = v4;
  v206[1] = 3221225472;
  v206[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_6;
  v206[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v206[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v206);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:action:", CFSTR("Launch Highlights Enrichment"), v13);
  v183 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83010];
  v205[0] = v4;
  v205[1] = 3221225472;
  v205[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_9;
  v205[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v205[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v205);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rowWithTitle:action:", CFSTR("Launch Month / Year Enrichment"), v15);
  v182 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:output:", CFSTR("Statistics"), &__block_literal_global_167_80531);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Library Estimates"), &__block_literal_global_171_80533);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Export Graph"), &__block_literal_global_175_80535);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v201 = 0u;
  v202 = 0u;
  v203 = 0u;
  v204 = 0u;
  v17 = objc_msgSend(&unk_1E53E92B8, "countByEnumeratingWithState:objects:count:", &v201, v225, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v202;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v202 != v19)
          objc_enumerationMutation(&unk_1E53E92B8);
        v21 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * i);
        if (objc_msgSend(v21, "integerValue"))
        {
          objc_msgSend(v21, "description");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        else
        {
          objc_msgSend(v16, "addObject:", CFSTR("Default"));
        }
      }
      v18 = objc_msgSend(&unk_1E53E92B8, "countByEnumeratingWithState:objects:count:", &v201, v225, 16);
    }
    while (v18);
  }
  v23 = (void *)MEMORY[0x1E0D83048];
  +[PXContextualMemoriesSettingsTableViewController title](PXContextualMemoriesSettingsTableViewController, "title");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "px_rowWithTitle:action:", v24, &__block_literal_global_202_80538);
  v25 = objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0D83078];
  v224[0] = v187;
  v224[1] = v186;
  v224[2] = v185;
  v224[3] = v184;
  v224[4] = v183;
  v224[5] = v182;
  v224[6] = v181;
  v224[7] = v180;
  v224[8] = v179;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Local Memories"), CFSTR("showLocalMemories"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v224[9] = v27;
  v152 = (void *)v25;
  v224[10] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v224, 11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sectionWithRows:title:", v28, CFSTR("General"));
  v178 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Existing Memories Inspector"), &__block_literal_global_215);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Exercise Memory Generation"), &__block_literal_global_222);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Memory Generation Logs - Last Day"), &__block_literal_global_253_80545);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Memory Generation Logs - All"), &__block_literal_global_260);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Existing Suggestions Inspector"), &__block_literal_global_264);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Suggesters Inspector"), &__block_literal_global_271);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Exercise Suggestion Generation"), &__block_literal_global_278);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Suggestion Generation Logs - Last Day"), &__block_literal_global_291_80551);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Suggestion Generation Logs - All"), &__block_literal_global_297_80553);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Score Lab"), &__block_literal_global_301);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0D83010];
  v200[0] = v4;
  v200[1] = 3221225472;
  v200[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_12_305;
  v200[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v200[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v200);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "rowWithTitle:action:", CFSTR("Create Contextual Memory"), v30);
  v167 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x1E0D83010];
  v199[0] = v4;
  v199[1] = 3221225472;
  v199[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_16;
  v199[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v199[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v199);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rowWithTitle:action:", CFSTR("Statistics"), v32);
  v166 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)MEMORY[0x1E0D83010];
  v198[0] = v4;
  v198[1] = 3221225472;
  v198[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_19;
  v198[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v198[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v198);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rowWithTitle:action:", CFSTR("Generate Questions"), v34);
  v165 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1E0D83010];
  v197[0] = v4;
  v197[1] = 3221225472;
  v197[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_20;
  v197[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v197[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v197);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "rowWithTitle:action:", CFSTR("Clear Unanswered Questions"), v36);
  v37 = objc_claimAutoreleasedReturnValue();

  v38 = (void *)MEMORY[0x1E0D83010];
  v196[0] = v4;
  v196[1] = 3221225472;
  v196[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_23;
  v196[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v196[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v196);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "rowWithTitle:action:", CFSTR("🔮 Generate Music Quality Questions"), v39);
  v40 = objc_claimAutoreleasedReturnValue();

  v41 = (void *)MEMORY[0x1E0D83010];
  v195[0] = v4;
  v195[1] = 3221225472;
  v195[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_24;
  v195[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v195[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v195);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "rowWithTitle:action:", CFSTR("🔮 Generate Social Group Questions"), v42);
  v43 = objc_claimAutoreleasedReturnValue();

  v44 = (void *)MEMORY[0x1E0D83078];
  v223[0] = v166;
  v223[1] = v165;
  v150 = (void *)v40;
  v151 = (void *)v37;
  v223[2] = v37;
  v223[3] = v40;
  v149 = (void *)v43;
  v223[4] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v223, 5);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "sectionWithRows:title:", v45, CFSTR("Photos Challenge"));
  v164 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = (void *)MEMORY[0x1E0D83010];
  v47 = MEMORY[0x1E0C809B0];
  v194[0] = MEMORY[0x1E0C809B0];
  v194[1] = 3221225472;
  v194[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_25;
  v194[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v194[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v194);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "rowWithTitle:action:", CFSTR("Music Curation Cache Status"), v48);
  v49 = objc_claimAutoreleasedReturnValue();

  v50 = (void *)MEMORY[0x1E0D83010];
  v193[0] = v47;
  v193[1] = 3221225472;
  v193[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2_360;
  v193[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v193[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v193);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "rowWithTitle:action:", CFSTR("Music Curation Clear Cache"), v51);
  v52 = objc_claimAutoreleasedReturnValue();

  v53 = (void *)MEMORY[0x1E0D83078];
  v147 = (void *)v52;
  v148 = (void *)v49;
  v222[0] = v49;
  v222[1] = v52;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use only human-curated for Top Picks"), CFSTR("useOnlyMusicForTopicInTopPickSuggestions"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v222[2] = v54;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Include Chill Mix in Music For You"), CFSTR("includeChillMixInMusicForYou"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v222[3] = v55;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Include Get Up Mix in Music For You"), CFSTR("includeGetUpMixInMusicForYou"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v222[4] = v56;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v222, 5);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "sectionWithRows:title:", v57, CFSTR("Music Curation"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Meanings Inspector"), &__block_literal_global_392);
  v58 = objc_claimAutoreleasedReturnValue();
  v59 = (void *)MEMORY[0x1E0D83078];
  v146 = (void *)v58;
  v221 = v58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v221, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "sectionWithRows:title:", v60, CFSTR("Meanings"));
  v163 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = (void *)MEMORY[0x1E0D83078];
  v220[0] = v177;
  v220[1] = v176;
  v220[2] = v175;
  v220[3] = v174;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v220, 4);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "sectionWithRows:title:", v62, CFSTR("Memory Debug"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = (void *)MEMORY[0x1E0D83078];
  v219[0] = v173;
  v219[1] = v172;
  v219[2] = v171;
  v219[3] = v170;
  v219[4] = v169;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v219, 5);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "sectionWithRows:title:", v64, CFSTR("Suggestion Debug"));
  v161 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = (void *)MEMORY[0x1E0D83078];
  v218 = v168;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v218, 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "sectionWithRows:title:", v66, CFSTR("Curation Lab"));
  v160 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = (void *)MEMORY[0x1E0D83078];
  v217[0] = v167;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Fake People Proximity"), CFSTR("fakePeopleProximity"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v217[1] = v68;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v217, 2);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "sectionWithRows:title:", v69, CFSTR("Contextual"));
  v159 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = (void *)MEMORY[0x1E0D83010];
  v71 = MEMORY[0x1E0C809B0];
  v192[0] = MEMORY[0x1E0C809B0];
  v192[1] = 3221225472;
  v192[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_6_410;
  v192[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v192[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v192);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "rowWithTitle:action:", CFSTR("Remove All Memories"), v72);
  v158 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = (void *)MEMORY[0x1E0D83010];
  v191[0] = v71;
  v191[1] = 3221225472;
  v191[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_9_421;
  v191[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v191[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v191);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "rowWithTitle:action:", CFSTR("Create New Memories"), v74);
  v157 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_430);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "rowWithTitle:action:", CFSTR("Reset Rejected Memories"), v76);
  v156 = (void *)objc_claimAutoreleasedReturnValue();

  v77 = (void *)MEMORY[0x1E0D83010];
  v190[0] = v71;
  v190[1] = 3221225472;
  v190[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_439;
  v190[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v190[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v190);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "rowWithTitle:action:", CFSTR("Create Memories Notification"), v78);
  v79 = objc_claimAutoreleasedReturnValue();

  v80 = (void *)MEMORY[0x1E0D83010];
  v189[0] = v71;
  v189[1] = 3221225472;
  v189[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_4_450;
  v189[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v189[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v189);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "rowWithTitle:action:", CFSTR("Simulate Memories Notification"), v81);
  v82 = objc_claimAutoreleasedReturnValue();

  v83 = (void *)MEMORY[0x1E0D83010];
  v188[0] = v71;
  v188[1] = 3221225472;
  v188[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_6_460;
  v188[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v188[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v188);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "rowWithTitle:action:", CFSTR("Reset Memories Notification State"), v84);
  v85 = objc_claimAutoreleasedReturnValue();

  v86 = (void *)MEMORY[0x1E0D83078];
  v216[0] = v158;
  v216[1] = v157;
  v216[2] = v156;
  v143 = (void *)v82;
  v144 = (void *)v79;
  v216[3] = v79;
  v216[4] = v82;
  v142 = (void *)v85;
  v216[5] = v85;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v216, 6);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "sectionWithRows:title:", v87, CFSTR("Memories"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();

  v153 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Memories Living On Feedback"), CFSTR("enableMemoriesLivingOnFeedback"));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v215[0] = v140;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Min # for Memories"), CFSTR("minimumNumberOfCuratedAssetsForMemories"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "possibleValues:titles:", &unk_1E53E92B8, v16);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v215[1] = v136;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Min # for Interesting Moments"), CFSTR("minimumNumberOfCuratedAssetsForInterestingMoments"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "possibleValues:titles:", &unk_1E53E92B8, v16);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v215[2] = v132;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Min # for Movie Header"), CFSTR("minimumNumberOfCuratedAssetsForMovieHeader"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "possibleValues:titles:", &unk_1E53E92B8, v16);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v215[3] = v88;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Delete Behavior"), CFSTR("deleteBehavior"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "possibleValues:titles:", &unk_1E53E92D0, &unk_1E53E92E8);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v215[4] = v90;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Memory Title Layer"), CFSTR("showMemoryTitleLayer"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v215[5] = v91;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("iPad Wide Header"), CFSTR("enableIPadWideHeader"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v215[6] = v92;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Subtitle font size"), CFSTR("subtitleFontSize"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "minValue:maxValue:", 10.0, 30.0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "px_increment:", 1.0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v215[7] = v95;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v215, 8);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "sectionWithRows:title:", v96, CFSTR("Memories UI"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:output:", CFSTR("Generate Timeline"), &__block_literal_global_517);
  v97 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:action:", CFSTR("Timeline Inspector"), &__block_literal_global_530_80604);
  v98 = objc_claimAutoreleasedReturnValue();
  +[PXTimelineSize sizeDescriptionForSizeClass:](PXTimelineSize, "sizeDescriptionForSizeClass:", 0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v214[0] = v99;
  +[PXTimelineSize sizeDescriptionForSizeClass:](PXTimelineSize, "sizeDescriptionForSizeClass:", 1);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v214[1] = v100;
  +[PXTimelineSize sizeDescriptionForSizeClass:](PXTimelineSize, "sizeDescriptionForSizeClass:", 2);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v214[2] = v101;
  +[PXTimelineSize sizeDescriptionForSizeClass:](PXTimelineSize, "sizeDescriptionForSizeClass:", 3);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v214[3] = v102;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v214, 4);
  v103 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Widget Size"), CFSTR("widgetSize"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = (void *)v103;
  objc_msgSend(v104, "possibleValues:titles:", &unk_1E53E9300, v103);
  v105 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Content Mode"), CFSTR("timelineContentMode"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "possibleValues:titles:", &unk_1E53E9318, &unk_1E53E9330);
  v107 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Scheduler Mode"), CFSTR("timelineSchedulerMode"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "possibleValues:titles:", &unk_1E53E9348, &unk_1E53E9360);
  v109 = objc_claimAutoreleasedReturnValue();

  v110 = (void *)MEMORY[0x1E0D83078];
  v139 = (void *)v98;
  v141 = (void *)v97;
  v213[0] = v97;
  v213[1] = v98;
  v133 = (void *)v107;
  v135 = (void *)v105;
  v213[2] = v105;
  v213[3] = v107;
  v131 = (void *)v109;
  v213[4] = v109;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v213, 5);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "sectionWithRows:title:", v111, CFSTR("Timeline"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Discovery Feed"), CFSTR("enableDiscoveryFeed"));
  v113 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Ranking Mode"), CFSTR("discoveryRankingMode"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "possibleValues:titles:", &unk_1E53E9378, &unk_1E53E9390);
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  v116 = (void *)MEMORY[0x1E0D83078];
  v129 = (void *)v113;
  v212[0] = v113;
  v212[1] = v115;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v212, 2);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "sectionWithRows:title:", v117, CFSTR("Discovery"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83010], "px_rowWithTitle:continuousOutputProducer:", CFSTR("Continuous Service Status"), &__block_literal_global_596);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = (void *)MEMORY[0x1E0D83078];
  v211 = v119;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v211, 1);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "sectionWithRows:title:", v121, CFSTR("Debug"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v210[0] = v178;
  v210[1] = v164;
  v210[2] = v163;
  v210[3] = v162;
  v210[4] = v161;
  v210[5] = v160;
  v210[6] = v159;
  v210[7] = v155;
  v210[8] = v154;
  v210[9] = v112;
  v210[10] = v118;
  v210[11] = v122;
  v210[12] = v123;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v210, 13);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = (void *)objc_msgSend(v124, "initWithArray:", v125);

  if (v145)
    objc_msgSend(v126, "insertObject:atIndex:", v145, 2);
  objc_msgSend(MEMORY[0x1E0D83078], "moduleWithTitle:contents:", CFSTR("Memories & Related"), v126);
  v128 = (id)objc_claimAutoreleasedReturnValue();

  return v128;
}

+ (void)_generateQuestionsWithOptions:(int64_t)a3 count:(unint64_t)a4 inModuleController:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;
  unint64_t v14;
  id v15;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Generating New Questions..."), 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__PXMemoriesRelatedSettings_UI___generateQuestionsWithOptions_count_inModuleController___block_invoke;
  v11[3] = &unk_1E51446C8;
  v12 = v8;
  v13 = a3;
  v14 = a4;
  v15 = a1;
  v10 = v8;
  objc_msgSend(v10, "presentViewController:animated:completion:", v9, 1, v11);

}

+ (void)_presentAlertForMemoriesGenerationResult:(id)a3 error:(id)a4 inModuleController:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  const __CFString *v14;
  id v15;

  v15 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 0, 0);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PHMemoryIdentifiersKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "count");
  if (v15)
  {
    objc_msgSend(v15, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("Error while generating memories");
  }
  else
  {
    v14 = CFSTR("memories");
    if (v11 == 1)
      v14 = CFSTR("memory");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Generated %lu %@."), v11, v14);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
  }
  objc_msgSend(a1, "_presentAlertWithTitle:andMessage:inModuleController:", v13, v12, v8);

}

+ (void)_presentAlertWithTitle:(id)a3 andMessage:(id)a4 inModuleController:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  id v10;

  v7 = (void *)MEMORY[0x1E0DC3450];
  v8 = a5;
  objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v9);

  objc_msgSend(v8, "presentViewController:animated:completion:", v10, 1, 0);
}

void __88__PXMemoriesRelatedSettings_UI___generateQuestionsWithOptions_count_inModuleController___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D721E0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D721A8]);

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoAnalysisClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__PXMemoriesRelatedSettings_UI___generateQuestionsWithOptions_count_inModuleController___block_invoke_2;
  v10[3] = &unk_1E5122ED0;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v11 = v7;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v6, "requestGenerateQuestionsWithOptions:reply:", v2, v10);

}

void __88__PXMemoriesRelatedSettings_UI___generateQuestionsWithOptions_count_inModuleController___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  v9 = *(id *)(a1 + 32);
  v10 = v6;
  v7 = v6;
  v8 = v5;
  px_dispatch_on_main_queue();

}

void __88__PXMemoriesRelatedSettings_UI___generateQuestionsWithOptions_count_inModuleController___block_invoke_3(uint64_t a1)
{
  void *v2;
  char v3;
  __CFString *v4;
  const __CFString *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;

  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 0, 0);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D721D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Successfully Generated %lu Questions."), *(_QWORD *)(a1 + 56));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    v6 = CFSTR("You may need to relaunch Photos to view.");
  }
  else
  {

    v7 = *(void **)(a1 + 48);
    if (v7)
    {
      objc_msgSend(v7, "localizedDescription");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = CFSTR("You may need to rebuild your graph.");
    }
    v5 = CFSTR("Question Generation Failed");
  }
  v8 = (__CFString *)v5;
  objc_msgSend(*(id *)(a1 + 64), "_presentAlertWithTitle:andMessage:inModuleController:", v5, v6, *(_QWORD *)(a1 + 32));

}

BOOL __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "graphStatusDescription:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;

  v8 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v7, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_presentAlertWithTitle:andMessage:inModuleController:", CFSTR("Graph Service Status"), v9, v4);

  }
  else
  {
    objc_msgSend(v8, "_presentAlertWithTitle:andMessage:inModuleController:", CFSTR("Graph Service Status"), v6, v4);
  }

  return v7 != 0;
}

BOOL __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v5, "invalidateTransientGraphCachesAndReturnError:", &v10);
  v6 = v10;

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v6, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_presentAlertWithTitle:andMessage:inModuleController:", CFSTR("Error while invalidating transient caches"), v8, v4);

  }
  return v6 == 0;
}

BOOL __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v5, "invalidatePersistentGraphCachesAndReturnError:", &v10);
  v6 = v10;

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v6, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_presentAlertWithTitle:andMessage:inModuleController:", CFSTR("Error while invalidating persistent caches"), v8, v4);

  }
  return v6 == 0;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_presentAlertWithTitle:andMessage:inModuleController:", CFSTR("Starting Enrichment"), CFSTR("This will take a while…"), v4);
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_7;
  v9[3] = &unk_1E5144EB8;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = v4;
  v11 = v6;
  v7 = v4;
  dispatch_async(v5, v9);

  return 1;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_presentAlertWithTitle:andMessage:inModuleController:", CFSTR("Starting Enrichment"), CFSTR("This will take a few seconds…"), v4);
  +[PXContextualMemoriesSettingsController sharedController](PXContextualMemoriesSettingsController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_10;
  v9[3] = &unk_1E5122AA0;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = v4;
  v11 = v6;
  v7 = v4;
  objc_msgSend(v5, "requestUpdatedContextualMemoriesSettingsWithOptions:completionHandler:", 0, v9);

  return 1;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_12_305(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Generating Contextual Memory..."), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentViewController:animated:completion:", v5, 1, 0);
  +[PXContextualMemoriesSettingsController sharedController](PXContextualMemoriesSettingsController, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_13_309;
  v10[3] = &unk_1E5122AA0;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v4;
  v12 = v7;
  v8 = v4;
  objc_msgSend(v6, "requestUpdatedContextualMemoriesSettingsWithOptions:completionHandler:", 0, v10);

  return 1;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  unsigned int v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v27;
  void *v28;
  id obj;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = objc_claimAutoreleasedReturnValue();

  v28 = (void *)v4;
  objc_msgSend(MEMORY[0x1E0CD1720], "fetchAnsweredQuestionsWithOptions:validQuestionsOnly:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(obj);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "type");
        v12 = CFSTR("Unknown");
        if (v11 <= 0x1E)
          v12 = off_1E5122EF0[v11];
        v13 = v12;
        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
          v16 = (void *)v14;
        else
          v16 = &unk_1E53EC8D0;
        v17 = v16;

        v18 = (void *)MEMORY[0x1E0CB37E8];
        v19 = objc_msgSend(v17, "integerValue");

        objc_msgSend(v18, "numberWithInteger:", v19 + 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, v13);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v8);
  }

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("\n"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Total Answered: %lu\n\n"), objc_msgSend(obj, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "appendString:", v22);

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_17;
  v30[3] = &unk_1E513E138;
  v23 = v21;
  v31 = v23;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v30);
  v24 = v27;
  v25 = v23;
  px_dispatch_on_main_queue();

  return 1;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_19(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_generateQuestionsWithOptions:count:inModuleController:", 533075965, 100, a3);
  return 1;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1720], "fetchUnansweredQuestionsWithOptions:validQuestionsOnly:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_21;
  v14[3] = &unk_1E5149198;
  v15 = v6;
  v7 = v6;
  objc_msgSend(v4, "performChangesAndWait:error:", v14, &v13);
  v8 = v13;
  v12 = v3;
  v9 = v3;
  v10 = v8;
  px_dispatch_on_main_queue();

  return 1;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_23(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_generateQuestionsWithOptions:count:inModuleController:", 0x4000, 100, a3);
  return 1;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_generateQuestionsWithOptions:count:inModuleController:", 0x10000, 100, a3);
  return 1;
}

BOOL __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v5 = a2;
  v6 = a3;
  v7 = dispatch_group_create();
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__80719;
  v32 = __Block_byref_object_dispose__80720;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__80719;
  v26 = __Block_byref_object_dispose__80720;
  v27 = 0;
  dispatch_group_enter(v7);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoAnalysisClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_350;
  v18[3] = &unk_1E5122D70;
  v20 = &v28;
  v21 = &v22;
  v10 = v7;
  v19 = v10;
  objc_msgSend(v9, "requestMusicCacheStatusWithReply:", v18);

  v11 = dispatch_time(0, 60000000000);
  dispatch_group_wait(v10, v11);
  v12 = v29[5];
  v13 = *(void **)(a1 + 32);
  if (v12)
  {
    objc_msgSend(v13, "_presentAlertWithTitle:andMessage:inModuleController:", CFSTR("Music Cache Status"), v29[5], v6);
  }
  else
  {
    objc_msgSend((id)v23[5], "localizedDescription");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (const __CFString *)v14;
    else
      v16 = CFSTR("Unknown Error");
    objc_msgSend(v13, "_presentAlertWithTitle:andMessage:inModuleController:", CFSTR("Error"), v16, v6);

  }
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v12 != 0;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2_360(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, CFSTR("Are you sure? This action cannot be undone."), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3448];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_3_366;
  v15 = &unk_1E5122D98;
  v7 = *(_QWORD *)(a1 + 32);
  v16 = v4;
  v17 = v7;
  v8 = v4;
  objc_msgSend(v6, "actionWithTitle:style:handler:", CFSTR("Remove All Songs from Music Cache"), 2, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v9, v12, v13, v14, v15);

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v10);

  objc_msgSend(v8, "presentViewController:animated:completion:", v5, 1, 0);
  return 1;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_6_410(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, CFSTR("Are you sure? This action cannot be undone."), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3448];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_7_413;
  v15 = &unk_1E5122D98;
  v7 = *(_QWORD *)(a1 + 32);
  v16 = v4;
  v17 = v7;
  v8 = v4;
  objc_msgSend(v6, "actionWithTitle:style:handler:", CFSTR("Delete All Memories"), 2, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v9, v12, v13, v14, v15);

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v10);

  objc_msgSend(v8, "presentViewController:animated:completion:", v5, 1, 0);
  return 1;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_9_421(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Generating Memories..."), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentViewController:animated:completion:", v5, 1, 0);
  +[PXContextualMemoriesSettingsController sharedController](PXContextualMemoriesSettingsController, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_10_424;
  v10[3] = &unk_1E5122AA0;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v4;
  v12 = v7;
  v8 = v4;
  objc_msgSend(v6, "requestUpdatedContextualMemoriesSettingsWithOptions:completionHandler:", 0, v10);

  return 1;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_439(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Generating Memories Notification..."), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentViewController:animated:completion:", v5, 1, 0);
  v6 = objc_alloc_init(MEMORY[0x1E0CD1650]);
  objc_msgSend(v6, "setReason:", 2);
  objc_msgSend(v6, "setExtraParameters:", &unk_1E53F0AC0);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPhotoLibrary:", v7);

  v8 = (void *)MEMORY[0x1E0CD1630];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2_446;
  v12[3] = &unk_1E5122D48;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v4;
  v14 = v9;
  v10 = v4;
  objc_msgSend(v8, "generateMemoriesWithOptions:completion:", v6, v12);

  return 1;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_4_450(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("notificationState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_5_453;
  v11[3] = &unk_1E5122D48;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v4;
  v13 = v8;
  v9 = v4;
  objc_msgSend(v5, "simulateMemoriesNotificationWithOptions:reply:", v7, v11);

  return 1;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_6_460(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("notificationState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_7_461;
  v11[3] = &unk_1E5122D48;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v4;
  v13 = v8;
  v9 = v4;
  objc_msgSend(v5, "simulateMemoriesNotificationWithOptions:reply:", v7, v11);

  return 1;
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_594(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v4 = a2;
  v5 = a3;
  +[PXPhotoAnalysisStatusController sharedStatusController](PXPhotoAnalysisStatusController, "sharedStatusController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "update");
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2_598;
  block[3] = &unk_1E513DE18;
  v13 = v5;
  v14 = v4;
  v12 = v6;
  v8 = v6;
  v9 = v4;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2_598(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
  {
    v3 = MEMORY[0x1E0C809B0];
    v4 = MEMORY[0x1E0C80D38];
    do
    {
      v5[0] = v3;
      v5[1] = 3221225472;
      v5[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_3_599;
      v5[3] = &unk_1E5148CE0;
      v7 = *(id *)(a1 + 48);
      v6 = *(id *)(a1 + 32);
      dispatch_sync(v4, v5);
      objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 2.0);

      result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    while ((result & 1) != 0);
  }
  return result;
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_3_599(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("=== %@ ===\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v6, "graphStatusDescription:", &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v8, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "stateDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_3_529(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  PXTimelineContentModeTableViewController *v8;
  double v9;
  double v10;
  void *v11;
  PXTimelineDataSource *v12;
  id v13;

  v2 = a2;
  +[PXMemoriesRelatedSettings sharedInstance](PXMemoriesRelatedSettings, "sharedInstance");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v13, "timelineContentMode");
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v13, "widgetSize");
  +[PXTimelineSize widgetSizeForSizeClass:](PXTimelineSize, "widgetSizeForSizeClass:", v5);
  if (v3)
  {
    v8 = -[PXTimelineContentModeTableViewController initWithContentMode:widgetSizeClass:]([PXTimelineContentModeTableViewController alloc], "initWithContentMode:widgetSizeClass:", v3, objc_msgSend(v13, "widgetSize"));
  }
  else
  {
    v9 = v6;
    v10 = v7;
    +[PXWidgetTimeline timelineFromLibrary:forWidgetSize:timelineSize:](PXWidgetTimeline, "timelineFromLibrary:forWidgetSize:timelineSize:", v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PXTimelineDataSource initWithPhotoLibrary:forWidgetSize:]([PXTimelineDataSource alloc], "initWithPhotoLibrary:forWidgetSize:", v4, v9, v10);
    v8 = -[PXSettingsTimelineInspectorViewController initWithWidgetSizeClass:timeline:dataSource:]([PXSettingsTimelineInspectorViewController alloc], "initWithWidgetSizeClass:timeline:dataSource:", objc_msgSend(v13, "widgetSize"), v11, v12);

  }
  objc_msgSend(v2, "pushViewController:animated:", v8, 1);

}

__CFString *__57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_516()
{
  void *v0;
  void *v1;
  id v2;
  __CFString *v3;
  _QWORD v5[4];
  __CFString *v6;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXWidgetTimeline timelineFromLibrary:forWidgetSize:timelineSize:](PXWidgetTimeline, "timelineFromLibrary:forWidgetSize:timelineSize:", v0, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v1, "count"))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v2, "appendFormat:", CFSTR("%lu Timeline Entries Generated\n"), objc_msgSend(v1, "count"));
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2_523;
    v5[3] = &unk_1E5122E20;
    v3 = (__CFString *)v2;
    v6 = v3;
    objc_msgSend(v1, "enumerateObjectsUsingBlock:", v5);

  }
  else
  {
    v3 = CFSTR("No TimelineEntries Generated.");
  }

  return v3;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2_523(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("TimelineEntry[%lu] %@\n"), a3, a2);
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_7_461(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  const __CFString *v5;
  id v6;

  if (a3)
  {
    objc_msgSend(a3, "description");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("Resetting Notification State failed");
  }
  else
  {
    v4 = 0;
    v5 = CFSTR("Resetting Notification State done");
  }
  v6 = (id)v4;
  objc_msgSend(*(id *)(a1 + 40), "_presentAlertWithTitle:andMessage:inModuleController:", v5, v4, *(_QWORD *)(a1 + 32));

}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_5_453(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  const __CFString *v5;
  id v6;

  if (a3)
  {
    objc_msgSend(a3, "description");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("Simulation failed");
  }
  else
  {
    v4 = 0;
    v5 = CFSTR("Simulation done");
  }
  v6 = (id)v4;
  objc_msgSend(*(id *)(a1 + 40), "_presentAlertWithTitle:andMessage:inModuleController:", v5, v4, *(_QWORD *)(a1 + 32));

}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2_446(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  __int128 v9;
  id v10;

  v5 = a2;
  v10 = a3;
  v9 = *(_OWORD *)(a1 + 32);
  v6 = (id)v9;
  v7 = v10;
  v8 = v5;
  px_dispatch_on_main_queue();

}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_3_447(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 56), "_presentAlertForMemoriesGenerationResult:error:inModuleController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_13_429(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v5 = PXMemoriesResetRejected(v4, 0, &v12);
  v6 = v12;
  if ((v5 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error %@"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Resetting rejected Memories failed"), v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v10);

    objc_msgSend(v3, "presentViewController:animated:completion:", v9, 0, 0);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Resetting rejected Memories failed with error %@", buf, 0xCu);
    }

  }
  return 1;
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_10_424(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v12;
  _QWORD v13[4];
  __int128 v14;

  v3 = (objc_class *)MEMORY[0x1E0CD1650];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setReason:", 1);
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDate:", v6);

  objc_msgSend(v4, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocation:", v7);

  objc_msgSend(v4, "peopleNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPeopleNames:", v8);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPhotoLibrary:", v9);

  v10 = (void *)MEMORY[0x1E0CD1630];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_11_425;
  v13[3] = &unk_1E5122D48;
  v12 = *(_OWORD *)(a1 + 32);
  v11 = (id)v12;
  v14 = v12;
  objc_msgSend(v10, "generateMemoriesWithOptions:completion:", v5, v13);

}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_11_425(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  __int128 v9;
  id v10;

  v5 = a2;
  v10 = a3;
  v9 = *(_OWORD *)(a1 + 32);
  v6 = (id)v9;
  v7 = v10;
  v8 = v5;
  px_dispatch_on_main_queue();

}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_12_426(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 56), "_presentAlertForMemoriesGenerationResult:error:inModuleController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_7_413(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncludeRejectedMemories:", 1);
  objc_msgSend(v3, "setIncludePendingMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_8_415;
  v11[3] = &unk_1E5149198;
  v5 = v4;
  v12 = v5;
  v10 = 0;
  objc_msgSend(v2, "performChangesAndWait:error:", v11, &v10);
  v6 = v10;
  v7 = v6;
  if (v6)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v6, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_presentAlertWithTitle:andMessage:inModuleController:", CFSTR("Error while removing memories"), v9, *(_QWORD *)(a1 + 32));

  }
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_8_415(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD1640], "deleteMemories:", *(_QWORD *)(a1 + 32));
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_5_391(uint64_t a1, void *a2)
{
  id v2;
  PXSettingsMeaningsTableViewController *v3;

  v2 = a2;
  v3 = objc_alloc_init(PXSettingsMeaningsTableViewController);
  objc_msgSend(v2, "pushViewController:animated:", v3, 1);

}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_3_366(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v3 = a2;
  v4 = dispatch_group_create();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__80719;
  v24 = __Block_byref_object_dispose__80720;
  v25 = 0;
  dispatch_group_enter(v4);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoAnalysisClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_4_367;
  v17 = &unk_1E5122A78;
  v19 = &v20;
  v7 = v4;
  v18 = v7;
  objc_msgSend(v6, "requestClearMusicCacheWithOptions:reply:", 0, &v14);

  v8 = dispatch_time(0, 60000000000);
  dispatch_group_wait(v7, v8);
  v9 = (void *)v21[5];
  if (v9)
  {
    v10 = *(void **)(a1 + 40);
    objc_msgSend(v9, "localizedDescription", v14, v15, v16, v17);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (const __CFString *)v11;
    else
      v13 = CFSTR("Unknown Error");
    objc_msgSend(v10, "_presentAlertWithTitle:andMessage:inModuleController:", CFSTR("Error"), v13, *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 40), "_presentAlertWithTitle:andMessage:inModuleController:", CFSTR("Clear Music Cache"), CFSTR("Complete"), *(_QWORD *)(a1 + 32), v14, v15, v16, v17);

  _Block_object_dispose(&v20, 8);
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_4_367(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_350(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_21(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD1728], "deleteQuestions:", *(_QWORD *)(a1 + 32));
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_22(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  const __CFString *v4;
  __CFString *v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "localizedDescription");
    v3 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v4 = CFSTR("Clearing Unanswered Questions Failed");
  }
  else
  {
    v3 = CFSTR("You may need to relaunch Photos to view.");
    v4 = CFSTR("Successfully Cleared Unanswered Questions");
  }
  v5 = (__CFString *)v3;
  objc_msgSend(*(id *)(a1 + 48), "_presentAlertWithTitle:andMessage:inModuleController:", v4, v3, *(_QWORD *)(a1 + 40));

}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_17(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "appendString:", a2);
  v7 = *(void **)(a1 + 32);
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v8, "stringWithFormat:", CFSTR(": %lu\n"), v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v10);

}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 48), "_presentAlertWithTitle:andMessage:inModuleController:", CFSTR("Photos Challenge Statistics"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_13_309(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  _QWORD v15[4];
  __int128 v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CD1650];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setReason:", 1);
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDate:", v6);

  objc_msgSend(v4, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocation:", v7);

  objc_msgSend(v4, "peopleNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPeopleNames:", v8);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPhotoLibrary:", v9);

  v18[0] = CFSTR("contextual");
  v17[0] = CFSTR("category");
  v17[1] = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExtraParameters:", v11);

  v12 = (void *)MEMORY[0x1E0CD1630];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_14_316;
  v15[3] = &unk_1E5122D48;
  v14 = *(_OWORD *)(a1 + 32);
  v13 = (id)v14;
  v16 = v14;
  objc_msgSend(v12, "generateMemoriesWithOptions:completion:", v5, v15);

}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_14_316(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  __int128 v9;
  id v10;

  v5 = a2;
  v10 = a3;
  v9 = *(_OWORD *)(a1 + 32);
  v6 = (id)v9;
  v7 = v10;
  v8 = v5;
  px_dispatch_on_main_queue();

}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_15_317(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 56), "_presentAlertForMemoriesGenerationResult:error:inModuleController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_11_300(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  PXScoreLabViewController *v4;

  v2 = a2;
  v4 = objc_alloc_init(PXScoreLabViewController);
  -[PXScoreLabViewController navigationItem](v4, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", CFSTR("Score Lab"));

  objc_msgSend(v2, "pushViewController:animated:", v4, 1);
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_10_296(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  PXLogsViewController *v4;

  v2 = a2;
  v4 = -[PXLogsViewController initWithSubsystem:category:startDate:]([PXLogsViewController alloc], "initWithSubsystem:category:startDate:", CFSTR("com.apple.PhotosGraph"), CFSTR("suggestions"), 0);
  -[PXLogsViewController navigationItem](v4, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", CFSTR("Suggestion Generation Logs"));

  objc_msgSend(v2, "pushViewController:animated:", v4, 1);
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_9_290(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  PXLogsViewController *v4;
  id v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v3 = a2;
  objc_msgSend(v2, "dateWithTimeIntervalSinceNow:", -86400.0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[PXLogsViewController initWithSubsystem:category:startDate:]([PXLogsViewController alloc], "initWithSubsystem:category:startDate:", CFSTR("com.apple.PhotosGraph"), CFSTR("suggestions"), v7);
  v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v5, "setDateStyle:", 0);
  objc_msgSend(v5, "setTimeStyle:", 1);
  -[PXLogsViewController setDateFormatter:](v4, "setDateFormatter:", v5);
  -[PXLogsViewController navigationItem](v4, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", CFSTR("Suggestion Generation Logs"));

  objc_msgSend(v3, "pushViewController:animated:", v4, 1);
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_6_277(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = a2;
  v6 = -[PXLogsViewController initLiveWithSubsystem:category:]([PXLogsViewController alloc], "initLiveWithSubsystem:category:", CFSTR("com.apple.PhotosGraph"), CFSTR("suggestions"));
  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setDateStyle:", 0);
  objc_msgSend(v3, "setTimeStyle:", 1);
  objc_msgSend(v6, "setDateFormatter:", v3);
  objc_msgSend(v6, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", CFSTR("Suggestion Generation"));

  objc_msgSend(v2, "pushViewController:animated:", v6, 1);
  +[PXContextualMemoriesSettingsController sharedController](PXContextualMemoriesSettingsController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestUpdatedContextualMemoriesSettingsWithOptions:completionHandler:", 0, &__block_literal_global_284);

}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_7_283(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CD16F8];
  v3 = a2;
  objc_msgSend(v2, "px_deprecated_appPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D72270];
  v9[0] = *MEMORY[0x1E0D722B0];
  v9[1] = v5;
  v10[0] = MEMORY[0x1E0C9AAA0];
  v10[1] = MEMORY[0x1E0C9AAB0];
  v9[2] = *MEMORY[0x1E0D722C8];
  objc_msgSend(v3, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "photoAnalysisClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateSuggestionsWithOptions:reply:", v7, &__block_literal_global_287);

}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_5_270(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  PXSuggestersDebugViewController *v4;

  v2 = a2;
  v4 = objc_alloc_init(PXSuggestersDebugViewController);
  -[PXSuggestersDebugViewController navigationItem](v4, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", CFSTR("Suggesters"));

  objc_msgSend(v2, "pushViewController:animated:", v4, 1);
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_4_263(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  PXExistingSuggestionsDebugViewController *v4;

  v2 = a2;
  v4 = objc_alloc_init(PXExistingSuggestionsDebugViewController);
  -[PXExistingSuggestionsDebugViewController navigationItem](v4, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", CFSTR("Existing Suggestions"));

  objc_msgSend(v2, "pushViewController:animated:", v4, 1);
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_3_259(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  PXLogsViewController *v4;

  v2 = a2;
  v4 = -[PXLogsViewController initWithSubsystem:category:startDate:]([PXLogsViewController alloc], "initWithSubsystem:category:startDate:", CFSTR("com.apple.PhotosGraph"), CFSTR("memory"), 0);
  -[PXLogsViewController navigationItem](v4, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", CFSTR("Memory Generation Logs"));

  objc_msgSend(v2, "pushViewController:animated:", v4, 1);
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2_252(uint64_t a1, void *a2)
{
  id v2;
  PXLogsViewController *v3;
  void *v4;
  id v5;
  void *v6;
  PXLogsViewController *v7;

  v2 = a2;
  v3 = [PXLogsViewController alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXLogsViewController initWithSubsystem:category:startDate:](v3, "initWithSubsystem:category:startDate:", CFSTR("com.apple.PhotosGraph"), CFSTR("memory"), v4);

  v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v5, "setDateStyle:", 0);
  objc_msgSend(v5, "setTimeStyle:", 1);
  -[PXLogsViewController setDateFormatter:](v7, "setDateFormatter:", v5);
  -[PXLogsViewController navigationItem](v7, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", CFSTR("Memory Generation Logs"));

  objc_msgSend(v2, "pushViewController:animated:", v7, 1);
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_3_221(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = a2;
  v6 = -[PXLogsViewController initLiveWithSubsystem:category:]([PXLogsViewController alloc], "initLiveWithSubsystem:category:", CFSTR("com.apple.PhotosGraph"), CFSTR("memory"));
  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setDateStyle:", 0);
  objc_msgSend(v3, "setTimeStyle:", 1);
  objc_msgSend(v6, "setDateFormatter:", v3);
  objc_msgSend(v6, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", CFSTR("Memory Generation"));

  objc_msgSend(v2, "pushViewController:animated:", v6, 1);
  +[PXContextualMemoriesSettingsController sharedController](PXContextualMemoriesSettingsController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestUpdatedContextualMemoriesSettingsWithOptions:completionHandler:", 0, &__block_literal_global_232);

}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_4_231(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v12, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v12, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("PHMemoryOptionDateKey"));

  }
  objc_msgSend(v12, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v12, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("PHMemoryOptionLocationKey"));

  }
  objc_msgSend(v12, "peopleNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v12, "peopleNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("PHMemoryOptionPeopleNamesKey"));

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E53ECA98, CFSTR("PHMemoryOptionReasonKey"));
  v10 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("PHMemoryOptionGenerateSuggestionsKey"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("PHMemoryOptionCommitChangesKey"));
  objc_msgSend(v2, "photoAnalysisClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "generateMemoriesWithOptions:reply:", v3, &__block_literal_global_249_80847);

}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2_214(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  PXExistingMemoriesDebugViewController *v4;

  v2 = a2;
  v4 = objc_alloc_init(PXExistingMemoriesDebugViewController);
  -[PXExistingMemoriesDebugViewController navigationItem](v4, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", CFSTR("Existing Memories"));

  objc_msgSend(v2, "pushViewController:animated:", v4, 1);
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_201(uint64_t a1, void *a2)
{
  id v2;
  PXContextualMemoriesSettingsTableViewController *v3;

  v2 = a2;
  v3 = objc_alloc_init(PXContextualMemoriesSettingsTableViewController);
  objc_msgSend(v2, "pushViewController:animated:", v3, 1);

}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_15(uint64_t a1, void *a2)
{
  id v2;
  PXSettingsGraphExportViewController *v3;

  v2 = a2;
  v3 = objc_alloc_init(PXSettingsGraphExportViewController);
  objc_msgSend(v2, "pushViewController:animated:", v3, 1);

}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_14(uint64_t a1, void *a2)
{
  id v2;
  PXSettingsHighlightEstimatesExportViewController *v3;

  v2 = a2;
  v3 = objc_alloc_init(PXSettingsHighlightEstimatesExportViewController);
  objc_msgSend(v2, "pushViewController:animated:", v3, 1);

}

id __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_13()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v6;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v0, "graphStatisticsDescription:", &v6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v6;

  if (v2)
  {
    objc_msgSend(v2, "localizedDescription");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v1;
  }
  v4 = v3;

  return v4;
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[4];
  id v9;
  __int128 v10;

  v3 = a2;
  dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_11;
  block[3] = &unk_1E5145560;
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 32);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_11(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  __int128 v9;
  id v10;

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D72090]);

  }
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v5, "requestHighlightCollectionEnrichmentWithOptions:error:", v2, &v10);
  v6 = v10;

  v9 = *(_OWORD *)(a1 + 40);
  v7 = (id)v9;
  v8 = v6;
  px_dispatch_on_main_queue();

}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_12(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)a1[6];
  v3 = (void *)a1[4];
  if (v3)
  {
    objc_msgSend(v3, "localizedDescription");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_presentAlertWithTitle:andMessage:inModuleController:", CFSTR("Month / Year Enrichment Finished"), v4, a1[5]);

  }
  else
  {
    objc_msgSend(v2, "_presentAlertWithTitle:andMessage:inModuleController:", CFSTR("Month / Year Enrichment Finished"), &stru_1E5149688, a1[5]);
  }
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_7(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  __int128 v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v2, "requestHighlightEnrichmentWithOptions:error:", MEMORY[0x1E0C9AA60], &v7);
  v3 = v7;

  v6 = *(_OWORD *)(a1 + 32);
  v4 = (id)v6;
  v5 = v3;
  px_dispatch_on_main_queue();

}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_8(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)a1[6];
  v3 = (void *)a1[4];
  if (v3)
  {
    objc_msgSend(v3, "localizedDescription");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_presentAlertWithTitle:andMessage:inModuleController:", CFSTR("Enrichment Finished"), v4, a1[5]);

  }
  else
  {
    objc_msgSend(v2, "_presentAlertWithTitle:andMessage:inModuleController:", CFSTR("Enrichment Finished"), &stru_1E5149688, a1[5]);
  }
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_time_t v12;
  uint64_t v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a2;
  v5 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v6 = objc_alloc(MEMORY[0x1E0D71950]);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoAnalysisClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithServiceProvider:", v8);

  v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_5;
  v15[3] = &unk_1E5122A78;
  v17 = &v18;
  v11 = v10;
  v16 = v11;
  objc_msgSend(v9, "performGraphRebuildWithOptions:reply:", MEMORY[0x1E0C9AA70], v15);
  v12 = dispatch_time(0, -1);
  dispatch_group_wait(v11, v12);
  v13 = *((unsigned __int8 *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v13;
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end
