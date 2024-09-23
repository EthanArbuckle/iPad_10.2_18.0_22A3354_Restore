@implementation VUIPlaybackReporterVPAF

void __41__VUIPlaybackReporterVPAF_sharedInstance__block_invoke()
{
  VUIPlaybackReporterVPAF *v0;
  void *v1;

  v0 = objc_alloc_init(VUIPlaybackReporterVPAF);
  v1 = (void *)sharedInstance___instance_4;
  sharedInstance___instance_4 = (uint64_t)v0;

}

- (VUIPlaybackReporterVPAF)init
{
  VUIPlaybackReporterVPAF *v2;
  uint64_t v3;
  NSMapTable *pendingPlayerProperties;
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
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)VUIPlaybackReporterVPAF;
  v2 = -[VUIPlaybackReporter init](&v25, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 0, 0);
    pendingPlayerProperties = v2->_pendingPlayerProperties;
    v2->_pendingPlayerProperties = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__playerCurrentMediaItemWillSeek_, *MEMORY[0x1E0DB1F88], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__handleMediaControllerNotification_, CFSTR("VUIBackgroundMediaControllerWillStartPlaybackNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__handleMediaControllerNotification_, CFSTR("VUIBackgroundMediaControllerWillStopPlaybackNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__handleDisplaySizeChange_, CFSTR("VUIBackgroundMediaControllerVideoDisplaySizeDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__handleMediaControllerNotification_, CFSTR("VUIBackgroundMediaControllerForegroundStateDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel__handleBgMCEmbeddedPlayerVCTransferredToFullScreenControllerNotification_, CFSTR("VUIBackgroundMediaControllerEmbeddedPlayerViewControllerTransferredToFullScreenControllerNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel__catchUpToLiveItemWillChange_, CFSTR("VUICatchUpToLiveIndexWillChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel__catchUpToLiveItemDidChange_, CFSTR("VUICatchUpToLiveIndexDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel__catchUpToLiveDidBegin_, CFSTR("VUICatchUpToLiveDidTransitionFromFullscreenNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel__catchUpToLiveDidEnd_, CFSTR("VUICatchUpToLiveDidTransitionToFullscreenNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v2, sel__handleSkipIntro_iOS_, VUIPlaybackManagerWillSkipIntroNotification[0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v2, sel__handlePIPChange_, VUIPlaybackManagerIsPIPingDidChangeNotification[0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v2, sel__handleBackgroundEnterPIPChange_, CFSTR("VUIBackgroundMediaControllerDidEnterPIPNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v2, sel__handleBackgroundExitPIPChange_, CFSTR("VUIBackgroundMediaControllerDidStopPIPNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v2, sel__handleDisplaySizeChange_, VUIPlaybackManagerVideoDisplaySizeDidChange[0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v2, sel__handleIsPlaybackUIBeingShownDidChange_, VUIPlaybackManagerIsPlaybackUIBeingShownDidChange[0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v2, sel__applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v2, sel__applicationWillResignActive_, *MEMORY[0x1E0DC4868], 0);

    VUIVPAFLogObject();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPlaybackReporter setLogObject:](v2, "setLogObject:", v23);

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_18 != -1)
    dispatch_once(&sharedInstance_onceToken_18, &__block_literal_global_86);
  return (id)sharedInstance___instance_4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIPlaybackReporterVPAF;
  -[VUIPlaybackReporter dealloc](&v4, sel_dealloc);
}

- (void)flushUnreportedEvents
{
  -[VUIPlaybackReporterVPAF _flushUnreportedEventsAfterDelay:](self, "_flushUnreportedEventsAfterDelay:", 0.0);
}

- (void)_flushUnreportedEventsAfterDelay:(double)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD aBlock[5];
  _QWORD v12[5];
  VUIScopedBackgroundTask *v13;
  uint8_t buf[4];
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__15;
  v12[4] = __Block_byref_object_dispose__15;
  v13 = -[VUIScopedBackgroundTask initWithIdentifier:expirationHandler:]([VUIScopedBackgroundTask alloc], "initWithIdentifier:expirationHandler:", CFSTR("VUIMetricsBackgroundTaskFlush"), 0);
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__VUIPlaybackReporterVPAF__flushUnreportedEventsAfterDelay___block_invoke;
  aBlock[3] = &unk_1E9F9F5A0;
  aBlock[4] = v12;
  v5 = _Block_copy(aBlock);
  v6 = v5;
  if (a3 == 0.0)
  {
    (*((void (**)(void *))v5 + 2))(v5);
  }
  else
  {
    VUIVPAFLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v15 = a3;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Will flush events after delay of %f", buf, 0xCu);
    }

    v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __60__VUIPlaybackReporterVPAF__flushUnreportedEventsAfterDelay___block_invoke_51;
    v9[3] = &unk_1E9F98E68;
    v10 = v6;
    dispatch_after(v8, MEMORY[0x1E0C80D38], v9);

  }
  _Block_object_dispose(v12, 8);

}

void __60__VUIPlaybackReporterVPAF__flushUnreportedEventsAfterDelay___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  VUIVPAFLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Begin flushing events", buf, 2u);
  }

  +[VUIMetricsJetEngine sharedInstance](VUIMetricsJetEngine, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__VUIPlaybackReporterVPAF__flushUnreportedEventsAfterDelay___block_invoke_50;
  v4[3] = &unk_1E9F9F5A0;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "flushMetricsWithCompletion:", v4);

}

void __60__VUIPlaybackReporterVPAF__flushUnreportedEventsAfterDelay___block_invoke_50(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  VUIVPAFLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Done flushing events", v5, 2u);
  }

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

uint64_t __60__VUIPlaybackReporterVPAF__flushUnreportedEventsAfterDelay___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)enforceSinglePlaybackSession
{
  return 0;
}

- (id)_createSessionForPlayer:(id)a3
{
  id v4;
  NSObject *v5;
  VUIPlaybackReporterVPAFPlaylist *v6;
  void *v7;
  void *v8;
  void *v9;
  VUIPlaybackReporterSession *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[4];
  VUIPlaybackReporterSession *v18;
  uint8_t buf[16];

  v4 = a3;
  VUIVPAFLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Using Jet VPAF tracking", buf, 2u);
  }

  v6 = -[VUIPlaybackReporterVPAFPlaylist initWithPlayer:]([VUIPlaybackReporterVPAFPlaylist alloc], "initWithPlayer:", v4);
  if (v6)
  {
    +[VUIMetricsJetEngine sharedInstance](VUIMetricsJetEngine, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wrappedPipeline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D41858]), "initWithPipeline:playlist:eventData:topic:", v8, v6, 0, CFSTR("xp_amp_tv_vpaf"));
  }
  else
  {
    v9 = 0;
  }
  v10 = -[VUIPlaybackReporterSession initWithPlayer:context:]([VUIPlaybackReporterSession alloc], "initWithPlayer:context:", v4, v9);
  -[VUIPlaybackReporterSession setReportingEnabled:](v10, "setReportingEnabled:", v9 != 0);
  -[NSMapTable objectForKey:](self->_pendingPlayerProperties, "objectForKey:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __51__VUIPlaybackReporterVPAF__createSessionForPlayer___block_invoke;
    v17[3] = &unk_1E9F9F5C8;
    v18 = v10;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v17);
    -[NSMapTable removeObjectForKey:](self->_pendingPlayerProperties, "removeObjectForKey:", v4);

  }
  -[VUIPlaybackReporterSession metadataForKey:](v10, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyForegroundPlayback"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentMediaItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mediaItemMetadataForProperty:", CFSTR("reportVPAFWhenPlayingInBackground"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_msgSend(v12, "BOOLValue") & 1) == 0 && (objc_msgSend(v14, "BOOLValue") & 1) == 0)
    -[VUIPlaybackReporterSession setReportingEnabled:](v10, "setReportingEnabled:", 0);
  if (+[VUIPlaybackUtilities playerIsLive:](VUIPlaybackUtilities, "playerIsLive:", v4))
  {
    -[VUIPlaybackReporterVPAF _createPlaybackDatePollingTimerForLiveStream:](self, "_createPlaybackDatePollingTimerForLiveStream:", v10);
    v15 = MEMORY[0x1E0C9AAB0];
  }
  else
  {
    v15 = MEMORY[0x1E0C9AAA0];
  }
  -[VUIPlaybackReporterSession setMetadata:forKey:](v10, "setMetadata:forKey:", v15, CFSTR("VUIPlaybackReporterSessionMetadataKeyIsPlayerLive"));

  return v10;
}

