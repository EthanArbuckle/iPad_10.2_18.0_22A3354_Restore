@implementation VUIMediaInfo

- (void)setPrimaryVideoAspectRatio:(double)a3
{
  self->_primaryVideoAspectRatio = a3;
}

- (void)setImageThemes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setGradientDisabled:(BOOL)a3
{
  self->_gradientDisabled = a3;
}

- (void)_populateMediaItem:(id)a3 withMetadataFromVideosPlayable:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  NSObject *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  _BOOL4 v73;
  void *v74;
  void *v75;
  _BOOL4 v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  uint64_t v88;
  void *v89;
  VUIMediaInfo *v90;
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
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
    objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v8, *MEMORY[0x1E0DB1CC8]);
  objc_msgSend(v6, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
    objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v10, *MEMORY[0x1E0DB1B70]);
  objc_msgSend(v6, "artworkURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = (_QWORD *)MEMORY[0x1E0DB19E8];
  if (v11)
  {
    objc_msgSend(v11, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v14, *v13);

  }
  objc_msgSend(v6, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scheduleStartTime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "doubleValue");
  if (v17 > 0.0)
    objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v16, *MEMORY[0x1E0DB1BD8]);
  v107 = v12;
  objc_msgSend(v6, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scheduleEndTime");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "doubleValue");
  if (v20 > 0.0)
    objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v19, *MEMORY[0x1E0DB1BD0]);
  v111 = v19;
  objc_msgSend(v6, "metadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "transportBarStartTime");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v110 = v22;
  objc_msgSend(v22, "doubleValue");
  if (v23 > 0.0)
  {
    +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "nowPlayingConfig");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "shouldSendLiveStreamStartAndEndTimesToAVKit");

    if (v26)
    {
      +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "nowPlayingConfig");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "liveStreamStartAndEndTimeBadMetadataCutoff");
      v30 = v29;

      if (v30 <= 0.0)
      {
        objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v110, *MEMORY[0x1E0DB1AA8]);
      }
      else
      {
        v31 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v110, "doubleValue");
        objc_msgSend(v31, "dateWithTimeIntervalSince1970:", v32 / 1000.0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "timeIntervalSinceDate:", v33);
        v36 = v35;

        if (v36 >= v30)
        {
          VUIDefaultLogObject();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            -[VUIMediaInfo _populateMediaItem:withMetadataFromVideosPlayable:].cold.2();

        }
        else
        {
          objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v110, *MEMORY[0x1E0DB1AA8]);
        }

      }
    }
  }
  objc_msgSend(v6, "metadata");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "transportBarEndTime");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v109 = v39;
  objc_msgSend(v39, "doubleValue");
  if (v40 > 0.0)
  {
    +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "nowPlayingConfig");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "shouldSendLiveStreamStartAndEndTimesToAVKit");

    if (v43)
    {
      +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "nowPlayingConfig");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "liveStreamStartAndEndTimeBadMetadataCutoff");
      v47 = v46;

      if (v47 <= 0.0)
      {
        objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v109, *MEMORY[0x1E0DB1AA0]);
      }
      else
      {
        v48 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v109, "doubleValue");
        objc_msgSend(v48, "dateWithTimeIntervalSince1970:", v49 / 1000.0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "timeIntervalSinceDate:", v50);
        v53 = v52;

        if (v53 >= v47)
        {
          VUIDefaultLogObject();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            -[VUIMediaInfo _populateMediaItem:withMetadataFromVideosPlayable:].cold.1();

        }
        else
        {
          objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v109, *MEMORY[0x1E0DB1AA0]);
        }

      }
    }
  }
  objc_msgSend(v6, "metadata");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "venueName");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v56, "length"))
    objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v56, *MEMORY[0x1E0DB1C90]);
  v113 = v56;
  objc_msgSend(v6, "metadata");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "venueAddress");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v58, "length"))
    objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v58, *MEMORY[0x1E0DB1C88]);
  objc_msgSend(v6, "metadata");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "leagueShortName");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v60, "length"))
    objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v60, *MEMORY[0x1E0DB1C80]);
  v114 = v60;
  v108 = v10;
  objc_msgSend(v6, "metadata");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "leagueName");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v62, "length"))
    objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v62, *MEMORY[0x1E0DB1C78]);
  v112 = v62;
  objc_msgSend(v6, "metadata");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "isEligibleForPlayerTabs");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v65, CFSTR("VUIMediaItemMetadataIsEligibleForPlayerTabs"));

  objc_msgSend(v6, "playablePassThrough");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v66, "length"))
    objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v66, CFSTR("VUIMediaItemMetadataPlayablePassThrough"));
  v104 = v66;
  v67 = objc_msgSend(v6, "isKeyPlayAvailable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v68, CFSTR("VUIMediaItemMetadataIsKeyPlayAvailable"));

  +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "playerTabsConfig");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v103 = v70;
  v71 = objc_msgSend(v70, "infoTabMustHaveImageToDisplay");
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *v13);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    v73 = 1;
  }
  else
  {
    objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19E0]);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v74 != 0;

  }
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (v75)
  {
    v76 = 1;
  }
  else
  {
    objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v77 != 0;

  }
  if (v71)
    v78 = v73 & v76;
  else
    v78 = v76;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v79, CFSTR("VUIMediaItemMetadataIsEligibleForInfoTab"));

  v80 = objc_msgSend(v6, "supportsStartOver");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v81, CFSTR("VUIMediaItemMetadataSupportsStartOver"));

  objc_msgSend(v6, "preferredAudioLanguageCode");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v82, "length"))
    objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v82, CFSTR("VUIMediaItemMetadataPreferredAudioLanguageCode"));
  objc_msgSend(v6, "metadata");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "tomatoPercentage");
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (v84)
  {
    objc_msgSend(v84, "doubleValue");
    if (v85 >= 0.0)
    {
      objc_msgSend(v84, "doubleValue");
      if (v86 <= 100.0)
        objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v84, *MEMORY[0x1E0DB1CD8]);
    }
  }
  objc_msgSend(v6, "metadata");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v87, "tomatoFreshness");

  if (v88 != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v89, *MEMORY[0x1E0DB1CD0]);

  }
  v90 = self;
  v106 = v16;
  v91 = v111;
  -[VUIMediaInfo _sportingEventSubtitleFromStartTime:endTime:leagueShortName:](v90, "_sportingEventSubtitleFromStartTime:endTime:leagueShortName:", v16, v111, v114);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (v92)
    objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v92, *MEMORY[0x1E0DB1CC0]);
  objc_msgSend(v6, "metadata");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "sportName");
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v94, "length"))
    objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v94, *MEMORY[0x1E0DB1AF8]);
  v95 = v113;
  if (objc_msgSend(v113, "length") && objc_msgSend(v58, "length"))
  {
    v101 = v82;
    v102 = v8;
    v96 = (void *)MEMORY[0x1E0CB3940];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "localizedStringForKey:", CFSTR("SportingEventVenueDescription"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "stringWithFormat:", v98, v113, v58);
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v112, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ · %@"), v112, v99);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v100, *MEMORY[0x1E0DB1B70]);

    }
    else
    {
      objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v99, *MEMORY[0x1E0DB1B70]);
    }
    v8 = v102;
    v91 = v111;
    v82 = v101;

    v95 = v113;
  }
  if (objc_msgSend(v6, "makeAdditionalPlayerTabsRequest"))
    objc_msgSend(v5, "setMediaItemMetadata:forProperty:", MEMORY[0x1E0C9AAB0], CFSTR("VUIMediaItemMetadataMakeAdditionalPlayerTabsRequest"));

}

