@implementation VUIFeaturesConfiguration

+ (id)numberValueForKey:(id)a3 fromDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    +[VUIFeaturesConfiguration defaultsNumberValueForKey:](VUIFeaturesConfiguration, "defaultsNumberValueForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(v6, "vui_numberForKey:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)defaultsNumberValueForKey:(id)a3
{
  id v3;
  int has_internal_content;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  has_internal_content = os_variant_has_internal_content();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!has_internal_content)
    goto LABEL_9;
  objc_msgSend(v5, "objectForKey:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:

LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "numberFromString:", v7);
  v9 = objc_claimAutoreleasedReturnValue();

  v7 = (id)v9;
  if (!v9)
  {
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
LABEL_6:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  v7 = v7;
  v10 = v7;
LABEL_11:

  return v10;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_22 != -1)
    dispatch_once(&sharedInstance_onceToken_22, &__block_literal_global_101);
  return (id)sharedInstance_defaultConfig;
}

- (VUIPlayerTabsConfig)playerTabsConfig
{
  return self->_playerTabsConfig;
}

- (VUILaunchConfig)launchConfig
{
  return self->_launchConfig;
}

- (BOOL)_populateConfigWithDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  VUIPlaybackUpNextConfig *playbackUpNextConfig;
  void *v11;
  void *v12;
  void *v13;
  VUIPlaybackUpNextConfig *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  VUIPlaybackUpNextConfig *v22;
  void *v23;
  void *v24;
  VUIPlaybackUpNextConfig *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  VUIPlaybackUpNextConfig *v31;
  void *v32;
  void *v33;
  void *v34;
  VUIPlaybackUpNextConfig *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  VUINowPlayingConfig *nowPlayingConfig;
  void *v42;
  void *v43;
  VUINowPlayingConfig *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  VUINowPlayingConfig *v64;
  void *v65;
  void *v66;
  VUINowPlayingConfig *v67;
  void *v68;
  void *v69;
  VUINowPlayingConfig *v70;
  void *v71;
  void *v72;
  VUINowPlayingConfig *v73;
  VUINowPlayingConfig *v74;
  void *v75;
  void *v76;
  void *v77;
  VUIAutoPlayConfig *autoPlayConfig;
  void *v79;
  _BOOL8 v80;
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
  BOOL v104;
  id v106;
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
  VUIFeaturesConfiguration *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  id obj;
  id obja;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("postPlayUpsellConfig"));
    v5 = objc_claimAutoreleasedReturnValue();
    +[VUIPostPlayUpsellConfig sharedInstance](VUIPostPlayUpsellConfig, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = (void *)v5;
    objc_msgSend(v6, "configureUsingDictionary:", v5);

    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("postPlayConfig"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v7;
    v117 = self;
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "vui_numberForKey:", CFSTR("bootStrapInterval"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        playbackUpNextConfig = self->_playbackUpNextConfig;
        objc_msgSend(v8, "doubleValue");
        -[VUIPlaybackUpNextConfig setBootstrapInterval:](playbackUpNextConfig, "setBootstrapInterval:");
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v9, CFSTR("bootStrapInterval"));

      }
      objc_msgSend(v7, "vui_numberForKey:", CFSTR("documentUpdateOffsetInterval"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = self->_playbackUpNextConfig;
        objc_msgSend(v12, "doubleValue");
        -[VUIPlaybackUpNextConfig setDocumentUpdateOffsetInterval:](v14, "setDocumentUpdateOffsetInterval:");
      }
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("maximumAutoPlayableItemsQAOverride"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        objc_msgSend(v7, "vui_numberForKey:", CFSTR("maximumAutoPlayableItems"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          -[VUIPlaybackUpNextConfig setMaximumAutoPlayableItems:](self->_playbackUpNextConfig, "setMaximumAutoPlayableItems:", objc_msgSend(v17, "unsignedIntegerValue"));
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKey:", v18, CFSTR("maximumAutoPlayableItems"));

        }
      }
      objc_msgSend(v7, "vui_numberForKey:", CFSTR("duration"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        v22 = self->_playbackUpNextConfig;
        objc_msgSend(v20, "doubleValue");
        -[VUIPlaybackUpNextConfig setDuration:](v22, "setDuration:");
      }
      objc_msgSend(v7, "vui_numberForKey:", CFSTR("autoPlayTimerDuration"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        v25 = self->_playbackUpNextConfig;
        objc_msgSend(v23, "doubleValue");
        -[VUIPlaybackUpNextConfig setAutoPlayTimerDuration:](v25, "setAutoPlayTimerDuration:");
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKey:", v24, CFSTR("autoPlayTimerDuration"));

      }
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKey:", CFSTR("minAutoPlayStopTimeQAOverride"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        objc_msgSend(v7, "vui_numberForKey:", CFSTR("minAutoPlayStopTime"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29)
        {
          v31 = v117->_playbackUpNextConfig;
          objc_msgSend(v29, "doubleValue");
          -[VUIPlaybackUpNextConfig setMinAutoPlayStopTime:](v31, "setMinAutoPlayStopTime:");
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKey:", v30, CFSTR("minAutoPlayStopTime"));

        }
        v7 = v115;
      }
      objc_msgSend(v7, "vui_numberForKey:", CFSTR("minTimeIntervalFromEndToDisplay"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v33)
      {
        v35 = v117->_playbackUpNextConfig;
        objc_msgSend(v33, "doubleValue");
        -[VUIPlaybackUpNextConfig setMinTimeIntervalFromEndToDisplay:](v35, "setMinTimeIntervalFromEndToDisplay:");
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setObject:forKey:", v34, CFSTR("minTimeIntervalFromEndToDisplay"));

      }
      self = v117;
    }
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("playerTabsConfig"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "count"))
      -[VUIPlayerTabsConfig setInfoTabMustHaveImageToDisplay:](self->_playerTabsConfig, "setInfoTabMustHaveImageToDisplay:", objc_msgSend(v37, "vui_BOOLForKey:defaultValue:", CFSTR("infoTabMustHaveImageToDisplay"), 0));
    v113 = v37;
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("nowPlayingConfig"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v38;
    if (objc_msgSend(v38, "count"))
    {
      -[VUINowPlayingConfig setShowsLozengeForLivePlayback:](self->_nowPlayingConfig, "setShowsLozengeForLivePlayback:", objc_msgSend(v38, "vui_BOOLForKey:defaultValue:", CFSTR("showsLozengeForLivePlayback"), 0));
      -[VUINowPlayingConfig setShowsUpNextInHUDForVOD:](self->_nowPlayingConfig, "setShowsUpNextInHUDForVOD:", objc_msgSend(v38, "vui_BOOLForKey:defaultValue:", CFSTR("showsUpNextInHUDForVOD"), 1));
      -[VUINowPlayingConfig setShowsUpNextInHUDForLive:](self->_nowPlayingConfig, "setShowsUpNextInHUDForLive:", objc_msgSend(v38, "vui_BOOLForKey:defaultValue:", CFSTR("showsUpNextInHUDForLive"), 1));
      -[VUINowPlayingConfig setRefetchesUpNextDataForVOD:](self->_nowPlayingConfig, "setRefetchesUpNextDataForVOD:", objc_msgSend(v38, "vui_BOOLForKey:defaultValue:", CFSTR("refetchesUpNextDataForVOD"), 1));
      -[VUINowPlayingConfig setRefetchesUpNextDataForLive:](self->_nowPlayingConfig, "setRefetchesUpNextDataForLive:", objc_msgSend(v38, "vui_BOOLForKey:defaultValue:", CFSTR("refetchesUpNextDataForLive"), 1));
      -[VUINowPlayingConfig setShowsStillWatchingAlert:](self->_nowPlayingConfig, "setShowsStillWatchingAlert:", objc_msgSend(v38, "vui_BOOLForKey:defaultValue:", CFSTR("showsStillWatchingAlertForLivePlayback"), 1));
      objc_msgSend(v38, "vui_numberForKey:", CFSTR("alertDurationForLivePlayback"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      if (v39)
      {
        nowPlayingConfig = self->_nowPlayingConfig;
        objc_msgSend(v39, "doubleValue");
        -[VUINowPlayingConfig setStillWatchingAlertDuration:](nowPlayingConfig, "setStillWatchingAlertDuration:");
      }
      v109 = v40;
      objc_msgSend(v38, "vui_numberForKey:", CFSTR("alertIdleTimeout"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v42;
      if (v42)
      {
        v44 = self->_nowPlayingConfig;
        objc_msgSend(v42, "doubleValue");
        -[VUINowPlayingConfig setAlertIdleTimeout:](v44, "setAlertIdleTimeout:");
      }
      v107 = v43;
      objc_msgSend(v38, "vui_arrayForKey:", CFSTR("excludedMediaTypesFromReporting"));
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v111, "count"))
      {
        v106 = v4;
        v45 = (void *)objc_opt_new();
        v128 = 0u;
        v129 = 0u;
        v130 = 0u;
        v131 = 0u;
        obj = v111;
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v132, 16);
        if (!v46)
          goto LABEL_46;
        v47 = v46;
        v48 = *(_QWORD *)v129;
        v121 = *MEMORY[0x1E0DB1DD8];
        v123 = *MEMORY[0x1E0DB1DC0];
        v49 = *MEMORY[0x1E0DB1DD0];
        v50 = *MEMORY[0x1E0DB1DC8];
        v51 = *MEMORY[0x1E0DB1DE0];
        while (1)
        {
          v52 = 0;
          do
          {
            if (*(_QWORD *)v129 != v48)
              objc_enumerationMutation(obj);
            v53 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * v52);
            v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("Trailer"));
            v55 = v50;
            v56 = v51;
            if ((v54 & 1) != 0
              || (v57 = objc_msgSend(v53, "isEqualToString:", CFSTR("Movie")), v55 = v123, v56 = v49, (v57 & 1) != 0))
            {
              objc_msgSend(v45, "addObject:", v55);
LABEL_39:
              objc_msgSend(v45, "addObject:", v56);
              goto LABEL_40;
            }
            v56 = v121;
            if ((objc_msgSend(v53, "isEqualToString:", CFSTR("Show")) & 1) != 0)
              goto LABEL_39;
            v56 = v121;
            if ((objc_msgSend(v53, "isEqualToString:", CFSTR("Episode")) & 1) != 0)
              goto LABEL_39;
LABEL_40:
            ++v52;
          }
          while (v47 != v52);
          v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v132, 16);
          v47 = v58;
          if (!v58)
          {
LABEL_46:

            self = v117;
            -[VUINowPlayingConfig setMediaTypesExcludedFromReporting:](v117->_nowPlayingConfig, "setMediaTypesExcludedFromReporting:", obj);

            v4 = v106;
            v38 = v116;
            break;
          }
        }
      }
      -[VUINowPlayingConfig setAllowQOSReportingForiTunesLibraryPlayback:](self->_nowPlayingConfig, "setAllowQOSReportingForiTunesLibraryPlayback:", objc_msgSend(v38, "vui_BOOLForKey:defaultValue:", CFSTR("allowQOSReportingForiTunesLibraryPlayback"), 1));
      -[VUINowPlayingConfig setConvertMainContentRelativeStartTimeOfZeroToAbsoluteStartTimeOfZero:](self->_nowPlayingConfig, "setConvertMainContentRelativeStartTimeOfZeroToAbsoluteStartTimeOfZero:", objc_msgSend(v38, "vui_BOOLForKey:defaultValue:", CFSTR("convertMainContentRelativeStartTimeOfZeroToAbsoluteStartTimeOfZero"), 1));
      objc_msgSend(v38, "vui_arrayForKey:", CFSTR("mediaCharacteristicsToLocalize"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v59, "count"))
        -[VUINowPlayingConfig setMediaCharacteristicsToLocalize:](self->_nowPlayingConfig, "setMediaCharacteristicsToLocalize:", v59);
      objc_msgSend(v38, "vui_dictionaryForKey:", CFSTR("mediaLocalizationKeyMapping"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v60, "count"))
        -[VUINowPlayingConfig setMediaLocalizationKeyMapping:](self->_nowPlayingConfig, "setMediaLocalizationKeyMapping:", v60);
      objc_msgSend(v38, "vui_arrayForKey:", CFSTR("audioIDPrefixes"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v61, "count"))
        -[VUINowPlayingConfig setAudioIDPrefixes:](self->_nowPlayingConfig, "setAudioIDPrefixes:", v61);
      objc_msgSend(v38, "vui_numberForKey:", CFSTR("liveSportsStartFromBeginningOffset"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v62;
      if (v62)
      {
        v64 = self->_nowPlayingConfig;
        objc_msgSend(v62, "doubleValue");
        -[VUINowPlayingConfig setLiveSportsStartFromBeginningOffset:](v64, "setLiveSportsStartFromBeginningOffset:");
      }
      -[VUINowPlayingConfig setShouldSendLiveStreamStartAndEndTimesToAVKit:](self->_nowPlayingConfig, "setShouldSendLiveStreamStartAndEndTimesToAVKit:", objc_msgSend(v38, "vui_BOOLForKey:defaultValue:", CFSTR("shouldSendLiveStreamStartAndEndTimesToAVKit"), 1));
      -[VUINowPlayingConfig setShouldAdjustLiveStreamStartTimeToMatchSeekableRangeStartTime:](self->_nowPlayingConfig, "setShouldAdjustLiveStreamStartTimeToMatchSeekableRangeStartTime:", objc_msgSend(v38, "vui_BOOLForKey:defaultValue:", CFSTR("shouldAdjustLiveStreamStartTimeToMatchSeekableRangeStartTime"), 1));
      -[VUINowPlayingConfig setShouldAdjustLiveStreamEndTimeToMatchSeekableRangeEndTime:](self->_nowPlayingConfig, "setShouldAdjustLiveStreamEndTimeToMatchSeekableRangeEndTime:", objc_msgSend(v38, "vui_BOOLForKey:defaultValue:", CFSTR("shouldAdjustLiveStreamEndTimeToMatchSeekableRangeEndTime"), 1));
      objc_msgSend(v38, "vui_numberForKey:", CFSTR("liveStreamStartTimeAdjustmentSlopFactor"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v65;
      if (v65)
      {
        v67 = self->_nowPlayingConfig;
        objc_msgSend(v65, "doubleValue");
        -[VUINowPlayingConfig setLiveStreamStartTimeAdjustmentSlopFactor:](v67, "setLiveStreamStartTimeAdjustmentSlopFactor:");
      }
      objc_msgSend(v38, "vui_numberForKey:", CFSTR("liveStreamStartAndEndTimeBadMetadataCutoff"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v68;
      if (v68)
      {
        v70 = self->_nowPlayingConfig;
        objc_msgSend(v68, "doubleValue");
        -[VUINowPlayingConfig setLiveStreamStartAndEndTimeBadMetadataCutoff:](v70, "setLiveStreamStartAndEndTimeBadMetadataCutoff:");
      }
      objc_msgSend(v38, "vui_numberForKey:", CFSTR("liveStreamOverrunExtension"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v71;
      if (v71)
      {
        v73 = v117->_nowPlayingConfig;
        objc_msgSend(v71, "doubleValue");
        v74 = v73;
        self = v117;
        -[VUINowPlayingConfig setLiveStreamOverrunExtension:](v74, "setLiveStreamOverrunExtension:");
      }

    }
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("autoPlayConfig"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v75, "count"))
    {
      objc_msgSend(v75, "vui_numberForKey:", CFSTR("autoPlayDelayInterval"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v76;
      if (v76)
      {
        autoPlayConfig = self->_autoPlayConfig;
        objc_msgSend(v76, "doubleValue");
        -[VUIAutoPlayConfig setAutoPlayDelayInterval:](autoPlayConfig, "setAutoPlayDelayInterval:");
      }
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v79, "userInterfaceIdiom") == 2;

      -[VUIAutoPlayConfig setAutoPlayVideoSound:](self->_autoPlayConfig, "setAutoPlayVideoSound:", +[VUIFeaturesConfiguration BOOLValueForKey:fromDictionary:defaultValue:](VUIFeaturesConfiguration, "BOOLValueForKey:fromDictionary:defaultValue:", CFSTR("autoPlayVideoSound"), v75, v80));
    }
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("liveLinkConfig"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v81, "count"))
      -[VUILiveLinkConfig setIsEnabled:](self->_liveLinkConfig, "setIsEnabled:", objc_msgSend(v81, "vui_BOOLForKey:defaultValue:", CFSTR("isEnabled"), 0));
    v124 = v81;
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("downloadConfig"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v82, "count"))
    {
      objc_msgSend(v82, "vui_arrayForKey:", CFSTR("blacklistedEarlyRenewalBrands"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      if (v83)
        -[VUIDownloadConfig setBlacklistedEarlyRenewalBrands:](self->_downloadConfig, "setBlacklistedEarlyRenewalBrands:", v83);

    }
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("syndicationConfig"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v84, "count"))
    {
      objc_msgSend(v84, "vui_numberForKey:", CFSTR("highlightsFetchLimit"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v85;
      if (v85)
        -[VUISyndicationConfig setHighlightsFetchLimit:](self->_syndicationConfig, "setHighlightsFetchLimit:", objc_msgSend(v85, "unsignedIntegerValue"));

    }
    -[VUIFeaturesConfiguration parseUpNextConfig:](self, "parseUpNextConfig:", v4);
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("ageVerificationConfig"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v87, "count"))
    {
      +[VUIAgeVerification sharedInstance](VUIAgeVerification, "sharedInstance");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "configureAgeVerification:", v87);

    }
    v119 = v87;
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("dropOnTabConfig"));
    obja = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(obja, "count"))
    {
      objc_msgSend(obja, "vui_numberForKey:", CFSTR("daysWithoutOpeningThreshold"));
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      if (v89)
        -[VUIDropOnTabConfig setDaysWithoutOpeningThreshold:](self->_dropOnTabConfig, "setDaysWithoutOpeningThreshold:", v89);
      objc_msgSend(obja, "vui_numberForKey:", CFSTR("daysWithoutPlaybackThreshold"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      if (v90)
        -[VUIDropOnTabConfig setDaysWithoutPlaybackThreshold:](self->_dropOnTabConfig, "setDaysWithoutPlaybackThreshold:", v90);
      +[VUIFeaturesConfiguration defaultsStringValueForKey:](VUIFeaturesConfiguration, "defaultsStringValueForKey:", CFSTR("dropOnTabIdentifier"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obja, "objectForKey:", CFSTR("dropOnTabIdentifier"));
      v92 = objc_claimAutoreleasedReturnValue();
      v93 = (void *)v92;
      v94 = v91;
      if (v91 || (v94 = (void *)v92) != 0)
        -[VUIDropOnTabConfig setDropOnTabIdentifier:](self->_dropOnTabConfig, "setDropOnTabIdentifier:", v94);

    }
    v120 = v84;
    v122 = v82;
    v125 = v75;
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("mediaShowcaseConfig"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIFeaturesConfiguration _populateMediaShowcaseConfig:](self, "_populateMediaShowcaseConfig:");
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("canonicalConfig"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIFeaturesConfiguration _populateCanonicalConfig:](self, "_populateCanonicalConfig:");
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("accountConfig"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIFeaturesConfiguration _populateAccountConfig:](self, "_populateAccountConfig:");
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("accountMessageConfig"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIFeaturesConfiguration _populateAccountMessageConfig:](self, "_populateAccountMessageConfig:");
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("rootControllerConfig"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIFeaturesConfiguration _populateRootControllerConfig:](self, "_populateRootControllerConfig:", v95);
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("multiviewConfig"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIFeaturesConfiguration _populateMultiviewConfig:](self, "_populateMultiviewConfig:", v96);
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("arQLConfig"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v97, "count"))
    {
      +[VUIARQLPreviewManager sharedInstance](VUIARQLPreviewManager, "sharedInstance");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "configureUsingDictionary:", v4);

    }
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("tabItemsUpdateConfig"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIFeaturesConfiguration _populateTabItemsUpdateConfig:](self, "_populateTabItemsUpdateConfig:", v99);
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("launchConfig"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIFeaturesConfiguration _populateLaunchConfig:](self, "_populateLaunchConfig:", v100);
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("libConfig"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIFeaturesConfiguration _populateLibConfig:](self, "_populateLibConfig:", v101);
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("gdprConfig"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIFeaturesConfiguration _populateGDPRConfig:](self, "_populateGDPRConfig:", v102);
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("timedMetadataConfig"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIFeaturesConfiguration _populateTimedMetadataConfig:](self, "_populateTimedMetadataConfig:", v103);

    v104 = 1;
  }
  else
  {
    v104 = 0;
  }

  return v104;
}

- (void)_populateMultiviewConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "vui_numberForKey:", CFSTR("isEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_numberForKey:", CFSTR("maximumPlayerCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_INFO, "FeaturesConfiguration:: _populateMultiviewConfig isEnabled = %@, maximumPlayerCount = %@", (uint8_t *)&v8, 0x16u);
  }

  if (v5)
    -[VUIMultiviewConfig setIsEnabled:](self->_multiviewConfig, "setIsEnabled:", objc_msgSend(v5, "BOOLValue"));
  if (v6)
    -[VUIMultiviewConfig setMaximumPlayerCount:](self->_multiviewConfig, "setMaximumPlayerCount:", objc_msgSend(v6, "integerValue"));

}

- (void)_populateLibConfig:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("collectionItemLimit"), a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      -[VUILibConfig setCollectionItemLimit:](self->_libConfig, "setCollectionItemLimit:", objc_msgSend(v4, "integerValue"));
      if ((int)objc_msgSend(v5, "intValue") <= 1000)
      {
        VUIDefaultLogObject();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v7[0] = 67109120;
          v7[1] = objc_msgSend(v5, "intValue");
          _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_INFO, "FeaturesConfiguration:: collectionItemLimit is not allowed to set to %d", (uint8_t *)v7, 8u);
        }

      }
    }

  }
}

- (void)_populateGDPRConfig:(id)a3
{
  void *v4;
  VUIGDPRConfig *gdprConfig;
  float v6;
  id v7;

  if (a3)
  {
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("popoverHeight"), a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      gdprConfig = self->_gdprConfig;
      v7 = v4;
      objc_msgSend(v4, "floatValue");
      -[VUIGDPRConfig setPopoverHeight:](gdprConfig, "setPopoverHeight:", v6);
      v4 = v7;
    }

  }
}