uint64_t __51__VUIPlaybackReporterVPAF__createSessionForPlayer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMetadata:forKey:", a3, a2);
}

- (void)_reportForSession:(id)a3 state:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  int v29;
  NSObject *v30;
  double v31;
  VUIPlaybackReporterVPAF *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  int v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void **v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  id *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id *v57;
  id v58;
  id *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  char v76;
  NSObject *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  id *v82;
  id v83;
  id *v84;
  void *v85;
  char v86;
  NSObject *v87;
  NSObject *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  int v102;
  id v103;
  int v104;
  id v105;
  void *v106;
  id v107;
  void *v108;
  id v109;
  void *v110;
  VUIPlaybackReporterVPAF *v111;
  void *v112;
  _QWORD v113[2];
  _QWORD v114[2];
  void *v115;
  _QWORD v116[2];
  uint64_t v117;
  uint64_t v118;
  uint8_t buf[4];
  void *v120;
  __int16 v121;
  id v122;
  __int16 v123;
  void *v124;
  __int16 v125;
  void *v126;
  __int16 v127;
  void *v128;
  void *v129;
  const __CFString *v130;
  const __CFString *v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  _QWORD v137[4];

  v137[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[VUIPlaybackReporterVPAF _trackerWithBaseEventDataForSession:](self, "_trackerWithBaseEventDataForSession:", v8);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
  {
    v111 = self;
    v105 = v10;
    v106 = (void *)v11;
    objc_msgSend(v8, "player");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject currentMediaItem](v13, "currentMediaItem");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyIsSeekJumpToLive"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v8, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyIsJumpToLiveAutomatic"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(v8, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyIsCatchUpToLive"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    objc_msgSend(MEMORY[0x1E0DB1958], "playing");
    v18 = (id)objc_claimAutoreleasedReturnValue();

    v107 = v9;
    if (v18 != v9)
    {
      objc_msgSend(v8, "consumeMetadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeySeekInfo"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = v19;
      if (!+[VUIPlaybackUtilities playerIsLive:](VUIPlaybackUtilities, "playerIsLive:", v13))
      {
        objc_msgSend(v8, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyIsPlayerLive"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "BOOLValue");

        if (!v21)
        {
          objc_msgSend(v19, "objectForKey:", *MEMORY[0x1E0DB1F78]);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v34;
          v10 = v105;
          v12 = v106;
          if (v34)
            objc_msgSend(v34, "doubleValue");
          else
            -[NSObject elapsedTime](v13, "elapsedTime");
          v101 = -[VUIPlaybackReporterVPAF _capPlayHeadIfNeeded:forSession:](self, "_capPlayHeadIfNeeded:forSession:", vcvtad_u64_f64(v35 * 1000.0), v8);
          v25 = 0;
LABEL_27:

          objc_msgSend(v8, "consumeStopType");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "consumeStopReason");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = v25;
          if (objc_msgSend(v40, "isEqualToString:", *MEMORY[0x1E0D41810]))
          {
            objc_msgSend(v8, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeySkipIntroInfo"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            if (v41)
            {
              v117 = *MEMORY[0x1E0D41790];
              v118 = *MEMORY[0x1E0D41820];
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              -[VUIPlaybackReporterVPAF _skipIntroActionForSession:consume:](self, "_skipIntroActionForSession:consume:", v8, 0);
              v43 = objc_claimAutoreleasedReturnValue();
              v44 = (void *)v43;
              if (v43)
              {
                v116[0] = v42;
                v116[1] = v43;
                v45 = (void *)MEMORY[0x1E0C99D20];
                v46 = (void **)v116;
                v47 = 2;
              }
              else
              {
                v115 = v42;
                v45 = (void *)MEMORY[0x1E0C99D20];
                v46 = &v115;
                v47 = 1;
              }
              objc_msgSend(v45, "arrayWithObjects:count:", v46, v47);
              v56 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_85;
            }
            if (v104)
            {
              v54 = *MEMORY[0x1E0D41818];
              v113[0] = *MEMORY[0x1E0D41790];
              v113[1] = CFSTR("extraType");
              v114[0] = v54;
              v114[1] = CFSTR("CatchUpToLive");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 2);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v112 = v55;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v112, 1);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = (id *)MEMORY[0x1E0D41840];
              if (!v102)
                v57 = (id *)MEMORY[0x1E0D41848];
              v58 = *v57;

              v39 = v58;
              goto LABEL_85;
            }
LABEL_84:
            v56 = 0;
            goto LABEL_85;
          }
          if (!objc_msgSend(v40, "isEqualToString:", *MEMORY[0x1E0D41828]))
            goto LABEL_84;
          objc_msgSend(MEMORY[0x1E0DB1958], "paused");
          v48 = (id)objc_claimAutoreleasedReturnValue();

          if (v48 == v107)
          {
            v49 = (id)*MEMORY[0x1E0D41800];

            v40 = v49;
          }
          if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DB1E10]))
          {
            v50 = (id)*MEMORY[0x1E0D41840];

            -[NSObject playlist](v13, "playlist");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "nextMediaItem");
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            if (v52)
              v53 = (id *)MEMORY[0x1E0D417F8];
            else
              v53 = (id *)MEMORY[0x1E0D417E0];
            v80 = *v53;

            v56 = 0;
            v39 = v50;
            v40 = v80;
LABEL_85:
            objc_msgSend(v8, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyHaveSentInitialStartEvent"));
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = objc_msgSend(v85, "BOOLValue");

            VUIVPAFLogObject();
            v87 = objc_claimAutoreleasedReturnValue();
            v88 = v87;
            if ((v86 & 1) != 0)
            {
              if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
              {
                -[VUIPlaybackReporterVPAF _playHeadDescriptionForTimeInMS:playbackDate:](v111, "_playHeadDescriptionForTimeInMS:playbackDate:", v101, v110);
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v108, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AB0]);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413314;
                v120 = v89;
                v121 = 2112;
                v122 = v39;
                v123 = 2112;
                v124 = v40;
                v125 = 2112;
                v126 = v90;
                v127 = 2112;
                v128 = v56;
                _os_log_impl(&dword_1D96EE000, v88, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Reporting play event stop: position:%@ type:%@ reason:%@ id:%@ data:%@", buf, 0x34u);

              }
              objc_msgSend(v12, "playStoppedAtOverallPosition:type:reason:eventData:", v101, v39, v40, v56);
            }
            else
            {
              if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
                -[VUIPlaybackReporterVPAF _reportForSession:state:reason:].cold.2(v88, v91, v92, v93, v94, v95, v96, v97);

            }
LABEL_92:

            objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            v99 = objc_msgSend(v98, "applicationState");

            if (v99 == 2)
              -[VUIPlaybackReporterVPAF _flushUnreportedEventsAfterDelay:](v111, "_flushUnreportedEventsAfterDelay:", 1.0);

            v9 = v107;
            goto LABEL_95;
          }
          if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DB1DF0]))
          {
            v59 = (id *)MEMORY[0x1E0D417E8];
          }
          else if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DB1E08]))
          {
            v59 = (id *)MEMORY[0x1E0D417D8];
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("VUIPostPlayReasonAutomaticUpNext")))
          {
            v59 = (id *)MEMORY[0x1E0D417F8];
          }
          else
          {
            if (!objc_msgSend(v10, "isEqualToString:", CFSTR("VUIPostPlayReasonAutomaticPlayOther")))
            {
              if (objc_msgSend(v10, "isEqualToString:", CFSTR("VUIPostPlayReasonManualUpNext")))
              {
                v84 = (id *)MEMORY[0x1E0D417F8];
              }
              else
              {
                if (!objc_msgSend(v10, "isEqualToString:", CFSTR("VUIPostPlayReasonManualPlayOther")))
                  goto LABEL_84;
                v84 = (id *)MEMORY[0x1E0D41808];
              }
              v81 = *v84;

              v82 = (id *)MEMORY[0x1E0D41848];
LABEL_78:
              v83 = *v82;

              v56 = 0;
              v39 = v83;
              v40 = v81;
              goto LABEL_85;
            }
            v59 = (id *)MEMORY[0x1E0D41808];
          }
          v81 = *v59;

          v82 = (id *)MEMORY[0x1E0D41840];
          goto LABEL_78;
        }
      }
      objc_msgSend(v19, "objectForKey:", *MEMORY[0x1E0DB1E30]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v10 = v105;
      v12 = v106;
      if (v22)
      {
        v24 = v22;
      }
      else
      {
        -[NSObject playbackDate](v13, "playbackDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
          goto LABEL_18;
        objc_msgSend(v8, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyPlaybackDateForLiveStream"));
        v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      v25 = v24;
LABEL_18:
      objc_msgSend(v25, "timeIntervalSince1970");
      v101 = vcvtad_u64_f64(v33 * 1000.0);
      goto LABEL_27;
    }
    if (+[VUIPlaybackUtilities playerIsLive:](VUIPlaybackUtilities, "playerIsLive:", v13))
    {
      -[NSObject playbackDate](v13, "playbackDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timeIntervalSince1970");
      v100 = vcvtad_u64_f64(v27 * 1000.0);
      if (v26)
      {
        v110 = v26;
        objc_msgSend(v8, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyWaitingForPlaybackDateToSendStartEvent"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "BOOLValue");

        if (v29)
        {
          objc_msgSend(v8, "setMetadata:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("VUIPlaybackReporterSessionMetadataKeyWaitingForPlaybackDateToSendStartEvent"));
          VUIVPAFLogObject();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D96EE000, v30, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - In _reportForSession, playback has started and playback date has become non-nil while waiting for it.  Will report play start", buf, 2u);
          }

        }
      }
      else
      {
        objc_msgSend(v8, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyTimedOutWaitingForPlaybackDate"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "BOOLValue");

        if (v37)
        {
          VUIVPAFLogObject();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D96EE000, v38, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - In _reportForSession, will report nil playback date since we've timed out waiting for the playback date", buf, 2u);
          }
        }
        else
        {
          objc_msgSend(v8, "setMetadata:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("VUIPlaybackReporterSessionMetadataKeyWaitingForPlaybackDateToSendStartEvent"));
          VUIVPAFLogObject();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            -[VUIPlaybackReporterVPAF _reportForSession:state:reason:].cold.1(v38, v60, v61, v62, v63, v64, v65, v66);
        }

        v110 = 0;
      }
      v32 = v111;
    }
    else
    {
      -[NSObject elapsedTime](v13, "elapsedTime");
      v32 = self;
      v100 = -[VUIPlaybackReporterVPAF _capPlayHeadIfNeeded:forSession:](self, "_capPlayHeadIfNeeded:forSession:", vcvtad_u64_f64(v31 * 1000.0), v8);
      v110 = 0;
    }
    objc_msgSend(v8, "consumeStartType");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "consumeStartReason");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "consumeMetadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyHandlingSeek"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPlaybackReporterVPAF _skipIntroActionForSession:consume:](v32, "_skipIntroActionForSession:consume:", v8, 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v40, "BOOLValue"))
    {
      if (v17)
      {
        v130 = CFSTR("extraType");
        v131 = CFSTR("CatchUpToLive");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = v73;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v129, 1);
        v72 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v72 = 0;
      }
      v103 = v68;
      v109 = v67;
      v12 = v106;
      goto LABEL_66;
    }
    if (v104 ^ 1 | v102)
      v69 = (id *)MEMORY[0x1E0D41840];
    else
      v69 = (id *)MEMORY[0x1E0D41848];
    v109 = *v69;

    v70 = (id)*MEMORY[0x1E0D417B8];
    v103 = v70;
    if (v56)
    {
      v135 = *MEMORY[0x1E0D41788];
      v136 = *MEMORY[0x1E0D417C8];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v137[0] = v71;
      v137[1] = v56;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v137, 2);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v106;
      -[VUIPlaybackReporterVPAF _reportSeekStopAtTimeInMS:playbackDate:session:tracker:player:](v111, "_reportSeekStopAtTimeInMS:playbackDate:session:tracker:player:", v100, v110, v8, v106, v13);
      if (!v104)
        goto LABEL_66;
    }
    else
    {
      v12 = v106;
      if ((v104 & 1) == 0)
      {
        -[VUIPlaybackReporterVPAF _reportSeekStopAtTimeInMS:playbackDate:session:tracker:player:](v111, "_reportSeekStopAtTimeInMS:playbackDate:session:tracker:player:", v100, v110, v8, v106, v13);
        v72 = 0;
        goto LABEL_66;
      }
      v133 = *MEMORY[0x1E0D41788];
      v134 = *MEMORY[0x1E0D417C0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = v74;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v132, 1);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      -[VUIPlaybackReporterVPAF _reportSeekStopAtTimeInMS:playbackDate:session:tracker:player:](v111, "_reportSeekStopAtTimeInMS:playbackDate:session:tracker:player:", v100, v110, v8, v106, v13);
    }
    objc_msgSend(v8, "setMetadata:forKey:", 0, CFSTR("VUIPlaybackReporterSessionMetadataKeyIsSeekJumpToLive"));
    objc_msgSend(v8, "setMetadata:forKey:", 0, CFSTR("VUIPlaybackReporterSessionMetadataKeyIsJumpToLiveAutomatic"));
    objc_msgSend(v8, "setMetadata:forKey:", 0, CFSTR("VUIPlaybackReporterSessionMetadataKeyIsCatchUpToLive"));