- (VUIMediaInfo)initWithPlaybackContext:(unint64_t)a3 videosPlayables:(id)a4 imageProxies:(id)a5 storeDictionary:(id)a6
{
  id v11;
  id v12;
  id v13;
  VUIMediaInfo *v14;
  VUIMediaInfo *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)VUIMediaInfo;
  v14 = -[VUIMediaInfo init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    *(_DWORD *)&v14->_automaticPlaybackStart = 0;
    v14->_allowsPictureInPicture = 1;
    v14->_playbackStartReason = 0;
    v14->_playbackStopReason = 0;
    v14->_playbackContext = a3;
    v14->_playbackDelayInterval = 5.0;
    objc_storeStrong((id *)&v14->_videosPlayables, a4);
    if (v12)
      -[VUIMediaInfo setImageProxies:](v15, "setImageProxies:", v12);
    if (objc_msgSend(v11, "count"))
    {
      -[VUIMediaInfo _playlistFromVideosPlayables:andStoreDictionary:](v15, "_playlistFromVideosPlayables:andStoreDictionary:", v11, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        -[VUIMediaInfo setTvpPlaylist:](v15, "setTvpPlaylist:", v16);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIMediaInfo setUserPlaybackInitiationDate:openURLCompletionDate:](v15, "setUserPlaybackInitiationDate:openURLCompletionDate:", v17, 0);

        -[VUIMediaInfo _updatePlaybackStartReason](v15, "_updatePlaybackStartReason");
        -[VUIMediaInfo _updatePlaybackStopReason](v15, "_updatePlaybackStopReason");
      }

    }
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIntent:", -[VUIMediaInfo intent](self, "intent"));
  -[VUIMediaInfo overlayView](self, "overlayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverlayView:", v5);

  -[VUIMediaInfo contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentView:", v6);

  -[VUIMediaInfo imageProxies](self, "imageProxies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageProxies:", v7);

  -[VUIMediaInfo backgroundColor](self, "backgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v8);

  -[VUIMediaInfo tvpPlaylist](self, "tvpPlaylist");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTvpPlaylist:", v9);

  objc_msgSend(v4, "setShowsSecondaryVideoView:", -[VUIMediaInfo showsSecondaryVideoView](self, "showsSecondaryVideoView"));
  objc_msgSend(v4, "setIsAudioOnly:", -[VUIMediaInfo isAudioOnly](self, "isAudioOnly"));
  objc_msgSend(v4, "setRestrictionsAlreadyUnlocked:", -[VUIMediaInfo restrictionsAlreadyUnlocked](self, "restrictionsAlreadyUnlocked"));
  objc_msgSend(v4, "setShouldDelayLoadingImage:", -[VUIMediaInfo shouldDelayLoadingImage](self, "shouldDelayLoadingImage"));
  objc_msgSend(v4, "setPlaybackContext:", -[VUIMediaInfo playbackContext](self, "playbackContext"));
  -[VUIMediaInfo playbackDelayInterval](self, "playbackDelayInterval");
  objc_msgSend(v4, "setPlaybackDelayInterval:");
  -[VUIMediaInfo alphaImageProxy](self, "alphaImageProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v4, "setAlphaImageProxy:", v11);

  -[VUIMediaInfo alphaLayerAccessibilityText](self, "alphaLayerAccessibilityText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v4, "setAlphaLayerAccessibilityText:", v13);

  -[VUIMediaInfo videosPlayables](self, "videosPlayables");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v4, "setVideosPlayables:", v15);

  return v4;
}

- (unint64_t)playbackContext
{
  return self->_playbackContext;
}

- (void)setShowsSecondaryVideoView:(BOOL)a3
{
  self->_showsSecondaryVideoView = a3;
}

- (void)setShouldDelayLoadingImage:(BOOL)a3
{
  self->_shouldDelayLoadingImage = a3;
}

- (void)setImageProxies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void)setAlphaLayerAccessibilityText:(id)a3
{
  objc_storeStrong((id *)&self->_alphaLayerAccessibilityText, a3);
}

- (void)setAlphaImageProxy:(id)a3
{
  objc_storeStrong((id *)&self->_alphaImageProxy, a3);
}

- (TVPPlaylist)tvpPlaylist
{
  return self->_tvpPlaylist;
}

- (void)setPlaybackDelayInterval:(double)a3
{
  self->_playbackDelayInterval = a3;
}

- (void)setTvpPlaylist:(id)a3
{
  objc_storeStrong((id *)&self->_tvpPlaylist, a3);
}

- (NSArray)videosPlayables
{
  return self->_videosPlayables;
}

- (BOOL)showsSecondaryVideoView
{
  return self->_showsSecondaryVideoView;
}

- (BOOL)shouldDelayLoadingImage
{
  return self->_shouldDelayLoadingImage;
}

- (void)setVideosPlayables:(id)a3
{
  objc_storeStrong((id *)&self->_videosPlayables, a3);
}

- (void)setRestrictionsAlreadyUnlocked:(BOOL)a3
{
  self->_restrictionsAlreadyUnlocked = a3;
}

- (void)setPlaybackContext:(unint64_t)a3
{
  self->_playbackContext = a3;
}

- (void)setOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayView, a3);
}

- (void)setIntent:(unint64_t)a3
{
  self->_intent = a3;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (BOOL)restrictionsAlreadyUnlocked
{
  return self->_restrictionsAlreadyUnlocked;
}

- (double)playbackDelayInterval
{
  return self->_playbackDelayInterval;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (unint64_t)intent
{
  return self->_intent;
}

- (VUIMediaInfo)init
{
  return -[VUIMediaInfo initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:](self, "initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:", 0, 0, 0, 0);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSString)alphaLayerAccessibilityText
{
  return self->_alphaLayerAccessibilityText;
}

- (VUIImageProxy)alphaImageProxy
{
  return self->_alphaImageProxy;
}

- (NSArray)imageProxies
{
  return self->_imageProxies;
}

- (void)setUserPlaybackInitiationDate:(id)a3 openURLCompletionDate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[VUIMediaInfo tvpPlaylist](self, "tvpPlaylist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentMediaItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "addOrReplaceStartEventWithName:date:", *MEMORY[0x1E0DB1F10], v14);
  objc_msgSend(v9, "addOrReplaceStartEventWithName:date:", *MEMORY[0x1E0DB1F28], v14);
  if (v6)
  {
    v10 = (uint64_t *)MEMORY[0x1E0DB1EE0];
    objc_msgSend(v9, "addOrReplaceStartEventWithName:date:", *MEMORY[0x1E0DB1EE0], v14);
    v11 = *v10;
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addEndEventWithName:identifier:timestamp:", v11, v11, v13);

  }
}

- (void)setPlaybackStopReason:(unint64_t)a3
{
  self->_playbackStopReason = a3;
}

- (void)setPlaybackStartReason:(unint64_t)a3
{
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  self->_playbackStartReason = a3;
  if (a3 - 2 > 6)
    v4 = CFSTR("Unknown");
  else
    v4 = (const __CFString *)**((id **)&unk_1E9FA15D8 + a3 - 2);
  v8 = (__CFString *)v4;
  -[VUIMediaInfo tvpPlaylist](self, "tvpPlaylist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentMediaItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSingleShotEventWithName:value:", *MEMORY[0x1E0DB1EE8], v8);

}

- (void)_updatePlaybackStopReason
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[VUIMediaInfo playbackContext](self, "playbackContext") - 6;
  if (v3 > 4)
    v4 = 0;
  else
    v4 = qword_1DA1C2438[v3];
  -[VUIMediaInfo setPlaybackStopReason:](self, "setPlaybackStopReason:", v4);
}

- (void)_updatePlaybackStartReason
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[VUIMediaInfo playbackContext](self, "playbackContext") - 2;
  if (v3 > 8)
    v4 = 4;
  else
    v4 = qword_1DA1C23F0[v3];
  -[VUIMediaInfo setPlaybackStartReason:](self, "setPlaybackStartReason:", v4);
}

- (id)_playlistFromVideosPlayables:(id)a3 andStoreDictionary:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  id obj;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = a4;
  if (!objc_msgSend(v6, "count"))
  {
    v26 = 0;
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = v6;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (!v7)
    goto LABEL_25;
  v8 = v7;
  v9 = *(_QWORD *)v34;
  v31 = *MEMORY[0x1E0DB1B68];
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v34 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      if (!objc_msgSend(v11, "isiTunesPurchaseOrRental", v28))
        goto LABEL_12;
      if (objc_msgSend(v11, "isFamilySharingContent"))
      {
        VUIDefaultLogObject();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Media item is a family sharing purchase.  Using aux media item for playback", buf, 2u);
        }

LABEL_12:
        v13 = 0;
        goto LABEL_14;
      }
      v13 = 1;
LABEL_14:
      v14 = (void *)objc_opt_class();
      objc_msgSend(v11, "playbackURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "adamID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "canonicalID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_playbackOverridesForURL:adamID:canonicalID:", v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        VUIDefaultLogObject();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "adamID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "playbackURL");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "canonicalID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v38 = v20;
          v39 = 2112;
          v40 = v21;
          v41 = 2112;
          v42 = v22;
          _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, "Will use aux media item and override playback metadata for adam ID %@ URL %@ canonical ID %@", buf, 0x20u);

        }
      }
      else if (v13)
      {
        -[VUIMediaInfo _storeMediaItemFromVideosPlayable:andStoreDictionary:](self, "_storeMediaItemFromVideosPlayable:andStoreDictionary:", v11, v29);
        v23 = objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      -[VUIMediaInfo _auxMediaItemFromVideosPlayable:](self, "_auxMediaItemFromVideosPlayable:", v11);
      v23 = objc_claimAutoreleasedReturnValue();
LABEL_21:
      v24 = (void *)v23;
      if (v23)
      {
        -[VUIMediaInfo _sportingEventTimeSpanStringFromMediaItem:](self, "_sportingEventTimeSpanStringFromMediaItem:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setMediaItemMetadata:forProperty:", v25, v31);
        objc_msgSend(v32, "addObject:", v24);

      }
    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  }
  while (v8);
LABEL_25:

  if (objc_msgSend(v32, "count"))
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB1970]), "initWithMediaItems:index:isCollection:", v32, 0, 0);
  else
    v26 = 0;

  v6 = v28;
LABEL_30:

  return v26;
}