- (void)_populateCanonicalConfig:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  VUICanonicalConfig *canonicalConfig;
  void *v9;
  void *v10;
  VUICanonicalConfig *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = objc_msgSend(v14, "count");
  v5 = v14;
  if (v4)
  {
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("videoViewOffscreenThresholdToStopPlayback"), v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      canonicalConfig = self->_canonicalConfig;
      objc_msgSend(v6, "floatValue");
      -[VUICanonicalConfig setVideoViewOffscreenThresholdToStopPlayback:](canonicalConfig, "setVideoViewOffscreenThresholdToStopPlayback:");
    }
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("playbackDelayInterval"), v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = self->_canonicalConfig;
      objc_msgSend(v9, "doubleValue");
      -[VUICanonicalConfig setPlaybackDelayInterval:](v11, "setPlaybackDelayInterval:");
    }
    +[VUIFeaturesConfiguration stringValueForKey:fromDictionary:](VUIFeaturesConfiguration, "stringValueForKey:fromDictionary:", CFSTR("storeTabIdentifer"), v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      -[VUICanonicalConfig setStoreTabIdentifier:](self->_canonicalConfig, "setStoreTabIdentifier:", v12);
    +[VUIFeaturesConfiguration stringValueForKey:fromDictionary:](VUIFeaturesConfiguration, "stringValueForKey:fromDictionary:", CFSTR("tvShowsTabIdentifier"), v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      -[VUICanonicalConfig setTvShowsTabIdentifier:](self->_canonicalConfig, "setTvShowsTabIdentifier:", v13);

    v5 = v14;
  }

}