LABEL_66:
    objc_msgSend(v8, "setMetadata:forKey:", 0, CFSTR("VUIPlaybackReporterSessionMetadataKeySkipIntroInfo"));
    objc_msgSend(v8, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyWaitingForPlaybackDateToSendStartEvent"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "BOOLValue");

    if ((v76 & 1) == 0)
    {
      objc_msgSend(v8, "setMetadata:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("VUIPlaybackReporterSessionMetadataKeyHaveSentInitialStartEvent"));
      VUIVPAFLogObject();
      v77 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        -[VUIPlaybackReporterVPAF _playHeadDescriptionForTimeInMS:playbackDate:](v111, "_playHeadDescriptionForTimeInMS:playbackDate:", v100, v110);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AB0]);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v120 = v78;
        v121 = 2112;
        v122 = v109;
        v123 = 2112;
        v124 = v103;
        v125 = 2112;
        v126 = v79;
        v127 = 2112;
        v128 = v72;
        _os_log_impl(&dword_1D96EE000, v77, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Reporting play event start: position:%@ type:%@ reason:%@ id:%@ data:%@", buf, 0x34u);

        v12 = v106;
      }

      objc_msgSend(v12, "playStartedAtOverallPosition:type:reason:eventData:", v100, v109, v103, v72);
    }

    v39 = v103;
    goto LABEL_92;
  }
  VUIVPAFLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Unable to report because tracker is nil", buf, 2u);
  }