- (id)_sportingEventTimeSpanStringFromMediaItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BD8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleForKey:", CFSTR("ProgramScheduleStartTimeOverrideInMS"));
  v8 = v7;

  if (v8 > 0.0)
  {
    VUIDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v8 / 1000.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v10;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Overriding program schedule start time with date %@", (uint8_t *)&v21, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
  }
  objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BD0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleForKey:", CFSTR("ProgramScheduleEndTimeOverrideInMS"));
  v15 = v14;

  if (v15 > 0.0)
  {
    VUIDefaultLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v15 / 1000.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v17;
      _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "Overriding program schedule end time with date %@", (uint8_t *)&v21, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
    v18 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v18;
  }
  -[VUIMediaInfo _sportingEventTimeSpanStringFromStartTime:endTime:](self, "_sportingEventTimeSpanStringFromStartTime:endTime:", v5, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_sportingEventSubtitleFromStartTime:(id)a3 endTime:(id)a4 leagueShortName:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  -[VUIMediaInfo _sportingEventTimeSpanStringFromStartTime:endTime:](self, "_sportingEventTimeSpanStringFromStartTime:endTime:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length") && objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ · %@"), v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_sportingEventTimeSpanStringFromStartTime:(id)a3 endTime:(id)a4
{
  void *v4;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = 0;
  if (a3 && a4)
  {
    v6 = (objc_class *)MEMORY[0x1E0CB3578];
    v7 = a4;
    v8 = a3;
    v9 = objc_alloc_init(v6);
    v10 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v8, "doubleValue");
    v12 = v11;

    objc_msgSend(v10, "dateWithTimeIntervalSince1970:", v12 / 1000.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v7, "doubleValue");
    v16 = v15;

    objc_msgSend(v14, "dateWithTimeIntervalSince1970:", v16 / 1000.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tvp_hourMinuteDisplayStringFromDate:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tvp_hourMinuteDisplayStringFromDate:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "AMSymbol");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "containsString:", v20))
    {
      objc_msgSend(v9, "AMSymbol");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v19, "containsString:", v21);

    }
    else
    {
      v22 = 0;
    }

    objc_msgSend(v9, "PMSymbol");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "containsString:", v23))
    {
      objc_msgSend(v9, "PMSymbol");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v19, "containsString:", v24);

    }
    else
    {
      v25 = 0;
    }

    if ((v22 | v25) == 1)
    {
      objc_msgSend(v9, "setDateFormat:", CFSTR("h:mm"));
      objc_msgSend(v9, "stringFromDate:", v13);
      v26 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v26;
    }
    if (objc_msgSend(v18, "length") && objc_msgSend(v19, "length"))
    {
      v27 = (void *)MEMORY[0x1E0CB3940];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:", CFSTR("SportingEventTimeSpan"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", v29, v18, v19);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (id)_auxMediaItemFromVideosPlayable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  VUIStoreAuxMediaItem *v11;
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
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
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
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  VUIStoreAuxMediaItem *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  unsigned int v92;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  unsigned int v96;
  unsigned int v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
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
  VUIMediaInfo *v142;
  uint8_t buf[4];
  void *v144;
  __int16 v145;
  void *v146;
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "canonicalID");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requiredAgeForPlayback");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frequencyOfAgeConfirmation");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = v5;
  v142 = self;
  if (!objc_msgSend(v5, "length"))
    goto LABEL_29;
  objc_msgSend(v4, "mediaType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "isEqualToString:", CFSTR("Trailer")))
  {
    +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "existingDownloadForAdamID:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      VUIDefaultLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v144 = 0;
        _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "Using existing media item being downloaded: %@", buf, 0xCu);
      }

      objc_msgSend(v9, "mediaItem");
      v11 = (VUIStoreAuxMediaItem *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "metadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mediaShareMetadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "metadata");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "showMediaShareMetadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "artworkURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "absoluteString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v18, *MEMORY[0x1E0DB19E8]);

      }
      -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v13, CFSTR("mediaShareMetadata"));
      -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v15, CFSTR("showMediaShareMetadata"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[VUIStoreAuxMediaItem resetReportingEventCollection](v11, "resetReportingEventCollection");
    }
    else
    {
      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sidebandMediaLibrary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v5;
      v22 = v20;
      objc_msgSend(v20, "videoForAdamID:useMainThreadContext:", v21, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v11 = 0;
LABEL_27:
        v5 = v140;
        goto LABEL_28;
      }
      v23 = objc_msgSend(v13, "downloadState");
      v5 = v140;
      if (v23 != 2)
      {
        if (v23 || (objc_msgSend(v13, "markedAsDeleted") & 1) != 0)
        {
          v11 = 0;
          goto LABEL_28;
        }
        objc_msgSend(v13, "expirationDate");
        v11 = (VUIStoreAuxMediaItem *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
LABEL_28:

          if (v11)
            goto LABEL_51;
          goto LABEL_29;
        }
      }
      v24 = (void *)objc_opt_class();
      objc_msgSend(v13, "adamID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "canonicalID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_playbackOverridesForURL:adamID:canonicalID:", 0, v25, v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = -[VUIStoreAuxMediaItem initWithVideoManagedObject:isForStartingDownload:]([VUIStoreAuxMediaItem alloc], "initWithVideoManagedObject:isForStartingDownload:", v13, 0);
      objc_msgSend(v4, "playbackURL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaInfo _hlsURLUpdatedWithBingeWatchingParamFromURL:](self, "_hlsURLUpdatedWithBingeWatchingParamFromURL:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIStoreAuxMediaItem setStreamingOverrideURLForDownload:](v11, "setStreamingOverrideURLForDownload:", v28);

      objc_msgSend(v4, "metadata");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "mediaShareMetadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "metadata");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "showMediaShareMetadata");
      v31 = objc_claimAutoreleasedReturnValue();

      v32 = (void *)v31;
      -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v17, CFSTR("mediaShareMetadata"));
      -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v31, CFSTR("showMediaShareMetadata"));
      objc_msgSend(v4, "playablePassThrough");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v33, "length"))
        -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v33, CFSTR("VUIMediaItemMetadataPlayablePassThrough"));
      v138 = v33;
      objc_msgSend(v4, "artworkURL");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v34)
      {
        objc_msgSend(v34, "absoluteString");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v36, *MEMORY[0x1E0DB19E8]);

      }
      VUIDefaultLogObject();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v37, OS_LOG_TYPE_DEFAULT, "Creating new media item for playable from library since it is not being downloaded currently", buf, 2u);
      }

      self = v142;
      -[VUIMediaInfo _populateMediaItem:withMetadataOverrides:](v142, "_populateMediaItem:withMetadataOverrides:", v11, v15);

    }
    goto LABEL_27;
  }