void __42__VUIFeaturesConfiguration_sharedInstance__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  VUISignpostLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FeaturesConfiguration.Init", ", buf, 2u);
  }

  v1 = objc_opt_new();
  v2 = (void *)sharedInstance_defaultConfig;
  sharedInstance_defaultConfig = v1;

  VUISignpostLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "FeaturesConfiguration.Init", ", v4, 2u);
  }

}

- (VUIFeaturesConfiguration)init
{
  VUIFeaturesConfiguration *v2;
  uint64_t v3;
  VUIPlaybackUpNextConfig *playbackUpNextConfig;
  uint64_t v5;
  VUINowPlayingConfig *nowPlayingConfig;
  uint64_t v7;
  VUIPlayerTabsConfig *playerTabsConfig;
  uint64_t v9;
  VUIAutoPlayConfig *autoPlayConfig;
  uint64_t v11;
  VUILiveLinkConfig *liveLinkConfig;
  uint64_t v13;
  VUIDownloadConfig *downloadConfig;
  uint64_t v15;
  VUISyndicationConfig *syndicationConfig;
  uint64_t v17;
  VUIDropOnTabConfig *dropOnTabConfig;
  uint64_t v19;
  VUIMediaShowcasingConfig *mediaShowcaseConfig;
  uint64_t v21;
  VUIUpNextConfig *upNextConfig;
  uint64_t v23;
  VUICanonicalConfig *canonicalConfig;
  uint64_t v25;
  VUIAccountConfig *accountConfig;
  uint64_t v27;
  VUIAccountMessageConfig *accountMessageConfig;
  uint64_t v29;
  VUIRootControllerConfig *rootControllerConfig;
  uint64_t v31;
  VUITabItemsUpdateConfig *tabItemsUpdateConfig;
  uint64_t v33;
  VUILaunchConfig *launchConfig;
  uint64_t v35;
  VUIMultiviewConfig *multiviewConfig;
  uint64_t v37;
  VUILibConfig *libConfig;
  uint64_t v39;
  VUIGDPRConfig *gdprConfig;
  uint64_t v41;
  VUITimedMetadataConfig *timedMetadataConfig;
  NSObject *v43;
  BOOL v44;
  NSObject *v45;
  uint8_t v47[16];
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)VUIFeaturesConfiguration;
  v2 = -[VUIFeaturesConfiguration init](&v48, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    playbackUpNextConfig = v2->_playbackUpNextConfig;
    v2->_playbackUpNextConfig = (VUIPlaybackUpNextConfig *)v3;

    v5 = objc_opt_new();
    nowPlayingConfig = v2->_nowPlayingConfig;
    v2->_nowPlayingConfig = (VUINowPlayingConfig *)v5;

    v7 = objc_opt_new();
    playerTabsConfig = v2->_playerTabsConfig;
    v2->_playerTabsConfig = (VUIPlayerTabsConfig *)v7;

    v9 = objc_opt_new();
    autoPlayConfig = v2->_autoPlayConfig;
    v2->_autoPlayConfig = (VUIAutoPlayConfig *)v9;

    v11 = objc_opt_new();
    liveLinkConfig = v2->_liveLinkConfig;
    v2->_liveLinkConfig = (VUILiveLinkConfig *)v11;

    v13 = objc_opt_new();
    downloadConfig = v2->_downloadConfig;
    v2->_downloadConfig = (VUIDownloadConfig *)v13;

    v15 = objc_opt_new();
    syndicationConfig = v2->_syndicationConfig;
    v2->_syndicationConfig = (VUISyndicationConfig *)v15;

    v17 = objc_opt_new();
    dropOnTabConfig = v2->_dropOnTabConfig;
    v2->_dropOnTabConfig = (VUIDropOnTabConfig *)v17;

    v19 = objc_opt_new();
    mediaShowcaseConfig = v2->_mediaShowcaseConfig;
    v2->_mediaShowcaseConfig = (VUIMediaShowcasingConfig *)v19;

    v21 = objc_opt_new();
    upNextConfig = v2->_upNextConfig;
    v2->_upNextConfig = (VUIUpNextConfig *)v21;

    v23 = objc_opt_new();
    canonicalConfig = v2->_canonicalConfig;
    v2->_canonicalConfig = (VUICanonicalConfig *)v23;

    v25 = objc_opt_new();
    accountConfig = v2->_accountConfig;
    v2->_accountConfig = (VUIAccountConfig *)v25;

    v27 = objc_opt_new();
    accountMessageConfig = v2->_accountMessageConfig;
    v2->_accountMessageConfig = (VUIAccountMessageConfig *)v27;

    v29 = objc_opt_new();
    rootControllerConfig = v2->_rootControllerConfig;
    v2->_rootControllerConfig = (VUIRootControllerConfig *)v29;

    v31 = objc_opt_new();
    tabItemsUpdateConfig = v2->_tabItemsUpdateConfig;
    v2->_tabItemsUpdateConfig = (VUITabItemsUpdateConfig *)v31;

    v33 = objc_opt_new();
    launchConfig = v2->_launchConfig;
    v2->_launchConfig = (VUILaunchConfig *)v33;

    v35 = objc_opt_new();
    multiviewConfig = v2->_multiviewConfig;
    v2->_multiviewConfig = (VUIMultiviewConfig *)v35;

    v37 = objc_opt_new();
    libConfig = v2->_libConfig;
    v2->_libConfig = (VUILibConfig *)v37;

    v39 = objc_opt_new();
    gdprConfig = v2->_gdprConfig;
    v2->_gdprConfig = (VUIGDPRConfig *)v39;

    v41 = objc_opt_new();
    timedMetadataConfig = v2->_timedMetadataConfig;
    v2->_timedMetadataConfig = (VUITimedMetadataConfig *)v41;

    VUISignpostLogObject();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v43))
    {
      *(_WORD *)v47 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D96EE000, v43, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FeaturesConfiguration.ReadCache", ", v47, 2u);
    }

    v44 = -[VUIFeaturesConfiguration _updateFromCache](v2, "_updateFromCache");
    VUISignpostLogObject();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v45))
    {
      *(_WORD *)v47 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D96EE000, v45, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "FeaturesConfiguration.ReadCache", ", v47, 2u);
    }

    if (!v44)
      -[VUIFeaturesConfiguration _populateRootControllerConfig:](v2, "_populateRootControllerConfig:", 0);
  }
  return v2;
}