LABEL_95:

}

- (void)_endSession:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[VUIPlaybackReporterVPAF flushUnreportedEvents](self, "flushUnreportedEvents");
  -[VUIPlaybackReporterVPAF _invalidatePlaybackDatePollingTimerForLiveStream:](self, "_invalidatePlaybackDatePollingTimerForLiveStream:", v4);
  v5.receiver = self;
  v5.super_class = (Class)VUIPlaybackReporterVPAF;
  -[VUIPlaybackReporter _endSession:](&v5, sel__endSession_, v4);

}

- (id)_metricsForSession:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[VUIPlaybackReporterVPAF _videoDisplayInfoForSession:](self, "_videoDisplayInfoForSession:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v7);

  -[VUIPlaybackReporterVPAF _screenInfo](self, "_screenInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v8);

  -[VUIPlaybackReporterVPAF _connectionInfo](self, "_connectionInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v9);

  -[VUIPlaybackReporterVPAF _focusInfoForSession:](self, "_focusInfoForSession:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v10, CFSTR("playbackFocus"));

  objc_msgSend(v5, "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackReporterVPAF _metricsForPlayer:session:](self, "_metricsForPlayer:session:", v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addEntriesFromDictionary:", v12);
  VUIVPAFLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v6;
    _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Session metrics:%@", (uint8_t *)&v15, 0xCu);
  }

  return v6;
}

- (id)_screenInfo
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  v14[0] = CFSTR("screenHeight");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 * v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v14[1] = CFSTR("screenWidth");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4 * v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_connectionInfo
{
  void *v2;
  int v3;
  const __CFString *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNetworkReachable");

  if (v3)
    v4 = CFSTR("false");
  else
    v4 = CFSTR("true");
  v6 = CFSTR("isOffline");
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_videoDisplayInfoForSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  const __CFDictionary *v9;
  void *v10;
  void *v11;
  CGSize v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackReporterVPAF _delegatedInfoForPlayer:](self, "_delegatedInfoForPlayer:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", CFSTR("TVOut")))
    v7 = MGGetBoolAnswer();
  else
    v7 = 0;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("None")) & 1) != 0 || v7)
  {
    objc_msgSend(v4, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyVideoDisplaySize"));
    v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v13 = (CGSize)*MEMORY[0x1E0C9D820];
    if (CGSizeMakeWithDictionaryRepresentation(v9, &v13))
    {
      v14[0] = CFSTR("videoViewportHeight");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", floor(v13.height));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = CFSTR("videoViewportWidth");
      v15[0] = v10;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", floor(v13.width));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_skipIntroActionForSession:(id)a3 consume:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v12;
  _QWORD v13[2];

  v4 = a4;
  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeySkipIntroInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "setMetadata:forKey:", 0, CFSTR("VUIPlaybackReporterSessionMetadataKeySkipIntroInfo"));
  if (v6)
  {
    objc_msgSend(v6, "localizedTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      if (v7)
      {
LABEL_6:
        v12 = CFSTR("actionName");
        v13[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:", CFSTR("SKIP_INTRO"));
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
      if (v10)
        goto LABEL_6;
    }
    v8 = 0;
    goto LABEL_10;
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (id)_focusInfoForSession:(id)a3
{
  __CFString *v4;
  void *v5;
  __CFString *v6;

  v4 = CFSTR("foreground");
  objc_msgSend(a3, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyPIP"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "BOOLValue"))
  {
    v6 = CFSTR("pictureInPicture");

    v4 = v6;
  }

  return v4;
}

- (id)_metricsForPlayer:(id)a3 session:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
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

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v6, "currentMediaItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaItemURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isFileURL") & 1) == 0)
  {
    objc_msgSend(v11, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "vui_setObjectIfNotNil:forKey:", v12, CFSTR("url"));

  }
  -[VUIPlaybackReporterVPAF _colorRangeForPlayer:](self, "_colorRangeForPlayer:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vui_setObjectIfNotNil:forKey:", v13, CFSTR("videoColorRange"));

  -[VUIPlaybackReporterVPAF _audioFormatForPlayer:session:](self, "_audioFormatForPlayer:session:", v6, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "vui_setObjectIfNotNil:forKey:", v14, CFSTR("audioFormat"));
  -[VUIPlaybackReporterVPAF _sensitiveContentInfoForPlayer:](self, "_sensitiveContentInfoForPlayer:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vui_setObjectIfNotNil:forKey:", v15, CFSTR("sensitiveContentType"));

  -[VUIPlaybackReporterVPAF _delegatedInfoForPlayer:](self, "_delegatedInfoForPlayer:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vui_setObjectIfNotNil:forKey:", v16, CFSTR("delegatedPlayback"));

  -[VUIPlaybackReporterVPAF _downloadInfoForPlayer:](self, "_downloadInfoForPlayer:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vui_setObjectIfNotNil:forKey:", v17, CFSTR("downloadState"));

  -[VUIPlaybackReporterVPAF _subtitleInfoForPlayer:](self, "_subtitleInfoForPlayer:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValuesForKeysWithDictionary:", v18);

  -[VUIPlaybackReporterVPAF _audioInfoForPlayer:](self, "_audioInfoForPlayer:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValuesForKeysWithDictionary:", v19);

  return v9;
}

- (id)_subtitleInfoForPlayer:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString **v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "selectedSubtitleOptionWithNoOffOrAutoOption");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "languageCodeBCP47");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "containsOnlyForcedSubtitles") & 1) != 0)
      {
        v8 = VUIPlaybackReporterVPAFKeyForcedSubtitleLocale;
      }
      else if (objc_msgSend(v6, "subtitleType") == 2)
      {
        v8 = VUIPlaybackReporterVPAFKeyClosedCaptionLocale;
      }
      else
      {
        v9 = objc_msgSend(v6, "subtitleType");
        v8 = VUIPlaybackReporterVPAFKeySubtitleLocale;
        if (v9 == 1)
          v8 = VUIPlaybackReporterVPAFKeySDHLocale;
      }
      objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v7, *v8);

    }
  }
  v10 = (void *)objc_msgSend(v4, "copy");

  return v10;
}

