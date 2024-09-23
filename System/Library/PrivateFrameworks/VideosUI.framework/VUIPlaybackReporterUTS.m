@implementation VUIPlaybackReporterUTS

void __40__VUIPlaybackReporterUTS_sharedInstance__block_invoke()
{
  VUIPlaybackReporterUTS *v0;
  void *v1;

  v0 = objc_alloc_init(VUIPlaybackReporterUTS);
  v1 = (void *)sharedInstance___instance_5;
  sharedInstance___instance_5 = (uint64_t)v0;

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_19 != -1)
    dispatch_once(&sharedInstance_onceToken_19, &__block_literal_global_93);
  return (id)sharedInstance___instance_5;
}

- (BOOL)_isTransitionValidForPlayer:(id)a3 fromState:(id)a4 toState:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  id v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (+[VUIPlaybackUtilities playerIsLive:](VUIPlaybackUtilities, "playerIsLive:", v8))
  {
    objc_msgSend(MEMORY[0x1E0DB1958], "playing");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 == v10)
    {
      objc_msgSend(MEMORY[0x1E0DB1958], "paused");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14 != v9)
      {
        v13 = 1;
        goto LABEL_8;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v12 == v10;

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)VUIPlaybackReporterUTS;
    v13 = -[VUIPlaybackReporter _isTransitionValidForPlayer:fromState:toState:](&v16, sel__isTransitionValidForPlayer_fromState_toState_, v8, v9, v10);
  }
LABEL_8:

  return v13;
}

- (VUIPlaybackReporterUTS)init
{
  VUIPlaybackReporterUTS *v2;
  uint64_t v3;
  NSMapTable *pendingPlayerProperties;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUIPlaybackReporterUTS;
  v2 = -[VUIPlaybackReporter init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 0, 0);
    pendingPlayerProperties = v2->_pendingPlayerProperties;
    v2->_pendingPlayerProperties = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__handleBgMCWillStartPlaybackNotification_, CFSTR("VUIBackgroundMediaControllerWillStartPlaybackNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__handleBgMCEmbeddedPlayerVCTransferredToFullScreenControllerNotification_, CFSTR("VUIBackgroundMediaControllerEmbeddedPlayerViewControllerTransferredToFullScreenControllerNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIPlaybackReporterUTS;
  -[VUIPlaybackReporter dealloc](&v4, sel_dealloc);
}

- (void)reportForPlayer:(id)a3 completionState:(unint64_t)a4 completionBlock:(id)a5
{
  -[VUIPlaybackReporterUTS _reportForPlayer:playerState:completionState:completionBlock:](self, "_reportForPlayer:playerState:completionState:completionBlock:", a3, 0, a4, a5);
}

- (BOOL)enforceSinglePlaybackSession
{
  return 0;
}

- (id)_createSessionForPlayer:(id)a3
{
  id v4;
  VUIPlaybackReporterSession *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t);
  void *v23;
  VUIPlaybackReporterSession *v24;

  v4 = a3;
  v5 = -[VUIPlaybackReporterSession initWithPlayer:context:]([VUIPlaybackReporterSession alloc], "initWithPlayer:context:", v4, 0);
  -[NSMapTable objectForKey:](self->_pendingPlayerProperties, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __50__VUIPlaybackReporterUTS__createSessionForPlayer___block_invoke;
    v23 = &unk_1E9F9F5C8;
    v24 = v5;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v20);
    -[NSMapTable removeObjectForKey:](self->_pendingPlayerProperties, "removeObjectForKey:", v4);

  }
  objc_msgSend(v4, "currentMediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B48]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      v12 = "VUIPlaybackReporterUTS - UTS reporting disabled for adult content";
LABEL_10:
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v19, 2u);
    }
  }
  else if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DB1DC8]) & 1) != 0
         || objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DB1DE0]))
  {
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      v12 = "VUIPlaybackReporterUTS - UTS reporting disabled for trailers/previews";
      goto LABEL_10;
    }
  }
  else
  {
    if (!v5)
      goto LABEL_16;
    -[VUIPlaybackReporterSession metadataForKey:](v5, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyForegroundPlayback"));
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15
      || (v16 = (void *)v15,
          -[VUIPlaybackReporterSession metadataForKey:](v5, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyForegroundPlayback")), v17 = (void *)objc_claimAutoreleasedReturnValue(), v18 = objc_msgSend(v17, "BOOLValue"), v17, v16, (v18 & 1) != 0))
    {
LABEL_16:
      v13 = 1;
      goto LABEL_12;
    }
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      v12 = "VUIPlaybackReporterUTS - UTS reporting disabled for background playback";
      goto LABEL_10;
    }
  }

  v13 = 0;
LABEL_12:
  -[VUIPlaybackReporterSession setReportingEnabled:](v5, "setReportingEnabled:", v13, v19, v20, v21, v22, v23);

  return v5;
}

uint64_t __50__VUIPlaybackReporterUTS__createSessionForPlayer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMetadata:forKey:", a3, a2);
}