LABEL_29:
  objc_msgSend(v4, "playbackURL");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hlsProgramID");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "externalID");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "channelID");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "channelName");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "ratingValue");
  v131 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "metadata");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "ratingName");
  v130 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "metadata");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "ratingAuxiliaryName");
  v129 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "mediaType");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v42, "isEqualToString:", CFSTR("LiveService"));
  v99 = v42;
  v95 = objc_msgSend(v42, "isEqualToString:", CFSTR("SportingEvent"));
  -[VUIMediaInfo _tvpMediaTypeFromPlayable:](self, "_tvpMediaTypeFromPlayable:", v4);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrubVideoURL");
  v101 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fpsCertificateURL");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fpsKeyServerURL");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fpsAdditionalServerParams");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v4, "sendMescalHeaderToPlaybackKeyServer");
  v44 = objc_msgSend(v4, "sendLocationToPlaybackKeyServerWhenOptedIn");
  objc_msgSend(v4, "bookmarkID");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v4, "isFamilySharingContent");
  objc_msgSend(v4, "metadata");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "videoResolutionClass");
  v124 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "metadata");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "videoDynamicRange");
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "metadata");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "hasADLocales");
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "metadata");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "hasSDHLocales");
  v121 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "referenceID");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rtcServiceIdentifier");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vpafMetrics");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = objc_msgSend(v4, "reportVPAFWhenPlayingInBackground");
  objc_msgSend(v4, "mediaMetrics");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v49, "isAdultContent");

  objc_msgSend(v4, "metadata");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "commonSenseRecommendedAge");
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "metadata");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "hasDolbyAtmos");
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = objc_msgSend(v4, "disableScrubbing");
  objc_msgSend(v4, "liveStreamServiceID");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "externalServiceID");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "seasonNumber");
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "metadata");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "episodeNumber");
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "metadata");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "episodeIndexInSeries");
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "tvAppDeeplinkURL");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buyParams");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "upsellRouterDataSource");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "upsellOnExitPolicy");
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "rentalID");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_playbackOverridesForURL:adamID:canonicalID:", v38, v5, v141);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "objectForKey:", CFSTR("replacementPlaybackURL"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v4, "playsFromStartOfLiveStream");
  objc_msgSend(v4, "metadata");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "mediaShareMetadata");
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "metadata");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "showMediaShareMetadata");
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "utsEntityType");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v58, "length"))
  {
    VUIDefaultLogObject();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v144 = v38;
      v145 = 2112;
      v146 = v58;
      _os_log_impl(&dword_1D96EE000, v61, OS_LOG_TYPE_DEFAULT, "Overriding original playback URL %@ with replacement playback URL %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v58);
    v62 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v4, "isiTunesPurchaseOrRental"))
    {
      -[VUIMediaInfo _hlsURLEnsuringDsidQueryParamIsPresentFromURL:](v142, "_hlsURLEnsuringDsidQueryParamIsPresentFromURL:", v38);
      v63 = objc_claimAutoreleasedReturnValue();

      v38 = (void *)v63;
    }
    -[VUIMediaInfo _hlsURLUpdatedWithBingeWatchingParamFromURL:](v142, "_hlsURLUpdatedWithBingeWatchingParamFromURL:", v38);
    v62 = objc_claimAutoreleasedReturnValue();
  }
  v64 = (void *)v62;

  v98 = v64;
  v11 = -[VUIStoreAuxMediaItem initWithURL:]([VUIStoreAuxMediaItem alloc], "initWithURL:", v64);
  -[VUIStoreAuxMediaItem setFpsCertificateURL:](v11, "setFpsCertificateURL:", v128);
  -[VUIStoreAuxMediaItem setFpsKeyServerURL:](v11, "setFpsKeyServerURL:", v127);
  -[VUIStoreAuxMediaItem setFpsAdditionalServerParams:](v11, "setFpsAdditionalServerParams:", v126);
  -[VUIStoreAuxMediaItem setSendsMescalHeaderToPlaybackKeyServer:](v11, "setSendsMescalHeaderToPlaybackKeyServer:", v43);
  -[VUIStoreAuxMediaItem setSendsLocationToPlaybackKeyServerWhenOptedIn:](v11, "setSendsLocationToPlaybackKeyServerWhenOptedIn:", v44);
  -[VUIStoreAuxMediaItem setBookmarkID:](v11, "setBookmarkID:", v125);
  -[VUIStoreAuxMediaItem setDisableResumeMenu:](v11, "setDisableResumeMenu:", 1);
  -[VUIStoreAuxMediaItem setIsiTunesPurchasedOrRentedContent:](v11, "setIsiTunesPurchasedOrRentedContent:", objc_msgSend(v4, "isiTunesPurchaseOrRental"));
  -[VUIStoreAuxMediaItem setDisableScrubbing:](v11, "setDisableScrubbing:", v52);
  -[VUIStoreAuxMediaItem setIsFamilySharingContent:](v11, "setIsFamilySharingContent:", v92);
  -[VUIStoreAuxMediaItem setIsLiveContent:](v11, "setIsLiveContent:", v96);
  -[VUIStoreAuxMediaItem setIsSportingEvent:](v11, "setIsSportingEvent:", v95);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v140, *MEMORY[0x1E0DB1CB8]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v135, *MEMORY[0x1E0DB1B08]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v134, *MEMORY[0x1E0DB1AB0]);
  v65 = *MEMORY[0x1E0DB1C50];
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v119, *MEMORY[0x1E0DB1C50]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v123, *MEMORY[0x1E0DB1CF0]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v124, *MEMORY[0x1E0DB1CF8]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v122, *MEMORY[0x1E0DB1B18]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v121, *MEMORY[0x1E0DB1B28]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v139, *MEMORY[0x1E0DB1B90]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v133, *MEMORY[0x1E0DB19F0]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v132, *MEMORY[0x1E0DB19F8]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v141, *MEMORY[0x1E0DB1A08]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v120, *MEMORY[0x1E0DB1BE8]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v118, *MEMORY[0x1E0DB1CE8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v94);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v66, CFSTR("reportVPAFWhenPlayingInBackground"));

  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v117, *MEMORY[0x1E0DB1B88]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v113, *MEMORY[0x1E0DB1AC0]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v114, *MEMORY[0x1E0DB1B60]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v97);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v67, *MEMORY[0x1E0DB1B48]);

  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v116, *MEMORY[0x1E0DB1A18]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v115, *MEMORY[0x1E0DB1B20]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v137, *MEMORY[0x1E0DB1C10]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v136, *MEMORY[0x1E0DB1AF0]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v112, *MEMORY[0x1E0DB1C40]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v111, *MEMORY[0x1E0DB1A98]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v110, *MEMORY[0x1E0DB1A90]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v131, *MEMORY[0x1E0DB1A40]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v130, *MEMORY[0x1E0DB1A20]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v129, CFSTR("VUIContentMetadataRatingAuxiliaryDisplayName"));
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v109, *MEMORY[0x1E0DB1B58]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v108, *MEMORY[0x1E0DB1A00]);
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v107, CFSTR("VUIContentMetadataPlaybackExitUpsellRouterDataSource"));
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v106, CFSTR("VUIContentMetadataPlaybackExitUpsellPolicy"));
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v105, CFSTR("VUIContentMetadataBroadcastLocale"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v93);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v68, CFSTR("VUIContentMetadataPlaysFromStartOfLiveStream"));

  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v104, CFSTR("mediaShareMetadata"));
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v103, CFSTR("showMediaShareMetadata"));
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v102, CFSTR("utsEntityType"));
  self = v142;
  v69 = v100;
  if (objc_msgSend(v4, "isAmbientVideo"))
  {
    -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", MEMORY[0x1E0C9AAB0], CFSTR("VUIContentMetadataIsAmbientVideo"));
    objc_msgSend(v4, "repeatLoopCount");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (v70)
      -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v70, CFSTR("VUIContentMetadataRepeatLoopCount"));

  }
  if (v100 && (objc_msgSend(v100, "isEqual:", &unk_1EA0B9D18) & 1) == 0)
    -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v100, *MEMORY[0x1E0DB1BF8]);
  objc_msgSend(v4, "metadata");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "ratingDomain");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIMediaInfo _tvpRatingDomainFromUTSRatingDomain:](v142, "_tvpRatingDomainFromUTSRatingDomain:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v73, *MEMORY[0x1E0DB1A28]);

  if (objc_msgSend(v139, "isEqualToString:", *MEMORY[0x1E0DB1DD8]))
  {
    objc_msgSend(v4, "showCanonicalID");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "seasonCanonicalID");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v74, *MEMORY[0x1E0DB1C60]);
    -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v75, *MEMORY[0x1E0DB1C38]);

    self = v142;
  }
  if (objc_msgSend(v4, "isFamilySharingContent"))
  {
    objc_msgSend(v4, "extrasInfo");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "extrasURLString");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "length");

    self = v142;
    if (v78)
    {
      v79 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v4, "extrasInfo");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "extrasURLString");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "URLWithString:", v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      self = v142;
      -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v82, *MEMORY[0x1E0DB1AC8]);

    }
  }
  -[VUIMediaInfo _populateMediaItem:withMetadataFromVideosPlayable:](self, "_populateMediaItem:withMetadataFromVideosPlayable:", v11, v4);
  v83 = (void *)v101;
  if (v101)
  {
    v84 = -[VUIStoreAuxMediaItem initWithURL:]([VUIStoreAuxMediaItem alloc], "initWithURL:", v101);
    v85 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "bundleIdentifier");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "stringWithFormat:", CFSTR("%@.IFrameScrubVideo"), v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v84, "setMediaItemMetadata:forProperty:", v88, v65);

    v69 = v100;
    self = v142;
    -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v84, *MEMORY[0x1E0DB1C28]);

    v83 = (void *)v101;
  }
  -[VUIMediaInfo _populateMediaItem:withMetadataOverrides:](self, "_populateMediaItem:withMetadataOverrides:", v11, v57);
  -[VUIStoreAuxMediaItem setPlaybackContext:](v11, "setPlaybackContext:", -[VUIMediaInfo playbackContext](self, "playbackContext"));

  v5 = v140;
LABEL_51:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[VUIMediaInfo _populateMediaItem:withResumeTimeInfoFromPlayable:](self, "_populateMediaItem:withResumeTimeInfoFromPlayable:", v11, v4);
  objc_msgSend(v4, "sharedWatchId");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v89, *MEMORY[0x1E0DB1BB8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "playableType"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreAuxMediaItem setMediaItemMetadata:forProperty:](v11, "setMediaItemMetadata:forProperty:", v90, CFSTR("VUIContentMetadataPlayableType"));

  return v11;
}

+ (id)_playbackOverridesForURL:(id)a3 adamID:(id)a4 canonicalID:(id)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v30 = a4;
  v29 = a5;
  objc_msgSend(MEMORY[0x1E0DC69C0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "enableDemoMode");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", CFSTR("/var/mobile/Media/ManagedPurchases/TVApp/PlaybackOverrides.plist"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v10, 0, 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v11, "objectForKey:", CFSTR("overrides"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC69C0], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "playbackOverridesEnabled");

    if (!v14)
    {
LABEL_30:
      v16 = 0;
      v19 = 0;
      goto LABEL_33;
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayForKey:", *MEMORY[0x1E0DC6B38]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!v12)
    goto LABEL_30;
  v28 = v7;
  objc_msgSend(v7, "absoluteString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v16 = v12;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v22, "objectForKey:", CFSTR("playbackURLToOverride"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKey:", CFSTR("adamIDToOverride"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKey:", CFSTR("canonicalIDToOverride"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "length")
          && objc_msgSend(v23, "length")
          && (objc_msgSend(v23, "isEqualToString:", v15) & 1) != 0
          || objc_msgSend(v30, "length")
          && objc_msgSend(v24, "length")
          && (objc_msgSend(v24, "isEqualToString:", v30) & 1) != 0
          || objc_msgSend(v29, "length")
          && objc_msgSend(v25, "length")
          && objc_msgSend(v25, "isEqualToString:", v29))
        {
          v26 = v22;

          v19 = v26;
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }

  v7 = v28;
LABEL_33:

  return v19;
}

- (id)_tvpRatingDomainFromUTSRatingDomain:(id)a3
{
  id v3;
  id *v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Movie")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0DB1A30];
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Show")))
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = (id *)MEMORY[0x1E0DB1A38];
  }
  v5 = *v4;
LABEL_7:

  return v5;
}

- (id)_tvpMediaTypeFromPlayable:(id)a3
{
  id v3;
  void *v4;
  id *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "mediaType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Movie")))
  {
    if (objc_msgSend(v3, "isRental"))
      v5 = (id *)MEMORY[0x1E0DB1DD0];
    else
      v5 = (id *)MEMORY[0x1E0DB1DC0];
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Trailer")))
  {
    v5 = (id *)MEMORY[0x1E0DB1DC8];
LABEL_7:
    v6 = *v5;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Show"), CFSTR("Season"), CFSTR("Episode"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (objc_msgSend(v7, "containsObject:", v4))
    v6 = (id)*MEMORY[0x1E0DB1DD8];

LABEL_11:
  return v6;
}

- (void)_populateMediaItem:(id)a3 withResumeTimeInfoFromPlayable:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "startTimeInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        objc_msgSend(v5, "startTimeCollection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addStartTimeInfo:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)_populateMediaItem:(id)a3 withMetadataOverrides:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  VUIMediaStartTimeInfo *v35;
  void *v36;
  VUIMediaStartTimeInfo *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id obj;
  _QWORD v46[4];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("skipIntroStart"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("skipIntroDuration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("skipIntroTarget"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v8 && v9 && v10)
    {
      VUIDefaultLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v55 = v8;
        v56 = 2112;
        v57 = v9;
        v58 = 2112;
        v59 = v11;
        _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Overriding skip intro with start %@ duration %@ target %@", buf, 0x20u);
      }

      v13 = objc_alloc(MEMORY[0x1E0DB1940]);
      objc_msgSend(v8, "doubleValue");
      v15 = v14;
      objc_msgSend(v9, "doubleValue");
      v17 = v16;
      objc_msgSend(v11, "doubleValue");
      v19 = objc_msgSend(v13, "initWithType:start:duration:target:localizedTitle:skipIntroReportingType:", 1, 0, 0, v15, v17, v18);
      v20 = (void *)v19;
      if (v19)
      {
        v53 = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setMediaItemMetadata:forProperty:", v21, *MEMORY[0x1E0DB1C68]);

      }
    }
    v40 = v11;
    v41 = v9;
    v42 = v8;
    v43 = v7;
    v44 = v5;
    objc_msgSend(v7, "objectForKey:", CFSTR("ratingAdvisoryInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v22;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v49 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_msgSend(v28, "objectForKey:", CFSTR("name"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKey:", CFSTR("description"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v30, "length"))
          {
            VUIDefaultLogObject();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v55 = v29;
              v56 = 2112;
              v57 = v30;
              _os_log_impl(&dword_1D96EE000, v31, OS_LOG_TYPE_DEFAULT, "Overriding advisory info with name %@ description %@ ", buf, 0x16u);
            }

            v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB1938]), "initWithRatingDescription:", v30);
            if (objc_msgSend(v29, "length"))
              objc_msgSend(v32, "setRatingName:", v29);
            if (v32)
              objc_msgSend(v23, "addObject:", v32);

          }
        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v25);
    }

    v5 = v44;
    if (objc_msgSend(v23, "count"))
      objc_msgSend(v44, "setMediaItemMetadata:forProperty:", v23, *MEMORY[0x1E0DB19C8]);
    v7 = v43;
    objc_msgSend(v43, "objectForKey:", CFSTR("resumeTime"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        VUIDefaultLogObject();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v55 = v33;
          _os_log_impl(&dword_1D96EE000, v34, OS_LOG_TYPE_DEFAULT, "Overriding original resume time with %@", buf, 0xCu);
        }

        v35 = [VUIMediaStartTimeInfo alloc];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = -[VUIMediaStartTimeInfo initWithStartTime:timestamp:type:source:](v35, "initWithStartTime:timestamp:type:source:", v33, v36, 0, CFSTR("Demo override plist"));

        objc_msgSend(v44, "startTimeCollection");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addStartTimeInfo:", v37);

      }
    }
    objc_msgSend(v43, "objectForKey:", CFSTR("TVPMediaItemMetadata"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __57__VUIMediaInfo__populateMediaItem_withMetadataOverrides___block_invoke;
    v46[3] = &unk_1E9FA15B8;
    v47 = v44;
    objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v46);

  }
}