- (id)_audioInfoForPlayer:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __CFString **v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "selectedAudioOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "hasAudioDescriptions");
    objc_msgSend(v6, "languageCodeBCP47");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = VUIPlaybackReporterVPAFKeyAudioDescriptionLocale;
    if (!v7)
      v9 = VUIPlaybackReporterVPAFKeyAudioLocale;
    objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v8, *v9);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v6, "mediaCharacteristics", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (+[VUIVideosPlayable isMediaCharacteristicAnAudioVariantID:](VUIVideosPlayable, "isMediaCharacteristicAnAudioVariantID:", v15))
          {
            objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v15, CFSTR("audioVariantId"));
            goto LABEL_14;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_14:

  }
  v16 = (void *)objc_msgSend(v4, "copy");

  return v16;
}

- (id)_colorRangeForPlayer:(id)a3
{
  id v3;
  uint64_t v4;
  __CFString *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v4 = objc_msgSend(v3, "currentMediaItemVideoRange"), (unint64_t)(v4 - 1) <= 3))
  {
    v5 = *off_1E9F9F610[v4 - 1];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_audioFormatForPlayer:(id)a3 session:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  v7 = objc_msgSend(v5, "currentMediaItemAudioFormat");
  if (v7)
  {
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMetadata:forKey:", v9, CFSTR("VUIPlaybackReporterSessionMetadataKeyAudioFormat"));
  }
  else
  {
    objc_msgSend(v6, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyAudioFormat"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;
    v8 = v10 ? objc_msgSend(v10, "integerValue") : 0;
  }

  if ((unint64_t)(v8 - 1) <= 3)
    v11 = *off_1E9F9F630[v8 - 1];
  else
LABEL_9:
    v11 = 0;

  return v11;
}

- (id)_delegatedInfoForPlayer:(id)a3
{
  id v3;
  unint64_t v4;
  __CFString *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v4 = objc_msgSend(v3, "externalPlaybackType"), v4 <= 2))
    v5 = *off_1E9F9F650[v4];
  else
    v5 = 0;

  return v5;
}

- (BOOL)_isDelegatedForPlayer:(id)a3
{
  void *v3;
  char v4;

  -[VUIPlaybackReporterVPAF _delegatedInfoForPlayer:](self, "_delegatedInfoForPlayer:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Airplay")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("TVOut"));

  return v4;
}

- (id)_sensitiveContentInfoForPlayer:(id)a3
{
  void *v3;
  void *v4;
  __CFString *v5;

  objc_msgSend(a3, "currentMediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B48]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "BOOLValue"))
    v5 = CFSTR("adult");
  else
    v5 = 0;

  return v5;
}

- (id)_downloadInfoForPlayer:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  if (+[VUIPlaybackUtilities playerIsLive:](VUIPlaybackUtilities, "playerIsLive:", v3))
  {
    v4 = CFSTR("streaming");
  }
  else
  {
    objc_msgSend(v3, "currentMediaItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B80]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (v7 = objc_msgSend(v6, "integerValue"), (unint64_t)(v7 - 1) <= 2))
      v4 = *off_1E9F9F668[v7 - 1];
    else
      v4 = 0;

  }
  return v4;
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
  else
  {
    -[NSMapTable objectForKey:](self->_pendingPlayerProperties, "objectForKey:", v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v12, "setObject:forKey:", v13, v8);
    -[NSMapTable setObject:forKey:](self->_pendingPlayerProperties, "setObject:forKey:", v12, v9);

  }
}

- (id)_trackerWithBaseEventDataForSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  VUIPlaybackReporterVPAF *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentMediaItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "baseFieldsForVPAF");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v20 = self;
      v11 = objc_msgSend(v10, "vui_BOOLForKey:defaultValue:", CFSTR("sharedActivity"), 0);
      objc_msgSend(v4, "metadataForKey:");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (id)v12;
      if (v11)
      {
        if (!v12)
          v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v13, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("sharedActivity"));
        objc_msgSend(v10, "objectForKey:", CFSTR("sharedActivityDevicesCurrent"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", CFSTR("sharedActivityDevicesMax"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("sharedActivityDevicesCurrent"));
        if (v15)
          objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("sharedActivityDevicesMax"));
        objc_msgSend(v4, "setMetadata:forKey:", v13, CFSTR("VUIPlaybackReporterSessionKeySavedSharePlayBaseFields"));

      }
      objc_msgSend(v8, "addEntriesFromDictionary:", v10);
      if (v13)
        objc_msgSend(v8, "addEntriesFromDictionary:", v13);

      self = v20;
    }
    -[VUIPlaybackReporterVPAF _metricsForSession:](self, "_metricsForSession:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addEntriesFromDictionary:", v16);

    v21[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resetEventData:", v17);

    v18 = v7;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)_reportSeekStopAtTimeInMS:(unint64_t)a3 playbackDate:(id)a4 session:(id)a5 tracker:(id)a6 player:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  int v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v26 = a4;
  v12 = a5;
  v13 = a7;
  v14 = a6;
  objc_msgSend(v13, "currentMediaItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)*MEMORY[0x1E0D41840];
  v16 = (id)*MEMORY[0x1E0D41838];
  -[VUIPlaybackReporterVPAF _skipIntroActionForSession:consume:](self, "_skipIntroActionForSession:consume:", v12, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyIsSeekJumpToLive"));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend((id)v18, "BOOLValue");

  LOBYTE(v18) = +[VUIPlaybackUtilities playerIsLive:](VUIPlaybackUtilities, "playerIsLive:", v13);
  if ((v18 & 1) == 0)
    a3 = -[VUIPlaybackReporterVPAF _capPlayHeadIfNeeded:forSession:](self, "_capPlayHeadIfNeeded:forSession:", a3, v12);
  if (v17)
  {
    v20 = (id)*MEMORY[0x1E0D41820];

    v37[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v16 = v20;
    goto LABEL_8;
  }
  if (v19)
  {
    v20 = (id)*MEMORY[0x1E0D41818];

    v21 = 0;
    goto LABEL_7;
  }
  v21 = 0;
LABEL_8:
  VUIVPAFLogObject();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIPlaybackReporterVPAF _playHeadDescriptionForTimeInMS:playbackDate:](self, "_playHeadDescriptionForTimeInMS:playbackDate:", a3, v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AB0]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v28 = v23;
    v29 = 2112;
    v30 = v15;
    v31 = 2112;
    v32 = v16;
    v33 = 2112;
    v34 = v24;
    v35 = 2112;
    v36 = v21;
    _os_log_impl(&dword_1D96EE000, v22, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Reporting seek event stop: position:%@ type:%@ reason:%@ id:%@ data:%@", buf, 0x34u);

  }
  objc_msgSend(v14, "seekStoppedAtOverallPosition:type:reason:eventData:", a3, v15, v16, v21);

}

- (id)_playHeadDescriptionForTimeInMS:(unint64_t)a3 playbackDate:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu ms (%.3f s) playback date: %@"), a3, (double)a3 / 1000.0, a4);
}