- (BOOL)_updateFromCache
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  BOOL v9;
  id v11;
  uint8_t buf[4];
  NSObject *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[VUIFeaturesConfiguration _cachePath](self, "_cachePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v11 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v11);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v11;
      VUIDefaultLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6 || !v5)
      {
        if (v8)
        {
          *(_DWORD *)buf = 138412290;
          v13 = v6;
          _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIFeaturesConfiguration:: Unable to load cache config: %@", buf, 0xCu);
        }

        v9 = 0;
      }
      else
      {
        if (v8)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIFeaturesConfiguration:: populate features config from cache", buf, 2u);
        }

        v9 = -[VUIFeaturesConfiguration _populateConfigWithDictionary:](self, "_populateConfigWithDictionary:", v5);
      }

    }
    else
    {
      VUIDefaultLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIFeaturesConfiguration:: There is no cached data, ignore", buf, 2u);
      }
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)stringValueForKey:(id)a3 fromDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    +[VUIFeaturesConfiguration defaultsStringValueForKey:](VUIFeaturesConfiguration, "defaultsStringValueForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(v6, "vui_stringForKey:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_populateAccountConfig:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("showAccountSettingButtonOnLibraryTab"), v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("showAccountSettingOnSidebar"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[VUIAccountConfig setShowAccountSettingButtonOnLibraryTab:](self->_accountConfig, "setShowAccountSettingButtonOnLibraryTab:", objc_msgSend(v6, "BOOLValue"));
  if (v5)
    -[VUIAccountConfig setShowAccountSettingOnSidebar:](self->_accountConfig, "setShowAccountSettingOnSidebar:", objc_msgSend(v5, "BOOLValue"));

}

- (void)_populateAccountMessageConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("visibilityBehaviours"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[VUIFeaturesConfiguration defaultsStringValueForKey:](VUIFeaturesConfiguration, "defaultsStringValueForKey:", CFSTR("fallbackVisibilityType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("fallbackVisibilityType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("alwaysForceOpenSidebarAnimated"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("alwaysForceOpenSidebarNonAnimated"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    -[VUIAccountMessageConfig setVisibilityBehaviours:](self->_accountMessageConfig, "setVisibilityBehaviours:", v10);
  v9 = v5;
  if (v5 || (v9 = v6) != 0)
    -[VUIAccountMessageConfig setFallbackVisibilityType:](self->_accountMessageConfig, "setFallbackVisibilityType:", VUIAccountMessageVisibilityTypeFromString(v9));
  if (v7)
    -[VUIAccountMessageConfig setAlwaysForceOpenSidebarAnimated:](self->_accountMessageConfig, "setAlwaysForceOpenSidebarAnimated:", objc_msgSend(v7, "BOOLValue"));
  if (v8)
    -[VUIAccountMessageConfig setAlwaysForceOpenSidebarNonAnimated:](self->_accountMessageConfig, "setAlwaysForceOpenSidebarNonAnimated:", objc_msgSend(v8, "BOOLValue"));

}

+ (id)defaultsStringValueForKey:(id)a3
{
  id v3;
  int has_internal_content;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  has_internal_content = os_variant_has_internal_content();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!has_internal_content)
    goto LABEL_7;
  objc_msgSend(v5, "objectForKey:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v7 = v7;
  v8 = v7;
LABEL_9:

  return v8;
}

- (void)_populateLaunchConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  VUILaunchConfig *launchConfig;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("useConfigCacheIgnoreExpiry"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    -[VUILaunchConfig setUseConfigCacheIgnoreExpiry:](self->_launchConfig, "setUseConfigCacheIgnoreExpiry:", objc_msgSend(v5, "BOOLValue"));
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("extendedCacheExpireDuration"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    launchConfig = self->_launchConfig;
    objc_msgSend(v7, "doubleValue");
    -[VUILaunchConfig setExtendedCacheExpireDuration:](launchConfig, "setExtendedCacheExpireDuration:");
  }
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("useSharedURLSession"), v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    -[VUILaunchConfig setUseSharedURLSession:](self->_launchConfig, "setUseSharedURLSession:", objc_msgSend(v10, "BOOLValue"));
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("alwaysPrefetchAppConfiguration"), v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    -[VUILaunchConfig setAlwaysPrefetchAppConfiguration:](self->_launchConfig, "setAlwaysPrefetchAppConfiguration:", objc_msgSend(v12, "BOOLValue"));
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("prewarmImageConnection"), v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    -[VUILaunchConfig setPrewarmImageConnection:](self->_launchConfig, "setPrewarmImageConnection:", objc_msgSend(v14, "BOOLValue"));
  +[VUIFeaturesConfiguration stringValueForKey:fromDictionary:](VUIFeaturesConfiguration, "stringValueForKey:fromDictionary:", CFSTR("prewarmImageUrl"), v4);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
    -[VUILaunchConfig setPrewarmImageUrl:](self->_launchConfig, "setPrewarmImageUrl:", v16);
  v34 = (void *)v16;
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("layoutReuseIdleTimeToLive"), v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
    -[VUILaunchConfig setLayoutReuseIdleTimeToLive:](self->_launchConfig, "setLayoutReuseIdleTimeToLive:", objc_msgSend(v17, "integerValue"));
  v33 = v18;
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("collectionUseIdForReuseIdEnabled"), v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    -[VUILaunchConfig setCollectionUseIdForReuseIdEnabled:](self->_launchConfig, "setCollectionUseIdForReuseIdEnabled:", objc_msgSend(v19, "BOOLValue"));
    VUIDefaultLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v20;
      _os_log_impl(&dword_1D96EE000, v21, OS_LOG_TYPE_DEFAULT, "FeaturesConfiguration:: populateLaunchConfig collectionUseIdForReuseIdEnabled: %@", buf, 0xCu);
    }

  }
  v37 = v6;
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("gridViewUseItemIdAsReuseId"), v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    -[VUILaunchConfig setGridViewUseItemIdAsReuseId:](self->_launchConfig, "setGridViewUseItemIdAsReuseId:", objc_msgSend(v22, "BOOLValue"));
    VUIDefaultLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v23;
      _os_log_impl(&dword_1D96EE000, v24, OS_LOG_TYPE_DEFAULT, "FeaturesConfiguration:: populateLaunchConfig gridViewUseItemIdAsReuseId: %@", buf, 0xCu);
    }

  }
  v36 = v8;
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("memoryImageCacheEnabled"), v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    -[VUILaunchConfig setMemoryImageCacheEnabled:](self->_launchConfig, "setMemoryImageCacheEnabled:", objc_msgSend(v25, "BOOLValue"));
    VUIDefaultLogObject();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v26;
      _os_log_impl(&dword_1D96EE000, v27, OS_LOG_TYPE_DEFAULT, "FeaturesConfiguration:: populateLaunchConfig memoryImageCacheEnabled: %@", buf, 0xCu);
    }

  }
  v35 = v11;
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("imageInMemoryCacheSizeLimitInBytes"), v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[VUILaunchConfig setImageInMemoryCacheSizeLimitInBytes:](self->_launchConfig, "setImageInMemoryCacheSizeLimitInBytes:", objc_msgSend(v20, "integerValue"));
    VUIDefaultLogObject();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v28;
      _os_log_impl(&dword_1D96EE000, v29, OS_LOG_TYPE_DEFAULT, "FeaturesConfiguration:: populateLaunchConfig imageInMemoryCacheSizeLimitInBytes: %@", buf, 0xCu);
    }

  }
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("deferRichTextViewUpdate"), v4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    -[VUILaunchConfig setDeferRichTextViewUpdate:](self->_launchConfig, "setDeferRichTextViewUpdate:", objc_msgSend(v30, "BOOLValue"));
    VUIDefaultLogObject();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v31;
      _os_log_impl(&dword_1D96EE000, v32, OS_LOG_TYPE_DEFAULT, "FeaturesConfiguration:: populateLaunchConfig deferRichTextViewUpdate: %@", buf, 0xCu);
    }

  }
}