- (void)_reportForSession:(id)a3 state:(id)a4 reason:(id)a5
{
  id v7;
  id v8;

  v7 = a4;
  objc_msgSend(a3, "player");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackReporterUTS _reportForPlayer:playerState:completionState:completionBlock:](self, "_reportForPlayer:playerState:completionState:completionBlock:", v8, v7, 0, 0);

}

- (void)_endSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUIPlaybackReporterUTS;
  v4 = a3;
  -[VUIPlaybackReporter _endSession:](&v7, sel__endSession_, v4);
  -[VUIPlaybackReporterUTS reporter](self, "reporter", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "endPlaybackSession:", v6);
}

- (WLKPlaybackReporter)reporter
{
  WLKPlaybackReporter *reporter;
  WLKPlaybackReporter *v4;
  WLKPlaybackReporter *v5;

  reporter = self->_reporter;
  if (!reporter)
  {
    v4 = (WLKPlaybackReporter *)objc_alloc_init(MEMORY[0x1E0DC8810]);
    v5 = self->_reporter;
    self->_reporter = v4;

    reporter = self->_reporter;
  }
  return reporter;
}

- (double)_completionFudgeFactor
{
  return 0.0;
}

- (VUIPlaybackUpNextConfig)playbackUpNextConfig
{
  VUIPlaybackUpNextConfig *playbackUpNextConfig;
  void *v4;
  VUIPlaybackUpNextConfig *v5;
  VUIPlaybackUpNextConfig *v6;

  playbackUpNextConfig = self->_playbackUpNextConfig;
  if (!playbackUpNextConfig)
  {
    +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playbackUpNextConfig");
    v5 = (VUIPlaybackUpNextConfig *)objc_claimAutoreleasedReturnValue();

    v6 = self->_playbackUpNextConfig;
    self->_playbackUpNextConfig = v5;

    playbackUpNextConfig = self->_playbackUpNextConfig;
  }
  return playbackUpNextConfig;
}

- (void)_reportForPlayer:(id)a3 playerState:(id)a4 completionState:(unint64_t)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  VUIPlaybackReporterUTS *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  uint8_t v22[16];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "currentMediaItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[VUIPlaybackUtilities playerIsLive:](VUIPlaybackUtilities, "playerIsLive:", v10))
  {
    objc_msgSend(v13, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataPlayableType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntValue");

    if (v15 != 1)
    {
      objc_msgSend(v13, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataPlayableType"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedIntValue");

      if (v17 == 2)
      {
        v18 = self;
        v19 = v10;
        v20 = 0;
LABEL_10:
        -[VUIPlaybackReporterUTS _reportLinearOrEBSForPlayer:isLinear:playerState:completionState:completionBlock:](v18, "_reportLinearOrEBSForPlayer:isLinear:playerState:completionState:completionBlock:", v19, v20, v11, a5, v12);
        goto LABEL_11;
      }
      VUIDefaultLogObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
      }

    }
    v18 = self;
    v19 = v10;
    v20 = 1;
    goto LABEL_10;
  }
  -[VUIPlaybackReporterUTS _reportVODForPlayer:playerState:completionState:completionBlock:](self, "_reportVODForPlayer:playerState:completionState:completionBlock:", v10, v11, a5, v12);
LABEL_11:

}

- (void)_reportVODForPlayer:(id)a3 playerState:(id)a4 completionState:(unint64_t)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  __CFString *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  __CFString *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  const __CFString *v41;
  double v42;
  double v43;
  void *v44;
  uint64_t v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  id v52;
  double v53;
  double v54;
  double v55;
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
  double v73;
  double v74;
  double v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  int64_t v83;
  void *v84;
  VUIPlaybackReporterUTS *v85;
  void (**v86)(id, _QWORD);
  id v87;
  id v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  _QWORD v94[4];
  id v95;
  uint64_t v96;
  uint8_t buf[4];
  uint64_t v98;
  __int16 v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD v102[3];

  v102[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD))a6;
  VUIDefaultLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - VOD report", buf, 2u);
  }

  objc_msgSend(v10, "currentMediaItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A50]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    goto LABEL_7;
  VUIDefaultLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - No DSID specified in mediaItem. Falling back to active account", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ams_activeiTunesAccount");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ams_DSID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