- (id)_hlsURLUpdatedWithBingeWatchingParamFromURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "pathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("m3u8")) & 1) != 0)
    {
      v7 = -[VUIMediaInfo playbackContext](self, "playbackContext");

      v8 = v5;
      if (v7 == 6)
      {
        objc_msgSend(v5, "vui_URLByAddingQueryParamWithName:value:", CFSTR("bingeWatching"), CFSTR("true"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v8 = v5;
        if (v9)
        {
          v8 = v9;

          VUIDefaultLogObject();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v13 = 138412290;
            v14 = v8;
            _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "HLS URL after adding bingeWatching param: %@", (uint8_t *)&v13, 0xCu);
          }

        }
      }
    }
    else
    {

      v8 = v5;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaLayerAccessibilityText, 0);
  objc_storeStrong((id *)&self->_alphaImageProxy, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_videosPlayables, 0);
  objc_storeStrong((id *)&self->_tvpPlaylist, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_imageThemes, 0);
  objc_storeStrong((id *)&self->_imageProxies, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (double)primaryVideoAspectRatio
{
  return self->_primaryVideoAspectRatio;
}

- (unint64_t)playbackStopReason
{
  return self->_playbackStopReason;
}

- (unint64_t)playbackStartReason
{
  return self->_playbackStartReason;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  VUIMediaInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
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

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6 != self)
  {
    -[VUIMediaInfo imageProxies](self, "imageProxies");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaInfo imageProxies](v6, "imageProxies");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isEqual:", v8))
    {
      v15 = 0;
LABEL_24:

      goto LABEL_25;
    }
    -[VUIMediaInfo tvpPlaylist](self, "tvpPlaylist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaInfo tvpPlaylist](v6, "tvpPlaylist");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqualToPlaylist:", v10)
      || (v11 = -[VUIMediaInfo intent](self, "intent"), v11 != -[VUIMediaInfo intent](v6, "intent")))
    {
      v15 = 0;
LABEL_23:

      goto LABEL_24;
    }
    -[VUIMediaInfo playlist](self, "playlist");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaInfo playlist](v6, "playlist");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 != v13)
    {
      -[VUIMediaInfo playlist](self, "playlist");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaInfo playlist](v6, "playlist");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v14, "isEqual:"))
      {
        v15 = 0;
        goto LABEL_21;
      }
      v33 = v14;
    }
    -[VUIMediaInfo overlayView](self, "overlayView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaInfo overlayView](v6, "overlayView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 != v17)
    {

LABEL_19:
      v15 = 0;
      goto LABEL_20;
    }
    v32 = v16;
    -[VUIMediaInfo contentView](self, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaInfo contentView](v6, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 != v19)
    {

      goto LABEL_19;
    }
    v29 = v18;
    -[VUIMediaInfo imageProxies](self, "imageProxies");
    v21 = objc_claimAutoreleasedReturnValue();
    -[VUIMediaInfo imageProxies](v6, "imageProxies");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)v21;
    if ((void *)v21 == v30)
      goto LABEL_30;
    -[VUIMediaInfo imageProxies](v6, "imageProxies");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v15 = 0;
      goto LABEL_33;
    }
    v28 = (void *)v22;
    -[VUIMediaInfo imageProxies](self, "imageProxies");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaInfo imageProxies](v6, "imageProxies");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v23;
    if (objc_msgSend(v23, "isEqualToArray:", v26))
    {
LABEL_30:
      -[VUIMediaInfo backgroundColor](self, "backgroundColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaInfo backgroundColor](v6, "backgroundColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v24 == v25;

      if (v31 == v30)
      {
LABEL_33:

LABEL_20:
        v14 = v33;
        if (v12 == v13)
        {
LABEL_22:

          goto LABEL_23;
        }
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
      v15 = 0;
    }

    goto LABEL_33;
  }
  v15 = 1;
LABEL_25:

  return v15;
}