- (void)_playerCurrentMediaItemWillSeek:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  NSObject *v12;
  double v13;
  NSObject *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  unint64_t v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VUIVPAFLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Current media item will seek", buf, 2u);
  }

  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackReporter _sessionForPlayer:](self, "_sessionForPlayer:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[VUIPlaybackReporterVPAF _trackerWithBaseEventDataForSession:](self, "_trackerWithBaseEventDataForSession:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      VUIVPAFLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Unable to report seek because tracker is nil", buf, 2u);
      }
      goto LABEL_28;
    }
    v9 = +[VUIPlaybackUtilities playerIsLive:](VUIPlaybackUtilities, "playerIsLive:", v6);
    objc_msgSend(v4, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0DB1E30]);
      v12 = objc_claimAutoreleasedReturnValue();

      -[NSObject timeIntervalSince1970](v12, "timeIntervalSince1970");
      v36 = vcvtad_u64_f64(v13 * 1000.0);
    }
    else
    {
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0DB1F78]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "doubleValue");
      v36 = -[VUIPlaybackReporterVPAF _capPlayHeadIfNeeded:forSession:](self, "_capPlayHeadIfNeeded:forSession:", vcvtad_u64_f64(v16 * 1000.0), v7);

      v12 = 0;
    }
    objc_msgSend(v7, "consumeMetadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyHandlingSeek"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "BOOLValue"))
      -[VUIPlaybackReporterVPAF _reportSeekStopAtTimeInMS:playbackDate:session:tracker:player:](self, "_reportSeekStopAtTimeInMS:playbackDate:session:tracker:player:", v36, v12, v7, v8, v6);
    objc_msgSend(v6, "state");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DB1958], "playing");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = v12;
    if (v17 == v18)
    {
      objc_msgSend(v7, "setMetadata:forKey:", *MEMORY[0x1E0D41810], CFSTR("VUIPlaybackReporterSessionMetadataKeyStopReason"));
      v19 = (void *)*MEMORY[0x1E0D41848];
      objc_msgSend(v7, "setMetadata:forKey:", *MEMORY[0x1E0D41848], CFSTR("VUIPlaybackReporterSessionMetadataKeyStopType"));
      objc_msgSend(v4, "userInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v4, "userInfo");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setMetadata:forKey:", v21, CFSTR("VUIPlaybackReporterSessionMetadataKeySeekInfo"));

      }
    }
    else
    {
      v19 = (void *)*MEMORY[0x1E0D41848];
    }
    objc_msgSend(v7, "setMetadata:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("VUIPlaybackReporterSessionMetadataKeyHandlingSeek"));
    objc_msgSend(v6, "currentMediaItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeySkipIntroInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyIsSeekJumpToLive"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");

    v25 = v19;
    v26 = (id)*MEMORY[0x1E0D41830];
    if (v22)
    {
      v27 = (id)*MEMORY[0x1E0D417C8];

      -[VUIPlaybackReporterVPAF _skipIntroActionForSession:consume:](self, "_skipIntroActionForSession:consume:", v7, 0);
      v28 = objc_claimAutoreleasedReturnValue();
      v26 = (id)v28;
      if (v28)
      {
        v47[0] = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
        v14 = v35;

        v26 = v27;
LABEL_25:
        VUIVPAFLogObject();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          -[VUIPlaybackReporterVPAF _playHeadDescriptionForTimeInMS:playbackDate:](self, "_playHeadDescriptionForTimeInMS:playbackDate:", v36, v14);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AB0]);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v38 = v31;
          v39 = 2112;
          v40 = v25;
          v41 = 2112;
          v42 = v26;
          v43 = 2112;
          v44 = v32;
          v45 = 2112;
          v46 = v29;
          _os_log_impl(&dword_1D96EE000, v30, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Reporting seek event start: position:%@ type:%@ reason:%@ id:%@ data:%@", buf, 0x34u);

          v14 = v35;
        }

        -[NSObject seekStartedAtOverallPosition:type:reason:eventData:](v8, "seekStartedAtOverallPosition:type:reason:eventData:", v36, v25, v26, v29);
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {
      if (!v24)
      {
        v29 = 0;
        v14 = v35;
        goto LABEL_25;
      }
      v27 = (id)*MEMORY[0x1E0D417C0];
    }
    v29 = 0;
    goto LABEL_24;
  }
  VUIVPAFLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Unable to report seek because session is nil", buf, 2u);
  }
LABEL_29:

}

- (void)_handlePIPChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", VUIPlaybackManagerNotificationKeyPlayer[0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", VUIPlaybackManagerNotificationKeyIsPIPing[0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    VUIVPAFLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Handling player PIP change:%@", (uint8_t *)&v11, 0xCu);
    }

    -[VUIPlaybackReporterVPAF _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", v8, CFSTR("VUIPlaybackReporterSessionMetadataKeyPIP"), v6);
  }

}

- (void)_handleBackgroundEnterPIPChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VUIBackgroundMediaControllerPlayerKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[VUIPlaybackReporterVPAF _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", MEMORY[0x1E0C9AAB0], CFSTR("VUIPlaybackReporterSessionMetadataKeyPIP"), v4);

}

- (void)_handleBackgroundExitPIPChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VUIBackgroundMediaControllerPlayerKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[VUIPlaybackReporterVPAF _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", MEMORY[0x1E0C9AAA0], CFSTR("VUIPlaybackReporterSessionMetadataKeyPIP"), v4);

}

- (void)_handleDisplaySizeChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  NSObject *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", VUIPlaybackManagerNotificationKeyPlayer[0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", VUIPlaybackManagerNotificationKeyDisplaySize[0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("VUIBackgroundMediaControllerVideoDisplaySizeDidChangeNotification"));

  if (v10)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VUIBackgroundMediaControllerPlayerKey"));
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("VUIBackgroundMediaControllerDisplaySizeKey"));
    v13 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v13;
    v6 = (void *)v11;
  }
  if (v8)
    v14 = v6 == 0;
  else
    v14 = 1;
  if (!v14)
  {
    VUIVPAFLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v8;
      _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Handling player display change:%@", (uint8_t *)&v16, 0xCu);
    }

    -[VUIPlaybackReporterVPAF _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", v8, CFSTR("VUIPlaybackReporterSessionMetadataKeyVideoDisplaySize"), v6);
  }

}

- (void)_handleIsPlaybackUIBeingShownDidChange:(id)a3
{
  void *v3;
  int v4;
  id v5;

  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPlaybackUIBeingShown");

  +[VUIMetricsJetEngine sharedInstance](VUIMetricsJetEngine, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMonitorsLifecycleEvents:", v4 ^ 1u);

}

- (void)_applicationWillResignActive:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPlaybackUIBeingShown");

  if (v5)
  {
    VUIVPAFLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = 0x3FC999999999999ALL;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Application will resign active while playback UI is being shown.  Will flush unreported events after %.1f seconds", (uint8_t *)&v7, 0xCu);
    }

    -[VUIPlaybackReporterVPAF _flushUnreportedEventsAfterDelay:](self, "_flushUnreportedEventsAfterDelay:", 0.2);
  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  uint8_t v7[16];

  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPlaybackUIBeingShown");

  if (v5)
  {
    VUIVPAFLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Application did enter background while playback UI is being shown.  Flushing unreported events", v7, 2u);
    }

    -[VUIPlaybackReporterVPAF flushUnreportedEvents](self, "flushUnreportedEvents");
  }
}