LABEL_7:
    if (!v11)
    {
      objc_msgSend(v10, "state");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v83 = -[VUIPlaybackReporterUTS _wlkPlaybackStateForState:](self, "_wlkPlaybackStateForState:", v11);
    -[VUIPlaybackReporterUTS _wlkPlaybackRateForState:player:](self, "_wlkPlaybackRateForState:player:", v11, v10);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = self;
    v89 = v15;
    if (a5)
    {
      if (a5 == 1)
      {
        VUIDefaultLogObject();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, (os_log_t)v19, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - [CompletionState] State was specified: InProgress", buf, 2u);
        }
        v20 = 1;
      }
      else
      {
        if (a5 != 2)
        {
          v20 = 0;
LABEL_50:
          objc_msgSend(v10, "elapsedTime");
          v43 = v42;
          objc_msgSend(v14, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AD8]);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AD0]);
          v45 = objc_claimAutoreleasedReturnValue();
          v46 = (void *)v45;
          v93 = 0;
          if (v44 && v45)
          {
            objc_msgSend(v44, "doubleValue");
            v48 = v43 - v47;
            if (v48 >= 0.0)
              v49 = v48;
            else
              v49 = 0.0;
            objc_msgSend(v46, "doubleValue");
            if (v49 < v50)
              v50 = v49;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v50);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v91 = v46;
          v82 = v44;
          v86 = v12;
          v87 = v11;
          +[VUIAppReviewManager sharedInstance](VUIAppReviewManager, "sharedInstance");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v94[0] = MEMORY[0x1E0C809B0];
          v94[1] = 3221225472;
          v94[2] = __90__VUIPlaybackReporterUTS__reportVODForPlayer_playerState_completionState_completionBlock___block_invoke;
          v94[3] = &unk_1E9F9FC28;
          v90 = v20;
          v96 = v20;
          v88 = v10;
          v52 = v10;
          v95 = v52;
          objc_msgSend(v51, "isFeatureEnabled:", v94);

          +[VideosUI getPlaybackElapsedTime](_TtC8VideosUI8VideosUI, "getPlaybackElapsedTime");
          v54 = v53;
          objc_msgSend(v52, "elapsedTime");
          if (v54 < v55)
          {
            objc_msgSend(v52, "elapsedTime");
            +[VideosUI markPlaybackElapsedTime:](_TtC8VideosUI8VideosUI, "markPlaybackElapsedTime:");
          }
          v56 = (void *)MEMORY[0x1E0DC8818];
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "bundleIdentifier");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19F0]);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AB0]);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringValue");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AB8]);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v14;
          v63 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v52, "duration");
          objc_msgSend(v63, "numberWithDouble:");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v52, "elapsedTime");
          objc_msgSend(v65, "numberWithDouble:");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "VODSummaryWithBundleID:channelID:contentID:accountID:externalProfileID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:playbackState:playbackRate:completionState:", v80, v57, v58, v59, v60, v61, v64, v66, v91, v93, v83, v92, v90);
          v84 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = v62;
          v67 = v52;

          if (!objc_msgSend((id)objc_opt_class(), "_shouldCacheResumeTimeForMediaType:", v62))
            goto LABEL_69;
          v68 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v52, "elapsedTime");
          objc_msgSend(v68, "numberWithDouble:");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BE8]);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          if (v90)
          {
            if (v90 != 2)
              goto LABEL_66;
          }
          else
          {
            v72 = (void *)MEMORY[0x1E0DC8818];
            objc_msgSend(v67, "duration");
            v74 = v73;
            objc_msgSend(v67, "elapsedTime");
            v76 = objc_msgSend(v72, "completionStateForDuration:elapsedTime:", v74, v75);
            if (v76 != 2)
            {
              if (v76 != 1)
              {
LABEL_68:

LABEL_69:
                -[VUIPlaybackReporter _sessionForPlayer:](v85, "_sessionForPlayer:", v67);
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "UUID");
                v79 = (void *)objc_claimAutoreleasedReturnValue();

                v12 = v86;
                -[VUIPlaybackReporterUTS _reportSummary:sessionID:completion:](v85, "_reportSummary:sessionID:completion:", v84, v79, v86);

                v11 = v87;
                v10 = v88;
                v28 = v89;
                goto LABEL_70;
              }
LABEL_66:
              objc_msgSend((id)objc_opt_class(), "_cachePlaybackResumeTimeForReferenceID:canonicalID:absoluteResumeTime:featureRelativeResumeTime:", v70, v71, v69, v93);
              goto LABEL_68;
            }
          }
          +[VUIStreamingBookmarkCache sharedInstance](VUIStreamingBookmarkCache, "sharedInstance");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "removeBookmarkForReferenceID:", v70);

          goto LABEL_68;
        }
        VUIDefaultLogObject();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v20 = 2;
          _os_log_impl(&dword_1D96EE000, (os_log_t)v19, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - [CompletionState] State was specified: Done", buf, 2u);
        }
        else
        {
          v20 = 2;
        }
      }
    }
    else
    {
      objc_msgSend(v10, "currentMediaItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BC0]);
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "currentMediaItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D00]);
      v23 = objc_claimAutoreleasedReturnValue();

      if (v19 | v23)
      {
        objc_opt_class();
        v24 = 0.0;
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend((id)v19, "isEqualToNumber:", &unk_1EA0B9C28) & 1) == 0)
        {
          objc_msgSend((id)v19, "doubleValue");
          v32 = v31;
          -[VUIPlaybackReporterUTS _completionFudgeFactor](self, "_completionFudgeFactor");
          v24 = v32 - v33;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PostPlay:%.3f]"), v32 - v33);
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v25 = &stru_1E9FF3598;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend((id)v23, "isEqualToNumber:", &unk_1EA0B9C28) & 1) == 0)
        {
          objc_msgSend((id)v23, "doubleValue");
          v35 = v34;
          if (v24 == 0.0 || v34 < v24)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WatchedTime:%.3f]"), *(_QWORD *)&v34);
            v36 = objc_claimAutoreleasedReturnValue();

            v25 = (__CFString *)v36;
            v24 = v35;
          }
        }
        objc_msgSend(v10, "duration");
        v38 = fmin(v37, v24);
        if (v38 == 0.0)
        {
          v30 = v25;
          VUIDefaultLogObject();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v98 = v19;
            v99 = 2112;
            v100 = v23;
            _os_log_impl(&dword_1D96EE000, v29, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - [CompletionState] HLS metadata is invalid. PostPlay:[%@] Watched:[%@]", buf, 0x16u);
          }
          v20 = 0;
        }
        else
        {
          v39 = v37;
          objc_msgSend(v10, "elapsedTime");
          if (v40 >= v38)
            v41 = CFSTR(" [Elapsed:%.3f] [Duration:%.3f] [Done]");
          else
            v41 = CFSTR(" [Elapsed:%.3f] [Duration:%.3f] [InProgress]");
          if (v40 < v38)
            v20 = 1;
          else
            v20 = 2;
          -[__CFString stringByAppendingFormat:](v25, "stringByAppendingFormat:", v41, *(_QWORD *)&v40, *(_QWORD *)&v39);
          v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

          VUIDefaultLogObject();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v98 = (uint64_t)v30;
            _os_log_impl(&dword_1D96EE000, v29, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - [CompletionState] State was derived from HLS metadata: %@", buf, 0xCu);
          }
        }
      }
      else
      {
        VUIDefaultLogObject();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v29, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - [CompletionState] State unknown", buf, 2u);
        }
        v20 = 0;
        v30 = &stru_1E9FF3598;
      }

      v15 = v89;
    }

    goto LABEL_50;
  }
  VUIDefaultLogObject();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v26, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - No DSID found. Will not report", buf, 2u);
  }

  if (v12)
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v101 = *MEMORY[0x1E0CB2D50];
    v102[0] = CFSTR("DSID is missing");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, &v101, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("VUIPlaybackReporterUTS"), 101, v28);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0);