- (void)_populateMediaShowcaseConfig:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  VUIMediaShowcasingConfig *mediaShowcaseConfig;
  void *v9;
  void *v10;
  VUIMediaShowcasingConfig *v11;
  void *v12;
  void *v13;
  VUIMediaShowcasingConfig *v14;
  void *v15;
  void *v16;
  VUIMediaShowcasingConfig *v17;
  void *v18;
  void *v19;
  void *v20;
  VUIMediaShowcasingConfig *v21;
  void *v22;
  void *v23;
  void *v24;
  VUIMediaShowcasingConfig *v25;
  float v26;
  void *v27;
  void *v28;
  void *v29;
  VUIMediaShowcasingConfig *v30;
  float v31;
  void *v32;
  void *v33;
  VUIMediaShowcasingConfig *v34;
  void *v35;
  void *v36;
  VUIMediaShowcasingConfig *v37;
  float v38;
  void *v39;
  void *v40;
  VUIMediaShowcasingConfig *v41;
  float v42;
  void *v43;
  void *v44;
  VUIMediaShowcasingConfig *v45;
  void *v46;
  void *v47;
  VUIMediaShowcasingConfig *v48;
  void *v49;
  void *v50;
  VUIMediaShowcasingConfig *v51;
  float v52;
  void *v53;
  void *v54;
  VUIMediaShowcasingConfig *v55;
  float v56;
  void *v57;
  void *v58;
  VUIMediaShowcasingConfig *v59;
  void *v60;
  void *v61;
  VUIMediaShowcasingConfig *v62;
  void *v63;
  void *v64;
  VUIMediaShowcasingConfig *v65;
  void *v66;
  void *v67;
  VUIMediaShowcasingConfig *v68;
  void *v69;
  void *v70;
  VUIMediaShowcasingConfig *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  VUIMediaShowcasingConfig *v76;
  void *v77;
  void *v78;
  VUIMediaShowcasingConfig *v79;
  void *v80;
  void *v81;
  VUIMediaShowcasingConfig *v82;
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
  id v98;

  v98 = a3;
  v4 = objc_msgSend(v98, "count");
  v5 = v98;
  if (v4)
  {
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("playbackDelayInterval"), v98);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      mediaShowcaseConfig = self->_mediaShowcaseConfig;
      objc_msgSend(v6, "doubleValue");
      -[VUIMediaShowcasingConfig setPlaybackDelayInterval:](mediaShowcaseConfig, "setPlaybackDelayInterval:");
    }
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("animationTransitionDuration"), v98);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = self->_mediaShowcaseConfig;
      objc_msgSend(v9, "doubleValue");
      -[VUIMediaShowcasingConfig setAnimationTransitionDuration:](v11, "setAnimationTransitionDuration:");
    }
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("backgroundVolume"), v98);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = self->_mediaShowcaseConfig;
      objc_msgSend(v12, "floatValue");
      -[VUIMediaShowcasingConfig setBackgroundVolume:](v14, "setBackgroundVolume:");
    }
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("foregroundVolume"), v98);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = self->_mediaShowcaseConfig;
      objc_msgSend(v15, "floatValue");
      -[VUIMediaShowcasingConfig setForegroundVolume:](v17, "setForegroundVolume:");
    }
    v94 = v16;
    v18 = v13;
    -[VUIMediaShowcasingConfig setBackgroundMediaTransferEnabled:](self->_mediaShowcaseConfig, "setBackgroundMediaTransferEnabled:", +[VUIFeaturesConfiguration BOOLValueForKey:fromDictionary:defaultValue:](VUIFeaturesConfiguration, "BOOLValueForKey:fromDictionary:defaultValue:", CFSTR("backgroundMediaTransferEnabled"), v98, 1));
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("backgroundMediaTransferAnimationDuration"), v98);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = self->_mediaShowcaseConfig;
      objc_msgSend(v19, "doubleValue");
      -[VUIMediaShowcasingConfig setBackgroundMediaTransferAnimationDuration:](v21, "setBackgroundMediaTransferAnimationDuration:");
    }
    v22 = v10;
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("fullscreenPlaybackTransitionDuration"), v98);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = self->_mediaShowcaseConfig;
      objc_msgSend(v23, "floatValue");
      -[VUIMediaShowcasingConfig setBackgroundMediaFullscreenTransitionDuration:](v25, "setBackgroundMediaFullscreenTransitionDuration:", v26);
    }
    v27 = v7;
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("volumeTransitionAnimationDuration"), v98);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      v30 = self->_mediaShowcaseConfig;
      objc_msgSend(v28, "floatValue");
      -[VUIMediaShowcasingConfig setVolumeTransitionAnimationDuration:](v30, "setVolumeTransitionAnimationDuration:", v31);
    }
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("numberOfVolumeIncrementsKey"), v98);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
    {
      v34 = self->_mediaShowcaseConfig;
      objc_msgSend(v32, "floatValue");
      -[VUIMediaShowcasingConfig setBackgroundVolume:](v34, "setBackgroundVolume:");
    }
    v90 = v33;
    -[VUIMediaShowcasingConfig setRubberBandingEnabled:](self->_mediaShowcaseConfig, "setRubberBandingEnabled:", +[VUIFeaturesConfiguration BOOLValueForKey:fromDictionary:defaultValue:](VUIFeaturesConfiguration, "BOOLValueForKey:fromDictionary:defaultValue:", CFSTR("rubberBandingEnabled"), v98, 1));
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("swipingEndAnimationDuration"), v98);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
    {
      v37 = self->_mediaShowcaseConfig;
      objc_msgSend(v35, "floatValue");
      -[VUIMediaShowcasingConfig setSwipingEndAnimationDuration:](v37, "setSwipingEndAnimationDuration:", v38);
    }
    v89 = v36;
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("autoSwipeAnimationDuration"), v98);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v27;
    v40 = v39;
    if (v39)
    {
      v41 = self->_mediaShowcaseConfig;
      objc_msgSend(v39, "floatValue");
      -[VUIMediaShowcasingConfig setAutoSwipeAnimationDuration:](v41, "setAutoSwipeAnimationDuration:", v42);
    }
    v88 = v40;
    -[VUIMediaShowcasingConfig setCarouselBehaviorEnabled:](self->_mediaShowcaseConfig, "setCarouselBehaviorEnabled:", +[VUIFeaturesConfiguration BOOLValueForKey:fromDictionary:defaultValue:](VUIFeaturesConfiguration, "BOOLValueForKey:fromDictionary:defaultValue:", CFSTR("carouselBehaviorEnabled"), v98, 1));
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("titleViewTransitionDistance"), v98);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v22;
    v44 = v43;
    if (v43)
    {
      v45 = self->_mediaShowcaseConfig;
      objc_msgSend(v43, "floatValue");
      -[VUIMediaShowcasingConfig setTitleViewTransitionDistance:](v45, "setTitleViewTransitionDistance:");
    }
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("navigationBarTransitionDistance"), v98);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v46)
    {
      v48 = self->_mediaShowcaseConfig;
      objc_msgSend(v46, "floatValue");
      -[VUIMediaShowcasingConfig setNavigationBarTransitionDistance:](v48, "setNavigationBarTransitionDistance:");
    }
    v86 = v47;
    -[VUIMediaShowcasingConfig setAutoAdvanceToNextPageEnabled:](self->_mediaShowcaseConfig, "setAutoAdvanceToNextPageEnabled:", +[VUIFeaturesConfiguration BOOLValueForKey:fromDictionary:defaultValue:](VUIFeaturesConfiguration, "BOOLValueForKey:fromDictionary:defaultValue:", CFSTR("autoAdvanceToNextPageEnabled"), v98, 1));
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("advanceToNextPageDelayDuration"), v98);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (v49)
    {
      v51 = self->_mediaShowcaseConfig;
      objc_msgSend(v49, "floatValue");
      -[VUIMediaShowcasingConfig setAdvanceToNextPageDelayDuration:](v51, "setAdvanceToNextPageDelayDuration:", v52);
    }
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("advanceToNextPageDelayDurationImageOnly"), v98);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v53;
    if (v53)
    {
      v55 = self->_mediaShowcaseConfig;
      objc_msgSend(v53, "floatValue");
      -[VUIMediaShowcasingConfig setAdvanceToNextPageDelayDurationImageOnly:](v55, "setAdvanceToNextPageDelayDurationImageOnly:", v56);
    }
    v84 = v54;
    v93 = v20;
    -[VUIMediaShowcasingConfig setParallaxEnabled:](self->_mediaShowcaseConfig, "setParallaxEnabled:", +[VUIFeaturesConfiguration BOOLValueForKey:fromDictionary:defaultValue:](VUIFeaturesConfiguration, "BOOLValueForKey:fromDictionary:defaultValue:", CFSTR("parallaxEnabled"), v98, 1));
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("parallaxRatio"), v98);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v57;
    if (v57)
    {
      v59 = self->_mediaShowcaseConfig;
      objc_msgSend(v57, "floatValue");
      -[VUIMediaShowcasingConfig setParallaxRatio:](v59, "setParallaxRatio:");
    }
    v92 = v24;
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("metadataFadeOutSpeed"), v98);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v60;
    if (v60)
    {
      v62 = self->_mediaShowcaseConfig;
      objc_msgSend(v60, "floatValue");
      -[VUIMediaShowcasingConfig setMetadataFadeOutSpeed:](v62, "setMetadataFadeOutSpeed:");
    }
    v91 = v29;
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("metadataFadeInSpeed"), v98);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v63;
    if (v63)
    {
      v65 = self->_mediaShowcaseConfig;
      objc_msgSend(v63, "floatValue");
      -[VUIMediaShowcasingConfig setMetadataFadeInSpeed:](v65, "setMetadataFadeInSpeed:");
    }
    v85 = v50;
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("swipeCompletionSpeedFactor"), v98);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v66;
    if (v66)
    {
      v68 = self->_mediaShowcaseConfig;
      objc_msgSend(v66, "floatValue");
      -[VUIMediaShowcasingConfig setSwipeCompletionSpeedFactor:](v68, "setSwipeCompletionSpeedFactor:");
    }
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("itemHoverDelayDuration"), v98, v58);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v69;
    if (v69)
    {
      v71 = self->_mediaShowcaseConfig;
      objc_msgSend(v69, "doubleValue");
      -[VUIMediaShowcasingConfig setItemHoverDelayDuration:](v71, "setItemHoverDelayDuration:");
    }
    v87 = v44;
    v95 = v18;
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("gradientUsesImageColor"), v98);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v72;
    if (v72)
      -[VUIMediaShowcasingConfig setGradientUsesImageColor:](self->_mediaShowcaseConfig, "setGradientUsesImageColor:", objc_msgSend(v72, "BOOLValue"));
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("hideMuteButtonDelayDuration"), v98);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v74;
    if (v74)
    {
      v76 = self->_mediaShowcaseConfig;
      objc_msgSend(v74, "doubleValue");
      -[VUIMediaShowcasingConfig setHideMuteButtonDelayDuration:](v76, "setHideMuteButtonDelayDuration:");
    }
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("hidePageIndicatorsDelayDuration"), v98);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v77;
    if (v77)
    {
      v79 = self->_mediaShowcaseConfig;
      objc_msgSend(v77, "doubleValue");
      -[VUIMediaShowcasingConfig setHidePageIndicatorsDelayDuration:](v79, "setHidePageIndicatorsDelayDuration:");
    }
    if (+[VUIFeaturesConfiguration BOOLValueForKey:fromDictionary:defaultValue:](VUIFeaturesConfiguration, "BOOLValueForKey:fromDictionary:defaultValue:", CFSTR("mediaShowcasingAllowsFullscreenTransition"), v98, 0))
    {
      -[VUIMediaShowcasingConfig setAllowsFullscreenMediaTransition:](self->_mediaShowcaseConfig, "setAllowsFullscreenMediaTransition:", 1);
    }
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("sidebarOpenDuringAnimationThreshold"), v98);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v80;
    if (v80)
    {
      v82 = self->_mediaShowcaseConfig;
      objc_msgSend(v80, "floatValue");
      -[VUIMediaShowcasingConfig setSidebarOpenDuringAnimationThreshold:](v82, "setSidebarOpenDuringAnimationThreshold:");
    }

    v5 = v98;
  }

}