- (void)_handleSkipIntro_iOS:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  v4 = a3;
  VUIVPAFLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Handling skip intro", v13, 2u);
  }

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", VUIPlaybackManagerNotificationKeyPlayer[0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", VUIPlaybackManagerSeekReasonKey[0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (!v10 && objc_msgSend(v9, "integerValue") == 1)
  {
    objc_msgSend(v4, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", VUIPlaybackManagerSeekInfoKey);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIPlaybackReporterVPAF _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", v12, CFSTR("VUIPlaybackReporterSessionMetadataKeySkipIntroInfo"), v7);
  }

}

- (void)_handleMediaControllerNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString **v19;
  id v20;

  v4 = a3;
  objc_msgSend(v4, "object");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VUIBackgroundMediaControllerIsForegroundedKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VUIBackgroundMediaControllerPlaybackStartReasonKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VUIBackgroundMediaControllerPlaybackStopReasonKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VUIBackgroundMediaControllerIsAutomaticPlaybackStartKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VUIBackgroundMediaControllerIsAutomaticPlaybackStopKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VUIBackgroundMediaControllerPlaybackStartReasonKey"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_6;
  v13 = (void *)v12;
  if (objc_msgSend(v8, "unsignedLongValue") != 3)
  {
    v14 = objc_msgSend(v8, "unsignedLongValue");

    if (v14 == 9)
      goto LABEL_5;
LABEL_6:
    if (!v7)
      goto LABEL_8;
    goto LABEL_7;
  }

LABEL_5:
  v7 = (void *)MEMORY[0x1E0C9AAB0];
LABEL_7:
  -[VUIPlaybackReporterVPAF _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", v7, CFSTR("VUIPlaybackReporterSessionMetadataKeyForegroundPlayback"), v5);

LABEL_8:
  objc_msgSend(v5, "currentMediaItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataClipId"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "length"))
    -[VUIPlaybackReporterVPAF _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", MEMORY[0x1E0C9AAB0], CFSTR("VUIPlaybackReporterSessionMetadataKeyIsCatchUpToLive"), v5);
  if (v8)
  {
    +[VUIPlaybackReporterSession transitionTypeForMediaControllerAutoTransition:](VUIPlaybackReporterSession, "transitionTypeForMediaControllerAutoTransition:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPlaybackReporterVPAF _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", v17, CFSTR("VUIPlaybackReporterSessionMetadataKeyStartType"), v5);
    +[VUIPlaybackReporterSession transitionReasonForMediaControllerStartReason:autoStart:](VUIPlaybackReporterSession, "transitionReasonForMediaControllerStartReason:autoStart:", v8, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = VUIPlaybackReporterSessionMetadataKeyStartReason;
LABEL_14:
    -[VUIPlaybackReporterVPAF _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", v18, *v19, v5);

    goto LABEL_15;
  }
  if (v9)
  {
    +[VUIPlaybackReporterSession transitionTypeForMediaControllerAutoTransition:](VUIPlaybackReporterSession, "transitionTypeForMediaControllerAutoTransition:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPlaybackReporterVPAF _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", v17, CFSTR("VUIPlaybackReporterSessionMetadataKeyStopType"), v5);
    +[VUIPlaybackReporterSession transitionReasonForMediaControllerStopReason:autoStop:](VUIPlaybackReporterSession, "transitionReasonForMediaControllerStopReason:autoStop:", v9, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = VUIPlaybackReporterSessionMetadataKeyStopReason;
    goto LABEL_14;
  }
LABEL_15:

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
      VUIVPAFLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v7;
        _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Initiating report for player - %@ after being transferred to full screen controller", (uint8_t *)&v12, 0xCu);
      }

      objc_msgSend(v7, "state");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIPlaybackReporterVPAF _reportForSession:state:reason:](self, "_reportForSession:state:reason:", v9, v11, 0);

    }
  }

}

- (void)_catchUpToLiveItemWillChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  _QWORD *v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "vui_BOOLForKey:defaultValue:", CFSTR("VUICatchUpToLiveIsAutomaticKey"), 0);
  if (v5)
  {
    v8 = (_QWORD *)MEMORY[0x1E0D41840];
    if (!v7)
      v8 = (_QWORD *)MEMORY[0x1E0D41848];
    -[VUIPlaybackReporterVPAF _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", *v8, CFSTR("VUIPlaybackReporterSessionMetadataKeyStopType"), v5);
    -[VUIPlaybackReporterVPAF _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", *MEMORY[0x1E0D417F8], CFSTR("VUIPlaybackReporterSessionMetadataKeyStopReason"), v5);
  }
  else
  {
    VUIVPAFLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Not setting catch up to live metadata because player is missing", v10, 2u);
    }

  }
}

- (void)_catchUpToLiveItemDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  _QWORD *v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "vui_BOOLForKey:defaultValue:", CFSTR("VUICatchUpToLiveIsAutomaticKey"), 0);
  if (v5)
  {
    -[VUIPlaybackReporterVPAF _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", MEMORY[0x1E0C9AAB0], CFSTR("VUIPlaybackReporterSessionMetadataKeyIsCatchUpToLive"), v5);
    v8 = (_QWORD *)MEMORY[0x1E0D41840];
    if (!v7)
      v8 = (_QWORD *)MEMORY[0x1E0D41848];
    -[VUIPlaybackReporterVPAF _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", *v8, CFSTR("VUIPlaybackReporterSessionMetadataKeyStartType"), v5);
    -[VUIPlaybackReporterVPAF _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", *MEMORY[0x1E0D417A0], CFSTR("VUIPlaybackReporterSessionMetadataKeyStartReason"), v5);
  }
  else
  {
    VUIVPAFLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Not setting catch up to live metadata because player is missing", v10, 2u);
    }

  }
}

- (void)_catchUpToLiveDidBegin:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackReporter _sessionForPlayer:](self, "_sessionForPlayer:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMetadata:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("VUIPlaybackReporterSessionMetadataKeyIsCatchUpToLive"));

}