LABEL_70:

  }
}

void __90__VUIPlaybackReporterUTS__reportVODForPlayer_playerState_completionState_completionBlock___block_invoke(uint64_t a1, int a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  if (a2)
  {
    v3 = 1.0;
    if (*(_QWORD *)(a1 + 40) != 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "duration");
      v3 = 0.0;
      if (v4 > 0.0)
      {
        objc_msgSend(*(id *)(a1 + 32), "elapsedTime");
        v6 = v5;
        objc_msgSend(*(id *)(a1 + 32), "duration");
        v3 = v6 / v7;
      }
    }
    +[VUIAppReviewManager sharedInstance](VUIAppReviewManager, "sharedInstance");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMostRecentPlaybackProgressForNonTrailerContent:", v3);

  }
}

- (void)_reportLinearOrEBSForPlayer:(id)a3 isLinear:(BOOL)a4 playerState:(id)a5 completionState:(unint64_t)a6 completionBlock:(id)a7
{
  _BOOL4 v9;
  id v11;
  void (**v12)(id, _QWORD, void *);
  id v13;
  int64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  int64_t v39;
  VUIPlaybackReporterUTS *v40;
  void *v41;
  void (**v42)(id, _QWORD, void *);
  void *v43;
  uint8_t buf[8];
  uint64_t v45;
  _QWORD v46[2];

  v9 = a4;
  v46[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (void (**)(id, _QWORD, void *))a7;
  v13 = a5;
  v14 = -[VUIPlaybackReporterUTS _wlkPlaybackStateForState:](self, "_wlkPlaybackStateForState:", v13);
  -[VUIPlaybackReporterUTS _wlkPlaybackRateForState:player:](self, "_wlkPlaybackRateForState:player:", v13, v11);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "currentMediaItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A50]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    goto LABEL_5;
  VUIDefaultLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - No DSID specified in mediaItem. Falling back to active account", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ams_activeiTunesAccount");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ams_DSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
LABEL_5:
    VUIDefaultLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    v41 = v15;
    v42 = v12;
    v39 = v14;
    v40 = self;
    if (v9)
    {
      if (v21)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - Linear report", buf, 2u);
      }

      v22 = (void *)MEMORY[0x1E0DC8818];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "bundleIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19F0]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AC0]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringValue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AB8]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "playbackDate");
      v29 = v11;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "liveSummaryWithBundleID:channelID:serviceID:accountID:externalProfileID:timestamp:playbackState:playbackRate:currentPlaybackDate:", v23, v24, v25, v26, v27, v28, v39, v43, v30);
      v31 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v21)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - EBS report", buf, 2u);
      }

      v32 = (void *)MEMORY[0x1E0DC8818];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "bundleIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19F0]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AB0]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringValue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AB8]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "playbackDate");
      v29 = v11;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "EBSSummaryWithBundleID:channelID:externalId:accountID:externalProfileID:timestamp:playbackState:playbackRate:currentPlaybackDate:", v23, v24, v25, v26, v27, v28, v39, v43, v30);
      v31 = objc_claimAutoreleasedReturnValue();
    }
    v33 = (void *)v31;

    -[VUIPlaybackReporter _sessionForPlayer:](v40, "_sessionForPlayer:", v29);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "UUID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v42;
    -[VUIPlaybackReporterUTS _reportSummary:sessionID:completion:](v40, "_reportSummary:sessionID:completion:", v33, v35, v42);

    v11 = v29;
    v15 = v41;
    goto LABEL_13;
  }
  VUIDefaultLogObject();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v36, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - No DSID found. Will not report", buf, 2u);
  }

  if (v12)
  {
    v37 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0CB2D50];
    v46[0] = CFSTR("DSID is missing");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("VUIPlaybackReporterUTS"), 101, v16);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v33);