- (void)_populateRootControllerConfig:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  VUIRootControllerConfig *rootControllerConfig;
  void *v13;
  void *v14;
  VUIRootControllerConfig *v15;
  void *v16;
  void *v17;
  VUIRootControllerConfig *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  VUIRootControllerConfig *v23;
  void *v24;
  void *v25;
  VUIRootControllerConfig *v26;
  void *v27;
  void *v28;
  VUIRootControllerConfig *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  v35 = a3;
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("normalControllerLimit"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
    -[VUIRootControllerConfig setNormalControllerLimit:](self->_rootControllerConfig, "setNormalControllerLimit:", v4);
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("warningControllerLimit"), v35);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    -[VUIRootControllerConfig setWarningControllerLimit:](self->_rootControllerConfig, "setWarningControllerLimit:", v5);
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("criticalControllerLimit"), v35);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    -[VUIRootControllerConfig setCriticalControllerLimit:](self->_rootControllerConfig, "setCriticalControllerLimit:", v6);
  v34 = (void *)v4;
  objc_msgSend(v35, "vui_arrayForKey:", CFSTR("doNotPurgeList"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
    -[VUIRootControllerConfig setDoNotPurgeList:](self->_rootControllerConfig, "setDoNotPurgeList:", v7);
  v31 = (void *)v7;
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("sidebarImagePrefetchBatchLimit"), v35);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    -[VUIRootControllerConfig setSidebarImagePrefetchBatchLimit:](self->_rootControllerConfig, "setSidebarImagePrefetchBatchLimit:", objc_msgSend(v8, "integerValue"));
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("programmaticOpenSidebarTimeout"), v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    rootControllerConfig = self->_rootControllerConfig;
    objc_msgSend(v10, "doubleValue");
    -[VUIRootControllerConfig setProgrammaticOpenSidebarTimeout:](rootControllerConfig, "setProgrammaticOpenSidebarTimeout:");
  }
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("userDrivenSidebarTimeout"), v35);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = self->_rootControllerConfig;
    objc_msgSend(v13, "doubleValue");
    -[VUIRootControllerConfig setUserDrivenSidebarTimeout:](v15, "setUserDrivenSidebarTimeout:");
  }
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("stackActiveDuration"), v35);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = self->_rootControllerConfig;
    objc_msgSend(v16, "doubleValue");
    -[VUIRootControllerConfig setStackActiveDuration:](v18, "setStackActiveDuration:");
  }
  v33 = (void *)v5;
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("numTeachableMomentsPerUser"), v35);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
    -[VUIRootControllerConfig setNumTeachableMomentsPerUser:](self->_rootControllerConfig, "setNumTeachableMomentsPerUser:", objc_msgSend(v19, "integerValue"));
  v32 = (void *)v6;
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("teachableMomentSidebarTimeout"), v35);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    v23 = self->_rootControllerConfig;
    objc_msgSend(v21, "doubleValue");
    -[VUIRootControllerConfig setTeachableMomentSidebarTimeout:](v23, "setTeachableMomentSidebarTimeout:");
  }
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("teachableMomentPillUITimeout"), v35);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    v26 = self->_rootControllerConfig;
    objc_msgSend(v24, "doubleValue");
    -[VUIRootControllerConfig setTeachableMomentPillUITimeout:](v26, "setTeachableMomentPillUITimeout:");
  }
  +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("teachableBackgroundReshowTime"), v35);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    v29 = self->_rootControllerConfig;
    objc_msgSend(v27, "doubleValue");
    -[VUIRootControllerConfig setTeachableBackgroundReshowTime:](v29, "setTeachableBackgroundReshowTime:");
  }
  objc_msgSend(v35, "vui_numberForKey:", CFSTR("teachableMomentImpressionsDictionaryHash"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    -[VUIRootControllerConfig setTeachableMomentImpressionsDictionaryHash:](self->_rootControllerConfig, "setTeachableMomentImpressionsDictionaryHash:", v30);

}

+ (BOOL)BOOLValueForKey:(id)a3 fromDictionary:(id)a4 defaultValue:(BOOL)a5
{
  uint64_t v5;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length"))
  {
    +[VUIFeaturesConfiguration defaultsNumberValueForKey:](VUIFeaturesConfiguration, "defaultsNumberValueForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = objc_msgSend(v10, "BOOLForKey:", v7);

    }
    else
    {
      LOBYTE(v5) = objc_msgSend(v8, "vui_BOOLForKey:defaultValue:", v7, v5);
    }

  }
  return v5;
}

void __49__VUIFeaturesConfiguration_updateWithDictionary___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  VUISignpostLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FeaturesConfiguration.WriteCache", ", buf, 2u);
  }

  +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cacheFeatureConfiguration:", *(_QWORD *)(a1 + 32));

  VUISignpostLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "FeaturesConfiguration.WriteCache", ", v5, 2u);
  }

}