+ (id)playbackURLOverrideForOriginalURL:(id)a3 adamID:(id)a4 canonicalID:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a1, "_playbackOverridesForURL:adamID:canonicalID:", v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("replacementPlaybackURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Overriding original playback URL %@ with replacement playback URL %@", (uint8_t *)&v14, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (VUIMediaInfo)initWithPlaybackContext:(unint64_t)a3 storeAuxMediaItem:(id)a4
{
  id v6;
  VUIMediaInfo *v7;
  VUIMediaInfo *v8;
  uint64_t v9;
  NSArray *videosPlayables;
  VUIStoreAuxMediaItem *v11;
  void *v12;
  VUIStoreAuxMediaItem *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)VUIMediaInfo;
  v7 = -[VUIMediaInfo init](&v19, sel_init);
  v8 = v7;
  if (v7)
  {
    *(_DWORD *)&v7->_automaticPlaybackStart = 0;
    v7->_allowsPictureInPicture = 1;
    v7->_playbackStartReason = 0;
    v7->_playbackStopReason = 0;
    v7->_playbackContext = a3;
    v7->_playbackDelayInterval = 5.0;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    videosPlayables = v8->_videosPlayables;
    v8->_videosPlayables = (NSArray *)v9;

    if (v6)
    {
      v11 = [VUIStoreAuxMediaItem alloc];
      objc_msgSend(v6, "mediaItemURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[VUIStoreAuxMediaItem initWithURL:](v11, "initWithURL:", v12);

      -[VUIMediaInfo _populateMediaItem:withOtherMediaItem:](v8, "_populateMediaItem:withOtherMediaItem:", v13, v6);
      v14 = objc_alloc(MEMORY[0x1E0DB1970]);
      v20[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithMediaItems:index:isCollection:", v15, 0, 0);
      -[VUIMediaInfo setTvpPlaylist:](v8, "setTvpPlaylist:", v16);

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaInfo setUserPlaybackInitiationDate:openURLCompletionDate:](v8, "setUserPlaybackInitiationDate:openURLCompletionDate:", v17, 0);

      -[VUIMediaInfo _updatePlaybackStartReason](v8, "_updatePlaybackStartReason");
      -[VUIMediaInfo _updatePlaybackStopReason](v8, "_updatePlaybackStopReason");

    }
  }

  return v8;
}

- (VUIMediaInfo)initWithPlaybackContext:(unint64_t)a3 sidebandLibraryAdamIDs:(id)a4
{
  id v6;
  VUIMediaInfo *v7;
  VUIMediaInfo *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = -[VUIMediaInfo initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:](self, "initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:", a3, 0, 0, 0);
  v8 = v7;
  if (v7)
  {
    -[VUIMediaInfo _playlistForSidebandLibraryAdamIDs:](v7, "_playlistForSidebandLibraryAdamIDs:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[VUIMediaInfo setTvpPlaylist:](v8, "setTvpPlaylist:", v9);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaInfo setUserPlaybackInitiationDate:openURLCompletionDate:](v8, "setUserPlaybackInitiationDate:openURLCompletionDate:", v10, 0);

      -[VUIMediaInfo _updatePlaybackStartReason](v8, "_updatePlaybackStartReason");
    }

  }
  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[VUIMediaInfo overlayView](self, "overlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[VUIMediaInfo imageProxies](self, "imageProxies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[VUIMediaInfo tvpPlaylist](self, "tvpPlaylist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VUIMediaInfo intent](self, "intent");
  -[VUIMediaInfo overlayView](self, "overlayView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaInfo contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaInfo backgroundColor](self, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaInfo playlist](self, "playlist");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaInfo imageProxies](self, "imageProxies");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> Intent = %lu, overlayView = %@, contentView = %@, backgroundColor = %@, playlist = %@, imageProxies = %@, , playbackContext = %ld"), v5, self, v6, v7, v8, v9, v10, v11, -[VUIMediaInfo playbackContext](self, "playbackContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_storeMediaItemFromVideosPlayable:(id)a3 andStoreDictionary:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  VUIStoreMediaItem_iOS *v12;
  VUIStoreMediaItem_iOS *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
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
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  unsigned int v61;
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
  NSObject *v84;
  uint8_t buf[4];
  VUIStoreMediaItem_iOS *v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "adamID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "longLongValue");
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v5, "canonicalID");
      v84 = objc_claimAutoreleasedReturnValue();
      VUIDefaultLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Support for in-app downloads is enabled.  Looking for downloading or downloaded content to play", buf, 2u);
      }

      +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "existingDownloadForAdamID:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v11, "mediaItem");
        v12 = (VUIStoreMediaItem_iOS *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v12;
          -[VUIStoreMediaItem_iOS resetReportingEventCollection](v13, "resetReportingEventCollection");
        }
        else
        {
          v13 = 0;
        }
        VUIDefaultLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v87 = v13;
          _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "Using existing media item being downloaded: %@", buf, 0xCu);
        }

      }
      else
      {
        +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sidebandMediaLibrary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "videoForAdamID:useMainThreadContext:", v6, 1);
        v12 = (VUIStoreMediaItem_iOS *)objc_claimAutoreleasedReturnValue();

        if (v12 && -[VUIStoreMediaItem_iOS downloadState](v12, "downloadState") == 2)
        {
          VUIDefaultLogObject();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v87 = v12;
            _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "Item is downloaded.  Using videoManagedObject when creating media item: %@", buf, 0xCu);
          }

          v13 = -[VUIStoreMediaItem_iOS initWithAdamID:videoManagedObject:isForStartingDownload:]([VUIStoreMediaItem_iOS alloc], "initWithAdamID:videoManagedObject:isForStartingDownload:", v8, v12, 0);
        }
        else
        {
          v13 = 0;
        }
      }

      if (!v13)
      {
        v66 = v11;
        v13 = -[VUIStoreMediaItem_iOS initWithAdamID:videoManagedObject:isForStartingDownload:]([VUIStoreMediaItem_iOS alloc], "initWithAdamID:videoManagedObject:isForStartingDownload:", v8, 0, 0);
        objc_msgSend(v5, "hlsURL");
        v18 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "buyParams");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fpsCertificateURL");
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fpsKeyServerURL");
        v20 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fpsAdditionalServerParams");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "rentalID");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "metadata");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "rentalStartedWatchingTimestamp");
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "referenceID");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "showCanonicalID");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "seasonCanonicalID");
        v58 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "vpafMetrics");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "metadata");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v22, "isAdultContent");

        objc_msgSend(v5, "metadata");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "commonSenseRecommendedAge");
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "metadata");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "hasADLocales");
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "metadata");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "hasSDHLocales");
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "metadata");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "hasDolbyAtmos");
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "requiredAgeForPlayback");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "frequencyOfAgeConfirmation");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "mediaMetrics");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "tvAppDeeplinkURL");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "metadata");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "showTitle");
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "metadata");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "seasonNumber");
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "metadata");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "episodeNumber");
        v30 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "metadata");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "videoResolutionClass");
        v57 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "metadata");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "mediaShareMetadata");
        v33 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "metadata");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "showMediaShareMetadata");
        v35 = objc_claimAutoreleasedReturnValue();

        v64 = (void *)v18;
        v36 = v18;
        v37 = v67;
        -[VUIStoreMediaItem_iOS setHlsPlaybackURL:](v13, "setHlsPlaybackURL:", v36);
        v65 = (void *)v19;
        -[VUIStoreMediaItem_iOS setFpsCertificateURL:](v13, "setFpsCertificateURL:", v19);
        v63 = (void *)v20;
        -[VUIStoreMediaItem_iOS setFpsKeyServerURL:](v13, "setFpsKeyServerURL:", v20);
        -[VUIStoreMediaItem_iOS setFpsAdditionalServerParams:](v13, "setFpsAdditionalServerParams:", v76);
        -[VUIStoreMediaItem_iOS setIsBingeWatched:](v13, "setIsBingeWatched:", -[VUIMediaInfo playbackContext](self, "playbackContext") == 6);
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v6, *MEMORY[0x1E0DB1CB8]);
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v82, *MEMORY[0x1E0DB1A00]);
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v84, *MEMORY[0x1E0DB1A08]);
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v81, *MEMORY[0x1E0DB1BE8]);
        v38 = (void *)v58;
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v80, *MEMORY[0x1E0DB1C60]);
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v58, *MEMORY[0x1E0DB1C38]);
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v79, *MEMORY[0x1E0DB1CE8]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v61);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v39, *MEMORY[0x1E0DB1B48]);

        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v78, *MEMORY[0x1E0DB1A18]);
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v75, *MEMORY[0x1E0DB1B28]);
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v77, *MEMORY[0x1E0DB1B18]);
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v68, *MEMORY[0x1E0DB1B20]);
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v74, *MEMORY[0x1E0DB1C10]);
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v73, *MEMORY[0x1E0DB1AF0]);
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v72, *MEMORY[0x1E0DB1B88]);
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v71, *MEMORY[0x1E0DB1B58]);
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v70, *MEMORY[0x1E0DB1C48]);
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v69, *MEMORY[0x1E0DB1C40]);
        v62 = (void *)v30;
        v40 = v30;
        v41 = (void *)v57;
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v40, *MEMORY[0x1E0DB1A98]);
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v57, *MEMORY[0x1E0DB1CF8]);
        v60 = (void *)v33;
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v33, CFSTR("mediaShareMetadata"));
        v59 = (void *)v35;
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v35, CFSTR("showMediaShareMetadata"));
        if (v67 && (objc_msgSend(v67, "isEqual:", &unk_1EA0B9D18) & 1) == 0)
          -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v67, *MEMORY[0x1E0DB1BF8]);
        if (v83)
        {
          v42 = objc_alloc_init(MEMORY[0x1E0CB3578]);
          objc_msgSend(v42, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"));
          objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setTimeZone:", v43);

          objc_msgSend(v42, "dateFromString:", v83);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44)
            -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v44, *MEMORY[0x1E0DB1C08]);

        }
        v45 = *MEMORY[0x1E0DB1A40];
        -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](v13, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A40], v57);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v46)
        {
          objc_msgSend(v5, "metadata");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "ratingValue");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v48, v45);
        }
        objc_msgSend(v5, "metadata");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "ratingDomain");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        -[VUIMediaInfo _tvpRatingDomainFromUTSRatingDomain:](self, "_tvpRatingDomainFromUTSRatingDomain:", v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v51, *MEMORY[0x1E0DB1A28]);

        v52 = *MEMORY[0x1E0DB1B90];
        -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](v13, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v53, "length"))
        {
          -[VUIMediaInfo _tvpMediaTypeFromPlayable:](self, "_tvpMediaTypeFromPlayable:", v5);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v54, v52);

          v38 = (void *)v58;
          v37 = v67;
        }
        -[VUIMediaInfo _populateMediaItem:withMetadataFromVideosPlayable:](self, "_populateMediaItem:withMetadataFromVideosPlayable:", v13, v5);

        v11 = v66;
      }

    }
    else
    {
      VUIDefaultLogObject();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        -[VUIMediaInfo _storeMediaItemFromVideosPlayable:andStoreDictionary:].cold.1(v84);
      v13 = 0;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[VUIMediaInfo _populateMediaItem:withResumeTimeInfoFromPlayable:](self, "_populateMediaItem:withResumeTimeInfoFromPlayable:", v13, v5);
    objc_msgSend(v5, "sharedWatchId");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v55, *MEMORY[0x1E0DB1BB8]);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_populateMediaItem:(id)a3 withOtherMediaItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
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
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  id v128;

  v128 = a3;
  v5 = a4;
  objc_msgSend(v5, "fpsCertificateURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setFpsCertificateURL:", v6);

  objc_msgSend(v5, "fpsKeyServerURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setFpsKeyServerURL:", v7);

  objc_msgSend(v5, "fpsAdditionalServerParams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setFpsAdditionalServerParams:", v8);

  objc_msgSend(v128, "setSendsMescalHeaderToPlaybackKeyServer:", objc_msgSend(v5, "sendsMescalHeaderToPlaybackKeyServer"));
  objc_msgSend(v128, "setSendsLocationToPlaybackKeyServerWhenOptedIn:", objc_msgSend(v5, "sendsLocationToPlaybackKeyServerWhenOptedIn"));
  objc_msgSend(v5, "bookmarkID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setBookmarkID:", v9);

  objc_msgSend(v128, "setDisableResumeMenu:", 1);
  objc_msgSend(v128, "setIsiTunesPurchasedOrRentedContent:", objc_msgSend(v5, "isiTunesPurchasedOrRentedContent"));
  objc_msgSend(v128, "setDisableScrubbing:", objc_msgSend(v5, "disableScrubbing"));
  objc_msgSend(v128, "setIsFamilySharingContent:", objc_msgSend(v5, "isFamilySharingContent"));
  objc_msgSend(v128, "setIsLiveContent:", objc_msgSend(v5, "isLiveContent"));
  objc_msgSend(v128, "setIsSportingEvent:", objc_msgSend(v5, "isSportingEvent"));
  v10 = *MEMORY[0x1E0DB1CB8];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v11, v10);

  v12 = *MEMORY[0x1E0DB1AB0];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AB0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v13, v12);

  v14 = *MEMORY[0x1E0DB1C50];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C50]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v15, v14);

  v16 = *MEMORY[0x1E0DB1CF0];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CF0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v17, v16);

  v18 = *MEMORY[0x1E0DB1CF8];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CF8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v19, v18);

  v20 = *MEMORY[0x1E0DB1B18];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B18]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v21, v20);

  v22 = *MEMORY[0x1E0DB1B28];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B28]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v23, v22);

  v24 = *MEMORY[0x1E0DB1B90];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v25, v24);

  v26 = *MEMORY[0x1E0DB19F0];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19F0]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v27, v26);

  v28 = *MEMORY[0x1E0DB19F8];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19F8]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v29, v28);

  v30 = *MEMORY[0x1E0DB1A08];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v31, v30);

  v32 = *MEMORY[0x1E0DB1BE8];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BE8]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v33, v32);

  v34 = *MEMORY[0x1E0DB1CE8];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CE8]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v35, v34);

  v36 = *MEMORY[0x1E0DB1B88];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B88]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v37, v36);

  v38 = *MEMORY[0x1E0DB1AC0];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AC0]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v39, v38);

  v40 = *MEMORY[0x1E0DB1B60];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B60]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v41, v40);

  v42 = *MEMORY[0x1E0DB1B48];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B48]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v43, v42);

  v44 = *MEMORY[0x1E0DB1A18];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A18]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v45, v44);

  v46 = *MEMORY[0x1E0DB1B20];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B20]);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v47, v46);

  v48 = *MEMORY[0x1E0DB1C10];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C10]);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v49, v48);

  v50 = *MEMORY[0x1E0DB1AF0];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AF0]);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v51, v50);

  v52 = *MEMORY[0x1E0DB1C40];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C40]);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v53, v52);

  v54 = *MEMORY[0x1E0DB1A98];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A98]);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v55, v54);

  v56 = *MEMORY[0x1E0DB1A90];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A90]);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v57, v56);

  v58 = *MEMORY[0x1E0DB1A40];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A40]);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v59, v58);

  v60 = *MEMORY[0x1E0DB1A20];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A20]);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v61, v60);

  objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataRatingAuxiliaryDisplayName"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v62, CFSTR("VUIContentMetadataRatingAuxiliaryDisplayName"));

  v63 = *MEMORY[0x1E0DB1B58];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B58]);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v64, v63);

  v65 = *MEMORY[0x1E0DB1A00];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A00]);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v66, v65);

  objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataPlaybackExitUpsellRouterDataSource"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v67, CFSTR("VUIContentMetadataPlaybackExitUpsellRouterDataSource"));

  objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataPlaybackExitUpsellPolicy"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v68, CFSTR("VUIContentMetadataPlaybackExitUpsellPolicy"));

  objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataBroadcastLocale"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v69, CFSTR("VUIContentMetadataBroadcastLocale"));

  objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataPlaysFromStartOfLiveStream"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v70, CFSTR("VUIContentMetadataPlaysFromStartOfLiveStream"));

  objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("mediaShareMetadata"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v71, CFSTR("mediaShareMetadata"));

  objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("showMediaShareMetadata"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v72, CFSTR("showMediaShareMetadata"));

  objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataIsAmbientVideo"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v73, CFSTR("VUIContentMetadataIsAmbientVideo"));

  objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataRepeatLoopCount"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v74, CFSTR("VUIContentMetadataRepeatLoopCount"));

  v75 = *MEMORY[0x1E0DB1BF8];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BF8]);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v76, v75);

  v77 = *MEMORY[0x1E0DB1A28];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A28]);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v78, v77);

  objc_msgSend(v128, "mediaItemMetadataForProperty:", v24);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v77) = objc_msgSend(v79, "isEqualToString:", *MEMORY[0x1E0DB1DD8]);

  if ((_DWORD)v77)
  {
    v80 = *MEMORY[0x1E0DB1C60];
    objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C60]);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v81, v80);

    v82 = *MEMORY[0x1E0DB1C38];
    objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C38]);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v83, v82);

  }
  v84 = *MEMORY[0x1E0DB1AC8];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AC8]);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v85, v84);

  v86 = *MEMORY[0x1E0DB1CC8];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CC8]);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v87, v86);

  v88 = *MEMORY[0x1E0DB1B70];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B70]);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v89, v88);

  v90 = *MEMORY[0x1E0DB19E8];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19E8]);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v91, v90);

  v92 = *MEMORY[0x1E0DB1BD8];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BD8]);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v93, v92);

  v94 = *MEMORY[0x1E0DB1BD0];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BD0]);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v95, v94);

  +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "nowPlayingConfig");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v97, "shouldSendLiveStreamStartAndEndTimesToAVKit");

  if (v98)
  {
    v99 = *MEMORY[0x1E0DB1AA8];
    objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AA8]);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v100, v99);

    v101 = *MEMORY[0x1E0DB1AA0];
    objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AA0]);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v102, v101);

  }
  v103 = *MEMORY[0x1E0DB1C90];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C90]);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v104, v103);

  v105 = *MEMORY[0x1E0DB1C88];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C88]);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v106, v105);

  v107 = *MEMORY[0x1E0DB1C80];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C80]);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v108, v107);

  v109 = *MEMORY[0x1E0DB1C78];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C78]);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v110, v109);

  objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataIsEligibleForPlayerTabs"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v111, CFSTR("VUIMediaItemMetadataIsEligibleForPlayerTabs"));

  objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataPlayablePassThrough"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v112, CFSTR("VUIMediaItemMetadataPlayablePassThrough"));

  objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataIsKeyPlayAvailable"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v113, CFSTR("VUIMediaItemMetadataIsKeyPlayAvailable"));

  objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataIsEligibleForInfoTab"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v114, CFSTR("VUIMediaItemMetadataIsEligibleForInfoTab"));

  objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataSupportsStartOver"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v115, CFSTR("VUIMediaItemMetadataSupportsStartOver"));

  objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataPreferredAudioLanguageCode"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v116, CFSTR("VUIMediaItemMetadataPreferredAudioLanguageCode"));

  v117 = *MEMORY[0x1E0DB1CD8];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CD8]);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v118, v117);

  v119 = *MEMORY[0x1E0DB1CD0];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CD0]);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v120, v119);

  v121 = *MEMORY[0x1E0DB1CC0];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CC0]);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v122, v121);

  v123 = *MEMORY[0x1E0DB1AF8];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AF8]);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v124, v123);

  objc_msgSend(v5, "mediaItemMetadataForProperty:", v88);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v125, v88);

  v126 = *MEMORY[0x1E0DB1C28];
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C28]);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setMediaItemMetadata:forProperty:", v127, v126);

  objc_msgSend(v128, "setPlaybackContext:", objc_msgSend(v5, "playbackContext"));
}