LABEL_13:

  }
}

- (void)_reportSummary:(id)a3 sessionID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    objc_msgSend(v8, "contentID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v8, "contentID");
    else
      objc_msgSend(v8, "serviceID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIPlaybackReporterUTS reporter](self, "reporter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __62__VUIPlaybackReporterUTS__reportSummary_sessionID_completion___block_invoke;
    v18[3] = &unk_1E9F99C68;
    v19 = v10;
    objc_msgSend(v16, "reportPlayback:sessionID:completion:", v8, v9, v18);

    VUIDefaultLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v21 = v14;
      v22 = 2112;
      v23 = v9;
      v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - Report sent for [%@] [%@] %@", buf, 0x20u);
    }

    v15 = v19;
    goto LABEL_12;
  }
  VUIDefaultLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - Playback summary is nil", buf, 2u);
  }

  if (v10)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    v27[0] = CFSTR("Playback summary is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("VUIPlaybackReporterUTS"), 100, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v15);
LABEL_12:

  }
}

void __62__VUIPlaybackReporterUTS__reportSummary_sessionID_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  dispatch_time_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  char v15;

  v5 = a3;
  +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playbackUpNextConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentUpdateOffsetInterval");
  v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__VUIPlaybackReporterUTS__reportSummary_sessionID_completion___block_invoke_2;
  block[3] = &unk_1E9F9DB98;
  v10 = *(id *)(a1 + 32);
  v15 = a2;
  v13 = v5;
  v14 = v10;
  v11 = v5;
  dispatch_after(v9, MEMORY[0x1E0C80D38], block);

}