- (void)_cacheFeatureConfiguration:(id)a3
{
  void *v4;
  id v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 0, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  if (v5)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (v6)
  {
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIFeaturesConfiguration:: cache feature configs error: %@", buf, 0xCu);
    }
  }
  else
  {
    -[VUIFeaturesConfiguration _cachePath](self, "_cachePath");
    v8 = objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v8)
    {
      v9 = objc_msgSend(v4, "writeToFile:atomically:", v8, 1);
      VUIDefaultLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v13) = v9;
        _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIFeaturesConfiguration:: cache features config, result: %d", buf, 8u);
      }

    }
  }

}

- (id)_cachePath
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("features_config"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIFeaturesConfiguration:: Unable to find cache path", v7, 2u);
    }

    v4 = 0;
  }

  return v4;
}

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD block[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUIFeaturesConfiguration _populateConfigWithDictionary:](self, "_populateConfigWithDictionary:", v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "count"))
  {
    -[VUIFeaturesConfiguration cachedConfigDictionary](self, "cachedConfigDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)objc_opt_new();
      -[VUIFeaturesConfiguration setCachedConfigDictionary:](self, "setCachedConfigDictionary:", v6);

    }
    v7 = (void *)MEMORY[0x1E0C99E60];
    v28[0] = CFSTR("launchConfig");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v9, "containsObject:", v15))
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedConfigDictionary, "setObject:forKeyedSubscript:", v16, v15);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v12);
    }

  }
  -[VUIFeaturesConfiguration cachedConfigDictionary](self, "cachedConfigDictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");

  dispatch_get_global_queue(9, 0);
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__VUIFeaturesConfiguration_updateWithDictionary___block_invoke;
  block[3] = &unk_1E9F98DF0;
  v22 = v18;
  v20 = v18;
  dispatch_async(v19, block);

}