void __57__VUIMediaInfo__populateMediaItem_withMetadataOverrides___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Overriding key %@ with value %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setMediaItemMetadata:forProperty:", v6, v5);
}

- (id)_hlsURLEnsuringDsidQueryParamIsPresentFromURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
LABEL_15:
    VUIDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "dsid query param is present in HLS URL: %@", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_17;
  }
  objc_msgSend(v3, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("m3u8")) & 1) == 0)
  {

    goto LABEL_15;
  }
  v6 = objc_msgSend(v4, "vui_containsQueryParamWithName:", CFSTR("dsid"));

  if ((v6 & 1) != 0)
    goto LABEL_15;
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v4;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "dsid query param is missing from HLS URL: %@", (uint8_t *)&v17, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ams_activeiTunesAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ams_DSID");
  v10 = objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_17:
    v12 = v4;
    goto LABEL_18;
  }
  -[NSObject stringValue](v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(v4, "vui_URLByAddingQueryParamWithName:value:", CFSTR("dsid"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v12 = v4;
    if (v13)
    {
      v12 = v13;

      VUIDefaultLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        v18 = v12;
        _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "HLS URL after adding dsid param: %@", (uint8_t *)&v17, 0xCu);
      }

    }
  }

LABEL_18:
  return v12;
}

- (id)_playlistForSidebandLibraryAdamIDs:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[VUIMediaInfo _mediaItemForSidebandLibraryAdamID:](self, "_mediaItemForSidebandLibraryAdamID:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB1970]), "initWithMediaItems:index:isCollection:", v5, 0, 0);
  else
    v12 = 0;

  return v12;
}

- (id)_mediaItemForSidebandLibraryAdamID:(id)a3
{
  VUIStoreAuxMediaItem *v3;
  void *v4;
  void *v5;
  VUIStoreAuxMediaItem *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  VUIStoreAuxMediaItem *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (VUIStoreAuxMediaItem *)a3;
  if (-[VUIStoreAuxMediaItem length](v3, "length"))
  {
    +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "existingDownloadForAdamID:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "mediaItem");
      v6 = (VUIStoreAuxMediaItem *)objc_claimAutoreleasedReturnValue();
      VUIDefaultLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v13 = 138412290;
        v14 = v6;
        _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_INFO, "Using existing media item being downloaded: %@", (uint8_t *)&v13, 0xCu);
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[VUIStoreAuxMediaItem resetReportingEventCollection](v6, "resetReportingEventCollection");
    }
    else
    {
      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sidebandMediaLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "videoForAdamID:useMainThreadContext:", v3, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v6 = -[VUIStoreAuxMediaItem initWithVideoManagedObject:isForStartingDownload:]([VUIStoreAuxMediaItem alloc], "initWithVideoManagedObject:isForStartingDownload:", v10, 0);
        VUIDefaultLogObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          LOWORD(v13) = 0;
          _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_INFO, "Creating new media item from database since it is not being downloaded currently", (uint8_t *)&v13, 2u);
        }
      }
      else
      {
        VUIDefaultLogObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v13 = 138412290;
          v14 = v3;
          _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_INFO, "Unable to find video managed object for adam ID %@", (uint8_t *)&v13, 0xCu);
        }
        v6 = 0;
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)imageThemes
{
  return self->_imageThemes;
}

- (BOOL)isGradientDisabled
{
  return self->_gradientDisabled;
}

- (TVPPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
  objc_storeStrong((id *)&self->_playlist, a3);
}