uint64_t __62__VUIPlaybackReporterUTS__reportSummary_sessionID_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    VUIDefaultLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - Calling _reportSummary completion", v3, 2u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

- (int64_t)_wlkPlaybackStateForState:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  int64_t v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DB1958], "playing");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v3)
  {
    v11 = 1;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0DB1958], "paused");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if ((id)v5 == v3)
    goto LABEL_8;
  v7 = (void *)v5;
  objc_msgSend(MEMORY[0x1E0DB1958], "loading");
  v8 = objc_claimAutoreleasedReturnValue();
  if ((id)v8 == v3)
  {

    v6 = v7;
LABEL_8:

    goto LABEL_9;
  }
  v9 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0DB1958], "scanning");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v3)
  {
LABEL_9:
    v11 = 2;
    goto LABEL_10;
  }
  v11 = 0;
LABEL_10:

  return v11;
}

- (id)_wlkPlaybackRateForState:(id)a3 player:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0DB1958];
  v7 = a3;
  objc_msgSend(v6, "playing");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "rateUsedForPlayback");
    objc_msgSend(v10, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &unk_1EA0B9C28;
  }

  return v9;
}

- (void)_handleBgMCWillStartPlaybackNotification:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v6 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v11, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("VUIBackgroundMediaControllerIsForegroundedKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      -[VUIPlaybackReporterUTS _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", v10, CFSTR("VUIPlaybackReporterSessionMetadataKeyForegroundPlayback"), v8);

    v6 = v11;
  }

}

- (void)_handleBgMCEmbeddedPlayerVCTransferredToFullScreenControllerNotification:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPlaybackReporter _sessionForPlayer:](self, "_sessionForPlayer:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "setMetadata:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("VUIPlaybackReporterSessionMetadataKeyForegroundPlayback"));
      objc_msgSend(v9, "setReportingEnabled:", 1);
      VUIDefaultLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v7;
        _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - Initiating report for player - %@ after being transferred to full screen controller", (uint8_t *)&v12, 0xCu);
      }

      objc_msgSend(v7, "state");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIPlaybackReporterUTS _reportForPlayer:playerState:completionState:completionBlock:](self, "_reportForPlayer:playerState:completionState:completionBlock:", v7, v11, 0, 0);

    }
  }

}

- (void)_setSessionMetadataValue:(id)a3 forKey:(id)a4 player:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[VUIPlaybackReporter _sessionForPlayer:](self, "_sessionForPlayer:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setMetadata:forKey:", v13, v8);
  }
  else if (v8)
  {
    -[NSMapTable objectForKey:](self->_pendingPlayerProperties, "objectForKey:", v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v13)
      objc_msgSend(v12, "setObject:forKey:", v13, v8);
    else
      objc_msgSend(v12, "removeObjectForKey:", v8);
    -[NSMapTable setObject:forKey:](self->_pendingPlayerProperties, "setObject:forKey:", v12, v9);

  }
}

+ (BOOL)_shouldCacheResumeTimeForMediaType:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DB1DD8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DB1DC0]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DB1DD0]);
  }

  return v4;
}

+ (void)_cachePlaybackResumeTimeForReferenceID:(id)a3 canonicalID:(id)a4 absoluteResumeTime:(id)a5 featureRelativeResumeTime:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  if (a3 && a4)
  {
    if (a5)
    {
      v9 = (void *)MEMORY[0x1E0C99D68];
      v10 = a6;
      v11 = a5;
      v12 = a4;
      v13 = a3;
      objc_msgSend(v9, "date");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      +[VUIStreamingBookmarkCache sharedInstance](VUIStreamingBookmarkCache, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addBookmarkForReferenceID:canonicalID:absoluteResumeTime:absoluteBookmarkTimestamp:relativeResumeTime:relativeBookmarkTimestamp:", v13, v12, v11, v15, v10, v15);

    }
  }
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_reporter, a3);
}

- (void)setPlaybackUpNextConfig:(id)a3
{
  objc_storeStrong((id *)&self->_playbackUpNextConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackUpNextConfig, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_pendingPlayerProperties, 0);
}

@end