- (NSMutableDictionary)cachedConfigDictionary
{
  return self->_cachedConfigDictionary;
}

- (VUIDropOnTabConfig)dropOnTabConfig
{
  return self->_dropOnTabConfig;
}

- (void)setCachedConfigDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_cachedConfigDictionary, a3);
}

- (void)_populateTabItemsUpdateConfig:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "vui_dictionaryForKey:", CFSTR("eventDescriptors"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[VUITabItemsUpdateConfig setEventDescriptors:](self->_tabItemsUpdateConfig, "setEventDescriptors:", v4);
    v4 = v5;
  }

}

- (void)parseUpNextConfig:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a3, "vui_dictionaryForKey:", CFSTR("upNextConfig"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v12, "count");
  v5 = v12;
  if (v4)
  {
    objc_msgSend(v12, "vui_numberForKey:", CFSTR("delayForUpnextCallAfterMarkAsWatched"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      -[VUIUpNextConfig setUpNextCallDelayAfterMarkAsWatched:](self->_upNextConfig, "setUpNextCallDelayAfterMarkAsWatched:", objc_msgSend(v6, "unsignedIntegerValue"));
    objc_msgSend(v12, "vui_numberForKey:", CFSTR("delayForRefreshUpnextCallAfterRemoveFromUpNext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      -[VUIUpNextConfig setUpNextRefreshCallDelayAfterRemoveFromUpNext:](self->_upNextConfig, "setUpNextRefreshCallDelayAfterRemoveFromUpNext:", objc_msgSend(v8, "unsignedIntegerValue"));
    objc_msgSend(v12, "vui_numberForKey:", CFSTR("shouldUpdateOutboundAfterRemoveFromUpNext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      -[VUIUpNextConfig setShouldUpdateOutboundAfterRemoveFromUpNext:](self->_upNextConfig, "setShouldUpdateOutboundAfterRemoveFromUpNext:", objc_msgSend(v10, "BOOLValue"));

    v5 = v12;
  }

}

- (VUIMediaShowcasingConfig)mediaShowcaseConfig
{
  return self->_mediaShowcaseConfig;
}

- (VUIAutoPlayConfig)autoPlayConfig
{
  return self->_autoPlayConfig;
}

- (VUIAccountConfig)accountConfig
{
  return self->_accountConfig;
}

- (void)_updateTVSettingsIfNeeded:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  int v12;
  _BOOL4 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v12 = 67109120;
    v13 = v3;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_INFO, "FeaturesConfiguration:: _updateTVSettingsIfNeeded autoPlayVideoSound = %d", (uint8_t *)&v12, 8u);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("AutoPlayBgVideoSoundUserHasChanged"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "BOOLValue"))
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_INFO, "FeaturesConfiguration:: Ignore updating AutoPlayBgVideoSound because user has changed the value", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    objc_msgSend(v5, "valueForKey:", CFSTR("AutoPlayBgVideoSound"));
    v9 = objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (v9)
      v10 = -[NSObject BOOLValue](v9, "BOOLValue");
    else
      v10 = 1;
    if (v10 != v3)
    {
      VUIDefaultLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = 67109120;
        v13 = v3;
        _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_INFO, "FeaturesConfiguration:: Update AutoPlayBgVideoSound to %d", (uint8_t *)&v12, 8u);
      }

      objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("AutoPlayBgVideoSound"));
    }
  }

}

- (void)_populateTimedMetadataConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  void *v11;
  float v12;
  void *v13;
  void *v14;
  float v15;
  void *v16;
  void *v17;
  float v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  float v23;
  id v24;

  v4 = a3;
  if (v4)
  {
    v24 = v4;
    v5 = (void *)objc_opt_new();
    objc_msgSend(v24, "vui_dictionaryForKey:", CFSTR("visualSmoothingConfig"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("timeRangeProximityThreshold"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "floatValue");
      objc_msgSend(v5, "setTimeRangeProximityThreshold:", v9);
    }
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("initialLookAhead"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "floatValue");
      objc_msgSend(v5, "setInitialLookAhead:", v12);
    }
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("initialLookBack"), v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "floatValue");
      objc_msgSend(v5, "setInitialLookBack:", v15);
    }
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("lookAhead"), v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "floatValue");
      objc_msgSend(v5, "setLookAhead:", v18);
    }
    objc_msgSend(v24, "vui_dictionaryForKey:", CFSTR("audioSmoothingConfig"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_opt_new();
    +[VUIFeaturesConfiguration numberValueForKey:fromDictionary:](VUIFeaturesConfiguration, "numberValueForKey:fromDictionary:", CFSTR("durationToRetainAudioEntity"), v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "floatValue");
      objc_msgSend(v20, "setDurationToRetainAudioEntity:", v23);
    }
    -[VUITimedMetadataConfig setVisualSmoothingConfig:](self->_timedMetadataConfig, "setVisualSmoothingConfig:", v5);
    -[VUITimedMetadataConfig setAudioSmoothingConfig:](self->_timedMetadataConfig, "setAudioSmoothingConfig:", v20);

    v4 = v24;
  }

}

- (VUIPlaybackUpNextConfig)playbackUpNextConfig
{
  return self->_playbackUpNextConfig;
}

- (VUINowPlayingConfig)nowPlayingConfig
{
  return self->_nowPlayingConfig;
}

- (VUILiveLinkConfig)liveLinkConfig
{
  return self->_liveLinkConfig;
}

- (VUIDownloadConfig)downloadConfig
{
  return self->_downloadConfig;
}

- (VUISyndicationConfig)syndicationConfig
{
  return self->_syndicationConfig;
}

- (VUIUpNextConfig)upNextConfig
{
  return self->_upNextConfig;
}

- (VUICanonicalConfig)canonicalConfig
{
  return self->_canonicalConfig;
}

- (VUIAccountMessageConfig)accountMessageConfig
{
  return self->_accountMessageConfig;
}

- (VUIRootControllerConfig)rootControllerConfig
{
  return self->_rootControllerConfig;
}

- (VUITabItemsUpdateConfig)tabItemsUpdateConfig
{
  return self->_tabItemsUpdateConfig;
}

- (VUIMultiviewConfig)multiviewConfig
{
  return self->_multiviewConfig;
}

- (VUILibConfig)libConfig
{
  return self->_libConfig;
}

- (VUIGDPRConfig)gdprConfig
{
  return self->_gdprConfig;
}

- (VUITimedMetadataConfig)timedMetadataConfig
{
  return self->_timedMetadataConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedConfigDictionary, 0);
  objc_storeStrong((id *)&self->_timedMetadataConfig, 0);
  objc_storeStrong((id *)&self->_gdprConfig, 0);
  objc_storeStrong((id *)&self->_libConfig, 0);
  objc_storeStrong((id *)&self->_multiviewConfig, 0);
  objc_storeStrong((id *)&self->_launchConfig, 0);
  objc_storeStrong((id *)&self->_tabItemsUpdateConfig, 0);
  objc_storeStrong((id *)&self->_rootControllerConfig, 0);
  objc_storeStrong((id *)&self->_accountMessageConfig, 0);
  objc_storeStrong((id *)&self->_accountConfig, 0);
  objc_storeStrong((id *)&self->_canonicalConfig, 0);
  objc_storeStrong((id *)&self->_upNextConfig, 0);
  objc_storeStrong((id *)&self->_mediaShowcaseConfig, 0);
  objc_storeStrong((id *)&self->_dropOnTabConfig, 0);
  objc_storeStrong((id *)&self->_syndicationConfig, 0);
  objc_storeStrong((id *)&self->_downloadConfig, 0);
  objc_storeStrong((id *)&self->_liveLinkConfig, 0);
  objc_storeStrong((id *)&self->_autoPlayConfig, 0);
  objc_storeStrong((id *)&self->_playerTabsConfig, 0);
  objc_storeStrong((id *)&self->_nowPlayingConfig, 0);
  objc_storeStrong((id *)&self->_playbackUpNextConfig, 0);
}

@end