- (BOOL)hasProgress
{
  return self->_hasProgress;
}

- (BOOL)isAudioOnly
{
  return self->_isAudioOnly;
}

- (void)setIsAudioOnly:(BOOL)a3
{
  self->_isAudioOnly = a3;
}

- (BOOL)isAutomaticPlaybackStart
{
  return self->_automaticPlaybackStart;
}

- (void)setAutomaticPlaybackStart:(BOOL)a3
{
  self->_automaticPlaybackStart = a3;
}

- (BOOL)isAutomaticPlaybackStop
{
  return self->_automaticPlaybackStop;
}

- (void)setAutomaticPlaybackStop:(BOOL)a3
{
  self->_automaticPlaybackStop = a3;
}

- (VUIAppContext)appContext
{
  return self->_appContext;
}

- (void)setAppContext:(id)a3
{
  objc_storeStrong((id *)&self->_appContext, a3);
}

- (BOOL)allowsPictureInPicture
{
  return self->_allowsPictureInPicture;
}

- (void)setAllowsPictureInPicture:(BOOL)a3
{
  self->_allowsPictureInPicture = a3;
}

- (BOOL)overridesStartTimeWithResumeTime
{
  return self->_overridesStartTimeWithResumeTime;
}

- (void)setOverridesStartTimeWithResumeTime:(BOOL)a3
{
  self->_overridesStartTimeWithResumeTime = a3;
}

- (VUIMediaInfo)initWithPlaybackContext:(unint64_t)a3 mpMediaItems:(id)a4
{
  id v6;
  VUIMediaInfo *v7;
  VUIMediaInfo *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = -[VUIMediaInfo initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:](self, "initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:", a3, 0, 0, 0);
  v8 = v7;
  if (v7)
  {
    -[VUIMediaInfo _playlistFromMPMediaItems:playbackContext:](v7, "_playlistFromMPMediaItems:playbackContext:", v6, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[VUIMediaInfo setTvpPlaylist:](v8, "setTvpPlaylist:", v9);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaInfo setUserPlaybackInitiationDate:openURLCompletionDate:](v8, "setUserPlaybackInitiationDate:openURLCompletionDate:", v10, 0);

      -[VUIMediaInfo _updatePlaybackStartReason](v8, "_updatePlaybackStartReason");
    }

  }
  return v8;
}

- (id)_playlistFromMPMediaItems:(id)a3 playbackContext:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          -[VUIMediaInfo _storeMediaItemFromMPMediaItem:playbackContext:](self, "_storeMediaItemFromMPMediaItem:playbackContext:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), a4, (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v7, "count"))
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB1970]), "initWithMediaItems:index:isCollection:", v7, 0, 0);
    else
      v14 = 0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_storeMediaItemFromMPMediaItem:(id)a3 playbackContext:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  VUIStoreMediaItem_iOS *v13;
  NSObject *v14;
  __objc2_class *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int64_t v20;
  void *v21;
  uint64_t v22;
  int64_t v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  VUIStoreMediaItem_iOS *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0CC1FA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0CC1FB0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || !objc_msgSend(v7, "longLongValue") || !objc_msgSend(v8, "length"))
  {
    if (objc_msgSend(v6, "vui_isHomeSharingMediaItem"))
      v15 = VUIHomeSharingMediaItem_iOS;
    else
      v15 = VUILibraryMediaItem_iOS;
    v13 = (VUIStoreMediaItem_iOS *)objc_msgSend([v15 alloc], "initWithMPMediaItem:", v6);
    if (!v13)
      goto LABEL_16;
LABEL_15:
    objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0CC1FD8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0CC1DE8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0CC1FE0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "unsignedIntegerValue");

    v20 = -[VUIMediaInfo _videoResolutionFromMPVideoQuality:](self, "_videoResolutionFromMPVideoQuality:", v19);
    objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0CC1DC8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedIntegerValue");

    v23 = -[VUIMediaInfo _videoDynamimcRangeFromMPColorCapability:](self, "_videoDynamimcRangeFromMPColorCapability:", v22);
    objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0CC1DB0]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "unsignedIntegerValue") == 1;

    -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v16, *MEMORY[0x1E0DB1CC8]);
    -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v17, *MEMORY[0x1E0DB1B70]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v26, *MEMORY[0x1E0DB1CF8]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v27, *MEMORY[0x1E0DB1CF0]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v28, *MEMORY[0x1E0DB1B20]);

    goto LABEL_16;
  }
  VUIDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v39) = 0;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Support for in-app downloads is enabled.  Looking for downloading or downloaded content to play", (uint8_t *)&v39, 2u);
  }

  +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "existingDownloadForAdamID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "mediaItem");
    v13 = (VUIStoreMediaItem_iOS *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[VUIStoreMediaItem_iOS resetReportingEventCollection](v13, "resetReportingEventCollection");
    VUIDefaultLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v39 = 138412290;
      v40 = v13;
      _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "Using existing media item being downloaded: %@", (uint8_t *)&v39, 0xCu);
    }
  }
  else
  {
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "sidebandMediaLibrary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "videoForAdamID:useMainThreadContext:", v32, 1);
    v14 = objc_claimAutoreleasedReturnValue();

    if (v14 && -[NSObject downloadState](v14, "downloadState") == 2)
    {
      VUIDefaultLogObject();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v39 = 138412290;
        v40 = (VUIStoreMediaItem_iOS *)v14;
        _os_log_impl(&dword_1D96EE000, v33, OS_LOG_TYPE_DEFAULT, "Item is downloaded.  Using videoManagedObject when creating media item: %@", (uint8_t *)&v39, 0xCu);
      }

      v13 = -[VUIStoreMediaItem_iOS initWithMPMediaItem:videoManagedObject:isForStartingDownload:]([VUIStoreMediaItem_iOS alloc], "initWithMPMediaItem:videoManagedObject:isForStartingDownload:", v6, v14, 0);
    }
    else
    {
      v13 = 0;
    }
  }

  if (!v13)
    v13 = -[VUIStoreMediaItem_iOS initWithMPMediaItem:videoManagedObject:isForStartingDownload:]([VUIStoreMediaItem_iOS alloc], "initWithMPMediaItem:videoManagedObject:isForStartingDownload:", v6, 0, 0);
  -[VUIStoreMediaItem_iOS setIsBingeWatched:](v13, "setIsBingeWatched:", a4 == 6);
  -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](v13, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "iTunesLibraryPlaybackMediaMetricsForAdamID:mediaType:", v7, v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v36, *MEMORY[0x1E0DB1B88]);
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "iTunesVPAF");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v13, "setMediaItemMetadata:forProperty:", v38, *MEMORY[0x1E0DB1CE8]);

  if (v13)
    goto LABEL_15;
LABEL_16:

  return v13;
}

- (int64_t)_videoResolutionFromMPVideoQuality:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 1;
  else
    return qword_1DA1C2460[a3 - 1];
}

- (int64_t)_videoDynamimcRangeFromMPColorCapability:(int64_t)a3
{
  int64_t v3;

  v3 = 1;
  if (a3 == 1)
    v3 = 2;
  if (a3 == 2)
    return 3;
  else
    return v3;
}

- (VUIMediaInfo)initWithPlaybackContext:(unint64_t)a3 vuiMediaItems:(id)a4
{
  id v6;
  VUIMediaInfo *v7;
  VUIMediaInfo *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = -[VUIMediaInfo initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:](self, "initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:", a3, 0, 0, 0);
  v8 = v7;
  if (v7)
  {
    -[VUIMediaInfo _playlistForVUIMediaItems:playbackContext:](v7, "_playlistForVUIMediaItems:playbackContext:", v6, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[VUIMediaInfo setTvpPlaylist:](v8, "setTvpPlaylist:", v9);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaInfo setUserPlaybackInitiationDate:openURLCompletionDate:](v8, "setUserPlaybackInitiationDate:openURLCompletionDate:", v10, 0);

      -[VUIMediaInfo _updatePlaybackStartReason](v8, "_updatePlaybackStartReason");
    }

  }
  return v8;
}

- (id)_playlistForVUIMediaItems:(id)a3 playbackContext:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  VUIMediaInfo *v20;
  void *v21;
  void *v22;
  unint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    v24 = a4;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v13, "mediaPlayerMediaItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[VUIMediaInfo _storeMediaItemFromMPMediaItem:playbackContext:](self, "_storeMediaItemFromMPMediaItem:playbackContext:", v14, a4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v7, "addObject:", v15);
        }
        else
        {
          objc_msgSend(v13, "storeID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v16;
          if (v16 && objc_msgSend(v16, "longLongValue"))
          {
            v17 = v8;
            v18 = v7;
            objc_msgSend(v15, "stringValue");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = self;
            -[VUIMediaInfo _mediaItemForSidebandLibraryAdamID:](self, "_mediaItemForSidebandLibraryAdamID:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
              objc_msgSend(v18, "addObject:", v21);

            v7 = v18;
            v8 = v17;
            a4 = v24;
            self = v20;
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB1970]), "initWithMediaItems:index:isCollection:", v7, 0, 0);
  else
    v22 = 0;

  return v22;
}

- (void)_storeMediaItemFromVideosPlayable:(os_log_t)log andStoreDictionary:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "Unable to create store media item because videos playable's adam ID is nil", v1, 2u);
}

- (void)_populateMediaItem:withMetadataFromVideosPlayable:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_24(&dword_1D96EE000, v0, v1, "Not setting TVPMediaItemMetadataExactEndTime since end date %@ is more than %f seconds before now", v2, v3, v4, v5, v6);
}

- (void)_populateMediaItem:withMetadataFromVideosPlayable:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_24(&dword_1D96EE000, v0, v1, "Not setting TVPMediaItemMetadataExactStartTime since start date %@ is more than %f seconds before now", v2, v3, v4, v5, v6);
}

@end