- (void)_catchUpToLiveDidEnd:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD block[4];
  id v18;
  id v19;
  id location;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("VUICatchUpToLiveDidJumpToLiveKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("VUICatchUpToLiveIsAutomaticKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIPlaybackReporter _sessionForPlayer:](self, "_sessionForPlayer:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMetadata:forKey:", v12, CFSTR("VUIPlaybackReporterSessionMetadataKeyIsSeekJumpToLive"));

  objc_msgSend(v11, "setMetadata:forKey:", v10, CFSTR("VUIPlaybackReporterSessionMetadataKeyIsJumpToLiveAutomatic"));
  if ((_DWORD)v8)
  {
    +[VUIPlaybackReporterSession transitionTypeForMediaControllerAutoTransition:](VUIPlaybackReporterSession, "transitionTypeForMediaControllerAutoTransition:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPlaybackReporterVPAF _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", v13, CFSTR("VUIPlaybackReporterSessionMetadataKeyStopType"), v5);
    -[VUIPlaybackReporterVPAF _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", *MEMORY[0x1E0D41810], CFSTR("VUIPlaybackReporterSessionMetadataKeyStopReason"), v5);
    objc_msgSend(v11, "setMetadata:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("VUIPlaybackReporterSessionMetadataKeyIsCatchUpToLive"));

  }
  else
  {
    v14 = *MEMORY[0x1E0D41848];
    -[VUIPlaybackReporterVPAF _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", *MEMORY[0x1E0D41848], CFSTR("VUIPlaybackReporterSessionMetadataKeyStopType"), v5);
    v15 = *MEMORY[0x1E0D41808];
    -[VUIPlaybackReporterVPAF _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", *MEMORY[0x1E0D41808], CFSTR("VUIPlaybackReporterSessionMetadataKeyStopReason"), v5);
    objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPlaybackReporterVPAF _reportForSession:state:reason:](self, "_reportForSession:state:reason:", v11, v16, 0);

    -[VUIPlaybackReporterVPAF _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", v14, CFSTR("VUIPlaybackReporterSessionMetadataKeyStartType"), v5);
    -[VUIPlaybackReporterVPAF _setSessionMetadataValue:forKey:player:](self, "_setSessionMetadataValue:forKey:player:", v15, CFSTR("VUIPlaybackReporterSessionMetadataKeyStartReason"), v5);
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__VUIPlaybackReporterVPAF__catchUpToLiveDidEnd___block_invoke;
    block[3] = &unk_1E9F9B6C0;
    v18 = v11;
    objc_copyWeak(&v19, &location);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }

}

void __48__VUIPlaybackReporterVPAF__catchUpToLiveDidEnd___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setMetadata:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("VUIPlaybackReporterSessionMetadataKeyIsCatchUpToLive"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DB1958], "playing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_reportForSession:state:reason:", v2, v3, 0);

}

- (unint64_t)_capPlayHeadIfNeeded:(unint64_t)a3 forSession:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v13;

  v5 = a4;
  objc_msgSend(v5, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyInitialDurationInMillis"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "unsignedLongValue");
  }
  else
  {
    objc_msgSend(v5, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "duration");
    v11 = v10;

    if (v11 == *MEMORY[0x1E0DB1998] || v11 == *MEMORY[0x1E0DB1990])
    {
      v8 = 0;
    }
    else
    {
      v8 = vcvtad_u64_f64(v11 * 1000.0);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMetadata:forKey:", v13, CFSTR("VUIPlaybackReporterSessionMetadataKeyInitialDurationInMillis"));

    }
  }
  if (v8 < a3 && v8 != 0)
    a3 = v8;

  return a3;
}

- (void)_createPlaybackDatePollingTimerForLiveStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(id *);
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id from;
  id location;

  v4 = a3;
  objc_msgSend(v4, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyPlaybackDatePollingTimerForLiveStream"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_initWeak(&location, v4);
    objc_initWeak(&from, self);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99E88];
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __72__VUIPlaybackReporterVPAF__createPlaybackDatePollingTimerForLiveStream___block_invoke;
    v15 = &unk_1E9F9F5F0;
    objc_copyWeak(&v18, &location);
    objc_copyWeak(&v19, &from);
    v8 = v4;
    v16 = v8;
    v9 = v6;
    v17 = v9;
    objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 1, &v12, 5.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "player", v12, v13, v14, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playbackDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setMetadata:forKey:", v11, CFSTR("VUIPlaybackReporterSessionMetadataKeyPlaybackDateForLiveStream"));
    objc_msgSend(v8, "setMetadata:forKey:", v5, CFSTR("VUIPlaybackReporterSessionMetadataKeyPlaybackDatePollingTimerForLiveStream"));

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

}

void __72__VUIPlaybackReporterVPAF__createPlaybackDatePollingTimerForLiveStream___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint8_t v30[16];
  uint8_t buf[16];
  uint8_t v32[16];

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(a1[4], "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(a1[5], "dateByAddingTimeInterval:", 20.0);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "earlierDate:", v11);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14 == v11)
    {
      objc_msgSend(a1[4], "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyWaitingForPlaybackDateToSendStartEvent"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "BOOLValue") & 1) != 0)
      {
        objc_msgSend(a1[4], "metadataForKey:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "BOOLValue");

        if ((v17 & 1) == 0)
        {
          VUIVPAFLogObject();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            __72__VUIPlaybackReporterVPAF__createPlaybackDatePollingTimerForLiveStream___block_invoke_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);

          objc_msgSend(a1[4], "setMetadata:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("VUIPlaybackReporterSessionMetadataKeyWaitingForPlaybackDateToSendStartEvent"));
          objc_msgSend(a1[4], "setMetadata:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("VUIPlaybackReporterSessionMetadataKeyTimedOutWaitingForPlaybackDate"));
          objc_msgSend(v6, "state");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DB1958], "playing");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26 == v27)
          {
            VUIVPAFLogObject();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v30 = 0;
              _os_log_impl(&dword_1D96EE000, v28, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - After playback date timeout, playback state is playing.  Reporting start event even though it will have no playback date", v30, 2u);
            }

            objc_msgSend(MEMORY[0x1E0DB1958], "playing");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "_reportForSession:state:reason:", WeakRetained, v29, 0);

          }
        }
        goto LABEL_21;
      }

    }
    else
    {

    }
LABEL_21:

    goto LABEL_22;
  }
  objc_msgSend(WeakRetained, "setMetadata:forKey:", v4, CFSTR("VUIPlaybackReporterSessionMetadataKeyPlaybackDateForLiveStream"));
  objc_msgSend(a1[4], "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyWaitingForPlaybackDateToSendStartEvent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    objc_msgSend(a1[4], "setMetadata:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("VUIPlaybackReporterSessionMetadataKeyWaitingForPlaybackDateToSendStartEvent"));
    objc_msgSend(v6, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DB1958], "playing");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    VUIVPAFLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9 == v10)
    {
      if (v12)
      {
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - After polling, playback date has become available while waiting for it and playback is playing.  Reporting start event", v32, 2u);
      }

      objc_msgSend(MEMORY[0x1E0DB1958], "playing");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_reportForSession:state:reason:", WeakRetained, v11, 0);
    }
    else if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - After polling, playback date has become available while waiting for it, but playback state is not playing.", buf, 2u);
    }
    goto LABEL_21;
  }
LABEL_22:

}

- (void)_invalidatePlaybackDatePollingTimerForLiveStream:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "metadataForKey:", CFSTR("VUIPlaybackReporterSessionMetadataKeyPlaybackDatePollingTimerForLiveStream"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "invalidate");
    objc_msgSend(v5, "setMetadata:forKey:", 0, CFSTR("VUIPlaybackReporterSessionMetadataKeyPlaybackDatePollingTimerForLiveStream"));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingPlayerProperties, 0);
}

- (void)_reportForSession:(uint64_t)a3 state:(uint64_t)a4 reason:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "VUIPlaybackReporterVPAF - In _reportForSession, not reporting play start since playback date for live stream is nil.  Will send when playback date becomes available", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_14();
}

- (void)_reportForSession:(uint64_t)a3 state:(uint64_t)a4 reason:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "VUIPlaybackReporterVPAF - Not sending play stop since no start has been sent yet", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_14();
}

void __72__VUIPlaybackReporterVPAF__createPlaybackDatePollingTimerForLiveStream___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "VUIPlaybackReporterVPAF - Timed out waiting for playback date to become non-nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_14();
}

@end
